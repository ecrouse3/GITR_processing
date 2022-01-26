close all
d = dlmread('assets/vvfile')';

% order indices
indices = [1:5,7,6,8:110,112:117]
r = d(1,indices);
z = d(2,indices);
r1 = r(1:end-1);
r2 = r(2:end);
z1 = z(1:end-1);
z2 = z(2:end);

figure(1)
title({'DIII-D SAS-VW Cross-Sectional','Geometry'})
xlabel('r [m]')
ylabel('z [m]')
set(gca,'fontsize',16)
axis equal
plot(r,z)
hold on
scatter(r,z)
a = [1:length(r)]'; b = num2str(a); c = cellstr(b);
dx = 0.01; dy = 0.01; % displacement so the text does not overlay the data points
text(r+dx, z+dy, c);

% define "In-Direction"

%%
% fileID = fopen('WESTgeom.txt','w');
% for i=1:length(r)
% fprintf(fileID,'[ %2.6f , %2.6f ], \n',[r(i) z(i)]);
% end
% fclose(fileID);
% 
% tileMinX = 0.025;
% tileMaxX = 0.03;
% tilePreferred = 0.028;
% gapSize = 0.0005;
% tileSegments = [7:24, 74:91,103:109];
% fileID = fopen('iterTileSpecs.txt','w');
% fprintf(fileID,'nTileSegments = %i;  \n',length(tileSegments));
% fprintf(fileID,'indices = [');
% fprintf(fileID,'%i, ',tileSegments);
% fprintf(fileID,']; \n');
% fprintf(fileID,'gapSize = %f ; \n',gapSize);
% tileNs = [];
% tileRs = [];
% degrees = [];
% 
% for i= tileSegments
%     l_segment = sqrt((r(i+1)-r(i))^2 + (z(i+1)-z(i))^2);
%     maxTiles = floor(l_segment/(tileMinX+gapSize));
%     minTiles = ceil(l_segment/(tileMaxX+gapSize));
%     tileSizeMin = (l_segment-gapSize)/maxTiles - gapSize;
%     tileSizeMax = (l_segment-gapSize)/minTiles - gapSize;
%     if(abs(tilePreferred-tileSizeMin) < abs(tilePreferred-tileSizeMax))
%         tileN = maxTiles;
%         tileR = tileSizeMin;
%     else
%         tileN = minTiles;
%         tileR = tileSizeMax;
%     end
%     tileNs = [tileNs, tileN];
%     tileRs = [tileRs, tileR];
%     u = [r(i+1)-r(i) , 0, z(i+1)-z(i)];
%     v = [1, 0, 0];
%     Theta = acos(dot(u,v)/(norm(u)*norm(v)));
%     ThetaInDegrees = atan2d(norm(cross(u,v)),dot(u,v));
%     %ThetaInDegrees = ThetaInDegrees*sign(dot(-v,cross(u,v)));
%     degrees = [degrees, ThetaInDegrees]; 
% end
% fprintf(fileID,'tileNs = [');
% fprintf(fileID,'%i, ',tileNs);
% fprintf(fileID,']; \n');
% fprintf(fileID,'tileRs = [');
% fprintf(fileID,'%f, ',tileRs);
% fprintf(fileID,']; \n');
% fprintf(fileID,'degrees = [');
% fprintf(fileID,'%f, ',degrees);
% fprintf(fileID,']; \n');
% fprintf(fileID,'pointPairs =[ ');
% for i=1:length(tileSegments)
% fprintf(fileID,'[[ %2.6f , %2.6f ], [ %2.6f , %2.6f] ], \n',[r(tileSegments(i)) z(tileSegments(i)) r(tileSegments(i)+1) z(tileSegments(i)+1)]);
% end
% A = z(tileSegments+1) - z(tileSegments);
% B = r(tileSegments) - r(tileSegments+1);
% parUnit = [-B' A'];
% normFac = sqrt(A.^2+B.^2)';
% parUnit = parUnit./normFac
% perpUnit = [A' B'];
% perpUnit = -perpUnit./normFac
% 
% fprintf(fileID,'parUnit =[ ');
% for i=1:length(tileSegments)
% fprintf(fileID,'[ %2.6f , %2.6f ], \n',[parUnit(i,1) parUnit(i,2)]);
% end
% 
% fprintf(fileID,'perpUnit =[ ');
% for i=1:length(tileSegments)
% fprintf(fileID,'[ %2.6f , %2.6f ], \n',[perpUnit(i,1) perpUnit(i,2)]);
% end
% fclose(fileID);