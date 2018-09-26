function [out] = Interp3DBinary(bw)

%includes zero values of original
%[a b c] = size(bw);
%ct=0;
%for i = 1:a
	%for j = 1:b
	%	for k = 1:c
	%		ct=ct+1;
	%		X(ct) = i;
	%		Y(ct) = j;
	%		Z(ct) = k;
	%		V(ct) = bw(i,j,k);
	%	end
	%end
%end
%clear bw;

%leaves zero slices empty
[a b c] = size(bw);
ct=0;
for k = 1:c
	if length(find(bw(:,:,k))) > 0
		for i = 1:a
			for j = 1:b
				ct=ct+1;
				X(ct) = i;
				Y(ct) = j;
				Z(ct) = k;
				V(ct) = bw(i,j,k);
			end
		end
	end
end
V = double(V);
clear bw;

			
[Xq,Yq,Zq] = meshgrid(1:1:a,1:1:b,1:1:c);

Vq = interp3(X,Y,Z,V,Xq,Yq,Zq);
clear X,Y,Z,Xq,Yq,Zq;

out = false(size(Vq));
ct=0;
for i = 1:a
	for j = 1:b
		for k = 1:c
			ct-ct+1;
			out(i,j,k) = Vq(ct) > 0;
		end
	end
end
