import ultralytics
import torch

# Print version of ultralytics and torch to verify installation
print("Ultralytics version:", ultralytics.__version__)
print("Torch version:", torch.__version__)

# Check if CUDA is available (optional)
if torch.cuda.is_available():
    print("CUDA is available")
else:
    print("CUDA is not available")
