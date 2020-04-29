Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB371BDCD1
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 14:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgD2M57 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 08:57:59 -0400
Received: from asav21.altibox.net ([109.247.116.8]:58738 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgD2M57 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 08:57:59 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id 7CA368006B;
        Wed, 29 Apr 2020 14:48:49 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 00/10] Generic USB Display driver
Date:   Wed, 29 Apr 2020 14:48:20 +0200
Message-Id: <20200429124830.27475-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=AvXAIt1P c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=jJrOw3FHAAAA:8 a=WFZIRff2AAAA:8
        a=e5mUnYsNAAAA:8 a=twVsftmionqB-JyugOAA:9 a=QEXdDO2ut3YA:10
        a=-FEs8UIgK8oA:10 a=NWVoK91CQyQA:10 a=lsIkP6lG2H4f0j7eDx0G:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

A while back I had the idea to turn a Raspberry Pi Zero into a $5
USB to HDMI/SDTV/DSI/DPI display adapter.

This series adds a USB host driver and a device/gadget driver to achieve
that.

The reason for calling it 'Generic' is so anyone can make a USB
display/adapter against this driver, all that's needed is to add a USB
vid:pid. I was hoping to have someone working on a microcontroller based
USB display by now, but unfortunately that has been delayed. It would
have been nice to have a microcontroller implementation to ensure that I
haven't made things unnecessary difficult to implement.

Performance
The one thing that decides how useful this all is, is how smooth an
experience it gives. My hope was that it should not be noticeably laggy
with ordinary office use on 1920x1080@RG16. I'm pleased to see that it's
also possible to watch youtube movies, although not in fullscreen.

Some of the main factors that affects performance:
- Display resolution
- Userspace providing damage reports (FB_DAMAGE_CLIPS or
DRM_IOCTL_MODE_DIRTYFB)
- Color depth (DRM_CAP_DUMB_PREFERRED_DEPTH = 16 if RGB565)
- How well the frames compress (lz4)
- Gadget device memory bandwidth, CPU power for decompression
- (Big endian hosts will have to do byte swapping on the frames)

I've tested these:
- xorg-server on Pi4. This was nice and smooth since it uses
DRM_IOCTL_MODE_DIRTYFB and honours DRM_CAP_DUMB_PREFERRED_DEPTH.
- Ubuntu 20.04 GNOME on x86. This was useable, but not so good for
movies. GNOME doesn't look at DRM_CAP_DUMB_PREFERRED_DEPTH and doesn't
set FB_DAMAGE_CLIPS on the pageflips.

I've made a short video to show what it looks like[1].

I have used a Pi4 as the gadget during development since it has much
better memory bandwith (4000 vs 200 MBps)[2] and CPU than the PiZ. They
both have the same gadget controller (dwc2).

I did an RFC [3] of this 2 months ago where I looked at doing a Multi
Function USB device. I gave up on that when I realised how much work the
review process would be. So I stripped down to my original idea. I have
made sure that the drivers will tolerate another USB interface of type
VENDOR, so it's still possible for the display to be part of a multi
function device.

Noralf.

[1] https://youtu.be/AhGZWwUm8JU
[2] https://magpi.raspberrypi.org/articles/raspberry-pi-specs-benchmarks
[3] https://patchwork.freedesktop.org/series/73508/


Noralf Trønnes (10):
  backlight: Add backlight_device_get_by_name()
  drm: Add backlight helper
  drm/client: Add drm_client_init_from_id()
  drm/client: Add drm_client_framebuffer_flush()
  drm/client: Add drm_client_modeset_check()
  drm/client: Add a way to set modeset, properties and rotation
  drm/format-helper: Add drm_fb_swab()
  drm: Add Generic USB Display driver
  drm/gud: Add functionality for the USB gadget side
  usb: gadget: function: Add Generic USB Display support

 .../ABI/testing/configfs-usb-gadget-gud_drm   |   10 +
 Documentation/gpu/drm-kms-helpers.rst         |    6 +
 MAINTAINERS                                   |   10 +
 drivers/gpu/drm/Kconfig                       |    9 +
 drivers/gpu/drm/Makefile                      |    2 +
 drivers/gpu/drm/drm_backlight_helper.c        |  154 +++
 drivers/gpu/drm/drm_client.c                  |   79 +-
 drivers/gpu/drm/drm_client_modeset.c          |  174 ++-
 drivers/gpu/drm/drm_format_helper.c           |   61 +-
 drivers/gpu/drm/drm_mipi_dbi.c                |    2 +-
 drivers/gpu/drm/gud/Kconfig                   |   20 +
 drivers/gpu/drm/gud/Makefile                  |    5 +
 drivers/gpu/drm/gud/gud_drm_connector.c       |  629 +++++++++
 drivers/gpu/drm/gud/gud_drm_drv.c             |  624 +++++++++
 drivers/gpu/drm/gud/gud_drm_gadget.c          | 1169 +++++++++++++++++
 drivers/gpu/drm/gud/gud_drm_internal.h        |   66 +
 drivers/gpu/drm/gud/gud_drm_pipe.c            |  423 ++++++
 drivers/usb/gadget/Kconfig                    |   12 +
 drivers/usb/gadget/function/Makefile          |    2 +
 drivers/usb/gadget/function/f_gud_drm.c       |  678 ++++++++++
 drivers/video/backlight/backlight.c           |   21 +
 include/drm/drm_backlight_helper.h            |    9 +
 include/drm/drm_client.h                      |   44 +-
 include/drm/drm_connector.h                   |   10 +
 include/drm/drm_format_helper.h               |    4 +-
 include/drm/gud_drm.h                         |  369 ++++++
 include/linux/backlight.h                     |    1 +
 27 files changed, 4563 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-usb-gadget-gud_drm
 create mode 100644 drivers/gpu/drm/drm_backlight_helper.c
 create mode 100644 drivers/gpu/drm/gud/Kconfig
 create mode 100644 drivers/gpu/drm/gud/Makefile
 create mode 100644 drivers/gpu/drm/gud/gud_drm_connector.c
 create mode 100644 drivers/gpu/drm/gud/gud_drm_drv.c
 create mode 100644 drivers/gpu/drm/gud/gud_drm_gadget.c
 create mode 100644 drivers/gpu/drm/gud/gud_drm_internal.h
 create mode 100644 drivers/gpu/drm/gud/gud_drm_pipe.c
 create mode 100644 drivers/usb/gadget/function/f_gud_drm.c
 create mode 100644 include/drm/drm_backlight_helper.h
 create mode 100644 include/drm/gud_drm.h

-- 
2.23.0

