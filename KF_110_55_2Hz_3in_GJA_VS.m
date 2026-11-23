clear all 
close all
clc


dio3 = digitalio('ni','Dev3');

addline(dio3,0:7,'out');

bvdata = logical([1 0 0 0 0 0 0 0]);
putvalue(dio3,bvdata)

%Analog Input_ "Bimba output"
ai = analoginput('nidaq','Dev1');
set(ai,'InputType','SingleEnded')
chans = addchannel(ai,0);
set(ai,'SampleRate',1000)
set(ai,'SamplesPerTrigger',inf)
set(ai,'TriggerType', 'Immediate')



high=2.9;
low=2.3;

%% To allaow the chair slowly speed up
 
for i=1:10
    
bvdata = logical([0 1 0 0 0 0 0 0]);
putvalue(dio3,bvdata)

while getsample(ai)<high
pk=getsample(ai);
end

bvdata = logical([1 0 0 0 0 0 0 0]);
putvalue(dio3,bvdata)
pause(0.01)
bvdata = logical([1 1 0 0 0 0 0 0]);
putvalue(dio3,bvdata)

while getsample(ai)>low
pk1=getsample(ai);

end
end


for i=1:30
    
bvdata = logical([0 1 0 0 0 0 0 0]);
putvalue(dio3,bvdata)

while getsample(ai)<high
pk=getsample(ai);
end

bvdata = logical([1 0 0 0 0 0 0 0]);
putvalue(dio3,bvdata)
pause(0.05)
bvdata = logical([1 1 0 0 0 0 0 0]);
putvalue(dio3,bvdata)

while getsample(ai)>low
pk1=getsample(ai);

end
end

for i=1:30
    
bvdata = logical([0 1 0 0 0 0 0 0]);
putvalue(dio3,bvdata)

while getsample(ai)<high
pk=getsample(ai);
end

bvdata = logical([1 0 0 0 0 0 0 0]);
putvalue(dio3,bvdata)
pause(0.06)
bvdata = logical([1 1 0 0 0 0 0 0]);
putvalue(dio3,bvdata)

while getsample(ai)>low
pk1=getsample(ai);

end
end



%% Stimulation 
for i=1:1400
    
bvdata = logical([0 1 0 0 0 0 0 0]);
putvalue(dio3,bvdata)
while getsample(ai)<high
pk=getsample(ai);
end

bvdata = logical([1 0 0 0 0 0 0 0]);
putvalue(dio3,bvdata)
pause(0.135)
bvdata = logical([1 1 0 0 0 0 0 0]);
putvalue(dio3,bvdata)

while getsample(ai)>low
pk1=getsample(ai);

end
end


delete(ai)
clear ai
delete(dio3)
clear dio3

