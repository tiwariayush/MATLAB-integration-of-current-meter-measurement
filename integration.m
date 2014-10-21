% Creating function to determine Flow rate for circular cross section

function[actual_flow_rate] = cicural_integration(vmax, radius, qdiff)

vrad = @(r) vmax.*(power(1-(r./rad)).^(1./9));

qref = integral(vrad, 0, rad);

actual_flow_rate = qref-qdiff;

