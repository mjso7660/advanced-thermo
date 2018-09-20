function [C,I1,I2]= display_graph(X,Y,result,n,percent)
figure(n)
surf(X,Y,result(:,:,percent/10+1))
colorbar
xlabel('AFR')
ylabel('Compression Ratio')
zlabel('Efficiency')

if percent == 100
    title(sprintf('Otto Cycle (cv percent = %i percent)',percent))
    temp = result(1:8,:,percent/10+1); % limit compression ratio upto 13 if Otto
elseif percent == 0
    title(sprintf('Diesel Cycle (cv percent = %i percent)',percent))
    temp = result(6:end,:,percent/10+1);
else
    title(sprintf('Dual Cycle (cv percent = %i percent)',percent))
    temp = result(:,:,percent/10+1);
end
[C,I] = max(temp(:));
[I1,I2,I3] = ind2sub(size(result),I);
% text(I1,I2,I3,'some text to display');
end