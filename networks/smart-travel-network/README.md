# Smart Travel Network 🌍✈️

**A Multi-Agent System for Intelligent Travel Planning**

> Submitted for the OpenAgents PR Hackathon

## Overview
The **Smart Travel Network** is a centralized agent network designed to take a vague travel "vibe" or theme from a user and turn it into a concrete, actionable itinerary. It demonstrates the power of specialized agents collaborating in a pipeline.

## Unique Value
Most travel bots just ask "Where do you want to go?". We ask **"How do you want to feel?"**.
*   **Input**: "I want a cyberpunk aesthetics trip with great street food."
*   **Output**: A complete breakdown of Tokyo/Seoul with specific neon-lit spots, food stalls, flights, and a daily schedule.

## Agent Architecture
1.  **🕵️ Destination Scout (`agent_a_scout`)**:
    *   Listens to specific user themes.
    *   Uses extensive knowledge to match "vibes" to real-world cities.
2.  **✈️ Logistics Planner (`agent_b_logistics`)**:
    *   Receives the target city.
    *   Simulates searching for optimal flights and accommodation.
3.  **🎡 Activities Coordinator (`agent_c_activities`)**:
    *   Finds unique, theme-aligned experiences (not just tourist traps).
4.  **📅 Itinerary Master (`agent_d_master`)**:
    *   Synthesizes all data into a beautiful Markdown-formatted daily plan.

## Setup & Run

### Prerequisites
*   OpenAgents v0.8.3+
*   A DeepSeek API Key (or compatible LLM key)

### Installation
1.  Clone this repository.
2.  Navigate to `smart-travel-network`.
3.  **IMPORTANT**: Open `agents/*.yaml` and paste your API key in the `api_key` field.

### Running
Windows (PowerShell):
```powershell
./start_network.ps1
```

### Usage
1.  Connect to the network dashboard (default: `http://localhost:8700`).
2.  Go to the **#user-input** channel.
3.  Type a message like: `Theme: A quiet mountain retreat for reading and coffee.`
4.  Watch the agents spring into action in the other channels!

## License
MIT
