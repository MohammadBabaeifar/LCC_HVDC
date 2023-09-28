package LCC_HVDC
extends Modelica.Icons.Package;
  package Models
    extends Modelica.Icons.Package;
    model ReferenceInfo
      extends Modelica.Icons.Information;
    equation

      annotation (
        Icon(coordinateSystem(extent = {{-100, -100}, {90, 100}})),
        Documentation(info=
              "<html><head></head><body><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><div><font face=\"MS Serif\">[1] The MathWorks, Inc. (2021). MATLAB version: 9.11.0 (R2021b).&nbsp;</font><span style=\"font-family: 'MS Serif';\">Accessed: March 22, 2023. Available: https://www.mathworks.com.</span></div><div><font face=\"MS Serif\"><br></font></div><div><font face=\"MS Serif\">[2]&nbsp;M. Babaeifar, S. Barsali, and M. Ceraolo, “</font><span style=\"font-family: 'MS Serif';\">Simulation of Sapei HVDC&nbsp;</span><span style=\"font-family: 'MS Serif';\">Using Modelica Language</span><span style=\"font-family: 'MS Serif';\">” in 2023&nbsp;</span><span style=\"font-family: 'MS Serif';\">AEIT HVDC International Conference (AEIT HVDC), Rome, Italy: IEEE,&nbsp;</span><span style=\"font-family: 'MS Serif';\">May 2023, pp. 1–6.</span></div><div><font face=\"MS Serif\"><br></font></div><div><font face=\"MS Serif\"><div>[3] Performance of high-voltage direct current (HVDC) systems with line commutated converters. Part 1, Steady-state conditions. London: British Standards Institution, 2020.</div><div><br></div><div>[4]&nbsp;R. Marconato, Electric power systems, 2. 2nd ed. Milan: CEI, 2002.</div><div><br></div><div><br></div></font></div></blockquote><div><br></div></body></html>"));
    end ReferenceInfo;

    model RampsGeneratorY
      import Modelica.Constants.pi;
      Modelica.Blocks.Interfaces.RealInput omega_t[6] annotation (
        Placement(transformation(extent = {{-138, -20}, {-98, 20}}), iconTransformation(extent = {{-138, -20}, {-98, 20}})));
      Modelica.Blocks.Math.Add add[6] annotation (
        Placement(transformation(extent = {{-32, -16}, {0, 16}})));
      Modelica.Blocks.Math.Gain radToDegree[6](k = fill(180/pi, 6)) annotation (
        Placement(transformation(extent = {{54, -10}, {74, 10}})));
      Modelica.Blocks.Sources.Constant phase1[6](k = {pi/6, pi/2, 5*pi/6, 7*pi/6, 9*pi/6, 11*pi/6}) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-82, -50})));
      Mod mod[6] annotation (
        Placement(transformation(extent = {{18, -10}, {38, 10}})));
      Modelica.Blocks.Interfaces.RealOutput ramps[6] annotation (
        Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -14}, {126, 12}})));
    equation
      connect(radToDegree.y,ramps)  annotation (
        Line(points = {{75, 0}, {110, 0}}, color = {0, 0, 127}));
      connect(phase1.y, add.u2) annotation (
        Line(points = {{-71, -50}, {-68, -50}, {-68, -10}, {-35.2, -10}, {-35.2, -9.6}}, color = {0, 0, 127}));
      connect(omega_t, add.u1) annotation (
        Line(points = {{-118, 0}, {-82, 0}, {-82, 9.6}, {-35.2, 9.6}}, color = {0, 0, 127}));
      connect(mod.y,radToDegree. u) annotation (
        Line(points = {{39, 0}, {52, 0}}, color = {0, 0, 127}));
      connect(mod.u, add.y) annotation (
        Line(points = {{16, 0}, {1.6, 0}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-21.0429, 122.25}, textColor = {0, 0, 227}, extent = {{-66.9571, 23.75}, {127.043, -14.25}}, textString = "%name"), Line(points = {{-60, -20}, {-20, 20}, {-20, -20}, {20, 20}, {20, -20}, {60, 20}, {60, -20}}, color = {0, 0, 239}, thickness = 0.5)}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -80}, {100, 40}})),
        Documentation(info = "<html><head></head><body><font size=\"5\">This block generates a set of 6 ramps from the input wt. There is a 60-degrees phase difference among them. These ramps can be used to generate pulses. This ramp generator leads the set of ramps by 30 degrees with respect to its input phase (wt).</font><div><font size=\"5\">&nbsp;<a href=\"modelica://HVDC.Models.ReferenceInfo\">[MATLAB-Simulink]</a>:</font><p></p>
<div><div><br></div></div></div></body></html>"));
    end RampsGeneratorY;

    model RampsGeneratorD02
      import Modelica.Constants.pi;
      Modelica.Blocks.Interfaces.RealInput omega_t[6] annotation (
        Placement(transformation(extent = {{-138, -20}, {-98, 20}}), iconTransformation(extent = {{-138, -20}, {-98, 20}})));
      Modelica.Blocks.Math.Add add[6] annotation (
        Placement(transformation(extent = {{-32, -16}, {0, 16}})));
      Modelica.Blocks.Math.Gain radToDegree[6](k = fill(180/pi, 6)) annotation (
        Placement(transformation(extent = {{54, -10}, {74, 10}})));
      Modelica.Blocks.Sources.Constant phase1[6](k = {0, pi/3, 2*pi/3, pi, 4*pi/3, 5*pi/3}) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-86, -50})));
      Mod mod[6] annotation (
        Placement(transformation(extent = {{18, -10}, {38, 10}})));
      Modelica.Blocks.Interfaces.RealOutput ramps[6] annotation (
        Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -12}, {126, 14}})));
    equation
      connect(radToDegree.y,ramps)  annotation (
        Line(points = {{75, 0}, {110, 0}}, color = {0, 0, 127}));
      connect(phase1.y, add.u2) annotation (
        Line(points = {{-75, -50}, {-72, -50}, {-72, -10}, {-35.2, -10}, {-35.2, -9.6}}, color = {0, 0, 127}));
      connect(omega_t, add.u1) annotation (
        Line(points = {{-118, 0}, {-82, 0}, {-82, 9.6}, {-35.2, 9.6}}, color = {0, 0, 127}));
      connect(mod.u, add.y) annotation (
        Line(points = {{16, 0}, {1.6, 0}}, color = {0, 0, 127}));
      connect(mod.y,radToDegree. u) annotation (
        Line(points = {{39, 0}, {52, 0}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{-60, -20}, {-20, 20}, {-20, -20}, {20, 20}, {20, -20}, {60, 20}, {60, -20}}, color = {0, 0, 239}, thickness = 0.5), Text(origin = {-24, 122.5}, textColor = {0, 0, 227}, extent = {{-76, 28}, {144, -16}}, textString = "%name")}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -80}, {100, 40}})),
        Documentation(info = "<html><head></head><body><span style=\"font-family: 'MS Shell Dlg 2'; font-size: 12px;\">T</span><font size=\"5\"><span style=\"font-family: 'MS Shell Dlg 2';\">his block generates a set of 6 ramps from the input wt. There is 60 degrees phase difference among them. These ramps can be used to generate pulses.&nbsp;<br></span>
<a href=\"modelica://HVDC.Models.ReferenceInfo\">[MATLAB-Simulink]</a>:</font><p></p></body></html>"));
    end RampsGeneratorD02;

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
</html>", revisions = "<html>
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

    model IdcController
      import Modelica.Constants.pi;
      parameter Modelica.Units.SI.Time Ti = 0.001 "integral time constant";
      parameter Modelica.Units.SI.Time Td = 0 "derivative time constant";
      parameter Real k = 10 "proportional gain";
      parameter Real yMin = -0.96 "Min PI output";
      parameter Real yMax = 0.998 "Max PI output";
      parameter Real uMin = 801 "Min of Vdc limiter";
      parameter Real uMax = 1035 "Max of Vdc limiter";
      parameter Real y_start = 0.1 "Initial value of PI output";
      parameter Real IdcBase = 240 "Idc base";
      Modelica.Blocks.Math.Gain perunit1(k = 1/IdcBase) annotation (
        Placement(visible = true, transformation(origin = {-7, 9}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Modelica.Blocks.Continuous.LimPID PI(Ni = 0.1, Td = Td, Ti = Ti, controllerType = Modelica.Blocks.Types.SimpleController.PI, homotopyType = Modelica.Blocks.Types.LimiterHomotopy.NoHomotopy, initType = Modelica.Blocks.Types.Init.InitialOutput, k = k, limiter(u(start = 0)), yMax = yMax, yMin = yMin, y_start = y_start) annotation (
        Placement(visible = true, transformation(origin = {18, 36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Math.Acos acos annotation (
        Placement(visible = true, transformation(origin = {50, 36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Gain perunit(k = 1/IdcBase) annotation (
        Placement(visible = true, transformation(origin = {-6, 36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput pref annotation (Placement(
          visible=true,
          transformation(
            origin={-84,40},
            extent={{-10,-10},{10,10}},
            rotation=0),
          iconTransformation(
            origin={-111,57},
            extent={{-15,-15},{15,15}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealInput vdc annotation (
        Placement(visible = true, transformation(origin = {-89, 1}, extent = {{-11, -11}, {11, 11}}, rotation = 0), iconTransformation(origin = {-110, -8}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput alpha "degree" annotation (
          Placement(
          visible=true,
          transformation(
            origin={98,36},
            extent={{-10,-10},{10,10}},
            rotation=0),
          iconTransformation(
            origin={114,2},
            extent={{-16,-16},{16,16}},
            rotation=0)));
      Modelica.Blocks.Math.Abs abs1 annotation (
        Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 0, origin = {-67, 1})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax = uMax, uMin = uMin) annotation (
        Placement(transformation(extent = {{-54, -6}, {-40, 8}})));
      Modelica.Blocks.Math.Division division annotation (
        Placement(transformation(extent = {{-30, 30}, {-18, 42}})));
      Modelica.Blocks.Interfaces.RealInput idc annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-90, -22}), iconTransformation(extent = {{-124, -80}, {-96, -52}})));
      Modelica.Blocks.Math.Gain toDegree(k=180/pi) annotation (Placement(
            visible=true, transformation(
            origin={70,36},
            extent={{-4,-4},{4,4}},
            rotation=0)));
    equation
      connect(acos.u, PI.y) annotation (
        Line(points = {{42.8, 36}, {26.8, 36}}, color = {0, 0, 127}));
      connect(perunit1.y, PI.u_m) annotation (
        Line(points = {{-1.5, 9}, {18, 9}, {18, 26.4}}, color = {0, 0, 127}));
      connect(abs1.u,vdc)  annotation (
        Line(points = {{-75.4, 1}, {-89, 1}}, color = {0, 0, 127}));
      connect(limiter.u, abs1.y) annotation (
        Line(points = {{-55.4, 1}, {-59.3, 1}}, color = {0, 0, 127}));
      connect(limiter.y, division.u2) annotation (
        Line(points = {{-39.3, 1}, {-36, 1}, {-36, 32.4}, {-31.2, 32.4}}, color = {0, 0, 127}));
      connect(pref, division.u1) annotation (Line(points={{-84,40},{-56,40},{-56,
              39.6},{-31.2,39.6}}, color={0,0,127}));
      connect(perunit.u, division.y) annotation (
        Line(points = {{-13.2, 36}, {-17.4, 36}}, color = {0, 0, 127}));
      connect(perunit.y, PI.u_s) annotation (
        Line(points = {{0.6, 36}, {8.4, 36}}, color = {0, 0, 127}));
      connect(idc,perunit1. u) annotation (
        Line(points = {{-90, -22}, {-18, -22}, {-18, 9}, {-13, 9}}, color = {0, 0, 127}));
      connect(alpha, alpha)
        annotation (Line(points={{98,36},{98,36}}, color={0,0,127}));
      connect(toDegree.y, alpha)
        annotation (Line(points={{74.4,36},{98,36}}, color={0,0,127}));
      connect(toDegree.u, acos.y)
        annotation (Line(points={{65.2,36},{56.6,36}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent = {{-80, -40}, {100, 60}})),
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(extent = {{-94, 156}, {96, 106}}, textColor = {0, 0, 255}, textString = "%name"), Line(points = {{-24, 46}, {-44, 46}}, color = {0, 0, 0}, thickness = 1), Line(points = {{24, 46}, {44, 46}}, color = {0, 0, 0}, thickness = 1), Line(points = {{44, 46}, {44, -26}, {44, -46}, {24, -46}}, color = {0, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}), Line(points = {{-24, -46}, {-44, -46}, {-44, 46}}, color = {0, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}), Rectangle(extent = {{-24, 58}, {24, 30}}, lineColor = {0, 0, 0}, lineThickness = 1, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-24, -30}, {24, -58}}, lineColor = {0, 0, 0}, lineThickness = 1, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-58, 26}, {58, -20}}, textColor = {0, 0, 163}, textStyle = {TextStyle.Bold}, textString = "idc")}),
        Documentation(info = "<html><head></head><body><font size=\"5\">The controller calculates the reference currrent through division of reference active power (Pref) by the voltage of dc terminals (Vdc). The reference is then compared with feedback of dc current (idc) and the error is sent to a PI controller. The output is alpha (firing angle) which is used as an input for pulse generator.</font></body></html>"));
    end IdcController;

    model VdcController
      import Modelica.Constants.pi;
      parameter Modelica.Units.SI.Time Ti = 0.001 "integral time constant";
      parameter Modelica.Units.SI.Time Td = 0 "derivative time constant";
      parameter Real k = 10 "proportional gain";
      parameter Real yMin = -0.96 "Min PI output";
      parameter Real yMax = 0.998 "Max PI output";
      parameter Real y_start = -0.4 "Initial value of PI output( - for inverter and + for rectifier)";
      parameter Real mode = -1 "Operation mode (-1 for inverter and +1 for rectifier)";
      parameter Real VdcBase = 780 "Vdc base";
      Modelica.Blocks.Math.Gain gain2(k = 1) annotation (
        Placement(visible = true, transformation(origin = {-7, -1}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Modelica.Blocks.Math.Gain operationMode(k = mode) "Inverter/rectifier mode" annotation (
        Placement(visible = true, transformation(origin = {-26, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Continuous.LimPID PI(Ni = 0.1, Td = Td, Ti = Ti, controllerType = Modelica.Blocks.Types.SimpleController.PI, homotopyType = Modelica.Blocks.Types.LimiterHomotopy.NoHomotopy, initType = Modelica.Blocks.Types.Init.InitialOutput, k = k, limiter(u(start = 0)), yMax = yMax, yMin = yMin, y_start = y_start) annotation (
        Placement(visible = true, transformation(origin = {4, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Math.Gain toDegree(k=180/pi) annotation (Placement(
            visible=true, transformation(
            origin={42,20},
            extent={{-4,-4},{4,4}},
            rotation=0)));
      Modelica.Blocks.Math.Acos acos annotation (
        Placement(visible = true, transformation(origin = {26, 20}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
      Modelica.Blocks.Math.Gain perUnit(k = 1/VdcBase) annotation (
        Placement(visible = true, transformation(origin = {-27, -1}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput vdcRef annotation (Placement(
          visible=true,
          transformation(
            origin={-66,20},
            extent={{-12,-12},{12,12}},
            rotation=0),
          iconTransformation(
            origin={-111,49},
            extent={{-17,-17},{17,17}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealInput vdc annotation (
        Placement(visible = true, transformation(origin = {-45, -23}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {-111, -51}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput alpha annotation (
        Placement(visible = true, transformation(origin = {64, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {117, 7}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    equation
      connect(toDegree.u, acos.y)
        annotation (Line(points={{37.2,20},{30.4,20}}, color={0,0,127}));
      connect(operationMode.y, PI.u_s) annotation (
        Line(points = {{-19.4, 20}, {-5.6, 20}}, color = {0, 0, 127}));
      connect(acos.u, PI.y) annotation (
        Line(points = {{21.2, 20}, {12.8, 20}}, color = {0, 0, 127}));
      connect(perUnit.y, gain2.u) annotation (
        Line(points = {{-21.5, -1}, {-13, -1}}, color = {0, 0, 127}));
      connect(gain2.y, PI.u_m) annotation (
        Line(points = {{-1.5, -1}, {4, -1}, {4, 10.4}}, color = {0, 0, 127}));
      connect(vdcRef, operationMode.u)
        annotation (Line(points={{-66,20},{-33.2,20}}, color={0,0,127}));
      connect(perUnit.u,vdc)  annotation (
        Line(points = {{-33, -1}, {-45, -1}, {-45, -23}}, color = {0, 0, 127}));
      connect(alpha, alpha) annotation (
        Line(points={{64,20},{64,20}},      color = {0, 0, 127}));
      connect(toDegree.y, alpha)
        annotation (Line(points={{46.4,20},{64,20}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent = {{-60, -20}, {60, 40}})),
        Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(textColor = {0, 0, 236}, extent = {{-98, 144}, {94, 108}}, textString = "%name"), Line(points = {{-24, 46}, {-44, 46}}, thickness = 1), Line(points = {{24, 46}, {44, 46}}, thickness = 1), Line(points = {{44, 46}, {44, -26}, {44, -46}, {24, -46}}, thickness = 1, arrow = {Arrow.None, Arrow.Open}), Line(points = {{-24, -46}, {-44, -46}, {-44, 46}}, thickness = 1, arrow = {Arrow.None, Arrow.Open}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-24, 58}, {24, 30}}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-24, -30}, {24, -58}}), Text(textColor = {0, 0, 163}, extent = {{-60, 24}, {56, -22}}, textString = "vdc", textStyle = {TextStyle.Bold})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
        Documentation(info = "<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>The reference is then compared with feedback of dc voltage (vdc) and the error is sent to a PI controller. The output is alpha (firing angle) which is used as an input for pulse generator.</p>
</body>
</html>"));
    end VdcController;

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

    model PulseGeneratorY
      import Modelica.Constants.pi;
      parameter Real PulseWidth = 110 "Pulse width";
      parameter Real BlockTime = 0 "Pulse initial blocking time";
      Modelica.Blocks.Logical.GreaterEqual greaterEqual[6] annotation (
        Placement(transformation(extent = {{40, 50}, {64, 74}})));
      Modelica.Blocks.Logical.LessEqual lessEqual[6] annotation (
        Placement(transformation(extent = {{38, -14}, {58, 6}})));
      Modelica.Blocks.Math.Add add1[6] annotation (
        Placement(transformation(extent = {{-10, -56}, {14, -32}})));
      Modelica.Blocks.Logical.And and1[6] annotation (
        Placement(transformation(extent = {{78, -14}, {98, 6}})));
      Modelica.Blocks.Sources.Constant pulseWidth[6](k = fill(PulseWidth, 6)) annotation (
        Placement(visible = true, transformation(origin = {-43, -79}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
      Modelica.Blocks.Logical.Not not1[6] annotation (
        Placement(transformation(extent = {{-128, -60}, {-108, -40}})));
      Modelica.Blocks.Math.BooleanToReal booleanToReal[6] annotation (
        Placement(transformation(extent = {{-98, -60}, {-78, -40}})));
      Models.RampsGeneratorY ramps annotation (
        Placement(transformation(extent = {{-108, 48}, {-82, 74}})));
      Models.SampleHold sampleHold annotation (
        Placement(transformation(extent = {{-56, -58}, {-28, -32}})));
      Modelica.Blocks.Sources.Step blockTime[6](height = fill(-1, 6), offset = fill(1, 6), startTime = fill(BlockTime, 6)) annotation (
        Placement(transformation(extent = {{42, -56}, {62, -36}})));
      Modelica.Blocks.Math.RealToBoolean realToBoolean[6] annotation (
        Placement(transformation(extent = {{80, -56}, {100, -36}})));
      Modelica.Blocks.Logical.Not not2[6] annotation (
        Placement(transformation(extent = {{110, -56}, {130, -36}})));
      Modelica.Blocks.Logical.And and2[6] annotation (
        Placement(transformation(extent = {{110, -14}, {130, 6}})));
      Modelica.Blocks.Interfaces.RealInput wt[6] annotation (Placement(
            transformation(extent={{-170,16},{-130,56}}), iconTransformation(
              extent={{-134,14},{-100,48}})));
      Modelica.Blocks.Interfaces.RealInput firingAngle[6] "Connector of second Real input signal" annotation (
        Placement(transformation(extent = {{-176, -40}, {-136, 0}}), iconTransformation(extent = {{-134, -46}, {-100, -12}})));
      Modelica.Blocks.Interfaces.BooleanOutput y[6] "Pulse" annotation (
        Placement(transformation(extent = {{140, -22}, {176, 14}}), iconTransformation(extent = {{100, -18}, {136, 18}})));
    equation
      connect(not1.u, greaterEqual.y) annotation (
        Line(points = {{-130, -50}, {-134, -50}, {-134, 20}, {65.2, 20}, {65.2, 62}}, color = {255, 0, 255}));
      connect(firingAngle, greaterEqual.u2) annotation (
        Line(points = {{-156, -20}, {-156, -16}, {-148, -16}, {-148, 22}, {28, 22}, {28, 52.4}, {37.6, 52.4}}, color = {0, 0, 127}));
      connect(lessEqual.u1, greaterEqual.u1) annotation (
        Line(points = {{36, -4}, {20, -4}, {20, 62}, {37.6, 62}}, color = {0, 0, 127}));
      connect(greaterEqual.y, and1.u1) annotation (
        Line(points = {{65.2, 62}, {70, 62}, {70, -4}, {76, -4}}, color = {255, 0, 255}));
      connect(add1.y, lessEqual.u2) annotation (
        Line(points = {{15.2, -44}, {20, -44}, {20, -12}, {36, -12}}, color = {0, 0, 127}));
      connect(not1.y, booleanToReal.u) annotation (
        Line(points = {{-107, -50}, {-100, -50}}, color = {255, 0, 255}));
      connect(pulseWidth.y, add1.u2) annotation (
        Line(points = {{-28.7, -79}, {-22, -79}, {-22, -51.2}, {-12.4, -51.2}}, color = {0, 0, 127}));
      connect(lessEqual.y, and1.u2) annotation (
        Line(points = {{59, -4}, {66, -4}, {66, -12}, {76, -12}}, color = {255, 0, 255}));
      connect(booleanToReal.y, sampleHold.u2) annotation (Line(points={{-77,-50},
              {-76,-50},{-76,-50.2},{-58.8,-50.2}}, color={0,0,127}));
      connect(sampleHold.u1, firingAngle) annotation (Line(points={{-58.8,-39.8},
              {-70,-39.8},{-70,-20},{-156,-20}}, color={0,0,127}));
      connect(sampleHold.y, add1.u1) annotation (
        Line(points = {{-25.06, -44.87}, {-20, -44.87}, {-20, -36.8}, {-12.4, -36.8}}, color = {0, 0, 127}));
      connect(blockTime.y, realToBoolean.u) annotation (
        Line(points = {{63, -46}, {78, -46}}, color = {0, 0, 127}));
      connect(and1.y, and2.u1) annotation (
        Line(points = {{99, -4}, {108, -4}}, color = {255, 0, 255}));
      connect(realToBoolean.y, not2.u) annotation (
        Line(points = {{101, -46}, {108, -46}}, color = {255, 0, 255}));
      connect(not2.y, and2.u2) annotation (
        Line(points = {{131, -46}, {136, -46}, {136, -20}, {108, -20}, {108, -12}}, color = {255, 0, 255}));
      connect(and2.y, y) annotation (
        Line(points = {{131, -4}, {158, -4}}, color = {255, 0, 255}));
      connect(wt, ramps.omega_t) annotation (Line(points={{-150,36},{-120,36},{
              -120,61},{-110.34,61}}, color={0,0,127}));
      connect(ramps.ramps, greaterEqual.u1) annotation (
        Line(points = {{-80.31, 60.87}, {-78.4318, 60.87}, {-78.4318, 62}, {37.6, 62}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{-60, -20}, {-20, -20}, {-20, 20}, {20, 20}, {20, -20}, {48, -20}}, thickness = 0.35), Text(origin = {-1.38718, 128.286}, textColor = {0, 0, 255}, extent = {{-134.613, 29.7142}, {141.387, -22.2858}}, textString = "%name"), Line(points = {{-60, 20}, {-60, -20}}, thickness = 0.35), Line(points = {{-88, 20}, {-60, 20}}, thickness = 0.35), Ellipse(lineThickness = 0.35, extent = {{38, 36}, {88, -16}}), Line(origin = {-22, 8.33}, points = {{72, 14}, {86, 0}, {100, 14}}, thickness = 0.35), Line(points = {{64, -8}, {64, 8}}, thickness = 0.35)}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}})),
        Documentation(info = "<html><head></head><body><p><font size=\"5\">This pulse generator receives its input (wt) from a phase locked loop (PLL). Here in HVDC models, the inputs of PLL are provided by a delta or star connection (E.g. Modelica 4.0.0/Electrical/Polyphase/Basic/MultiDelta). The output of delta connection lags its input by 30 degrees. Therefore, this pulse generator applies the pulses to thyristors 30 degrees earlier to compesate the phase shift of the aforementioned delta conncetion.<a href=\"modelica://HVDC.Models.ReferenceInfo\">[See ReferenceInfo: 1]</a></font></p>
</body></html>"));
    end PulseGeneratorY;

    model PulseGeneratorD
      import Modelica.Constants.pi;
      parameter Real PulseWidth = 110 "Pulse width";
      parameter Real BlockTime = 0 "Pulse initial blocking time";
      Modelica.Blocks.Logical.GreaterEqual greaterEqual[6] annotation (
        Placement(transformation(extent = {{40, 48}, {62, 72}})));
      Modelica.Blocks.Logical.LessEqual lessEqual[6] annotation (
        Placement(transformation(extent = {{38, -24}, {60, -2}})));
      Modelica.Blocks.Math.Add add1[6] annotation (
        Placement(transformation(extent = {{-2, -90}, {18, -70}})));
      Modelica.Blocks.Logical.And and1[6] annotation (
        Placement(transformation(extent = {{78, -16}, {96, 2}})));
      Modelica.Blocks.Sources.Constant const[6](k = fill(PulseWidth, 6)) annotation (
        Placement(visible = true, transformation(origin = {-31, -87}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
      Modelica.Blocks.Logical.Not not1[6] annotation (
        Placement(transformation(extent = {{-112, -54}, {-92, -34}})));
      Modelica.Blocks.Math.BooleanToReal booleanToReal[6] annotation (
        Placement(transformation(extent = {{-76, -52}, {-60, -36}})));
      Models.SampleHold sampleHold annotation (
        Placement(transformation(extent = {{-44, -50}, {-24, -30}})));
      Modelica.Blocks.Sources.Step blockTime[6](height = fill(-1, 6), offset = fill(1, 6), startTime = fill(BlockTime, 6)) annotation (
        Placement(transformation(extent = {{40, -66}, {56, -50}})));
      Modelica.Blocks.Math.RealToBoolean realToBoolean[6] annotation (
        Placement(transformation(extent = {{68, -66}, {84, -50}})));
      Modelica.Blocks.Logical.Not not2[6] annotation (
        Placement(transformation(extent = {{94, -66}, {110, -50}})));
      Modelica.Blocks.Logical.And and2[6] annotation (
        Placement(transformation(extent = {{108, -16}, {124, 0}})));
      RampsGeneratorD02 ramps annotation (
        Placement(transformation(extent = {{-114, 50}, {-92, 70}})));
      Modelica.Blocks.Interfaces.RealInput wt[6] annotation (Placement(
            transformation(extent={{-180,16},{-140,56}}), iconTransformation(
              extent={{-134,14},{-100,48}})));
      Modelica.Blocks.Interfaces.RealInput firingAngle[6] "Connector of second Real input signal" annotation (
        Placement(transformation(extent = {{-180, -40}, {-140, 0}}), iconTransformation(extent = {{-134, -42}, {-100, -8}})));
      Modelica.Blocks.Interfaces.BooleanOutput y[6] "Pulse" annotation (
        Placement(transformation(extent = {{140, -22}, {176, 14}}), iconTransformation(extent = {{100, -20}, {136, 16}})));
    equation
      connect(not1.u, greaterEqual.y) annotation (
        Line(points = {{-114, -44}, {-126, -44}, {-126, -24}, {-84, -24}, {-84, 38}, {63.1, 38}, {63.1, 60}}, color = {255, 0, 255}));
      connect(firingAngle, greaterEqual.u2) annotation (
        Line(points = {{-160, -20}, {-100, -20}, {-100, 46}, {-48, 46}, {-48, 50.4}, {37.8, 50.4}}, color = {0, 0, 127}));
      connect(greaterEqual.y, and1.u1) annotation (
        Line(points = {{63.1, 60}, {70, 60}, {70, -7}, {76.2, -7}}, color = {255, 0, 255}));
      connect(add1.y, lessEqual.u2) annotation (
        Line(points = {{19, -80}, {24, -80}, {24, -21.8}, {35.8, -21.8}}, color = {0, 0, 127}));
      connect(not1.y, booleanToReal.u) annotation (
        Line(points = {{-91, -44}, {-77.6, -44}}, color = {255, 0, 255}));
      connect(const.y, add1.u2) annotation (
        Line(points = {{-18.9, -87}, {-12.45, -87}, {-12.45, -86}, {-4, -86}}, color = {0, 0, 127}));
      connect(lessEqual.y, and1.u2) annotation (
        Line(points = {{61.1, -13}, {71.55, -13}, {71.55, -14.2}, {76.2, -14.2}}, color = {255, 0, 255}));
      connect(booleanToReal.y, sampleHold.u2)
        annotation (Line(points={{-59.2,-44},{-46,-44}}, color={0,0,127}));
      connect(sampleHold.u1, firingAngle) annotation (Line(points={{-46,-36},{-58,
              -36},{-58,-20},{-160,-20}}, color={0,0,127}));
      connect(sampleHold.y, add1.u1) annotation (
        Line(points = {{-21.9, -39.9}, {-14, -39.9}, {-14, -74}, {-4, -74}}, color = {0, 0, 127}));
      connect(blockTime.y, realToBoolean.u) annotation (
        Line(points = {{56.8, -58}, {66.4, -58}}, color = {0, 0, 127}));
      connect(and1.y, and2.u1) annotation (
        Line(points = {{96.9, -7}, {96.9, -8}, {106.4, -8}}, color = {255, 0, 255}));
      connect(realToBoolean.y, not2.u) annotation (
        Line(points = {{84.8, -58}, {92.4, -58}}, color = {255, 0, 255}));
      connect(not2.y, and2.u2) annotation (
        Line(points = {{110.8, -58}, {118, -58}, {118, -20}, {102, -20}, {102, -14.4}, {106.4, -14.4}}, color = {255, 0, 255}));
      connect(and2.y, y) annotation (
        Line(points = {{124.8, -8}, {134, -8}, {134, -4}, {158, -4}}, color = {255, 0, 255}));
      connect(lessEqual.u1,ramps.ramps)  annotation (
        Line(points = {{35.8, -13}, {22, -13}, {22, 60.1}, {-90.57, 60.1}}, color = {0, 0, 127}));
      connect(ramps.omega_t, wt) annotation (Line(points={{-115.98,60},{-130,60},
              {-130,36},{-160,36}}, color={0,0,127}));
      connect(ramps.ramps, greaterEqual.u1) annotation (
        Line(points = {{-90.57, 60.1}, {-26.45, 60.1}, {-26.45, 60}, {37.8, 60}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-1.38718, 128.286}, textColor = {0, 0, 255}, extent = {{-134.613, 29.7142}, {141.387, -22.2858}}, textString = "%name"), Line(points = {{-60, -20}, {-20, -20}, {-20, 20}, {20, 20}, {20, -20}, {46, -20}}, thickness = 1), Line(points = {{-60, 20}, {-60, -20}}, thickness = 1), Line(points = {{-84, 20}, {-60, 20}}, thickness = 1), Ellipse(lineThickness = 1, extent = {{44, 32}, {88, -16}}), Polygon(lineThickness = 1, points = {{52, 0}, {80, 0}, {66, 24}, {52, 0}})}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 80}})),
        Documentation(info="<html><head></head><body><p><font face=\"MS shell Dlg 2\" size=\"5\">This pulse generator receives its input (wt) from a phase locked loop (PLL). Here in HVDC models, the inputs of PLL are provided by a delta or star connection (E.g. Modelica 4.0.0/Electrical/Polyphase/Basic/MultiDelta). This pulse generator applies the pulses with 30 degrees delay. It can be used to generate pulses for a bridge which is suppiled by the delta winding of a transformer. This 30 degees delay is required since in the delta winding of YD transformers, the voltage of delta has 30 dgrees lagging with respect to Y.<a href=\"modelica://HVDC.Models.ReferenceInfo\">[See ReferenceInfo]</a></font></p>
</body></html>"));
    end PulseGeneratorD;

    model ThreeWindingTransformer
      parameter Modelica.Units.SI.Inductance L1 = 0.00875 "Primary inductance";
      parameter Modelica.Units.SI.Inductance L2 = 0.09625 "Secondary inductance referred to the primary";
      parameter Modelica.Units.SI.Inductance L3 = 0.09625 "Tertiary inductance referred to the primary";
      parameter Modelica.Units.SI.Resistance R1 = 0.041 "Primary resistance";
      parameter Modelica.Units.SI.Resistance R2 = 0.467 "Secondary resistance referred to the primary";
      parameter Modelica.Units.SI.Resistance R3 = 0.467 "Tertiary resistance referred to the primary";
      parameter Real n12 = (400e3)/(207.7e3) "Transformer ratio: primary to secondary voltage";
      parameter Real n13 = (400e3)/((207.7e3)*sqrt(3)) "Transformer ratio: primary to tertiary voltage";
      Modelica.Electrical.Polyphase.Ideal.IdealTransformer idealTransformer(m = 3, Lm1 = fill(300e3, 3), n = fill(n12, 3)) annotation (
        Placement(transformation(extent = {{18, 54}, {38, 74}})));
      Modelica.Electrical.Polyphase.Basic.Star starT2(m = 3) annotation (
        Placement(transformation(origin = {38, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Polyphase.Ideal.IdealTransformer idealTransformer1(m = 3, Lm1 = fill(300e3, 3), n = fill(n13, 3)) annotation (
        Placement(transformation(extent = {{20, -8}, {40, 12}})));
      Modelica.Electrical.Polyphase.Basic.Star starT3(m = 3) annotation (
        Placement(transformation(origin = {18, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Polyphase.Basic.Delta deltaT2(m = 3) annotation (
        Placement(transformation(origin = {58, 2}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
      Modelica.Electrical.Polyphase.Basic.Inductor tertiaryInductance(L = fill(L3, 3)) "Referred to the primary" annotation (
        Placement(transformation(extent = {{2, 2}, {16, 22}})));
      Modelica.Electrical.Polyphase.Basic.Inductor secondaryInductance(L = fill(L2, 3)) "Referred to the primary" annotation (
        Placement(transformation(extent = {{-4, 64}, {10, 84}})));
      Modelica.Electrical.Polyphase.Basic.Inductor primaryInductance(L = fill(L1, 3)) annotation (
        Placement(transformation(extent = {{-52, 64}, {-38, 84}})));
      Modelica.Electrical.Polyphase.Basic.Resistor secondaryResistance(R = fill(R2, 3)) "Referred to the primary" annotation (
        Placement(transformation(extent = {{-22, 68}, {-10, 80}})));
      Modelica.Electrical.Polyphase.Basic.Resistor tertiaryResistance(R = fill(R3, 3)) "Referred to the primary" annotation (
        Placement(transformation(extent = {{-20, 6}, {-8, 18}})));
      Modelica.Electrical.Polyphase.Basic.Resistor primaryResistnce(R = fill(R1, 3)) annotation (
        Placement(transformation(extent = {{-70, 68}, {-58, 80}})));
      Modelica.Electrical.Polyphase.Interfaces.PositivePlug primary3phase annotation (
        Placement(transformation(extent = {{-92, 62}, {-68, 86}}), iconTransformation(extent = {{-112, -12}, {-88, 12}})));
      Modelica.Electrical.Polyphase.Interfaces.PositivePlug tertiary3phase annotation (
        Placement(transformation(extent = {{68, 0}, {92, 24}}), iconTransformation(extent = {{90, -42}, {114, -18}})));
      Modelica.Electrical.Polyphase.Interfaces.PositivePlug secondary3phase annotation (
        Placement(transformation(extent = {{68, 62}, {92, 86}}), iconTransformation(extent = {{90, 18}, {114, 42}})));
    equation
      connect(starT2.plug_p, idealTransformer.plug_n2) annotation (
        Line(points = {{38, 48}, {38, 54}}, color = {0, 0, 255}));
      connect(idealTransformer1.plug_n1, starT3.plug_p) annotation (
        Line(points = {{20, -8}, {18, -8}, {18, -18}}, color = {0, 0, 255}));
      connect(deltaT2.plug_n, idealTransformer1.plug_n2) annotation (
        Line(points = {{58, -8}, {40, -8}}, color = {0, 0, 255}));
      connect(tertiaryInductance.plug_n, idealTransformer1.plug_p1) annotation (
        Line(points = {{16, 12}, {20, 12}}, color = {0, 0, 255}));
      connect(secondary3phase, idealTransformer.plug_p2) annotation (
        Line(points = {{80, 74}, {38, 74}}, color = {0, 0, 255}));
      connect(idealTransformer1.plug_p2, deltaT2.plug_p) annotation (
        Line(points = {{40, 12}, {58, 12}}, color = {0, 0, 255}));
      connect(tertiary3phase, deltaT2.plug_p) annotation (
        Line(points = {{80, 12}, {58, 12}}, color = {0, 0, 255}));
      connect(idealTransformer.plug_n1, starT3.plug_p) annotation (
        Line(points = {{18, 54}, {-28, 54}, {-28, -18}, {18, -18}}, color = {0, 0, 255}));
      connect(secondaryInductance.plug_n, idealTransformer.plug_p1) annotation (
        Line(points = {{10, 74}, {18, 74}}, color = {0, 0, 255}));
      connect(primaryResistnce.plug_n,primaryInductance. plug_p) annotation (
        Line(points = {{-58, 74}, {-52, 74}}, color = {0, 0, 255}));
      connect(primaryResistnce.plug_p,primary3phase)  annotation (
        Line(points = {{-70, 74}, {-80, 74}}, color = {0, 0, 255}));
      connect(secondaryResistance.plug_n,secondaryInductance. plug_p) annotation (
        Line(points = {{-10, 74}, {-4, 74}}, color = {0, 0, 255}));
      connect(secondaryResistance.plug_p,primaryInductance. plug_n) annotation (
        Line(points = {{-22, 74}, {-38, 74}}, color = {0, 0, 255}));
      connect(tertiaryResistance.plug_n,tertiaryInductance. plug_p) annotation (
        Line(points = {{-8, 12}, {2, 12}}, color = {0, 0, 255}));
      connect(tertiaryResistance.plug_p,primaryInductance. plug_n) annotation (
        Line(points = {{-20, 12}, {-32, 12}, {-32, 74}, {-38, 74}}, color = {0, 0, 255}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-0.2072, -5.342}, textColor = {0, 0, 220}, extent = {{-97.7928, 147.342}, {100.207, 113.342}}, textString = "%name"), Rectangle(extent = {{-72, 68}, {74, -68}}), Rectangle(lineColor = {28, 108, 200}, fillColor = {28, 108, 200}, pattern = LinePattern.None, extent = {{-32, 72}, {-32, 18}}), Line(points = {{-32, 14}, {-22, 0}, {-12, 14}}, thickness = 0.5), Line(points = {{-22, -14}, {-22, 0}}, thickness = 0.5), Ellipse(lineThickness = 1, extent = {{-50, 30}, {6, -26}}), Polygon(lineThickness = 0.5, points = {{6, -34}, {30, -34}, {18, -14}, {6, -34}}), Ellipse(lineThickness = 1, extent = {{-12, 8}, {44, -50}}), Ellipse(lineThickness = 1, extent = {{-10, 48}, {46, -8}}), Line(points = {{8, 40}, {18, 26}, {28, 40}}, thickness = 0.5), Line(points = {{18, 12}, {18, 26}}, thickness = 0.5)}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -40}, {80, 100}})),
        Documentation(info="<html><head></head><body><p><font size=\"5\">The figure below shows a possible equivalent circuit of (star connection of longitudinal impedances) a three winding transformer in a three-phase form, when transverse reactance is neglected. The three winding transformer of this package is built following the connection diagram of the mentioned figure. The elements are chosen from Modelica.Electrical.Polyphase.</font></p>
<p><img src=\"modelica://LCC_HVDC/Resources/Images/ThreePhaseThreeWindingTrans.png\" alt=\"Three-phase conncetion of a three-winding transformer\"> </p>
</body></html>"));
    end ThreeWindingTransformer;

    model HVDCpole "Two 6-pulse equidistant bridges with 3 winding transformer"
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Inductance Lsmooth = 225e-3 "Smoothing inductor";
      parameter Modelica.Units.SI.Resistance Rsmooth = 0.1 "Resistance of smoothing inductor";
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      //Note that setting an initial current, if we do not want wrong initial voltage, must be combined with initial SCR state.
      parameter Modelica.Units.SI.Frequency f = 50 "line frequency";
      parameter Real BlockTime = 0 "Pulse initial blocking time";
      parameter Real Inverter = 1 "1 for inverter and 0 for rectifier operation";

      Modelica.Electrical.Polyphase.Basic.PlugToPin_p r1(k = 1) annotation (
        Placement(visible = true, transformation(origin = {-98, 47}, extent = {{-14, -15}, {14, 15}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p s1(k = 2) annotation (
        Placement(visible = true, transformation(origin = {-96, 23}, extent = {{-12, -15}, {12, 15}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p t1(k = 3) annotation (
        Placement(visible = true, transformation(origin = {-97, 0}, extent = {{-13, -14}, {13, 14}}, rotation = 0)));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
        Placement(transformation(extent = {{54, 46}, {90, 82}})));
      Modelica.Electrical.Analog.Sensors.VoltageSensor UDC annotation (
        Placement(transformation(extent = {{-16, -16}, {16, 16}}, rotation = 270, origin = {54, -42})));
      ThreeWindingTransformer transformer annotation (
        Placement(transformation(extent = {{-208, -76}, {-140, -12}})));
      LCC_HVDC.Models.PllPolePulser converterControl(BlockTime=BlockTime)
        annotation (Placement(visible=true, transformation(
            origin={-175,-166.154},
            extent={{-33,-13.8463},{33,46.155}},
            rotation=0)));
      Bridge bridge2(iniOff = {false, false, false, false, true, true})                               annotation (
        Placement(transformation(extent = {{-70, -108}, {-6, -48}})));
      Bridge bridge1(iniOff = {false, false, false, false, true, true})                               annotation (
        Placement(transformation(extent = {{-70, -6}, {-6, 52}})));
      Modelica.Blocks.Math.Mean vMean(f = 600, x0 = -(0.5e6)*(Inverter) + (0.5e6)*(1 - Inverter)) annotation (
        Placement(visible = true, transformation(origin = {114, -82}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor smoothingR(R = Rsmooth) annotation (
        Placement(visible = true, transformation(origin = {188, 64}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor smoothingL(L = Lsmooth) annotation (
        Placement(visible = true, transformation(origin = {122, 64}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor smoothingR1(R = Rsmooth) annotation (
        Placement(visible = true, transformation(origin = {185, -181}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor smoothingL1(L = Lsmooth) annotation (
        Placement(visible = true, transformation(origin = {112, -182}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
      Modelica.Blocks.Math.Mean iMean(f = 600) annotation (
        Placement(visible = true, transformation(origin = {110, -6}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p r2(k = 1) annotation (
        Placement(visible = true, transformation(origin = {-94, -57}, extent = {{-14, -15}, {14, 15}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p s2(k = 2) annotation (
        Placement(visible = true, transformation(origin = {-94, -78}, extent = {{-12, -16}, {12, 16}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p t2(k = 3) annotation (
        Placement(visible = true, transformation(origin = {-94, -98}, extent = {{-12, -14}, {12, 14}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Interfaces.PositivePlug ac annotation (
        Placement(transformation(extent = {{-270, -72}, {-210, -12}}), iconTransformation(extent = {{-114, -8}, {-90, 16}})));
      Modelica.Blocks.Interfaces.RealInput alpha annotation (
        Placement(visible = true, transformation(origin = {-255, -199}, extent = {{-43, -43}, {43, 43}}, rotation = 0), iconTransformation(origin = {-110, -62}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation (
        Placement(transformation(extent = {{-24, -24}, {24, 24}}, rotation = 180, origin = {238, 62}), iconTransformation(extent = {{100, 14}, {122, 36}})));
      Modelica.Blocks.Interfaces.RealOutput vdc annotation (Placement(
            transformation(extent={{224,-114},{288,-50}}), iconTransformation(
              extent={{100,-88},{126,-62}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation (
        Placement(transformation(extent = {{216, -202}, {264, -154}}), iconTransformation(extent = {{100, -40}, {122, -18}})));
      Modelica.Blocks.Interfaces.RealOutput idc annotation (Placement(
            transformation(extent={{226,-38},{288,24}}), iconTransformation(
              extent={{100,56},{126,82}})));
    equation
      connect(r1.plug_p, t1.plug_p) annotation (
        Line(points = {{-100.8, 47}, {-110, 47}, {-110, 0}, {-99.6, 0}}, color = {0, 0, 255}));
      connect(s1.plug_p, t1.plug_p) annotation (
        Line(points = {{-98.4, 23}, {-110, 23}, {-110, 0}, {-99.6, 0}}, color = {0, 0, 255}));
      connect(pin_p, pin_p) annotation (
        Line(points={{238,62},{238,62}},      color = {0, 0, 255}));
      connect(ac,transformer.primary3phase)  annotation (
        Line(points = {{-240, -42}, {-224, -42}, {-224, -44}, {-208, -44}}, color = {0, 0, 255}));
      connect(ac, ac) annotation (
        Line(points={{-240,-42},{-240,-42}},      color = {0, 0, 255}));
      connect(smoothingR.p, smoothingL.n) annotation (
        Line(points = {{164, 64}, {146, 64}}, color = {0, 0, 255}));
      connect(smoothingL.p, currentSensor.n) annotation (
        Line(points = {{98, 64}, {90, 64}}, color = {0, 0, 255}));
      connect(pin_n, pin_n) annotation (
        Line(points={{240,-178},{240,-178}},      color = {0, 0, 255}));
      connect(smoothingR1.p,smoothingL1. n) annotation (
        Line(points = {{160, -181}, {160, -182}, {138, -182}}, color = {0, 0, 255}));
      connect(UDC.p, currentSensor.p) annotation (
        Line(points = {{54, -26}, {54, 64}}, color = {0, 0, 255}));
      connect(UDC.n,smoothingL1. p) annotation (
        Line(points = {{54, -58}, {54, -182}, {86, -182}}, color = {0, 0, 255}));
      connect(iMean.u, currentSensor.i) annotation (
        Line(points = {{81.2, -6}, {72, -6}, {72, 44.2}}, color = {0, 0, 127}));
      connect(r1.pin_p,bridge1. pin1) annotation (
        Line(points = {{-95.2, 47}, {-86, 47}, {-86, 35.18}, {-72.56, 35.18}}, color = {0, 0, 255}));
      connect(s1.pin_p,bridge1. pin2) annotation (
        Line(points = {{-93.6, 23}, {-72.56, 23}}, color = {0, 0, 255}));
      connect(t1.pin_p,bridge1. pin3) annotation (
        Line(points = {{-94.4, 0}, {-86, 0}, {-86, 10.82}, {-72.56, 10.82}}, color = {0, 0, 255}));
      connect(transformer.secondary3phase, s1.plug_p) annotation (
        Line(points = {{-139.32, -34.4}, {-112, -34.4}, {-112, 0}, {-110, 0}, {-110, 23}, {-98.4, 23}}, color = {0, 0, 255}));
      connect(s2.pin_p,bridge2. pin2) annotation (
        Line(points = {{-91.6, -78}, {-72.56, -78}}, color = {0, 0, 255}));
      connect(r2.plug_p, t2.plug_p) annotation (
        Line(points = {{-96.8, -57}, {-106, -57}, {-106, -98}, {-96.4, -98}}, color = {0, 0, 255}));
      connect(s2.plug_p, t2.plug_p) annotation (
        Line(points = {{-96.4, -78}, {-106, -78}, {-106, -98}, {-96.4, -98}}, color = {0, 0, 255}));
      connect(transformer.tertiary3phase, s2.plug_p) annotation (
        Line(points = {{-139.32, -53.6}, {-114, -53.6}, {-114, -78}, {-96.4, -78}}, color = {0, 0, 255}));
      connect(vMean.u, UDC.v) annotation (
        Line(points = {{85.2, -82}, {38, -82}, {38, -42}, {36.4, -42}}, color = {0, 0, 127}));
      connect(smoothingR1.n, pin_n) annotation (
        Line(points = {{210, -181}, {210, -182}, {240, -182}, {240, -178}}, color = {0, 0, 255}));
      connect(smoothingR.n, pin_p) annotation (
        Line(points = {{212, 64}, {238, 64}, {238, 62}}, color = {0, 0, 255}));
      connect(converterControl.ac3Phase, ac) annotation (
        Line(points={{-208.66,-150},{-240,-150},{-240,-42}},        color = {0, 0, 255}));
      connect(t2.pin_p,bridge2. pin3) annotation (
        Line(points = {{-91.6, -98}, {-82, -98}, {-82, -90.6}, {-72.56, -90.6}}, color = {0, 0, 255}));
      connect(converterControl.pD,bridge2. P) annotation (
        Line(points={{-138.04,-168.6},{-116,-168.6},{-116,-124},{6,-124},{6,-78},
              {-1.52,-78}},                                                                                 color = {255, 0, 255}));
      connect(iMean.y, idc) annotation (Line(points={{136.4,-6},{166,-6},{166,-7},
              {257,-7}}, color={0,0,127}));
      connect(vMean.y, vdc)
        annotation (Line(points={{140.4,-82},{256,-82}}, color={0,0,127}));
      connect(r2.pin_p,bridge2. pin1) annotation (
        Line(points = {{-91.2, -57}, {-91.2, -58}, {-82, -58}, {-82, -65.4}, {-72.56, -65.4}}, color = {0, 0, 255}));
      connect(bridge1.pin_p, currentSensor.p) annotation (
        Line(points = {{-3.44, 40.4}, {6, 40.4}, {6, 64}, {54, 64}}, color = {0, 0, 255}));
      connect(bridge1.pin_n,bridge2. pin_p) annotation (
        Line(points = {{-3.44, 5.02}, {6, 5.02}, {6, -60}, {-3.44, -60}}, color = {0, 0, 255}));
      connect(bridge2.pin_n,smoothingL1. p) annotation (
        Line(points = {{-3.44, -96.6}, {54, -96.6}, {54, -182}, {86, -182}}, color = {0, 0, 255}));
      connect(converterControl.pY,bridge1. P) annotation (
        Line(points={{-138.04,-131.999},{-62,-131.999},{-62,-132},{14,-132},{14,
              23},{-1.52,23}},                                                                                color = {255, 0, 255}));
      connect(converterControl.alpha,alpha)  annotation (
        Line(points={{-174.67,-183.9},{-174.67,-199},{-255,-199}},        color = {0, 0, 127}));
      annotation (
        Placement(transformation(origin = {-314, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 180)),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-240, 100}, {240, -240}})),
        experiment(StopTime = 0.6, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
        Documentation(revisions = "<html>
    <p><b>Release Notes:</b></p>
    <ul>
    <li><i>Mai 7, 2004   </i>
         by Anton Haumer<br> realized<br>
         </li>
    </ul>
    </html>", info = "<html><head></head><body><p><font size=\"5\">This block is created to is give the possibility of arranging HVDC systems, either monopolar or bipolar, acording to IEC TR 60919-1. This results in a redundancy in the arrangement of HVDC systems so that if one pole is tripped or is under maintenance, the other pole continues to deliver power.&nbsp;<a href=\"modelica://HVDC.Models.ReferenceInfo\">[See ReferenceInfo: 3]</a></font></p>
</body></html>"),
        __Dymola_experimentSetupOutput,
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {6, 4}, rotation = 180, textColor = {0, 0, 217}, extent = {{-84, 22}, {84, -22}}, textString = "HVDC Pole", fontName = "MS"), Text(origin = {14.6819, 99.5795}, textColor = {0, 0, 227}, extent = {{-114.685, 48.418}, {89.3181, 8.42046}}, textString = "%name", fontName = "MS")}));
    end HVDCpole;

    model Cable
      parameter Modelica.Units.SI.Inductance l = 0.158e-3 "H/km";
      parameter Modelica.Units.SI.Resistance r = 0.02413793 "Ohm/km";
      parameter Modelica.Units.SI.Capacitance c = 0.275e-6 "F/km";
      parameter Real km = 435 "km";
      parameter Real Vnom = 1000 "kV";
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = 0.1) annotation (
        Placement(transformation(extent = {{-72, 30}, {-52, 50}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor(L = l*km) annotation (
        Placement(transformation(extent = {{8, 30}, {28, 50}})));
      Modelica.Electrical.Analog.Basic.Capacitor capacitor(v(fixed = true, start = Vnom/2*1000), C = c*km/2) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {36, 18})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.1) annotation (
        Placement(transformation(extent = {{54, 30}, {74, 50}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor2(R = r*km) annotation (
        Placement(transformation(extent = {{-26, 30}, {-6, 50}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor3(R = 0.1) annotation (
        Placement(transformation(extent = {{-72, -50}, {-52, -30}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L = l*km) annotation (
        Placement(transformation(extent = {{8, -50}, {28, -30}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor4(R = 0.1) annotation (
        Placement(transformation(extent = {{54, -50}, {74, -30}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor5(R = r*km) annotation (
        Placement(transformation(extent = {{-28, -50}, {-8, -30}})));
      Modelica.Electrical.Analog.Basic.Capacitor capacitor1(v(fixed = true, start = Vnom/2*1000), C = c*km/2) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {36, -18})));
      Modelica.Electrical.Analog.Basic.Capacitor capacitor2(v(fixed = true, start = Vnom/2*1000), C = c*km/2) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-36, 18})));
      Modelica.Electrical.Analog.Basic.Capacitor capacitor3(v(fixed = true, start = Vnom/2*1000), C = c*km/2) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-36, -18})));
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_N annotation (
          Placement(transformation(extent={{-108,-50},{-88,-30}}),
            iconTransformation(extent={{-122,-66},{-98,-42}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_P annotation (
          Placement(transformation(extent={{-90,50},{-110,30}}),
            iconTransformation(extent={{-100,72},{-122,50}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_P1 annotation (
          Placement(transformation(extent={{90,30},{110,50}}),
            iconTransformation(extent={{100,46},{122,68}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_N1 annotation (
          Placement(transformation(extent={{90,-50},{110,-30}}),
            iconTransformation(extent={{98,-68},{122,-44}})));
    equation
      connect(resistor.n, resistor2.p) annotation (
        Line(points = {{-52, 40}, {-26, 40}}, color = {0, 0, 255}));
      connect(resistor2.n, inductor.p) annotation (
        Line(points = {{-6, 40}, {8, 40}}, color = {0, 0, 255}));
      connect(inductor.n, resistor1.p) annotation (
        Line(points = {{28, 40}, {54, 40}}, color = {0, 0, 255}));
      connect(resistor3.n, resistor5.p) annotation (
        Line(points = {{-52, -40}, {-28, -40}}, color = {0, 0, 255}));
      connect(resistor5.n, inductor1.p) annotation (
        Line(points = {{-8, -40}, {8, -40}}, color = {0, 0, 255}));
      connect(inductor1.n, resistor4.p) annotation (
        Line(points = {{28, -40}, {54, -40}}, color = {0, 0, 255}));
      connect(capacitor.p, resistor1.p) annotation (
        Line(points = {{36, 28}, {36, 40}, {54, 40}}, color = {0, 0, 255}));
      connect(capacitor2.p, resistor2.p) annotation (
        Line(points = {{-36, 28}, {-36, 40}, {-26, 40}}, color = {0, 0, 255}));
      connect(capacitor3.n, resistor5.p) annotation (
        Line(points = {{-36, -28}, {-36, -40}, {-28, -40}}, color = {0, 0, 255}));
      connect(capacitor1.n, resistor4.p) annotation (
        Line(points = {{36, -28}, {36, -40}, {54, -40}}, color = {0, 0, 255}));
      connect(capacitor1.p, capacitor.n) annotation (
        Line(points = {{36, -8}, {36, 8}}, color = {0, 0, 255}));
      connect(capacitor3.p, capacitor2.n) annotation (
        Line(points = {{-36, -8}, {-36, 8}}, color = {0, 0, 255}));
      connect(resistor1.n, pin_P1)
        annotation (Line(points={{74,40},{100,40}}, color={0,0,255}));
      connect(resistor4.n, pin_N1)
        annotation (Line(points={{74,-40},{100,-40}}, color={0,0,255}));
      connect(resistor3.p, pin_N)
        annotation (Line(points={{-72,-40},{-98,-40}}, color={0,0,255}));
      connect(resistor.p, pin_P)
        annotation (Line(points={{-72,40},{-100,40}}, color={0,0,255}));
      connect(pin_N1, pin_N1)
        annotation (Line(points={{100,-40},{100,-40}}, color={0,0,255}));
      connect(capacitor3.p, capacitor1.p) annotation (
        Line(points = {{-36, -8}, {36, -8}}, color = {0, 0, 255}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{-76, 74}, {-40, 20}}), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{-72, 68}, {-46, 28}}), Ellipse(fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-66, 58}, {-54, 40}}), Line(points = {{-58, 74}, {56, 80}}, thickness = 0.5), Line(points = {{-56, 20}, {58, 28}}, thickness = 0.5), Line(points = {{-144, 66}}, thickness = 1, smooth = Smooth.Bezier), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{40, 80}, {70, 28}}), Rectangle(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.6, extent = {{36, 78}, {54, 30}}), Text(origin = {0.175848, 10.32}, textColor = {0, 0, 197}, extent = {{-104.176, 141.68}, {105.824, 97.68}}, textString = "%name"), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{-78, -28}, {-42, -82}}), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{-74, -34}, {-48, -74}}), Ellipse(fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-68, -44}, {-56, -62}}), Line(points = {{-60, -28}, {54, -22}}, thickness = 0.5), Line(points = {{-58, -82}, {56, -74}}, thickness = 0.5), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{38, -22}, {68, -74}}), Rectangle(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.6, extent = {{34, -24}, {52, -72}})}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -60}, {100, 60}})),
        Documentation(info = "<html><head></head><body><font size=\"5\">This is a twin cable which is suitable for bipolar HVDC configurations. In case of failure, the remained cable can ensure the continuity of power delivering.&nbsp;</font></body></html>"));
    end Cable;

    model PllPolePulser "Converter unit control"
      parameter Real BlockTime = 0 "Pulse initial blocking time";
      parameter Modelica.Units.SI.Voltage vNom = 400e3 "expected voltage amplitude";
      LCC_HVDC.Models.PLL pLL(vNom=vNom)
        annotation (Placement(transformation(extent={{-36,70},{-16,90}})));
      LCC_HVDC.Models.PulseGeneratorY pulserY(BlockTime=BlockTime)
        "For rectifiers supplied by Y transformer winding"
        annotation (Placement(transformation(extent={{50,50},{78,74}})));
      Modelica.Blocks.Routing.Replicator replicator1(nout = 6) annotation (
        Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {22, 74})));
      Modelica.Electrical.Polyphase.Basic.Delta delta(final m = 3) "Delta connection" annotation (
        Placement(transformation(extent = {{9, -11}, {-9, 11}}, rotation = 90, origin = {-79, 79})));
      Modelica.Electrical.Polyphase.Sensors.VoltageSensor voltageSensor(final m = 3) "Voltage sensor" annotation (
        Placement(transformation(extent = {{9, 9}, {-9, -9}}, rotation = 270, origin = {-57, 79})));
      LCC_HVDC.Models.PLL pLL2(vNom=vNom)
        annotation (Placement(transformation(extent={{-36,26},{-16,46}})));
      Modelica.Blocks.Routing.Replicator replicator2(nout = 6) annotation (
        Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {22, 30})));
      Modelica.Blocks.Routing.Replicator replicator3(nout = 6) annotation (
        Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {22, 8})));
      Modelica.Blocks.Routing.Replicator replicator4(nout = 6) annotation (
        Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {22, 52})));
      LCC_HVDC.Models.PulseGeneratorD pulserD(BlockTime=BlockTime)
        annotation (Placement(transformation(extent={{50,16},{78,40}})));
      Modelica.Blocks.Interfaces.RealInput alpha annotation (
        Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 90, origin = {1, -31}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 90, origin = {1, -113})));
      Modelica.Electrical.Polyphase.Interfaces.PositivePlug ac3Phase annotation (
        Placement(transformation(extent = {{-114, 32}, {-86, 60}}), iconTransformation(extent = {{-110, -8}, {-94, 8}})));
      Modelica.Blocks.Interfaces.BooleanOutput pY[6] annotation (
        Placement(transformation(extent = {{96, 46}, {128, 78}}), iconTransformation(extent = {{100, 48}, {124, 72}})));
      Modelica.Blocks.Interfaces.BooleanOutput pD[6] annotation (
        Placement(transformation(extent = {{92, 12}, {124, 44}}), iconTransformation(extent = {{100, -74}, {124, -50}})));
    equation
      connect(voltageSensor.plug_p, delta.plug_n) annotation (
        Line(points = {{-57, 70}, {-79, 70}}, color = {0, 0, 255}));
      connect(delta.plug_p, voltageSensor.plug_n) annotation (
        Line(points = {{-79, 88}, {-57, 88}}, color = {0, 0, 255}));
      connect(pY, pulserY.y) annotation (
        Line(points = {{112, 62}, {112, 62}, {80.52, 62}}, color = {255, 0, 255}));
      connect(pulserD.y,pD)  annotation (
        Line(points = {{80.52, 27.76}, {108, 27.76}, {108, 28}}, color = {255, 0, 255}));
      connect(delta.plug_n,ac3Phase)  annotation (
        Line(points = {{-79, 70}, {-90, 70}, {-90, 46}, {-100, 46}}, color = {0, 0, 255}));
      connect(alpha, replicator3.u) annotation (
        Line(points = {{1, -31}, {1, 8}, {12.4, 8}}, color = {0, 0, 127}));
      connect(alpha, replicator4.u) annotation (
        Line(points = {{1, -31}, {1, 8}, {6, 8}, {6, 52}, {12.4, 52}}, color = {0, 0, 127}));
      connect(voltageSensor.v, pLL.u) annotation (
        Line(points = {{-47.1, 79}, {-41.55, 79}, {-41.55, 80}, {-38, 80}}, color = {0, 0, 127}));
      connect(pLL.thetaRad, replicator1.u) annotation (
        Line(points = {{-15, 74}, {12.4, 74}}, color = {0, 0, 127}));
      connect(pLL2.thetaRad, replicator2.u) annotation (
        Line(points = {{-15, 30}, {12.4, 30}}, color = {0, 0, 127}));
      connect(replicator1.y, pulserY.wt) annotation (Line(points={{30.8,74},{34,
              74},{34,65.72},{47.62,65.72}}, color={0,0,127}));
      connect(pulserY.firingAngle, replicator4.y) annotation (
        Line(points = {{47.62, 58.52}, {36, 58.52}, {36, 52}, {30.8, 52}}, color = {0, 0, 127}));
      connect(pulserD.wt, replicator2.y) annotation (Line(points={{47.62,31.72},
              {36,31.72},{36,30},{30.8,30}}, color={0,0,127}));
      connect(pulserD.firingAngle, replicator3.y) annotation (
        Line(points = {{47.62, 25}, {40, 25}, {40, 8}, {30.8, 8}}, color = {0, 0, 127}));
      connect(pLL2.u, voltageSensor.v) annotation (
        Line(points = {{-38, 36}, {-47.1, 36}, {-47.1, 79}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(textColor = {0, 0, 184}, extent = {{-102, 146}, {102, 108}}, textString = "%name"), Line(points = {{20, -12}, {38, -12}, {38, 14}, {66, 14}, {66, -12}, {86, -12}}, thickness = 0.35), Ellipse(lineThickness = 0.35, extent = {{44, 86}, {88, 42}}), Line(origin = {-20, 60.33}, points = {{74, 13.67}, {86, 1.67}, {98, 13.67}}, thickness = 0.35), Line(points = {{66, 48}, {66, 62}}, thickness = 0.35), Polygon(lineThickness = 0.5, points = {{54, -72}, {82, -72}, {68, -48}, {54, -72}}), Ellipse(lineThickness = 0.5, extent = {{46, -42}, {90, -86}}), Text(extent = {{-100, 14}, {34, -8}}, textString = "PLL=>")}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -30}, {100, 100}})),
        Documentation(info = "<html><head></head><body><font size=\"5\">This block is created to comply with the requirements of IEC TR 60919-1 for VDC arrangement. It should be used in HVDC pole. Its input is a three phase plug and should be preferably taken from the primary winding of transformer to avoid the effect of distortions as much as possible. The outputs are two sets of pulses. One set conforms with a bridge that is fed by a Y connection of transformer and the other set is suitable for those bridges supplied by D connection.</font></body></html>"));
    end PllPolePulser;

    model PoleControl
      parameter Integer ControlType = 1 "1 for current control and 2 for voltage control";
      Modelica.Blocks.Sources.BooleanExpression controllerType(y=if ControlType
             == 1 then true else false) annotation (Placement(visible=true,
            transformation(
            origin={7,20},
            extent={{13,-10},{-13,10}},
            rotation=0)));
      Modelica.Blocks.Logical.Switch switch3 annotation (
        Placement(visible = true, transformation(origin = {-34, 20}, extent = {{16, 16}, {-16, -16}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput firingANGLE annotation (
        Placement(transformation(extent = {{-12, -12}, {12, 12}}, rotation = 180, origin = {-92, 20}), iconTransformation(extent = {{-12, -12}, {12, 12}}, rotation = 180, origin = {-112, 0})));
      Modelica.Blocks.Interfaces.RealInput iDC annotation (
        Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 180, origin = {195, 1}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 180, origin = {113, -25})));
      Modelica.Blocks.Interfaces.RealInput vDC annotation (
        Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 180, origin = {195, 85}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 180, origin = {113, 57})));
      Modelica.Blocks.Interfaces.RealInput vdcRef annotation (
        Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 180, origin = {195, 41}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 180, origin = {113, 17})));
      Modelica.Blocks.Interfaces.RealInput powerRef annotation (
        Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 180, origin = {195, -41}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 180, origin = {113, -65})));
      IdcController idcController(
        Ti=0.08,
        k=0.5,
        uMin=0.45e6,
        uMax=0.55e6,
        y_start=0.8,
        IdcBase=1000) annotation (Placement(transformation(
            extent={{-19,-19},{19,19}},
            rotation=180,
            origin={121,-23})));
      VdcController vdcController(
        Ti=0.07,
        k=0.7,
        y_start=-0.8,
        VdcBase=0.5e6) annotation (Placement(transformation(
            extent={{-19,-19},{19,19}},
            rotation=180,
            origin={121,81})));
    equation
      connect(controllerType.y, switch3.u2)
        annotation (Line(points={{-7.3,20},{-14.8,20}}, color={255,0,255}));
      connect(switch3.y, firingANGLE) annotation (
        Line(points = {{-51.6, 20}, {-92, 20}}, color = {0, 0, 127}));
      connect(idcController.pref, powerRef) annotation (Line(points={{142.09,-33.83},
              {166,-33.83},{166,-41},{195,-41}}, color={0,0,127}));
      connect(idcController.vdc, vDC) annotation (Line(points={{141.9,-21.48},{
              166,-21.48},{166,85},{195,85}}, color={0,0,127}));
      connect(idcController.idc, iDC) annotation (Line(points={{141.9,-10.46},{
              174,-10.46},{174,1},{195,1}}, color={0,0,127}));
      connect(idcController.alpha, switch3.u1) annotation (Line(points={{99.34,
              -23.38},{20,-23.38},{20,7.2},{-14.8,7.2}}, color={0,0,127}));
      connect(vdcController.vdc, vDC) annotation (Line(points={{142.09,90.69},{
              164,90.69},{164,85},{195,85}}, color={0,0,127}));
      connect(vdcController.vdcRef, vdcRef) annotation (Line(points={{142.09,
              71.69},{160,71.69},{160,41},{195,41}}, color={0,0,127}));
      connect(vdcController.alpha, switch3.u3) annotation (Line(points={{98.77,
              79.67},{20,79.67},{20,32.8},{-14.8,32.8}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(textColor = {0, 0, 184}, extent = {{-80, 44}, {86, -32}}, textString = "Pole Control"), Text(origin = {-34.6566, 47.345}, textColor = {0, 0, 184}, extent = {{-67.3434, 98.655}, {138.656, 68.655}}, textString = "%name")}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -80}, {180, 120}})),
        Documentation(info = "<html><head></head><body><div><font size=\"5\">&nbsp;<a href=\"modelica://HVDC.Models.ReferenceInfo\">[See ReferenceInfo: 2]</a></font> <img src=\"modelica://HVDC/Resources/Images/Converter characteristics.png\" alt=\"Converter characteristics\"></div></body></html>"));
    end PoleControl;

    model ToPark
      parameter Integer p "number of pole pairs";
      Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotator annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Interfaces.RealOutput y[2] annotation (
        Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
      Modelica.Blocks.Interfaces.RealInput X[3] annotation (
        Placement(transformation(extent = {{-140, -20}, {-100, 20}}), iconTransformation(extent = {{-140, -20}, {-100, 20}})));
      Modelica.Blocks.Interfaces.RealInput phi annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -116}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -118})));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-40, 0})));
      Modelica.Blocks.Math.Gain gain(k = p) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, -44})));
    equation
      connect(toSpacePhasor.y, rotator.u) annotation (
        Line(points = {{-29, 0}, {-12, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(rotator.y, y) annotation (
        Line(points = {{11, 0}, {110, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(toSpacePhasor.u, X) annotation (
        Line(points = {{-52, 0}, {-120, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(gain.y, rotator.angle) annotation (
        Line(points = {{0, -33}, {0, -12}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(gain.u, phi) annotation (
        Line(points = {{0, -56}, {0, -116}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = true)),
        experiment(StopTime = 5, Interval = 0.001),
        Documentation(info = "<html><head></head><body><p><br><br></p>
</body></html>"),
        __Dymola_experimentSetupOutput,
        Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 127}), Text(extent = {{-96, 32}, {96, -22}}, lineColor = {0, 0, 127}, textString = "=>P"), Text(extent = {{-106, 144}, {104, 106}}, lineColor = {0, 0, 255}, textString = "%name")}));
    end ToPark;

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
 </body></html>", revisions = "<html>
 <ul>
 <li><i> January 12, 2006   </i>
        by Anton Haumer<br> implemented<br>
        </li>
 </ul>
 </html>"),
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(lineColor = {0, 0, 255}, extent = {{100, 112}, {-104, 146}}, textString = "%name"), Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 127}, extent = {{-100, 44}, {100, -44}}, textString = "var
AVG")}));
    end VarAvg;

    model Mod
      extends Modelica.Blocks.Interfaces.SISO;
      parameter Real A = 2*Modelica.Constants.pi;
    equation
      y = mod(u, A);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Text(extent = {{-100, 10}, {100, -20}}, lineColor = {0, 0, 255}, textString = "mod(u/A)")}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end Mod;

    model HpFilterFreqDomain "High pass filter in frequency domain"
      import Modelica.Constants.pi;
      parameter Modelica.Units.SI.ReactivePower Qc = 40e6 "Nominal reactive power";
      parameter Modelica.Units.SI.Voltage Vn = 400e3 "Nominal rms voltage";
      parameter Real Nh = 12 "Harmonic order to be tuned";
      parameter Real Q = 6 "Filter quality factor";
      Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.PositivePin pin_P
        annotation (Placement(transformation(extent={{-48,38},{-32,54}}),
            iconTransformation(extent={{-108,-12},{-92,4}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.NegativePin pin_N
        annotation (Placement(transformation(extent={{92,38},{108,54}}),
            iconTransformation(extent={{92,-8},{108,8}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Resistor resistor1(R_ref=Q*
            Nh*(1/(Nh^2 - 1))*(Vn^2/Qc))
        annotation (Placement(transformation(extent={{40,36},{60,56}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Inductor inductor1(L=(1/(Nh^
            2 - 1))*(1/(2*pi*50))*(Vn^2/Qc))
        annotation (Placement(transformation(extent={{40,10},{60,30}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Capacitor capacitor2(C=((Nh^2
             - 1)/Nh^2)*(1/(2*pi*50))*(Qc/Vn^2))
        annotation (Placement(transformation(extent={{6,36},{26,56}})));
    equation
      connect(inductor1.pin_p, resistor1.pin_p) annotation (Line(points={{40,20},
              {34,20},{34,46},{40,46}}, color={85,170,255}));
      connect(capacitor2.pin_n, resistor1.pin_p)
        annotation (Line(points={{26,46},{40,46}}, color={85,170,255}));
      connect(capacitor2.pin_p, pin_P)
        annotation (Line(points={{6,46},{-40,46}}, color={85,170,255}));
      connect(resistor1.pin_n, inductor1.pin_n) annotation (Line(points={{60,46},
              {66,46},{66,20},{60,20}}, color={85,170,255}));
      connect(resistor1.pin_n, pin_N)
        annotation (Line(points={{60,46},{100,46}}, color={85,170,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={85,170,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              origin={-0.207,-7.342},
              textColor={0,0,220},
              extent={{-97.7928,147.342},{100.207,113.342}},
              textString="%name"),
            Line(
              points={{-20,68},{-20,-54}},
              color={85,170,255},
              thickness=0.5),
            Line(
              points={{-40,-32},{80,-32}},
              color={85,170,255},
              thickness=0.5),
            Line(
              points={{-38,52}},
              color={85,170,255},
              thickness=0.5,
              smooth=Smooth.Bezier),
            Line(
              points={{-12,56},{-12,0},{2,-24},{24,-30},{34,-30},{56,-28},{84,
                  -22}},
              color={85,170,255},
              thickness=0.5,
              smooth=Smooth.Bezier),
            Text(
              extent={{-66,70},{-24,36}},
              textColor={85,170,255},
              textString="|Z|"),
            Text(
              extent={{12,-32},{84,-72}},
              textColor={85,170,255},
              textString="f")}), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-40,-20},{100,100}})),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
<a href=\"modelica://HVDC.Models.HpFilterTimeDomain\">[See HpFilterTimeDomain]</a>
</body>
</html>"));
    end HpFilterFreqDomain;

    model ChpFilterFreqDomain "C type high pass filter in frequency domain"
      import Modelica.Constants.pi;
      parameter Modelica.Units.SI.ReactivePower Qc = 65.6e6 "Nominal reactive power";
      parameter Modelica.Units.SI.Voltage Vn = 400e3 "Nominal rms voltage";
      parameter Real Nh = 3 "Harmonic order to be tuned";
      parameter Real Q = 6 "Filter quality factor";
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Resistor resistor(R_ref=Q*
            Nh*(1/(Nh^2 - 1))*(Vn^2/Qc))
        annotation (Placement(transformation(extent={{52,36},{72,56}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Inductor inductor(L=(1/(Nh^2
             - 1))*(1/(2*pi*50))*(Vn^2/Qc))
        annotation (Placement(transformation(extent={{66,10},{86,30}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Capacitor capacitor(C=(1/(2*
            pi*50))*(Qc/Vn^2))
        annotation (Placement(transformation(extent={{10,36},{30,56}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Capacitor capacitor1(C=(Nh^2
             - 1)*(1/(2*pi*50))*(Qc/Vn^2))
        annotation (Placement(transformation(extent={{40,10},{60,30}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.PositivePin pin_P
        annotation (Placement(transformation(extent={{-48,38},{-32,54}}),
            iconTransformation(extent={{-108,-12},{-92,4}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.NegativePin pin_N
        annotation (Placement(transformation(extent={{92,38},{108,54}}),
            iconTransformation(extent={{92,-8},{108,8}})));
    equation
      connect(inductor.pin_n,resistor. pin_n) annotation (Line(points={{86,20},
              {90,20},{90,46},{72,46}},
                                   color={85,170,255}));
      connect(capacitor.pin_n,resistor. pin_p)
        annotation (Line(points={{30,46},{52,46}},
                                                 color={85,170,255}));
      connect(capacitor1.pin_n, inductor.pin_p)
        annotation (Line(points={{60,20},{66,20}}, color={85,170,255}));
      connect(capacitor1.pin_p, resistor.pin_p) annotation (Line(points={{40,20},
              {36,20},{36,46},{52,46}}, color={85,170,255}));
      connect(pin_P, capacitor.pin_p)
        annotation (Line(points={{-40,46},{10,46}}, color={85,170,255}));
      connect(resistor.pin_n, pin_N)
        annotation (Line(points={{72,46},{100,46}}, color={85,170,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={85,170,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              origin={-0.207,-7.342},
              textColor={0,0,220},
              extent={{-97.7928,147.342},{100.207,113.342}},
              textString="%name"),
            Line(
              points={{-20,68},{-20,-54}},
              color={85,170,255},
              thickness=0.5),
            Line(
              points={{-40,-32},{80,-32}},
              color={85,170,255},
              thickness=0.5),
            Line(
              points={{-38,52}},
              color={85,170,255},
              thickness=0.5,
              smooth=Smooth.Bezier),
            Line(
              points={{-16,46},{-12,-2},{-8,-24},{-2,-30},{8,-20},{24,-6},{72,0}},
              color={85,170,255},
              thickness=0.5,
              smooth=Smooth.Bezier),
            Text(
              extent={{-66,70},{-24,36}},
              textColor={85,170,255},
              textString="|Z|"),
            Text(
              extent={{12,-32},{84,-72}},
              textColor={85,170,255},
              textString="f")}), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-40,-20},{100,100}})),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
<a href=\"modelica://HVDC.Models.cHpFilterTimeDomain\">[See cHpFilterTimeDomain]</a>
</body>

</html>"));
    end ChpFilterFreqDomain;

    model BpFilterFreqDomain
      "Single-tuned band pass filter in frequency domain"
      import Modelica.Constants.pi;
      parameter Modelica.Units.SI.ReactivePower Qc = 49e6 "Nominal reactive power";
      parameter Modelica.Units.SI.Voltage Vn = 400e3 "Nominal rms voltage";
      parameter Real Nh = 5 "Harmonic order to be tuned";
      parameter Real Q = 30 "Filter quality factor";
      Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.PositivePin pin_P
        annotation (Placement(transformation(extent={{-48,38},{-32,54}}),
            iconTransformation(extent={{-108,-12},{-92,4}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.NegativePin pin_N
        annotation (Placement(transformation(extent={{92,38},{108,54}}),
            iconTransformation(extent={{92,-8},{108,8}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Resistor resistor1(R_ref=(1/
            Q)*Nh*(1/(Nh^2 - 1))*(Vn^2/Qc))
        annotation (Placement(transformation(extent={{64,36},{84,56}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Inductor inductor1(L=(1/(Nh^
            2 - 1))*(1/(2*pi*50))*(Vn^2/Qc))
        annotation (Placement(transformation(extent={{34,36},{54,56}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Capacitor capacitor2(C=((Nh^2
             - 1)/Nh^2)*(1/(2*pi*50))*(Qc/Vn^2))
        annotation (Placement(transformation(extent={{4,36},{24,56}})));
    equation
      connect(capacitor2.pin_p, pin_P)
        annotation (Line(points={{4,46},{-40,46}}, color={85,170,255}));
      connect(resistor1.pin_n, pin_N)
        annotation (Line(points={{84,46},{100,46}}, color={85,170,255}));
      connect(inductor1.pin_p, capacitor2.pin_n)
        annotation (Line(points={{34,46},{24,46}}, color={85,170,255}));
      connect(inductor1.pin_n, resistor1.pin_p)
        annotation (Line(points={{54,46},{64,46}}, color={85,170,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={85,170,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              origin={-0.207,-7.342},
              textColor={0,0,220},
              extent={{-97.7928,147.342},{100.207,113.342}},
              textString="%name"),
            Line(
              points={{-20,68},{-20,-54}},
              color={85,170,255},
              thickness=0.5),
            Line(
              points={{-40,-32},{80,-32}},
              color={85,170,255},
              thickness=0.5),
            Line(
              points={{-38,52}},
              color={85,170,255},
              thickness=0.5,
              smooth=Smooth.Bezier),
            Text(
              extent={{-66,70},{-24,36}},
              textColor={85,170,255},
              textString="|Z|"),
            Text(
              extent={{12,-32},{84,-72}},
              textColor={85,170,255},
              textString="f"),
            Line(
              points={{-16,38},{-8,-2},{-2,-22},{8,-30},{24,-20},{36,-10},{46,
                  -2}},
              color={85,170,255},
              thickness=0.5,
              smooth=Smooth.Bezier)}),
                                 Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-40,-20},{100,100}})),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
<a href=\"modelica://HVDC.Models.BpFilterTimeDomain\">[See BpFilterTimeDomain]</a>
</body>
</html>"));
    end BpFilterFreqDomain;

    model HpFilterTimeDomain "High pass filter in time domain"
      import Modelica.Constants.pi;
      parameter Modelica.Units.SI.ReactivePower Qc = 40e6 "Nominal reactive power";
      parameter Modelica.Units.SI.Voltage Vn = 400e3 "Nominal rms voltage";
      parameter Real Nh = 12 "Harmonic order to be tuned";
      parameter Real Q = 6 "Filter quality factor";
      Modelica.Electrical.Polyphase.Basic.Star star2 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-8})));
      Modelica.Electrical.Polyphase.Basic.Resistor R1(R=fill(Q*Nh*(1/(Nh^2 - 1))
            *(Vn^2/Qc), 3)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={12,34})));
      Modelica.Electrical.Polyphase.Basic.Capacitor C1(C=fill(((Nh^2 - 1)/Nh^2)
            *(1/(2*pi*50))*(Qc/Vn^2), 3)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,78})));
      Modelica.Electrical.Polyphase.Basic.Inductor L1(L=fill((1/(Nh^2 - 1))*(1/
            (2*pi*50))*(Vn^2/Qc), 3)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-18,28})));
      Modelica.Electrical.Polyphase.Interfaces.PositivePlug positivePlug
        annotation (Placement(transformation(extent={{-110,16},{-90,36}}),
            iconTransformation(extent={{-110,-14},{-88,8}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin gnd annotation (Placement(
            transformation(extent={{-10,-62},{10,-42}}), iconTransformation(extent={
                {-8,-110},{8,-94}})));
    equation
      connect(C1.plug_n, R1.plug_p) annotation (Line(points={{-1.77636e-15,68},
              {-1.77636e-15,44},{12,44}}, color={0,0,255}));
      connect(L1.plug_n, R1.plug_n) annotation (Line(points={{-18,18},{-18,16},
              {12,16},{12,24}}, color={0,0,255}));
      connect(star2.plug_p, R1.plug_n) annotation (Line(points={{1.77636e-15,2},
              {1.77636e-15,16},{12,16},{12,24}}, color={0,0,255}));
      connect(star2.pin_n,gnd)
        annotation (Line(points={{0,-18},{0,-52}}, color={0,0,255}));
      connect(positivePlug, C1.plug_p) annotation (Line(points={{-100,26},{-92,
              26},{-92,94},{1.77636e-15,94},{1.77636e-15,88}}, color={0,0,255}));
      connect(L1.plug_p, R1.plug_p)
        annotation (Line(points={{-18,38},{-18,44},{12,44}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              origin={-0.207,-3.342},
              textColor={0,0,220},
              extent={{-97.7928,147.342},{100.207,113.342}},
              textString="%name"),
            Line(
              points={{-42,18},{-20,50},{2,18}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Line(
              points={{4,2},{-14,-22}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Rectangle(
              extent={{-60,50},{60,-50}},
              lineColor={0,0,0},
              lineThickness=0.5),
            Text(
              origin={-1.02411,-26.0091},
              textColor={0,0,220},
              extent={{-82.9759,104.01},{85.0241,80.0091}},
              textString="HP"),
            Line(
              points={{-22,-16},{0,16},{22,-16}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5,
              origin={24,2},
              rotation=180),
            Line(
              points={{-42,-20},{-20,12},{2,-20}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Line(
              points={{-22,-16},{0,16},{22,-16}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5,
              origin={24,-36},
              rotation=180)}), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-60},{100,100}})),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", monospace;
    }
  </style>
</head>
<body>
  <p>The quality factor of the filter is defined by:</p>
  <p> Q = R/(n.X<sub>L</sub>)</p>
  <p> Where</p>
  <ul>
  <li>R is resistance.</li>
  <li>n is the harmonic order of the tuned frequency</li>
  <li>X<sub>L</sub> is the impedance of inductor at fundamental frequency</li>
  </ul>
  <p>The rated reactive power is obtained by:</p>
  <p>Qc = (V<sup>2</sup> / X<sub>c</sub>) * (n<sup>2</sup> / n<sup>2</sup> -1 )</p>
  <p>where</p>
  <ul>
  <li>V is the nominal voltage</li>
  <li>X<sub>c</sub> is the impedance of capacitor at fundamental frequency</li>
  </ul>
  <p> Also, we have:</p>
  <p>X<sub>L</sub> = X<sub>c</sub> / n<sup>2</sup></p>

</body>
</html>"));
    end HpFilterTimeDomain;

    model ChpFilterTimeDomain "C type high pass filter in time domain"
      import Modelica.Constants.pi;
      parameter Modelica.Units.SI.ReactivePower Qc = 65.6e6 "Nominal reactive power";
      parameter Modelica.Units.SI.Voltage Vn = 400e3 "Nominal rms voltage";
      parameter Real Nh = 3 "Harmonic order to be tuned";
      parameter Real Q = 6 "Filter quality factor";
      Modelica.Electrical.Polyphase.Basic.Star star2 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-22})));
      Modelica.Electrical.Polyphase.Basic.Resistor R1(R=fill(Q*Nh*(1/(Nh^2 - 1))
            *(Vn^2/Qc), 3)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={14,38})));
      Modelica.Electrical.Polyphase.Basic.Capacitor C1(C=fill((1/(2*pi*50))*(Qc
            /Vn^2), 3)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,78})));
      Modelica.Electrical.Polyphase.Basic.Inductor L1(L=fill((1/(Nh^2 - 1))*(1/
            (2*pi*50))*(Vn^2/Qc), 3)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-18,10})));
      Modelica.Electrical.Polyphase.Basic.Capacitor C2(C=fill((Nh^2 - 1)*(1/(2*
            pi*50))*(Qc/Vn^2), 3)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-18,38})));
      Modelica.Electrical.Polyphase.Interfaces.PositivePlug positivePlug
        annotation (Placement(transformation(extent={{-110,16},{-90,36}}),
            iconTransformation(extent={{-110,-14},{-88,8}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin gnd annotation (
          Placement(transformation(extent={{-10,-62},{10,-42}}),
            iconTransformation(extent={{-8,-110},{8,-94}})));
    equation
      connect(C1.plug_n, R1.plug_p)
        annotation (Line(points={{0,68},{0,48},{14,48}}, color={0,0,255}));
      connect(C2.plug_p, R1.plug_p)
        annotation (Line(points={{-18,48},{14,48}}, color={0,0,255}));
      connect(L1.plug_n, R1.plug_n)
        annotation (Line(points={{-18,0},{14,0},{14,28}}, color={0,0,255}));
      connect(star2.plug_p, R1.plug_n) annotation (Line(points={{0,-12},{0,0},{
              14,0},{14,28}}, color={0,0,255}));
      connect(star2.pin_n,gnd)
        annotation (Line(points={{0,-32},{0,-52}}, color={0,0,255}));
      connect(C2.plug_n, L1.plug_p)
        annotation (Line(points={{-18,28},{-18,20}}, color={0,0,255}));
      connect(positivePlug, C1.plug_p) annotation (Line(points={{-100,26},{-92,
              26},{-92,94},{1.77636e-15,94},{1.77636e-15,88}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              origin={-0.207,-3.342},
              textColor={0,0,220},
              extent={{-97.7928,147.342},{100.207,113.342}},
              textString="%name"),
            Line(
              points={{-42,18},{-20,50},{2,18}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Line(
              points={{4,2},{-14,-22}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Rectangle(
              extent={{-60,50},{60,-50}},
              lineColor={0,0,0},
              lineThickness=0.5),
            Text(
              origin={-2.9265,-17.3457},
              textColor={0,0,220},
              extent={{-75.0735,95.3452},{76.9265,73.3457}},
              textString="C-HP"),
            Line(
              points={{-22,-16},{0,16},{22,-16}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5,
              origin={24,2},
              rotation=180),
            Line(
              points={{-42,-20},{-20,12},{2,-20}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Line(
              points={{-22,-16},{0,16},{22,-16}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5,
              origin={24,-36},
              rotation=180)}), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-60},{100,100}})),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", monospace;
    }
  </style>
</head>
<body>
  <p>The quality factor of the filter is defined by:</p>
  <p> Q = R/(n.X<sub>L</sub>)</p>
  <p> Where</p>
  <ul>
  <li>R is resistance.</li>
  <li>n is the harmonic order of the tuned frequency</li>
  <li>X<sub>L</sub> is the impedance of inductor at fundamental frequency</li>
  </ul>
  <p>The rated reactive power is obtained by:</p>
  <p>Qc = V<sup>2</sup> / X<sub>c1</sub></p>
  <p>where</p>
  <ul>
  <li> V is the nominal voltage</li>
  <li>X<sub>c1</sub> is the impedance of capacitor at fundamental frequency</li>
  </ul>
  <p> Also, we have:</p>
  <p>X<sub>c2</sub> = X<sub>c1</sub> / (n<sup>2</sup> -1) &nbsp; and &nbsp; X<sub>L</sub> = X<sub>c2</sub></p>

</body>
</html>"));
    end ChpFilterTimeDomain;

    model BpFilterTimeDomain "Single-tuned band pass filter in time domain"
      import Modelica.Constants.pi;
      parameter Modelica.Units.SI.ReactivePower Qc = 40e6 "Nominal reactive power";
      parameter Modelica.Units.SI.Voltage Vn = 400e3 "Nominal rms voltage";
      parameter Real Nh = 12 "Harmonic order to be tuned";
      parameter Real Q = 6 "Filter quality factor";
      Modelica.Electrical.Polyphase.Basic.Star star2 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-24})));
      Modelica.Electrical.Polyphase.Basic.Resistor resistor2(R=fill((1/Q)*Nh*(1
            /(Nh^2 - 1))*(Vn^2/Qc), 3))                      annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,14})));
      Modelica.Electrical.Polyphase.Basic.Capacitor capacitor2(C=fill(((Nh^2 -
            1)/Nh^2)*(1/(2*pi*50))*(Qc/Vn^2), 3))              annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,78})));
      Modelica.Electrical.Polyphase.Basic.Inductor inductor2(L=fill((1/(Nh^2 -
            1))*(1/(2*pi*50))*(Vn^2/Qc), 3))                 annotation (Placement(
            transformation(
            extent={{-11,-10},{11,10}},
            rotation=270,
            origin={0,45})));
      Modelica.Electrical.Polyphase.Interfaces.PositivePlug positivePlug
        annotation (Placement(transformation(extent={{-110,16},{-90,36}}),
            iconTransformation(extent={{-110,-14},{-88,8}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin gnd annotation (Placement(
            transformation(extent={{-10,-62},{10,-42}}), iconTransformation(extent={
                {-8,-110},{8,-94}})));
    equation
      connect(star2.plug_p,resistor2. plug_n) annotation (Line(points={{
              1.77636e-15,-14},{1.77636e-15,-5},{-1.77636e-15,-5},{-1.77636e-15,
              4}},                              color={0,0,255}));
      connect(star2.pin_n,gnd)
        annotation (Line(points={{-1.77636e-15,-34},{-1.77636e-15,-43},{0,-43},
              {0,-52}},                            color={0,0,255}));
      connect(positivePlug, capacitor2.plug_p) annotation (Line(points={{-100,26},{-92,
              26},{-92,94},{1.77636e-15,94},{1.77636e-15,88}}, color={0,0,255}));
      connect(resistor2.plug_p, inductor2.plug_n) annotation (Line(points={{
              1.77636e-15,24},{1.77636e-15,29},{-1.9984e-15,29},{-1.9984e-15,34}},
            color={0,0,255}));
      connect(inductor2.plug_p, capacitor2.plug_n) annotation (Line(points={{
              1.9984e-15,56},{1.9984e-15,62},{-1.77636e-15,62},{-1.77636e-15,68}},
            color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              origin={-0.207,-3.342},
              textColor={0,0,220},
              extent={{-97.7928,147.342},{100.207,113.342}},
              textString="%name"),
            Line(
              points={{-42,0},{-20,32},{2,0}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Line(
              points={{4,-12},{-14,-36}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Rectangle(
              extent={{-60,64},{60,-64}},
              lineColor={0,0,0},
              lineThickness=0.5),
            Text(
              origin={3.0003,8.00223},
              textColor={0,0,220},
              extent={{-81.0003,77.9978},{82.9997,59.9978}},
              textString="BP"),
            Line(
              points={{-22,-16},{0,16},{22,-16}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5,
              origin={24,-16},
              rotation=180),
            Line(
              points={{-42,-34},{-20,-2},{2,-34}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Line(
              points={{-22,-16},{0,16},{22,-16}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5,
              origin={24,-50},
              rotation=180),
            Line(
              points={{6,56},{-12,32}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Line(
              points={{-40,34},{-18,66},{4,34}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5),
            Line(
              points={{-22,-16},{0,16},{22,-16}},
              color={0,0,204},
              smooth=Smooth.Bezier,
              thickness=0.5,
              origin={26,18},
              rotation=180)}), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-60},{100,100}})),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", monospace;
    }
  </style>
</head>
<body>
  <p>The quality factor of the filter is defined by:</p>
  <p> Q = (n.X<sub>L</sub>) / R</p>
  <p> Where</p>
  <ul>
  <li>R is resistance.</li>
  <li>n is the harmonic order of the tuned frequency</li>
  <li>X<sub>L</sub> is the impedance of inductor at fundamental frequency</li>
  </ul>
  <p>The rated reactive power is obtained by:</p>
  <p>Qc = (V<sup>2</sup> / X<sub>c</sub>) * (n<sup>2</sup> / n<sup>2</sup> -1 )</p>
  <p>where</p>
  <ul>
  <li>V is the nominal voltage</li>
  <li>X<sub>c</sub> is the impedance of capacitor at fundamental frequency</li>
  </ul>
  <p> Also, we have:</p>
  <p>X<sub>L</sub> = X<sub>c</sub> / n<sup>2</sup></p>

</body>
</html>"));
    end BpFilterTimeDomain;
  end Models;

  package Examples
      extends Modelica.Icons.ExamplesPackage;

    model TestBridge
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Inductance Lc = 0.002 "commutation inductance";
      parameter Modelica.Units.SI.Angle iniAngle1 = 0 "Initial sine 1 angle";
      parameter Modelica.Units.SI.Voltage VAC = 400 "RMS line-to-line";
      parameter Modelica.Units.SI.Frequency f = 50 "line frequency";
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
        Placement(visible = true, transformation(extent = {{50, -62}, {70, -42}}, rotation = 0)));
      Modelica.Blocks.Math.Mean mean(f = 100) annotation (
        Placement(visible = true, transformation(origin = {100, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 0.1, i(start = 0)) annotation (
        Placement(visible = true, transformation(origin = {60, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 5) annotation (
        Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Analog.Sensors.PotentialSensor uDC_ annotation (
        Placement(visible = true, transformation(extent = {{60, 30}, {80, 50}}, rotation = 0)));
      LCC_HVDC.Models.Bridge bridge(iniOff={false,false,true,true,true,true},
          vThyMax=(400)*(sqrt(2))) annotation (Placement(visible=true,
            transformation(
            origin={1.42859,11},
            extent={{-9.42859,-11},{12.5714,11}},
            rotation=0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1(phase = iniAngle1, f = f, V = VAC*sqrt(2/3)) annotation (
        Placement(visible = true, transformation(extent = {{-106, 22}, {-126, 42}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage2(f = f, phase = iniAngle1 - 2/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
        Placement(visible = true, transformation(extent = {{-106, 2}, {-126, 22}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage3(f = f, phase = iniAngle1 - 4/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
        Placement(visible = true, transformation(extent = {{-106, -18}, {-126, 2}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start = 0), L = inductor1.L) annotation (
        Placement(visible = true, transformation(extent = {{-66, 2}, {-46, 22}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start = 0), L = Lc) annotation (
        Placement(visible = true, transformation(origin = {-56.138, 31.6276}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor3(L = inductor1.L) annotation (
        Placement(visible = true, transformation(origin = {-55.061, -7.8754}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sensors.CurrentSensor i1 annotation (
        Placement(visible = true, transformation(extent = {{-98, 42}, {-78, 22}}, rotation = 0)));
      Modelica.Blocks.Math.RootMeanSquare I1rmsM(f = 50) annotation (
        Placement(visible = true, transformation(origin = {-88, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Blocks.Math.RealToBoolean realToBoolean[6] annotation (
        Placement(transformation(extent = {{-12, -50}, {8, -30}})));
      Modelica.Blocks.Sources.Pulse pulse6[6](width = fill(100*(110/360), 6), period = fill(0.02, 6), startTime = {6, 0, 30, 24, 18, 12}/1800) annotation (
        Placement(transformation(extent = {{-42, -50}, {-22, -30}})));
    equation
      connect(uDC_.p, Rdc.p) annotation (
        Line(points = {{60, 40}, {60, 30}}, color = {0, 0, 255}));
      connect(Rdc.n, Ldc.p) annotation (
        Line(points = {{60, 10}, {60, 2}}, color = {0, 0, 255}));
      connect(mean.u, uDC_.phi) annotation (
        Line(points = {{88, 16}, {84, 16}, {84, 40}, {81, 40}}, color = {0, 0, 127}));
      connect(uDC_.p, bridge.pin_p) annotation (
        Line(points={{60,40},{36,40},{36,17.6},{14.88,17.6}},          color = {0, 0, 255}));
      connect(inductor3.p, sineVoltage3.p) annotation (
        Line(points = {{-65.061, -7.8754}, {-84, -7.8754}, {-84, -8}, {-106, -8}}));
      connect(sineVoltage1.n, sineVoltage2.n) annotation (
        Line(points = {{-126, 32}, {-126, 12}}, color = {0, 0, 255}));
      connect(sineVoltage2.n, sineVoltage3.n) annotation (
        Line(points = {{-126, 12}, {-126, -8}}, color = {0, 0, 255}));
      connect(sineVoltage2.p, inductor2.p) annotation (
        Line(points = {{-106, 12}, {-66, 12}}, color = {0, 0, 255}));
      connect(sineVoltage1.p, i1.p) annotation (
        Line(points = {{-106, 32}, {-98, 32}}, color = {0, 0, 255}));
      connect(inductor1.p, i1.n) annotation (
        Line(points = {{-66.138, 31.6276}, {-74, 31.6276}, {-74, 32}, {-78, 32}}, color = {0, 0, 255}));
      connect(I1rmsM.u, i1.i) annotation (
        Line(points = {{-88, 46}, {-88, 43}}, color = {0, 0, 127}));
      connect(bridge.pin2, inductor2.n) annotation (
        Line(points = {{-8.88, 11}, {-28, 11}, {-28, 12}, {-46, 12}}, color = {0, 0, 255}));
      connect(bridge.pin3, inductor3.n) annotation (
        Line(points = {{-8.88, 6.38}, {-32, 6.38}, {-32, -7.8754}, {-45.061, -7.8754}}, color = {0, 0, 255}));
      connect(bridge.pin1, inductor1.n) annotation (
        Line(points = {{-8.88, 15.62}, {-32, 15.62}, {-32, 31.6276}, {-46.138, 31.6276}}, color = {0, 0, 255}));
      connect(realToBoolean.y, bridge.P) annotation (
        Line(points={{9,-40},{22,-40},{22,11},{15.54,11}},          color = {255, 0, 255}));
      connect(Ldc.n, bridge.pin_n) annotation (
        Line(points={{60,-18},{60,-30},{36,-30},{36,4.18},{14.88,4.18}},            color = {0, 0, 255}));
      connect(ground1.p, bridge.pin_n) annotation (
        Line(points={{60,-42},{60,-30},{36,-30},{36,4.18},{14.88,4.18}},            color = {0, 0, 255}));
      connect(pulse6.y, realToBoolean.u) annotation (
        Line(points = {{-21, -40}, {-14, -40}}, color = {0, 0, 127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -60}, {120, 80}})),
        experiment(StopTime = 0.1, Interval = 6e-05, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>

<p>This examples is created with a combination of bridge and PLL. Here the bridge is operated in inverter mode (alpha=140 degrees).</p>
<p>It is recommended to check the following.</p>
<ul>
<li>Voltage: <code>mean.u</code>, <code>mean.y</code></li>
<li>Current: <code>Rdc.i</code></li>
</ul>

</body>
</html>"));
    end TestBridge;

    model PllBridge
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Inductance Lc = 0.2e-3 "commutation inductance";
      parameter Modelica.Units.SI.Angle iniAngle1 = 0 "Initial sine 1 angle";
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      parameter Modelica.Units.SI.Voltage VAC = 400 "RMS line-to-line";
      parameter Modelica.Units.SI.Frequency f = 50 "line frequency";
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
        Placement(visible = true, transformation(extent = {{34, -62}, {54, -42}}, rotation = 0)));
      Modelica.Blocks.Math.Mean mean(f = 300) annotation (
        Placement(visible = true, transformation(origin = {84, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 0.005, i(fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {44, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 0.1) annotation (
        Placement(visible = true, transformation(origin = {44, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Analog.Sensors.PotentialSensor uDC_ annotation (
        Placement(visible = true, transformation(extent = {{44, 50}, {64, 70}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(V = 0, duration = 0.08, offset = 440) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {44, -20})));
      LCC_HVDC.Models.Bridge bridge(iniOff={true,true,true,false,false,true},
          vThyMax=(400)*(sqrt(2))) annotation (Placement(visible=true,
            transformation(
            origin={-10.5714,13},
            extent={{-9.42861,-11},{12.5714,11}},
            rotation=0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1(phase = iniAngle1, f = f, V = VAC*sqrt(2/3)) annotation (
        Placement(visible = true, transformation(extent = {{-116, 22}, {-136, 42}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage2(f = f, phase = iniAngle1 - 2/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
        Placement(visible = true, transformation(extent = {{-116, 2}, {-136, 22}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage3(f = f, phase = iniAngle1 - 4/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
        Placement(visible = true, transformation(extent = {{-116, -18}, {-136, 2}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start = -iStart), L = inductor1.L) annotation (
        Placement(visible = true, transformation(extent = {{-72, 2}, {-52, 22}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start = iStart), L = Lc) annotation (
        Placement(visible = true, transformation(origin = {-62.138, 31.6276}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor3(L = inductor1.L) annotation (
        Placement(visible = true, transformation(origin = {-61.061, -7.8754}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sensors.CurrentSensor i1 annotation (
        Placement(visible = true, transformation(extent = {{-108, 42}, {-88, 22}}, rotation = 0)));
      Modelica.Blocks.Math.RootMeanSquare I1rmsM(f = 50) annotation (
        Placement(visible = true, transformation(origin = {-98, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin1(k = 1) annotation (
        Placement(visible = true, transformation(origin = {-108, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin2(k = 2) annotation (
        Placement(visible = true, transformation(origin = {-96, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin3(k = 3) annotation (
        Placement(visible = true, transformation(origin = {-86, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      LCC_HVDC.Models.PllPolePulser pLLPulser(BlockTime=0.111247, vNom=400)
        annotation (Placement(visible=true, transformation(
            origin={-8,-40.4616},
            extent={{-12,-5.53843},{12,18.4616}},
            rotation=0)));
      Modelica.Blocks.Sources.Constant Fire(k = 140) annotation (
        Placement(visible = true, transformation(origin = {-49, -59}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
    equation
      connect(uDC_.p, Rdc.p) annotation (
        Line(points = {{44, 60}, {44, 48}}, color = {0, 0, 255}));
      connect(Rdc.n, Ldc.p) annotation (
        Line(points = {{44, 28}, {44, 20}}, color = {0, 0, 255}));
      connect(mean.u, uDC_.phi) annotation (
        Line(points = {{72, 34}, {68, 34}, {68, 60}, {65, 60}}, color = {0, 0, 127}));
      connect(Ldc.n, rampVoltage.n) annotation (
        Line(points = {{44, 0}, {44, -10}}, color = {0, 0, 255}));
      connect(rampVoltage.p,ground1. p) annotation (
        Line(points = {{44, -30}, {44, -42}}, color = {0, 0, 255}));
      connect(uDC_.p, bridge.pin_p) annotation (
        Line(points = {{44, 60}, {20, 60}, {20, 19.6}, {2.88, 19.6}}, color = {0, 0, 255}));
      connect(bridge.pin_n, rampVoltage.p) annotation (
        Line(points = {{2.88, 6.18}, {20, 6.18}, {20, -30}, {44, -30}}, color = {0, 0, 255}));
      connect(inductor3.p, sineVoltage3.p) annotation (
        Line(points = {{-71.061, -7.8754}, {-94, -7.8754}, {-94, -8}, {-116, -8}}));
      connect(sineVoltage1.n, sineVoltage2.n) annotation (
        Line(points = {{-136, 32}, {-136, 12}}, color = {0, 0, 255}));
      connect(sineVoltage2.n, sineVoltage3.n) annotation (
        Line(points = {{-136, 12}, {-136, -8}}, color = {0, 0, 255}));
      connect(sineVoltage2.p, inductor2.p) annotation (
        Line(points = {{-116, 12}, {-72, 12}}, color = {0, 0, 255}));
      connect(sineVoltage1.p, i1.p) annotation (
        Line(points = {{-116, 32}, {-108, 32}}, color = {0, 0, 255}));
      connect(inductor1.p, i1.n) annotation (
        Line(points = {{-72.138, 31.6276}, {-80, 31.6276}, {-80, 32}, {-88, 32}}, color = {0, 0, 255}));
      connect(I1rmsM.u, i1.i) annotation (
        Line(points = {{-98, 46}, {-98, 43}}, color = {0, 0, 127}));
      connect(toPin2.pin_p, inductor2.p) annotation (
        Line(points = {{-96, -20}, {-96, 12}, {-72, 12}}, color = {0, 0, 255}));
      connect(toPin1.pin_p, i1.p) annotation (
        Line(points = {{-108, -20}, {-108, 32}}, color = {0, 0, 255}));
      connect(toPin3.pin_p, sineVoltage3.p) annotation (
        Line(points = {{-86, -20}, {-86, -7.8754}, {-91.646, -7.8754}, {-91.646, -8}, {-116, -8}}, color = {0, 0, 255}));
      connect(toPin1.plug_p, toPin3.plug_p) annotation (
        Line(points = {{-108, -24}, {-108, -34}, {-86, -34}, {-86, -24}}, color = {0, 0, 255}));
      connect(toPin2.plug_p, toPin3.plug_p) annotation (
        Line(points = {{-96, -24}, {-96, -34}, {-86, -34}, {-86, -24}}, color = {0, 0, 255}));
      connect(bridge.pin2, inductor2.n) annotation (
        Line(points={{-20.88,13},{-38,13},{-38,12},{-52,12}},          color = {0, 0, 255}));
      connect(bridge.pin3, inductor3.n) annotation (
        Line(points={{-20.88,8.38},{-38,8.38},{-38,-7.8754},{-51.061,-7.8754}},          color = {0, 0, 255}));
      connect(bridge.pin1, inductor1.n) annotation (
        Line(points={{-20.88,17.62},{-38,17.62},{-38,31.6276},{-52.138,31.6276}},          color = {0, 0, 255}));
      connect(Fire.y,pLLPulser.alpha)  annotation (
        Line(points={{-36.9,-59},{-36.9,-60},{-7.88,-60},{-7.88,-47.56}},          color = {0, 0, 127}));
      connect(pLLPulser.pY, bridge.P) annotation (
        Line(points = {{5.44, -26.8}, {12, -26.8}, {12, 13}, {3.54, 13}}, color = {255, 0, 255}));
      connect(pLLPulser.ac3Phase, toPin2.plug_p) annotation (
        Line(points={{-20.24,-34},{-96,-34},{-96,-24}},        color = {0, 0, 255}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -80}, {100, 80}})),
        experiment(StopTime = 0.3, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>

<p>In this example, the performance of two models namely PllPolePulser and Bridge are tested. PllPolePulser contains PLL and pulse generator. Here the bridge is operated in inverter mode (alpha=140 degrees).</p>
<p>It is recommended to check the following.</p>
<ul>
<li>Voltage: <code>mean.u</code>, <code>mean.y</code></li>
<li>Current: <code>Rdc.i</code></li>
</ul>
<p> To see the accuracy of pulse timing you can check:</p>
<ul>
<li><code>bridge.thyristor1.fire</code></li>
<li><code>bridge.thyristor1.v</code></li>
<li><code>bridge.Vrs</code></li>
<li><code>bridge.Vts</code></li>
</ul>

</body>
</html>"));
    end PllBridge;

    model TestPLL
      import PI = Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      Modelica.Blocks.Sources.Step step[3](height = fill(0.5, 3), startTime = fill(0.5, 3)) annotation (
        Placement(transformation(extent = {{-58, -38}, {-38, -18}})));
      Modelica.Blocks.Math.Add add[3] annotation (
        Placement(transformation(extent = {{-20, -2}, {0, 18}})));
      Modelica.Blocks.Math.Gain gain[3](k = fill(pLL.vNom, 3)) annotation (
        Placement(transformation(extent = {{10, -2}, {30, 18}})));
      Modelica.Blocks.Sources.Sine sines[3](amplitude = fill(1, 3), f = fill(50, 3), phase = {0, -2/3*PI, 2/3*PI}, offset = fill(0, 3), startTime = fill(0, 3)) annotation (
        Placement(transformation(extent = {{-62, 8}, {-42, 28}})));
      LCC_HVDC.Models.PLL pLL(vNom=1)
        annotation (Placement(transformation(extent={{46,-2},{66,18}})));
    equation
      connect(step.y, add.u2) annotation (
        Line(points = {{-37, -28}, {-32, -28}, {-32, 2}, {-22, 2}}, color = {0, 0, 127}));
      connect(gain.u, add.y) annotation (
        Line(points = {{8, 8}, {1, 8}}, color = {0, 0, 127}));
      connect(sines.y, add.u1) annotation (
        Line(points = {{-41, 18}, {-32, 18}, {-32, 14}, {-22, 14}}, color = {0, 0, 127}));
      connect(pLL.u, gain.y) annotation (
        Line(points = {{44, 8}, {31, 8}}, color = {0, 0, 127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -60}, {80, 60}}, initialScale = 0.1)),
        experiment(StopTime = 0.7, StartTime = 0, Tolerance = 1e-06, Interval = 0.0014),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>

<p>This examples intends to show that this PLL models ensures the accurcy of frequency and phase measrement even in case a a step increase in the voltage supply.</p>
<p>It is recommended to check the following.</p>
<ul>
<li>Phase: <code>pLL.thetaRad</code></li>
<li>Frequency: <code>pLL.fHz</code></li>
<li>Input voltage of PLL: <code>add[].y</code></li>
</ul>

</body>
</html>"));
    end TestPLL;

    model TestPulser
      extends Modelica.Icons.Example;
      Modelica.Blocks.Continuous.Integrator integrator1[6] annotation (
        Placement(transformation(extent={{-82,-2},{-62,18}})));
      Modelica.Blocks.Sources.Constant const5[6](k = fill(50, 6)) annotation (
        Placement(visible = true, transformation(origin={-106,8},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain toRad1[6](k = fill(2*Modelica.Constants.pi, 6)) annotation (
        Placement(transformation(extent={{-48,-2},{-28,18}})));
      Modelica.Blocks.Sources.Constant ConstantFire[6](k = fill(20, 6)) "degree" annotation (
        Placement(visible = true, transformation(origin={-106,-30},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      LCC_HVDC.Models.PulseGeneratorY pulserY
        annotation (Placement(transformation(extent={{14,-6},{40,18}})));
      LCC_HVDC.Models.Mod mod1[6]
        annotation (Placement(transformation(extent={{-18,-2},{2,18}})));
      Modelica.Blocks.Sources.Constant ConstantFire1[6](k = {7.5, 6, 4.5, 3, 1.5, 0}) "degree" annotation (
        Placement(visible = true, transformation(origin={68,-28},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add pulseTrain[6](each k1 = +1, each k2 = +1) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={110,0})));
      Modelica.Blocks.Math.BooleanToReal booleanToReal[6] annotation (
        Placement(transformation(extent={{58,-4},{78,16}})));
    equation
      connect(const5.y, integrator1.u) annotation (
        Line(points={{-95,8},{-84,8}},      color = {0, 0, 127}));
      connect(integrator1.y, toRad1.u) annotation (
        Line(points={{-61,8},{-50,8}},      color = {0, 0, 127}));
      connect(ConstantFire.y,pulserY.firingAngle)  annotation (
        Line(points={{-95,-30},{6,-30},{6,2.52},{11.79,2.52}},            color = {0, 0, 127}));
      connect(toRad1.y, mod1.u) annotation (
        Line(points={{-27,8},{-20,8}},     color = {0, 0, 127}));
      connect(mod1.y, pulserY.wt) annotation (Line(points={{3,8},{6,8},{6,9.72},
              {11.79,9.72}}, color={0,0,127}));
      connect(pulserY.y, booleanToReal.u) annotation (
        Line(points={{42.34,6},{56,6}},      color = {255, 0, 255}));
      connect(booleanToReal.y,pulseTrain. u1) annotation (
        Line(points={{79,6},{98,6}},       color = {0, 0, 127}));
      connect(ConstantFire1.y,pulseTrain. u2) annotation (
        Line(points={{79,-28},{90,-28},{90,-6},{98,-6}},             color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false)),
        Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-120,-60},{120,
                40}})),
        experiment(StopTime = 0.4, StartTime = 0, Tolerance = 1e-06, Interval = 10e-05),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>

<p>The objective of this examples is to show the output of this Pulse generator i.e. a set of six pulses with among which there is a 60-degree phase difference.</p>
<p>The phase input is a not a taken from an actual voltage source but it is a based on a fixed 50 Hz frequency.</p>
<p>It is recommended to check the following:</p>
<ul>
<li><code>pulserY.y[j]</code> (j=1,2,..6)</li>
</ul>

</body>
</html>
________"));
    end TestPulser;

    model SixPulseInverter
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Inductance Lc = 0.2e-3 "commutation inductance";
      parameter Modelica.Units.SI.Angle iniAngle1 = 0 "Initial sine 1 angle";
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      parameter Modelica.Units.SI.Voltage VAC = 400 "RMS line-to-line";
      parameter Modelica.Units.SI.Frequency f = 50 "line frequency";
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
        Placement(visible = true, transformation(extent = {{34, -62}, {54, -42}}, rotation = 0)));
      Modelica.Blocks.Math.Mean mean(f = 300) annotation (
        Placement(visible = true, transformation(origin = {84, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 0.005, i(fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {44, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 0.1) annotation (
        Placement(visible = true, transformation(origin = {44, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Analog.Sensors.PotentialSensor uDC_ annotation (
        Placement(visible = true, transformation(extent = {{44, 50}, {64, 70}}, rotation = 0)));
      Modelica.Blocks.Routing.Replicator replicator1(nout = 6) annotation (
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Routing.Replicator replicator2(nout = 6) annotation (
        Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {-72, -88})));
      Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(V = 0, duration = 0.08, offset = 440) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {44, -20})));
      LCC_HVDC.Models.PulseGeneratorY pulserY(BlockTime=0.111247) annotation (
          Placement(visible=true, transformation(
            origin={-32.0466,-59},
            extent={{-11.917,-11},{11.917,11}},
            rotation=0)));
      LCC_HVDC.Models.Bridge bridge(
        iniOff={true,true,true,false,false,true},
        Goff=1e-6,
        vThyMax=(400)*(sqrt(2))) annotation (Placement(visible=true,
            transformation(
            origin={-34.1714,12},
            extent={{-10.6286,-12},{14.1714,12}},
            rotation=0)));
      LCC_HVDC.Models.PLL pLL(vNom=400, Ti=60/1400) annotation (Placement(
            visible=true, transformation(
            origin={-2,0},
            extent={{-112,-70},{-92,-50}},
            rotation=0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1(phase = iniAngle1, f = f, V = VAC*sqrt(2/3)) annotation (
        Placement(visible = true, transformation(extent = {{-170, 22}, {-190, 42}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage2(f = f, phase = iniAngle1 - 2/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
        Placement(visible = true, transformation(extent = {{-170, 2}, {-190, 22}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage3(f = f, phase = iniAngle1 - 4/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
        Placement(visible = true, transformation(extent = {{-170, -18}, {-190, 2}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start = -iStart), L = inductor1.L) annotation (
        Placement(visible = true, transformation(extent = {{-126, 2}, {-106, 22}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start = iStart), L = Lc) annotation (
        Placement(visible = true, transformation(origin = {-116.138, 31.6276}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor3(L = inductor1.L) annotation (
        Placement(visible = true, transformation(origin = {-115.061, -7.8754}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sensors.CurrentSensor i1 annotation (
        Placement(visible = true, transformation(extent = {{-162, 42}, {-142, 22}}, rotation = 0)));
      Modelica.Blocks.Math.RootMeanSquare I1rmsM(f = 50) annotation (
        Placement(visible = true, transformation(origin = {-152, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin1(k = 1) annotation (
        Placement(visible = true, transformation(origin = {-162, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin2(k = 2) annotation (
        Placement(visible = true, transformation(origin = {-150, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin3(k = 3) annotation (
        Placement(visible = true, transformation(origin = {-140, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Electrical.Polyphase.Basic.MultiDelta delta(final m = 3) "Delta connection" annotation (
        Placement(visible = true, transformation(origin = {-152, -60}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
      Modelica.Electrical.Polyphase.Sensors.VoltageSensor voltageSensor(final m = 3) "Voltage sensor" annotation (
        Placement(visible = true, transformation(origin = {-134, -60}, extent = {{8, 8}, {-8, -8}}, rotation = 270)));
      Modelica.Blocks.Sources.Constant Fire(k = 140) annotation (
        Placement(visible = true, transformation(origin = {-106, -88}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(uDC_.p, Rdc.p) annotation (
        Line(points = {{44, 60}, {44, 48}}, color = {0, 0, 255}));
      connect(Rdc.n, Ldc.p) annotation (
        Line(points = {{44, 28}, {44, 20}}, color = {0, 0, 255}));
      connect(mean.u, uDC_.phi) annotation (
        Line(points = {{72, 34}, {68, 34}, {68, 60}, {65, 60}}, color = {0, 0, 127}));
      connect(Ldc.n, rampVoltage.n) annotation (
        Line(points = {{44, 0}, {44, -10}}, color = {0, 0, 255}));
      connect(rampVoltage.p,ground1. p) annotation (
        Line(points = {{44, -30}, {44, -42}}, color = {0, 0, 255}));
      connect(uDC_.p, bridge.pin_p) annotation (
        Line(points = {{44, 60}, {20, 60}, {20, 19.2}, {-19.008, 19.2}}, color = {0, 0, 255}));
      connect(bridge.pin_n, rampVoltage.p) annotation (
        Line(points = {{-19.008, 4.56}, {20, 4.56}, {20, -30}, {44, -30}}, color = {0, 0, 255}));
      connect(pLL.thetaRad, replicator1.u) annotation (
        Line(points = {{-93, -66}, {-88, -66}, {-88, -60}, {-84, -60}}, color = {0, 0, 127}));
      connect(inductor3.p, sineVoltage3.p) annotation (
        Line(points = {{-125.061, -7.8754}, {-148, -7.8754}, {-148, -8}, {-170, -8}}));
      connect(sineVoltage1.n, sineVoltage2.n) annotation (
        Line(points = {{-190, 32}, {-190, 12}}, color = {0, 0, 255}));
      connect(sineVoltage2.n, sineVoltage3.n) annotation (
        Line(points = {{-190, 12}, {-190, -8}}, color = {0, 0, 255}));
      connect(sineVoltage2.p, inductor2.p) annotation (
        Line(points = {{-170, 12}, {-126, 12}}, color = {0, 0, 255}));
      connect(sineVoltage1.p, i1.p) annotation (
        Line(points = {{-170, 32}, {-162, 32}}, color = {0, 0, 255}));
      connect(inductor1.p, i1.n) annotation (
        Line(points = {{-126.138, 31.6276}, {-134, 31.6276}, {-134, 32}, {-142, 32}}, color = {0, 0, 255}));
      connect(I1rmsM.u, i1.i) annotation (
        Line(points = {{-152, 46}, {-152, 43}}, color = {0, 0, 127}));
      connect(toPin2.pin_p, inductor2.p) annotation (
        Line(points = {{-150, -32}, {-150, 12}, {-126, 12}}, color = {0, 0, 255}));
      connect(toPin1.pin_p, i1.p) annotation (
        Line(points = {{-162, -32}, {-162, 32}}, color = {0, 0, 255}));
      connect(toPin3.pin_p, sineVoltage3.p) annotation (
        Line(points = {{-140, -32}, {-140, -7.8754}, {-145.646, -7.8754}, {-145.646, -8}, {-170, -8}}, color = {0, 0, 255}));
      connect(voltageSensor.plug_p, delta.plug_n) annotation (
        Line(points = {{-134, -68}, {-152, -68}}, color = {0, 0, 255}));
      connect(toPin1.plug_p, toPin3.plug_p) annotation (
        Line(points = {{-162, -36}, {-162, -42}, {-140, -42}, {-140, -36}}, color = {0, 0, 255}));
      connect(toPin2.plug_p, toPin3.plug_p) annotation (
        Line(points = {{-150, -36}, {-150, -42}, {-140, -42}, {-140, -36}}, color = {0, 0, 255}));
      connect(voltageSensor.plug_n, delta.plug_p) annotation (
        Line(points = {{-134, -52}, {-152, -52}}, color = {0, 0, 255}));
      connect(delta.plug_n, toPin3.plug_p) annotation (
        Line(points = {{-152, -68}, {-162, -68}, {-162, -42}, {-140, -42}, {-140, -36}}, color = {0, 0, 255}));
      connect(voltageSensor.v, pLL.u) annotation (
        Line(points = {{-125.2, -60}, {-116, -60}}, color = {0, 0, 127}));
      connect(bridge.pin2, inductor2.n) annotation (
        Line(points = {{-45.792, 12}, {-106, 12}}, color = {0, 0, 255}));
      connect(bridge.pin3, inductor3.n) annotation (
        Line(points = {{-45.792, 6.96}, {-60, 6.96}, {-60, -7.8754}, {-105.061, -7.8754}}, color = {0, 0, 255}));
      connect(bridge.pin1, inductor1.n) annotation (
        Line(points = {{-45.792, 17.04}, {-60, 17.04}, {-60, 31.6276}, {-106.138, 31.6276}}, color = {0, 0, 255}));
      connect(pulserY.wt, replicator1.y) annotation (Line(points={{-45.9895,-55.59},
              {-60,-55.59},{-60,-60},{-61,-60}}, color={0,0,127}));
      connect(bridge.P, pulserY.y) annotation (
        Line(points={{-18.264,12},{0,12},{0,-59},{-17.9845,-59}},          color = {255, 0, 255}));
      connect(pulserY.firingAngle, replicator2.y) annotation (
        Line(points = {{-45.9895, -62.19}, {-54, -62.19}, {-54, -88}, {-63.2, -88}}, color = {0, 0, 127}));
      connect(Fire.y, replicator2.u) annotation (
        Line(points = {{-99.4, -88}, {-81.6, -88}}, color = {0, 0, 127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 80}})),
        experiment(StopTime = 0.3, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>

<p>This examples is created with a combination of <code>bridge</code> and <code>PLL</code>. Here the bridge is operated in inverter mode (alpha=140 degrees).</p>
<p>It is recommended to check the following:</p>
<ul>
<li>Voltage: <code>mean.u</code>, <code>mean.y</code></li>
<li>Current: <code>Rdc.i</code></li>
</ul>

</body>
</html>"));
    end SixPulseInverter;

    model TestTransformer
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      Real vrs =transformer.primary3phase.pin[1].v  -transformer.primary3phase.pin[
          2].v;
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
        Placement(visible = true, transformation(extent = {{66, -90}, {82, -74}}, rotation = 0)));
      Modelica.Blocks.Math.Mean mean(f = 600) annotation (
        Placement(visible = true, transformation(origin = {34, -22}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 225e-3, i(start = 0)) annotation (
        Placement(visible = true, transformation(origin = {64, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 0.1) annotation (
        Placement(visible = true, transformation(origin = {38, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      LCC_HVDC.Models.Bridge bridgeHV(iniOff={true,true,true,false,false,true})
        annotation (Placement(visible=true, transformation(
            origin={-34.8572,14},
            extent={{-11.1428,-12},{14.8572,12}},
            rotation=0)));
      LCC_HVDC.Models.PllPolePulser converterUnitControl(BlockTime=0.111247,
          vNom=400e3) annotation (Placement(visible=true, transformation(
            origin={-104,-70.4615},
            extent={{-14,-5.53847},{14,18.4615}},
            rotation=0)));
      Modelica.Blocks.Sources.Constant Fire(k = 10) annotation (
        Placement(visible = true, transformation(origin = {-146, -90}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
        Placement(transformation(origin = {-180, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
        Placement(transformation(origin = {-191, -37}, extent = {{-11, -9}, {11, 9}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground groundS annotation (
        Placement(transformation(extent = {{-198, -74}, {-184, -60}})));
      Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
        Placement(transformation(extent = {{-168, 2}, {-150, 18}})));
      Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3)) annotation (
        Placement(transformation(extent = {{-146, 0}, {-126, 20}})));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p r1(k = 1) annotation (
        Placement(visible = true, transformation(origin = {-65, 28}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p s1(k = 2) annotation (
        Placement(visible = true, transformation(origin = {-65, 14}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p t1(k = 3) annotation (
        Placement(visible = true, transformation(origin = {-65, 0}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      LCC_HVDC.Models.ThreeWindingTransformer transformer
        annotation (Placement(transformation(extent={{-118,-4},{-90,22}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 490e3) annotation (
        Placement(visible = true, transformation(origin = {78, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Inductor Ldc1(L = 225e-3, i(start = 0)) annotation (
        Placement(visible = true, transformation(origin = {64, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor Rdc1(R = 0.1) annotation (
        Placement(visible = true, transformation(origin = {38, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sensors.VoltageSensor UDC annotation (
        Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 270, origin = {18, -2})));
      LCC_HVDC.Models.Bridge bridgeHV1(iniOff={true,true,true,false,false,true})
        annotation (Placement(visible=true, transformation(
            origin={-34.8572,-34},
            extent={{-11.1428,-12},{14.8572,12}},
            rotation=0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p r2(k = 1) annotation (
        Placement(visible = true, transformation(origin = {-65, -20}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p s2(k = 2) annotation (
        Placement(visible = true, transformation(origin = {-65, -34}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p t2(k = 3) annotation (
        Placement(visible = true, transformation(origin = {-65, -48}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
    equation
      connect(starS.pin_n, groundS.p) annotation (
        Line(points = {{-191, -48}, {-191, -60}}, color = {0, 0, 255}));
      connect(FS_R.plug_p, Vsource.plug_p) annotation (
        Line(points = {{-168, 10}, {-170, 10}}, color = {0, 0, 255}));
      connect(FS_R.plug_n, FS_L.plug_p) annotation (
        Line(points = {{-150, 10}, {-146, 10}}, color = {0, 0, 255}));
      connect(Vsource.plug_n, starS.plug_p) annotation (
        Line(points = {{-190, 10}, {-190, -26}, {-191, -26}}, color = {0, 0, 255}));
      connect(r1.plug_p, t1.plug_p) annotation (
        Line(points = {{-66.8, 28}, {-74, 28}, {-74, 0}, {-66.8, 0}}, color = {0, 0, 255}));
      connect(s1.plug_p, t1.plug_p) annotation (
        Line(points = {{-66.8, 14}, {-74, 14}, {-74, 0}, {-66.8, 0}}, color = {0, 0, 255}));
      connect(r1.pin_p, bridgeHV.pin1) annotation (
        Line(points = {{-63.2, 28}, {-58, 28}, {-58, 19.04}, {-47.04, 19.04}}, color = {0, 0, 255}));
      connect(s1.pin_p, bridgeHV.pin2) annotation (
        Line(points = {{-63.2, 14}, {-47.04, 14}}, color = {0, 0, 255}));
      connect(bridgeHV.pin3, t1.pin_p) annotation (
        Line(points = {{-47.04, 8.96}, {-58, 8.96}, {-58, 0}, {-63.2, 0}}, color = {0, 0, 255}));
      connect(FS_L.plug_n,transformer.primary3phase)  annotation (
        Line(points = {{-126, 10}, {-118, 10}, {-118, 9}}, color = {0, 0, 255}));
      connect(transformer.secondary3phase, t1.plug_p) annotation (
        Line(points = {{-89.72, 12.9}, {-89.72, 14}, {-74, 14}, {-74, 0}, {-66.8, 0}}, color = {0, 0, 255}));
      connect(converterUnitControl.ac3Phase, FS_L.plug_n) annotation (
        Line(points={{-118.28,-64},{-125.66,-64},{-125.66,10},{-126,10}},          color = {0, 0, 255}));
      connect(Ldc.p, Rdc.n) annotation (
        Line(points = {{54, 46}, {48, 46}}, color = {0, 0, 255}));
      connect(Rdc.p, bridgeHV.pin_p) annotation (
        Line(points = {{28, 46}, {8, 46}, {8, 21.2}, {-18.96, 21.2}}, color = {0, 0, 255}));
      connect(Ldc1.p, Rdc1.n) annotation (
        Line(points = {{54, -64}, {48, -64}}, color = {0, 0, 255}));
      connect(constantVoltage.p, Ldc.n) annotation (
        Line(points = {{78, -2}, {78, 46}, {74, 46}}, color = {0, 0, 255}));
      connect(constantVoltage.n, Ldc1.n) annotation (
        Line(points = {{78, -22}, {78, -64}, {74, -64}}, color = {0, 0, 255}));
      connect(UDC.v, mean.u) annotation (
        Line(points = {{9.2, -2}, {10, -2}, {10, -22}, {24.4, -22}}, color = {0, 0, 127}));
      connect(s2.pin_p, bridgeHV1.pin2) annotation (
        Line(points = {{-63.2, -34}, {-47.04, -34}}, color = {0, 0, 255}));
      connect(bridgeHV1.pin1, r2.pin_p) annotation (
        Line(points = {{-47.04, -28.96}, {-58, -28.96}, {-58, -20}, {-63.2, -20}}, color = {0, 0, 255}));
      connect(bridgeHV1.pin3, t2.pin_p) annotation (
        Line(points = {{-47.04, -39.04}, {-58, -39.04}, {-58, -48}, {-63.2, -48}}, color = {0, 0, 255}));
      connect(r2.plug_p, t2.plug_p) annotation (
        Line(points = {{-66.8, -20}, {-72, -20}, {-72, -48}, {-66.8, -48}}, color = {0, 0, 255}));
      connect(s2.plug_p, t2.plug_p) annotation (
        Line(points = {{-66.8, -34}, {-72, -34}, {-72, -48}, {-66.8, -48}}, color = {0, 0, 255}));
      connect(transformer.tertiary3phase, t2.plug_p) annotation (
        Line(points = {{-89.72, 5.1}, {-80, 5.1}, {-80, -34}, {-72, -34}, {-72, -48}, {-66.8, -48}}, color = {0, 0, 255}));
      connect(converterUnitControl.pY, bridgeHV.P) annotation (
        Line(points = {{-88.32, -56.8}, {-2, -56.8}, {-2, 14}, {-18.18, 14}}, color = {255, 0, 255}));
      connect(converterUnitControl.pD, bridgeHV1.P) annotation (
        Line(points={{-88.32,-71.44},{-8,-71.44},{-8,-34},{-18.18,-34}},          color = {255, 0, 255}));
      connect(bridgeHV.pin_n, bridgeHV1.pin_p) annotation (
        Line(points = {{-18.96, 6.56}, {-12, 6.56}, {-12, -26.8}, {-18.96, -26.8}}, color = {0, 0, 255}));
      connect(Rdc1.p, bridgeHV1.pin_n) annotation (
        Line(points = {{28, -64}, {10, -64}, {10, -41.44}, {-18.96, -41.44}}, color = {0, 0, 255}));
      connect(UDC.p, bridgeHV.pin_p) annotation (
        Line(points = {{18, 6}, {18, 46}, {8, 46}, {8, 21.2}, {-18.96, 21.2}}, color = {0, 0, 255}));
      connect(ground1.p, Ldc1.n) annotation (
        Line(points = {{74, -74}, {74, -64}}, color = {0, 0, 255}));
      connect(UDC.n, bridgeHV1.pin_n) annotation (
        Line(points = {{18, -10}, {18, -64}, {10, -64}, {10, -41.44}, {-18.96, -41.44}}, color = {0, 0, 255}));
      connect(converterUnitControl.alpha, Fire.y) annotation (
        Line(points={{-103.86,-77.56},{-103.86,-90},{-139.4,-90}},        color = {0, 0, 127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 80}})),
        experiment(StopTime = 0.3, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
        Documentation(info = "<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>This example shows the performance of the 3-phase three winding transformer model of this package.</p>
  <p>To see the effect of your chosen value of transformer ratio and to observe the 30-degree phase shift between the Y and D voltages of the secondary and tertiary, you can check:</p>
  <ul>
    <li>L-L voltage of primary side: <code>vrs</code></li>
    <li>L-L voltage of secondary side: <code>bridgeHV.Vrs</code></li>
    <li>L-L voltage of tertiary side: <code>bridgeHV1.Vrs</code></li>
  </ul>
</body>
</html>"));
    end TestTransformer;

    model TestController
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
        Placement(visible = true, transformation(extent = {{66, -66}, {82, -50}}, rotation = 0)));
      Modelica.Blocks.Math.Mean vMean(f = 600, x0 = 0.5e6) annotation (
        Placement(visible = true, transformation(origin = {34, 2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 225e-3, i(start = 0)) annotation (
        Placement(visible = true, transformation(origin = {74, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 0.1) annotation (
        Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      LCC_HVDC.Models.Bridge bridgeHV(iniOff={true,true,true,false,false,true})
        annotation (Placement(visible=true, transformation(
            origin={-34.8572,38},
            extent={{-11.1428,-12},{14.8572,12}},
            rotation=0)));
      LCC_HVDC.Models.PllPolePulser converterUnitControl(BlockTime=0.111247,
          vNom=400e3) annotation (Placement(visible=true, transformation(
            origin={-104,-40},
            extent={{-14,-5.99996},{14,20}},
            rotation=0)));
      Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
        Placement(transformation(origin = {-180, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
        Placement(transformation(origin = {-191, -13}, extent = {{-11, -9}, {11, 9}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground groundS annotation (
        Placement(transformation(extent = {{-198, -50}, {-184, -36}})));
      Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
        Placement(transformation(extent = {{-168, 26}, {-150, 42}})));
      Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3)) annotation (
        Placement(transformation(extent = {{-146, 24}, {-126, 44}})));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p r1(k = 1) annotation (
        Placement(visible = true, transformation(origin = {-65, 52}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p s1(k = 2) annotation (
        Placement(visible = true, transformation(origin = {-65, 38}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p t1(k = 3) annotation (
        Placement(visible = true, transformation(origin = {-65, 24}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      LCC_HVDC.Models.ThreeWindingTransformer transformer
        annotation (Placement(transformation(extent={{-118,20},{-88,48}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 480e3) annotation (
        Placement(visible = true, transformation(origin = {88, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Inductor Ldc1(L = 225e-3, i(start = 0)) annotation (
        Placement(visible = true, transformation(origin = {64, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor Rdc1(R = 0.1) annotation (
        Placement(visible = true, transformation(origin = {38, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sensors.VoltageSensor UDC annotation (
        Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 270, origin = {16, 22})));
      LCC_HVDC.Models.Bridge bridgeHV1(iniOff={true,true,true,false,false,true})
        annotation (Placement(visible=true, transformation(
            origin={-34.8572,-4},
            extent={{-11.1428,-12},{14.8572,12}},
            rotation=0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p r2(k = 1) annotation (
        Placement(visible = true, transformation(origin = {-65, 10}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p s2(k = 2) annotation (
        Placement(visible = true, transformation(origin = {-65, -4}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p t2(k = 3) annotation (
        Placement(visible = true, transformation(origin = {-65, -18}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
        Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 180, origin = {-27, -91})));
      LCC_HVDC.Models.PoleControl poleControl annotation (Placement(visible=
              true, transformation(
            origin={-3.875,-2},
            extent={{-88.125,-78},{-58.125,-56}},
            rotation=0)));
      Modelica.Blocks.Sources.Constant vRefS1(k = 0.90) annotation (
        Placement(visible = true, transformation(origin = {-27, -59}, extent = {{-7, -7}, {7, 7}}, rotation = 180)));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
        Placement(transformation(extent = {{20, 62}, {36, 78}})));
      Modelica.Blocks.Math.Mean iMean(f = 600) annotation (
        Placement(visible = true, transformation(origin = {42, 48}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression V_dc(y = vMean.y) annotation (
        Placement(visible = true, transformation(origin = {-26, -46}, extent = {{-10, -8}, {10, 8}}, rotation = 180)));
      Modelica.Blocks.Sources.RealExpression i_dc(y = iMean.y) annotation (
        Placement(visible = true, transformation(origin = {-28, -74}, extent = {{-10, -8}, {10, 8}}, rotation = 180)));
    equation
      connect(starS.pin_n, groundS.p) annotation (
        Line(points = {{-191, -24}, {-191, -36}}, color = {0, 0, 255}));
      connect(FS_R.plug_p, Vsource.plug_p) annotation (
        Line(points = {{-168, 34}, {-170, 34}}, color = {0, 0, 255}));
      connect(FS_R.plug_n, FS_L.plug_p) annotation (
        Line(points = {{-150, 34}, {-146, 34}}, color = {0, 0, 255}));
      connect(Vsource.plug_n, starS.plug_p) annotation (
        Line(points = {{-190, 34}, {-190, -2}, {-191, -2}}, color = {0, 0, 255}));
      connect(r1.plug_p, t1.plug_p) annotation (
        Line(points = {{-66.8, 52}, {-74, 52}, {-74, 24}, {-66.8, 24}}, color = {0, 0, 255}));
      connect(s1.plug_p, t1.plug_p) annotation (
        Line(points = {{-66.8, 38}, {-74, 38}, {-74, 24}, {-66.8, 24}}, color = {0, 0, 255}));
      connect(r1.pin_p, bridgeHV.pin1) annotation (
        Line(points = {{-63.2, 52}, {-58, 52}, {-58, 43.04}, {-47.04, 43.04}}, color = {0, 0, 255}));
      connect(s1.pin_p, bridgeHV.pin2) annotation (
        Line(points = {{-63.2, 38}, {-47.04, 38}}, color = {0, 0, 255}));
      connect(bridgeHV.pin3, t1.pin_p) annotation (
        Line(points = {{-47.04, 32.96}, {-58, 32.96}, {-58, 24}, {-63.2, 24}}, color = {0, 0, 255}));
      connect(FS_L.plug_n,transformer.primary3phase)  annotation (
        Line(points = {{-126, 34}, {-118, 34}}, color = {0, 0, 255}));
      connect(transformer.secondary3phase, t1.plug_p) annotation (
        Line(points = {{-87.7, 38.2}, {-87.7, 38}, {-74, 38}, {-74, 24}, {-66.8, 24}}, color = {0, 0, 255}));
      connect(converterUnitControl.ac3Phase, FS_L.plug_n) annotation (
        Line(points={{-118.28,-33},{-125.66,-33},{-125.66,34},{-126,34}},          color = {0, 0, 255}));
      connect(Ldc.p, Rdc.n) annotation (
        Line(points = {{64, 70}, {60, 70}}, color = {0, 0, 255}));
      connect(Ldc1.p, Rdc1.n) annotation (
        Line(points = {{54, -40}, {48, -40}}, color = {0, 0, 255}));
      connect(constantVoltage.p, Ldc.n) annotation (
        Line(points = {{88, 26}, {88, 70}, {84, 70}}, color = {0, 0, 255}));
      connect(constantVoltage.n, Ldc1.n) annotation (
        Line(points = {{88, 6}, {88, -40}, {74, -40}}, color = {0, 0, 255}));
      connect(UDC.v, vMean.u) annotation (
        Line(points = {{7.2, 22}, {6, 22}, {6, 2}, {24.4, 2}}, color = {0, 0, 127}));
      connect(s2.pin_p, bridgeHV1.pin2) annotation (
        Line(points = {{-63.2, -4}, {-47.04, -4}}, color = {0, 0, 255}));
      connect(bridgeHV1.pin1, r2.pin_p) annotation (
        Line(points = {{-47.04, 1.04}, {-58, 1.04}, {-58, 10}, {-63.2, 10}}, color = {0, 0, 255}));
      connect(bridgeHV1.pin3, t2.pin_p) annotation (
        Line(points = {{-47.04, -9.04}, {-58, -9.04}, {-58, -18}, {-63.2, -18}}, color = {0, 0, 255}));
      connect(r2.plug_p, t2.plug_p) annotation (
        Line(points = {{-66.8, 10}, {-72, 10}, {-72, -18}, {-66.8, -18}}, color = {0, 0, 255}));
      connect(s2.plug_p, t2.plug_p) annotation (
        Line(points = {{-66.8, -4}, {-72, -4}, {-72, -18}, {-66.8, -18}}, color = {0, 0, 255}));
      connect(transformer.tertiary3phase, t2.plug_p) annotation (
        Line(points = {{-87.7, 29.8}, {-80, 29.8}, {-80, -4}, {-72, -4}, {-72, -18}, {-66.8, -18}}, color = {0, 0, 255}));
      connect(converterUnitControl.pY, bridgeHV.P) annotation (
        Line(points = {{-88.32, -25.2}, {-2, -25.2}, {-2, 38}, {-18.18, 38}}, color = {255, 0, 255}));
      connect(converterUnitControl.pD, bridgeHV1.P) annotation (
        Line(points={{-88.32,-41.06},{-8,-41.06},{-8,-4},{-18.18,-4}},          color = {255, 0, 255}));
      connect(bridgeHV.pin_n, bridgeHV1.pin_p) annotation (
        Line(points = {{-18.96, 30.56}, {-12, 30.56}, {-12, 3.2}, {-18.96, 3.2}}, color = {0, 0, 255}));
      connect(Rdc1.p, bridgeHV1.pin_n) annotation (
        Line(points = {{28, -40}, {10, -40}, {10, -11.44}, {-18.96, -11.44}}, color = {0, 0, 255}));
      connect(ground1.p, Ldc1.n) annotation (
        Line(points = {{74, -50}, {74, -40}}, color = {0, 0, 255}));
      connect(UDC.n, bridgeHV1.pin_n) annotation (
        Line(points = {{16, 14}, {16, -40}, {10, -40}, {10, -11.44}, {-18.96, -11.44}}, color = {0, 0, 255}));
      connect(currentSensor.n, Rdc.p) annotation (
        Line(points = {{36, 70}, {40, 70}}, color = {0, 0, 255}));
      connect(currentSensor.p, bridgeHV.pin_p) annotation (
        Line(points = {{20, 70}, {10, 70}, {10, 45.2}, {-18.96, 45.2}}, color = {0, 0, 255}));
      connect(iMean.u, currentSensor.i) annotation (
        Line(points = {{32.4, 48}, {28, 48}, {28, 61.2}}, color = {0, 0, 127}));
      connect(UDC.p, bridgeHV.pin_p) annotation (
        Line(points = {{16, 30}, {16, 70}, {10, 70}, {10, 45.2}, {-18.96, 45.2}}, color = {0, 0, 255}));
      connect(poleControl.firingANGLE,converterUnitControl.alpha)  annotation (
        Line(points={{-93.8,-69},{-103.86,-69},{-103.86,-47.69}},        color = {0, 0, 127}));
      connect(poleControl.vdcRef, vRefS1.y) annotation (
        Line(points = {{-60.05, -67.13}, {-50.6731, -67.13}, {-50.6731, -59}, {-34.7, -59}}, color = {0, 0, 127}));
      connect(poleControl.powerRef, refPowS1.y) annotation (
        Line(points = {{-60.05, -76.15}, {-50, -76.15}, {-50, -91}, {-34.7, -91}}, color = {0, 0, 127}));
      connect(poleControl.vDC, V_dc.y) annotation (
        Line(points = {{-60.05, -62.73}, {-54, -62.73}, {-54, -46}, {-37, -46}}, color = {0, 0, 127}));
      connect(i_dc.y, poleControl.iDC) annotation (
        Line(points = {{-39, -74}, {-44, -74}, {-44, -71.75}, {-60.05, -71.75}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -110}, {100, 100}})),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 80}})),
        experiment(StopTime = 0.7, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05));
    end TestController;

    model TestPole
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation (
        Placement(visible = true, transformation(extent = {{16, -4}, {32, 12}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
        Placement(transformation(origin = {-170, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
        Placement(transformation(origin = {-181, -7}, extent = {{-11, -9}, {11, 9}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground groundS annotation (
        Placement(transformation(extent = {{-188, -44}, {-174, -30}})));
      Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
        Placement(transformation(extent = {{-158, 32}, {-140, 48}})));
      Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3)) annotation (
        Placement(transformation(extent = {{-136, 30}, {-116, 50}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 480e3) annotation (
        Placement(visible = true, transformation(origin = {24, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-20, -40})));
      LCC_HVDC.Models.PoleControl poleControl
        annotation (Placement(transformation(extent={{-86,-34},{-58,-12}})));
      Modelica.Blocks.Sources.Constant vRefS1(k = 0.90) annotation (
        Placement(visible = true, transformation(origin = {-20, -22}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
      LCC_HVDC.Models.HVDCpole hVDCpole(BlockTime=0.111247, Inverter=0)
        annotation (Placement(transformation(extent={{-86,26},{-52,54}})));
    equation
      connect(starS.pin_n, groundS.p) annotation (
        Line(points = {{-181, -18}, {-181, -30}}, color = {0, 0, 255}));
      connect(FS_R.plug_p, Vsource.plug_p) annotation (
        Line(points = {{-158, 40}, {-160, 40}}, color = {0, 0, 255}));
      connect(FS_R.plug_n, FS_L.plug_p) annotation (
        Line(points = {{-140, 40}, {-136, 40}}, color = {0, 0, 255}));
      connect(Vsource.plug_n, starS.plug_p) annotation (
        Line(points = {{-180, 40}, {-180, 4}, {-181, 4}}, color = {0, 0, 255}));
      connect(poleControl.vdcRef, vRefS1.y) annotation (
        Line(points = {{-56.18, -21.13}, {-54.6231, -21.13}, {-54.6231, -22}, {-26.6, -22}}, color = {0, 0, 127}));
      connect(poleControl.powerRef, refPowS1.y) annotation (
        Line(points = {{-56.18, -30.15}, {-46, -30.15}, {-46, -40}, {-26.6, -40}}, color = {0, 0, 127}));
      connect(poleControl.firingANGLE,hVDCpole.alpha)  annotation (
        Line(points = {{-87.68, -23}, {-94, -23}, {-94, 31.32}, {-87.7, 31.32}}, color = {0, 0, 127}));
      connect(FS_L.plug_n, hVDCpole.ac) annotation (
        Line(points = {{-116, 40}, {-94, 40}, {-94, 40.56}, {-86.34, 40.56}}, color = {0, 0, 255}));
      connect(constantVoltage.n, hVDCpole.pin_n) annotation (
        Line(points = {{24, 28}, {24, 18}, {-22, 18}, {-22, 35.94}, {-50.13, 35.94}}, color = {0, 0, 255}));
      connect(constantVoltage.p, hVDCpole.pin_p) annotation (
        Line(points = {{24, 48}, {24, 62}, {-22, 62}, {-22, 43.5}, {-50.13, 43.5}}, color = {0, 0, 255}));
      connect(hVDCpole.vdc, poleControl.vDC) annotation (Line(points={{-49.79,
              29.5},{-44,29.5},{-44,-16.73},{-56.18,-16.73}}, color={0,0,127}));
      connect(poleControl.iDC, hVDCpole.idc) annotation (Line(points={{-56.18,-25.75},
              {-40,-25.75},{-40,49.66},{-49.79,49.66}}, color={0,0,127}));
      connect(Ground1.p, hVDCpole.pin_n) annotation (
        Line(points = {{24, 12}, {24, 18}, {-22, 18}, {-22, 35.94}, {-50.13, 35.94}}, color = {0, 0, 255}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -60}, {40, 80}})),
        experiment(StopTime = 0.7, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>Check <code>poleControl.firingANGLE</code>  to see alpha i.e. the controler output.</p>
  <p>Also, check:</p>
  <ul>
    <li>Pole currrent: <code>hVDCpole.iMean.u</code></li>
    <li>Pole voltage: <code>hVDCpole.vMean.u, hVDCpole.vMean.y</code></li>
  </ul>
</body>
</html>"));
    end TestPole;

    model TestCable
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation (
        Placement(visible = true, transformation(extent = {{26, 12}, {36, 22}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
        Placement(transformation(origin = {-178, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
        Placement(transformation(origin = {-189, -7}, extent = {{-11, -9}, {11, 9}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground groundS annotation (
        Placement(transformation(extent = {{-196, -44}, {-182, -30}})));
      Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
        Placement(transformation(extent = {{-166, 32}, {-148, 48}})));
      Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3)) annotation (
        Placement(transformation(extent = {{-144, 30}, {-124, 50}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 480e3) annotation (
        Placement(visible = true, transformation(origin = {31, 39}, extent = {{-7, -7}, {7, 7}}, rotation = 270)));
      Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-28, -40})));
      LCC_HVDC.Models.PoleControl poleControl
        annotation (Placement(transformation(extent={{-86,-34},{-58,-12}})));
      Modelica.Blocks.Sources.Constant vRefS1(k = 0.90) annotation (
        Placement(visible = true, transformation(origin = {-28, -22}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
      LCC_HVDC.Models.HVDCpole hVDCpole(BlockTime=0.111247, Inverter=0)
        annotation (Placement(transformation(extent={{-88,26},{-52,54}})));
      LCC_HVDC.Models.Cable cable(r=0.011, Vnom=500)
        annotation (Placement(transformation(extent={{-20,30},{4,50}})));
    equation
      connect(starS.pin_n, groundS.p) annotation (
        Line(points = {{-189, -18}, {-189, -30}}, color = {0, 0, 255}));
      connect(FS_R.plug_p, Vsource.plug_p) annotation (
        Line(points = {{-166, 40}, {-168, 40}}, color = {0, 0, 255}));
      connect(FS_R.plug_n, FS_L.plug_p) annotation (
        Line(points = {{-148, 40}, {-144, 40}}, color = {0, 0, 255}));
      connect(Vsource.plug_n, starS.plug_p) annotation (
        Line(points = {{-188, 40}, {-188, 4}, {-189, 4}}, color = {0, 0, 255}));
      connect(poleControl.powerRef, refPowS1.y) annotation (
        Line(points = {{-56.18, -30.15}, {-52, -30.15}, {-52, -40}, {-34.6, -40}}, color = {0, 0, 127}));
      connect(poleControl.firingANGLE,hVDCpole.alpha)  annotation (
        Line(points = {{-87.68, -23}, {-106, -23}, {-106, 31.32}, {-89.8, 31.32}}, color = {0, 0, 127}));
      connect(FS_L.plug_n, hVDCpole.ac) annotation (
        Line(points = {{-124, 40}, {-102, 40}, {-102, 40.56}, {-88.36, 40.56}}, color = {0, 0, 255}));
      connect(hVDCpole.vdc, poleControl.vDC) annotation (Line(points={{-49.66,
              29.5},{-44,29.5},{-44,-16.73},{-56.18,-16.73}}, color={0,0,127}));
      connect(poleControl.iDC, hVDCpole.idc) annotation (Line(points={{-56.18,-25.75},
              {-40,-25.75},{-40,49.66},{-49.66,49.66}}, color={0,0,127}));
      connect(constantVoltage.p, cable.pin_P1) annotation (Line(points={{31,46},
              {31,52},{14,52},{14,45.7},{5.32,45.7}}, color={0,0,255}));
      connect(constantVoltage.n, cable.pin_N1) annotation (Line(points={{31,32},
              {31,28},{14,28},{14,34.4},{5.2,34.4}}, color={0,0,255}));
      connect(cable.pin_P, hVDCpole.pin_p) annotation (Line(points={{-21.32,
              46.1},{-28,46.1},{-28,43.5},{-50.02,43.5}}, color={0,0,255}));
      connect(cable.pin_N, hVDCpole.pin_n) annotation (Line(points={{-21.2,34.6},
              {-28,34.6},{-28,35.94},{-50.02,35.94}}, color={0,0,255}));
      connect(Ground1.p, cable.pin_N1) annotation (Line(points={{31,22},{31,28},
              {14,28},{14,34.4},{5.2,34.4}}, color={0,0,255}));
      connect(poleControl.vdcRef, vRefS1.y) annotation (
        Line(points = {{-56.18, -21.13}, {-45.39, -21.13}, {-45.39, -22}, {-34.6, -22}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -60}, {40, 80}})),
        experiment(StopTime = 0.7, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05));
    end TestCable;

    model SapeiMonopole
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation (
        Placement(visible = true, transformation(extent = {{-86, 22}, {-78, 30}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
        Placement(transformation(origin = {-186, 42}, extent = {{-8, -8}, {8, 8}}, rotation = 180)));
      Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
        Placement(transformation(origin = {-194, -1}, extent = {{-7, -6}, {7, 6}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground groundS annotation (
        Placement(transformation(extent = {{-200, -44}, {-188, -32}})));
      Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(2.9, 3)) annotation (
        Placement(transformation(extent = {{-174, 36}, {-162, 48}})));
      Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.0925, 3)) annotation (
        Placement(transformation(extent = {{-158, 34}, {-144, 50}})));
      Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
        Placement(visible = true, transformation(origin = {-115, -25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      LCC_HVDC.Models.HVDCpole FiumeSanto1(BlockTime=0.111247, Inverter=0)
        annotation (Placement(transformation(extent={{-132,32},{-106,54}})));
      LCC_HVDC.Models.Cable cable(r=0.011, Vnom=500)
        annotation (Placement(transformation(extent={{-72,34},{-52,52}})));
      LCC_HVDC.Models.HVDCpole Latina1(BlockTime=0.131840, Inverter=1)
        annotation (Placement(transformation(
            extent={{-13,-11},{13,11}},
            rotation=180,
            origin={-9,43})));
      Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource1(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
        Placement(transformation(origin = {64, 44}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.Star starS1(m = 3) annotation (
        Placement(transformation(origin = {74, 3}, extent = {{-7, -6}, {7, 6}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground groundS1 annotation (
        Placement(transformation(extent = {{68, -40}, {80, -28}})));
      Modelica.Electrical.Polyphase.Basic.Resistor LatinaR(R = fill(1.1217, 3)) annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {46, 44})));
      Modelica.Electrical.Polyphase.Basic.Inductor LatinaL(L = fill(0.0356, 3)) annotation (
        Placement(transformation(extent = {{-7, -8}, {7, 8}}, rotation = 180, origin = {29, 44})));
      Modelica.Blocks.Sources.Step vRefS2(height = -0.1, offset = 1, startTime = 0.3) annotation (
        Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 180, origin = {-11, -25})));
      Models.IdcController poleControl1(
        Ti=0.08,
        k=0.5,
        uMin=0.45e6,
        uMax=0.55e6,
        y_start=0.8,
        IdcBase=1000) annotation (Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=180,
            origin={-117,-1})));
      Models.VdcController poleControl2(
        Ti=0.07,
        k=0.7,
        y_start=-0.8,
        VdcBase=0.5e6) annotation (Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=0,
            origin={-11,-1})));
    equation
      connect(starS.pin_n, groundS.p) annotation (
        Line(points = {{-194, -8}, {-194, -32}}, color = {0, 0, 255}));
      connect(FS_R.plug_p, Vsource.plug_p) annotation (
        Line(points = {{-174, 42}, {-178, 42}}, color = {0, 0, 255}));
      connect(FS_R.plug_n, FS_L.plug_p) annotation (
        Line(points = {{-162, 42}, {-158, 42}}, color = {0, 0, 255}));
      connect(Vsource.plug_n, starS.plug_p) annotation (
        Line(points = {{-194, 42}, {-194, 6}}, color = {0, 0, 255}));
      connect(FS_L.plug_n, FiumeSanto1.ac) annotation (
        Line(points = {{-144, 42}, {-138, 42}, {-138, 43.44}, {-132.26, 43.44}}, color = {0, 0, 255}));
      connect(cable.pin_P, FiumeSanto1.pin_p) annotation (Line(points={{-73.1,
              48.49},{-78,48.49},{-78,45.75},{-104.57,45.75}}, color={0,0,255}));
      connect(cable.pin_N, FiumeSanto1.pin_n) annotation (Line(points={{-73,
              38.14},{-78,38.14},{-78,39.81},{-104.57,39.81}}, color={0,0,255}));
      connect(starS1.pin_n, groundS1.p) annotation (
        Line(points = {{74, -4}, {74, -28}}, color = {0, 0, 255}));
      connect(starS1.plug_p, Vsource1.plug_n) annotation (
        Line(points = {{74, 10}, {74, 44}, {72, 44}}, color = {0, 0, 255}));
      connect(LatinaR.plug_p, Vsource1.plug_p) annotation (
        Line(points = {{52, 44}, {56, 44}}, color = {0, 0, 255}));
      connect(LatinaL.plug_p, LatinaR.plug_n) annotation (
        Line(points = {{36, 44}, {40, 44}}, color = {0, 0, 255}));
      connect(LatinaL.plug_n, Latina1.ac) annotation (
        Line(points = {{22, 44}, {22, 42.56}, {4.26, 42.56}}, color = {0, 0, 255}));
      connect(cable.pin_P1, Latina1.pin_n) annotation (Line(points={{-50.9,
              48.13},{-44,48.13},{-44,46.19},{-23.43,46.19}}, color={0,0,255}));
      connect(cable.pin_N1, Latina1.pin_p) annotation (Line(points={{-51,37.96},
              {-51,38},{-44,38},{-44,40.25},{-23.43,40.25}}, color={0,0,255}));
      connect(Ground1.p, FiumeSanto1.pin_n) annotation (
        Line(points = {{-82, 30}, {-82, 39.81}, {-104.57, 39.81}}, color = {0, 0, 255}));
      connect(poleControl1.pref, refPowS1.y) annotation (Line(points={{-107.01,
              -6.13},{-102,-6.13},{-102,-25},{-109.5,-25}}, color={0,0,127}));
      connect(FiumeSanto1.vdc, poleControl1.vdc) annotation (Line(points={{-104.31,
              34.75},{-100,34.75},{-100,-0.28},{-107.1,-0.28}}, color={0,0,127}));
      connect(FiumeSanto1.idc, poleControl1.idc) annotation (Line(points={{-104.31,
              50.59},{-96,50.59},{-96,4.94},{-107.1,4.94}}, color={0,0,127}));
      connect(poleControl1.alpha, FiumeSanto1.alpha) annotation (Line(points={{
              -127.26,-1.18},{-142,-1.18},{-142,36.18},{-133.3,36.18}}, color={
              0,0,127}));
      connect(poleControl2.vdcRef, vRefS2.y) annotation (Line(points={{-20.99,
              3.41},{-32,3.41},{-32,-25},{-16.5,-25}}, color={0,0,127}));
      connect(Latina1.vdc, poleControl2.vdc) annotation (Line(points={{-23.69,
              51.25},{-30,51.25},{-30,-5.59},{-20.99,-5.59}}, color={0,0,127}));
      connect(poleControl2.alpha,Latina1.alpha)  annotation (Line(points={{
              -0.47,-0.37},{12,-0.37},{12,49.82},{5.3,49.82}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -60}, {80, 80}})),
        experiment(StopTime = 0.7, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>This example is an implementation of SAPEI HVDC link in Modelica.</p><a href=\"modelica://HVDC.Models.ReferenceInfo\">[See ReferenceInfo: 2]</a>
  <p>It is recommended to chek these outputs:</p>
  <ul>
    <li>Pole currrent: <code>FiumeSanto1.iMean.u</code></li>
    <li>Pole voltage: <code>FiumeSanto1.vMean.u, FiumeSanto1.vMean.y, Latina1.vMean.u, Latina1.vMean.y</code></li>
  </ul>
</body>
</html>"));
    end SapeiMonopole;

    model SapeiBipole
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
        Placement(transformation(origin = {-186, 26}, extent = {{-8, -8}, {8, 8}}, rotation = 180)));
      Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
        Placement(transformation(origin = {-194, 7}, extent = {{-7, -6}, {7, 6}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground groundS annotation (
        Placement(transformation(extent = {{-200, -24}, {-188, -12}})));
      Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(2.9, 3)) annotation (
        Placement(transformation(extent = {{-176, 20}, {-164, 32}})));
      Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.0925, 3)) annotation (
        Placement(transformation(extent = {{-162, 18}, {-148, 34}})));
      LCC_HVDC.Models.HVDCpole FiumeSanto1(BlockTime=0.111247, Inverter=0)
        annotation (Placement(transformation(extent={{-136,56},{-110,74}})));
      LCC_HVDC.Models.Cable twinCable(r=0.011, Vnom=1000) annotation (Placement(
            visible=true, transformation(
            origin={0,0},
            extent={{-72,22},{-48,40}},
            rotation=0)));
      LCC_HVDC.Models.HVDCpole Latina1(BlockTime=0.131840, Inverter=1)
        annotation (Placement(visible=true, transformation(
            origin={1.16667,62},
            extent={{-10.8333,-12},{15.1667,6}},
            rotation=180)));
      Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource1(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
        Placement(transformation(origin = {64, 26}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.Star starS1(m = 3) annotation (
        Placement(transformation(origin = {74, 7}, extent = {{-7, -6}, {7, 6}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground groundS1 annotation (
        Placement(transformation(extent = {{68, -24}, {80, -12}})));
      Modelica.Electrical.Polyphase.Basic.Resistor LatinaR(R = fill(1.1217, 3)) annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {48, 26})));
      Modelica.Electrical.Polyphase.Basic.Inductor LatinaL(L = fill(0.0356, 3)) annotation (
        Placement(transformation(extent = {{-7, -8}, {7, 8}}, rotation = 180, origin = {31, 26})));
      LCC_HVDC.Models.HVDCpole FiumeSanto2(BlockTime=0.111247, Inverter=0)
        annotation (Placement(transformation(extent={{-136,-14},{-110,4}})));
      LCC_HVDC.Models.HVDCpole Latina2(BlockTime=0.131840, Inverter=1)
        annotation (Placement(transformation(
            extent={{-13,-9},{13,9}},
            rotation=180,
            origin={-1,-5})));
      Modelica.Electrical.Analog.Basic.Ground ground annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-92, 18}, {-82, 28}}, rotation = 0)));
      Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
        Placement(visible = true, transformation(origin = {-119, 19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Modelica.Blocks.Sources.Ramp refPowS2(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
        Placement(visible = true, transformation(origin = {-119, -49}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Modelica.Blocks.Sources.Step vRefS1(height = -0.1, offset = 1, startTime = 0.3) annotation (
        Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 180, origin = {-3, 17})));
      Modelica.Blocks.Sources.Step vRefS2(height = -0.1, offset = 1, startTime = 0.3) annotation (
        Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 180, origin = {-3, -51})));
      Models.IdcController poleControl1(
        Ti=0.08,
        k=0.5,
        uMin=0.45e6,
        uMax=0.55e6,
        y_start=0.8,
        IdcBase=1000) annotation (Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=180,
            origin={-121,41})));
      Models.IdcController poleControl2(
        Ti=0.08,
        k=0.5,
        uMin=0.45e6,
        uMax=0.55e6,
        y_start=0.8,
        IdcBase=1000) annotation (Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=180,
            origin={-121,-27})));
      Models.VdcController poleControl3(
        Ti=0.07,
        k=0.7,
        y_start=-0.8,
        VdcBase=0.5e6) annotation (Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=0,
            origin={-3,37})));
      Models.VdcController poleControl4(
        Ti=0.07,
        k=0.7,
        y_start=-0.8,
        VdcBase=0.5e6) annotation (Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=0,
            origin={-3,-33})));
    equation
      connect(starS.pin_n, groundS.p) annotation (
        Line(points = {{-194, -8.88178e-16}, {-194, -12}}, color = {0, 0, 255}));
      connect(FS_R.plug_p, Vsource.plug_p) annotation (
        Line(points = {{-176, 26}, {-178, 26}}, color = {0, 0, 255}));
      connect(FS_R.plug_n, FS_L.plug_p) annotation (
        Line(points = {{-164, 26}, {-162, 26}}, color = {0, 0, 255}));
      connect(Vsource.plug_n, starS.plug_p) annotation (
        Line(points = {{-194, 26}, {-194, 14}}, color = {0, 0, 255}));
      connect(starS1.pin_n, groundS1.p) annotation (
        Line(points = {{74, -8.88178e-16}, {74, -12}}, color = {0, 0, 255}));
      connect(starS1.plug_p, Vsource1.plug_n) annotation (
        Line(points = {{74, 14}, {74, 26}, {72, 26}}, color = {0, 0, 255}));
      connect(LatinaR.plug_p, Vsource1.plug_p) annotation (
        Line(points = {{54, 26}, {56, 26}}, color = {0, 0, 255}));
      connect(LatinaL.plug_p, LatinaR.plug_n) annotation (
        Line(points = {{38, 26}, {42, 26}}, color = {0, 0, 255}));
      connect(FiumeSanto1.pin_p, twinCable.pin_P) annotation (Line(points={{-108.57,
              67.25},{-78,67.25},{-78,36.49},{-73.32,36.49}}, color={0,0,255}));
      connect(Latina1.pin_n, twinCable.pin_P1) annotation (Line(points={{-15.43,
              67.61},{-42,67.61},{-42,36.13},{-46.68,36.13}}, color={0,0,255}));
      connect(FiumeSanto1.pin_n, FiumeSanto2.pin_p) annotation (
        Line(points = {{-108.57, 62.39}, {-92, 62.39}, {-92, -2.75}, {-108.57, -2.75}}, color = {0, 0, 255}));
      connect(twinCable.pin_N, FiumeSanto2.pin_n) annotation (Line(points={{-73.2,
              26.14},{-78,26.14},{-78,-7.61},{-108.57,-7.61}}, color={0,0,255}));
      connect(Latina1.pin_p, Latina2.pin_n) annotation (
        Line(points={{-15.43,62.75},{-30,62.75},{-30,-2.39},{-15.43,-2.39}},          color = {0, 0, 255}));
      connect(twinCable.pin_N1, Latina2.pin_p) annotation (Line(points={{-46.8,
              25.96},{-46.8,26},{-42,26},{-42,-7.25},{-15.43,-7.25}}, color={0,
              0,255}));
      connect(LatinaL.plug_n, Latina1.ac) annotation (
        Line(points={{24,26},{20,26},{20,64.64},{12.26,64.64}},          color = {0, 0, 255}));
      connect(LatinaL.plug_n, Latina2.ac) annotation (
        Line(points = {{24, 26}, {20, 26}, {20, -5.36}, {12.26, -5.36}}, color = {0, 0, 255}));
      connect(FS_L.plug_n, FiumeSanto1.ac) annotation (
        Line(points = {{-148, 26}, {-144, 26}, {-144, 65.36}, {-136.26, 65.36}}, color = {0, 0, 255}));
      connect(FS_L.plug_n, FiumeSanto2.ac) annotation (
        Line(points = {{-148, 26}, {-144, 26}, {-144, -4.64}, {-136.26, -4.64}}, color = {0, 0, 255}));
      connect(ground.p, FiumeSanto2.pin_p) annotation (
        Line(points = {{-87, 28}, {-87, 32}, {-92, 32}, {-92, -2.75}, {-108.57, -2.75}}, color = {0, 0, 255}));
      connect(refPowS1.y, poleControl1.pref) annotation (Line(points={{-113.5,
              19},{-104,19},{-104,35.87},{-111.01,35.87}}, color={0,0,127}));
      connect(poleControl1.vdc, FiumeSanto1.vdc) annotation (Line(points={{-111.1,
              41.72},{-104,41.72},{-104,58.25},{-108.31,58.25}}, color={0,0,127}));
      connect(poleControl1.idc, FiumeSanto1.idc) annotation (Line(points={{-111.1,
              46.94},{-100,46.94},{-100,71.21},{-108.31,71.21}}, color={0,0,127}));
      connect(poleControl1.alpha, FiumeSanto1.alpha) annotation (Line(points={{
              -131.26,40.82},{-142,40.82},{-142,59.42},{-137.3,59.42}}, color={
              0,0,127}));
      connect(poleControl2.pref, refPowS2.y) annotation (Line(points={{-111.01,
              -32.13},{-106,-32.13},{-106,-49},{-113.5,-49}}, color={0,0,127}));
      connect(poleControl2.vdc, FiumeSanto2.vdc) annotation (Line(points={{-111.1,
              -26.28},{-102,-26.28},{-102,-11.75},{-108.31,-11.75}}, color={0,0,
              127}));
      connect(poleControl2.idc, FiumeSanto2.idc) annotation (Line(points={{-111.1,
              -21.06},{-100,-21.06},{-100,1.21},{-108.31,1.21}}, color={0,0,127}));
      connect(poleControl2.alpha, FiumeSanto2.alpha) annotation (Line(points={{
              -131.26,-27.18},{-142,-27.18},{-142,-10.58},{-137.3,-10.58}},
            color={0,0,127}));
      connect(poleControl3.vdcRef, vRefS1.y) annotation (Line(points={{-12.99,
              41.41},{-20,41.41},{-20,17},{-8.5,17}}, color={0,0,127}));
      connect(Latina1.vdc, poleControl3.vdc) annotation (Line(points={{-15.69,
              71.75},{-15.69,72},{-26,72},{-26,32.41},{-12.99,32.41}}, color={0,
              0,127}));
      connect(poleControl3.alpha,Latina1.alpha)  annotation (Line(points={{7.53,
              37.63},{26,37.63},{26,70.58},{13.3,70.58}}, color={0,0,127}));
      connect(poleControl4.vdcRef, vRefS2.y) annotation (Line(points={{-12.99,-28.59},
              {-20,-28.59},{-20,-51},{-8.5,-51}}, color={0,0,127}));
      connect(poleControl4.vdc, Latina2.vdc) annotation (Line(points={{-12.99,-37.59},
              {-26,-37.59},{-26,1.75},{-15.69,1.75}}, color={0,0,127}));
      connect(poleControl4.alpha,Latina2.alpha)  annotation (Line(points={{7.53,
              -32.37},{26,-32.37},{26,0.58},{13.3,0.58}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -60}, {80, 80}})),
        experiment(StopTime = 0.7, Interval = 6e-05, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
        Documentation(info = "<html><head></head><body><a href=\"modelica://HVDC.Models.ReferenceInfo\"><font size=\"5\">[See ReferenceInfo: 2]</font></a></body></html>"));
    end SapeiBipole;

    model TestPoleFixed
      extends TestPole(FS_L(inductor(i(fixed={false,true,true}))), hVDCpole(
            transformer(tertiaryInductance(inductor(i(fixed={true,false,true})))),
            smoothingL(i(fixed=true))));
      // The transformer part is not needed
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),experiment(StopTime = 0.7, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05));
    end TestPoleFixed;

    model SapeiBipoleFixed
      extends SapeiBipole(
        FS_L(inductor(i(fixed={false,true,true}))),
        LatinaL(inductor(i(fixed={false,true,true}))),
        FiumeSanto1(transformer(tertiaryInductance(inductor(i(fixed={true,false,
                      true}))), primaryInductance(inductor(i(fixed={true,false,
                      true})))), smoothingL(i(fixed=true))),
        FiumeSanto2(transformer(tertiaryInductance(inductor(i(fixed={true,false,
                      true}))), primaryInductance(inductor(i(fixed={true,false,
                      true})))), smoothingL(i(fixed=true))),
        Latina1(transformer(tertiaryInductance(inductor(i(fixed={true,false,
                      true}))), primaryInductance(inductor(i(fixed={true,false,
                      true})))), smoothingL(i(fixed=true))),
        Latina2(transformer(tertiaryInductance(inductor(i(fixed={true,false,
                      true}))), primaryInductance(inductor(i(fixed={true,false,
                      true})))), smoothingL(i(fixed=true))));
      // The transformer part is not needed
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end SapeiBipoleFixed;

    model SapeiMonopoleFixed
      extends SapeiMonopole(
        FiumeSanto1(transformer(tertiaryInductance(inductor(i(fixed={true,false,true}))),
              primaryInductance(inductor(i(fixed={true,false,true})))), smoothingL(
              i(fixed=true))),
        FS_L(inductor(i(fixed={false,true,true}))),
        LatinaL(inductor(i(fixed={false,true,true}))),
        Latina1(transformer(tertiaryInductance(inductor(i(fixed={true,false,true}))),
              primaryInductance(inductor(i(fixed={true,false,true})))), smoothingL(
              i(fixed=true))));
      // The transformer part is not needed
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SapeiMonopoleFixed;

    model TestFilter
      import Modelica.Constants.pi;
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
      Real vrs =transformer.primary3phase.pin[1].v  -transformer.primary3phase.pin[
          2].v;
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
        Placement(visible = true, transformation(extent={{76,-90},{92,-74}},      rotation = 0)));
      Modelica.Blocks.Math.Mean mean(f = 600) annotation (
        Placement(visible = true, transformation(origin={44,20},     extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 225e-3, i(start = 0)) annotation (
        Placement(visible = true, transformation(origin={74,68},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 0.1) annotation (
        Placement(visible = true, transformation(origin={48,68},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      LCC_HVDC.Models.Bridge bridgeHV(iniOff={true,true,true,false,false,true})
        annotation (Placement(visible=true, transformation(
            origin={-24.8572,60},
            extent={{-11.1428,-12},{14.8572,12}},
            rotation=0)));
      LCC_HVDC.Models.PllPolePulser converterUnitControl(BlockTime=0.111247,
          vNom=400e3) annotation (Placement(visible=true, transformation(
            origin={-94,-76.4615},
            extent={{-14,-5.53847},{14,18.4615}},
            rotation=0)));
      Modelica.Blocks.Sources.Constant Fire(k = 10) annotation (
        Placement(visible = true, transformation(origin={-136,-90},    extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
        Placement(transformation(origin={-180,56},    extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
        Placement(transformation(origin={-191,9},      extent = {{-11, -9}, {11, 9}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground groundS annotation (
        Placement(transformation(extent={{-198,-74},{-184,-60}})));
      Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
        Placement(transformation(extent={{-168,48},{-150,64}})));
      Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3)) annotation (
        Placement(transformation(extent={{-146,46},{-126,66}})));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p r1(k = 1) annotation (
        Placement(visible = true, transformation(origin={-55,74},    extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p s1(k = 2) annotation (
        Placement(visible = true, transformation(origin={-55,60},    extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p t1(k = 3) annotation (
        Placement(visible = true, transformation(origin={-55,46},   extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      LCC_HVDC.Models.ThreeWindingTransformer transformer
        annotation (Placement(transformation(extent={{-104,42},{-76,68}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 490e3) annotation (
        Placement(visible = true, transformation(origin={88,-12},    extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Inductor Ldc1(L = 225e-3, i(start = 0)) annotation (
        Placement(visible = true, transformation(origin={74,-64},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor Rdc1(R = 0.1) annotation (
        Placement(visible = true, transformation(origin={48,-64},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sensors.VoltageSensor UDC annotation (
        Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 270, origin={28,40})));
      LCC_HVDC.Models.Bridge bridgeHV1(iniOff={true,true,true,false,false,true})
        annotation (Placement(visible=true, transformation(
            origin={-24.8572,12},
            extent={{-11.1428,-12},{14.8572,12}},
            rotation=0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p r2(k = 1) annotation (
        Placement(visible = true, transformation(origin={-55,26},     extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p s2(k = 2) annotation (
        Placement(visible = true, transformation(origin={-55,12},     extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Polyphase.Basic.PlugToPin_p t2(k = 3) annotation (
        Placement(visible = true, transformation(origin={-55,-2},     extent = {{-9, -8}, {9, 8}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground gnd
        annotation (Placement(transformation(extent={{-108,-50},{-100,-42}})));
      Models.BpFilterTimeDomain filter2(Qc=80e6, Nh=11)
        annotation (Placement(transformation(extent={{-88,-40},{-70,-24}})));
      Modelica.Electrical.Analog.Basic.Ground gnd1
        annotation (Placement(transformation(extent={{-82,-50},{-74,-42}})));
      Models.BpFilterTimeDomain filter3(Qc=80e6, Nh=13)
        annotation (Placement(transformation(extent={{-62,-40},{-44,-24}})));
      Modelica.Electrical.Analog.Basic.Ground gnd2
        annotation (Placement(transformation(extent={{-56,-50},{-48,-42}})));
      Modelica.Electrical.Polyphase.Ideal.IdealClosingSwitch switch annotation (
          Placement(transformation(
            extent={{-7,-8},{7,8}},
            rotation=270,
            origin={-118,21})));
      Modelica.Blocks.Sources.BooleanExpression Time[3](y=fill(time > 0.1, 3))
        annotation (Placement(transformation(
            extent={{-7,-7},{7,7}},
            rotation=180,
            origin={-93,21})));
      Models.ChpFilterTimeDomain filter1(Qc=80e6)
        annotation (Placement(transformation(extent={{-114,-40},{-96,-24}})));
    equation
      connect(starS.pin_n, groundS.p) annotation (
        Line(points={{-191,-2},{-191,-60}},       color = {0, 0, 255}));
      connect(FS_R.plug_p, Vsource.plug_p) annotation (
        Line(points={{-168,56},{-170,56}},      color = {0, 0, 255}));
      connect(FS_R.plug_n, FS_L.plug_p) annotation (
        Line(points={{-150,56},{-146,56}},      color = {0, 0, 255}));
      connect(Vsource.plug_n, starS.plug_p) annotation (
        Line(points={{-190,56},{-190,20},{-191,20}},          color = {0, 0, 255}));
      connect(r1.plug_p, t1.plug_p) annotation (
        Line(points={{-56.8,74},{-64,74},{-64,46},{-56.8,46}},        color = {0, 0, 255}));
      connect(s1.plug_p, t1.plug_p) annotation (
        Line(points={{-56.8,60},{-64,60},{-64,46},{-56.8,46}},        color = {0, 0, 255}));
      connect(r1.pin_p, bridgeHV.pin1) annotation (
        Line(points={{-53.2,74},{-48,74},{-48,65.04},{-37.04,65.04}},          color = {0, 0, 255}));
      connect(s1.pin_p, bridgeHV.pin2) annotation (
        Line(points={{-53.2,60},{-37.04,60}},      color = {0, 0, 255}));
      connect(bridgeHV.pin3, t1.pin_p) annotation (
        Line(points={{-37.04,54.96},{-48,54.96},{-48,46},{-53.2,46}},      color = {0, 0, 255}));
      connect(FS_L.plug_n,transformer.primary3phase)  annotation (
        Line(points={{-126,56},{-104,56},{-104,55}},       color = {0, 0, 255}));
      connect(transformer.secondary3phase, t1.plug_p) annotation (
        Line(points={{-75.72,58.9},{-75.72,60},{-64,60},{-64,46},{-56.8,46}},          color = {0, 0, 255}));
      connect(converterUnitControl.ac3Phase, FS_L.plug_n) annotation (
        Line(points={{-108.28,-70},{-125.66,-70},{-125.66,56},{-126,56}},          color = {0, 0, 255}));
      connect(Ldc.p, Rdc.n) annotation (
        Line(points={{64,68},{58,68}},      color = {0, 0, 255}));
      connect(Rdc.p, bridgeHV.pin_p) annotation (
        Line(points={{38,68},{18,68},{18,67.2},{-8.96,67.2}},         color = {0, 0, 255}));
      connect(Ldc1.p, Rdc1.n) annotation (
        Line(points={{64,-64},{58,-64}},      color = {0, 0, 255}));
      connect(constantVoltage.p, Ldc.n) annotation (
        Line(points={{88,-2},{88,68},{84,68}},        color = {0, 0, 255}));
      connect(constantVoltage.n, Ldc1.n) annotation (
        Line(points={{88,-22},{88,-64},{84,-64}},        color = {0, 0, 255}));
      connect(UDC.v, mean.u) annotation (
        Line(points={{19.2,40},{20,40},{20,20},{34.4,20}},           color = {0, 0, 127}));
      connect(s2.pin_p, bridgeHV1.pin2) annotation (
        Line(points={{-53.2,12},{-37.04,12}},        color = {0, 0, 255}));
      connect(bridgeHV1.pin1, r2.pin_p) annotation (
        Line(points={{-37.04,17.04},{-48,17.04},{-48,26},{-53.2,26}},              color = {0, 0, 255}));
      connect(bridgeHV1.pin3, t2.pin_p) annotation (
        Line(points={{-37.04,6.96},{-48,6.96},{-48,-2},{-53.2,-2}},                color = {0, 0, 255}));
      connect(r2.plug_p, t2.plug_p) annotation (
        Line(points={{-56.8,26},{-62,26},{-62,-2},{-56.8,-2}},              color = {0, 0, 255}));
      connect(s2.plug_p, t2.plug_p) annotation (
        Line(points={{-56.8,12},{-62,12},{-62,-2},{-56.8,-2}},              color = {0, 0, 255}));
      connect(transformer.tertiary3phase, t2.plug_p) annotation (
        Line(points={{-75.72,51.1},{-70,51.1},{-70,12},{-62,12},{-62,-2},{-56.8,-2}},                color = {0, 0, 255}));
      connect(converterUnitControl.pY, bridgeHV.P) annotation (
        Line(points={{-78.32,-62.8},{8,-62.8},{8,60},{-8.18,60}},             color = {255, 0, 255}));
      connect(converterUnitControl.pD, bridgeHV1.P) annotation (
        Line(points={{-78.32,-77.44},{2,-77.44},{2,12},{-8.18,12}},               color = {255, 0, 255}));
      connect(bridgeHV.pin_n, bridgeHV1.pin_p) annotation (
        Line(points={{-8.96,52.56},{-2,52.56},{-2,19.2},{-8.96,19.2}},              color = {0, 0, 255}));
      connect(Rdc1.p, bridgeHV1.pin_n) annotation (
        Line(points={{38,-64},{20,-64},{20,4.56},{-8.96,4.56}},               color = {0, 0, 255}));
      connect(UDC.p, bridgeHV.pin_p) annotation (
        Line(points={{28,48},{28,68},{18,68},{18,67.2},{-8.96,67.2}},          color = {0, 0, 255}));
      connect(ground1.p, Ldc1.n) annotation (
        Line(points={{84,-74},{84,-64}},      color = {0, 0, 255}));
      connect(UDC.n, bridgeHV1.pin_n) annotation (
        Line(points={{28,32},{28,-42},{20,-42},{20,4.56},{-8.96,4.56}},                  color = {0, 0, 255}));
      connect(converterUnitControl.alpha, Fire.y) annotation (
        Line(points={{-93.86,-83.56},{-93.86,-90},{-129.4,-90}},          color = {0, 0, 127}));
      connect(gnd1.p,filter2.gnd)  annotation (Line(points={{-78,-42},{-78,
              -41.08},{-79,-41.08},{-79,-40.16}},
                                         color={0,0,255}));
      connect(gnd2.p,filter3.gnd)  annotation (Line(points={{-52,-42},{-52,
              -41.08},{-53,-41.08},{-53,-40.16}},
                                         color={0,0,255}));
      connect(switch.plug_p,transformer.primary3phase)  annotation (Line(points={{-118,
              28},{-118,56},{-104,56},{-104,55}}, color={0,0,255}));
      connect(filter2.positivePlug, switch.plug_n) annotation (Line(points={{-87.91,
              -32.24},{-92,-32.24},{-92,-16},{-118,-16},{-118,14}}, color={0,0,255}));
      connect(filter3.positivePlug, switch.plug_n) annotation (Line(points={{-61.91,
              -32.24},{-66,-32.24},{-66,-16},{-118,-16},{-118,14}}, color={0,0,255}));
      connect(Time.y, switch.control)
        annotation (Line(points={{-100.7,21},{-108.4,21}}, color={255,0,255}));
      connect(filter1.gnd, gnd.p) annotation (Line(points={{-105,-40.16},{-105,
              -42},{-104,-42}}, color={0,0,255}));
      connect(filter1.positivePlug, switch.plug_n) annotation (Line(points={{
              -113.91,-32.24},{-118,-32.24},{-118,14}}, color={0,0,255}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 80}})),
        experiment(StopTime = 0.3, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>This example shows the performance of 3-phase shunt harmonic filters.</p>
  <p>To see the effect of filters, plot these signals:</p>
  <ul>
    <li>The current flowing into the ac grid impedance: <code>FS_L.i[1]</code></li>
    <li>The current flowing into the transformer: <code>transformer.primary3phase.pin[1].i</code></li>
    <li>AC voltage at the primary side of the transformer: <code>transformer.primary3phase.pin[1].v</code></li>
  </ul>
  <p>The filters provide a path for the harmonic currents. Thus, the current flowing into the grid is closer to a sinusoidal waveform.<p>
  <P>Run the simulation for the second time with filters disconnected. To do so, increase the switch time to more than your simulation time, e.g. time >0.4<p>
  <p>Now, compare the above-mentioned signals for the two simulations. You will see the impact of filters on current and voltage. Also, you can observe a lower DC current in the absence of filter:<p>
  <ul>  
    <li>DC current: <code>Rdc.i</code></li>
  </ul>
  
</body>
</html>"));
    end TestFilter;

    model TestFilterFreqDomain
      extends Modelica.Icons.Example;
      output Real abs_y = bode.abs_y "Magnitude of voltage ratio";
      output Modelica.Units.SI.AmplitudeLevelDifference dB_y=bode.dB_y
        "Log10 of magnitude of voltage ratio in dB";
      output Modelica.Units.SI.Angle arg_y=bode.arg_y "Angle of voltage ratio";
      Modelica.Blocks.Sources.LogFrequencySweep frequencySweep(
        duration=1,
        wMin=0.2,
        wMax=2000)
                  annotation (Placement(transformation(origin={-84,-80}, extent={{-10,
                -10},{10,10}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Ground ground
        annotation (Placement(transformation(extent={{-48,-100},{-28,-80}})));
      Modelica.ComplexBlocks.Sources.ComplexConstant complexConst(k=Complex(1,
            0))
        annotation (Placement(transformation(extent={{-94,2},{-74,22}})));
      Modelica.ComplexBlocks.ComplexMath.Bode bode annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={-86,76})));
      Models.HpFilterFreqDomain hpFilter
        annotation (Placement(transformation(extent={{58,-38},{84,-14}})));
      Models.BpFilterFreqDomain bpFilter(Qc=50e6)
        annotation (Placement(transformation(extent={{58,-76},{84,-52}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Ideal.IdealClosingSwitch
        switch3
        annotation (Placement(transformation(extent={{24,-74},{42,-56}})));
      Modelica.Blocks.Sources.BooleanExpression Enable3(y=true) annotation (
          Placement(transformation(
            extent={{-7,-7},{7,7}},
            rotation=0,
            origin={1,-49})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Ideal.IdealClosingSwitch
        switch1 annotation (Placement(transformation(extent={{26,2},{44,20}})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Ideal.IdealClosingSwitch
        switch2
        annotation (Placement(transformation(extent={{26,-34},{44,-16}})));
      Modelica.Blocks.Sources.BooleanExpression Enable1(y=true) annotation (
          Placement(transformation(
            extent={{-7,-7},{7,7}},
            rotation=0,
            origin={3,27})));
      Modelica.Blocks.Sources.BooleanExpression Enable2(y=true) annotation (
          Placement(transformation(
            extent={{-7,-7},{7,7}},
            rotation=0,
            origin={1,-9})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Sources.VariableVoltageSource
        voltageSource annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={-44,-24})));
      Modelica.Electrical.QuasiStatic.SinglePhase.Sensors.CurrentSensor currentSensor1
        annotation (Placement(transformation(
            extent={{7,-7},{-7,7}},
            rotation=180,
            origin={-27,11})));
      Models.ChpFilterFreqDomain c_HpFilter(Qc=60e6)
        annotation (Placement(transformation(extent={{58,0},{84,24}})));
    equation
      connect(bode.divisor,complexConst. y) annotation (Line(points={{-74,70},{
              -60,70},{-60,12},{-73,12}},                                                                color={85,170,255}));
      connect(bpFilter.pin_N, ground.pin) annotation (Line(points={{84,-64},{94,
              -64},{94,-80},{-38,-80}}, color={85,170,255}));
      connect(hpFilter.pin_N, ground.pin) annotation (Line(points={{84,-26},{94,
              -26},{94,-80},{-38,-80}}, color={85,170,255}));
      connect(switch3.pin_n, bpFilter.pin_P) annotation (Line(points={{42,-65},
              {41,-65},{41,-64.48},{58,-64.48}}, color={85,170,255}));
      connect(switch2.pin_n, hpFilter.pin_P) annotation (Line(points={{44,-25},
              {44,-26.48},{58,-26.48}}, color={85,170,255}));
      connect(Enable3.y, switch3.control) annotation (Line(points={{8.7,-49},{
              33,-49},{33,-54.2}}, color={255,0,255}));
      connect(Enable1.y, switch1.control) annotation (Line(points={{10.7,27},{
              35,27},{35,21.8}}, color={255,0,255}));
      connect(Enable2.y, switch2.control) annotation (Line(points={{8.7,-9},{35,
              -9},{35,-14.2}}, color={255,0,255}));
      connect(voltageSource.pin_n, ground.pin) annotation (Line(points={{-44,
              -34},{-44,-80},{-38,-80}}, color={85,170,255}));
      connect(voltageSource.f, frequencySweep.y) annotation (Line(points={{-56,
              -30},{-60,-30},{-60,-80},{-73,-80}}, color={0,0,127}));
      connect(voltageSource.V, complexConst.y) annotation (Line(points={{-56,
              -18},{-60,-18},{-60,12},{-73,12}}, color={85,170,255}));
      connect(currentSensor1.pin_p, voltageSource.pin_p) annotation (Line(
            points={{-34,11},{-44,11},{-44,-14}}, color={85,170,255}));
      connect(currentSensor1.pin_n, switch1.pin_p) annotation (Line(points={{
              -20,11},{3,11},{3,11},{26,11}}, color={85,170,255}));
      connect(switch2.pin_p, switch1.pin_p) annotation (Line(points={{26,-25},{
              26,-26},{12,-26},{12,11},{26,11}}, color={85,170,255}));
      connect(switch3.pin_p, switch1.pin_p) annotation (Line(points={{24,-65},{
              22,-65},{22,-66},{12,-66},{12,11},{26,11}}, color={85,170,255}));
      connect(currentSensor1.i, bode.u) annotation (Line(points={{-27,18.7},{
              -27,82},{-74,82}}, color={85,170,255}));
      connect(c_HpFilter.pin_N, ground.pin) annotation (Line(points={{84,12},{
              94,12},{94,-80},{-38,-80}}, color={85,170,255}));
      connect(c_HpFilter.pin_P, switch1.pin_n) annotation (Line(points={{58,
              11.52},{51,11.52},{51,11},{44,11}}, color={85,170,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>This example shows the admittance (with gain and phase) of harmonic filters in frequency domain (fundamental frequency is 50 Hz).</p>
  <p>The example is comprised of three filters namely:</p> 
  <ul>
  <li>Single-tuned band pass with Q<sub>c</sub> = 50 Mvar to filter the 5th harmonic</li>
  <li>High pass with Q<sub>c</sub> = 40 Mvar to filter the 12th harmonic</li>
  <li>C-type high pass with Q<sub>c</sub> = 60 Mvar to filter the 3rd harmonic</li>
  </ul>
  <p>To do this test, a voltage source with variable frequency and constant voltage (1 V) is applied to the filters. The frequency is varied by a logarithmic ramp</p>
  <p>The output shows the bode diagrams of the ratio of the current flowing to the filter(filters) divided by the input voltage i.e. its admittance versus frequency.</p>
  <p>You can see the admittance of each filter individually by setting its switch-enable to true and other enables to false. You can also see the total admittance of three parallel filters by setting all enables to true.</p>
  <p>To see the admittance on a logarithmic scale, plot the following variables versus <code>voltageSource.f</code>:</p>
  <ul>
  <li>The gain of the admittance: <code>abs_y</code></li> 
  <li>The phase of admittance: <code>arg_y</code></li>
  </ul>
  <p>At fundamental frequency (f = 50 Hz), with all three filters connected, you can see that <code>abs_y</code> is equal to:  0.9375 mS (At fundamental frequency, harmonic filters are capacitive. So, <code>abs_y</code> is the susceptance i.e. B<sub>c</sub> or 1/X<sub>c</sub>).</p>
  <p>This implies a toltal reactive power of  Qc = V<sup>2</sup> / X<sub>c</sub> = V<sup>2</sup> . B<sub>c</sub> = (400e3)<sup>2</sup> (0.0009375) = 150 Mvar as expected.</p>

</body>
</html>"));
    end TestFilterFreqDomain;
  end Examples;
  annotation (
    uses(Modelica(version = "4.0.0"), SCR(version = "1"), HVDCePLL(version = "1"), HVDCPulseGeneratorAndPLL(version = "3"), HVDC93(version = "3"),
      Complex(version="4.0.0")),
    version = "3",
    conversion(from(version = "", script = "modelica://HVDCPulseGeneratorAndPLL/ConvertFromHVDCPulseGeneratorAndPLL_.mos", to = "1"), from(version = "1", script = "modelica://HVDCPulseGeneratorAndPLL/ConvertFromHVDCPulseGeneratorAndPLL_1.mos"), noneFromVersion = "2"),
    Icon(graphics={
        Polygon(
          points={{-92,46},{-48,110},{-8,46},{-48,86},{-92,46}},
          lineColor={28,108,200},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Line(
          points={{92,92},{-92,-92}},
          color={244,125,35},
          thickness=1,
          smooth=Smooth.Bezier),
        Polygon(
          points={{-86,30},{-76,34},{-72,20},{-68,-2},{-86,30}},
          lineColor={56,167,56},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={56,167,56},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-100,-14},{-92,-24},{-76,-6},{-70,4},{-100,-14}},
          lineColor={56,167,56},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={56,167,56},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-58,-10},{-44,-18},{-42,-8},{-72,4},{-58,-10}},
          lineColor={56,167,56},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={56,167,56},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-42,-32},{2,32},{42,-32},{2,8},{-42,-32}},
          lineColor={28,108,200},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          origin={10,44},
          rotation=180),
        Polygon(
          points={{-70,-4},{-64,-44},{-78,-44},{-70,-4}},
          lineColor={56,167,56},
          lineThickness=1,
          smooth=Smooth,
          fillColor={56,167,56},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-6,-24},{88,-38}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-6,-58},{30,-70}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{52,-58},{88,-70}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-72,2},{-68,-2}},
          lineColor={62,186,62},
          lineThickness=1,
          fillColor={62,186,62},
          fillPattern=FillPattern.Solid)}));
end LCC_HVDC;
