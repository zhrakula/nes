
// https://github.com/almamay/nes

state("mesen")
{
	byte level:       "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0xD9;
	byte boss_hp:     "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0xEE;
}

state("fceux")
{
	byte level:       0x3B1388, 0x00D9;
	byte boss_hp:     0x3B1388, 0x00EE;
}

state("nestopia")
{
	byte level:      "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x141;
	byte boss_hp:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x156;
}

startup
{
	settings.Add("boss_before", false, "Split before boss fight");
}

reset
{
	return (current.level == 240);
}

split
{
	if (current.level == 3 && old.level == 2) return true;

	if (current.level == 15 && old.level == 10) {
		vars.last_boss = true;
	}

	if (vars.last_boss && current.boss_hp >= 16 && old.boss_hp < 16) return true;

	if (settings["boss_before"] && current.level == 15 && old.level >= 4 && old.level <= 10) {
		return true;
	}
}

start
{
	if (current.level == 1 && old.level == 242) {
		vars.last_boss = false;
		return true;
	}
}
