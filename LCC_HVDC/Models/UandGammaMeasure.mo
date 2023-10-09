within LCC_HVDC.Models;
model UandGammaMeasure "Measures gamma and commutation angle"
  import Modelica.Constants.pi;
  Boolean off;
  Real toff "The moment at which thyristor turns off and voltage becomes negative";
  Real tp "The moment at which thyristor voltage becomes positive after recovering its blocking capibility";
  Real tg "Time difference between toff and tp- extinction interval";
  Real tf "The moment at which a new thyristor is fired and commutation starts";
  Real tu "Time difference between toff and  tf- Commutation period";
  parameter Modelica.Units.SI.Voltage vThyMax "Peak line-to-line voltage applied to bridge";
  parameter Modelica.Units.SI.Resistance Roff "Thyristor backward resistance";

  Modelica.Blocks.Interfaces.RealInput iThy annotation (
    Placement(transformation(extent = {{-130, -70}, {-94, -34}}), iconTransformation(extent = {{-130, -70}, {-94, -34}})));
  Modelica.Blocks.Interfaces.RealOutput gamma "Extinction angle" annotation (
    Placement(transformation(extent = {{100, 20}, {132, 52}}), iconTransformation(extent = {{100, 20}, {132, 52}})));
  Modelica.Blocks.Sources.RealExpression expression(y = tg) annotation (
    Placement(transformation(extent = {{-11, -9}, {11, 9}}, rotation = 0, origin = {-57, 41})));
  Modelica.Blocks.Math.Gain toRadian(each k = 2*pi*50) annotation (
    Placement(transformation(extent = {{30, 28}, {44, 42}})));
  Modelica.Blocks.Math.Gain toDegree(each k = 180/pi) annotation (
    Placement(transformation(extent = {{54, 28}, {68, 42}})));
  Modelica.Blocks.Math.Mean mean(each f = 50) annotation (
    Placement(transformation(extent = {{2, 26}, {20, 44}})));
  Modelica.Blocks.Math.Max max annotation (
    Placement(transformation(extent = {{-30, 26}, {-12, 44}})));
  Modelica.Blocks.Sources.Constant PositiveGM(each k = 0) annotation (
    Placement(visible = true, transformation(origin = {-58, 16}, extent = {{8, -8}, {-8, 8}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression expression1(y = tu) annotation (
    Placement(transformation(extent = {{-11, -9}, {11, 9}}, rotation = 0, origin = {-59, -27})));
  Modelica.Blocks.Math.Gain toRadian1(each k = 2*pi*50) annotation (
    Placement(transformation(extent = {{28, -40}, {42, -26}})));
  Modelica.Blocks.Math.Gain toDegree1(each k = 180/pi) annotation (
    Placement(transformation(extent = {{52, -40}, {66, -26}})));
  Modelica.Blocks.Math.Mean mean1(each f = 50) annotation (
    Placement(transformation(extent = {{0, -42}, {18, -24}})));
  Modelica.Blocks.Math.Max max1 annotation (
    Placement(transformation(extent = {{-32, -42}, {-14, -24}})));
  Modelica.Blocks.Sources.Constant PositiveU(each k = 0) annotation (
    Placement(visible = true, transformation(origin = {-60, -52}, extent = {{8, -8}, {-8, 8}}, rotation = 180)));
  Modelica.Blocks.Interfaces.BooleanInput pThy "firing pulse" annotation (
    Placement(visible = true, transformation(origin = {-110, 28}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-112, 52}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput uangle "Commutation angle" annotation (
    Placement(transformation(extent = {{100, -50}, {132, -18}}), iconTransformation(extent = {{100, -44}, {132, -12}})));
equation

algorithm
  // when iThy < iThyOff then off==true.

  // iThyOff is obtained by:-vThyMax/(2*Roff) and then rounding it towards infinity by keeping only the N decimal parts. N is the order of magnitude of vThyMax/(2*Roff).

  // For example, if -vThyMax/(2*Roff) equals -0.146, it will be truncated to -0.1 and it will be considered as the iThymax.

  when (iThy < (ceil((-vThyMax/(2*Roff))*10^(-floor(log10((vThyMax/(2*Roff))))))/10^(-floor(log10((vThyMax/(2*Roff)))))))
       then
    if pThy == true then
      off := true;
      toff := time;
    end if;
  end when;
  when (iThy > 0 and off == true) then
    tp := time;
    off := false;
  end when;
  tg := tp - toff;
  when (pThy == true) then
    tf := time;
  end when;
  tu := toff - tf;
equation
  connect(toRadian.y, toDegree.u) annotation (
    Line(points = {{44.7, 35}, {52.6, 35}}, color = {0, 0, 127}));
  connect(toDegree.y, gamma) annotation (
    Line(points = {{68.7, 35}, {96, 35}, {96, 36}, {116, 36}}, color = {0, 0, 127}));
  connect(PositiveGM.y, max.u2) annotation (
    Line(points = {{-49.2, 16}, {-38, 16}, {-38, 29.6}, {-31.8, 29.6}}, color = {0, 0, 127}));
  connect(expression.y, max.u1) annotation (
    Line(points = {{-44.9, 41}, {-44.9, 40.4}, {-31.8, 40.4}}, color = {0, 0, 127}));
  connect(max.y, mean.u) annotation (
    Line(points = {{-11.1, 35}, {0.2, 35}}, color = {0, 0, 127}));
  connect(mean.y, toRadian.u) annotation (
    Line(points = {{20.9, 35}, {28.6, 35}}, color = {0, 0, 127}));
  connect(toRadian1.y, toDegree1.u) annotation (
    Line(points = {{42.7, -33}, {50.6, -33}}, color = {0, 0, 127}));
  connect(PositiveU.y, max1.u2) annotation (
    Line(points = {{-51.2, -52}, {-40, -52}, {-40, -38.4}, {-33.8, -38.4}}, color = {0, 0, 127}));
  connect(expression1.y, max1.u1) annotation (
    Line(points = {{-46.9, -27}, {-46.9, -27.6}, {-33.8, -27.6}}, color = {0, 0, 127}));
  connect(max1.y, mean1.u) annotation (
    Line(points = {{-13.1, -33}, {-1.8, -33}}, color = {0, 0, 127}));
  connect(mean1.y, toRadian1.u) annotation (
    Line(points = {{18.9, -33}, {26.6, -33}}, color = {0, 0, 127}));
  connect(toDegree1.y,uangle)  annotation (
    Line(points = {{66.7, -33}, {66.7, -34}, {116, -34}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{-54, -48}, {-54, -24}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier), Line(points = {{-68, -24}, {-68, -48}, {-54, -46}, {-54, -44}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier), Ellipse(extent = {{-28, 48}, {68, -48}}, lineColor = {0, 0, 0}, lineThickness = 0.5), Ellipse(extent = {{8, 12}, {34, -14}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{-8, 36}, {42, -38}, {50, -32}, {-8, 36}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-28, 0}, {-14, -2}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Line(points = {{-70, 40}, {-64, 50}, {-54, -6}, {-72, -6}, {-46, 46}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier), Text(extent = {{-114, 152}, {116, 110}}, lineColor = {0, 0, 255}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -80}, {100, 60}})),
    Documentation(info="<html><head></head><body><div style=\"text-align: left;\"><font size=\"5\">Due to the presence of commutation reactance, the turning-off process of one thyristor in LCC converters overlaps the turning-on process of the other one in natural commutation order. This period is known as commutation angle (u).</font></div><div style=\"text-align: left;\"><font size=\"5\"><br></font></div><div style=\"text-align: left;\"><font size=\"5\">In inverter mode operation of LCC, the duration between the moments at which thyristor voltage becomes negative and the voltage becomes again positive is called extinction angle or gamma (ɣ). A safe operation of inverter needs gamma to be larger than a minimum to ensure that thyristor recovers its blocking ability. Otherwise, when the thyristor is expected to become turned off, it starts conducting again which results in commutation failure.</font></div><div style=\"text-align: left;\"><font size=\"5\"><br></font></div><div style=\"text-align: left;\"><font size=\"5\">This block caculates commutation time accordign to the following equation:</font></div><div style=\"text-align: left;\">
    <pre style=\"margin-top: 0px; margin-bottom: 0px;\"><font face=\"-webkit-standard\" size=\"5\"><span style=\"white-space: normal;\">tu = toff - tf&nbsp;</span></font></pre><pre style=\"margin-top: 0px; margin-bottom: 0px;\"><font size=\"5\"><span style=\"white-space: normal; font-family: -webkit-standard;\">in which t</span><sub style=\"white-space: normal; font-family: -webkit-standard;\">u </sub><span style=\"white-space: normal; font-family: -webkit-standard;\">is the commutation time, t</span><sub style=\"white-space: normal; font-family: -webkit-standard;\">off</sub><span style=\"white-space: normal; font-family: -webkit-standard;\">&nbsp;is the moment at which thyristor turns off and voltage becomes negative and t<sub>f</sub>&nbsp;is the moment at which a new thyristor is fired and commutation starts.</span></font></pre><pre style=\"margin-top: 0px; margin-bottom: 0px;\"><span style=\"white-space: normal; font-family: -webkit-standard;\"><font size=\"5\"><br></font></span></pre><pre style=\"margin-top: 0px; margin-bottom: 0px;\"><span style=\"white-space: normal; font-family: -webkit-standard;\"><font size=\"5\">The cacculation of extinction time is based on:</font></span></pre><pre style=\"margin-top: 0px; margin-bottom: 0px;\"><span style=\"white-space: normal; font-family: -webkit-standard;\"><font size=\"5\">tg = tp - toff</font></span></pre><pre style=\"margin-top: 0px; margin-bottom: 0px;\"><span style=\"white-space: normal; font-family: -webkit-standard;\"><font size=\"5\">where t<sub>p</sub>&nbsp;is the moment at which thyristor voltage becomes positive after recovering its blocking capibility.</font></span></pre><pre style=\"margin-top: 0px; margin-bottom: 0px;\"><span style=\"white-space: normal; font-family: -webkit-standard;\"><font size=\"5\"><br></font></span></pre><pre style=\"margin-top: 0px; margin-bottom: 0px;\"><span style=\"white-space: normal; font-family: -webkit-standard;\"><font size=\"5\">The figure in the below shows the explained timings.</font></span></pre><pre style=\"margin-top: 0px; margin-bottom: 0px;\"><span style=\"white-space: normal; font-family: -webkit-standard;\"> <img src=\"modelica://LCC_HVDC/Resources/Images/gamma and U measuring.png\" alt=\"gamma and U measuring\"><br></span></pre></div></body></html>"));
end UandGammaMeasure;
