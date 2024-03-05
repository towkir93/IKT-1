function [b_hat] = decode_hamming(c_hat, parity_check_matrix, switch_cc_off, switch_graph)

if switch_cc_off == 1
    b_hat = c_hat; %channel coding is not in use
        
else     %channel coding is in use
    
    b_hat = zeros(length(c_hat) * 4 / 7, 1);
    
    error = 0;
    k =1;
    
    for i = 1 : 7 : length(c_hat)
        
        store_temporary = c_hat(i : i + 6);  % 7 bits codewords are stored in store_temporary
        syndrome = mod(parity_check_matrix * store_temporary, 2);    % Syndrome calculation by modulo 2
        
        if sum(syndrome) > 0    % if error exits
            
            for j = 1 : 7
                
                if(parity_check_matrix(1:3, j) == syndrome) % Checking if the column of parity_check_matrix is same as syndrome
                    
                    store_temporary(j) = not(store_temporary(j)); % Erroneous bit is changed
                    
                    if switch_graph == 1 && error == 0
                        
                        figure('Name','Ideal Hamming Decoding')
                        subplot(2,1,1)
                        stem(store_temporary)
                        title('Codeword after correction')
                        xlabel('Index')
                        ylabel('Value')
                        hold on
                        subplot(2,1,2);
                        stem(c_hat(i : i + 6))
                        title('Received Codeword')
                        xlabel('Index')
                        ylabel('Value')
                        error = 1; % No more plotting for next error                        
                        
                    end
                    
                    break
                    
                end
                
            end
            
        end

        b_hat(k : k + 3) = store_temporary(1 : 4); % Decoding is done
        k=k+4;
        
    end
    

    
end

end
