function [d_hat] = filter_rx(s_hat, dsf_filter, switch_graph)

t = linspace(-3.2, 3.2, 25);
rx_filter = sinc(t);    % Lowpass filter

rx_filter_output = conv(s_hat, rx_filter); %convolution will generate a matrix which has(length(s_hat)+length(rx_filter)-1)rows and 1 column

samples= rx_filter_output (length(rx_filter):1:end-length(rx_filter)-1);

d_hat_filtered = downsample(samples,dsf_filter); % Downsampling by dsf_filter factor

normalization_value = sqrt(mean(abs(d_hat_filtered).^2));
d_hat = d_hat_filtered / normalization_value;  % Signal power is normalized to 1

if switch_graph == 1
    
    eyediagram(d_hat, 2)
    
    figure('Name', 'Receiver Filter(Low pass) Output')
    
    subplot(3,1,1)
    plot(real(d_hat_filtered))
    grid on
    title('Rx Filter Output without normalization')
    xlabel('Time axis')
    ylabel('Amplitude axis')
    legend ('Real')
    
    subplot(3,1,2)
    plot(real(d_hat),'m')
    grid on
    title('Rx Filter output after normalization')
    xlabel('Time axis')
    ylabel('Amplitude axis')
    legend ('Real')
    
    
    subplot(3,1,3)
    plot(imag(d_hat),'g')
    grid on
    xlabel('Time')
    ylabel('Amplitude axis')
    legend ('Imaginary axis')
    
end

end