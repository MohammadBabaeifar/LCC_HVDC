within LCC_HVDC.Models;
model Mod
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real A = 2*Modelica.Constants.pi;
equation
  y = mod(u, A);
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Text(extent = {{-100, 10}, {100, -20}}, lineColor = {0, 0, 255}, textString = "mod(u/A)")}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
<p> This block functions as: mode(x,y) where x is the block input (u) and y is 2pi.</p>
Modelica.Reference.Operators.'mod()'
</body>
</html>"));
end Mod;
