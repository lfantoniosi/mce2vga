-- MDA Genlock
-- 2017 Luis Antoniosi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mda_genlock is
	generic(
		constant porch					: integer := 16;	-- front and back porches added
		constant border				: integer := 16;	-- top and bottom borders added
		constant samples				: integer := 2		-- number of samples to integrate
	);
	
    port(	
		clk 					: in std_logic;
		enable				: in std_logic;			
		vblank  				: in std_logic; 
		hblank 				: in std_logic;						
		video					: in std_logic;
		intensity			: in std_logic;
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
			
end mda_genlock;

architecture behavioral of mda_genlock is

signal hcount			 : unsigned (13 downto 0); 
signal vcount			 : unsigned (13 downto 0); 
signal vi	 			 : unsigned (1 downto 0);
signal store_trg		 : std_logic := '0';

signal adj_trg_left: std_logic := '0';
signal adj_trg_right: std_logic := '0';
signal adj_trg_up: std_logic := '0';
signal adj_trg_down: std_logic := '0';
signal adj_x : unsigned(4 downto 0) := "00111";
signal adj_y : unsigned(4 downto 0) := "10000";
signal sample_ticks: unsigned(4 downto 0) := "00110";
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
					max_col <= col_number + 1;
					if (col_number >= 807) then
						max_col <= to_unsigned(807, max_col'length);
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
					max_row <= row_number + 1;
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
	process(clk, hcount, vi) --, hblank, vblank) 
	begin
	
		if (rising_edge(clk)) then		
			wren <= '0';		
			if ((hcount(2 downto 0) = "000") and (hcount(hcount'length-1 downto 3) > porch and hcount(hcount'length-1 downto 3) < porch+808) and (vcount > border and vcount < border + 382) ) then
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
			--if((hcount(2 downto 0) = "000") and hcount(hcount'length-1 downto 3) = porch + 640) then
				if (vcount > border and vcount < border + 382) then
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
			if (hcount(2 downto 0) = "111" and hcount(hcount'length-1 downto 3) > porch and hcount(hcount'length-1 downto 3) < porch+808) then
				col_number <= col_number + 1;
			end if;
				
			if (hblank = '1') then
				col_number <= (others => '0');
			end if;
			
		end if;
	
	end process;	

	process(clk, hcount, hblank, video, sample_adj) 
	variable i : integer range 0 to 15;
	begin
		if (rising_edge(clk)) then	
			if(video = '1') then
				i := i + 1;
			end if;
			if (hcount(2 downto 0) = "111") then
					vi(1) <= '0';
					if (i > sample_adj) then
						vi(1) <= '1';
					end if;
					i := 0;
			end if;			
		end if;		
	end process;

	process(clk, hcount, hblank, intensity, sample_adj) 
	variable i : integer range 0 to 15;
	begin
		if (rising_edge(clk)) then	
			if(intensity = '1') then
				i := i + 1;
			end if;
			if (hcount(2 downto 0) = "111") then
				vi(0) <= '0';
				if (i > sample_adj) then
					vi(0) <= '1';
				end if;
				i := 0;
			end if;
		end if;		
	end process;
	
	process(clk, vi) 
	variable rgb : unsigned(5 downto 0);
	variable mask : unsigned(5 downto 0);
	begin
	
		if (rising_edge(clk)) then
		
			if (hcount(2 downto 0) = "100") then
				pixel <= vi(1)&vi(0)&vi(1)&vi(0)&vi(1)&vi(0);
			end if;

		end if;
		
	end process;	


end behavioral;
