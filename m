Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6A619A28F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731550AbgCaXhi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:37:38 -0400
Received: from mail-gateway-shared02.cyon.net ([194.126.200.224]:49900 "EHLO
        mail-gateway-shared02.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731523AbgCaXhi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:37:38 -0400
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared02.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRp-00010D-T6
        for linux-usb@vger.kernel.org; Wed, 01 Apr 2020 01:37:36 +0200
Received: from [10.20.10.230] (port=27420 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.93)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRo-000qJK-Fp; Wed, 01 Apr 2020 01:37:32 +0200
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jJQRo-000869-19; Tue, 31 Mar 2020 23:37:32 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH v2 2/6] USB: serial: ch341: Add basis for quirk detection
Date:   Tue, 31 Mar 2020 23:37:18 +0000
Message-Id: <1e1ae0da6082bb528a44ef323d4e1d3733d38858.1585697281.git.public@hansmi.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1585697281.git.public@hansmi.ch>
References: <cover.1585697281.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - s013.cyon.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hansmi.ch
X-Get-Message-Sender-Via: s013.cyon.net: authenticated_id: mailrelay-cervus@hansmi.ch
X-Authenticated-Sender: s013.cyon.net: mailrelay-cervus@hansmi.ch
X-OutGoing-Spam-Status: No, score=-1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A subset of CH341 devices does not support all features, namely the
prescaler is limited to a reduced precision and there is no support for
sending a RS232 break condition. This patch adds a detection function
which will be extended to return quirk flags as they're implemented.

The author's affected device has an imprint of "340" on the
turquoise-colored plug, but not all such devices appear to be affected.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 85e7125d0194..9c839f67c3d4 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -87,6 +87,7 @@ struct ch341_private {
 	u8 mcr;
 	u8 msr;
 	u8 lcr;
+	u8 quirks;
 };
 
 static void ch341_set_termios(struct tty_struct *tty,
@@ -330,6 +331,45 @@ out:	kfree(buffer);
 	return r;
 }
 
+static int ch341_detect_quirks(struct usb_device *dev)
+{
+	const unsigned int size = 2;
+	char *buffer;
+	int r;
+
+	buffer = kmalloc(size, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	/*
+	 * A subset of CH34x devices does not support all features. The
+	 * prescaler is limited and there is no support for sending a RS232
+	 * break condition. A read failure when trying to set up the latter is
+	 * used to detect these devices.
+	 */
+	r = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), CH341_REQ_READ_REG,
+			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
+			    CH341_REG_BREAK, 0, buffer, size, DEFAULT_TIMEOUT);
+	if (r == -EPIPE) {
+		dev_dbg(&dev->dev, "%s - reading break condition register"
+			" failed (%d)\n", __func__, r);
+		r = 0;
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
+out:
+	kfree(buffer);
+	return r;
+}
+
 static int ch341_port_probe(struct usb_serial_port *port)
 {
 	struct ch341_private *priv;
@@ -351,6 +391,15 @@ static int ch341_port_probe(struct usb_serial_port *port)
 	if (r < 0)
 		goto error;
 
+	r = ch341_detect_quirks(port->serial->dev);
+	if (r < 0)
+		goto error;
+	if (r != 0) {
+		dev_dbg(&port->serial->dev->dev,
+			"%s - enabling quirks flags %08x\n", __func__, r);
+		priv->quirks |= r;
+	}
+
 	usb_set_serial_port_data(port, priv);
 	return 0;
 
-- 
2.20.1

