within LCC_HVDC.Models;
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
