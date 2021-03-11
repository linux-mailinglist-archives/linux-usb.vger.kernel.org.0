Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6723378F9
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 17:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234512AbhCKQPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 11:15:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:51300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234521AbhCKQPB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 11:15:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79B9E64F93;
        Thu, 11 Mar 2021 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615479300;
        bh=wyAVSGXLnNZc1TUTBV+2d6Z38Ptcx8rldBEVslR4Mqs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BRkx/gdBAV3lzDYpCo8bpcPMy4WlIQRiGWBmy086zOYStjpWiFdHOP9NxhdCE1zpH
         FG6JS4I5RA0oXvvSKCF7364cOAN7gkgMy2QVBygcSWJrLGkJB2DhGaupa09XGFoO+R
         SvDmQ6F+38GasId7RytJmJZUgQtYx+jpwW6riUfVDwbt2f6hvpH9NtuHAZQuE3LM78
         L2wGdchU5r2Ivi/1L8mXueQP2rvVv8A+7Aja1cKucncV8nBLSeoZ8sJS/OzfcjCWij
         Em1YVt61zNUkWOOz9bnzNvhjTmvUHZEFWTbbAqmr1yjORiMnHYLCOQuSGQG47hBMR4
         8MOhBMI0lUjKA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lKNxv-0000PQ-Uw; Thu, 11 Mar 2021 17:15:11 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     "Michael G. Katzmann" <michaelk@IEEE.org>,
        Charles Yeh <charlesyeh522@gmail.com>,
        =?UTF-8?q?Yeh=2ECharles=20=5B=E8=91=89=E6=A6=AE=E9=91=AB=5D?= 
        <charles-yeh@prolific.com.tw>, Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/5] USB: serial: pl2303: amend and tighten type detection
Date:   Thu, 11 Mar 2021 17:14:48 +0100
Message-Id: <20210311161451.1496-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311161451.1496-1-johan@kernel.org>
References: <20210311161451.1496-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for detecting the HX, TA, TB and HXD device types and refuse
to bind to any unknown types.

Note that the HX type includes the XA variant, while the HXD type
includes the EA, RA and SA variants.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/pl2303.c | 50 +++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index db840b471adb..42dcc3cfb449 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -174,8 +174,11 @@ static void pl2303_set_break(struct usb_serial_port *port, bool enable);
 
 enum pl2303_type {
 	TYPE_01,	/* Type 0 and 1 (difference unknown) */
-	TYPE_HX,	/* HX version of the pl2303 chip */
-	TYPE_HXN,	/* HXN version of the pl2303 chip */
+	TYPE_HX,
+	TYPE_TA,
+	TYPE_TB,
+	TYPE_HXD,
+	TYPE_HXN,
 	TYPE_COUNT
 };
 
@@ -206,6 +209,15 @@ static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
 		.no_autoxonxoff		= true,
 	},
 	[TYPE_HX] = {
+		.max_baud_rate		= 6000000,
+	},
+	[TYPE_TA] = {
+		.max_baud_rate		= 6000000,
+	},
+	[TYPE_TB] = {
+		.max_baud_rate		= 12000000,
+	},
+	[TYPE_HXD] = {
 		.max_baud_rate		= 12000000,
 	},
 	[TYPE_HXN] = {
@@ -362,9 +374,10 @@ static int pl2303_calc_num_ports(struct usb_serial *serial,
 	return 1;
 }
 
-static enum pl2303_type pl2303_detect_type(struct usb_serial *serial)
+static int pl2303_detect_type(struct usb_serial *serial)
 {
 	struct usb_device_descriptor *desc = &serial->dev->descriptor;
+	u16 bcdDevice, bcdUSB;
 	int ret;
 	u8 buf;
 
@@ -391,7 +404,24 @@ static enum pl2303_type pl2303_detect_type(struct usb_serial *serial)
 	if (ret)
 		return TYPE_HXN;
 
-	return TYPE_HX;
+	bcdDevice = le16_to_cpu(desc->bcdDevice);
+	bcdUSB = le16_to_cpu(desc->bcdUSB);
+
+	switch (bcdDevice) {
+	case 0x300:
+		if (bcdUSB == 0x200)
+			return TYPE_TA;
+
+		return TYPE_HX;
+	case 0x400:
+		return TYPE_HXD;
+	case 0x500:
+		return TYPE_TB;
+	}
+
+	dev_err(&serial->interface->dev,
+			"unknown device type, please report to linux-usb@vger.kernel.org\n");
+	return -ENODEV;
 }
 
 static int pl2303_startup(struct usb_serial *serial)
@@ -399,15 +429,19 @@ static int pl2303_startup(struct usb_serial *serial)
 	struct pl2303_serial_private *spriv;
 	enum pl2303_type type;
 	unsigned char *buf;
+	int ret;
+
+	ret = pl2303_detect_type(serial);
+	if (ret < 0)
+		return ret;
+
+	type = ret;
+	dev_dbg(&serial->interface->dev, "device type: %d\n", type);
 
 	spriv = kzalloc(sizeof(*spriv), GFP_KERNEL);
 	if (!spriv)
 		return -ENOMEM;
 
-	type = pl2303_detect_type(serial);
-
-	dev_dbg(&serial->interface->dev, "device type: %d\n", type);
-
 	spriv->type = &pl2303_type_data[type];
 	spriv->quirks = (unsigned long)usb_get_serial_data(serial);
 	spriv->quirks |= spriv->type->quirks;
-- 
2.26.2

