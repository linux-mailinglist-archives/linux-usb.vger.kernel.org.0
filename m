Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFFE168782
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2020 20:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgBUThg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Feb 2020 14:37:36 -0500
Received: from mail-gateway-shared14.cyon.net ([194.126.200.67]:48310 "EHLO
        mail-gateway-shared14.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726160AbgBUThg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Feb 2020 14:37:36 -0500
X-Greylist: delayed 802 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Feb 2020 14:37:35 EST
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared14.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1j5DuD-0003IM-Je
        for linux-usb@vger.kernel.org; Fri, 21 Feb 2020 20:24:11 +0100
Received: from [10.20.10.231] (port=9004 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.92)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1j5DuC-006ipW-Dd; Fri, 21 Feb 2020 20:24:08 +0100
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1j5Du4-0002cA-LI; Fri, 21 Feb 2020 19:24:00 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Michael Hanselmann <public@hansmi.ch>
Subject: [PATCH] ch341: Replace memory allocations with stack storage
Date:   Fri, 21 Feb 2020 19:23:41 +0000
Message-Id: <bdf7db0e0e133f55ac81d39ce9564653e0b5d9ed.1582312740.git.public@hansmi.ch>
X-Mailer: git-send-email 2.20.1
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

Storing a memory pointer consumes 4 or 8 bytes, depending on the
architecture. The replaced buffers are 2 bytes, so this change not only
avoids the overhead of memory allocation, but it also saves a small
amount of stack storage.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index c5ecdcd51ffc..6875da6e746c 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -255,16 +255,11 @@ static int ch341_set_handshake(struct usb_device *dev, u8 control)
 
 static int ch341_get_status(struct usb_device *dev, struct ch341_private *priv)
 {
-	const unsigned int size = 2;
-	char *buffer;
+	char buffer[2];
 	int r;
 	unsigned long flags;
 
-	buffer = kmalloc(size, GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	r = ch341_control_in(dev, CH341_REQ_READ_REG, 0x0706, 0, buffer, size);
+	r = ch341_control_in(dev, CH341_REQ_READ_REG, 0x0706, 0, buffer, sizeof(buffer));
 	if (r < 0)
 		goto out;
 
@@ -272,7 +267,7 @@ static int ch341_get_status(struct usb_device *dev, struct ch341_private *priv)
 	priv->msr = (~(*buffer)) & CH341_BITS_MODEM_STAT;
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-out:	kfree(buffer);
+out:
 	return r;
 }
 
@@ -280,16 +275,11 @@ out:	kfree(buffer);
 
 static int ch341_configure(struct usb_device *dev, struct ch341_private *priv)
 {
-	const unsigned int size = 2;
-	char *buffer;
+	char buffer[2];
 	int r;
 
-	buffer = kmalloc(size, GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
 	/* expect two bytes 0x27 0x00 */
-	r = ch341_control_in(dev, CH341_REQ_READ_VERSION, 0, 0, buffer, size);
+	r = ch341_control_in(dev, CH341_REQ_READ_VERSION, 0, 0, buffer, sizeof(buffer));
 	if (r < 0)
 		goto out;
 	dev_dbg(&dev->dev, "Chip version: 0x%02x\n", buffer[0]);
@@ -304,7 +294,7 @@ static int ch341_configure(struct usb_device *dev, struct ch341_private *priv)
 
 	r = ch341_set_handshake(dev, priv->mcr);
 
-out:	kfree(buffer);
+out:
 	return r;
 }
 
@@ -486,18 +476,14 @@ static void ch341_break_ctl(struct tty_struct *tty, int break_state)
 	struct usb_serial_port *port = tty->driver_data;
 	int r;
 	uint16_t reg_contents;
-	uint8_t *break_reg;
-
-	break_reg = kmalloc(2, GFP_KERNEL);
-	if (!break_reg)
-		return;
+	uint8_t break_reg[2];
 
 	r = ch341_control_in(port->serial->dev, CH341_REQ_READ_REG,
 			ch341_break_reg, 0, break_reg, 2);
 	if (r < 0) {
 		dev_err(&port->dev, "%s - USB control read error (%d)\n",
 				__func__, r);
-		goto out;
+		return;
 	}
 	dev_dbg(&port->dev, "%s - initial ch341 break register contents - reg1: %x, reg2: %x\n",
 		__func__, break_reg[0], break_reg[1]);
@@ -518,8 +504,6 @@ static void ch341_break_ctl(struct tty_struct *tty, int break_state)
 	if (r < 0)
 		dev_err(&port->dev, "%s - USB control write error (%d)\n",
 				__func__, r);
-out:
-	kfree(break_reg);
 }
 
 static int ch341_tiocmset(struct tty_struct *tty,
-- 
2.20.1

