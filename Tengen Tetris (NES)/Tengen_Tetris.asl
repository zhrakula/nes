
state("mesen", "0.9.8.0")
{
    string3 lines1:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x425;
    string3 lines2:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x429;
    sbyte   scene:   "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x29;
}

state("fceux")
{
    string3 lines1:    0x3B1388, 0x0425;
    string3 lines2:    0x3B1388, 0x0429;
    sbyte   scene:     0x3B1388, 0x0029;
}

state("nestopia", "1.40")
{
    string3 lines1:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x48D;
    string3 lines2:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x491;
    sbyte   scene:     "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x91;
}

state("punes64", "0.105") //d3d 0x142FF20
{
    string3 lines1:    0x1430345;
    string3 lines2:    0x1430349;
    sbyte   scene:     0x142FF49;
}


startup
{
    settings.Add("dance", true, "Split on dance");
}

start
{
    return(old.scene == -1 && current.scene == 0);
}

reset
{
    return (current.scene == -6);
}

split
{
    if (settings["dance"]) {
        if (current.scene == 3 && old.scene != 3) return true;
    }
    if ((Convert.ToInt32(current.lines1) + Convert.ToInt32(current.lines2)) >= 100) return true;

}
