function Blurred_im=Blurring_effect(im,masksize)

mask = ones(masksize) / masksize^2;
Blurred_im = imfilter(im, mask, 'conv');

