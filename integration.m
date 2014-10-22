% Create function for integration

function[flow_rate] = integration(type)
%Call either sub-function depending on type
end

% Creating sub-function to determine Flow rate for circular cross section

function[actual_flow_rate] = cicural_integration(vmax, radius, qdiff)

vrad = @(r) vmax.*(power(1-(r./rad)).^(1./9));

qref = integral(vrad, 0, rad);

actual_flow_rate = qref-qdiff;
end


% Sub-function to determine Flow-rate for rectangular cross section

function[actual_flow_rate] = rectangular_integration(vmax, x, y, qdiff)

Width = 4.875                 %Width of the canal
Height = 7.437                %Height of the canal
n=80                          %exponent in x direction
m=80                          %exponent in y direction
vrad = vmax.*(power(1-(2.*x)./Width).^(1./n)).*(power(1-(2.*y)./Height).^(1./m));

qref = vmax.*Width.*Height.*m.*n./((1+m).*(1+n));

actual_flow_rate = qref - qdiff;
end
