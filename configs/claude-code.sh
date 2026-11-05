#!/bin/sh
# OAuth (recommended): add the server, then run /mcp in Claude Code to sign in.
claude mcp add --transport http ava-advisor https://mcp.ava.fund/mcp

# API key alternative: export AVA_ADVISOR_API_KEY first (never paste the key into a committed file).
# claude mcp add --transport http ava-advisor https://mcp.ava.fund/mcp \
#   --header "Authorization: Bearer $AVA_ADVISOR_API_KEY"
