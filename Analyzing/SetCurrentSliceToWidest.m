function [hObject,eventdata,handles] = SetCurrentSliceToWidest(hObject,eventdata,handles)

[a b c] = size(handles.bwContour);
slice = 0;
distPrev = 0;
for i = 1:c
	bw = handles.bwContour(:,:,i);
	[x y] = ind2sub(size(bw),find(bw));
	dist(i) = max(y) - min(y);
	if dist(i) > distPrev
		slice = i;
		distPrev = dist(i);
	else
		distPrev = dist(i);
	end
end

handles.slice = slice;
set(handles.editSliceNumber,'String',num2str(handles.slice));
set(handles.sliderIMG,'Value',handles.slice)
guidata(hObject, handles);
UpdateImage(hObject,eventdata,handles)	