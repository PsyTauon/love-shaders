function love.load()
    image = love.graphics.newImage("image.png")
    shader = love.graphics.newShader("ripple.glsl")
    time = 0

    rippleCenterX, rippleCenterY = 200, 200
end

function love.update(dt)
    time = time + dt

    shader:send("time", time)
    shader:send("center", {rippleCenterX, rippleCenterY})
    shader:send("resolution", {love.graphics.getWidth(), love.graphics.getHeight()})
end

function love.draw()
    love.graphics.setShader(shader)
    love.graphics.draw(image, 0, 0)
    love.graphics.setShader()
end