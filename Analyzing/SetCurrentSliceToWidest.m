function [hObject,eventdata,handles] = SetCurrentSliceToWidest(hObject,eventdata,handles)

[a b c] = size(handles.bwContour);
slice = 0;
distPrev = 0;
maxDist = 0;
for i = 1:c
	bw = handles.bwContour(:,:,i);
    if length(find(bw)) > 0
        [x y] = ind2sub(size(bw),find(bw));
        dist = max(y) - min(y);
        if dist > maxDist
            slice = i;
            maxDist = dist;
        end
    end
end

handles.slice = slice;
set(handles.editSliceNumber,'String',num2str(handles.slice));
set(handles.sliderIMG,'Value',handles.slice)
guidata(hObject, handles);
UpdateImage(hObject,eventdata,handles)	