%% Intensity
[num,txt,raw]=xlsread('0531 exp gloriosa power');
wl = num(:,16);
RL06= num(:,17);   % Gloriosa green 0.6 mJ - all 0 degree
RL096 = num(:,19);   % 0.96 mJ
RL15 = num(:,21);   % 1.5 mJ
RL03 = num(:,23);   % 0.3 mJ
RL015 = num(:,25);   % 0.15 mJ
RL192 = num(:,27);   % 1.92 mJ
RL24 = num(:,29);   % 2.4 mJ 50%
RL30 = num(:,31);   % 3 mJ 50%
RL19250 = num(:,33);   % 1.92 mJ 50%

mul = max(RL192)/max(RL19250);

% Normalized
figure()
plot(wl,RL015./max(RL015),wl,RL03./max(RL03),wl,RL06./max(RL06),wl,RL096./max(RL096),wl,RL15./max(RL15),wl,RL192./max(RL192))
xlabel('Wavelength (nm)', 'FontName', 'Times New Roman','FontSize',18)
ylabel('Normalized intensity (arb. unit)', 'FontName', 'Times New Roman','FontSize',18)
axis([531 610 0 1])
lgnd = legend('0.15 mJ','0.3 mJ', '0.6 mJ', '0.96 mJ', '1.5 mJ', '1.92 mJ', '2.4 mJ', '3 mJ');
set(lgnd,'FontName','Times New Roman','FontSize',13);
set(gca,'FontSize',18)

%% Max / FWHM
maxvalue = [max(RL015) max(RL03) max(RL06) max(RL096) max(RL15) max(RL192) max(RL24*mul) max(RL30*mul)];
energy = [0.15 0.3 0.6 0.96 1.5 1.92 2.4 3];
FWHM = [574.8-561.8, 572.9-567.2, 572.6-568.8, 572.7 - 569.6, 572.8-569.6, ...
     573 - 569.6,  573.4-569.8, 573.7-569.8 ];
energy = energy(1:6);
maxvalue = maxvalue(1:6);
FWHM = FWHM(1:6);
 
figure()
plot(energy, maxvalue,'k--o','MarkerFaceColor','k')
xlabel('Energy per pulse (mJ)', 'FontName', 'Times New Roman','FontSize',18)
ylabel('Max. intensity (arb. unit)', 'FontName', 'Times New Roman','FontSize',18)
axis([0 2 0 80000])
% hold on
yyaxis right
plot(energy, FWHM,'--s','MarkerFaceColor','b')
xlabel('Energy per pulse (mJ)', 'FontName', 'Times New Roman','FontSize',18)
ylabel('FWHM (nm)', 'FontName', 'Times New Roman','FontSize',18)
axis([0 2 3 14.3])
lgnd = legend('Max intensity', 'FWHM');
set(lgnd,'FontName','Times New Roman','FontSize',13);
set(gca,'FontSize',18)














 




