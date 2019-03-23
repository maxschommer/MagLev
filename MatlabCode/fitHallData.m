% data = hallSensorVsElectromagnetRecharactarized ;
data = magnetPlot;
iVal = data.iVal;
hallSensorVal = data.hallSensorVal;
plot(iVal, hallSensorVal);
size(ones(length(iVal),1))
X = [ones(length(iVal),1) iVal]
b = X\hallSensorVal

figure
yCalc2 = X*b;
plot(iVal,yCalc2,'--')

plot(iVal, hallSensorVal - yCalc2);

