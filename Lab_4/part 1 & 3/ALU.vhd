--------------------------------------------------------------------------------
--
-- LAB #4
--
--------------------------------------------------------------------------------

Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Use ieee.std_logic_unsigned.all;

entity ALU is
	Port(	DataIn1: in std_logic_vector(31 downto 0);
		DataIn2: in std_logic_vector(31 downto 0);
		ALUCtrl: in std_logic_vector(4 downto 0);
		Zero: out std_logic;
		ALUResult: out std_logic_vector(31 downto 0) );
end entity ALU;

architecture ALU_Arch of ALU is
	-- ALU components	
	component adder_subtracter
		port(	datain_a: in std_logic_vector(31 downto 0);
			datain_b: in std_logic_vector(31 downto 0);
			add_sub: in std_logic;
			dataout: out std_logic_vector(31 downto 0);
			co: out std_logic);
	end component adder_subtracter;

	component shift_register
		port(	datain: in std_logic_vector(31 downto 0);
		   	dir: in std_logic;
			shamt:	in std_logic_vector(4 downto 0);
			dataout: out std_logic_vector(31 downto 0));
	end component shift_register;
	SIGNAL whatIsThisFor : std_logic;
	SIGNAL ADDRESULT : std_logic_vector(31 DOWNTO 0);
	SIGNAL ADDIRESULT : std_logic_vector(31 DOWNTO 0);
	SIGNAL SUBRESULT : std_logic_vector(31 DOWNTO 0);
	SIGNAL SLLRESULT : std_logic_vector(31 DOWNTO 0);
	SIGNAL SLLIRESULT : std_logic_vector(31 DOWNTO 0);
	SIGNAL SRLRESULT : std_logic_vector(31 DOWNTO 0);
	SIGNAL SRLIRESULT : std_logic_vector(31 DOWNTO 0);
	
	SIGNAL TEMPRES: std_logic_vector(31 DOWNTO 0);
	
begin
	--Add
	A0:adder_subtracter PORT MAP (DataIn1, DataIn2, '0', ADDRESULT, whatIsThisFor);
	--Sub
	A1:adder_subtracter PORT MAP(DataIn1, DataIn2, '1', SUBRESULT, whatIsThisFor);
	--Addi
	A2:adder_subtracter PORT MAP(DataIn1, DataIn2, '0', ADDIRESULT, whatIsThisFor);
	--Sll
	A3:shift_register PORT MAP(DataIn1, '0', DataIn2(4 Downto 0), SLLRESULT);
	--Slli
	A4:shift_register PORT MAP(DataIn1, '0', DataIn2(4 Downto 0), SLLIRESULT);
	--Srl
	A5:shift_register PORT MAP(DataIn1, '1', DataIn2(4 Downto 0), SRLRESULT);
	--Srli
	A6:shift_register PORT MAP(DataIn1, '1', DataIn2(4 Downto 0), SRLIRESULT);

	WITH ALUCtrl SELECT
	TEMPRES <= ADDRESULT WHEN "00000",
		SUBRESULT WHEN "00001",
		ADDIRESULT WHEN "00010",
		(DataIn1 AND DataIn2) WHEN "00011", --AND
		(DataIn1 AND DataIn2) WHEN "00100", --ANDI
		(DataIn1 OR DataIn2) WHEN "00101", --OR
		(DataIn1 OR DataIn2) WHEN "00110", --ORI
		SLLRESULT WHEN "00111",
		SLLIRESULT WHEN "01000",
		SRLRESULT WHEN "01001",
		SRLIRESULT WHEN OTHERS;
	
	Zero <= '1' WHEN TEMPRES = X"00000000" ELSE '0';

	ALUResult <= TEMPRES;

	

end architecture ALU_Arch;


