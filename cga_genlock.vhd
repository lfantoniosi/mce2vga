-- CGA Genlock
-- 2017 Luis Antoniosi


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cga_genlock is
	generic(
		constant porch					: integer := 116;	-- front and back porches added
		constant border				: integer := 20;	-- top and bottom borders added
		constant samples				: integer := 3		-- number of samples to integrate
	);
	
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
		adjust_x				: buffer unsigned(4 downto 0);
		adjust_y				: buffer unsigned(4 downto 0);
		vsync					: in std_logic;
		hsync					: in std_logic;
		max_col				: out unsigned(9 downto 0);
		max_row				: out unsigned(9 downto 0);
		left_btn				: in std_logic;
		right_btn			: in std_logic;
		up_btn				: in std_logic;
		down_btn				: in std_logic;
		adjust_mode			: in std_logic;
		hsync_ticks			: out unsigned(2 downto 0);
		reset					: in std_logic	
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


signal hcount	  		: unsigned (13 downto 0); 
signal vcount	  		: unsigned (13 downto 0); 
signal rgbi				: unsigned (3 downto 0);

signal store_trg		 : std_logic := '0';

signal adj_trg_left: std_logic := '0';
signal adj_trg_right: std_logic := '0';
signal adj_trg_up: std_logic := '0';
signal adj_trg_down: std_logic := '0';
signal adj_x : unsigned(4 downto 0) := "01000"; --"0110111";
signal adj_y : unsigned(4 downto 0) := "10000";
signal sample_ticks: unsigned(4 downto 0) := "10110"; --"01010";
signal sample_adj: integer range 0 to 7 := samples;
signal adj_trg_reset: std_logic := '0';

begin

	process(clk, reset, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 128*1024 := 128*1024;
	begin
		if (rising_edge(clk)) then			
			adj_trg_reset <= '0';
			if (enable = '1') then			
				if (reset /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := reset;
						peak := 128*1024;
						
						if (reset = '0') then
							adj_trg_reset <= '1';
						end if;						
					end if;	
				else
					peak := 128*1024;
				end if;
			end if;		
		end if;
	end process;
	
	process(clk, left_btn, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 128*1024 := 128*1024;
	begin
		if (rising_edge(clk)) then			
			adj_trg_left <= '0';
			if (enable = '1') then			
				if (left_btn /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := left_btn;
						peak := 128*1024;
						
						if (left_btn = '0') then
							adj_trg_left <= '1';
						end if;						
					end if;	
				else
					peak := 128*1024;
				end if;
			end if;		
		end if;
	end process;	
	
	process(clk, right_btn, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 128*1024 := 128*1024;
	begin
		if (rising_edge(clk)) then			
			adj_trg_right <= '0';
			if (enable = '1') then			
				if (right_btn /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := right_btn;
						peak := 128*1024;
						
						if (right_btn = '0') then
							adj_trg_right <= '1';
						end if;						
					end if;	
				else
					peak := 128*1024;
				end if;
			end if;		
		end if;
	end process;

	process(clk, up_btn, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 128*1024 := 128*1024;
	begin
		if (rising_edge(clk)) then			
			adj_trg_up <= '0';
			if (enable = '1') then			
				if (up_btn /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := up_btn;
						peak := 128*1024;
						
						if (up_btn = '0') then
							adj_trg_up <= '1';
						end if;						
					end if;	
				else
					peak := 128*1024;
				end if;
			end if;		
		end if;
	end process;		

	process(clk, down_btn, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 128*1024 := 128*1024;
	begin
		if (rising_edge(clk)) then			
			adj_trg_down <= '0';
			if (enable = '1') then			
				if (down_btn /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := down_btn;
						peak := 128*1024;
						
						if (down_btn = '0') then
							adj_trg_down <= '1';
						end if;						
					end if;	
				else
					peak := 128*1024;
				end if;
			end if;		
		end if;
	end process;			

	process(clk, adjust_mode, reset)
	begin
		if (rising_edge(clk)) then

			if (adj_trg_reset = '1') then
				if (adjust_mode = '1') then
					sample_ticks <= sample_ticks + 1;
				else
					sample_ticks <= sample_ticks - 1;
				end if;				
			end if;	
			sample_adj <= to_integer(sample_ticks(1 downto 0) + samples);	
			hsync_ticks <= sample_ticks(4 downto 2);
		end if;		
	end process;
	
	process(clk, adj_trg_left, adj_trg_right)
	begin
		if (rising_edge(clk)) then

			if (adj_trg_left = '1') then
				if (adj_x < 31) then
					adj_x <= adj_x + 1;
				end if;
			elsif (adj_trg_right = '1') then
				if (adj_x > 0) then
					adj_x <= adj_x - 1;
				end if;
			end if;					
			adjust_x <= adj_x;
		end if;		
	end process;
	
	process(clk, adj_trg_up, adj_trg_down)
	begin
		if (rising_edge(clk)) then

			if (adj_trg_up = '1') then
				if (adj_y < 31) then
					adj_y <= adj_y + 1;
				end if;
			elsif (adj_trg_down = '1') then
				if (adj_y > 0) then			
					adj_y <= adj_y - 1;
				end if;
			end if;				
			adjust_y <= adj_y;		
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
	process(clk, hcount) --, hblank, vblank) 
	begin
	
		if (rising_edge(clk)) then		
			wren <= '0';		
			if ((hcount(2 downto 0) = "111") and (hcount(hcount'length-1 downto 3) > porch and hcount(hcount'length-1 downto 3) < porch+752) and (vcount > border and vcount < border + 232) ) then
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
				if (vcount > border and vcount < border + 232) then
					row_number <= row_number + 1;
					store_trg <= '1';
				end if;				
			end if;
			
			if (vblank = '1') then				
				row_number <= (others => '0');				
			end if;
		end if;
	
	end process;
	
	process(clk, hcount, hblank)
	begin
		
		if (rising_edge(clk)) then		
		
			if (hcount(2 downto 0) = "111" and hcount(hcount'length-1 downto 3) > porch and hcount(hcount'length-1 downto 3) < porch+752) then
				col_number <= col_number + 1;
			end if;
				
			if (hblank = '1') then
				col_number <= (others => '0');
			end if;
		end if;
	
	end process;	

	
	process(clk, hcount, r, sample_adj) 
	variable i : integer range 0 to 15;
	begin
		if (rising_edge(clk)) then				
			if (hcount(2 downto 0) = "110") then
				rgbi(3) <= '0';
				if (i > sample_adj) then
					rgbi(3) <= '1';
				end if;
				i := 0;
			elsif(r = '1' and hcount(2 downto 0) /= "000") then
				i := i + 1;
			end if;			
		end if;		
	end process;	
	
	process(clk, hcount, g, sample_adj) 
	variable i : integer range 0 to 15;
	begin
		if (rising_edge(clk)) then	
			if (hcount(2 downto 0) = "110") then
				rgbi(2) <= '0';
				if (i > sample_adj) then
					rgbi(2) <= '1';
				end if;
				i := 0;
			elsif(g = '1' and hcount(2 downto 0) /= "000") then
				i := i + 1;
			end if;			
		end if;		
	end process;

	process(clk, hcount, b, sample_adj) 
	variable i : integer range 0 to 15;
	begin
		if (rising_edge(clk)) then				
			if (hcount(2 downto 0) = "110") then
				rgbi(1) <= '0';
				if (i > sample_adj) then
					rgbi(1) <= '1';
				end if;
				i := 0;
			elsif(b = '1' and hcount(2 downto 0) /= "000") then
				i := i + 1;
			end if;		
		end if;		
	end process;
	
	process(clk, hcount, int, sample_adj) 
	variable i : integer range 0 to 15;
	begin
		if (rising_edge(clk)) then				
			if (hcount(2 downto 0) = "110") then
				rgbi(0) <= '0';
				if (i > sample_adj) then
					rgbi(0) <= '1';
				end if;
				i := 0;
			elsif(int = '1' and hcount(2 downto 0) /= "000") then
				i := i + 1;
			end if;			
		end if;		
	end process;	

	process(clk, rgbi) 
	variable rgb : unsigned(5 downto 0);	
	begin
		if (rising_edge(clk)) then				
			if (hcount(2 downto 0) = "111") then
				rgb := rgbi(3)&rgbi(0)&rgbi(2)&rgbi(0)&rgbi(1)&rgbi(0);		
				case(rgb) is
					when "101000" => pixel <= "100100"; -- BROWN
					when others => pixel <= rgb;
				end case;
			end if;				
		end if;
		
	end process;
	
end behavioral;
