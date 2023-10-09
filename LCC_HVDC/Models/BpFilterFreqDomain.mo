within LCC_HVDC.Models;
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
