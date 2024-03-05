function [s] = filter_tx(d, usf_filter, switch_graph)

d_upsampled = upsample(d,usf_filter); % Upsampling by usf_filter factor

t = linspace(-3.2, 3.2,25);
tx_filter = sinc(t); % designing sinc filter

tx_filter_output = conv(d_upsampled, tx_filter); %convolution will generate a matrix which has(length(d_upsampled)+length(tx_filter)-1)rows and 1 column

normalization_value = sqrt(max(abs(tx_filter_output).^2));
s = tx_filter_output / normalization_value ; % Filter output signal power is normalized to 1

if switch_graph == 1
    
    figure('Name', 'Transmitter(low pass) Filter Output')
    
    subplot(3,1,1)
    plot(real(tx_filter_output))
    grid on
    title('Tx Filter Output without normalization')
    xlabel('Time axis')
    ylabel('Amplitude axis')
    legend ('Real')
   
    
    subplot(3,1,2)
    plot(real(s),'r')
    grid on
    title('Tx Filter Output after normalization')
    xlabel('Time axis')
    ylabel('Amplitude axis')
    legend ('Real')
    
    subplot(3,1,3)
    plot(imag(s),'m')
    grid on
    xlabel('Time axis')
    ylabel('Amplitude axis')
    legend ('Imaginary')
    %fvtool(tx_filter_output,"impulse")
    
end

end