class Code:
    def dest(self, mnemonic):
        return f'{"1" if "A" in mnemonic else "0"}{"1" if "D" in mnemonic else "0"}{"1" if "M" in mnemonic else "0"}'

    def comp(self, mnemonic):
        comp_dict = {
            '0':   '101010',
            '1':   '111111',
            '-1':  '111010',
            'D':   '001100',
            'A':   '110000',
            '!D':  '001101',
            '!A':  '110001',
            '-D':  '001111',
            '-A':  '110011',
            'D+1': '011111',
            'A+1': '110111',
            'D-1': '001110',
            'A-1': '110010',
            'D+A': '000010',
            'D-A': '010011',
            'A-D': '000111',
            'D&A': '000000',
            'D|A': '010101',
        }
        a = '0'
        if 'M' in mnemonic:
            a = '1'
            mnemonic = mnemonic.replace('M','A')
        c = comp_dict.get(mnemonic, '000000')
        return a + c

    def jump(self, mnemonic):
        jump_dict = {
            'JGT': '001',
            'JEQ': '010',
            'JGE': '011',
            'JLT': '100',
            'JNE': '101',
            'JLE': '110',
            'JMP': '111',
        }
        return jump_dict.get(mnemonic, '000')

