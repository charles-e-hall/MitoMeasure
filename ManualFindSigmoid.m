function varargout = ManualFindSigmoid(varargin)
% MANUALFINDSIGMOID MATLAB code for ManualFindSigmoid.fig
%      MANUALFINDSIGMOID, by itself, creates a new MANUALFINDSIGMOID or raises the existing
%      singleton*.
%
%      H = MANUALFINDSIGMOID returns the handle to a new MANUALFINDSIGMOID or the handle to
%      the existing singleton*.
%
%      MANUALFINDSIGMOID('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANUALFINDSIGMOID.M with the given input arguments.
%
%      MANUALFINDSIGMOID('Property','Value',...) creates a new MANUALFINDSIGMOID or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ManualFindSigmoid_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ManualFindSigmoid_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ManualFindSigmoid

% Last Modified by GUIDE v2.5 12-Sep-2016 21:13:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ManualFindSigmoid_OpeningFcn, ...
                   'gui_OutputFcn',  @ManualFindSigmoid_OutputFcn, ...
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


% --- Executes just before ManualFindSigmoid is made visible.
function ManualFindSigmoid_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ManualFindSigmoid (see VARARGIN)

% Choose default command line output for ManualFindSigmoid
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ManualFindSigmoid wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ManualFindSigmoid_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function hill_Callback(hObject, eventdata, handles)
% hObject    handle to hill (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global state



% --- Executes during object creation, after setting all properties.
function hill_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hill (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function center_Callback(hObject, eventdata, handles)
% hObject    handle to center (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function center_CreateFcn(hObject, eventdata, handles)
% hObject    handle to center (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
