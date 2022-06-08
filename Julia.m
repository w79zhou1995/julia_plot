function Julia(re, im)
format long;
hold on;
%close all;

% choose colormap 
map = 'jet';

% set constant
c = complex(re, im); 

% set seed (points on complex plane)
x = linspace(-2,2,2000);
y = linspace(2,-2,2000);
[X, Y] = meshgrid(x, y);
z = complex(X, Y);

% whether numbers have reached infinity
isInf = zeros(size(z)); 


% number of iterations
niter = 500;


for i = 1:niter
    z = z.^2 + c;
    
    % number of iterations before numbers reach infinity
    isInf(isinf(z) & (isInf == 0)) = i;
end

imagesc(1:1000,1:1000,isInf);
colormap(map);
axis equal;
if im == 0
    title(['c = ' num2str(re)]);
elseif re == 0
    title(['c = ' num2str(im) 'i']);
elseif im < 0
    title(['c = ' num2str(re) ' - ' num2str(-1*im) 'i']);
else 
    title(['c = ' num2str(re) ' + ' num2str(im) 'i']);
end 
end




