# This uses http://potrace.sourceforge.net/
# and http://rmagick.rubyforge.org/
require 'rubygems'
require 'rmagick'
require 'potracer'

img = Magick::Image::read("house.jpg")[0]
# img = img.quantize(2, Magick::GRAYColorspace).adaptive_blur.adaptive_blur
img.write("changed.bmp")

`mkbitmap changed.bmp --filter 1 --threshold 0.5`
`potrace changed.pbm -o out.svg --svg --width 6 --turdsize 300`


# File.open('out.svg', 'w+') do |f|
#   # bmp, width, height, map
#   f.write Potracer::Trace.bitmap(img.export_pixels_to_str, img.columns, img.rows).to_svg
# end