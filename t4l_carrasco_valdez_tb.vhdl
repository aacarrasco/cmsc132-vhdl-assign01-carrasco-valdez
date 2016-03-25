-- ProgAss1
-- Carrasco, Angelica Grace A.	2013-47726
-- Valdez, Jessica Ria B.		2013-51016

-- TestBench for Boggis, Bunce and Beans Farm Storage Problem.

-- Import packages.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Testbench entity.
entity buzzer_tb is
	
end;


architecture buzz_tb of buzzer_tb is
	-- Declare signals to be used.
	signal a, b, c, d, e, f, x: std_logic;
	
	-- Declare component to be used, entity to be tested.
	component buzzer is
		port(x: out std_logic;
			a, b, c, d, e, f: std_logic);
	end component;
	
	begin
		uut: component buzzer port map(x, a, b, c, d, e, f);
		
		process	
			variable error_count: integer := 0;
			variable inputs: unsigned(5 downto 0);	-- array of unsigned binary number.
			variable output: std_logic;
			
			begin
				inputs := B"000000";
				for count in 0 to 63 loop	-- Loop for 64 times, to add values to truthtable.
					
					a <= inputs(5);
					b <= inputs(4);
					c <= inputs(3);
					d <= inputs(2);
					e <= inputs(1);
					f <= inputs(0);
					
					wait for 10 ns;	-- Wait for 10 nanoseconds.
					
					-- Output will be equal to 1 if and only if there is atleast 1 IN_BUZZER and 1 OUT_BUZZER that is ON (equal to 1) regardless of which storage they belong.
					-- Otherwise, output will be equal to 0.
					if((a='1' or c='1' or e='1') and (b='1' or d='1' or f='1')) then
						output := '1';
					else
						output := '0';
					end if;
					
					-- Check if output is equal to x. Increment error_count otherwise.
					assert(output = x) report "Buzzer design ERR!" severity error;
					if(output /= x) then
						error_count := error_count + 1;
					end if;
					
					-- Increment inputs for next loop.
					inputs := inputs + 1;
					
				end loop;
				report "Done with test. Error " & integer'image(error_count);
				wait;		
						
			end process;
		end architecture;
