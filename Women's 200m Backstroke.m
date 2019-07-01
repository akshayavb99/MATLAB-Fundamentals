%TASK 1: Bring the data from backstroke.mat into MATLAB.
load backstroke.mat

%TASK 2:The file backstroke.mat contains times for each swimmer from the 2016 Olympic women's backstroke finals. It contains the following three variables.
%       time is a matrix containing the times of the eight swimmers (rows) at 50, 100, 150, and 200 meters (columns)
%       name is a cell array containing the swimmers' last names
%       country is a cell array containing the swimmer's national code
%       For this task, you will plot the times of each swimmer against distance.

%       (i) Add a column of zeros to time in the beginning. This represents each swimmer's starting time.
%       (ii) Plot each swimmer's times against a vector that goes from 0 to 200 in increments of 50. Use eight solid lines with markers.
%       (iii) Add a legend using the values in name.

time = [zeros(8,1) time];
d = 0:50:200;

plot(d,time,'x-')
xlabel('Distance (m)')
ylabel('Time (s)')
xticks(d)
legend(name,'location','northwest')


%TASK 3: Because all the athletes are so closely matched, it's difficult to see what's happening in this plot.
%         Subtract the swimmers' times from the shortest time at each distance. 
%         Plot these values against distance using a solid line with markers. This time, use country in the legend.
%         Do not modify the matrix time; you'll need it in the next task.

plot(d,(min(time) - time),'x-')
xlabel('Distance (m)')
ylabel('Time Behind Lead (s)')
xticks(d)
legend(country,'location','eastoutside')

%TASK 4: Plot the lap split values for each swimmer. That is, the amount of time it takes the swimmer to swim each of the 50 meters.

plot(diff(time,[],2)','x-')
xlabel('Lap Number')
xlim([1 4])
ylabel('Split Time (s)')
legend(country,'location','eastoutside')

