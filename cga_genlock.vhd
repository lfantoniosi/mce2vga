-- CGA Genlock
-- 2017 Luis Antoniosi


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cga_genlock is
    port(	
		clk 					: in std_logic;
		enable				: in std_logic;			
		vblank  				: in std_logic; 
		hblank 				: in std_logic;						
		r  					: in std_logic;
		g   					: in std_logic;
		b  					: in std_logic;
		int					: in std_logic;
		wr_ack				: in std_logic;
		col_number			: buffer unsigned(9 downto 0); 
		row_number			: buffer unsigned(9 downto 0); 			
		wren					: out std_logic;
		wr_req				: buffer std_logic;
		pixel					: out unsigned(5 downto 0);
		sram_clk				: in std_logic;
		vsync					: in std_logic;
		hsync					: in std_logic;
		max_col				: out unsigned(9 downto 0);
		max_row				: out unsigned(9 downto 0);
		
		samples				: in unsigned(2 downto 0);
		top_border			: in unsigned(7 downto 0);
		left_border 		: in unsigned(7 downto 0)
		
);
			
end cga_genlock;

architecture behavioral of cga_genlock is

--
constant black					: unsigned(5 downto 0) := "000000"; -- EGA 0
constant blue					: unsigned(5 downto 0) := "000010"; -- EGA 1
constant green					: unsigned(5 downto 0) := "001000"; -- EGA 2
constant cyan					: unsigned(5 downto 0) := "001010"; -- EGA 3
constant red					: unsigned(5 downto 0) := "100000"; -- EGA 4
constant magenta				: unsigned(5 downto 0) := "100010"; -- EGA 5
constant brown					: unsigned(5 downto 0) := "100100"; -- EGA 20
constant lgray					: unsigned(5 downto 0) := "101010"; -- EGA 7
constant dgray					: unsigned(5 downto 0) := "010101"; -- EGA 56
constant lblue 				: unsigned(5 downto 0) := "010111"; -- EGA 57
constant lgreen				: unsigned(5 downto 0) := "011101"; -- EGA 58
constant lcyan					: unsigned(5 downto 0) := "011111"; -- EGA 59
constant lred					: unsigned(5 downto 0) := "110101"; -- EGA 60
constant lmagenta				: unsigned(5 downto 0) := "110111"; -- EGA 61
constant yellow				: unsigned(5 downto 0) := "111101"; -- EGA 62
constant white					: unsigned(5 downto 0) := "111111"; -- EGA 63



signal hcount	  			: unsigned (13 downto 0); 
signal vcount	  			: unsigned (13 downto 0); 
signal rgbi					: unsigned (3 downto 0);

signal store_trg		 	: std_logic := '0';
signal sample_adj			: integer range 0 to 7 := 1;

signal s_col_begin		: integer range 0 to 2048 := 90;
signal s_col_end		: integer range 0 to 2048 := 90+800;
signal s_row_begin		: integer range 0 to 2048 := 20;
signal s_row_end		: integer range 0 to 2048 := 20+232;

begin

	process(clk, enable, samples, left_border, top_border)
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then
				s_col_begin <= to_integer(left_border);
				s_col_end <= to_integer(left_border) + 800;
				s_row_begin <= to_integer(top_border);
				s_row_end <= to_integer(top_border) + 261;
				sample_adj <= to_integer(samples);
			end if;
		end if;
	end process;

	-- colum counter
	process(clk, hblank)
	begin
		
		if (rising_edge(clk)) then
			if (hblank = '1') then
				max_col <= col_number;
				if (col_number >= 759) then
					max_col <= to_unsigned(759, max_col'length);
				end if;					
				hcount <= (others => '0');
			else
				hcount <= hcount + 1;
			end if;
		end if;
		
	end process;

	-- line counter
	process(clk, hblank, vblank)
	begin

		if (rising_edge(clk)) then
			if (hblank = '1') then
				vcount <= vcount + 1;
			elsif (vblank = '1') then
				max_row <= row_number;
				vcount <= (others => '0');
			end if;
		end if;
		
	end process;

	-- sram sync
	process(sram_clk, hcount, hblank, wr_ack)
	begin
		if (wr_ack = '1') then
			wr_req <= '0';
		elsif (rising_edge(sram_clk)) then
			if (store_trg = '1') then
				wr_req <= '1'; -- dispatch row to SRAM
			end if;
		end if;
	end process;

	-- col / row adjustment
	process(clk, hcount, s_col_begin, s_col_end, s_row_begin, s_row_end)
	begin
	
		if (rising_edge(clk)) then		
			wren <= '0';		
			if ((hcount(2 downto 0) = "111") and (hcount(hcount'length-1 downto 3) > s_col_begin and hcount(hcount'length-1 downto 3) < s_col_end) and (vcount > s_row_begin and vcount < s_row_end) ) then
				wren <= '1'; -- enable row RAM write
			end if;		
		end if;
			
	end process;
	
	process(clk, vcount, hblank)
	begin
		
		if (rising_edge(clk)) then		
		
			if (wr_req = '1') then
				store_trg <= '0';
			end if;
			
			if (hblank = '1') then			
				if (vcount > s_row_begin and vcount < s_row_end) then
					row_number <= row_number + 1;
					store_trg <= '1';
				end if;				
			end if;
			
			if (vblank = '1') then				
				row_number <= (others => '0');				
			end if;
		end if;
	
	end process;
	
	process(clk, hcount, hblank, s_col_begin, s_col_end)
	begin
		
		if (rising_edge(clk)) then		
		
			if (hcount(2 downto 0) = "111" and hcount(hcount'length-1 downto 3) > s_col_begin and hcount(hcount'length-1 downto 3) < s_col_end) then
				col_number <= col_number + 1;
			end if;
				
			if (hblank = '1') then
				col_number <= (others => '0');
			end if;
		end if;
	
	end process;		

	process(clk, r, g, b, int) 
	variable rgb : unsigned(5 downto 0);	
	begin
		if (rising_edge(clk)) then				
			if (hcount(2 downto 0) = "111") then
			
				rgb := r & int & g & int & b & int;	
				case(rgb) is
					when "010101" => pixel <= "010101"; -- GRAY
					when "101000" => pixel <= "100100"; -- BROWN
					when others => pixel <= rgb and (r & r & g & g & b & b);
				end case;
							
			end if;				
		end if;
		
	end process;
	
end behavioral;
