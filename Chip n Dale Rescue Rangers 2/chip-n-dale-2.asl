

state("fceux")
{
	byte level_E:     0x3B1388, 0x001E;
	byte level_F:     0x3B1388, 0x001F;
	byte boss_hp:     0x3B1388, 0x03D7;
}

state("nestopia")
{
	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	byte level_E:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x86;
	byte level_F:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x87;
	byte boss_hp:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x43F;
}

startup
{
    settings.Add("boss_before", false, "Split before boss fight");
    settings.Add("boss_after", true, "Split on boss finish");
}

start
{
	return (current.level_F == 0x0F && old.level_F != 0x0F && current.level_E == 0x00);
}

reset
{
	return (current.level_F == 0x1F && current.level_E == 0x1F);
}

split
{
	if (settings["boss_before"]) {
		if (old.level_E == 0 && current.level_E == 0x0E) return true;
		if (old.level_E == 0x02 && current.level_E == 0x0A) return true;
		if (old.level_E == 0x03 && current.level_E == 0x0B) return true;
		//if (old.level_E == 0x04 && current.level_E == 0x1F) return true;
		if (old.level_E == 0x05 && current.level_E == 0x0D) return true;
		if (old.level_E == 0x06 && current.level_E == 0x0C) return true;
		if (old.level_E == 0x02 && current.level_E == 0x09) return true;
		if (old.level_E == 0x08 && current.level_E == 0x0D) return true;
		if (old.level_E == 0x01 && current.level_E == 0x0E) return true;
	}

	if (settings["boss_after"]) {
		if (old.level_E != 0x1F && current.level_E == 0x1F) return true;
	}

	if (current.level_E == 0x0D && current.level_F == 0x17 && current.boss_hp <= 0 && old.boss_hp > 0 && old.boss_hp <= 2) return true;

}
