function [C]= display_graph(X,Y,result,n,percent)
figure(n)
surf(X,Y,result(:,:,percent/10+1))
colorbar
xlabel('Compression Ratio')
ylabel('AFR')
zlabel('Efficiency')
temp = result(:,:,percent/10+1)
[C,I] = max(temp(:));
% [I1,I2,I3] = ind2sub(size(result),I);
if percent == 100
    title(sprintf('Otto Cycle (cv percent = %i percent)',percent))
elseif percent ==0
   title(sprintf('Diesel Cycle (cv percent = %i percent)',percent))
else
    title(sprintf('Dual Cycle (cv percent = %i percent)',percent))
% text(I1,I2,I3,'some text to display');
end