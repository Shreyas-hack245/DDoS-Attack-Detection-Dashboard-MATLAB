# DDoS Attack Detection Dashboard (v3)

## Description

This project is a MATLAB-based simulation for detecting DDoS (Distributed Denial of Service) attacks. It monitors network traffic in real time and identifies abnormal traffic spikes that may indicate an attack, using both a rule-based threshold detector and a from-scratch machine learning anomaly detector. It also simulates multi-source (botnet) attacks and visualizes their simulated geographic origin.

## Features

- Real-time traffic monitoring
- DDoS attack detection (rule-based + ML-based)
- ML-based anomaly detection using a from-scratch "mini Isolation Forest"
- Rule-based vs ML detector comparison (accuracy, precision, recall)
- Multi-source / botnet attack simulation (3–6 simultaneous attacker IPs)
- Adaptive threshold detection
- IP blacklisting with per-IP offense tracking
- Top Offending IPs chart
- Simulated Geo-IP heat map (bubble map by region)
- Region attack-origin bar chart
- Audible alert
- Protocol simulation
- Session timer
- Attack severity classification
- Network health monitoring
- Traffic distribution analysis
- CSV logging
- Detection summary / accuracy report
- Final .txt export

## Technologies Used

- MATLAB (no additional toolboxes required)

## How It Works

1. Simulates network traffic, including normal and attack conditions.
2. Simulates multi-source botnet attacks, splitting traffic load across 3–6 attacker IPs per attack window.
3. Monitors packet rates continuously against an adaptive threshold.
4. Runs a rule-based detector alongside a from-scratch ML anomaly detector (lightweight isolation-forest-style scoring) in parallel.
5. Classifies traffic as Normal or Attack for both detectors.
6. Maps each simulated attacker IP to one of 6 illustrative regions (N. America, S. America, Europe, Africa, Asia, Oceania).
7. Auto-blacklists offending IPs based on accumulated offenses.
8. Displays results using live graphs, status boxes, and alerts.

## Output

- Live traffic graph
- Attack detection alerts
- ML ANOMALY and ACTIVE BOTS live status boxes
- Live Geo-IP heat map (bubble map: size = offenses, color = traffic volume)
- Top Offending IPs chart
- Pie chart of traffic distribution
- Attack Origin by Region (bar chart)
- Rule-Based vs ML Detector Performance (grouped bar chart)
- Bar chart summary
- `traffic_log.csv` (includes Region, MLAnomalyScore, and ActiveBots columns)
- `final_report.txt` (includes both detectors' accuracy/precision/recall and region-by-region offense breakdown)

## Notes

- The isolation forest is implemented entirely in plain MATLAB (`randperm`, recursion, basic math) — no ML/Statistics toolbox required.
- The Geo-IP regions and coordinates are illustrative placeholders for demonstration purposes, not a real geolocation lookup.

## Files

- `ddos_dashboard_v3.m` — main script (run this in MATLAB)
- `traffic_log.csv` — generated at runtime
- `final_report.txt` — generated at runtime

## How to Run

1. Open MATLAB.
2. Place `ddos_dashboard_v3.m` in your working directory.
3. Run the script:
   ```matlab
   ddos_dashboard_v3
   ```
4. The dashboard will launch and begin simulating traffic. `traffic_log.csv` and `final_report.txt` will be generated automatically at runtime.

## Conclusion

This project demonstrates an extended approach to detecting DDoS attacks in MATLAB, combining rule-based and machine-learning detection methods with simulated botnet traffic and geographic visualization for a more realistic and comprehensive simulation.
