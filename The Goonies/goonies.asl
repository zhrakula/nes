
state("mesen", "0.9.8.0")
{
    byte level:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xA3;
    byte final:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xBE;
    //byte cpu:    "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x43;
    byte start:    "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xC2;
}

state("fceux")
{
    byte level:  0x3B1388, 0x00A3;
    byte final:  0x3B1388, 0x00BE; // or 0x00BF ?  == 2
    //byte cpu:    0x3B1388, 0x0043;
    byte start:  0x3B1388, 0x00C2;
}

state("nestopia")
{
    byte level:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x10B;
    byte final:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x126;
    byte start:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x12A;
    //byte cpu:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xAB;
}

state("punes64", "0.105") //d3d 0x142FF20
{
    byte level:  0x142FFC3;
    byte final:  0x142FFDE;
    byte cpu:    0x142FF63;
}

startup
{
    //settings.Add("lvl1", true, "Level 1");
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
