
state("mesen", "0.9.8.0")
{
	byte level:          "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x89;
	byte bossHealth:     "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x583;
	byte reset:          "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x8A;
	byte left:           "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xC5;
	byte control:        "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xE8;
}

state("fceux")
{
	byte level:      0x3B1388, 0x0089; 
	byte bossHealth: 0x3B1388, 0x0583; 
	byte reset:      0x3B1388, 0x008A;
	byte left:       0x3B1388, 0x00C5;
	byte control:    0x3B1388, 0x00E8;
}

state("nestopia")
{	
	byte level:       "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xF1;
	byte bossHealth:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x5EB;
	byte reset:       "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xF2;
	byte left:        "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x12D;
	byte control:     "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x150;
}

reset
{
	return (current.reset == 0 && current.left == 0);
}

split
{
	if (current.level == 3 && current.bossHealth <= 0 && old.bossHealth > 0) {
		return true;
	}
	if (current.level == 8 && current.bossHealth <= 0 && old.bossHealth > 0) {
		return true;
	}
	if (current.level == 18 && current.bossHealth <= 0 && old.bossHealth > 0) {
		return true;
	}
	if (current.level == 21 && current.bossHealth <= 0 && old.bossHealth > 0) {
		return true;
	}
	if (current.level == 23 && current.bossHealth <= 0 && old.bossHealth > 0) {
		return true;
	}
	if (current.level == 24 && current.bossHealth <= 0 && old.bossHealth > 0) {
		return true;
	}

	if (current.control == 4 && old.control == 0) {
		return true;
	}


	if (current.level == 8 && old.level == 7) {
		return true;
	}

	if (current.level == 18 && old.level == 17) {
		return true;
	}

	if (current.level == 21 && old.level == 20) {
		return true;
	}

	//if (current.level != old.level) {
	//	return ((current.level < 12 || current.level > 17) && current.level != 7 && current.level != 20 && current.level != 24);
	//}
}

start
{
	return (current.level == 0 && current.left >= 124 && old.left == 0);
}
