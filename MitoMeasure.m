function varargout = MitoMeasure(varargin)

global state
% MITOMEASURE MATLAB code for MitoMeasure.fig
%      MITOMEASURE, by itself, creates a new MITOMEASURE or raises the existing
%      singleton*.
%
%      H = MITOMEASURE returns the handle to a new MITOMEASURE or the handle to
%      the existing singleton*.
%
%      MITOMEASURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MITOMEASURE.M with the given input arguments.
%
%      MITOMEASURE('Property','Value',...) creates a new MITOMEASURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MitoMeasure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MitoMeasure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MitoMeasure

% Last Modified by GUIDE v2.5 20-Jun-2016 11:29:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MitoMeasure_OpeningFcn, ...
                   'gui_OutputFcn',  @MitoMeasure_OutputFcn, ...
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


% --- Executes just before MitoMeasure is made visible.
function MitoMeasure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure

% Choose default command line output for MitoMeasure
handles.output = hObject;
global state
state.counter = 0;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MitoMeasure wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MitoMeasure_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openImage.
function openImage_Callback(hObject, eventdata, handles)
global state
% hObject    handle to openImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Grab values for state.channel
state.channel.red = get(handles.redChannel,'Value');
state.channel.green = get(handles.greenChannel,'Value');
state.channel.blue = get(handles.blueChannel,'Value');

%Grab values for state.decon
state.decon.none = get(handles.imageDeconNone,'Value');
state.decon.blind = get(handles.blindDeconvolution,'Value');
if get(handles.blindDeconvolution,'Value')
    state.decon.none = False;
end

%Grab values for state.thresh
state.thresh.auto = get(handles.imageDeconNone,'Value');

%Grab settings from advanced settings
state.data.suppress = 0;
state.data.save = 1;

[file path] = uigetfile('.tif');
state.filename = [path file];
state.path = path;
state.counter = state.counter + 1;

%Check that base name is provided
if isempty(get(handles.baseName,'String'))
    temp = strsplit(file, '.tif');
    fileWithSpace = char(temp(1));
    c = strsplit(fileWithSpace);
    if numel(c) >=2
        fileb = c(1);
        for i=2:length(c)
            fileb = strcat(fileb,c(i));
        end
        state.baseName = fileb;
    else
        state.baseName = fileWithSpace;
    end
    %delete('c');
    %if exist('fileb')
        %delete('fileb')
    %end
    c = strsplit(char(state.baseName), '#');
    if numel(c) >= 2
        fileb = c(1);
        for i=2:length(c)
            fileb = strcat(fileb,c(i));
        end
        state.baseName = fileb;
    end
else
    state.baseName = get(handles.baseName,'String');
end
state.data.reviewed = 0;
calcMitochondria;



function baseName_Callback(hObject, eventdata, handles)
% hObject    handle to baseName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of baseName as text
%        str2double(get(hObject,'String')) returns contents of baseName as a double


% --- Executes during object creation, after setting all properties.
function baseName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baseName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in automaticThreshold.
function automaticThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to automaticThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of automaticThreshold


% --- Executes on button press in manualThreshold.
function manualThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to manualThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of manualThreshold
