function [x] = clip_tx(s, txthresh, switch_graph)

magnitude_ = abs(s);
angle_ = angle(s);

for j=1:length(magnitude_)
    
    if magnitude_(j)>=txthresh
        magnitude_(j)=txthresh; %values equal or greater than txthresh is set to txthresh
    else
        magnitude_(j)= magnitude_(j); %values less than txthresh remains unchanged
    end
end
  
[a, b] = pol2cart(angle_,magnitude_);% calculating real part and imaginary part
x = a + b * 1i; %  Transformation from polar to cartesian

if switch_graph == 1
    
    figure('name','Tx Hardware result')
    subplot(2, 1, 1)
    plot(abs(s),'m')
    title('Tx Hardware input')
    xlabel('Time axis')
    ylabel('Magnitude')
    grid on
    subplot(2, 1, 2)
    plot(abs(x),'b')
    grid on
    title('Tx Hardware output')
    xlabel('Time axis')
    ylabel('Magnitude')
    
end

end