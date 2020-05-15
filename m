Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DBC1D4952
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgEOJVX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:21:23 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:42418 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgEOJVW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589534482; x=1621070482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=WgkHpKxo9RD0c8kLRLewmCDgFfeEeyTT+ncvhvCYTWg=;
  b=ycLBa1qb+oLlRrE2mGwTUUgt/F01lo/HSN6NGvTxjNXAr/mC/Z6IFLwi
   jD3HkkLwvtaDbEhJtHzCDy7pIu/XXUmUQd+Gw+Hk3wtT7cYY9oZbWfond
   CWMhGGsNxz29X/Moz5kzquZ2McYS3cqxxhopWLNHZLyj+Fdk65savJbMo
   0NynBn//VRB7fHPVea9R2+ah/ScUc4vIi7RauI1c6XmH2VhA2oEvFz898
   ZKyeoowMZktJDk3j/yqQ/Yeke20UoDAoVeElY86gwUczXFoxmhjBtjlLY
   8STjNBDTB/e2+hpBkPB9ajLz1QYO8VXLE7S78Uy0sLS73/O2ibHFHFTCn
   A==;
IronPort-SDR: MP3N0IDylcYIjgcUrU3eLHieNrmCNo1tbnjl8oYRuSOSFoqiTJz9S2f69+6wRXwa+ODfRLL6PP
 KDdthGXPUgN/NXB+DYLFMg0oyB2UqbHWSj02MfGrSIqtAGJgr+f0SwDZltHSa0UvTX6dzWQU1F
 iYFfS2Sv9yqCGDJ8G+69b52D3YU6LGAJKf4mIky1Wj04ZyJSbljz8K0EucLI4zlARouiuXaDfo
 RbJhhg+mV9k73P6mFnxfMK4wcboKiYQmcJyHJ+MX/VDf8aL7NbL8Z8ycVBmrOuVxiWsAoocSsC
 prg=
X-IronPort-AV: E=Sophos;i="5.73,394,1583218800"; 
   d="scan'208";a="76018837"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 02:21:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 02:21:13 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 15 May 2020 02:21:09 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v3 1/7] staging: most: usb: use dev_*() functions to print messages
Date:   Fri, 15 May 2020 11:20:59 +0200
Message-ID: <1589534465-7423-2-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
References: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch removes the pr_*() functions and uses dev_*() instead.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:
v3:

 drivers/staging/most/usb/usb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index a4bf362..85d4fa0 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2013-2015 Microchip Technology Germany II GmbH & Co. KG
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #include <linux/module.h>
 #include <linux/fs.h>
 #include <linux/usb.h>
@@ -186,13 +185,14 @@ static inline int start_sync_ep(struct usb_device *usb_dev, u16 ep)
  * get_stream_frame_size - calculate frame size of current configuration
  * @cfg: channel configuration
  */
-static unsigned int get_stream_frame_size(struct most_channel_config *cfg)
+static unsigned int get_stream_frame_size(struct most_channel_config *cfg,
+					  struct device *dev)
 {
 	unsigned int frame_size = 0;
 	unsigned int sub_size = cfg->subbuffer_size;
 
 	if (!sub_size) {
-		pr_warn("Misconfig: Subbuffer size zero.\n");
+		dev_warn(dev, "Misconfig: Subbuffer size zero.\n");
 		return frame_size;
 	}
 	switch (cfg->data_type) {
@@ -201,7 +201,7 @@ static unsigned int get_stream_frame_size(struct most_channel_config *cfg)
 		break;
 	case MOST_CH_SYNC:
 		if (cfg->packets_per_xact == 0) {
-			pr_warn("Misconfig: Packets per XACT zero\n");
+			dev_warn(dev, "Misconfig: Packets per XACT zero\n");
 			frame_size = 0;
 		} else if (cfg->packets_per_xact == 0xFF) {
 			frame_size = (USB_MTU / sub_size) * sub_size;
@@ -210,7 +210,7 @@ static unsigned int get_stream_frame_size(struct most_channel_config *cfg)
 		}
 		break;
 	default:
-		pr_warn("Query frame size of non-streaming channel\n");
+		dev_warn(dev, "Query frame size of non-streaming channel\n");
 		break;
 	}
 	return frame_size;
@@ -270,7 +270,7 @@ static int hdm_poison_channel(struct most_interface *iface, int channel)
 static int hdm_add_padding(struct most_dev *mdev, int channel, struct mbo *mbo)
 {
 	struct most_channel_config *conf = &mdev->conf[channel];
-	unsigned int frame_size = get_stream_frame_size(conf);
+	unsigned int frame_size = get_stream_frame_size(conf, &mdev->dev);
 	unsigned int j, num_frames;
 
 	if (!frame_size)
@@ -304,7 +304,7 @@ static int hdm_remove_padding(struct most_dev *mdev, int channel,
 			      struct mbo *mbo)
 {
 	struct most_channel_config *const conf = &mdev->conf[channel];
-	unsigned int frame_size = get_stream_frame_size(conf);
+	unsigned int frame_size = get_stream_frame_size(conf, &mdev->dev);
 	unsigned int j, num_frames;
 
 	if (!frame_size)
@@ -697,7 +697,7 @@ static int hdm_configure_channel(struct most_interface *iface, int channel,
 
 	mdev->padding_active[channel] = true;
 
-	frame_size = get_stream_frame_size(conf);
+	frame_size = get_stream_frame_size(conf, &mdev->dev);
 	if (frame_size == 0 || frame_size > USB_MTU) {
 		dev_warn(dev, "Misconfig: frame size wrong\n");
 		return -EINVAL;
-- 
2.7.4

