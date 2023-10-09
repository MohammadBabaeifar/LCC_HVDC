within LCC_HVDC.Models;
model Bridge
  import Modelica.Electrical.Analog.Ideal;
  parameter Integer n = 1 "Number of thyristors in series per valve";
  parameter Boolean iniOff[6] = fill(true, 6);
  parameter Modelica.Units.SI.Resistance Ron = 1e-5 "Thyristor forward resistance";
  parameter Modelica.Units.SI.Conductance Goff = 1e-5 "Thyristor backward conductance";
  parameter Modelica.Units.SI.Voltage Vknee = 0.8 "Thyristor knee voltage";
  parameter Modelica.Units.SI.Voltage vThyMax = (207.7e3)*(sqrt(2)) "Peak line-to-line voltage applied to bridge";

  Real Vrs = pin1.v - pin2.v;
  Real Vrt = pin1.v - pin3.v;
  Real Vst = pin2.v - pin3.v;
  Real Vsr = pin2.v - pin1.v;
  Real Vtr = pin3.v - pin1.v;
  Real Vts = pin3.v - pin2.v;
  Ideal.IdealThyristor thyristor1(Ron = n*Ron, Goff = Goff/n, Vknee = n*Vknee, off(start = iniOff[1], fixed = true)) annotation (
    Placement(visible = true, transformation(origin = {-60, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Ideal.IdealThyristor thyristor3(Ron = n*Ron, Goff = Goff/n, Vknee = n*Vknee, off(fixed = true, start = iniOff[3])) annotation (
    Placement(visible = true, transformation(origin = {-20, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Ideal.IdealThyristor thyristor5(Ron = n*Ron, Goff = Goff/n, Vknee = n*Vknee, off(start = iniOff[5])) annotation (
    Placement(visible = true, transformation(origin = {18, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Ideal.IdealThyristor thyristor4(Ron = n*Ron, Goff = Goff/n, Vknee = n*Vknee, off(start = iniOff[4], fixed = true)) annotation (
    Placement(visible = true, transformation(origin = {-60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Ideal.IdealThyristor thyristor6(Ron = n*Ron, Goff = n*Goff, Vknee = n*Vknee, off(start = iniOff[6], fixed = true)) annotation (
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Ideal.IdealThyristor thyristor2(Ron = n*Ron, Goff = Goff/n, Vknee = n*Vknee, off(fixed = true, start = iniOff[2])) annotation (
    Placement(visible = true, transformation(origin = {18, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.BooleanExpression f1(y = P[2]) annotation (
    Placement(visible = true, transformation(extent = {{-102, 38}, {-84, 58}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression f5(y = P[4]) annotation (
    Placement(visible = true, transformation(extent = {{-102, 66}, {-84, 86}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression f3(y = P[6]) annotation (
    Placement(visible = true, transformation(extent = {{-102, 52}, {-84, 72}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression f2(y = P[1]) annotation (
    Placement(visible = true, transformation(extent = {{-102, -24}, {-84, -4}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression f6(y = P[3]) annotation (
    Placement(visible = true, transformation(extent = {{-102, -40}, {-84, -20}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression f4(y = P[5]) annotation (
    Placement(visible = true, transformation(origin = {-93, -46}, extent = {{-9, -10}, {9, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression thyristorCurrent(y=thyristor1.i)
    annotation (Placement(visible=true, transformation(
        origin={107,18},
        extent={{-11,-10},{11,10}},
        rotation=180)));
  Modelica.Blocks.Sources.BooleanExpression thyristorPulse(y = f3.y) annotation (
    Placement(visible = true, transformation(origin = {106.75, 1.75}, extent = {{-11.25, -10.25}, {11.25, 10.25}}, rotation = 180)));
  Modelica.Electrical.Analog.Interfaces.Pin pin1 annotation (
    Placement(visible = true, transformation(origin = {-130, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-108, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin pin2 annotation (
    Placement(visible = true, transformation(origin = {-130, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin pin3 annotation (
    Placement(visible = true, transformation(origin = {-130, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-108, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput P[6] "cathode-related firing signals" annotation (
    Placement(visible = true, transformation(origin = {-26, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {114, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 180)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation (
    Placement(visible = true, transformation(origin = {150, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation (
    Placement(visible = true, transformation(origin = {150, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput gammaAngle annotation (Placement(
      visible=true,
      transformation(
        origin={156,74},
        extent={{-18,-18},{18,18}},
        rotation=0),
      iconTransformation(
        extent={{-18,-18},{18,18}},
        origin={-62,118},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealOutput uAngle annotation (Placement(
      visible=true,
      transformation(
        origin={156,-98},
        extent={{-18,-18},{18,18}},
        rotation=0),
      iconTransformation(
        extent={{-18,-18},{18,18}},
        origin={62,118},
        rotation=90)));
  UandGammaMeasure uandGammaMeasure(vThyMax=vThyMax, Roff=1/Goff)
    annotation (Placement(transformation(extent={{94,-44},{122,-16}})));
equation
  connect(thyristor4.p,thyristor6. p) annotation (
    Line(points = {{-60, -80}, {-20, -80}}, color = {0, 0, 255}));
  connect(thyristor6.p,thyristor2. p) annotation (
    Line(points = {{-20, -80}, {18, -80}}, color = {0, 0, 255}));
  connect(f1.y,thyristor1. fire) annotation (
    Line(points = {{-83.1, 48}, {-72, 48}, {-72, 38}}, color = {255, 0, 255}));
  connect(f3.y,thyristor3. fire) annotation (
    Line(points = {{-83.1, 62}, {-32, 62}, {-32, 38}}, color = {255, 0, 255}));
  connect(f5.y,thyristor5. fire) annotation (
    Line(points = {{-83.1, 76}, {6, 76}, {6, 38}}, color = {255, 0, 255}));
  connect(thyristor4.fire, f4.y) annotation (
    Line(points = {{-72, -60}, {-78, -60}, {-78, -46}, {-83.1, -46}}, color = {255, 0, 255}));
  connect(f6.y,thyristor6. fire) annotation (
    Line(points = {{-83.1, -30}, {-32, -30}, {-32, -60}}, color = {255, 0, 255}));
  connect(f2.y,thyristor2. fire) annotation (
    Line(points = {{-83.1, -14}, {6, -14}, {6, -60}}, color = {255, 0, 255}));
  connect(pin_n,thyristor2. p) annotation (
    Line(points = {{150, -54}, {42, -54}, {42, -80}, {18, -80}}, color = {0, 0, 255}));
  connect(pin_p, pin_p) annotation (
    Line(points={{150,26},{150,26}},      color = {0, 0, 255}));
  connect(pin1,thyristor1. p) annotation (
    Line(points = {{-130, 26}, {-130, 12}, {-60, 12}, {-60, 18}}, color = {0, 0, 255}));
  connect(pin2,thyristor3. p) annotation (
    Line(points = {{-130, -14}, {-130, 4}, {-20, 4}, {-20, 18}}, color = {0, 0, 255}));
  connect(pin3,thyristor5. p) annotation (
    Line(points = {{-130, -54}, {-118, -54}, {-118, -4}, {18, -4}, {18, 18}}, color = {0, 0, 255}));
  connect(thyristor6.n,thyristor3. p) annotation (
    Line(points = {{-20, -60}, {-20, 18}}, color = {0, 0, 255}));
  connect(thyristor4.n,thyristor1. p) annotation (
    Line(points = {{-60, -60}, {-60, 18}}, color = {0, 0, 255}));
  connect(thyristor2.n,thyristor5. p) annotation (
    Line(points = {{18, -60}, {18, 18}}, color = {0, 0, 255}));
  connect(thyristor1.n,thyristor3. n) annotation (
    Line(points = {{-60, 38}, {-60, 68}, {-20, 68}, {-20, 38}}, color = {0, 0, 255}));
  connect(thyristor3.n,thyristor5. n) annotation (
    Line(points = {{-20, 38}, {-20, 68}, {18, 68}, {18, 38}}, color = {0, 0, 255}));
  connect(pin_p,thyristor5. n) annotation (
    Line(points = {{150, 26}, {42, 26}, {42, 68}, {18, 68}, {18, 38}}, color = {0, 0, 255}));
  connect(thyristorPulse.y, uandGammaMeasure.pThy) annotation (Line(points=
          {{94.375,1.75},{80,1.75},{80,-22.72},{92.32,-22.72}}, color={255,
          0,255}));
  connect(thyristorCurrent.y, uandGammaMeasure.iThy) annotation (Line(
        points={{94.9,18},{72,18},{72,-37.28},{92.32,-37.28}}, color={0,0,
          127}));
  connect(uandGammaMeasure.gamma, gammaAngle) annotation (Line(points={{
          124.24,-24.96},{130,-24.96},{130,74},{156,74}}, color={0,0,127}));
  connect(uandGammaMeasure.uangle, uAngle) annotation (Line(points={{124.24,
          -33.92},{130,-33.92},{130,-98},{156,-98}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, 100}, {160, -140}})),
    experiment(StopTime = 0.6, StartTime = 0, Tolerance = 1e-06, Interval = 2.4e-05),
    Documentation(info = "<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>This bridge is similar to that of Modelica Standard Library (MSL), but it was necessary to introduce it because simulations with non-zero commutation inductance in that bridge did not work. 
This bridge also contains a measuring component for commutation and extinction angles.
By default, the SCRs all start from offstatus. From the outside however, you can force some of them on, e.g. when you want to give as an initial condition a current value in the output inductance to reduce the length of transients.</p>
</body>
</html>",
      revisions = "<html>
    <p><b>Release Notes:</b></p>
    <ul>
    <li><i>Mai 7, 2004   </i>
         by Anton Haumer<br> realized<br>
         </li>
    </ul>
    </html>"),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Polygon(points = {{0, 34}, {-36, -34}, {36, -34}, {0, 34}}), Line(origin = {0.688, 33.4986}, points = {{-41, 0}, {41, 0}, {41, 0}}), Line(origin = {28.5, 2}, points = {{-12.5, 0}, {13.5, 0}, {11.5, 0}}), Text(textColor = {0, 0, 255}, extent = {{-110, -106}, {106, -136}}, textString = "%name"), Line(points = {{0, 62}, {0, -66}})}));
end Bridge;
