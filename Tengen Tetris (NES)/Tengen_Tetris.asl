
state("mesen")
{
    string3 lines1:  "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x425;
    string3 lines2:  "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x429;
    sbyte   scene:   "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x29;
}

state("fceux")
{
    string3 lines1:    0x3B1388, 0x0425;
    string3 lines2:    0x3B1388, 0x0429;
    sbyte   scene:     0x3B1388, 0x0029;
}

state("nestopia")
{
    string3 lines1:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x48D;
    string3 lines2:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x491;
    sbyte   scene:     "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x91;
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
