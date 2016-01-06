function[] = startImplementation()

load f1.dat;
load f2.dat;
load f1other.dat;
load f2other.dat;
mean1= mean(f1,2);
mean2= mean(f2,2);

normalmean1=mean(f1,1)
%normalmean1=sum(normalmean1(1:6))/30
normalmean2=mean(f2,1)
%normalmean2=sum(normalmean2(1:6))/30

reduce1 = reduceData(mean1);
reduce2 = reduceData(mean2);

size1 = size(reduce1,2);
size2 = size (reduce2,2);

for i=1:size1,
	if searchData(reduce2,reduce1(i)) == 0
		reduce1(i) = [];
		size1 = size(reduce1,2);
	end
end

for i=1:size2,
	if searchData(reduce1,reduce2(i)) == 0
		reduce2(i) = [];
		size2 = size(reduce2,2);
	end
end	

f1=deleteData(f1,reduce1,size1);
f2=deleteData(f2,reduce2,size2);

%finalmean1=mean(f1,1)
%finalmean2=mean(f2,1)
MLmean1=mean(f1,1)
%MLmean1=sum(MLmean1(1:6))/30
MLmean2=mean(f2,1)
%MLmean2=sum(MLmean2(1:6))/30

%coefficient matrix [1,i,j,k,l]';
R1=[1,1,0.333,-0.333,-1]';
R2=[1,0.333,-0.333,-1,-1]';
W=[0.9,0.1];

Lq1 = connectionMatrix(f1);
Lq1= sum(Lq1,1);
Lq1= Lq1/6;
Lq1=W(1)*Lq1

Lq2 = connectionMatrix(f2);
Lq2= sum(Lq2,1);
Lq2= Lq2/6;
Lq2=W(1)*Lq2


A1 = achievementMatrix(f1other);
A1= sum(A1,1)/2;
A1=W(2)*A1

A2 = achievementMatrix(f2other);
A2= sum(A2,1)/2;
A2=W(2)*A2


finaldata1=Lq1+A1
finaldata2=Lq2+A2

final11=finaldata1*R1;
final12=finaldata1*R2;
forTeacher1=(final11+final12)/2

final21=finaldata2*R1;
final22=finaldata2*R2;
forTeacher2=(final21+final22)/2 