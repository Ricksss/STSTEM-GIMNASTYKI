--[[
Bieznia: funckje zwiazane z bierznia pod serwer gry.

@author Dorian Skalski <arma99@o2.pl>
@copyright 2012-2013 Dorian Skalski <arma99@o2.pl>
@license GPLv2
@package SYSTEM-GIMNASTYKI
@link https://github.com/Ricksss/SYSTEM-GIMNASTYKI GitHub

]]--

--[[ Ricksss ]]--

local Ustal = 1
local Dodaj = 7

function elementClicked( theButton, theState, thePlayer )
if theButton == "left" and theState == "down" then
if getElementData(source, "Bieznia") == false and getElementData(source, "Zajete") == false then
if getElementType ( source ) == "object" and getElementModel ( source) == 2627 then
local x1,y1,z1 = getElementPosition(source)
 local rx,ry,rz = getObjectRotation (source)
setElementPosition ( thePlayer, x1,y1-0.5,z1+1 )
setElementRotation(thePlayer,rx,ry,rz)
setElementFrozen ( thePlayer,true )
local account = getPlayerAccount(thePlayer)
setElementData(source,"Bieznia",true)
setElementData(source,"Zajete",true)
 toggleControl ( thePlayer, "left", false ) 
  toggleControl ( thePlayer, "right", false )
   toggleControl ( thePlayer, "backwards", false ) 
   toggleControl ( thePlayer, "jump", false ) 
     toggleControl ( thePlayer, "crouch", false )  
     toggleControl ( thePlayer, "fire", false ) 	
     toggleControl ( thePlayer, "aim_weapon", false ) 	 
triggerClientEvent(thePlayer,"WlaczBieg", getRootElement())
else
end
elseif getElementData(source, "Bieznia") == true then
setElementData(source,"Bieznia",false) 
setPedAnimation(thePlayer,false)
setElementFrozen ( thePlayer,false )
setElementData(source,"Zajete",false)
local x1,y1,z1 = getElementPosition(source)
setElementPosition ( thePlayer, x1,y1-2,z1+1 )
setElementData(thePlayer,"Biegasz",0)
triggerClientEvent(thePlayer,"WylaczBieg", getRootElement())
 toggleControl ( thePlayer, "left", true ) 
  toggleControl ( thePlayer, "right", true )
   toggleControl ( thePlayer, "backwards", true ) 
   toggleControl ( thePlayer, "jump", true ) 
     toggleControl ( thePlayer, "crouch", true )  
     toggleControl ( thePlayer, "fire", true ) 	
     toggleControl ( thePlayer, "aim_weapon", true ) 	 
if isTimer ( Bieg ) then killTimer ( Bieg ) end
      end
	end
end
addEventHandler( "onElementClicked", getRootElement(), elementClicked )


function Bieznia(thePlayer,cmd,kont)
local x,y,z = getElementPosition( thePlayer )
Bieznia = createObject(2627,x,y,z-1,0,0,kont)
outputChatBox ( "Stworzyles Bieznie.",thePlayer,255,255,0 ) 
end
addCommandHandler("bieznia",Bieznia)	
