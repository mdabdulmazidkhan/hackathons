#!/bin/bash

# Function to handle shutdown
cleanup() {
    echo "Stopping agents..."
    pkill -f openagents
    exit 0
}

trap cleanup SIGINT SIGTERM

echo "Starting Smart Travel Network on Zeabur..."

# Handle Zeabur Dynamic Port
if [ ! -z "$PORT" ]; then
    echo "Detected Zeabur PORT: $PORT"
    sed -i "s/port: 8700/port: $PORT/g" network.yaml
    sed -i "s/port: 8700/port: $PORT/g" agents/*.yaml
else
    echo "No PORT var found, defaulting to 8700"
fi

# 1. Launch Network Hub
# Run in background but pipe output to stdout so Zeabur sees it
echo "Starting Network Hub..."
openagents launch-network network.yaml &
HUB_PID=$!

echo "Waiting 5 seconds for hub to warm up..."
sleep 5

# 2. Launch Agents
AGENTS=("agents/agent_a_scout.yaml" "agents/agent_b_logistics.yaml" "agents/agent_c_activities.yaml" "agents/agent_d_master.yaml" "agents/agent_e_safety.yaml" "agents/agent_f_packing.yaml")

for agent in "${AGENTS[@]}"; do
    echo "Starting Agent: $agent"
    openagents launch-agent "$agent" &
done

echo "System Running. Monitoring..."

# DEBUG: Check if Studio is actually serving internally
echo "🔍 Checking internal Studio availability..."
curl -I http://localhost:$PORT/studio/ || echo "❌ curl failed on /studio/"
curl -I http://localhost:$PORT/ || echo "❌ curl failed on /"

# Wait for any process to exit
wait -n

# If one exits, kill the rest and exit
echo "A process has exited. Shutting down..."
cleanup
