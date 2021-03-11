Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD693378FC
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 17:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbhCKQPK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 11:15:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:51284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234518AbhCKQPB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 11:15:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71BCB64F88;
        Thu, 11 Mar 2021 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615479300;
        bh=3+WZZL4p8Kd2t6is02ZHMIxtlxqk2KneRYd45SCOBVQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VB0Mj71sRFw9krTw0/Fb5sr19u3TBGEti5Ebl5RGqFtsVsoRwgsWF0/syCclzC2om
         xDJkLD2dn4aJfCRAzZVQ80tyb2MZQtbou4xuE/h5dqqEAqhmx2A9re66xcY7mHqObD
         9YfNnK4IglKTV8t3UE4Ys+wRZ1gOZmpj+zl5LD3srrAXWl9BU9NcYbrPajK8iQxKF9
         PHWRkoDZKncwmnOKZrSV2qZdUXMFAZamILWcfCAPlnc9fNIo0MWAGRXO3sIx32l6wF
         +HhoSnbwaZaX3s3sRcryFnX8sPoeCKA9ccDAJXQfxUozqpxPDCTCQDWGwPD2ZPbtyb
         K5qEFwo9TSWdA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lKNxv-0000PN-Rw; Thu, 11 Mar 2021 17:15:11 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     "Michael G. Katzmann" <michaelk@IEEE.org>,
        Charles Yeh <charlesyeh522@gmail.com>,
        =?UTF-8?q?Yeh=2ECharles=20=5B=E8=91=89=E6=A6=AE=E9=91=AB=5D?= 
        <charles-yeh@prolific.com.tw>, Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/5] USB: serial: pl2303: clean up type detection
Date:   Thu, 11 Mar 2021 17:14:47 +0100
Message-Id: <20210311161451.1496-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311161451.1496-1-johan@kernel.org>
References: <20210311161451.1496-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Clean up the type detection somewhat in preparation for adding support
for more types.

Note this also fixes the type debug printk for the new HXN type.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/pl2303.c | 68 +++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index eed9acd1ae08..db840b471adb 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -362,42 +362,52 @@ static int pl2303_calc_num_ports(struct usb_serial *serial,
 	return 1;
 }
 
+static enum pl2303_type pl2303_detect_type(struct usb_serial *serial)
+{
+	struct usb_device_descriptor *desc = &serial->dev->descriptor;
+	int ret;
+	u8 buf;
+
+	/*
+	 * Legacy types 0 and 1, difference unknown.
+	 */
+	if (desc->bDeviceClass == 0x02)
+		return TYPE_01;		/* type 0 */
+
+	if (desc->bMaxPacketSize0 != 0x40) {
+		if (desc->bDeviceClass == 0x00 || desc->bDeviceClass == 0xff)
+			return TYPE_01;	/* type 1 */
+
+		return TYPE_01;		/* type 0 */
+	}
+
+	/*
+	 * Assume it's an HXN-type if the device doesn't support the old read
+	 * request value.
+	 */
+	ret = usb_control_msg_recv(serial->dev, 0, VENDOR_READ_REQUEST,
+			VENDOR_READ_REQUEST_TYPE, PL2303_READ_TYPE_HX_STATUS,
+			0, &buf, 1, 100, GFP_KERNEL);
+	if (ret)
+		return TYPE_HXN;
+
+	return TYPE_HX;
+}
+
 static int pl2303_startup(struct usb_serial *serial)
 {
 	struct pl2303_serial_private *spriv;
-	enum pl2303_type type = TYPE_01;
+	enum pl2303_type type;
 	unsigned char *buf;
-	int res;
 
 	spriv = kzalloc(sizeof(*spriv), GFP_KERNEL);
 	if (!spriv)
 		return -ENOMEM;
 
-	buf = kmalloc(1, GFP_KERNEL);
-	if (!buf) {
-		kfree(spriv);
-		return -ENOMEM;
-	}
+	type = pl2303_detect_type(serial);
 
-	if (serial->dev->descriptor.bDeviceClass == 0x02)
-		type = TYPE_01;		/* type 0 */
-	else if (serial->dev->descriptor.bMaxPacketSize0 == 0x40)
-		type = TYPE_HX;
-	else if (serial->dev->descriptor.bDeviceClass == 0x00)
-		type = TYPE_01;		/* type 1 */
-	else if (serial->dev->descriptor.bDeviceClass == 0xFF)
-		type = TYPE_01;		/* type 1 */
 	dev_dbg(&serial->interface->dev, "device type: %d\n", type);
 
-	if (type == TYPE_HX) {
-		res = usb_control_msg(serial->dev,
-				usb_rcvctrlpipe(serial->dev, 0),
-				VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
-				PL2303_READ_TYPE_HX_STATUS, 0, buf, 1, 100);
-		if (res != 1)
-			type = TYPE_HXN;
-	}
-
 	spriv->type = &pl2303_type_data[type];
 	spriv->quirks = (unsigned long)usb_get_serial_data(serial);
 	spriv->quirks |= spriv->type->quirks;
@@ -405,6 +415,12 @@ static int pl2303_startup(struct usb_serial *serial)
 	usb_set_serial_data(serial, spriv);
 
 	if (type != TYPE_HXN) {
+		buf = kmalloc(1, GFP_KERNEL);
+		if (!buf) {
+			kfree(spriv);
+			return -ENOMEM;
+		}
+
 		pl2303_vendor_read(serial, 0x8484, buf);
 		pl2303_vendor_write(serial, 0x0404, 0);
 		pl2303_vendor_read(serial, 0x8484, buf);
@@ -419,9 +435,9 @@ static int pl2303_startup(struct usb_serial *serial)
 			pl2303_vendor_write(serial, 2, 0x24);
 		else
 			pl2303_vendor_write(serial, 2, 0x44);
-	}
 
-	kfree(buf);
+		kfree(buf);
+	}
 
 	return 0;
 }
-- 
2.26.2

