--[[
Bieznia_C: funckje zwiazane z bierznia pod klienta gry.

@author Dorian Skalski <arma99@o2.pl>
@copyright 2012-2013 Dorian Skalski <arma99@o2.pl>
@license GPLv2
@package SYSTEM-GIMNASTYKI
@link https://github.com/Ricksss/SYSTEM-GIMNASTYKI GitHub

]]--

--[[ Ricksss ]]--


function onClientResourceStart( )	
drawnFonte = dxCreateFont( "Santana.ttf", 30 )
end
addEventHandler( "onClientResourceStart", getResourceRootElement( ), onClientResourceStart )


Dlugosc,Szerokosc = 1366,768
width,lenght = guiGetScreenSize ()




function Bieg()  
local Pokaz = math.ceil(Zaokraglaj(getElementData(getLocalPlayer(),"Biegasz"))/10)

local ST = getElementData(getLocalPlayer(),"Stamina") 
if Pokaz == 0 then
 dxDrawText("Aby biec nacisnij W/Spacje/alt+W.", 0.01, 0.3, 1113, 207, tocolor(150, 0, 0, 255), 1.00,drawnFonte, "center", "center", false, false, true, false, false)
 else
 
dxDrawText("Przebiegłes:"..Pokaz.." metry .",(16/Dlugosc)*width, (186/Szerokosc)*lenght, (441/Dlugosc)*width,(286/Szerokosc)*lenght, tocolor(255, 255, 255, 255), 1.00,drawnFonte, "left", "center", false, false, true, false, false)
 
 
dxDrawText("Karnet:Nie Dostepny\nStamina:"..ST,(16/Dlugosc)*width, (500/Szerokosc)*lenght, (441/Dlugosc)*width,(286/Szerokosc)*lenght, tocolor(255, 255, 255, 255), 1.00,drawnFonte, "center", "center", false, false, true, false, false)     
end
end
removeEventHandler ("onClientRender",getLocalPlayer(), Bieg )

function Interakcja()
if getElementData ( getLocalPlayer(), "Bieg", true ) then setElementData(getLocalPlayer(),"Bieg",0) end
if getElementData ( getLocalPlayer(), "Stamina", true ) then setElementData(getLocalPlayer(),"Stamina",0) end
if(getPedMoveState(getLocalPlayer()) == "jog") then
BiegLiczba = getElementData(getLocalPlayer(),"Biegasz")
setElementData(getLocalPlayer(),"Biegasz",BiegLiczba+0.100)
elseif(getPedMoveState(getLocalPlayer()) == "powerwalk") then
BiegLiczba = getElementData(getLocalPlayer(),"Biegasz")
setElementData(getLocalPlayer(),"Biegasz",BiegLiczba+0.200)
elseif(getPedMoveState(getLocalPlayer()) == "walk") then
BiegLiczba = getElementData(getLocalPlayer(),"Biegasz")
setElementData(getLocalPlayer(),"Biegasz",BiegLiczba+0.100)
elseif(getPedMoveState(getLocalPlayer()) == "sprint") then
BiegLiczba = getElementData(getLocalPlayer(),"Biegasz")
setElementData(getLocalPlayer(),"Biegasz",BiegLiczba+0.500)
BiegLiczba = getElementData(getLocalPlayer(),"Biegasz")
end
end



function WlaczBieg()
addEventHandler ("onClientRender",root, Bieg ) 
addEventHandler( "onClientRender", root, Interakcja )
local Pokaz = getElementData(getLocalPlayer(),"Biegasz") 
end
addEvent( "WlaczBieg", true )
addEventHandler( "WlaczBieg", getRootElement(), WlaczBieg)

function WylaczBieg()
removeEventHandler ("onClientRender",root, Bieg )
removeEventHandler ( "onClientRender", root, Interakcja )
end
addEvent( "WylaczBieg", true )
addEventHandler( "WylaczBieg", getRootElement(), WylaczBieg)



function Zaokraglaj(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end
