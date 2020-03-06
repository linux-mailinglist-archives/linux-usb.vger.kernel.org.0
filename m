Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27CCD17C5D1
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 20:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgCFTA4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Mar 2020 14:00:56 -0500
Received: from mail-gateway-shared14.cyon.net ([194.126.200.67]:49984 "EHLO
        mail-gateway-shared14.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726162AbgCFTAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Mar 2020 14:00:55 -0500
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared14.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDM-0003id-2L
        for linux-usb@vger.kernel.org; Fri, 06 Mar 2020 20:00:54 +0100
Received: from [10.20.10.232] (port=59052 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.92)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDK-00A73H-Ry; Fri, 06 Mar 2020 20:00:50 +0100
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jAIDK-00061K-Du; Fri, 06 Mar 2020 19:00:50 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH 2/4] ch341: Detect HL340 variant
Date:   Fri,  6 Mar 2020 19:00:43 +0000
Message-Id: <f89211ed90a3d3c99eea2850d3df29618e09e625.1583520568.git.public@hansmi.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583520568.git.public@hansmi.ch>
References: <cover.1583520568.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - s013.cyon.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hansmi.ch
X-Get-Message-Sender-Via: s013.cyon.net: authenticated_id: mailrelay-cervus@hansmi.ch
X-Authenticated-Sender: s013.cyon.net: mailrelay-cervus@hansmi.ch
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-OutGoing-Spam-Status: No, score=-1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A subset of CH341 devices does not support all features, namely the
prescaler is limited to a reduced precision and there is no support for
sending a RS232 break condition.

These devices can usually be identified by an imprint of "340" on the
turquoise-colored plug. They're called "HL340" in this driver.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 518209072c50..0523f46f53c7 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -89,6 +89,7 @@ struct ch341_private {
 	u8 mcr;
 	u8 msr;
 	u8 lcr;
+	u8 flags;
 };
 
 static void ch341_set_termios(struct tty_struct *tty,
@@ -315,6 +316,43 @@ out:	kfree(buffer);
 	return r;
 }
 
+/*
+ * A subset of CH341 devices, called "HL340" in this driver, does not support
+ * all features. The prescaler is limited and there is no support for sending
+ * a RS232 break condition. A read failure when trying to set up the latter is
+ * used to detect these devices.
+ */
+static int ch341_detect_hl340(struct usb_device *dev)
+{
+	const unsigned int size = 2;
+	char *buffer;
+	int r;
+
+	buffer = kmalloc(size, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	r = ch341_control_in(dev, CH341_REQ_READ_REG,
+			     CH341_REG_BREAK, 0, buffer, size);
+	if (r == -EPIPE) {
+		dev_dbg(&dev->dev, "%s - Chip is a HL340 variant\n",
+			__func__);
+		r = 1;
+		goto out;
+	}
+
+	if (r < 0) {
+		dev_err(&dev->dev, "%s - USB control read error (%d)\n",
+			__func__, r);
+		goto out;
+	}
+
+	r = 0;
+
+out:	kfree(buffer);
+	return r;
+}
+
 static int ch341_port_probe(struct usb_serial_port *port)
 {
 	struct ch341_private *priv;
@@ -336,6 +374,10 @@ static int ch341_port_probe(struct usb_serial_port *port)
 	if (r < 0)
 		goto error;
 
+	r = ch341_detect_hl340(port->serial->dev);
+	if (r < 0)
+		goto error;
+
 	usb_set_serial_port_data(port, priv);
 	return 0;
 
-- 
2.20.1

