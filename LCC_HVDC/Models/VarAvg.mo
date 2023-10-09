within LCC_HVDC.Models;
block VarAvg "Sensor to measure the average value of input - variable frequency"
  Modelica.Blocks.Interfaces.RealInput u annotation (
    Placement(transformation(extent = {{-140, 40}, {-100, 80}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
  Modelica.Blocks.Continuous.Integrator integrator annotation (
    Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
  Modelica.Blocks.Math.Add add(k2 = -1) annotation (
    Placement(transformation(extent = {{12, -10}, {32, 10}})));
  parameter Modelica.Units.SI.Frequency fMin = 49 "Frequency of the signals to be averaged";
  Modelica.Blocks.Nonlinear.VariableDelay variableDelay(delayMax = 1.001/fMin) annotation (
    Placement(transformation(extent = {{-26, -36}, {-6, -16}})));
  Modelica.Blocks.Interfaces.RealInput f annotation (
    Placement(transformation(extent = {{-138, -80}, {-98, -40}})));
  Modelica.Blocks.Math.Product product annotation (
    Placement(transformation(extent = {{54, -10}, {74, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = 1/f) annotation (
    Placement(transformation(extent = {{-66, -44}, {-46, -24}})));
equation
  connect(integrator.u, u) annotation (
    Line(points = {{-62, 0}, {-92, 0}, {-92, 60}, {-120, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add.u1, integrator.y) annotation (
    Line(points = {{10, 6}, {-14, 6}, {-14, 0}, {-39, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(variableDelay.y, add.u2) annotation (
    Line(points = {{-5, -26}, {2, -26}, {2, -6}, {10, -6}}, color = {0, 0, 127}));
  connect(variableDelay.u, integrator.y) annotation (
    Line(points = {{-28, -26}, {-34, -26}, {-34, 0}, {-39, 0}}, color = {0, 0, 127}));
  connect(add.y, product.u1) annotation (
    Line(points = {{33, 0}, {38, 0}, {38, 6}, {52, 6}}, color = {0, 0, 127}));
  connect(product.u2, f) annotation (
    Line(points = {{52, -6}, {40, -6}, {40, -60}, {-118, -60}}, color = {0, 0, 127}));
  connect(product.y, y) annotation (
    Line(points = {{75, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(realExpression.y, variableDelay.delayTime) annotation (
    Line(points = {{-45, -34}, {-38, -34}, {-38, -32}, {-28, -32}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2})),
    Documentation(info = "<html><head></head><body><p style=\"color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px; margin-bottom: 0px;\"><font face=\"MS Sans Serif\" size=\"5\">Harmonics can afect the behaviour of Phase Looked Loops(PLL) by affecting the dq components. dq components are constant values when three-phase variables are a pure positive sequence sinusoidal system. So, to avoid the effect of harmonics on PLL, the calculated dq component to be used in PLL is first filtered by calculating &nbsp;its average value during one period at the operating frequency. As the frequency changes, the average calculation is made on a moving window having a length depending on the actual frequency.</font></p>
 </body></html>",
              revisions = "<html>
 <ul>
 <li><i> January 12, 2006   </i>
        by Anton Haumer<br> implemented<br>
        </li>
 </ul>
 </html>"),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(lineColor = {0, 0, 255}, extent = {{100, 112}, {-104, 146}}, textString = "%name"), Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 127}, extent = {{-100, 44}, {100, -44}}, textString = "var
AVG")}));
end VarAvg;
