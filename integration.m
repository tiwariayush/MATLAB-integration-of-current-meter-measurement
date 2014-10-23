% Creating function to determine Flow rate for circular cross section

function[actual_flow_rate] = cicular_flow_rate(vmax, radius, qdiff)

n = 9 ; 

vrad = @(r) vmax.*(power(1-(r./rad)).^(1./n)) ;

qref = quadgk(vrad, 0, rad) ;           % Integrating to get least possible error

actual_flow_rate = qref-qdiff ;         % Getting the actual flow

