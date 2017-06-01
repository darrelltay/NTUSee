function varargout = Ising(varargin)
% ISING MATLAB code for Ising.fig
%      ISING, by itself, creates a new ISING or raises the existing
%      singleton*.
%
%      H = ISING returns the handle to a new ISING or the handle to
%      the existing singleton*.
%
%      ISING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ISING.M with the given input arguments.
%
%      ISING('Property','Value',...) creates a new ISING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Ising_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Ising_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Ising

% Last Modified by GUIDE v2.5 14-May-2015 00:51:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ising_OpeningFcn, ...
                   'gui_OutputFcn',  @Ising_OutputFcn, ...
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


% --- Executes just before Ising is made visible.
function Ising_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ising (see VARARGIN)

% Choose default command line output for Ising
handles.output = hObject;
cla(handles.axes1);cla(handles.axes2);set(handles.text15,'string','NaN');
handles.MinLS = 50;handles.MaxLS = 200;
handles.MinJ = 1;handles.MaxJ = 100;
handles.MinH = -1;handles.MaxH = 1;
handles.MinT = 10;handles.MaxT = 2000;
handles.MinF = 0;handles.MaxF = 1;
handles.EqSteps = 10000;
set(handles.text5,'string',int2str(handles.MinLS));
set(handles.text6,'string',int2str(handles.MaxLS));
set(handles.text7,'string',num2str(handles.MinJ,3));
set(handles.text8,'string',num2str(handles.MaxJ,3));
set(handles.text9,'string',num2str(handles.MinH,3));
set(handles.text10,'string',num2str(handles.MaxH,3));
set(handles.text11,'string',int2str(handles.MinT));
set(handles.text12,'string',int2str(handles.MaxT));
set(handles.text22,'string',int2str(handles.MinF));
set(handles.text23,'string',int2str(handles.MaxF));
set(handles.text15,'string','NaN');
set(handles.text16,'string',int2str(handles.EqSteps));

set(handles.slider5,'value',.5);
F = handles.MinF+(handles.MaxF-handles.MinF)*get(handles.slider1,'Value');
set(handles.text24,'string',num2str(F,3));
set(handles.slider1,'value',.5);
N = handles.MinLS+ceil((handles.MaxLS-handles.MinLS)*get(handles.slider1,'Value'));
set(handles.text17,'string',int2str(N));
set(handles.slider4,'value',.2);
T = handles.MinT+ceil((handles.MaxT-handles.MinT)*get(handles.slider4,'Value'));
set(handles.text20,'string',int2str(T));
set(handles.slider3,'value',.5);
B = handles.MinH+(handles.MaxH-handles.MinH)*get(handles.slider3,'Value');
set(handles.text19,'string',num2str(B,4));
set(handles.slider2,'value',0);
J = handles.MinJ+(handles.MaxJ-handles.MinJ)*get(handles.slider2,'Value');
set(handles.text18,'string',num2str(J,4));
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ising wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Ising_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = handles.MinLS+ceil((handles.MaxLS-handles.MinLS)*get(handles.slider1,'Value'));
set(handles.text17,'string',int2str(N));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
J = handles.MinJ+(handles.MaxJ-handles.MinJ)*get(handles.slider2,'Value');
set(handles.text18,'string',num2str(J,4));


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
B = handles.MinH+(handles.MaxH-handles.MinH)*get(handles.slider3,'Value');
set(handles.text19,'string',num2str(B,4));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
T = handles.MinT+ceil((handles.MaxT-handles.MinT)*get(handles.slider4,'Value'));
set(handles.text20,'string',int2str(T));

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
F = handles.MinF+(handles.MaxF-handles.MinF)*get(handles.slider5,'Value');
set(handles.text24,'string',num2str(F,3));

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DisplaySteps = 500; cla(handles.axes1);cla(handles.axes2);set(handles.text15,'string','NaN');
set(handles.pushbutton1,'Enable','off');
set(handles.slider1,'Enable','off');
set(handles.slider2,'Enable','off');
set(handles.slider3,'Enable','off');
set(handles.slider4,'Enable','off');
set(handles.slider5,'Enable','off');
N = handles.MinLS+ceil((handles.MaxLS-handles.MinLS)*get(handles.slider1,'Value'));
J = handles.MinJ+(handles.MaxJ-handles.MinJ)*get(handles.slider2,'Value');
B = handles.MinH+(handles.MaxH-handles.MinH)*get(handles.slider3,'Value');
T = handles.MinT+ceil((handles.MaxT-handles.MinT)*get(handles.slider4,'Value'));T = T/200;
F = handles.MinF+(handles.MaxF-handles.MinF)*get(handles.slider5,'Value');
EQC = handles.EqSteps;
M = 100000;
    set(handles.pushbutton2,'UserData',0)
    %% Set Random number length
    EXP = [4+B;4-B;2+B;2-B;B;-B;-2+B;-2-B;-4+B;-4-B];
    EXP = mean((exp(-EXP/T)>=1)+(exp(-EXP/T)<1).*exp(-EXP/T));
    C = ceil(M/EXP + 2*M*EXP*(1-EXP)+EQC);
    
    %% Drive to equilibrium State    
    % Generating Initial Random Configuration
    rand('seed',sum(100*clock));
    Conf = 1-2*(rand(N,N)>F);
    
    %Set Random number
    Rand = rand(C,2);
    IndexX = floor(ceil(Rand(:,1)*N*N)/N) +1 -((mod(ceil(Rand(:,1)*N*N),N)==0));
    IndexY = ceil(Rand(:,1)*N*N) - N*(IndexX-1);
    
    % Drive to the equilibrium state
    for i = 1:EQC
        X = IndexX(i,1);Y = IndexY(i,1);
        DelE = 2*J*Conf(X,Y)*(Conf(mod(X-2,N)+1,Y)+ Conf(mod(X,N)+1,Y) + Conf(X,mod(Y-2,N)+1) + Conf(X,mod(Y-2,N)+1)) -  2*Conf(X,Y)*B;    
        Conf(X,Y) = -Conf(X,Y)*(Rand(i,2)<=exp(-DelE/T)) + Conf(X,Y)*(Rand(i,2)>exp(-DelE/T));
        if mod(i,DisplaySteps) == 0
            axes(handles.axes1);
            imagesc(Conf);axis('square');pause(0.00000001);
        end
        if get(handles.pushbutton2,'UserData')
            set(handles.pushbutton1,'Enable','on');
            set(handles.slider1,'Enable','on');
            set(handles.slider2,'Enable','on');
            set(handles.slider3,'Enable','on');
            set(handles.slider4,'Enable','on');
            set(handles.slider5,'Enable','on');
            break
        end
    end
    
    %% Start Measurement
    m = 1; %Recorded Configuration number
    StoreIndex = zeros(M+1,1);
    StoreMeasurement = zeros(C-EQC,1);
    for i = EQC +1:C
        X = IndexX(i,1);Y = IndexY(i,1);
        DelE = 2*J*Conf(X,Y)*(Conf(mod(X-2,N)+1,Y)+ Conf(mod(X,N)+1,Y) + Conf(X,mod(Y-2,N)+1) + Conf(X,mod(Y-2,N)+1)) -  2*Conf(X,Y)*B;
        Conf(X,Y) = -Conf(X,Y)*(Rand(i,2)<=exp(-DelE/T)) + Conf(X,Y)*(Rand(i,2)>exp(-DelE/T));
        StoreIndex(m,1) = (i-EQC)*(Rand(i,2)<=exp(-DelE/T)) + StoreIndex(m,1)*(Rand(i,2)>exp(-DelE/T));
        StoreMeasurement(i-EQC,1) = sum(sum(Conf));
        m = m + (Rand(i,2)<=exp(-DelE/T))*(m<M+1);
        if mod(i,2*DisplaySteps) == 0
            axes(handles.axes1)
            imagesc(Conf);axis('square');pause(0.00000001);
            axes(handles.axes2);
            Indm = sum(StoreIndex~=0);
            plot((1:Indm)',StoreMeasurement(StoreIndex(1:Indm,1),1)/size(Conf,1)/size(Conf,2));
            set(handles.text15,'string',num2str(mean(StoreMeasurement(StoreIndex(1:Indm,1),1)/size(Conf,1)/size(Conf,2)),3));
            ylim([-1,1]);%xlim([1,M]);
        end
        if get(handles.pushbutton2,'UserData')
            set(handles.pushbutton1,'Enable','on');
            set(handles.slider1,'Enable','on');
            set(handles.slider2,'Enable','on');
            set(handles.slider3,'Enable','on');
            set(handles.slider4,'Enable','on');
            set(handles.slider5,'Enable','on');
            break
        end        
    end
    set(handles.pushbutton1,'Enable','on');
    set(handles.slider1,'Enable','on');
    set(handles.slider2,'Enable','on');
    set(handles.slider3,'Enable','on');
    set(handles.slider4,'Enable','on');
    set(handles.slider5,'Enable','on');
    
%     %% Back Up to M configuration
%     while m < M+1
%         C = ceil((M-m)/EXP + M*EXP*(1-EXP)+EQC);V = m;
%         Rand = rand(C,2);
%         IndexX = floor(ceil(Rand(:,1)*N*N)/N) +1 -((mod(ceil(Rand(:,1)*N*N),N)==0));
%         IndexY = ceil(Rand(:,1)*N*N) - N*(IndexX-1);
%         StoreMeasurement2 = zeros(C,1);
%         for i = 1:C
%             X = IndexX(i,1);Y = IndexY(i,1);
%             DelE = 2*J*Conf(X,Y)*(Conf(mod(X-2,N)+1,Y)+ Conf(mod(X,N)+1,Y) + Conf(X,mod(Y-2,N)+1) + Conf(X,mod(Y-2,N)+1)) -  2*Conf(X,Y)*B;
%             Conf(X,Y) = -Conf(X,Y)*(Rand(i,2)<=exp(-DelE/T)) + Conf(X,Y)*(Rand(i,2)>exp(-DelE/T));
%             StoreIndex(m,1) = (V+i)*(Rand(i,2)<=exp(-DelE/T)) + StoreIndex(m,1)*(Rand(i,2)>exp(-DelE/T));
%             StoreMeasurement2(i,1) = sum(sum(Conf));
%             m = m + (Rand(i,2)<=exp(-DelE/T))*(m<M+1);
%             if mod(i,4*DisplaySteps) == 0
%                 axes(handles.axes1);
%                 imagesc(Conf);axis('square');pause(0.00000001);
%                 axes(handles.axes2);
%                 Indm = sum(StoreIndex~=0);
%                 plot((1:Indm)',StoreMeasurement(StoreIndex(1:Indm,1),1)/size(Conf,1)/size(Conf,2));
%                 set(handles.text15,'string',num2str(mean(StoreMeasurement(StoreIndex(1:Indm,1),1)/size(Conf,1)/size(Conf,2)),3));
%                 xlim([1,M]);ylim([-1,1]);
%             end
%             if get(handles.pushbutton2,'UserData')
%                 set(handles.pushbutton1,'Enable','on');
%                 set(handles.slider1,'Enable','on');
%                 set(handles.slider2,'Enable','on');
%                 set(handles.slider3,'Enable','on');
%                 set(handles.slider4,'Enable','on');
%                 set(handles.slider5,'Enable','on');
%                 break
%             end
%         end
%         if get(handles.pushbutton2,'UserData')
%             set(handles.pushbutton1,'Enable','on');
%             set(handles.slider1,'Enable','on');
%             set(handles.slider2,'Enable','on');
%             set(handles.slider3,'Enable','on');
%             set(handles.slider4,'Enable','on');
%             set(handles.slider5,'Enable','on');
%             break
%         end
%         StoreMeasurement = [StoreMeasurement;StoreMeasurement2];
%     end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton2,'UserData',1)
