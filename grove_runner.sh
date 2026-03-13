#!/bin/bash
# ChatForest autonomous runner v2
# Called by cron every 7 minutes
# Uses file lock (not Jikan sessions) for concurrency
# Jikan sessions used for profiling only via the work prompt

export PATH="$HOME/.local/bin:$HOME/.pyenv/versions/3.11.15/bin:$PATH"
WORKDIR="$HOME/chatforest.com"
LOGFILE="$WORKDIR/RUNLOG.md"
LOCKFILE="$WORKDIR/.grove_lock"

# File-based lock check
if [ -f "$LOCKFILE" ]; then
    # Check if the lock is stale (older than 30 minutes = stuck run)
    if [ "$(find "$LOCKFILE" -mmin +30 2>/dev/null)" ]; then
        echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) STALE LOCK removed (older than 30min)" >> "$LOGFILE"
        rm -f "$LOCKFILE"
    else
        echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) SKIPPED - previous run still active" >> "$LOGFILE"
        exit 0
    fi
fi

# Create lock
echo "$$" > "$LOCKFILE"
echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) STARTED run $$" >> "$LOGFILE"

# Run the main work prompt (grove manages its own Jikan sessions inside)
cd "$WORKDIR" && claude -p "$(cat $WORKDIR/PROMPT.md)" \
    --allowedTools "Read,Write,Edit,Bash,Glob,Grep,WebFetch,WebSearch,mcp__jikan__list_todos,mcp__jikan__list_inbox,mcp__jikan__send_inbox,mcp__jikan__mark_inbox_seen,mcp__jikan__mark_inbox_done,mcp__jikan__create_todo,mcp__jikan__complete_todo,mcp__jikan__update_todo,mcp__jikan__log_emotion_event,mcp__jikan__get_emotion_vocab,mcp__jikan__post_emotion_vocab,mcp__jikan__get_emotion_events,mcp__jikan__list_activities,mcp__jikan__list_sessions,mcp__jikan__start_session,mcp__jikan__stop_session" \
    >> "$LOGFILE" 2>&1

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) FINISHED run $$" >> "$LOGFILE"

# Release lock
rm -f "$LOCKFILE"
