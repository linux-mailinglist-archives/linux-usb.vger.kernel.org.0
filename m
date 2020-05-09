Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8471CC212
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 16:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgEIOQq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 10:16:46 -0400
Received: from asav22.altibox.net ([109.247.116.9]:34064 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbgEIOQp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 May 2020 10:16:45 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id DA0AB2016E;
        Sat,  9 May 2020 16:16:40 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        lee.jones@linaro.org
Cc:     sam@ravnborg.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 00/10] Generic USB Display driver
Date:   Sat,  9 May 2020 16:16:09 +0200
Message-Id: <20200509141619.32970-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=R7It5+ZX c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=jJrOw3FHAAAA:8 a=WFZIRff2AAAA:8
        a=HXlmT91Db-D9ln0eR_kA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10
        a=NWVoK91CQyQA:10 a=lsIkP6lG2H4f0j7eDx0G:22
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
- USB2 vs. USB3
- Gadget device memory bandwidth, CPU power for decompression
- (Big endian hosts will have to do byte swapping on the frames)

I've tested these:
- xorg-server on Pi4. This was nice and smooth since it uses
  DRM_IOCTL_MODE_DIRTYFB and honours DRM_CAP_DUMB_PREFERRED_DEPTH.
- Ubuntu 20.04 GNOME on x86. This was useable, but not so good for
  movies. GNOME doesn't look at DRM_CAP_DUMB_PREFERRED_DEPTH and doesn't
  set FB_DAMAGE_CLIPS on the pageflips.

I've made a short video to show what it looks like[1].

Tearing

Host side
Compression and transfer happens in an async worker.
There are 2 tearing cases here:
1. The framebuffer fits in the kmalloc'ed transfer buffer, max 4MB by
   default (KMALLOC_MAX_SIZE). This can give occasional tearing when
   userspace gets ahead of the worker.
2. The framebuffer doesn't fit in the transfer buffer, so the host
   splits the transfer. When showing a movie this will almost always give
   tearing between each part of the frame.
   Fix: The device can increase KMALLOC_MAX_SIZE by setting
   CONFIG_FORCE_MAX_ZONEORDER since it probably has a custom kernel
   anyways. The host distro can't/won't do that, so I have look for
   solution here.
The host side tearing is worse than the device side, because it lasts
longer.

Device side
Received updates are decompressed/copied into the framebuffer that's
being scanned out, so tearing is possible. Double buffering/page
flipping could be used for full frames, but well behaving userspace
doesn't send many of those, so very little impact. Double buffering on
all updates would require memcpy between buffers locally, hampering
performance. Maybe a Pi4 could get away with it, but a Pi Zero would
certainly not (memory bandwidth).

I've tested this series with usbip[2] by connecting 2 Pi4's over cabled
gigabit network. It worked fine.

One use case for these drivers is reusing old tablets and cell phones as
USB displays.

The Pi4 has two hdmi ports and I was asked if the driver supports that,
and I've concluded that it would be too much work to implement at this
point. It is possible to extend the protocol and implement it later.

I have used a Pi4 as the gadget device during development since it has
much better memory bandwith (4000 vs 200 MBps)[3] and CPU than the Pi
Zero. They both have the same gadget controller (dwc2).

Changes in this version:
- Drop drm_backlight_helper
- Use devm_drm_dev_alloc()
- Addressed Sam's comments


Noralf.

[1] https://youtu.be/AhGZWwUm8JU
[2] tools/usb/usbip/README
[3] https://magpi.raspberrypi.org/articles/raspberry-pi-specs-benchmarks


Noralf Trønnes (10):
  backlight: Add backlight_device_get_by_name()
  drm/client: Add drm_client_init_from_id()
  drm/client: Add drm_client_framebuffer_flush()
  drm/client: Add drm_client_modeset_check()
  drm/client: Add drm_client_modeset_disable()
  drm/client: Add a way to set modeset, properties and rotation
  drm/format-helper: Add drm_fb_swab()
  drm: Add Generic USB Display driver
  drm/gud: Add functionality for the USB gadget side
  usb: gadget: function: Add Generic USB Display support

 .../ABI/testing/configfs-usb-gadget-gud_drm   |   10 +
 MAINTAINERS                                   |   10 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/drm_client.c                  |   81 +-
 drivers/gpu/drm/drm_client_modeset.c          |  192 ++-
 drivers/gpu/drm/drm_format_helper.c           |   61 +-
 drivers/gpu/drm/drm_mipi_dbi.c                |    2 +-
 drivers/gpu/drm/gud/Kconfig                   |   20 +
 drivers/gpu/drm/gud/Makefile                  |    5 +
 drivers/gpu/drm/gud/gud_drm_connector.c       |  724 ++++++++++
 drivers/gpu/drm/gud/gud_drm_drv.c             |  641 +++++++++
 drivers/gpu/drm/gud/gud_drm_gadget.c          | 1165 +++++++++++++++++
 drivers/gpu/drm/gud/gud_drm_internal.h        |   66 +
 drivers/gpu/drm/gud/gud_drm_pipe.c            |  423 ++++++
 drivers/usb/gadget/Kconfig                    |   12 +
 drivers/usb/gadget/function/Makefile          |    2 +
 drivers/usb/gadget/function/f_gud_drm.c       |  678 ++++++++++
 drivers/video/backlight/backlight.c           |   21 +
 include/drm/drm_client.h                      |   45 +-
 include/drm/drm_format_helper.h               |    4 +-
 include/drm/gud_drm.h                         |  377 ++++++
 include/linux/backlight.h                     |    1 +
 23 files changed, 4513 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-usb-gadget-gud_drm
 create mode 100644 drivers/gpu/drm/gud/Kconfig
 create mode 100644 drivers/gpu/drm/gud/Makefile
 create mode 100644 drivers/gpu/drm/gud/gud_drm_connector.c
 create mode 100644 drivers/gpu/drm/gud/gud_drm_drv.c
 create mode 100644 drivers/gpu/drm/gud/gud_drm_gadget.c
 create mode 100644 drivers/gpu/drm/gud/gud_drm_internal.h
 create mode 100644 drivers/gpu/drm/gud/gud_drm_pipe.c
 create mode 100644 drivers/usb/gadget/function/f_gud_drm.c
 create mode 100644 include/drm/gud_drm.h

-- 
2.23.0

