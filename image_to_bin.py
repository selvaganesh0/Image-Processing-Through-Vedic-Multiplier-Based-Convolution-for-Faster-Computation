from PIL import Image
import numpy as np

# Step 1: Load the image
image_path = "sample_image_edge.jpg"  # Path to your image
image = Image.open(image_path)

# Step 2: Convert the image to grayscale
gray_image = image.convert('L')  # 'L' mode means grayscale (8-bit pixels, black and white)

# Step 3: Convert the grayscale image to a NumPy array to access pixel values
pixel_data = np.array(gray_image)

# Step 4: Save pixel intensity values (0-255) to a file
with open("F:\mini_project_final\convolution_vedic_convention - edge_detection//grayscale_pixel_data.txt", "w") as f:
    for row in pixel_data:
        row_data = ' '.join(map(str, row))  # Join pixel values with space in between
        f.write(row_data + '\n')  # Write each row to the file

print("Grayscale pixel data saved to grayscale_pixel_data.txt")
