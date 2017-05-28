function [val, row, col] = find_smallest_index2(arr)

[val, idx1] = min(arr);

[~, idx2] = min(val);

row = idx1(idx2);
col = idx2;

val = arr(row, col);

end