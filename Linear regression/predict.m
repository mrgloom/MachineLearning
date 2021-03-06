function h=predict(type,X,theta,mu=[],sd=[])

	m=size(X,1);

	if size(theta,1)>size(X,2)
		X=[ones(m,1) X];
	end

	if (length(mu)>0)&&(length(sd)>0)
		for j=2:size(X,2)
			X(:,j)=(X(:,j)-mu(j-1))/sd(j-1)
		end
	end


	if strcmp(type,'linear')==1

		h=X*theta;

	elseif strcmp(type,'logistic')==1
	
		z=X*theta;
		h=1./(1+exp(-z));
		
	end
