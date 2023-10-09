within LCC_HVDC.Models;
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
