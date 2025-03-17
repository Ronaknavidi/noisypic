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

% کم کردن تصاویر فیلتر شده از تصویر اصلی
subtracted_img1 = imabsdiff(img, filtered_img1); % تفریق تصویر فیلتر شده 3x3
subtracted_img2 = imabsdiff(img, filtered_img2); % تفریق تصویر فیلتر شده 5x5
subtracted_img3 = imabsdiff(img, filtered_img3); % تفریق تصویر فیلتر شده 7x7

% نمایش تصاویر در کنار هم
figure;

% تصویر نویزی
subplot(1, 5, 1);
imshow(noisy_img);
title('تصویر با نویز');

% تصویر فیلتر شده با فیلتر 3x3
subplot(1, 5, 2);
imshow(filtered_img1);
title('فیلتر 3x3');

% تصویر تفریق شده 3x3
subplot(1, 5, 3);
imshow(subtracted_img1);
title('تفریق 3x3');

% تصویر فیلتر شده با فیلتر 5x5
subplot(1, 5, 4);
imshow(filtered_img2);
title('فیلتر 5x5');

% تصویر تفریق شده 5x5
subplot(1, 5, 5);
imshow(subtracted_img2);
title('تفریق 5x5');

% تصویر فیلتر شده با فیلتر 7x7
subplot(1, 5, 6);
imshow(filtered_img3);
title('فیلتر 7x7');

% تصویر تفریق شده 7x7
subplot(1, 5, 7);
imshow(subtracted_img3);
title('تفریق 7x7');
