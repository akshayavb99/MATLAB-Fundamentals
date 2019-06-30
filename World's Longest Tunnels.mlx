%The longTunnels.txt file contains information about tunnels in use around that world that are at least 13 km long.
%This code creates continent data.
europe = {'Austria','Belarus','Finland','France/Italy',...
    'Germany','Greece','Hungary','Italy','Norway',...
    'Poland','Portugal','Russia','Spain','Sweden',...
    'Switzerland','Switzerland/France','Switzerland/Italy',...
    'Ukraine','United Kingdom','United Kingdom/France'};
na = {'Canada','United States'};
sa = {'Peru'};
asia = {'China','India','Japan','Singapore',...
    'South Korea','Taiwan','Thailand','Turkey'};
africa = {'South Africa'};

%TASK 1: Read longTunnels.txt into a table named tunnels in MATLAB.
tunnels=readtable('longTunnels.txt')

%TASK 2: Create a histogram of the years, found in the Year variable of tunnels, that the tunnels were completed. 
%        Give each year in the range its own bin.
histogram(tunnels.Year,'BinMethod','integers')

%TASK 3: Many different types of tunnels are represented in the Type variable of tunnels.
         (i) Convert Type to a categorical array.
         (ii) Save the different types of tunnels to a cell array named types.
         (iii) Save a table named pa with all the data for the Particle Accelerator type in tunnels.
tunnels.Type = categorical(tunnels.Type);
types = categories(tunnels.Type)
pa = tunnels(tunnels.Type == 'Particle Accelerator',:)

%TASK 4: The Region variable in tunnels contains the country or region in which the tunnel can be found.
         (i)Convert Region to a categorical array.
         (ii)Make a histogram of the tunnel Type for only those tunnels in Japan.
tunnels.Region = categorical(tunnels.Region);
histogram(tunnels.Type(tunnels.Region=='Japan'))
title('Longest Tunnels in Japan')

%TASK 5: There are five cell arrays named europe, na, sa, asia, and africa defined in the script. 
%        They contain a list of countries in the dataset. Use these cell arrays to create a new categorical variable named Continent in tunnels. 
%        This variable should have the following categories:
%         (a) Europe
%         (b) North America
%         (c) South America
%         (d) Asia
%         (e) Africa

%        Create a histogram of the continents for only the Railway tunnels.
tunnels.Continent = mergecats(tunnels.Region,europe,'Europe');
tunnels.Continent = mergecats(tunnels.Continent,na,'North America');
tunnels.Continent = mergecats(tunnels.Continent,sa,'South America');
tunnels.Continent = mergecats(tunnels.Continent,asia,'Asia');
tunnels.Continent = mergecats(tunnels.Continent,africa,'Africa');
histogram(tunnels.Continent(tunnels.Type == 'Railway'))
title('Longest Railway Tunnels')





