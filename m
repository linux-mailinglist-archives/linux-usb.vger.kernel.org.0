Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59131D31AD
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 15:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgENNqm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 09:46:42 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:45723 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgENNqm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 09:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589464001; x=1621000001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=1jwyHDWkbaZ/9+NziawkrE9gv0H8DLkHj8Ik3+mzyi8=;
  b=j6V+P8QIkiF0auuhB62hjac9hrCgBN6r/Bmkv5oq1AKezZDAkziYM7WE
   vlCVF5DOxZmWcGCNfn8epjKU3pJ7098ExxfyUqwgHqKa7GYiF9unZn91r
   LjYFmq54nUoEXIJXKEISBoimPEjgBtThM+LlGWH65nO8miyZPNHb6rfhs
   dHZBNY5HpE37VyHOBUs6ursrvQwSIh9M0Akl8DkT3Yk9ZQs12kzaIv4vu
   MPOD7LyfE1U6lXhPt/KZJerncKHClvvn/9YkAvQq1IQOag77TGRgmsOtk
   SfASw0pfCCLEopTjY+DqHoyDDam9VEYYoA58cNZy0aicfMcEx3E5N6OTn
   A==;
IronPort-SDR: Vt/k3C5z/docO0TtoLqY99ZChMT0wjrDGGw7QGW/T5eJS7YnNO1nfak14wJuqtE4La2ptabWZv
 mACtfDgqAuOHsYhbdY0SzRorJHXpoF1l11UXxAI2XJgUR2NKztx7PBSyiCqzOszfLVIuth35D6
 ECC+g+KAOuRCniEVq4qRMYuhEysHYuDAXMxQ6zOBEPuVyN3xKh+w/LeDkZN4h96cOEQ+CUJFvG
 2F8Z8ANrlG+V/zexv3LKio6fdiN0oPLab81gCSDrtfVOoTk2fyf/h4BvQRXdSJsAt3mNWLUln5
 2hM=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75267234"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 06:46:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 06:46:34 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 06:46:36 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 1/7] staging: most: usb: use dev_*() functions to print messages
Date:   Thu, 14 May 2020 15:46:23 +0200
Message-ID: <1589463989-30029-2-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
References: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
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

