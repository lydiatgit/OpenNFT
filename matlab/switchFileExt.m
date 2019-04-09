function switchFileExt(origORupdated)
% switch _updated and _orig script extensions depending on if using demo or updated mode
% input:
% origORupdated = 1; use original scripts (i.e. give updated script the _updated extension and remove _orig extension from orig scripts)
% origORupdated = 2; use updated scripts  (i.e. give orig script the _orig extension and remove _updated extension from updated scripts)


if origORupdated == 1
suffixOFF = 'orig';
suffixON = 'updated';
elseif origORupdated == 2
suffixOFF = 'updated';
suffixON = 'orig';
end

files = dir(['**/*_' suffixOFF '.m']); 

%% add suffix to scripts you don't want to use
for badFile = 1:size(files,1)
baseStr = erase(files(badFile).name,['_' suffixOFF '.m']);
movefile([files(badFile).folder filesep baseStr '.m'],[files(badFile).folder filesep baseStr '_' suffixON '.m']);
end

%% remove suffix from scripts you do want to use
for goodFile = 1:size(files,1)
baseStr = erase(files(goodFile).name,['_' suffixOFF]);
movefile([files(goodFile).folder filesep files(goodFile).name],[files(goodFile).folder filesep baseStr]);
end


end
