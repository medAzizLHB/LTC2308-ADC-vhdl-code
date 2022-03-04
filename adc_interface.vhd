--interface of LTC2308 ADC module of DE10-Nano board

Library IEEE ;
use ieee.std_logic_1164.all;

entity adc_interface is
	port(
		clk : in std_logic;
		reset : in std_logic;
		
		convst : out std_logic;
		sck : out std_logic;
		sdo : in std_logic;
		sdi : out std_logic;
		
		adc_value0 : out std_logic_vector(11 downto 0);
		adc_value1 : out std_logic_vector(11 downto 0);
		adc_value2 : out std_logic_vector(11 downto 0);
		adc_value3 : out std_logic_vector(11 downto 0);
		adc_value4 : out std_logic_vector(11 downto 0);
		adc_value5 : out std_logic_vector(11 downto 0);
		adc_value6 : out std_logic_vector(11 downto 0);
		adc_value7 : out std_logic_vector(11 downto 0)
	
	);
end adc_interface;

architecture adc_behave of adc_interface is 

	component adc_gen is
		port (
			CLOCK    : in  std_logic                     := '0'; --                clk.clk
			ADC_SCLK : out std_logic;                            -- external_interface.SCLK
			ADC_CS_N : out std_logic;                            --                   .CS_N
			ADC_DOUT : in  std_logic                     := '0'; --                   .DOUT
			ADC_DIN  : out std_logic;                            --                   .DIN
			CH0      : out std_logic_vector(11 downto 0);        --           readings.CH0
			CH1      : out std_logic_vector(11 downto 0);        --                   .CH1
			CH2      : out std_logic_vector(11 downto 0);        --                   .CH2
			CH3      : out std_logic_vector(11 downto 0);        --                   .CH3
			CH4      : out std_logic_vector(11 downto 0);        --                   .CH4
			CH5      : out std_logic_vector(11 downto 0);        --                   .CH5
			CH6      : out std_logic_vector(11 downto 0);        --                   .CH6
			CH7      : out std_logic_vector(11 downto 0);        --                   .CH7
			RESET    : in  std_logic                     := '0'  --              reset.reset
		);
	end component adc_gen;



Begin

	adc : adc_gen port map(
										CLOCK          => clk,
										ADC_SCLK 	   =>	sck,
										ADC_CS_N       => convst,		
										ADC_DOUT       =>	sdo,
										ADC_DIN    	   => sdi,
										CH0            => adc_value0,
										CH1         	=>	adc_value1,
										CH2            => adc_value2,
										CH3            => adc_value3,
										CH4            => adc_value4,
										CH5         	=> adc_value5,
										CH6      	   => adc_value6,
										CH7            => adc_value7,
										RESET          => not reset
									);




end adc_behave;