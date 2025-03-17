% خواندن تصویر از فایل آپلود شده
img = imread('sample.png');

% کاهش اندازه تصویر به یک چهارم اندازه اصلی
img = imresize(img, 0.25); 

% نمایش اندازه تصویر بعد از کاهش
disp(['اندازه تصویر بعد از کاهش: ', num2str(size(img))]);

% اضافه کردن نویز گاوسی با میانگین و واریانس متوسط
mean_value = 0.05; % میانگین نویز
variance_value = 0.01; % واریانس نویز
noisy_img1 = imnoise(img, 'gaussian', mean_value, variance_value);

% اضافه کردن نویز گاوسی با میانگین و واریانس بیشتر برای مقایسه
mean_value2 = 0.1; % میانگین نویز بیشتر
variance_value2 = 0.05; % واریانس نویز بیشتر
noisy_img2 = imnoise(img, 'gaussian', mean_value2, variance_value2);

% نمایش تصاویر در کنار هم
figure;

% تصویر اصلی
subplot(1, 3, 1);
imshow(img);
title('تصویر اصلی');

% تصویر با نویز گاوسی اول
subplot(1, 3, 2);
imshow(noisy_img1);
title('تصویر با نویز (میانگین 0.05، واریانس 0.01)');

% تصویر با نویز گاوسی دوم
subplot(1, 3, 3);
imshow(noisy_img2);
title('تصویر با نویز (میانگین 0.1، واریانس 0.05)');
