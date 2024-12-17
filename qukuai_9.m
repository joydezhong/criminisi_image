function [Hp,rows,cols] = qukuai_9(sz, p, qukuai_size)
  % qukuai_9 函数的作用是根据给定的图像尺寸、中心点位置和修复块大小，
  % 计算出一个以该中心点为中心的修复块（通常是正方形区域）的所有像素在图像中的线性索引。
  % 这个函数返回的是该修复块中所有像素的位置信息，以便后续用于图像修复过程中的匹配和填充操作。


  x = floor(rem(p,sz(1)));
  y = floor(p/sz(1))+1;%得到待修复区域中心点所在的位置
  w = floor(qukuai_size/2);%块的半径（9*9大小的块，块的半径为4）
  % x = mod(p-1, sz(2)) + 1; % 行坐标
  % y = floor((p-1) / sz(2)) + 1; % 列坐标
  rows = max(1,x-w):min(x+w,sz(1));
  cols = max(1,y-w):min(y+w,sz(2));
  numhang = length(rows);
  numlie = length(cols);
  HJ = zeros(numhang,numlie);
  LJ = zeros(numhang,numlie);
  % [HJ, LJ] = meshgrid(rows, cols);
  for ii = 1:numlie
      HJ(:,ii) = rows;%行铺成的矩阵
  end
  for jj = 1:numhang
      LJ(jj,:) = cols;%列铺成的矩阵
  end
  Hp = (LJ-1)*sz(1)+HJ;%得到待修复块（在图像中的具体位置）s