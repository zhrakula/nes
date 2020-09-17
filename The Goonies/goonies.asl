
state("mesen", "0.9.8.0")
{
    byte level:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xA3;
    byte final:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xBE;
    byte start:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xC2;
}

state("mesen", "0.9.9.0")
{
    byte level:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xA3;
    byte final:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xBE;
    byte start:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xC2;
}

state("fceux", "2.2.3")
{
    byte level:  0x3B1388, 0x00A3;
    byte final:  0x3B1388, 0x00BE; // or 0x00BF ?  == 2
    byte start:  0x3B1388, 0x00C2;
}

state("nestopia", "1.40")
{
    byte level:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x10B;
    byte final:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x126;
    byte start:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x12A;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

reset
{
    return(current.level == 0 && current.start == 0);
}

split
{
    if (current.level == 9 && current.final == 2) return true;
    if (current.level == 255 || current.level == 0 || old.level == 0 || old.level == 3 || old.level == 6 || old.level == 8) return false;

    if (old.level != current.level) return true;
}

start
{
    return(current.start == 1 && old.start == 0);
}
