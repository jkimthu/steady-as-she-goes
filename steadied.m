% steadied

% last updated: 2016 Oct 04, jen
% created: 2016 Oct 03, jen


% goal: curate data from steady-state window of MIT flucutating experiments:

%       60 min period: 2015-08-10
%       15 min period: 2015-08-18


% data here includes, for constant and fluctuating environments:
%       1. cell cycle durations
%       2. growth rates (mu)


% time window of stabilized data, in hours
firstTimepoint = 5; 
lastTimepoint = 10;

%% ONE. curating cell cycle duration data

% from 60 min period experiment, 2015-08-10
load('dC_0810.mat')
dC = spinOffs;
load('dF_0810.mat')
dF = spinOffs;
clear spinOffs;

p60_cDurations = dC.allDurations;
p60_fDurations = dF.allDurations;

p60_cTime = dC.allTimestamps;
p60_fTime = dF.allTimestamps;
clear spinOffs dC dF;

%%
% from 15 min period experiment, 2015-08-18
load('dC_0818.mat')
dC = spinOffs;
load('dF_0818.mat')
dF = spinOffs;

p15_cDurations = dC.allDurations;
p15_fDurations = dF.allDurations;

p15_cTime = dC.allTimestamps;
p15_fTime = dF.allTimestamps;
clear spinOffs dC dF;

%%
% trim data points to times of interest (stabilized)

% 1. trim timepoints earlier than first
p60_cDurations = p60_cDurations(p60_cTime >= firstTimepoint);
lowTrimmed_p60_cTime = p60_cTime(p60_cTime >= firstTimepoint);

p60_fDurations = p60_fDurations(p60_fTime >= firstTimepoint);
lowTrimmed_p60_fTime = p60_fTime(p60_fTime >= firstTimepoint);

p15_cDurations = p15_cDurations(p15_cTime >= firstTimepoint);
lowTrimmed_p15_cTime = p15_cTime(p15_cTime >= firstTimepoint);

p15_fDurations = p15_fDurations(p15_fTime >= firstTimepoint);
lowTrimmed_p15_fTime = p15_fTime(p15_fTime >= firstTimepoint);



% 2. trim off timepoints later than last
p60_cDurations = p60_cDurations(lowTrimmed_p60_cTime <= lastTimepoint);
steadyState_p60_cTime = lowTrimmed_p60_cTime(lowTrimmed_p60_cTime <= lastTimepoint);

p60_fDurations = p60_fDurations(lowTrimmed_p60_fTime <= lastTimepoint);
steadyState_p60_fTime = lowTrimmed_p60_fTime(lowTrimmed_p60_fTime <= lastTimepoint);

p15_cDurations = p15_cDurations(lowTrimmed_p15_cTime <= lastTimepoint);
steadyState_p15_cTime = lowTrimmed_p15_cTime(lowTrimmed_p15_cTime <= lastTimepoint);

p15_fDurations = p15_fDurations(lowTrimmed_p15_fTime <= lastTimepoint);
steadyState_p15_fTime = lowTrimmed_p15_fTime(lowTrimmed_p15_fTime <= lastTimepoint);

clear p60_cTime p60_fTime p15_cTime p15_fTime;
clear lowTrimmed_p60_cTime lowTrimmed_p60_fTime lowTrimmed_p15_cTime lowTrimmed_p15_fTime;
    

% 3. calculate mean durations, per condition in stabilized region
mean_p60_cDur = mean(p60_cDurations);
mean_p15_cDur = mean(p15_cDurations);
mean_p60_fDur = mean(p60_fDurations);
mean_p15_fDur = mean(p15_fDurations);



%% TWO. curating growth rate (mu) data

% from 60 min period experiment, 2015-08-10
load('dm0810-fluct.mat');
p60_fMus = dataMatrix(:,4);
p60_fTime = dataMatrix(:,2);
clear dataMatrix;

load('dm0810-const.mat');
p60_cMus = dataMatrix(:,4);
p60_cTime = dataMatrix(:,2);
clear dataMatrix;

%%
% from 15 min period experiment, 2015-08-18
load('dm0818-fluc.mat');
p15_fMus = dataMatrix(:,4);
p15_fTime = dataMatrix(:,2);
clear dataMatrix;

load('dm0818-const.mat');
p15_cMus = dataMatrix(:,4);
p15_cTime = dataMatrix(:,2);
clear dataMatrix;

%%
% trim data points to times of interest (stabilized)

% 1. trim timepoints earlier than first
p60_fMus = p60_fMus(p60_fTime >= firstTimepoint);
lowTrimmed_p60_fTime = p60_fTime(p60_fTime >= firstTimepoint);

p15_fMus = p15_fMus(p15_fTime >= firstTimepoint);
lowTrimmed_p15_fTime = p15_fTime(p15_fTime >= firstTimepoint);

p60_cMus = p60_cMus(p60_cTime >= firstTimepoint);
lowTrimmed_p60_cTime = p60_cTime(p60_cTime >= firstTimepoint);

p15_cMus = p15_cMus(p15_cTime >= firstTimepoint);
lowTrimmed_p15_cTime = p15_cTime(p15_cTime >= firstTimepoint);


% 2. trim off timepoints later than last
steadyState_p60_fMus = p60_fMus(lowTrimmed_p60_fTime <= lastTimepoint);
steadyState_p60_fTime = lowTrimmed_p60_fTime(lowTrimmed_p60_fTime <= lastTimepoint);

steadyState_p15_fMus = p15_fMus(lowTrimmed_p15_fTime <= lastTimepoint);
steadyState_p15_fTime = lowTrimmed_p15_fTime(lowTrimmed_p15_fTime <= lastTimepoint);

steadyState_p60_cMus = p60_cMus(lowTrimmed_p60_cTime <= lastTimepoint);
steadyState_p60_cTime = lowTrimmed_p60_cTime(lowTrimmed_p60_cTime <= lastTimepoint);

steadyState_p15_cMus = p15_cMus(lowTrimmed_p15_cTime <= lastTimepoint);
steadyState_p15_cTime = lowTrimmed_p15_cTime(lowTrimmed_p15_cTime <= lastTimepoint);

% 3. calculate mean growth rate, for constant conditions in stabilized region
mean_p60_fMus = mean(steadyState_p60_fMus);
mean_p15_fMus = mean(steadyState_p15_fMus);
mean_p60_cMus = mean(steadyState_p60_cMus);
mean_p15_cMus = mean(steadyState_p15_cMus);


clear p15_fTime p60_fTime lowTrimmed_p15_fTime lowTrimmed_p60_fTime steadyState_p15_fTime steadyState_p60_fTime
clear p15_cTime p60_cTime lowTrimmed_p15_cTime lowTrimmed_p60_cTime steadyState_p15_cTime steadyState_p60_cTime
clear p15_fMus p60_fMus p15_cMus p60_cMus

%% THREE. plotting growth rate vs dimensionless timescale

% plot timescale, straight up!
figure(1)
timeScale(1,1) = 15;
timeScale(2,1) = 60;
percentChange(1,1) = (mean_p15_fMus - mean_p15_cMus)/mean_p15_cMus *100;
percentChange(2,1) = (mean_p60_fMus - mean_p60_cMus)/mean_p60_cMus *100;
plot(timeScale,percentChange,'o')
 

% plot dimensionless, from constant cell cycle durations
figure(2)
noDim(1,1) = 15/mean_p15_cDur*60;
noDim(2,1) = 60/mean_p60_cDur*60;
plot(noDim,percentChange,'o')

 