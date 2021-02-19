Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0366931F952
	for <lists+linux-usb@lfdr.de>; Fri, 19 Feb 2021 13:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhBSMSQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Feb 2021 07:18:16 -0500
Received: from asav21.altibox.net ([109.247.116.8]:50372 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhBSMSN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Feb 2021 07:18:13 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id 6E45680173;
        Fri, 19 Feb 2021 13:17:08 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v6 0/3] GUD USB Display driver
Date:   Fri, 19 Feb 2021 13:16:59 +0100
Message-Id: <20210219121702.50964-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Kb38TzQD c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20
        a=hV_BJ6Dg7UyOQLaYyLEA:9 a=QEXdDO2ut3YA:10 a=7zwkRhCwzGnCyznlyk9i:22
        a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
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
- Use obj-y in Makefile (Peter)
- Fix missing le32_to_cpu() when using GUD_DISPLAY_MAGIC (Peter)
- Set initial brightness on backlight device


Noralf.

[1] https://github.com/notro/gud/wiki


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
 drivers/gpu/drm/gud/gud_connector.c | 738 ++++++++++++++++++++++++++++
 drivers/gpu/drm/gud/gud_drv.c       | 625 +++++++++++++++++++++++
 drivers/gpu/drm/gud/gud_internal.h  | 149 ++++++
 drivers/gpu/drm/gud/gud_pipe.c      | 475 ++++++++++++++++++
 include/drm/gud.h                   | 356 ++++++++++++++
 include/uapi/drm/drm_mode.h         |   1 +
 13 files changed, 2380 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/gud/Kconfig
 create mode 100644 drivers/gpu/drm/gud/Makefile
 create mode 100644 drivers/gpu/drm/gud/gud_connector.c
 create mode 100644 drivers/gpu/drm/gud/gud_drv.c
 create mode 100644 drivers/gpu/drm/gud/gud_internal.h
 create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
 create mode 100644 include/drm/gud.h

-- 
2.23.0

