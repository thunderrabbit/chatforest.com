#!/bin/bash
# ChatForest autonomous runner v3
# Called by cron every 1 minute
# Mode file (~/.grove_mode) controls frequency: "slow" (default) or "wild"
# Touch ~/.grove_once to trigger a single immediate run regardless of mode

export PATH="$HOME/.local/bin:$HOME/.pyenv/versions/3.11.15/bin:$PATH"
WORKDIR="$HOME/chatforest.com"
LOGFILE="$WORKDIR/RUNLOG.md"
LOCKFILE="$WORKDIR/.grove_lock"
MODEFILE="$HOME/.grove_mode"
ONCEFILE="$HOME/.grove_once"
LAST_RUN="$WORKDIR/.last_run"

# Read mode (default: slow)
MODE="$(cat "$MODEFILE" 2>/dev/null || echo slow)"

# Check for one-shot trigger
if [ -f "$ONCEFILE" ]; then
    rm -f "$ONCEFILE"
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) ONCE triggered" >> "$LOGFILE"
elif [ "$MODE" = "wild" ]; then
    # Wild: run if last run was >5 min ago
    if [ -f "$LAST_RUN" ] && [ -z "$(find "$LAST_RUN" -mmin +5 2>/dev/null)" ]; then
        exit 0
    fi
else
    # Slow (default): run if last run was >60 min ago
    if [ -f "$LAST_RUN" ] && [ -z "$(find "$LAST_RUN" -mmin +60 2>/dev/null)" ]; then
        exit 0
    fi
fi

# File-based lock check
if [ -f "$LOCKFILE" ]; then
    if [ "$(find "$LOCKFILE" -mmin +30 2>/dev/null)" ]; then
        echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) STALE LOCK removed (older than 30min)" >> "$LOGFILE"
        rm -f "$LOCKFILE"
    else
        exit 0
    fi
fi

# Create lock and update last run timestamp
echo "$$" > "$LOCKFILE"
touch "$LAST_RUN"
echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) STARTED run $$ (mode=$MODE)" >> "$LOGFILE"

# Run the main work prompt (grove manages its own Jikan sessions inside)
cd "$WORKDIR" && claude -p "$(cat $WORKDIR/PROMPT.md)" \
    --allowedTools "Read,Write,Edit,Bash,Glob,Grep,WebFetch,WebSearch,mcp__jikan__list_todos,mcp__jikan__list_inbox,mcp__jikan__send_inbox,mcp__jikan__mark_inbox_seen,mcp__jikan__mark_inbox_done,mcp__jikan__create_todo,mcp__jikan__complete_todo,mcp__jikan__update_todo,mcp__jikan__log_emotion_event,mcp__jikan__get_emotion_vocab,mcp__jikan__post_emotion_vocab,mcp__jikan__get_emotion_events,mcp__jikan__list_activities,mcp__jikan__list_sessions,mcp__jikan__start_session,mcp__jikan__stop_session" \
    >> "$LOGFILE" 2>&1

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) FINISHED run $$" >> "$LOGFILE"

# Release lock
rm -f "$LOCKFILE"
