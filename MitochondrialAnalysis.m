function varargout = MitochondrialAnalysis(varargin)
% MITOCHONDRIALANALYSIS MATLAB code for MitochondrialAnalysis.fig
%      MITOCHONDRIALANALYSIS, by itself, creates a new MITOCHONDRIALANALYSIS or raises the existing
%      singleton*.
%
%      H = MITOCHONDRIALANALYSIS returns the handle to a new MITOCHONDRIALANALYSIS or the handle to
%      the existing singleton*.
%
%      MITOCHONDRIALANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MITOCHONDRIALANALYSIS.M with the given input arguments.
%
%      MITOCHONDRIALANALYSIS('Property','Value',...) creates a new MITOCHONDRIALANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MitochondrialAnalysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MitochondrialAnalysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MitochondrialAnalysis

% Last Modified by GUIDE v2.5 24-Oct-2016 15:42:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MitochondrialAnalysis_OpeningFcn, ...
                   'gui_OutputFcn',  @MitochondrialAnalysis_OutputFcn, ...
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


% --- Executes just before MitochondrialAnalysis is made visible.
function MitochondrialAnalysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MitochondrialAnalysis (see VARARGIN)

% Choose default command line output for MitochondrialAnalysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MitochondrialAnalysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MitochondrialAnalysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in rawImage.
function rawImage_Callback(hObject, eventdata, handles)
% hObject    handle to rawImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MitoMeasure


% --- Executes on button press in reviewImages.
function reviewImages_Callback(hObject, eventdata, handles)
% hObject    handle to reviewImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
reviewMitochondria


% --- Executes on button press in analyzeData.
function analyzeData_Callback(hObject, eventdata, handles)
% hObject    handle to analyzeData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
analyzeMitoData
