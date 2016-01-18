clc;clear;
% 1)
column_wise = reshape(1:100, 10, 10);
% 2)
row_wise = column_wise';
% 3)
odd_columns_even_rows = column_wise(2:2:end, 1:2:end);
% 4)
greater_than_50 = (column_wise > 50);
% 5)
XYZ = linsolve([1 1 1; 2 1 0; 0 1 1], [2; 3; 5]);
