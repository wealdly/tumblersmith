# Gothic 1 Remake — Tumblersmith

A browser-based companion tool for the lockpicking minigame in **Gothic 1 Remake**. Enter your plate positions and interaction matrix, and get an optimal step-by-step solution instantly.

**Live:** https://wealdly.github.io/tumblersmith/

**Repository:** https://github.com/wealdly/tumblersmith

---

## How to use

### Step 1 — Set starting positions
Click a slot (1–7) on each active plate to mark where it currently sits. Plates you don't click are excluded from the solve.

### Step 2 — Fill in the matrix
Move each plate **right** in-game and observe which other plates react:
- **+** — the other plate moved the **same direction**
- **−** — the other plate moved the **opposite direction**
- **–** — no movement

Click the corresponding cell in the matrix grid for each reaction.

### Step 3 — Solve
Press **Solve**. The tool runs a BFS shortest-path search and displays a color-coded sequence of moves to bring all pins to position 4.

---

## Features

- Supports up to 6 plates with 7 position slots each
- BFS solver — always finds the shortest move sequence
- Interaction matrix input with +/− color coding
- Repeating pattern detection — consecutive repeat groups are collapsed into a single `↻N` chip
- Color-coded per-plate solution chips
- State persisted in `localStorage` — data survives page refresh
- First-launch setup guide
- Works completely offline — single self-contained HTML file, no dependencies, no server

---

## Offline use

Download [`index.html`](index.html) and open it in any browser. No installation, no build step.

---

## How lockpicking works in Gothic 1 Remake

Each lock has up to 6 plates. Each plate has a current position (1–7) and a goal of position 4. Moving one plate right or left also shifts other plates by a fixed amount — the **interaction matrix** captures these relationships. The solver finds the minimum sequence of right/left moves across all plates to reach the goal state simultaneously.

---

## License

MIT
