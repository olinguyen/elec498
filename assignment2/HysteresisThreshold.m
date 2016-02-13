
function BinaryEdgeImage = HysteresisThreshold(magnitudeImage,minThresh,maxThresh)
BinaryEdgeImage = magnitudeImage;
max_value = max(magnitudeImage(:)); 
min_value = min(magnitudeImage(:));

abovemin=magnitudeImage>minThresh;                    % points above lower threshold

[aboveMaxr, aboveMaxc] = find(magnitudeImage > maxThresh);
bw = bwselect(abovemin, aboveMaxc, aboveMaxr, 8);

%seed_indices=sub2ind(size(abovemin),find(magnitudeImage>maxThresh)); % indices of points above upper threshold
%BinaryEdgeImage=imfill(~abovemin,seed_indices,8);     % obtain all connected regions in abovet1 that include points with values above t2
%BinaryEdgeImage=BinaryEdgeImage & abovemin;

