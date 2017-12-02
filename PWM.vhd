-- PWM code of sequencial logic for fpga.

-- This code applies for chips working with 50MHz; 
-- If you work with another frequency, change the constante prescaler according the equation above
--	clk/(255*frequency)

-- Autor: Rodolfo Cavour Moretti Schiavi

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity PWM is
	port(
		clk: in std_logic;
		PWM: out std_logic;
		duty_cycle: in std_logic_vector(7 downto 0) := "00100000" -- 8 bits for 0 to 100% of duty cycle
		);
end PWM;

architecture modulation of PWM is
	signal signal_pwm: std_logic := '0';
	
BEGIN
		PROCESS (clk) 
		
		constant prescaler: integer range 0 to 255 := 196; -- Clock divider for reach  1kHz, change this value 
																			  -- with the following equation: clk/(255*frequency)
		variable t: integer range 0 to 32768 := 0;	-- Time counter
		variable t_mod: integer range 0 to 255;	-- Time counter for the duty cycle
		constant end_range: integer range 0 to 255:=255;	-- Constante to produce the low signal
		
		BEGIN
			if(rising_edge(clk)) then
				t := t + 1;
				if(prescaler = t) then 
					t := 0;
					t_mod:= t_mod + 1;
					if(t_mod=255) then
						t_mod:=0;
					end if;
					if(t_mod <= CONV_INTEGER(duty_cycle)) then
						signal_pwm <= '0';
					end if;
					if(t_mod >= end_range-CONV_INTEGER(duty_cycle)) then
						signal_pwm <= '1';
					end if;
				end if;
			end if;
		end process;
		PWM <= signal_pwm;
												
end modulation;