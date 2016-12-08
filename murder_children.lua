
local MC_sprite_options = require "MC_sprite_options"
local math = require "math"

local murder_children = {}
local mc_table = { __index = murder_children }


function murder_children.new(n_type, n_health, n_soul_reward, n_cps_eaten, n_move_func, sprite_obj)

	local new_child = {}
	mc_type = n_type
	HP = n_health
	soul_reward = n_soul_reward
	cps_eaten = n_cps_eaten
	new_child.image = display.newImage(sprite_obj)
	
	local spawnX = 0
	local spawnY = 0

  --RNG used to spawn MC top(1), left(0), right(3), or bottom(4) of screen--
	local spawn_RNG = math.random(1, 4)
	if spawn_RNG == 1 then
		spawnX = 0
		spawnY = math.random(display.contentHeight)
	elseif spawn_RNG == 2 then	
		spawnX = math.random(display.contentWidth)
		spawnY = 0
	elseif spawn_RNG == 3 then
		spawnX = display.contentWidth
		spawnY = math.random(display.contentHeight)
	else
		spawnX = math.random(display.contentWidth)
		spawnY = display.contentHeight
	end	
	new_child.image.x = spawnX
	new_child.image.y = spawnY
	
	--cookie boundary
	local cookie_coordX_RNG = math.random(display.contentHeight*0.25, display.contentHeight*0.5)
	local cookie_coordY_RNG = math.random(display.contentWidth*0.40, display.contentWidth*0.75)
	
	local function move_MC( event )
	
		local t = event.time * 0.05
		
		local move_params =
		{
			x = cookie_coordX_RNG,
			y = cookie_coordY_RNG,
			time = 3000,
			transition = easing.linear,
		}
		
		transition.moveTo(new_child.image, move_params)
	end
	
	Runtime:addEventListener( "enterFrame", move_MC)
	
	local function mc_touch( event )
		if( event.phase == "ended" and HP > 0) then	
			HP = HP - 1
			print("tapped!")
		end	
	end
	new_child.image:addEventListener( "touch", mc_touch)

	if(HP <= 0) then
		display.remove( sprite_obj )
	end	
	
	
	return setmetatable (new_child, mc_table)
	
end

return murder_children
	
	
--[[
--called when the child is murdered
function murder_children:remove(m_c_table)
  
  --remove them from the screen
  display.remove(self.sprite)
  
  --remove references to thier table
  m_c_table = nil
  self = nil
  
end

]]--