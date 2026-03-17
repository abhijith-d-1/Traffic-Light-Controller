# Traffic-Light-Controller
A Verilog-based Traffic Light Controller using a Moore Finite State Machine. This design features an integrated countdown timer to manage transitions between Red (25s), Green (30s), and Yellow (6s) states. A clean example of synchronous sequential logic and parameterized RTL design for hardware synthesis.

<div align="center">
  <img src="https://github.com/abhijith-d-1/Traffic-Light-Controller/blob/514b2d26765d1c068c6bbea72b8dbc7804be77b3/State_diagram.jpg?raw=true" width="500">
</div>

## Technical Specifications

* **FSM Type:** Moore (Output depends solely on the current state)
* **States:** 3 (Red, Green, Yellow)
* **Timer Logic:** 6-bit internal counter for cycle management
* **Reset:** Synchronous reset to initial RED state

## State Definitions & Timing

| State | Encoding | Duration | Description |
| :--- | :---: | :---: | :--- |
| **RED** | `2'b00` | 25 Cycles | Stops traffic. Transitions to Green when timer hits 0. |
| **GREEN** | `2'b01` | 30 Cycles | Allows traffic. Transitions to Yellow when timer hits 0. |
| **YELLOW** | `2'b10` | 6 Cycles | Caution phase. Transitions to Red when timer hits 0. |

## Implementation Details

The design follows a **Three-Always-Block** RTL structure for maximum clarity and synthesis reliability:
1. **State Transition:** Sequential block updating the current state on the `posedge clk`.
2. **Next State Logic:** Combinational block determining the next phase based on the `Timer` value.
3. **Output & Timer Logic:** Sequential block managing the light outputs (`red`, `yellow`, `green`) and the countdown/reload values.

## How to Run
1. Clone the repository.
2. Load `Traffic_light_controller.v` into your preferred HDL simulator (Vivado, ModelSim, or Icarus Verilog).
3. Run the provided testbench to observe the timing waveforms.
