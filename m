Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E1C32F01B
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 17:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhCEQbk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 11:31:40 -0500
Received: from asav21.altibox.net ([109.247.116.8]:37690 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbhCEQbY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 11:31:24 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id 3F3268016B;
        Fri,  5 Mar 2021 17:31:12 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v7 0/3] GUD USB Display driver
Date:   Fri,  5 Mar 2021 17:31:01 +0100
Message-Id: <20210305163104.30756-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20 a=e5mUnYsNAAAA:8
        a=YwjdnX4TFwikY6-GU-cA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
        a=BPzZvq435JnGatEyYwdK:22 a=pHzHmUro8NiASowvMSCR:22
        a=Ew2E2A-JSTLzCXPT_086:22
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
- LZ4_compress_default() can return zero, check for that
- Fix memory leak in gud_pipe_check() error path (Peter)
- Improve debug and error messages (Peter)
- Don't pass length in protocol structs (Peter)
- Pass USB interface to gud_usb_control_msg() et al. (Peter)
- Improve gud_connector_fill_properties() (Peter)
- Add GUD_PIXEL_FORMAT_RGB111 (Peter)
- Remove GUD_REQ_SET_VERSION (Peter)
- Fix DRM_IOCTL_MODE_OBJ_SETPROPERTY and the rotation property
- Fix dma-buf import (Thomas)

Note: There are several changes to the protocol.

I plan to apply the patches in a week or so unless something turns out to be
broken.

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
 drivers/gpu/drm/gud/gud_drv.c       | 659 +++++++++++++++++++++++++
 drivers/gpu/drm/gud/gud_internal.h  | 154 ++++++
 drivers/gpu/drm/gud/gud_pipe.c      | 535 ++++++++++++++++++++
 include/drm/gud.h                   | 333 +++++++++++++
 include/uapi/drm/drm_mode.h         |   1 +
 13 files changed, 2447 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/gud/Kconfig
 create mode 100644 drivers/gpu/drm/gud/Makefile
 create mode 100644 drivers/gpu/drm/gud/gud_connector.c
 create mode 100644 drivers/gpu/drm/gud/gud_drv.c
 create mode 100644 drivers/gpu/drm/gud/gud_internal.h
 create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
 create mode 100644 include/drm/gud.h

-- 
2.23.0

