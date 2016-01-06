function[flag1] = reduceData(data)

clus = myKmeans(data, 2);
data1= abs(data - clus(1));
data2= abs(data - clus(2));

n=size(data,1);
flag1 = [];
for i=1:n
	if (data1(i) > 0.5) && (data2(i) > 0.5)
		flag1 = [flag1, i];
	end
end
