library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.all;
use ieee.std_logic_unsigned.all;
--senha 012345
entity forca is
	port (
        SW: in std_logic_vector(9 downto 0) := "0000000000";
        LEDG: out std_logic_vector(2 downto 0);
        HEX0: out std_logic_vector(6 downto 0);
		HEX2: out std_logic_vector(6 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
		HEX4: out std_logic_vector(6 downto 0);
		HEX5: out std_logic_vector(6 downto 0);
		HEX6: out std_logic_vector(6 downto 0);
		HEX7: out std_logic_vector(6 downto 0)
	);
end forca;

architecture behav of forca is
	--    P "0001100"
	--    G "1000010"
	signal auxLed: std_logic_vector(2 downto 0) := "111";
	signal aux0: std_logic_vector(6 downto 0) := "1111111";
	signal aux2: std_logic_vector(6 downto 0) := "1110111";
	signal aux3: std_logic_vector(6 downto 0) := "1110111";
	signal aux4: std_logic_vector(6 downto 0) := "1110111";
	signal aux5: std_logic_vector(6 downto 0) := "1110111";
	signal aux6: std_logic_vector(6 downto 0) := "1110111";
	signal aux7: std_logic_vector(6 downto 0) := "1110111";
	
begin
    LEDG <= auxLed;
    
    HEX0 <= aux0;
    
    HEX2 <= aux2;
    HEX3 <= aux3;
    HEX4 <= aux4;
    HEX5 <= aux5;
    HEX6 <= aux6;
    HEX7 <= aux7;
    
    --BEGIN SETTAR SAIDA
	aux0 <= "1000010" when aux2 /= "1110111" and aux3 /= "1110111" and 
                aux4 /= "1110111" and aux5 /= "1110111" and 
                aux6 /= "1110111" and aux7 /= "1110111" else
			"0001100" when auxLed = "000" else 
			"1111111";
    --END SETTAR SAIDA
    
    process(SW)
    begin
        if SW = "0000000000" then
            auxLed <= "111";
            aux2 <= "1110111";
            aux3 <= "1110111";
            aux4 <= "1110111";
            aux5 <= "1110111";
            aux6 <= "1110111";
            aux7 <= "1110111";
        else
            if SW(0) = '1' then
                aux7 <= "1000000";
            end if;
            if SW(1) = '1' then
                aux6 <= "1111001";
            end if;
            if SW(2) = '1' then
                aux5 <= "0100100";
            end if;
            if SW(3) = '1' then
                aux4<= "0110000";
            end if;
            if SW(4) = '1' then
                aux3 <= "0011001";
            end if;
            if SW(5) = '1' then
                aux2 <= "0010010";
            end if;
            if (SW(6) = '1' and SW(7) = '1' and SW(8) = '1') or  (SW(6) = '1' and SW(8) = '1' and SW(9) = '1') or (SW(6) = '1' and SW(7) = '1' and SW(9) = '1') or (SW(7) = '1' and SW(8) = '1' and SW(9) = '1') then
                auxLed <= "000";
            elsif (SW(6) = '1' and SW(7) = '1') or (SW(6) = '1' and SW(8) = '1') or (SW(6) = '1' and SW(9) = '1') or (SW(7) = '1' and SW(8) = '1') or (SW(7) = '1' and SW(9) = '1') or (SW(8) = '1' and SW(9) = '1') then
                auxLed <= "001";
            elsif SW(6) = '1' or SW(7) = '1' or SW(8) = '1' or SW(9) = '1' then
                auxLed <= "011";
            end if;
        end if;
    end process;
end behav;