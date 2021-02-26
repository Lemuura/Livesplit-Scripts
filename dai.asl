state("DragonAgeInquisition", "1.01")
{
    int isLoading : 0x029032F8, 0xD0, 0x38, 0x40, 0xC0, 0x224;
}

state("DragonAgeInquisition", "1.11")
{
    int isLoading : 0x0297E4A8, 0xD0, 0x38, 0x40, 0x100, 0xE98;
}

init
{
    if(modules.First().ModuleMemorySize == 116293632){
        version = "1.01";
    } else if (modules.First().ModuleMemorySize == 103342080){
        version = "1.11";
    } else {
        //Unknown version, assuming 1.11
        version = "1.11";
    }
}

exit
{
    timer.IsGameTimePaused = true;
}

isLoading
{
    return current.isLoading == 0;
}