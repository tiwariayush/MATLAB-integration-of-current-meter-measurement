% Create function for integration

function[flow_rate] = integration(type)
%Call either sub-function depending on type
end

% Creating sub-function to determine Flow rate for circular cross section
function[actual_flow_rate] = cicular_flow_rate(vmax, radius, qdiff)

n = 9 ; 

vrad = @(r) vmax.*(power(1-(r./radius)).^(1./n)) ;

qref = quadgk(vrad, 0, rad) ;           % Integrating to get least possible error

actual_flow_rate = qref-qdiff ;         % Getting the actual flow

end

% Sub-function to determine Flow-rate for rectangular cross section
function[actual_flow_rate] = rectangular_integration(vmax, x, y, qdiff)

Width = 4.875                           % Width of the canal
Height = 7.437                          % Height of the canal
n=80                                    % Exponent in x direction
m=80                                    % Exponent in y direction

vrad = vmax.*(power(1-(2.*x)./Width).^(1./n)).*(power(1-(2.*y)./Height).^(1./m));

qref = vmax.*Width.*Height.*m.*n./((1+m).*(1+n));

actual_flow_rate = qref - qdiff;

end
