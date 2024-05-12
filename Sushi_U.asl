state("Sushi_U-Win64-Shipping")
{
    int souls : "Sushi_U-Win64-Shipping.exe", 0x068C2310, 0x10, 0xC4;
    int garis : "Sushi_U-Win64-Shipping.exe", 0x068C6528, 0x1B8, 0x24C;
    int layers : "Sushi_U-Win64-Shipping.exe", 0x068C2D30, 0xE8, 0x228;
    double mouse : "Sushi_U-Win64-Shipping.exe", 0x068C6528, 0x1B8, 0x268;
}

startup
{
    settings.Add("tutorial",false,"Split when clearing tutorial");
}

start
{
    return current.souls == 0 && current.garis == 0 && old.layers == 2 && current.layers == 0;
}

split
{
    if(settings["tutorial"] && old.garis == 0 && current.garis > 0 && current.souls == 0 && old.mouse != 0){
        return true;
    }
    return old.souls + 1 == current.souls;
}

isLoading
{
    return current.mouse == 0;
}

reset
{
    return current.souls == 0 && current.garis == 0 && old.layers == 0 && current.layers == 2 && old.mouse == 0 && current.mouse != 0;
}
