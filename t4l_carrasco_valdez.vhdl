-- ProgAss1
-- Carrasco, Angelica Grace A.	2013-47726
-- Valdez, Jessica Ria B.		2013-51016

library IEEE; use IEEE.std_logic_1164.all;

entity buzzer is
	port(	x: out std_logic;
			a, b, c, d, e, f: std_logic);
end entity;

architecture buzz of buzzer is
	begin
	-- x = a'cd'f + ade' + ad'f + a'bc + a'cd + d'ef + ab + be + de	 (gray code)
	-- x <= a'bd'e + a'cd'f + a'bc + a'cd + ad'f + d'ef + ab + ad + de (overlay)
		x <= ((not a) and c and (not d) and f) or 
			(a and d and (not e)) or 
			(a and (not d) and f) or 
			((not a) and b and c) or
			((not a) and c and d) or 
			((not d) and e and f) or
			(a and b) or 
			(b and e) or
			(d and e);
end architecture;
