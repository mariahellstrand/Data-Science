function [S] = im2segment(im)
    m = size(im,1);
    n = size(im,2);
    
    %creates binary image, all values above 25 is replaced by 1s and all
    %values under 25 is replaced by 0s
    binaryImage = imbinarize(im, 42);
    
    %returns the connected compontents in binaryImage
    BW = bwpropfilt(binaryImage, 'perimeter', 5);
    CC = bwconncomp(BW,8);
    
    %loops through the objects in CC and created a matrix S with the
    %components of image i in row i.
    for kk = 1:CC.NumObjects
        S{kk} = zeros(m,n);
        S{kk}(CC.PixelIdxList{kk}) = 1;
    end
    
end