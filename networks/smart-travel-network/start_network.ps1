# Start the Smart Travel Network
# Launches the Network Hub and 4 Agents in separate windows.

Write-Host "Starting Smart Travel Network..." -ForegroundColor Cyan

# 1. Start the Network Hub
Write-Host "Starting Network Hub..."
Start-Process -FilePath "openagents" -ArgumentList "launch-network ." -NoNewWindow:$false
# Give it a moment to bind to port 8700
Start-Sleep -Seconds 5

# 2. Start Agents
$agents = @(
    "agents/agent_a_scout.yaml",
    "agents/agent_b_logistics.yaml",
    "agents/agent_c_activities.yaml",
    "agents/agent_d_master.yaml",
    "agents/agent_e_safety.yaml",
    "agents/agent_f_packing.yaml"
)

foreach ($agent in $agents) {
    Write-Host "Starting Agent: $agent"
    Start-Process -FilePath "openagents" -ArgumentList "launch-agent $agent" -NoNewWindow:$false
    Start-Sleep -Seconds 2
}

Write-Host "All components launched!" -ForegroundColor Green
Write-Host "---------------------------------------------------"
Write-Host "Dashboard: http://localhost:8700"
Write-Host "Action: Go to #user-input and type your travel theme!"
Write-Host "---------------------------------------------------"
Read-Host "Press Enter to exit this launcher (Agents will keep running)..."
