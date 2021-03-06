function [h display_array]=displayMatrix(X,row,col)

	[m,n]=size(X);

	sel=randperm(m)(1:row*col);
	
	colormap(gray);
	
	display_array=[];
	z=1;
	for i=1:row
		riga=[];
		for j=1:col
			riga=[riga reshape(X(sel(z),:),sqrt(n),sqrt(n))];
			z=z+1;
		end
		display_array=[display_array;riga];
	end
	h=imagesc(display_array);
	drawnow
