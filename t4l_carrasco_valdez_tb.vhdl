-- ProgAss1
-- Carrasco, Angelica Grace A.	2013-47726
-- Valdez, Jessica Ria B.		2013-51016

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buzzer_tb is
	
end;

architecture buzz_tb of buzzer_tb is
	signal a, b, c, d, e, f, x: std_logic;
	
	component buzzer is
		port(x: out std_logic;
			a, b, c, d, e, f: std_logic);
	end component;
	
	begin
		uut: component buzzer port map(x, a, b, c, d, e, f);
		
		
		process
			
			
			variable error_count: integer := 0;
			variable inputs: unsigned(5 downto 0);	
			variable output: std_logic;
			
			
			begin
				inputs := B"000000";
				for count in 0 to 63 loop
					
					a <= inputs(5);
					b <= inputs(4);
					c <= inputs(3);
					d <= inputs(2);
					e <= inputs(1);
					f <= inputs(0);
					
					wait for 10 ns;
					
					
					if((a='1' or c='1' or e='1') and (b='1' or d='1' or f='1')) then
						output := '1';
					else
						output := '0';
					end if;
					
					assert(output = x) report "Buzzer design ERR!" severity error;
					if(output /= x) then
						error_count := error_count + 1;
					end if;
					
					inputs := inputs + 1;
					
				end loop;
				report "Done with test. Error " & integer'image(error_count);
				wait;		
						
			end process;
		end architecture;
