% خواندن تصویر از فایل آپلود شده
img = imread('sample.png');

% کاهش اندازه تصویر به یک چهارم اندازه اصلی
img = imresize(img, 0.25); 

% اضافه کردن نویز گاوسی با میانگین و واریانس متوسط
mean_value = 0.05; % میانگین نویز
variance_value = 0.01; % واریانس نویز
noisy_img = imnoise(img, 'gaussian', mean_value, variance_value);

% فیلتر میانگین با اندازه‌های مختلف
h1 = fspecial('average', [3 3]); % فیلتر 3x3
h2 = fspecial('average', [5 5]); % فیلتر 5x5
h3 = fspecial('average', [7 7]); % فیلتر 7x7

% اعمال فیلتر به تصاویر نویزی
filtered_img1 = imfilter(noisy_img, h1, 'replicate');
filtered_img2 = imfilter(noisy_img, h2, 'replicate');
filtered_img3 = imfilter(noisy_img, h3, 'replicate');

% نمایش تصاویر در کنار هم
figure;

% تصویر نویزی
subplot(1, 4, 1);
imshow(noisy_img);
title('تصویر با نویز');

% تصویر فیلتر شده با فیلتر 3x3
subplot(1, 4, 2);
imshow(filtered_img1);
title('فیلتر 3x3');

% تصویر فیلتر شده با فیلتر 5x5
subplot(1, 4, 3);
imshow(filtered_img2);
title('فیلتر 5x5');

% تصویر فیلتر شده با فیلتر 7x7
subplot(1, 4, 4);
imshow(filtered_img3);
title('فیلتر 7x7');
