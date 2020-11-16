function features = segment2features(I)
features = zeros(17, 1);

%Find the rows and cols with elements of value 1
[row, col] = find(I == 1);
min_col = min(col);
min_row = min(row);
max_col = max(col);
max_row = max(row);
region1 = I(min_row:max_row, min_col:max_col);
region2 = imresize(region1, [24,24]);
region = logical(region2);

upper = region(12:24, 1:24);
lower = region(1:12, 1:24);
left = region(1:24, 1:12);
right = region(1:24, 12:24);

stats = regionprops(region, 'Centroid', 'Circularity', 'Area', 'Extrema');
statsleft = regionprops(left, 'Centroid');
statsright = regionprops(right, 'Centroid');
statsupper = regionprops(upper, 'Centroid');
statslower = regionprops(lower, 'Centroid');


features(1) = sum(sum(region));
features(2) = mean(sum(region));
features(3) = mean(sum(region, 2));
features(4) = var(sum(region, 2));
features(5) = stats.Circularity;

c = vertcat(stats.Centroid);
e = mean(vertcat(stats.Extrema));
features(6) = c(1);
features(7) = c(2);
features(8)= e(1);
features(9)= e(1);

x = vertcat(statsleft.Centroid);
features(10) = x(1);
features(11) = x(2);
y = vertcat(statsright.Centroid);
features(12) = y(1);
features(13) = y(2);
z = vertcat(statsupper.Centroid);
features(14) = z(1);
features(15) = z(2);
l = vertcat(statslower.Centroid);
features(16) = l(1);
features(17) = l(2);

end

