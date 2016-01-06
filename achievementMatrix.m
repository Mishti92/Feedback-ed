function[dataCD] = achievementMatrix(data)

n=size(data,1);
p=size(data,2);
dataCD=[];
for i=1:p,
		a=findNumber(data(:,i),5);
		b=findNumber(data(:,i),4);
		c=findNumber(data(:,i),3);
		d=findNumber(data(:,i),2);
		e=findNumber(data(:,i),1);
		l=[a/n,b/n,c/n,d/n,e/n];
		dataCD=[dataCD;l];
	end		
end