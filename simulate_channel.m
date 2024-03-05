function [y] = simulate_channel(x, SNRs_dB, switch_graph)

white_noise_real= randn(length(x),1); % White Gaussian Noise with mean=0 and variance=1
white_noise_imagi= randn(length(x),1); % White Gaussian Noise with mean=0 and variance=1
n= sqrt(1/2)*((1*white_noise_real)+(1i*white_noise_imagi)); % coverting to complex 
mean_signal_amplitude= sqrt(mean(abs(x).^2));
SNR_in_linear_range= 10^(SNRs_dB / 10);
Noise_statndard_deviation= mean_signal_amplitude/SNR_in_linear_range;% noise std equals to (mean signal amplitude)/SNR
y = x + Noise_statndard_deviation * n;  % Noisy signal over the AWGN channel

if switch_graph == 1
    
    figure('name', 'Transmitted Signal and Received Signal')
    subplot(2, 1, 1)
    plot(abs(x),'g')
    title('Transmitted Signal')
    xlabel('Time axis')
    ylabel('Magnitude axis')
    
    
    subplot(2, 1, 2)
    plot(abs(y),'r')
    title('Received Signal with noise ')
    xlabel('Time axis')
    ylabel('Magnitude axis')
    
end

end



