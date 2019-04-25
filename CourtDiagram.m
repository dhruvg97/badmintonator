
%Right doubles side line
SLDoublesX = linspace(6.7,-6.7); %Doubles side line length in x
RightSLDoublesZ = linspace(3.05,3.05); %Doubles side line length in z 
onTheFloor = zeros(1,100); %no height to the court
plot3(SLDoublesX,RightSLDoublesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)
hold on

%left doubles sideline
LeftSLDoublesZ = linspace(-3.05,-3.05);
plot3(SLDoublesX,LeftSLDoublesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%back long singles service line
ServeSinglesZ = linspace(3.05,-3.05);
BLServeSinglesX = linspace(-6.7,-6.7);
plot3(BLServeSinglesX,ServeSinglesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%front long singles service line
FLServeSinglesX = linspace(6.7,6.7);
plot3(FLServeSinglesX,ServeSinglesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%back long doubles service line
BLServeDoublesX = linspace(-5.92,-5.92);
plot3(BLServeDoublesX,ServeSinglesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%front long doubles service line
FLServeDoublesX = linspace(5.92,5.92);
plot3(FLServeDoublesX,ServeSinglesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%back short service line
BSServeLineX = linspace (-2.00,-2.00);
plot3(BSServeLineX,ServeSinglesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%front short service line
FSServeLineX = linspace (2.00,2.00);
plot3(FSServeLineX,ServeSinglesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%net line 
NetFloorLine = linspace (0,0);
plot3(NetFloorLine,ServeSinglesZ,onTheFloor,'--','Color',[0.8 0.5 0.2],'LineWidth',0.5)

%%left singles sideline
LeftSLSinglesZ = linspace(-2.57,-2.57);
plot3(SLDoublesX,LeftSLSinglesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%%right singles sideline
RightSLSinglesZ = linspace(2.57,2.57);
plot3(SLDoublesX,RightSLSinglesZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%back centre line
BCentreLineX = linspace(-2.00,-6.70);
CentreLineZ = linspace (0,0);
plot3(BCentreLineX,CentreLineZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)

%front centre line
FCentreLineX = linspace(2.00,6.70);
plot3(FCentreLineX,CentreLineZ,onTheFloor,'Color',[0.8 0.5 0.2],'LineWidth',0.5)


%% Net Dimensions

%Left Post 
PostX = linspace (0,0);
LeftPostZ = linspace(-3.05,-3.05);
PostY = linspace(0,1.55);
plot3(PostX,LeftPostZ,PostY,'k','LineWidth',0.04)

%Right Post
RightPostZ = linspace(3.05,3.05);
plot3(PostX,RightPostZ,PostY,'k','LineWidth',0.04)

%top line of the net modelled as an exponential curve
NetTopX =linspace (0,0);
NetZ = ServeSinglesZ;
NetY = 1.524 + 0.002794947*(NetZ).^2;
plot3(NetTopX,NetZ,NetY,'k','LineWidth',0.02)

% lower top line of net
LTNetY = 1.474 + 0.002794947*(NetZ).^2;
plot3(NetTopX,NetZ,LTNetY,'k','LineWidth',0.02)

% bottom of net
BNetY = 0.974 + 0.002794947*(NetZ).^2;
plot3(NetTopX,NetZ,BNetY,'k','LineWidth',0.02)


