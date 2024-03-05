function [s_hat] = clip_rx(y, rxthresh, switch_graph)

magnitude_ = abs(y);
angle_ = angle(y);

for j=1:length(magnitude_)
    
    if magnitude_(j)>=rxthresh
        magnitude_(j)=rxthresh; %values equal or greater than rxthresh is set to rxthresh
    else
        magnitude_(j)= magnitude_(j); %values less than rxthresh remains unchanged
    end
end

[a, b] = pol2cart(angle_, magnitude_); % calculating real part and imaginary part
s_hat = a + b * 1i; % Polar to cartesian transformation


if switch_graph == 1
    
    figure('name','Rx Hardware result')
    subplot(2,1,1)
    plot(abs(y),'r')
    title('Rx Hardware input ')
    xlabel('Time axis')
    ylabel('Magnitude axis')
    grid on
    
    subplot(2,1,2)
    plot(abs(s_hat),'m')
    grid on
    title('Rx Hardware output')
    xlabel('Time axis')
    ylabel('Magnitude axis')
    
end

end