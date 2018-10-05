library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity square_root is
    Port ( clk : in STD_LOGIC;
           sq_root : out STD_LOGIC_VECTOR (23 downto 0);
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (31 downto 0);
           output_valid : OUT STD_LOGIC;
           input_valid : IN STD_LOGIC);
end square_root;

architecture Behavioral of square_root is
COMPONENT square_rooter
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    s_axis_cartesian_tvalid : IN STD_LOGIC;
    s_axis_cartesian_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
  );
END COMPONENT;

begin

square_root : square_rooter
  PORT MAP (
    aclk => clk,
    aresetn => rst,
    s_axis_cartesian_tvalid => input_valid,
    s_axis_cartesian_tdata => data_in,
    m_axis_dout_tvalid => output_valid,
    m_axis_dout_tdata => sq_root
  );

end Behavioral;
