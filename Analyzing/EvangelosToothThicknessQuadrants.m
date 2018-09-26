function [hObject, eventdata,handles] = EvangelosToothThicknessQuadrants(hObject,eventdata,handles)

handles.bwOriginal = handles.bwContour;
[a b c] = size(handles.bwContour);
for i = 1:a
    for j = 1:b
        for k = 1:c
            if handles.bwX(i,j,k) == 1
                handles.bwContour(i,j,k) = 0;
            end
        end
    end
end
% handles.bwContour(handles.bwX) = 0;
cc = bwconncomp(handles.bwContour);
if length(cc.PixelIdxList) > 4
    msgbox('There are more than 4 components! Make sure there isn''t something extra in the image.');
end


for i = 1:length(cc.PixelIdxList)
    BW = false(size(handles.bwOriginal));
    BW(cc.PixelIdxList{i}) = 1;
    handles.bwContour = BW;
    [x,y,v] = ind2sub(size(BW),find(BW));
    center = [mean(x),mean(y)];
    [hObject,eventdata,handles] = CorticalAnalysisEvangelos(hObject,eventdata,handles,center);
end
    