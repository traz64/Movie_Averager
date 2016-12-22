function varargout = FrameAverager(varargin)
% FrameAverager MATLAB code for FrameAverager.fig
%      FrameAverager, by itself, creates a new FrameAverager or raises the existing
%      singleton*.
%
%      H = FrameAverager returns the handle to a new FrameAverager or the handle to
%      the existing singleton*.
%
%      FrameAverager('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FrameAverager.M with the given input arguments.
%
%      FrameAverager('Property','Value',...) creates a new FrameAverager or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FrameAverager_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FrameAverager_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FrameAverager

% Last Modified by GUIDE v2.5 22-Dec-2016 13:42:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FrameAverager_OpeningFcn, ...
                   'gui_OutputFcn',  @FrameAverager_OutputFcn, ...
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


% --- Executes just before FrameAverager is made visible.
function FrameAverager_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FrameAverager (see VARARGIN)

% Choose default command line output for FrameAverager
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FrameAverager wait for user response (see UIRESUME)
% uiwait(handles.FrameAverager);


% --- Outputs from this function are returned to the command line.
function varargout = FrameAverager_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if exists(handles.pathtext.string,'file')==2
    creategraph(handles.pathtext.string,str2double(handles.ar.string),...
        fpp,mode,thresh);
else 
    warndlg('bad path')
end

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
    thresh=str2double(handles.threshold.string);
else 
    thresh=-1;
end
% Hint: get(hObject,'Value') returns toggle state of checkbox1



function threshold_Callback(hObject, eventdata, handles)
% hObject    handle to threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
thresh=str2double(get(hObject,'String'));
if isnan(thresh)
    thresh=-1;
end

% Hints: get(hObject,'String') returns contents of threshold as text
%        str2double(get(hObject,'String')) returns contents of threshold as a double


% --- Executes during object creation, after setting all properties.
function threshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pathtext_Callback(hObject, eventdata, handles)
% hObject    handle to pathtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pathtext as text
%        str2double(get(hObject,'String')) returns contents of pathtext as a double


% --- Executes during object creation, after setting all properties.
function pathtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pathtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ar_Callback(hObject, eventdata, handles)
% hObject    handle to ar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ar as text
%        str2double(get(hObject,'String')) returns contents of ar as a double
ar=str2double(get(hObject,'String'));
if isnan(ar)
    ar=-1;
end


% --- Executes during object creation, after setting all properties.
function ar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ppf=int16(get(hObject,'Value')*299)+1;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ppf=1;
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pathtext.string=uigetfile(getFilterSpec(VideoReader.getFileFormats()));
