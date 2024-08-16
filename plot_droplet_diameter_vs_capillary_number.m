% Capillary Numbers (Ca) for Chip 1
Ca = [0.0017, 0.00341, 0.00511, 0.00682, 0.00852, 0.00938, 0.01023, ...
      0.01108, 0.01193, 0.01364, 0.01535, 0.01705, 0.01876, 0.02046];

% Flow Rate Ratio (Qd/Qc) values
flow_rate_ratio = [0.05, 0.10, 0.15, 0.20, 0.25, 0.30];

% Coefficients from the power law fitting
k = 0.5611;
alpha = 0.08812;
beta = -0.1749;

% Preallocate matrix for droplet diameters
droplet_diameter = zeros(length(flow_rate_ratio), length(Ca));

% Calculate Dimensionless Droplet Diameter for each combination
for i = 1:length(flow_rate_ratio)
    for j = 1:length(Ca)
        droplet_diameter(i, j) = k * flow_rate_ratio(i)^alpha * Ca(j)^beta;
    end
end

% Plot the results
figure;
hold on;
colors = lines(length(flow_rate_ratio));
for i = 1:length(flow_rate_ratio)
    plot(Ca, droplet_diameter(i, :), '*-', 'Color', colors(i,:), 'DisplayName', ['Q = ', num2str(flow_rate_ratio(i))]);
end
hold off;

% Customize plot appearance
xlabel('Capillary Number');
ylabel('Dimensionless Droplet Diameter');
title('Impact of Capillary Number on Droplet Diameter at Different Flow Rate Ratios (Chip 1)');
legend('show');
grid on;
