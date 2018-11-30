# -*- coding: utf-8 -*-

# Scrapy settings for prejus project

BOT_NAME = 'prejus'

SPIDER_MODULES = ['prejus.spiders']
NEWSPIDER_MODULE = 'prejus.spiders'

ROBOTSTXT_OBEY = False

SPLASH_URL = 'http://localhost:8050'
DOWNLOADER_MIDDLEWARES = {
    'scrapy_splash.SplashCookiesMiddleware': 723,
    'scrapy_splash.SplashMiddleware': 725,
    'scrapy.downloadermiddlewares.httpcompression.HttpCompressionMiddleware': 810,
}
SPIDER_MIDDLEWARES = {'scrapy_splash.SplashDeduplicateArgsMiddleware': 100}
DUPEFILTER_CLASS = 'scrapy_splash.SplashAwareDupeFilter'
