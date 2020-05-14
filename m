Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE631D34DC
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 17:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgENPS6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 11:18:58 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:8015 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENPS6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 11:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589469538; x=1621005538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=H7feGbo36stL28p0Wvk1RKIPuKIoLQhAKgTHMY+gbGU=;
  b=Xn4d7Voxj5VbCADe0Dczb4JMZzNik8G1ZNDuXZ+Dzjz7pgv5VxXD3j/M
   PQOvpXNt6OKctTkiAu4Pby/HVFyS0o+CpMUOF8wHKyQe2STKL7mdblPh+
   wtVhcnA109GFKcHoR0Ak9985zlvu6LGroX/BT4Sk2dmr6QJpSA3JxEWsS
   yAf0RsWZXld1R4qd5LPyYMsnR+QE6tOXoC/tQQJ8ByEbh+zfnrTDqxjh3
   LGs79fVBfPXD5eyRDq4HLYfBb5sjvjWL9iOfo5k5XrC6JuYs1CmhzqPnY
   TAIagMDA3KKI6EXrQRVdSDLpPjIqjUa0PIN3JmpEpy2Jf5YrfvXeBgQSr
   w==;
IronPort-SDR: OA09F0RxRqiBLiuVIO5IPxawb/GTjSgNfCE0+EZ163tv6eOcnQYV3DnxtSKznFGHMcnl/qDgyV
 baLOFVXF3uh4/9+Bd6NoLcbpe4ZyryeoUh6d+dKW4GADOduCav9WZbCUYMGk0efUc9yOhhKIQE
 UxftRdFOyYhU06/UVZ2gV10khWj8snSVUkmisiV/Hke+WITXnN8kRhjSJd8EyiNHfhASGFZfiP
 FjagLOO6LYuxKHQ78PLqPngsnTp3nAnSwbgfVNLNud2/pJzt2kRRJLFE7rlRz0VXphN8E3aCfN
 iUA=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75909798"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 08:18:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 08:19:00 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 08:18:59 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 1/7] staging: most: usb: use dev_*() functions to print messages
Date:   Thu, 14 May 2020 17:18:46 +0200
Message-ID: <1589469532-21488-2-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
References: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
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

