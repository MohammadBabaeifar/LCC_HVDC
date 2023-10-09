within LCC_HVDC.Models;
model SampleHold
  Modelica.Blocks.Discrete.UnitDelay unitDelay[6](each samplePeriod = 1e-3) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {4, -26})));
  Modelica.Blocks.Logical.Switch switch1[6] annotation (
    Placement(visible = true, transformation(origin = {2, 14}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Math.RealToBoolean realToBoolean[6] annotation (
    Placement(transformation(extent = {{-56, 4}, {-36, 24}})));
  Modelica.Blocks.Interfaces.RealInput u1[6]
    "Connector of second Real input signal" annotation (Placement(
        transformation(extent={{-140,20},{-100,60}}), iconTransformation(
          extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput u2[6]
    "Connector of second Real input signal" annotation (Placement(
        transformation(extent={{-140,-60},{-100,-20}}), iconTransformation(
          extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Interfaces.RealOutput y[6] annotation (
    Placement(transformation(extent = {{60, -14}, {88, 14}}), iconTransformation(extent = {{100, -20}, {142, 22}})));
equation
  connect(y, switch1.y) annotation (
    Line(points = {{74, 0}, {40, 0}, {40, 14}, {13, 14}}, color = {0, 0, 127}));
  connect(unitDelay.u, switch1.y) annotation (
    Line(points = {{16, -26}, {26, -26}, {26, 14}, {13, 14}}, color = {0, 0, 127}));
  connect(unitDelay.y, switch1.u3) annotation (
    Line(points = {{-7, -26}, {-22, -26}, {-22, 6}, {-10, 6}}, color = {0, 0, 127}));
  connect(realToBoolean.y, switch1.u2) annotation (
    Line(points = {{-35, 14}, {-10, 14}}, color = {255, 0, 255}));
  connect(u2, realToBoolean.u) annotation (Line(points={{-120,-40},{-80,-40},
          {-80,14},{-58,14}}, color={0,0,127}));
  connect(u1, switch1.u1) annotation (Line(points={{-120,40},{-20,40},{-20,
          22},{-10,22}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(textColor = {0, 0, 229}, extent = {{-70, 44}, {72, -50}}, textString = "SH"), Rectangle(extent = {{-72, 72}, {74, -72}}), Text(origin = {-1, -20}, textColor = {0, 0, 222}, extent = {{-99, 172}, {97, 130}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -60}, {60, 60}})),
    Documentation(info = "<html><head></head><body><!--StartFragment--><p style=\"margin: 0.5em 0px; color: rgb(32, 33, 34); font-family: sans-serif; font-variant-ligatures: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);\"><!--StartFragment--><span style=\"font-variant-ligatures: normal;\"><font size=\"5\">Samples the data and holds the value if the Boolen signal is <i>true.</i></font></span></p><p style=\"margin: 0.5em 0px; color: rgb(32, 33, 34); font-family: sans-serif; font-variant-ligatures: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);\"><font size=\"5\">As long as the Boolean signal is <i>true</i>, the input is transfered to the output (y). When the&nbsp;Boolean signal is <i>false</i>, the output samples have the value of the last forwarded data sample.</font></p><!--EndFragment-->
<font size=\"5\"><a href=\"modelica://HVDC.Models.ReferenceInfo\">[MATLAB-Simulink]</a>:</font><p></p> <br><p></p></body></html>"));
end SampleHold;
