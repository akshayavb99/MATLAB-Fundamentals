%The file baseballPlayers.txt contains season statistics for several top offensive baseball players throughout time.

%TASK 1: Read baseballPlayers.txt into a table named players in MATLAB.
players=readtable('baseballPlayers.txt')

% The variable Pos in the players table contains each player's position. 
%  1B: First Base
%  2B: Second Base
%  3B: Third Base
%  SS: Short Stop
%  C: Catcher
%  LF: Left Field
%  CF: Center Field
%  RF: Right Field
%  OF: Outfield (general)
%  DH: Designated Hitter
% Which position is most represented in the data?
% TASK 2: Convert Pos to a categorical. Combine all the outfield positions (LF, CF, RF, and OF) into one category, OF. 
%         Then, create a histogram of the data in Pos.

players.Pos = mergecats(categorical(players.Pos),{'OF','LF','CF','RF'},'OF');
histogram(players.Pos)

% Runs created is a statistic used in baseball to estimate the number of team runs an individual contributed to.
%  A*B/C
%  A = H + BB
%  B = TB
%  C = AB + BB

% The variables H (hits), BB (base on balls), and AB (at bat) are all in players.

% TB (total bases) must be caculated from other variables found in players.
% TB = H + B2 + 2*B3 + 3*HR

% The variables B2 (double, more commonly abbreviated as “2B”), B3 (triple, more commonly abbreviated as “3B”), and HR (homerun) are all in players.
% TASK 3: Add two variables, TB and RC, to players. Use the formulas given. Make a scatter plot of RC versus Year.
players.TB = players.H + players.B2 + 2*players.B3 + 3*players.HR;
players.RC = (players.H+players.BB).*players.TB./(players.AB + players.BB);
scatter(players.Year,players.RC)
xlabel('Year')
ylabel('Runs Created')

% The live-ball era started in 1920. Many factors around this time contributed to increased hitting statistics.
% TASK 4: Pull out the statistics for the players from the live-ball era, using the Year variable in players. 
%         Then, use the live-ball era data to create a scatter plot to compare RC against a more traditional statistic, RBI.
lbEra = players.Year >= 1920;
lbPlayers = players(lbEra,:);
scatter(lbPlayers.RBI,lbPlayers.RC)
xlabel('Runs Batted In')
ylabel('Runs Created')
title('Comparing Baseball Statistics')

% TASK 5: Add a straight fitted line to the plot.
c = polyfit(lbPlayers.RBI,lbPlayers.RC,1);
RBIfit = [min(lbPlayers.RBI) max(lbPlayers.RBI)];
RCfit = polyval(c,RBIfit);
hold on
plot(RBIfit,RCfit)
hold off

