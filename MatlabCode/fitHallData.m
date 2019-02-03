data = hallSensorVsElectromagnet ;

iVal = data.iVal(2:end);
hallSensorVal = data.HallSensorVal(2:end);
plot(iVal, hallSensorVal);
X = [ones(length(iVal),1) iVal]
b = X\hallSensorVal

figure
yCalc2 = X*b;
plot(iVal,yCalc2,'--')

plot(iVal, hallSensorVal - yCalc2);

