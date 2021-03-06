--local murder_children = require "murder_children"

local atlas = {}

local spoopy_options =
{
  frames =
  {
    { -- frame 1
      x = 0,
      y = 0,
      width = 20,
      height = 26
    }--[[,
    { -- frame 2
      x = 16,
      y = 0,
      width = 16,
      height = 26  
    } ]]--
  }

}

--frame settings for each type of MC
local basic_mc_options =
{
  width = 100,
  height = 100,
  numFrames = 2
--[[frames =
  {
    { --frame 1; final sprite will have more frames
      x = 0,
      y = 0,
      width = 100,
      height = 100
    }
  }]]--
}
local super_mc_options = {}
local sneaky_mc_options = {}
local fat_mc_options = {
  width = 200,
  height = 200,
  numFrames = 1, 
  }

atlas.sequences_basicMC = {

{
  name = "move",
  start = 1,
  count = 2,
  time = 1000,
  loopCount = 0,
  loopDirection = "bounce"
}
}

--set the sprite settings to the options above
atlas.basic_mc_sheet  = graphics.newImageSheet("resources/basic_MC.png", basic_mc_options)
atlas.spoopySheet     = graphics.newImageSheet("resources/spoopyer.png", spoopy_options)
local super_mc_sheet  = nil
local sneaky_mc_sheet = nil
fat_mc_sheet          = graphics.newImageSheet("resources/fat_mc.png"), fat_mc_options)

--temporary testing-- --set these to the 'sprite' parameter--
--atlas.basic_MC  = display.newImage(basic_mc_sheet, 1)
atlas.super_MC  = nil
atlas.sneaky_MC = nil
atlas.fat_MC    = {
  name = "",
}

return atlas
