function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
xr = 0;

t =0;
ea = 100;
root = 0;
fxl=func(xl,varargin{:});
fxu=func(xu,varargin{:});
if fxl*fxu > 0 
    error('invalid braket')
end
if nargin < 3
        error('not enough variables')
end
if nargin < 4  % base ea if one isn't specified
    es = .0001;
end
if nargin < 5  % base max iterations if none are specified
    maxit = 200;
end
while ea>=es && t < maxit    
    prevxl = xl       % logs the prvious numbers 
    prevxu = xu 
    fxl=func(xl,varargin{:});   
    fxu=func(xu,varargin{:});
    t = t+1;

    
    xr = xl - ((xu-xl)*fxl)/(fxu-fxl) 
    
    fxr=func(xr,varargin{:})
    
   
    if fxr*fxl > 0     % if positive, then it changes xl to xr, of not xu is now xr
            xl = xr
         ea = abs(((xr - prevxl)/xr)*100)
    else  
        xu = xr
        ea = abs(((xr - prevxu)/xr)*100)
    end
   
       
  
    
    root = xr 
    fx = func(root)
    
end
iter = t

end