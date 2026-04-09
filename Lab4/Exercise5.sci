clear(); clc; clf();

// --- STEP 1: Set working directory to IPCV images folder ---
IPCV_DIR = atomsGetInstalledPath("IPCV");
path_to_images = fullfile(IPCV_DIR, "images");
cd(path_to_images);

// --- STEP 2: Read the image ---
img = imread("baboon.png");

if exists("img") then
    // Display Original Color Image in Window 0
    scf(0); clf(); 
    imshow(img);
    xtitle("Original Color Image");
    disp("Success: Baboon image loaded.");
else
    error("Error: Could not find baboon.png in the directory.");
end

// --- STEP 3: Convert Color to Grayscale ---
if size(img, 3) == 3 then
    img_gray = rgb2gray(img);
    disp("Image converted from RGB to Grayscale.");
else
    img_gray = img;
end

// Display Grayscale Image in Window 1
scf(1); clf();
imshow(img_gray);
xtitle("Grayscale Image");

// --- STEP 4: Histogram Analysis ---
scf(2); clf();
// Convert image to a 1D vector and cast to double for plotting
data_vector = double(img_gray(:)); 

// histplot(number_of_bins, data)
// normalization=%f keeps the raw pixel counts instead of density
histplot(256, data_vector, normalization=%f); 

xtitle("Histogram of Grayscale Image");
// Add axis labels for better report quality
xlabel("Intensity Level (0-255)");
ylabel("Number of Pixels");

// --- STEP 5: Image Blurring ---
// Create a 5x5 Average Filter (Low-pass Filter)
h = ones(5,5) / 25;
img_blur = imfilter(img_gray, h);

// Display Blurred Image in Window 3
scf(3); clf();
imshow(img_blur);
xtitle("Blurred Image (5x5 Average Filter)");

// --- STEP 6: Digital Watermarking ---
// Create a simple mask (rectangular watermark)
mask = uint8(zeros(size(img_gray,1), size(img_gray,2)));
mask(100:200, 100:400) = 150; 

// Blend images: 70% original + 30% mask
img_watermark = imlincomb(0.7, img_gray, 0.3, mask);

// Display Watermarked Image in Window 4
scf(4); clf();
imshow(img_watermark);
xtitle("Watermarked Image (Alpha Blending)");

disp("Processing complete. Please check Graphic Windows 0 to 4.");
