from PIL import Image
import numpy as np
from scipy.ndimage import convolve

def binary_to_image_with_kernel(file_path, output_image_path):
    # Define the image dimensions
    width, height = 638, 478

    # Load binary data from the file
    with open(file_path, 'r') as file:
        data = file.read().strip().split()
        
        # Convert binary strings to signed integers
        pixel_data = np.array([int(val, 2) if val[0] == '0' else int(val, 2) - (1 << len(val)) for val in data], dtype=np.int8)

    # Check if data size matches the specified dimensions
    if pixel_data.size != width * height:
        raise ValueError("Data size does not match the expected 638x478 image dimensions.")

    # Reshape the array to the image dimensions
    pixel_data = pixel_data.reshape((height, width))

    # Apply convolution with the kernel
    processed_data = convolve(pixel_data, kernel, mode='constant', cval=0)

    # Convert processed data to uint8 format without normalization
    processed_data = processed_data.astype(np.uint8)

    # Create the grayscale image
    image = Image.fromarray(processed_data, 'L')
    image.save(output_image_path)
    print(f"Image saved as {output_image_path}")

# Define a kernel (example: edge detection kernel)
# Example usage
binary_to_image_with_kernel('output.txt', 'process_image.png')
