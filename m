Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB3341604F9
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 18:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbgBPR1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 12:27:06 -0500
Received: from asav22.altibox.net ([109.247.116.9]:50780 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbgBPR1G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 12:27:06 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 43359200E1;
        Sun, 16 Feb 2020 18:21:38 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio, display, ...)
Date:   Sun, 16 Feb 2020 18:21:08 +0100
Message-Id: <20200216172117.49832-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZvHD1ezG c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=0GFqvFEQP_9VLyYywQIA:9
        a=QEXdDO2ut3YA:10
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

A while back I had the idea to turn a Raspberry Pi Zero into a $5
USB to HDMI/SDTV/DSI/DPI display adapter.

Thinking about how to represent the display to the driver I realised
that hardware use registers as API. And Linux does have a generic
register abstraction: regmap. Furthermore this means that if I can do a
regmap over USB implementation, it will be easy to do other functions
like gpio, adc and others. After a few iterations trying to understand
the USB subsystem and satisfying driver requirements, I now have
something that looks promising.

I'm sending out an early version hoping to get feedback especially on
the core parts that handles regmap and interrupts.

Overview:

          USB Host          :         USB Device
                            :
            --------------  :  ------------------
----------  | mfd: mud   |  :  | f_mud          |  ----------
| Driver |  --------------  :  |                |  | Driver |
----------  | regmap-usb |  :  | (mud_regmap)   |  ----------
            --------------  :  ------------------


I've attached 2 drivers:
- gpio/pinctrl: is more or less finished
- display: needs a lot more work


USB3 device
I've only tested this with usb2 devices (Pi, BBB) so I should get myself
a usb3 gadget capable board. My searching didn't turn up much, so this
seems to be quite rare. ROCK960 has USB 3.0 type C OTG but the price is
$139 which is a bit expensive for this hobby project. Does anyone know
of a cheap board?

Noralf.


Noralf Trønnes (9):
  regmap: Add USB support
  mfd: Add driver for Multifunction USB Device
  usb: gadget: function: Add Multifunction USB Device support
  pinctrl: Add Multifunction USB Device pinctrl driver
  usb: gadget: function: mud: Add gpio support
  regmap: Speed up _regmap_raw_write_impl() for large buffers
  drm: Add Multifunction USB Device display driver
  drm/client: Add drm_client_init_from_id() and drm_client_modeset_set()
  usb: gadget: function: mud: Add display support

 drivers/base/regmap/Kconfig              |    8 +-
 drivers/base/regmap/Makefile             |    1 +
 drivers/base/regmap/regmap-usb.c         | 1026 ++++++++++++++++++
 drivers/base/regmap/regmap.c             |   10 +-
 drivers/gpu/drm/Kconfig                  |    2 +
 drivers/gpu/drm/Makefile                 |    1 +
 drivers/gpu/drm/drm_client.c             |   37 +
 drivers/gpu/drm/drm_client_modeset.c     |   52 +
 drivers/gpu/drm/mud/Kconfig              |   18 +
 drivers/gpu/drm/mud/Makefile             |    4 +
 drivers/gpu/drm/mud/mud_drm.c            | 1198 ++++++++++++++++++++++
 drivers/gpu/drm/mud/mud_drm.h            |  137 +++
 drivers/gpu/drm/mud/mud_drm_gadget.c     |  889 ++++++++++++++++
 drivers/mfd/Kconfig                      |    8 +
 drivers/mfd/Makefile                     |    1 +
 drivers/mfd/mud.c                        |  580 +++++++++++
 drivers/pinctrl/Kconfig                  |    9 +
 drivers/pinctrl/Makefile                 |    1 +
 drivers/pinctrl/pinctrl-mud.c            |  657 ++++++++++++
 drivers/pinctrl/pinctrl-mud.h            |   89 ++
 drivers/usb/gadget/Kconfig               |   36 +
 drivers/usb/gadget/function/Makefile     |    6 +
 drivers/usb/gadget/function/f_mud.c      |  913 +++++++++++++++++
 drivers/usb/gadget/function/f_mud.h      |  210 ++++
 drivers/usb/gadget/function/f_mud_drm.c  |  181 ++++
 drivers/usb/gadget/function/f_mud_pins.c |  962 +++++++++++++++++
 drivers/usb/gadget/function/mud_regmap.c |  936 +++++++++++++++++
 include/drm/drm_client.h                 |    4 +
 include/linux/mfd/mud.h                  |   16 +
 include/linux/regmap.h                   |   23 +
 include/linux/regmap_usb.h               |   97 ++
 31 files changed, 8107 insertions(+), 5 deletions(-)
 create mode 100644 drivers/base/regmap/regmap-usb.c
 create mode 100644 drivers/gpu/drm/mud/Kconfig
 create mode 100644 drivers/gpu/drm/mud/Makefile
 create mode 100644 drivers/gpu/drm/mud/mud_drm.c
 create mode 100644 drivers/gpu/drm/mud/mud_drm.h
 create mode 100644 drivers/gpu/drm/mud/mud_drm_gadget.c
 create mode 100644 drivers/mfd/mud.c
 create mode 100644 drivers/pinctrl/pinctrl-mud.c
 create mode 100644 drivers/pinctrl/pinctrl-mud.h
 create mode 100644 drivers/usb/gadget/function/f_mud.c
 create mode 100644 drivers/usb/gadget/function/f_mud.h
 create mode 100644 drivers/usb/gadget/function/f_mud_drm.c
 create mode 100644 drivers/usb/gadget/function/f_mud_pins.c
 create mode 100644 drivers/usb/gadget/function/mud_regmap.c
 create mode 100644 include/linux/mfd/mud.h
 create mode 100644 include/linux/regmap_usb.h

-- 
2.23.0

