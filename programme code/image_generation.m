function [Zi,Xi,Yi] = image_generation(Value,loc_file)

rmax = 0.7;             
GRID_SCALE = 128;

[~, ~, Th, Rd, ~] = readlocs(loc_file);
Th = pi/180*Th;                              
%获得导联对应的位置坐标
[x,y] = pol2cart(Th,Rd);

xmin = min(-rmax,min(x)); xmax = max(rmax,max(x));
ymin = min(-rmax,min(y)); ymax = max(rmax,max(y));
%linspace(x1,x2,N)，其中x1、x2、N分别为起始值、中止值、元素个数。
xi = linspace(xmin,xmax,GRID_SCALE);   
yi = linspace(ymin,ymax,GRID_SCALE);   

[Xi,Yi,Zi] = griddata(y,x,double(Value),yi',xi,'v4');

  mask = (sqrt(Xi.^2 + Yi.^2) <= rmax); % mask outside the plotting circle
  ii = find(mask == 0);
  Zi(ii)  = 0;   