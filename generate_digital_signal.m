function [b] = generate_digital_signal(n_bits)

b = randi([0,1],n_bits,1);  % Generating a column vector which has (n_ bits) rows containing only 1's and 0's;

end