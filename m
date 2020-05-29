Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CB71E85F9
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 19:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgE2R5G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 13:57:06 -0400
Received: from asav22.altibox.net ([109.247.116.9]:39018 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgE2R5G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 13:57:06 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id B6E3E200A8;
        Fri, 29 May 2020 19:57:02 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v3 0/6] Generic USB Display driver
Date:   Fri, 29 May 2020 19:56:37 +0200
Message-Id: <20200529175643.46094-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=LvK8NEVc c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20 a=VwQbUJbxAAAA:8
        a=DMtxpE9c-qso5yFzpc8A:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
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
vid:pid. I have done a microcontroller implementation hack just to see
how that would work out[1] (which unconvered a couple of bugs in the
host driver).

The contents of the previous cover letter has been moved to the wiki[2]
since it was getting rather long.

I've made an image[3] with the gadget side set up for the Raspberry Pi
for easy testing. Patch 4 is the only one needed for the host side.

Merge plan
I'm hoping to apply the remaining drm_client patches in time for 5.9.
With that in place it's much easier to apply the patch for the USB
subsystem the following merge window (5.10). Doing both in the same
cycle is possible ofc, but due to the high rate of change in DRM this
_can_ turn out to be tricky. There's no hurry to get the gadget side
merged since I will provide images for the Raspberry Pi. The host driver
I hope to apply in time for 5.9.
Reviews and testing are very much welcome!

Changes since version 2:
- Use donated Openmoko USB pid: 1d50:614d
- Use direct compression from framebuffer when pitch matches, not only
  on full frames, so split updates can benefit
- Use __le16 in struct gud_drm_req_get_connector_status
- Set edid property when the device only provides edid
- Clear compression fields in struct gud_drm_req_set_buffer
- Fix protocol version negotiation
- Remove mode->vrefresh, it's calculated
- drm_client_init_from_id(): remove locking
- Applied reviewed patches, thanks Sam.

Dependency:
- backlight: Add backlight_device_get_by_name()[4]

Noralf.

[1] https://github.com/notro/gud/tree/master/STM32F769I-DISCO
[2] https://github.com/notro/gud/wiki
[3] https://github.com/notro/gud/wiki/rpi-image
[4] https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git/commit/?h=for-backlight-next&id=479da1f538a2f3547e15f9d5922c611b69ec2fbc


Noralf Trønnes (6):
  drm/client: Add drm_client_init_from_id()
  drm/client: Add drm_client_modeset_disable()
  drm/client: Add a way to set modeset, properties and rotation
  drm: Add Generic USB Display driver
  drm/gud: Add functionality for the USB gadget side
  usb: gadget: function: Add Generic USB Display support

 .../ABI/testing/configfs-usb-gadget-gud_drm   |   10 +
 MAINTAINERS                                   |   10 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/drm_client.c                  |   44 +-
 drivers/gpu/drm/drm_client_modeset.c          |  157 +++
 drivers/gpu/drm/gud/Kconfig                   |   20 +
 drivers/gpu/drm/gud/Makefile                  |    5 +
 drivers/gpu/drm/gud/gud_drm_connector.c       |  726 ++++++++++
 drivers/gpu/drm/gud/gud_drm_drv.c             |  648 +++++++++
 drivers/gpu/drm/gud/gud_drm_gadget.c          | 1167 +++++++++++++++++
 drivers/gpu/drm/gud/gud_drm_internal.h        |   65 +
 drivers/gpu/drm/gud/gud_drm_pipe.c            |  426 ++++++
 drivers/usb/gadget/Kconfig                    |   12 +
 drivers/usb/gadget/function/Makefile          |    2 +
 drivers/usb/gadget/function/f_gud_drm.c       |  678 ++++++++++
 include/drm/drm_client.h                      |   43 +-
 include/drm/gud_drm.h                         |  374 ++++++
 18 files changed, 4387 insertions(+), 3 deletions(-)
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

