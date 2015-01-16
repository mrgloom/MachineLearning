function [theta,Jhistory,thetaN,optTheta,functionVal]=linearRegression(y,x,alpha=0.01,lambda=1,MaxIter=10^5,epsilon=10^-10)

	m=size(y,1);
	n=size(x,2);
	x=normalize(x);
	Jhistory=[];

	% gradient descent
	theta=zeros(n+1,1);
	for iteration=1:MaxIter
		[J,dJ]=cost(y,x,theta,lambda);
		theta=update(theta,alpha,dJ);
		Jhistory=[Jhistory;J];
		if iteration>2
			if Jhistory(iteration-1)-Jhistory(iteration)<epsilon
				break;
			end
		end
	end
	
	% normal equation
	thetaN=normalEquation(y,x,lambda);

	% advanced optimization
	options=optimset('GradObj','on','MaxIter','10^3');
	initialTheta=zeros(n+1,1);
	[optTheta,functionVal,exitFlag]=fminunc(@(theta)(cost(y,x,theta,lambda)),initialTheta,options);
	