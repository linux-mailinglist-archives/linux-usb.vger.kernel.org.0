Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59D51E3D2D
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388503AbgE0JGf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:06:35 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:1485 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388330AbgE0JGe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 05:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590570394; x=1622106394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=UQhCFs5M0TuJKwieIYLpaCSxjEN4IzcEDkm4f4sP1qI=;
  b=D9SRndsNx9mJcW1XV4p6qGzA6iBUD8T3EVysUJuYM5JizX8guS6IxLFP
   lM9dwty4rdqv8g7Pr9lZMmCBYzzCP3HnJrwHkXkOAMZsUEzA40gTCb1Po
   HWgXKxooCQ9i45ccYOVfPe2apmTAbyBkHTd3RodfItxDuXDJfbXnxlvJO
   Ogy3pgHrw1TmSH7xoQ+UGaigGhNSmfq31o9xpV569e+zZAmoJ4fEP2/Tw
   isIzlmEOXBV5gkuhIFuFymKOIBkFcgDaNKv25rSlaaXXKrWMQArOVyky1
   pu+teI4F2I86tDYEcA3eGC0Uae0QGaqmAdIarR7Oi0ZSzXql+ld91VzkM
   w==;
IronPort-SDR: rykcD1jpoRaddSsGpC1Py2gQs/RJUJQtnj6j9oo2dORH56zZc6MZOSzKdC7WzAD2H7dFy8KXpV
 chr+jkUFoB1Bw88Dl6dB4j8OatUPiCsGuagR2/yP9kd4T59at9GRnvAb8VYs/4SQAO/5AHDEDv
 FPuiJQybHtSqJ947TztcuBy3MQkb+Wyp7BmsIdULY8jGRVfuE/Vp4zuGbcm2Z79/ZT5Gi2yFbL
 ECx/Xdmnv/JEUIsPCSjjHhk3Wmyb70L1sAKsKnsL4XIYxjfBsRQ6NMVDMo9+oXKfly/hFnLkCY
 Jwc=
X-IronPort-AV: E=Sophos;i="5.73,440,1583218800"; 
   d="scan'208";a="77204586"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2020 02:06:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 02:06:32 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 27 May 2020 02:06:31 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 01/10] staging: most: usb: change order of function parameters
Date:   Wed, 27 May 2020 11:06:18 +0200
Message-ID: <1590570387-27069-2-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
References: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch swaps the arguments of function get_stream_frame_size to
have the struct device as first parameter.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/most/usb/usb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 56b75e4..0e1264d 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -183,10 +183,11 @@ static inline int start_sync_ep(struct usb_device *usb_dev, u16 ep)
 
 /**
  * get_stream_frame_size - calculate frame size of current configuration
+ * @dev: device structure
  * @cfg: channel configuration
  */
-static unsigned int get_stream_frame_size(struct most_channel_config *cfg,
-					  struct device *dev)
+static unsigned int get_stream_frame_size(struct device *dev,
+					  struct most_channel_config *cfg)
 {
 	unsigned int frame_size = 0;
 	unsigned int sub_size = cfg->subbuffer_size;
@@ -270,7 +271,7 @@ static int hdm_poison_channel(struct most_interface *iface, int channel)
 static int hdm_add_padding(struct most_dev *mdev, int channel, struct mbo *mbo)
 {
 	struct most_channel_config *conf = &mdev->conf[channel];
-	unsigned int frame_size = get_stream_frame_size(conf, &mdev->dev);
+	unsigned int frame_size = get_stream_frame_size(&mdev->dev, conf);
 	unsigned int j, num_frames;
 
 	if (!frame_size)
@@ -304,7 +305,7 @@ static int hdm_remove_padding(struct most_dev *mdev, int channel,
 			      struct mbo *mbo)
 {
 	struct most_channel_config *const conf = &mdev->conf[channel];
-	unsigned int frame_size = get_stream_frame_size(conf, &mdev->dev);
+	unsigned int frame_size = get_stream_frame_size(&mdev->dev, conf);
 	unsigned int j, num_frames;
 
 	if (!frame_size)
@@ -600,7 +601,7 @@ static int hdm_configure_channel(struct most_interface *iface, int channel,
 
 	mdev->padding_active[channel] = true;
 
-	frame_size = get_stream_frame_size(conf, &mdev->dev);
+	frame_size = get_stream_frame_size(&mdev->dev, conf);
 	if (frame_size == 0 || frame_size > USB_MTU) {
 		dev_warn(dev, "Misconfig: frame size wrong\n");
 		return -EINVAL;
-- 
2.7.4

