function BlockyImage= PixelatingEffect(im,a) 
Image = im;
[rows, columns, Channels] = size(Image)

redChannel = Image(:, :, 1);
greenChannel = Image(:, :, 2);
blueChannel = Image(:, :, 3);
block_Size = [a, a]; 

% 32 pixel by 32 pixel block by the mean of the pixels in the block.
% The image is 1086 pixels across which will give 1083/32 = 34 blocks.
% The image is 818 pixels tall which will give 818/32 = 26 blocks.
meanFilter = @(theBlockStructure) mean(theBlockStructure.data(:));

blockyImageR = blockproc(redChannel, block_Size, meanFilter);
blockyImageG = blockproc(greenChannel, block_Size, meanFilter);
blockyImageB = blockproc(blueChannel, block_Size, meanFilter);

rgbBlockyImage = uint8(cat(3, blockyImageR, blockyImageG, blockyImageB));
BlockyImage = imresize(rgbBlockyImage, [rows, columns],'nearest'); % Use 'nearest' to pixelate.
