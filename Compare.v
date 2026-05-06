library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
