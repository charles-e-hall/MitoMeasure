function varargout = reviewMitochondria(varargin)
% REVIEWMITOCHONDRIA MATLAB code for reviewMitochondria.fig
%      REVIEWMITOCHONDRIA, by itself, creates a new REVIEWMITOCHONDRIA or raises the existing
%      singleton*.
%
%      H = REVIEWMITOCHONDRIA returns the handle to a new REVIEWMITOCHONDRIA or the handle to
%      the existing singleton*.
%
%      REVIEWMITOCHONDRIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REVIEWMITOCHONDRIA.M with the given input arguments.
%
%      REVIEWMITOCHONDRIA('Property','Value',...) creates a new REVIEWMITOCHONDRIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before reviewMitochondria_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to reviewMitochondria_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help reviewMitochondria

% Last Modified by GUIDE v2.5 24-Oct-2016 14:53:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @reviewMitochondria_OpeningFcn, ...
                   'gui_OutputFcn',  @reviewMitochondria_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before reviewMitochondria is made visible.
function reviewMitochondria_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to reviewMitochondria (see VARARGIN)

% Choose default command line output for reviewMitochondria
handles.output = hObject;

% Update handles structure

handles.counter = 1;
guidata(hObject, handles);

% UIWAIT makes reviewMitochondria wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = reviewMitochondria_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openForReview.
function openForReview_Callback(hObject, eventdata, handles)
% hObject    handle to openForReview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear
global name
[handles.file handles.path] = uigetfile('.mat');

button = questdlg('Please select a folder in which to save analyzed data', ...
    'Set Save Path', 'Ok', 'Ok');

handles.save_path = uigetdir;

name = load([handles.path handles.file]);

handles.fileBase = strsplit(handles.file, '.mat');

% if numel(name) >= 2
%     disp('Problem loading data');
% end
figure('Name', 'Automated Analysis Review', 'CloseRequestFcn', @my_closereq);
imshow(name.(handles.fileBase{1}).image.mitoThresh, [0 255]);
hold on;
contour(name.(handles.fileBase{1}).image.mitochondria,[0.5,0.5],'r');
title('Automatically Identified Mitochondria');

%name.(handles.fileBase{1}).autokeep = questdlg('Do you want to keep the automatically identified mitochondria', 'Keep Mitochondria', 'Yes', 'No', 'Yes');

figure('Name', 'Mitochondria Review', 'Tag', 'reviewFigure');
imshow(name.(handles.fileBase{1}).image.mitoThresh, [0 255]);
%handles.output = hObject;
guidata(hObject, handles);

function my_closereq(src,callbackdata)
global name
name.(handles.fileBase{1}).autokeep = questdlg('Do you want to keep the automatically identified mitochondria', 'Keep Mitochondria', 'Yes', 'No', 'Yes');
delete(gcf);


% --- Executes on button press in manualMitochondria.
function manualMitochondria_Callback(hObject, eventdata, handles)
% hObject    handle to manualMitochondria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%h = findobj('Tag', 'reviewFigure');
global name
h = findobj('Name', 'Mitochondria Review');
set(0, 'CurrentFigure', h);
[x, y] = getline(h);
hold on;
name.(handles.fileBase{1}).review.manual{handles.counter} = [x y];
handles.counter = handles.counter + 1;
line(x, y, 'Color', 'red', 'LineWidth', 3);
set(handles.mitoCounter, 'String', handles.counter);
guidata(hObject, handles);



function mitoCounter_Callback(hObject, eventdata, handles)
% hObject    handle to mitoCounter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mitoCounter as text
%        str2double(get(hObject,'String')) returns contents of mitoCounter as a double


% --- Executes during object creation, after setting all properties.
function mitoCounter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mitoCounter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%set(handles.mitoCounter, 'String', handles.counter);
guidata(hObject, handles);


% --- Executes on button press in undoLast.
function undoLast_Callback(hObject, eventdata, handles)
% hObject    handle to undoLast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.counter = handles.counter - 1;
guidata(hObject, handles);


% --- Executes on button press in done.
function done_Callback(hObject, eventdata, handles)
% hObject    handle to done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global name
name.(handles.fileBase{1}).data.reviewed = 1;
cd(handles.save_path);
evalc([handles.fileBase{1} '= name.(handles.fileBase{1})']);
save(handles.fileBase{1}, handles.fileBase{1});
h = findobj('Name', 'Mitochondria Review');
close(h);
