from ultralytics import YOLO

# Load a YOLO model (choose one you have or download)
model = YOLO("yolo11n.pt")  # or yolov11s.pt, yolov11m.pt, etc.

# Define your test input (image or video path)
testDetector = "test_detector.jpg"

# Run detection
results = model.predict(source=testDetector)

# Process results (check for 'dog' and 'person')
output_text = str(results[0])  # Convert predictions to string summary
print(output_text)

# Check if both 'dog' and 'person' appear in the detections
keywords = ["dog", "person"]

if all(word in output_text for word in keywords):
    print("✅ Detection is working.")
else:
    print("❌ Detection not working.")
