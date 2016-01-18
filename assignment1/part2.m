clc;clear;
% 1
img = imread('peppers.png');
upside_down = img(end:-1:1, end:-1:1, :);
imshow(upside_down);
% 2
grayscale = rgb2gray(img);
imshow(grayscale);
% 3
blue = img(:, :, 3);
r_b_swapped_img = img;
r_b_swapped_img(:, : ,3) = img(:, :, 1);
r_b_swapped_img(:, :, 1) = blue;
% 4)
imshow(imrotate(img, 90));
% 5)
A = reshape(1:300, 10, 10, 3);
A_2d = reshape(A, 100, 3);
A_3d = reshape(A_2d, 10, 10, 3);
