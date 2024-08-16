% Flow Rate Ratio (Qd/Qc) values
flow_rate_ratio = [0.05 0.10 0.15 0.20 0.25 0.30];

% Capillary Numbers (Ca) for Chip 1
Ca = [0.0017, 0.00341, 0.00511, 0.00682, 0.00852, 0.00938, 0.01023, ...
      0.01108, 0.01193, 0.01364, 0.01535, 0.01705, 0.01876, 0.02046];

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
colors = lines(length(Ca));
for j = 1:length(Ca)
    plot(flow_rate_ratio, droplet_diameter(:, j), '*-', 'Color', colors(j,:), 'DisplayName', ['Ca = ', num2str(Ca(j))]);
end
hold off;

% Customize plot appearance
xlabel('Flow Rate Ratio');
ylabel('Dimensionless Droplet Diameter');
title('Impact of Flow Rate Ratio on Droplet Diameter at Different Capillary Numbers (Chip 1)');
legend('show');
grid on;
