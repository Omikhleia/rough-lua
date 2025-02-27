-- The library requires Penlight as global variable "pl" to work.
pl = require("pl.import_into")()

-- Load RoughGenerator
local RoughGenerator = require("rough-lua.rough.generator").RoughGenerator

-- Instantiate it
local gen = RoughGenerator()

-- Draw a rectangle, a circle and a polygon
local rect = gen:rectangle(50 , 10 , 140, 50, {
  fill = 'rgb(106, 35, 182)',
  fillStyle = 'zigzag',
  stroke = 'rgb(51, 43, 108)',
  strokeWidth = 1,
  disableMultiStroke = false,
  disableMultiStrokeFill = true,
})
local circ = gen:circle(45, 75, 75, {
  fill = 'rgb(186, 67, 67)',
  fillStyle = 'cross-hatch',
  stroke = 'rgb(106, 31, 31)',
  strokeWidth = 1,
  disableMultiStroke = true,
})
local poly = gen:polygon({
  {110, 60},
  {150, 40},
  {160, 90},
  {140, 130},
  {110, 140},
  {80, 110},
  {90, 70},
}, {
  fill = 'rgb(31, 179, 43)',
  fillStyle = 'hachure',
  stroke = 'rgb(40, 106, 31)',
  strokeWidth = 1,
  disableMultiStroke = false,
  disableMultiStrokeFill = true,
  preserveVertices = true,
})

-- Convert the shapes to SVG
local rect_path = gen:toPaths(rect)
local circ_path = gen:toPaths(circ)
local poly_path = gen:toPaths(poly)
local svg = {}
table.insert(svg, '<svg xmlns="http://www.w3.org/2000/svg" width="200" height="150">')
for _, v in ipairs(rect_path) do
  table.insert(svg, '<path d="' .. v.d .. '" fill="' .. v.fill .. '" stroke="' .. v.stroke .. '" stroke-width="' .. v.strokeWidth .. '" />')
end
for _, v in ipairs(circ_path) do
  table.insert(svg, '<path d="' .. v.d .. '" fill="' .. v.fill .. '" stroke="' .. v.stroke .. '" stroke-width="' .. v.strokeWidth .. '" />')
end
for _, v in ipairs(poly_path) do
  table.insert(svg, "<path d=\"" .. v.d .. "\" fill=\"" .. v.fill .. "\" stroke=\"" .. v.stroke .. "\" stroke-width=\"" .. v.strokeWidth .. "\" />")
end
table.insert(svg, '</svg>')
local svg_str = table.concat(svg, '\n')

print(svg_str)
