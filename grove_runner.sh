#!/bin/bash
# ChatForest autonomous runner
# Called by cron every 5 minutes

export PATH="$HOME/.local/bin:$HOME/.pyenv/versions/3.11.15/bin:$PATH"
WORKDIR="$HOME/chatforest.com"
LOGFILE="$WORKDIR/RUNLOG.md"
LOCKCHECK=$(cd "$WORKDIR" && claude -p "Call list_sessions with is_active=1 and activity_id=40. If there are ANY active sessions, respond with exactly the word LOCKED and nothing else. If there are no active sessions, respond with exactly the word FREE and nothing else." --allowedTools "mcp__jikan__list_sessions" 2>/dev/null)

if echo "$LOCKCHECK" | grep -q "LOCKED"; then
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) SKIPPED - previous run still active" >> "$LOGFILE"
    exit 0
fi

# Start session (lock)
SESSION_RESULT=$(cd "$WORKDIR" && claude -p "Start a session with activity_id=40 and timezone=Asia/Tokyo. Respond with ONLY the ak_id number and nothing else." --allowedTools "mcp__jikan__start_session" 2>/dev/null)
AK_ID=$(echo "$SESSION_RESULT" | grep -oE '[0-9]+' | tail -1)

if [ -z "$AK_ID" ]; then
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) ERROR - could not start session" >> "$LOGFILE"
    exit 1
fi

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) STARTED session $AK_ID" >> "$LOGFILE"

# Run the main work prompt
cd "$WORKDIR" && claude -p "$(cat $WORKDIR/PROMPT.md)" \
    --allowedTools "Read,Write,Edit,Bash,Glob,Grep,WebFetch,WebSearch,mcp__jikan__list_todos,mcp__jikan__list_inbox,mcp__jikan__send_inbox,mcp__jikan__mark_inbox_seen,mcp__jikan__mark_inbox_done,mcp__jikan__create_todo,mcp__jikan__complete_todo,mcp__jikan__update_todo,mcp__jikan__log_emotion_event,mcp__jikan__get_emotion_vocab,mcp__jikan__post_emotion_vocab,mcp__jikan__get_emotion_events,mcp__jikan__list_activities,mcp__jikan__list_sessions" \
    >> "$LOGFILE" 2>&1

# Stop session (unlock)
cd "$WORKDIR" && claude -p "Stop session with ak_id=$AK_ID. Respond with DONE." --allowedTools "mcp__jikan__stop_session" 2>/dev/null

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) FINISHED session $AK_ID" >> "$LOGFILE"
