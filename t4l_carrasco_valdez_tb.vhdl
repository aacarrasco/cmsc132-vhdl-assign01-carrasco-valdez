-- Testbench file

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity or2_tb is
-- testbench entities DO NOT HAVE A PORT
end;

architecture or2_tb of or2_tb is
	-- Declare signals to be used, usually same with the signals to be tested.
	signal a, b, c: std_logic;
	
	-- Declare component to be used, also same with entity declaration
	-- and2 is the unit under test
	component or2 is
		port(a, b: in std_logic; c: out std_logic);
	end component;
	
	begin
		-- uut == unit under test
		--	label: component componentName port map();
		uut: component or2 port map(a, b, c);
		
		-- flow Control can be used here
		process
			-- Dynamic way
			-- declare variables
			-- variable varName: data type := value;
			variable error_count: integer := 0;
			variable inputs: unsigned(1 downto 0);	-- unsigned binary number, 1 downto 0, declare a vector
			variable output: std_logic;
			
			
			begin	-- beginning of process
				inputs := B"00";	-- bitstring, reverse indexing
				for count in 0 to 3 loop	-- from 0 to 3, 4 times
					a <= inputs(1);	-- gets the first element of inputs, inputs[1]
					b <= inputs(0);	-- gets the second element of inputs, inputs[0]
					wait for 10 ns;
					
					output := a or b;	-- generates the actual output
					
					assert(output = c) report "OR design ERR!" severity error;
					if(output /= c) then
						error_count := error_count + 1;
					end if;
					
					inputs := inputs + 1;	-- increment inputs for next loop
					
				end loop;
				report "Done with test. Error " & integer'image(error_count);
				wait;		
						
			end process;
		end architecture;
