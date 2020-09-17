
state("mesen", "0.9.8.0")
{
    string3 lines1:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x425;
    string3 lines2:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x429;
    sbyte   scene:   "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x29;
}

state("mesen", "0.9.9.0")
{
    string3 lines1:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x425;
    string3 lines2:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x429;
    sbyte   scene:   "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x29;
}

state("fceux", "2.2.3")
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

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

startup
{
    settings.Add("dance", true, "Split on dance");
    settings.Add("l00", true, "Split on 100 lines");
}

start
{
    return (old.scene == -1 && current.scene == 0);
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
    if (settings["l00"]) {
    	if ((Convert.ToInt32(current.lines1) + Convert.ToInt32(current.lines2)) >= 100) return true;
    }

}
