clear all 
close all
clc


dio3 = daq('ni');

addoutput(dio3,"Dev3","port0/line0:7","Digital");

bvdata = logical([1 0 0 0 0 0 0 0]);
write(dio3,double(bvdata))

%Analog Input_ "Bimba output"
ai = daq('ni');
chans = addinput(ai,'Dev3','ai0','Voltage');
chans.TerminalConfig = 'SingleEnded';
ai.Rate = 1000;



high=2.9;
low=2.3;

%% To allaow the chair slowly speed up
 
for i=1:10
    
bvdata = logical([0 1 0 0 0 0 0 0]);
write(dio3,double(bvdata))

while read(ai,'OutputFormat','Matrix')<high
pk=read(ai,'OutputFormat','Matrix');
end

bvdata = logical([1 0 0 0 0 0 0 0]);
write(dio3,double(bvdata))
pause(0.01)
bvdata = logical([1 1 0 0 0 0 0 0]);
write(dio3,double(bvdata))

while read(ai,'OutputFormat','Matrix')>low
pk1=read(ai,'OutputFormat','Matrix');

end
end


for i=1:30
    
bvdata = logical([0 1 0 0 0 0 0 0]);
write(dio3,double(bvdata))

while read(ai,'OutputFormat','Matrix')<high
pk=read(ai,'OutputFormat','Matrix');
end

bvdata = logical([1 0 0 0 0 0 0 0]);
write(dio3,double(bvdata))
pause(0.05)
bvdata = logical([1 1 0 0 0 0 0 0]);
write(dio3,double(bvdata))

while read(ai,'OutputFormat','Matrix')>low
pk1=read(ai,'OutputFormat','Matrix');

end
end

for i=1:30
    
bvdata = logical([0 1 0 0 0 0 0 0]);
write(dio3,double(bvdata))

while read(ai,'OutputFormat','Matrix')<high
pk=read(ai,'OutputFormat','Matrix');
end

bvdata = logical([1 0 0 0 0 0 0 0]);
write(dio3,double(bvdata))
pause(0.06)
bvdata = logical([1 1 0 0 0 0 0 0]);
write(dio3,double(bvdata))

while read(ai,'OutputFormat','Matrix')>low
pk1=read(ai,'OutputFormat','Matrix');

end
end



%% Stimulation 
for i=1:1400
    
bvdata = logical([0 1 0 0 0 0 0 0]);
write(dio3,double(bvdata))
while read(ai,'OutputFormat','Matrix')<high
pk=read(ai,'OutputFormat','Matrix');
end

bvdata = logical([1 0 0 0 0 0 0 0]);
write(dio3,double(bvdata))
pause(0.135)
bvdata = logical([1 1 0 0 0 0 0 0]);
write(dio3,double(bvdata))

while read(ai,'OutputFormat','Matrix')>low
pk1=read(ai,'OutputFormat','Matrix');

end
end


clear ai
clear dio3

