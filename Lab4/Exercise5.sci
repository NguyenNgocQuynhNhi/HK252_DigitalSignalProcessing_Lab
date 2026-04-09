clear();    clc;    clf;

// Bước 1: Di chuyển thư mục làm việc của Scilab vào tận nơi chứa ảnh của IPCV
path_to_images = fullfile(atomsGetInstalledPath("IPCV"), "images");
cd(path_to_images);

// Bước 2: Bây giờ chỉ cần gọi tên file, không cần đường dẫn dài dòng nữa
img = imread("baboon.png");

// Bước 3: Kiểm tra và hiển thị
if exists("img") then
    imshow(img);
    disp("Thành công! Đã load được ảnh baboon.");
else
    disp("Vẫn chưa load được ảnh. Hãy kiểm tra xem file baboon.png có trong thư mục không.");
end

