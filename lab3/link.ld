SECTIONS
{
	. = 0x80000;
	PROVIDE(__bootloader_start = .);
	.text.boot : { KEEP(*(.text.boot)) }
	.text : { *(.text) }
	.data : { *(.data) }
	. = ALIGN(16);
	.bss (NOLOAD) :
	{
		__bss_start = .;
		*(.bss)
		__bss_end = .;
	}
	__bootloader_end = .;
}
__bss_size = (__bss_end - __bss_start)>>3;
__loader_size = (__bootloader_end - __bootloader_start)>>3;
