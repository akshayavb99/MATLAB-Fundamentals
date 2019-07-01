%The file cassini.txt contains data on the location of the Cassini-Huygens spacecraft for the first several years of the probe's mission. 
%In this project, you'll visualize the position of the spacecraft around the sun.

%TASK 1: Read the data from cassiniData.txt into a table named cassini. Read the data from planetData.txt into a table named planets.

cassini = readtable('cassiniData.txt');
planets = readtable('planetData.txt');

%TASK 2: Plot the x-y position of the spacecraft, using variables x and y in the table cassini. 
%        Use the yr variable to plot each year in a different color than the prior year.

for k = min(cassini.yr):max(cassini.yr)
     plot(cassini.x(cassini.yr==k),cassini.y(cassini.yr==k))
     hold on
end
hold off

%TASK 3: The table planets contains the orbital radius of each of the eight planets in our solar system.
%        You can use the radius to add orbits to your plot. To plot a circle of radius r, create a vector of angles from 0 to 2π. 
%        Then create the x-y data for the plot using the following formulas: x=rcos(θ),y=rsin(θ)
%        Add the orbits for the first six planets in planets to the plot as black dotted lines. 
%        For each planet, use the value in Radius to plot a circular orbit.

theta = linspace(0,2*pi);

hold on
for k = 1:6
    plot(planets.Radius(k)*cos(theta),planets.Radius(k)*sin(theta),'k:')
end
hold off

%TASK 4: Notice in your plot that the spacecraft can be in a planet's orbit for multiple days. 
%        How many days did it spend in the orbit of each planet? You can find the distance of the spacecraft from the sun using its x-y-z data in the table cassini.
%        d=(x^2+y^2+z^2)^0.5

%        Add a variable named Days to the planets table which contains the total number of days the spacecraft is in the orbit of each planet.
%        Note that the values in Radius are accurate to only two decimal places.

d = round(sqrt(cassini.x.^2 + cassini.y.^2 + cassini.z.^2),2);
t = zeros(length(planets.Radius),1);
for k = 1:length(planets.Radius)
    t(k) = nnz(d == planets.Radius(k));
end
planets.Days = t
