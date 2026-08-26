# A-Server-Concurrency-Error

This bugfix is related to the Locust library and the Python `locustfile` used for simulation, as shown in the attached image.

# Key Issue

The primary cause is tied to **FastAPI**'s configuration, specifically its use of **Uvicorn** with a limited number of `workers`. This can lead to internal server concurrency issues under high load.

# Initial Fix

To address this, the `Dockerfile` has been updated to set the number of workers to **4**, minimizing the error.

# Root Cause

The error occurs when saving output files in **.vtt format**, which can cause processing bottlenecks. Under heavy request loads, the server may struggle due to memory constraints or insufficient concurrency handling.

![شبیه سازی ارور](https://github.com/user-attachments/assets/9e72641f-5ede-497e-ab60-5200f5a341a4)

# Proposed Solution

Optimize file handling (reading/writing) by leveraging Python's built-in `io` library and `webvtt` features. This reduces memory usage and improves processing speed.

# Final Test

A working implementation and test results can be viewed in the **test video file** included in the repository.

![Test](https://github.com/user-attachments/assets/64f1c426-28df-4492-b0de-d29d0fefe8db)
