
% Sub-function to determine Flow-rate for rectangular cross section
% Maximum width and height given
% Maximum velocity to be calculated from the data given
% Python loop calls this function to find the velocity differences

function[actual_flow_rate] = rectangular_integration(vmax, x, y, qdiff)

Width   =   23.5                            % Maximum width of the canal
Height  =   6.7                             % Maximum height of the canal
n       =   80                              % Exponent in x direction
m       =   80                              % Exponent in y direction

vrad = vmax.*((1-(2.*x)./Width).^(1./n)).*((1-(2.*y)./Height).^(1./m));

qref = vmax.*Width.*Height.*m.*n./((1+m).*(1+n));

actual_flow_rate = qref - qdiff;

end



% Creating sub-function to determine Flow rate for circular cross section


function[actual_flow_rate] = cicular_flow_rate(vmax, radius, qdiff)

n = 9 ; 

vrad = @(r) vmax.*((1-(r./radius)).^(1./n)) ;

q = @vrad .*(3.14).*((r).^2);
qref = quadgk(vrad, 0, radius) ;           % Integrating to get least possible error

actual_flow_rate = qref-qdiff ;         % Getting the actual flow

end
