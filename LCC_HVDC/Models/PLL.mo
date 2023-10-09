within LCC_HVDC.Models;
model PLL
  import Modelica.Constants.pi;
  parameter Real Kp(unit = "rad/(s.V)") = 30 "PI proportional gain";
  parameter Modelica.Units.SI.Voltage vNom = 1 "expected voltage amplitude";
  parameter Modelica.Units.SI.Time Ti = 60/1400 "PI time constant";
  parameter Modelica.Units.SI.Frequency fMin = 49 "minimum frequency to be measured";
  parameter Modelica.Units.SI.Frequency fInit = 50 "initial frequency";
  parameter Modelica.Units.SI.Frequency fMax = 51 "maximum frequency to be measured";
  parameter Real maxSlew = 1 "max frequency variation (Hz/s)";
  Modelica.Blocks.Continuous.PI PIcontr(T = 60/1400, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 2.0*pi*fInit, k = 60/vNom) annotation (
    Placement(transformation(extent = {{-52, -10}, {-32, 10}})));
  Modelica.Blocks.Math.Gain toRad(k = 1.0/(2.0*pi)) annotation (
    Placement(transformation(extent = {{-14, 30}, {6, 50}})));
  Modelica.Blocks.Continuous.Filter filter(order = 2, f_cut = 30, analogFilter = Modelica.Blocks.Types.AnalogFilter.CriticalDamping) annotation (
    Placement(transformation(extent = {{52, 30}, {72, 50}})));
  Modelica.Blocks.Interfaces.RealOutput fHz annotation (
    Placement(transformation(extent = {{100, 50}, {120, 70}}), iconTransformation(extent = {{100, 50}, {120, 70}})));
  Modelica.Blocks.Interfaces.RealOutput thetaRad annotation (
    Placement(transformation(extent = {{100, -70}, {120, -50}}), iconTransformation(extent = {{100, -70}, {120, -50}})));
  Modelica.Blocks.Continuous.Integrator integrator annotation (
    Placement(transformation(extent = {{-4, -50}, {16, -30}})));
  Modelica.Blocks.Interfaces.RealInput u[3] annotation (
    Placement(visible = true, transformation(extent = {{-180, -20}, {-140, 20}}, rotation = 0), iconTransformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = fMax, uMin = fMin) annotation (
    Placement(transformation(extent = {{-56, 34}, {-76, 54}})));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter(Rising = maxSlew) annotation (
    Placement(transformation(extent = {{18, 30}, {38, 50}})));
  ToPark toPark(p = 1) annotation (
    Placement(transformation(extent = {{-122, -16}, {-102, 4}})));
  VarAvg varAvg(fMin = fMin) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-74, 0})));
  Mod mod annotation (
    Placement(transformation(extent = {{32, -50}, {52, -30}})));
equation
  connect(toRad.u, PIcontr.y) annotation (
    Line(points = {{-16, 40}, {-22, 40}, {-22, 0}, {-31, 0}}, color = {0, 0, 127}));
  connect(filter.y, fHz) annotation (
    Line(points = {{73, 40}, {92, 40}, {92, 60}, {110, 60}}, color = {0, 0, 127}));
  connect(integrator.u, PIcontr.y) annotation (
    Line(points = {{-6, -40}, {-22, -40}, {-22, 0}, {-31, 0}}, color = {0, 0, 127}));
  connect(limiter.u, fHz) annotation (
    Line(points = {{-54, 44}, {-40, 44}, {-40, 60}, {110, 60}}, color = {0, 0, 127}));
  connect(slewRateLimiter.y, filter.u) annotation (
    Line(points = {{39, 40}, {50, 40}}, color = {0, 0, 127}));
  connect(slewRateLimiter.u, toRad.y) annotation (
    Line(points = {{16, 40}, {7, 40}}, color = {0, 0, 127}));
  connect(toPark.X, u) annotation (
    Line(points = {{-124, -6}, {-142, -6}, {-142, 0}, {-160, 0}}, color = {0, 0, 127}));
  connect(toPark.phi, thetaRad) annotation (
    Line(points = {{-112, -17.8}, {-112, -60}, {110, -60}}, color = {0, 0, 127}));
  connect(integrator.y, mod.u) annotation (
    Line(points = {{17, -40}, {30, -40}}, color = {0, 0, 127}));
  connect(mod.y, thetaRad) annotation (
    Line(points = {{53, -40}, {92, -40}, {92, -60}, {110, -60}}, color = {0, 0, 127}));
  connect(limiter.y, varAvg.f) annotation (
    Line(points = {{-77, 44}, {-92, 44}, {-92, -6}, {-85.8, -6}}, color = {0, 0, 127}));
  connect(varAvg.u, toPark.y[2]) annotation (
    Line(points = {{-86, 6}, {-96, 6}, {-96, -5.75}, {-101, -5.75}}, color = {0, 0, 127}));
  connect(varAvg.y, PIcontr.u) annotation (
    Line(points = {{-63, 0}, {-54, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics={  Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, extent = {{-100, 20}, {100, -20}}, textString = "PLL"), Text(origin = {1.0297, -10.4}, lineColor = {0, 0, 255}, extent = {{-105.03, 156.4}, {98.9703, 122.4}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -80}, {100, 80}}, initialScale = 0.1)),
    Documentation(info = "<html><head></head><body><div><font size=\"5\">A phase locked loop (PLL) can track the phase and frequency of an ac circuit.</font></div><div><font size=\"5\">This PLL containes a moving average to avoid the effects of harmonics on the PLL behaviour.&nbsp;</font></div></body></html>"));
end PLL;
