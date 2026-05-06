library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
// Comparing if B is a negative number
//if((i-k)>=0&&(i-k)<sizeB){
//sum=sum+A_array[k]*B_array[i-k];

//}
//}
//C_array[i]=sum;
//}

// input/output declaration
module Compare (
B_i // B index
k 
);
entity Compare is
    Port (
        CODE_W : in  STD_LOGIC_VECTOR(3 downto 0);
    );
end Compare;


architecture Behavioral of Compare is
signal synd_int : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- compare
    synd_int <= CODE_W xor CODE_G;
    SYND <= synd_int;
    -- detects error/ if ERR = 1, error detected
    ERR <= synd_int(0) or synd_int(1) or synd_int(2) or synd_int(3);

end Behavioral;
