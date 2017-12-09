-- VGA Video generator
-- 2017 Luis Antoniosi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_video is

-- 	http://www.epanorama.net/documents/pc/vga_timing.html
--		Here the common VGA modes supported. The row_out module rdclk must use the same clk
--		These values must be changed on instance (schematic.bdf) for each instance NOT HERE!
--
--    720x350@70Hz
--		clk 						:= VGA_28MHZ_CLK
--		hor_active_video		:= 726
--		hor_front_porch		:= 15
--		hor_sync_pulse			:= 108
--		hor_back_porch			:= 51
--		vert_active_video		:= 354
--		vert_front_porch		:= 36
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 57
--		hsync_level 			:= '0'
--		vsync_level 			:= '0'
--
--    720x400@70Hz
--		clk 						:= VGA_28MHZ_CLK
--		hor_active_video		:= 726
--		hor_front_porch		:= 15
--		hor_sync_pulse			:= 108
--		hor_back_porch			:= 51
--		vert_active_video		:= 404
--		vert_front_porch		:= 11
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 32
--		hsync_level 			:= '0'
--		vsync_level 			:= '1'
--
--    640x350@70Hz
--		clk 						:= VGA_25MHZ_CLK
--		hor_active_video		:= 640
--		hor_front_porch		:= 16
--		hor_sync_pulse			:= 96
--		hor_back_porch			:= 48
--		vert_active_video		:= 350
--		vert_front_porch		:= 37
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 60
--		hsync_level 			:= '1'
--		vsync_level 			:= '0'
--
--    640x400@70Hz
--		clk 						:= VGA_25MHZ_CLK
--		hor_active_video		:= 640
--		hor_front_porch		:= 16
--		hor_sync_pulse			:= 96
--		hor_back_porch			:= 48
--		vert_active_video		:= 400
--		vert_front_porch		:= 12
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 35
--		hsync_level 			:= '1'
--		vsync_level 			:= '0'
--
--    640x480@60Hz
--		clk 						:= VGA_25MHZ_CLK
--		hor_active_video		:= 640
--		hor_front_porch		:= 16
--		hor_sync_pulse			:= 96
--		hor_back_porch			:= 48
--		vert_active_video		:= 480
--		vert_front_porch		:= 10
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 33
--		hsync_level 			:= '0'
--		vsync_level 			:= '0'

	generic(
		
		constant hor_active_video		: integer 	:= 726;
		constant hor_front_porch		: integer 	:= 15;
		constant hor_sync_pulse			: integer 	:= 108;
		constant hor_back_porch			: integer 	:= 51;

		constant vert_active_video		: integer 	:= 354;
		constant vert_front_porch		: integer 	:= 36;
		constant vert_sync_pulse		: integer 	:= 2;
		constant vert_back_porch		: integer 	:= 57;

		constant hsync_level 			: std_logic := '0';
		constant vsync_level 			: std_logic := '0';
		constant mono						: std_logic := '0';
		
		constant scale_mode				: integer   := 0  -- 0 : no scale, 1 : CGA doubling rows, 2 : MDA 350->400
	);
	
    port(
		clk  					: in std_logic;
		enable				: in std_logic;
		pixel_in				: in unsigned(5 downto 0);		
		scanline				: in std_logic;

		r_out					: out unsigned(3 downto 0);
		g_out					: out unsigned(3 downto 0);
		b_out					: out unsigned(3 downto 0);
		hsync_out			: out std_logic;
		vsync_out			: out std_logic;
		row_number			: buffer unsigned(9 downto 0);
		col_number			: buffer unsigned(9 downto 0);
		rd_req				: buffer std_logic;
		rd_ack				: in std_logic;
				
		sram_clk				: in std_logic;
		no_video				: in std_logic;
		adj_x					: in unsigned(4 downto 0);
		adj_y					: in unsigned(4 downto 0);
		max_col				: in unsigned(9 downto 0);
		max_row				: in unsigned(9 downto 0);
		adjust_mode			: in std_logic
    );
end vga_video;

architecture behavioral of vga_video is

type ram_type is array ( 0 to 760 ) of unsigned(5 downto 0);

signal hcount										: unsigned(15 downto 0);
signal vcount										: unsigned(15 downto 0);
signal videov, videoh							: std_logic;
signal hblank, vblank							: std_logic;
signal merge_rows									: std_logic;
signal blank										: std_logic;

signal start_row									: unsigned(9 downto 0);
signal start_col									: unsigned(9 downto 0);

function f_scanline(pattern: unsigned) return unsigned;
function f_scanline(pattern: unsigned) return unsigned is
variable VALUE : unsigned (3 downto 0); 
begin
		case pattern is	
			when	"0000"  => VALUE :=	"0000";
			when	"0001"  => VALUE :=	"0001";
			when	"0010"  => VALUE :=	"0010";
			when	"0011"  => VALUE :=	"0010";
			when	"0100"  => VALUE :=	"0011";
			when	"0101"  => VALUE :=	"0100";
			when	"0110"  => VALUE :=	"0101";
			when	"0111"  => VALUE :=	"0101";
			when	"1000"  => VALUE :=	"0110";
			when	"1001"  => VALUE :=	"0111";
			when	"1010"  => VALUE :=	"1000";
			when	"1011"  => VALUE :=	"1000";
			when	"1100"  => VALUE :=	"1001";
			when	"1101"  => VALUE :=	"1010";
			when	"1110"  => VALUE :=	"1011";
			when	"1111"  => VALUE :=	"1011";
		end case;		
		return VALUE;
		
end f_scanline;

begin

	process (clk, adj_y, adj_x)
	begin
		if(rising_edge(clk)) then
			start_row <= "00000" & adj_y;
			start_col <= "00010" & adj_x;			
		end if;
	end process;
	


	-- row control
	process (clk, enable, hcount)
	begin
		
			if (enable = '0') then
				-- disable
			elsif(rising_edge(clk)) then

				if hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch ) then
					vcount <= vcount + 1;
				end if;
				
				if (vcount = (vert_active_video + vert_front_porch + vert_sync_pulse + vert_back_porch ) and hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch )) then 
					vcount <= (others => '0');
				end if;		
				
			end if;

	end process;
	
	-- colum control
	process (clk, enable)
	begin
		
			if (enable = '0') then
				-- disable
			elsif (rising_edge(clk)) then

				hcount <= hcount + 1;
				
				if (hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch )) then 			
					hcount <= (others => '0');
				end if;
				
			end if;

			
	end process;	
	
	-- pre hblank, vblank
	process (clk, enable)
	begin
		
			if (enable = '0') then
				-- disable
			elsif (rising_edge(clk)) then
			
				hblank <= '0';
				vblank <= '0';
				
				-- vblank and hblank happens always one clock behind vcount and hcount wrap around
				if (hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch - 1)) then 			
					hblank <= '1';				
					if (vcount = (vert_active_video + vert_front_porch + vert_sync_pulse + vert_back_porch)) then 
						vblank <= '1';
					end if;									
				end if;			
			end if;

			
	end process;		

	-- vsync control
	process(clk, enable, vcount)
	begin
				
			if (enable = '0') then
				-- disable
				vsync_out <= 'Z';			
			elsif(rising_edge(clk)) then
				vsync_out <= not vsync_level;
				
				if (vcount <= (vert_active_video + vert_front_porch + vert_sync_pulse - 1) and vcount >= (vert_active_video + vert_front_porch - 1)) then
					vsync_out <= vsync_level;
				end if;

			end if;
		
	end process;

	-- hsync control
	process (clk, enable, hcount)
	begin
		
			if (enable = '0') then
				-- disable
				hsync_out <= 'Z';
				
			elsif (rising_edge(clk)) then     

				hsync_out <= not hsync_level;
				
				if (hcount <= (hor_active_video + hor_front_porch + hor_sync_pulse - 1) and hcount >= (hor_active_video + hor_front_porch - 1)) then
					hsync_out <= hsync_level;
				end if;
				
			end if;		
		
	end process;
		
	-- colum pixel to read from row RAM
	process (clk, hcount)
	begin
			if (rising_edge(clk)) then
				if (hcount = (hor_active_video + hor_front_porch + hor_sync_pulse)) then
				
					col_number <= start_col;
					
				elsif (hcount < hor_active_video) then
									
					col_number <= col_number + 1;
					
				end if;
			end if;

	end process;
	

	-- row to read from SRAM into row RAM
	process (clk, vcount, vblank, hblank)
	begin
			if (rising_edge(clk)) then

				if (hblank = '1') then
					
					merge_rows <= '0';
										
					if (vcount = (vert_active_video + vert_front_porch + vert_sync_pulse)) then
						
						row_number <= start_row;
						
					elsif (vcount < vert_active_video) then
					
						case scale_mode is
						
							when 1 =>
								if (vcount(0) = '1') then
									row_number <= row_number + 1;
								end if;
							
							when others =>
								row_number <= row_number + 1;
								
						end case;
					
					end if;					
				end if;
			end if;
		
	end process;

	-- SRAM sync
	process(sram_clk, hcount, rd_ack)
	begin
	
		if (rd_ack = '1') then
		
			rd_req <= '0'; -- request taken 
			
		elsif (rising_edge(sram_clk)) then
		
			if (hcount = (hor_active_video) ) then
			
				rd_req <= '1'; -- request a new ROW fetch
				
			end if;
			
		end if;
		
	end process;

	-- pixel color
	process(clk, enable, hcount, vcount, pixel_in, col_number, merge_rows) 
	variable osd, osd_mask: std_logic;
	variable prev_row : ram_type;
	variable prev_pixel : unsigned(5 downto 0);
	variable red_pixel: unsigned(3 downto 0);
	variable green_pixel: unsigned(3 downto 0);
	variable blue_pixel: unsigned(3 downto 0);

	begin		
		
			if (enable = '0') then
			
				-- disable
				r_out <= (others => 'Z');
				g_out <= (others => 'Z');
				b_out <= (others => 'Z');			
				
			elsif (rising_edge(clk)) then
				
				prev_pixel := prev_row(to_integer(col_number));
				prev_row(to_integer(col_number)) := pixel_in;
				
				--if (merge_rows = '1') then				
				--	red_pixel := to_unsigned(to_integer(prev_pixel(5 downto 4)) + to_integer(pixel_in(5 downto 4)), 3) & '0';
				--	green_pixel := to_unsigned(to_integer(prev_pixel(3 downto 2)) + to_integer(pixel_in(3 downto 2)), 3) & '0';
				--	blue_pixel := to_unsigned(to_integer(prev_pixel(1 downto 0)) + to_integer(pixel_in(1 downto 0)), 3) & '0';
				--else
				--	--	pixel := pixel_in;				
					red_pixel := pixel_in(5 downto 4) & "00";
					green_pixel := pixel_in(3 downto 2) & "00";
					blue_pixel := pixel_in(1 downto 0) & "00";
				--end if;				

				if (no_video = '1') then				
					red_pixel := "0000";
					green_pixel := "0000";
					blue_pixel := "0000";
				end if;	
				
				if (mono = '1') then
				
					if (scanline = '0') then
					
						if (adjust_mode = '1') then
							-- amber
							green_pixel := '0' & green_pixel(3 downto 1);
							blue_pixel := "0000";	
							
						else
							-- green
							red_pixel := "0000";
							blue_pixel := "0000";																		
						end if;
						
					end if;
				
				end if;
				
				if (mono = '0' or scanline = '1') then
					red_pixel(1) := red_pixel(3) or red_pixel(2);
					green_pixel(1) := green_pixel(3) or green_pixel(2);
					blue_pixel(1) := blue_pixel(3) or blue_pixel(2);					
				end if;				

				red_pixel(0) := red_pixel(3) or red_pixel(2);
				green_pixel(0) := green_pixel(3) or green_pixel(2);
				blue_pixel(0) := blue_pixel(3) or blue_pixel(2);
				
				if (scanline = '1' and mono = '0') then
				
					if (vcount(0) = '1') then
					
						if (scale_mode = 1) then
							red_pixel := '0' & red_pixel(3 downto 1);
							green_pixel := '0' & green_pixel(3 downto 1);
							blue_pixel := '0' & blue_pixel(3 downto 1);
						else
							red_pixel(0) := '0';
							green_pixel(0) := '0';
							blue_pixel(0) := '0';						
						end if;
						
					end if;					
				end if;
					
				r_out <= red_pixel and (blank&blank&blank&blank);
				g_out <= green_pixel and (blank&blank&blank&blank);
				b_out <= blue_pixel and (blank&blank&blank&blank);
				
			end if;
		
	end process;

	-- vert active video control
	process (clk, enable, vcount)
	begin
		if (rising_edge(clk)) then
			videov <= '0'; 
			if ( vcount > 0 and vcount < vert_active_video + 1 and row_number < max_row) then 
				videov <= '1';
			end if;	
	   end if;
	end process;

	-- horz active video control
	process (clk, enable, hcount)
	begin
		if (rising_edge(clk)) then
			videoh <= '0';
			if (hcount < hor_active_video and col_number < (max_col - 6)) then
				videoh <= '1';
			end if;
		end if;
	end process;
	
	process (clk, enable, hcount)
	begin
		if (rising_edge(clk)) then
			blank <= videoh and videov;
		end if;
	end process;	

end behavioral;