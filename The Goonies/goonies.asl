state("fceux")
{
    byte level:  0x3B1388, 0x00A3;
    byte final:  0x3B1388, 0x00BE; // or 0x00BF ?  == 2
    byte cpu:    0x3B1388, 0x0043;
}

state("nestopia")
{
    // base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
    byte level:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x10B;
    byte final:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x126;
    byte cpu:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xAB;
}

startup
{
    settings.Add("lvl1", true, "Level 1");
    settings.Add("lvl2", true, "Level 2");
    settings.Add("lvl3", false, "Level 3 (bonus)");
    settings.Add("lvl4", true, "Level 4");
    settings.Add("lvl5", true, "Level 5");
    settings.Add("lvl6", false, "Level 6 (bonus)");
    settings.Add("lvl7", true, "Level 7");
    settings.Add("lvl8", false, "Level 8 (bonus)");
}

reset
{
    return(current.level == 0);
}

split
{
    if (current.level == 0) return false;
    if (current.level == 9 && current.final == 2) return true;

    if (settings["lvl1"] && current.level == 2 && old.level != current.level) return true;
    if (settings["lvl2"] && current.level == 3 && old.level != current.level) return true;
    if (settings["lvl3"] && current.level == 4 && old.level != current.level) return true;
    if (settings["lvl4"] && current.level == 5 && old.level != current.level) return true;
    if (settings["lvl5"] && current.level == 6 && old.level != current.level) return true;
    if (settings["lvl6"] && current.level == 7 && old.level != current.level) return true;
    if (settings["lvl7"] && current.level == 8 && old.level != current.level) return true;
    if (settings["lvl8"] && current.level == 9 && old.level != current.level) return true;
}

start
{
    return(current.level == 1 && old.level == 0 && current.cpu == 0);
}
