# -*- coding: utf-8 -*-
from scrapy_splash import SplashRequest

import scrapy


class PortaltransparenciaSpider(scrapy.Spider):
    name = 'portaltransparencia'
    allowed_domains = ['www.portaltransparencia.jus.br']

    def start_requests(self):
        url = 'http://www.portaltransparencia.jus.br/'
        yield SplashRequest(url, self.parse, args={'wait': 3})

    def parse(self, response):
        from scrapy.utils.response import open_in_browser as view

        __import__('pdb').set_trace()
        # view(response)

        # QvCaptiontext
