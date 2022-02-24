
function small_signal(beta,Rc,Rb1,Rb2,Re,Vcc,VCE,Ic,A,f)
gm=40*Ic;
rbe=beta./gm;
Av=(-Rc)./Re;
Rb=(Rb1*Rb2)./(Rb1+Rb2);
Ai=beta;
Ri=Rb.*(rbe+(beta+1)*Re)./(Rb+rbe+(beta+1)*Re);

T=1/f;
t=0:T/100:5*T;
vi=A*sin(2*pi*f*t);



v0=vi*Av;
cc=uibuttongroup('Visible','on',...
'BackgroundColor','g',...
'ForegroundColor','black',...
'Title','Small Signal',...
'FontSize',10,...
'TitlePosition','centertop',...
'Tag','radiobutton',...
'Position',[0.5 0.5 0.49 0.49]);

uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.1 0.9 0.1 0.06], ...
    'String','gm=','Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.2 0.9 0.1 0.06], ...
    'String',gm,'Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.4 0.9 0.1 0.06], ...
    'String','rbe=','Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.5 0.9 0.1 0.06], ...
    'String',rbe,'Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.7 0.89 0.15 0.08], ...
    'String','Amplificarea in tensiuine este: ','Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.85 0.89 0.1 0.08], ...
    'String',Av,'Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.08 0.6 0.15 0.08], ...
    'String','Amplificarea in curent este: ','Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.23 0.6 0.1 0.08], ...
    'String',Ai,'Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.4 0.6 0.1 0.06], ...
    'String','vi: ','Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.5 0.6 0.1 0.06], ...
    'String',max(vi),'Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.7 0.6 0.1 0.06], ...
    'String','v0: ','Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.8 0.6 0.1 0.06], ...
    'String',min(v0),'Parent',cc);


uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.4 0.3 0.1 0.06], ...
    'String','Rin=','Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.5 0.3 0.1 0.06], ...
    'String',Ri,'Parent',cc);


uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.7 0.3 0.1 0.06], ...
    'String','Rout=','Parent',cc);
uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.8 0.3 0.1 0.06], ...
    'String',Rc,'Parent',cc);

uicontrol('Style','text', ...
    'Units','normalized', ...
    'backgroundcolor',[1 1 1],...
    'Position',[0.1 0.12 0.5 0.1], ...
    'String','Unitati de masura pentru tensiuni(Volt),pentru curenti(Amper), pentru rezistente (Ohm)','Parent',cc);


%if(Vcc/(Rc+Re)>=Ic+(vi/Ri)*Ai)&(0<=Ic-(vi/Ri)*Ai)
    if((VCE+max(v0)<=Vcc)&&(VCE-max(v0)>=0))
        subplot('Position',[0.57,0.05,0.4,0.4]);
        grid on;
        hold on;
        plot(t,v0,t,v0+VCE,t,vi);
       
        title("Tensiunea de la iesirea circuitului");
        xlabel('t(seconds)');
        ylabel('Vout(Volts)');
        legend('v0','Vout','vi');
        msgbox("Se respecta punctul static de functionare, urmeaza sa analizam modelul de semnal mic"); 
        msgbox("Semnalul de la iesirea circuitului se afla in regiunea de functionare");
       
    else 
        subplot('Position',[0.57,0.05,0.4,0.4]);
     
        
        for i=1:length(t)
           y(i)=VCE+v0(i);
           
           if y(i)>Vcc
               y(i)=Vcc;
           end
           
           
           if y(i)<0
               y(i)=0;
           end
            
            
        end
        plot(t,v0,t,y,t,vi);
           grid on;
        hold on;
       

        
        title("Tensiunea de la iesirea circuitului");
        xlabel('t(seconds)');
        ylabel('Vout(Volts)');
        legend('v0','Vout','vi');

        msgbox("Se respecta punctul static de functionare, urmeaza sa analizam modelul de semnal mic");
        msgbox("Semnalul de la iesirea circuitului este distorsionat");
        
    end



