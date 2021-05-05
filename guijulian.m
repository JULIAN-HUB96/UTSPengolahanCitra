function varargout = guijulian(varargin)
% GUIJULIAN MATLAB code for guijulian.fig
%      GUIJULIAN, by itself, creates a new GUIJULIAN or raises the existing
%      singleton*.
%
%      H = GUIJULIAN returns the handle to a new GUIJULIAN or the handle to
%      the existing singleton*.
%
%      GUIJULIAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIJULIAN.M with the given input arguments.
%
%      GUIJULIAN('Property','Value',...) creates a new GUIJULIAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guijulian_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guijulian_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guijulian

% Last Modified by GUIDE v2.5 04-May-2021 18:07:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guijulian_OpeningFcn, ...
                   'gui_OutputFcn',  @guijulian_OutputFcn, ...
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


% --- Executes just before guijulian is made visible.
function guijulian_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guijulian (see VARARGIN)

% Choose default command line output for guijulian
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guijulian wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guijulian_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.*'});
setappdata(0,'filename',filename);
a=imread(fullfile(pathname,filename));
axes(handles.axes1);
imshow(a)
setappdata(0,'a',a);
title('Gambar Asli');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_bw=im2bw(a,.57)
axes(handles.axes2);
imshow(a_bw);
setappdata(0,'filename',a_bw);
title('Hasil Black and White');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=rgb2gray(a);
setappdata(0,'filename', a_gray);
axes(handles.axes2);
imshow(a_gray);
title('Hasil Grayscale');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0, 'a')
rotate=imrotate(a,45);
axes(handles.axes2);
imshow(rotate);
title('hasil Rotation');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(a);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
IM2=imcomplement(a);
axes(handles.axes2);
imshow(IM2);
title('Hasil Complement');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes2);
imhist(input);
title('Hasil Histogram');


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
citra = (a);
axes(handles.axes1)
imshow(citra);

h = imrect;
position = wait(h);
hasil1 = imcrop(citra,position);
handles.hasil1= hasil1;
axes(handles.axes2)
imshow(hasil1);
title('Hasil Crop');


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
noise=imnoise(a, 'salt & pepper');
axes(handles.axes2);
imshow(noise);
title('Hasil noise salt & pepper');


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
red=a;
red(:,:,2:3)=0;
setappdata(0,'filename',red);
setappdata(0,'Imrotation',red);
axes(handles.axes2);
imshow(red);
title('Hasil Red');

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
Blue=a;
Blue(:,:,1:2)=0;
setappdata(0,'filename',Blue);
setappdata(0,'ImRotation',Blue);
axes(handles.axes2);
imshow(Blue);
title('Hasil Blue');


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
Green=a;
Green(:,:,3:3)=0;
setappdata(0,'filename',Green);
setappdata(0,'ImRotation',Green);
axes(handles.axes2);
imshow(Green);
title('Hasil Green');
