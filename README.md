# Image-Processing-Through-Vedic-Multiplier-Based-Convolution-for-Faster-Computation
This project accelerates image processing by performing convolution using an optimized Vedic multiplier. Unlike existing signed-unsigned Vedic multipliers which are slower, the proposed design enhances speed and reduces hardware usage, making it suitable for real-time applications.
# 📌 Overview
-This project implements a high-speed, hardware-efficient convolution engine for image processing using a Vedic multiplier based on the Urdhva Tiryagbhyam sutra. Unlike traditional or existing signed/unsigned Vedic multiplier designs—which suffer from speed limitations—this optimized architecture significantly improves performance and logic utilization, making it suitable for real-time embedded image processing applications.

# 🧠 Motivation
Convolution operations are computationally intensive and demand efficient hardware implementation, especially in edge detection, blurring, and image enhancement tasks. While Vedic multipliers have been explored for their simplicity and parallelism, existing signed-unsigned implementations tend to be slower due to added complexity.

# 🔍 Goal:            
Enhance convolution speed and efficiency by designing a lightweight, fast, and LUT-optimized Vedic multiplier core.

# 🔧 Features -
✅ Optimized Vedic multiplier using Urdhva Tiryagbhyam

✅ Signed and unsigned multiplication support

✅ 2D convolution for grayscale image filtering

✅ Verilog HDL implementation

✅ Synthesizable on FPGA (tested on Spartan-6 / Artix-7)

🖥️ Tools & Technologies
- Verilog HDL
- Xilinx ISE 
- Python (for image-to-hex conversion)
