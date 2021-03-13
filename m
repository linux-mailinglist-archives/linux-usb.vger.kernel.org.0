Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA93339DC7
	for <lists+linux-usb@lfdr.de>; Sat, 13 Mar 2021 12:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbhCML0M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Mar 2021 06:26:12 -0500
Received: from asav21.altibox.net ([109.247.116.8]:54130 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhCML0G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Mar 2021 06:26:06 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id B13BE8003A;
        Sat, 13 Mar 2021 12:25:57 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v8 0/3] GUD USB Display driver
Date:   Sat, 13 Mar 2021 12:25:42 +0100
Message-Id: <20210313112545.37527-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20 a=e5mUnYsNAAAA:8
        a=YwjdnX4TFwikY6-GU-cA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

A while back I had the idea to turn a Raspberry Pi Zero into a $5
USB to HDMI/SDTV/DPI display adapter.

The protocol is open so people are free to make displays implementing it and
use this driver, all that's needed is to add a USB vid:pid to the driver for
the display.

See the wiki[1] for more information and images for the Raspberry Pi Zero/4.

Changes in this version:
- Forgot to filter RGB111 from reaching userspace
- Handle a device that only returns unknown device properties (Peter)
- s/GUD_PIXEL_FORMAT_RGB111/GUD_PIXEL_FORMAT_XRGB1111/ (Peter)
- Fix R1 and XRGB1111 format conversion
- Add FIXME about Big Endian being broken (Peter, Ilia)

I will apply the patches as soon as the dependency shows up in drm-misc-next.

Dependency:
drm: Use USB controller's DMA mask when importing dmabufs[2]
(currently in drm-misc-fixes but not in drm-misc-next yet, also present in
drm-tip and linux-next)

Noralf.

[1] https://github.com/notro/gud/wiki
[2] https://patchwork.freedesktop.org/patch/msgid/20210303133229.3288-1-tzimmermann@suse.de


Noralf Trønnes (3):
  drm/uapi: Add USB connector type
  drm/probe-helper: Check epoch counter in output_poll_execute()
  drm: Add GUD USB Display driver

 MAINTAINERS                         |   8 +
 drivers/gpu/drm/Kconfig             |   2 +
 drivers/gpu/drm/Makefile            |   1 +
 drivers/gpu/drm/drm_connector.c     |   1 +
 drivers/gpu/drm/drm_probe_helper.c  |   7 +-
 drivers/gpu/drm/gud/Kconfig         |  14 +
 drivers/gpu/drm/gud/Makefile        |   4 +
 drivers/gpu/drm/gud/gud_connector.c | 729 ++++++++++++++++++++++++++++
 drivers/gpu/drm/gud/gud_drv.c       | 661 +++++++++++++++++++++++++
 drivers/gpu/drm/gud/gud_internal.h  | 154 ++++++
 drivers/gpu/drm/gud/gud_pipe.c      | 552 +++++++++++++++++++++
 include/drm/gud.h                   | 333 +++++++++++++
 include/uapi/drm/drm_mode.h         |   1 +
 13 files changed, 2466 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/gud/Kconfig
 create mode 100644 drivers/gpu/drm/gud/Makefile
 create mode 100644 drivers/gpu/drm/gud/gud_connector.c
 create mode 100644 drivers/gpu/drm/gud/gud_drv.c
 create mode 100644 drivers/gpu/drm/gud/gud_internal.h
 create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
 create mode 100644 include/drm/gud.h

-- 
2.23.0

