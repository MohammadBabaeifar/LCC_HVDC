within LCC_HVDC.Models;
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
