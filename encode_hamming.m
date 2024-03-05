function [c] = encode_hamming(b, parity_check_matrix, switch_cc_off)

%parity_check_matrix = [1 1 1 0 1 0 0; 1 1 0 1 0 1 0; 1 0 1 1 0 0 1]; % considered parity check matrix for (7,4) hamming code

generator_matrix = [eye(4),(parity_check_matrix(1:3,1:4))']; % Generator matrix(4*7)is constructed from parity check matrix (3*7)

if switch_cc_off == 1
    
    c = b; %channel coding is not in use
    
else   %channel coding is in use
    c = zeros((length(b)*7)/4,1);
    j=1;
    
    for i = 1 : 4 : length(b)
        b_temporary=b(i:i+3);
        codeword_temporary_without_normalization = b_temporary' * generator_matrix; % codewords are generated from binary signals and generator matrix
        codeword_temporary=mod(codeword_temporary_without_normalization,2); % Codewords are normalized so that only 1's and 0's remain
        c(j:j+6)= (codeword_temporary(1:7))'; % generating a column vector from codewords 
        j=j+7;
        
    end
    
end

end