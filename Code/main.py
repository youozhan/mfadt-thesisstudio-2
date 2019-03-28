#!/usr/bin/python
# -*- coding:utf-8 -*-

import epd2in13b
import time
from PIL import Image,ImageDraw,ImageFont
import traceback

try:
    epd = epd2in13b.EPD()
    epd.init()
    print("Clear...")
    epd.Clear()
    
    print "Drawing"
    # Drawing on the Horizontal image
    HBlackimage = Image.new('1', (epd2in13b.EPD_HEIGHT, epd2in13b.EPD_WIDTH), 255)  # 298*126
    HRedimage = Image.new('1', (epd2in13b.EPD_HEIGHT, epd2in13b.EPD_WIDTH), 255)  # 298*126    
    
    drawblack = ImageDraw.Draw(HBlackimage)
    # drawred = ImageDraw.Draw(HRedimage)
    font18 = ImageFont.truetype('/usr/share/fonts/truetype/freefont/FreeSansBold.ttf', 18)
    font12 = ImageFont.truetype('/usr/share/fonts/truetype/freefont/FreeSansBold.ttf', 12)
    font10 = ImageFont.truetype('/usr/share/fonts/truetype/freefont/FreeSansBold.ttf', 10)
    drawblack.text((10, 20), 'Multilevel Marketing:', font = font18, fill = 0)  
    drawblack.text((10, 40), 'Last Week Tonight with John Oliver (HBO)', font = font12, fill = 0)
    drawblack.text((10, 60), '16048551 views, 197418 likes', font = font10, fill = 0)
    epd.display(epd.getbuffer(HBlackimage.rotate(180)), epd.getbuffer(HRedimage.rotate(180)))
    # time.sleep(2)
    
    # print "read bmp file on window"
    # blackimage1 = Image.new('1', (epd2in13b.EPD_HEIGHT, epd2in13b.EPD_WIDTH), 255)  # 298*126
    # redimage1 = Image.new('1', (epd2in13b.EPD_HEIGHT, epd2in13b.EPD_WIDTH), 255)  # 298*126    
    # newimage = Image.open('100x100.bmp')
    # blackimage1.paste(newimage, (50,0))    
    # epd.display(epd.getbuffer(blackimage1), epd.getbuffer(redimage1))
    
    epd.sleep()
        
except:
    print('traceback.format_exc():\n%s',traceback.format_exc())
    exit()
