clc;
clear;
close all;

%% SETTINGS
threshold = 1000;
attackCount = 0;
normalCount = 0;

%% CREATE DASHBOARD
figure('Name','DDoS Attack Detection Dashboard',...
       'NumberTitle','off',...
       'Position',[100 100 1000 600]);

h = animatedline('Color','b','LineWidth',2);

xlabel('Time');
ylabel('Packets/sec');
title('Real-Time Network Traffic Monitoring');

grid on;
hold on;

yline(threshold,'r--','Attack Threshold');

xlim([0 50]);
ylim([0 3000]);

%% STATUS BOXES
statusBox = annotation('textbox',...
    [0.75 0.75 0.2 0.08],...
    'String','STATUS: NORMAL',...
    'FitBoxToText','on',...
    'FontSize',12,...
    'FontWeight','bold');

severityBox = annotation('textbox',...
    [0.75 0.65 0.2 0.08],...
    'String','SEVERITY: NONE',...
    'FitBoxToText','on',...
    'FontSize',12,...
    'FontWeight','bold');

healthBox = annotation('textbox',...
    [0.75 0.55 0.2 0.08],...
    'String','NETWORK HEALTH: 100%',...
    'FitBoxToText','on',...
    'FontSize',12,...
    'FontWeight','bold');

fprintf('\n');
fprintf('=====================================\n');
fprintf(' DDoS ATTACK DETECTION SYSTEM STARTED\n');
fprintf('=====================================\n\n');

%% SIMULATION LOOP
for t = 1:50

    % Normal Traffic
    traffic = randi([200 700]);

    % Simulated Attack
    if t >= 25 && t <= 35
        traffic = randi([1500 2500]);
    end

    % Random Source IP
    ip = randi([1 255]);

    % Plot Traffic
    addpoints(h,t,traffic);
    drawnow;

    % Calculate Health
    health = max(0,100-round(traffic/30));

    % Detection Logic
    if traffic > threshold

        attackCount = attackCount + 1;

        set(statusBox,...
            'String','STATUS: ATTACK DETECTED');

        % Severity Levels
        if traffic > 2000
            severity = 'HIGH';
        elseif traffic > 1500
            severity = 'MEDIUM';
        else
            severity = 'LOW';
        end

        set(severityBox,...
            'String',['SEVERITY: ' severity]);

        fprintf('[ALERT] Time %d\n',t);
        fprintf('Traffic : %d Packets/sec\n',traffic);
        fprintf('Source IP : 192.168.1.%d\n',ip);
        fprintf('Severity : %s\n\n',severity);

    else

        normalCount = normalCount + 1;

        set(statusBox,...
            'String','STATUS: NORMAL');

        set(severityBox,...
            'String','SEVERITY: NONE');

        fprintf('[INFO] Time %d\n',t);
        fprintf('Traffic : %d Packets/sec\n',traffic);
        fprintf('Source IP : 192.168.1.%d\n\n',ip);

    end

    set(healthBox,...
        'String',['NETWORK HEALTH: ' ...
        num2str(health) '%']);

    pause(0.3);

end

%% FINAL REPORT
fprintf('\n');
fprintf('========================\n');
fprintf(' FINAL REPORT\n');
fprintf('========================\n');
fprintf('Normal Events : %d\n',normalCount);
fprintf('Attack Events : %d\n',attackCount);

%% PIE CHART
figure('Name','Traffic Distribution');

pie([normalCount attackCount],...
{'Normal Traffic','Attack Traffic'});

title('Traffic Distribution');

%% BAR CHART
figure('Name','Detection Summary');

bar([normalCount attackCount]);

set(gca,...
'XTickLabel',...
{'Normal','Attack'});

ylabel('Count');
title('Event Summary');
grid on;

%% MESSAGE BOX
if attackCount > 0
    msgbox('DDoS Attack Successfully Detected!',...
           'Detection Result');
else
    msgbox('No Attack Detected',...
           'Detection Result');
end
