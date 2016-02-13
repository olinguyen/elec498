
function newMagnitudeImage = NonMaximalSuppression(magnitude,orientation)
[length_x, length_y] = size(magnitude);
newMagnitudeImage = magnitude;
% Round gradient direction to 45 deg
rounded_orientation = round(orientation / (pi/4)) * (pi/4);
% Compare edge strength of pixel to +/- gradient direction
for x = 2:(length_x-1)
    for y = 2:(length_y-1)
        pixel_orientation = rounded_orientation(x, y);
        pixel_magnitude = magnitude(x, y);
        if (pixel_orientation == pi/4 || pixel_orientation+pi == pi/4)
            if ~(pixel_magnitude >= magnitude(x+1,y+1) && ...
                    pixel_magnitude >= magnitude(x-1, y-1))
                newMagnitudeImage(x, y) = 0;
            end
        elseif (pixel_orientation == pi/2 || pixel_orientation+pi == pi/2)
            if ~(pixel_magnitude >= magnitude(x+1,y) && ...
                    pixel_magnitude >= magnitude(x-1, y))
                newMagnitudeImage(x, y) = 0;
            end        
        elseif (pixel_orientation == 3*pi/4 || pixel_orientation+pi == 3*pi/4)
            if ~(pixel_magnitude >= magnitude(x-1,y+1) && ...
                    pixel_magnitude >= magnitude(x+1, y-1))
                newMagnitudeImage(x, y) = 0;
            end                
        elseif (abs(pixel_orientation) == pi || ...
                pixel_orientation == 0)
            if ~(pixel_magnitude >= magnitude(x,y-1) && ...
                    pixel_magnitude >= magnitude(x, y+1))
                newMagnitudeImage(x, y) = 0;
            end
        else
            disp('Got weird angle');
            disp(rounded_orientation(x, y));
        end
    end
end