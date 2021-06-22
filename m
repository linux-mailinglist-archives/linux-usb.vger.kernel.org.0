Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33BC43B03DC
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jun 2021 14:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhFVMMC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Jun 2021 08:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbhFVML7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Jun 2021 08:11:59 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278E3C061760
        for <linux-usb@vger.kernel.org>; Tue, 22 Jun 2021 05:09:44 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so1597538pjb.5
        for <linux-usb@vger.kernel.org>; Tue, 22 Jun 2021 05:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vhexOYuyRgRfzZw0APiHS5KaJhqYVPntbpuipmsvKG8=;
        b=B0pJF/UaUyrsVo+QeVkJzdsfTMLYhUX6sld6QYdKA56DSCmk8ol6GEuJ3sqSTWHleA
         KQ/kkuvSbpT1VoB0Etd7eB82MecxV3FXuOSnY9CndoHZuBVm/3QIXrnseFWTvcVk4zNc
         LqFOEkaxj5fekMaY4CtsbpPLi1dly484oTFeR0L30Np7H/Rq3+2KwoqT/C0/ioxlG8FS
         cFyDSQR3wWY7gCat6f33XxF9yA4Z4HwEbif7S/zz+g17qxlnNoFfC6HfoFtZHWZZtJiU
         CCrB3AAX7VfTJyZJQwYPER6c5Tixrj0Ed9bfEuQYsdJyzGvKXisNrrKTRAOUp0GwTqL8
         eX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vhexOYuyRgRfzZw0APiHS5KaJhqYVPntbpuipmsvKG8=;
        b=Ky4ApCwTtCZf+5tU1ofDIp9VNZBAZtJFuj8aUElxvY+7jX6bjZ9+eEdxzNWa/Se01q
         WT3c1z41HMTSWMv//1/QbZ2VH56Z5ymt3tB02P/i9V6iy3Szxr4WMDs+Av1P1d25EmFQ
         cF6twxlDwdcaogCOkIzTEJqvvBbEp99Ct/J6aAdokAsPLPmOFSPoXZGBK3N6L9Q+TsSg
         +H/0/ET1DOuwiYjc4rTzGlW3bdpRTjY0n09lbmyel7fF2a2xpHo5iUx9nDn+vmtp3AY+
         q8CEnosyhZvxMTbaYLJZFziFbZUWETY+Gi6rDEqr+rjuBkPioZnCE91jscSyd1QVP/V2
         oaPQ==
X-Gm-Message-State: AOAM5327+b5tH3x7dLNpU/od1hUcY1SaCtROKp3j5k6GFdXvVP8S2mZP
        IFW5wONSa8lw7nJ5/6UHWZ4R/h+YFE3Wxxxw
X-Google-Smtp-Source: ABdhPJwn+Agq90b76XBtikmd7YT62CGx1jihUKQ0Qj19VLf/nVe1unGwosU3UtBcikjWTtkU3b3SFQ==
X-Received: by 2002:a17:902:da83:b029:122:d385:d280 with SMTP id j3-20020a170902da83b0290122d385d280mr15915734plx.43.1624363777443;
        Tue, 22 Jun 2021 05:09:37 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-3815-7bc5-9c67-26c1-b85d-49ec.dynamic-ip6.hinet.net. [2001:b011:3815:7bc5:9c67:26c1:b85d:49ec])
        by smtp.gmail.com with ESMTPSA id c5sm19197249pfn.144.2021.06.22.05.09.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 05:09:37 -0700 (PDT)
From:   Charles Yeh <charlesyeh522@gmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org
Cc:     charles-yeh@prolific.com.tw, Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH] USB: serial: pl2303: Add new PID to support PL256X (TYPE_MP)
Date:   Tue, 22 Jun 2021 20:09:06 +0800
Message-Id: <20210622120906.743-1-charlesyeh522@gmail.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Prolific has developed a new USB to Multi-UART chip: PL256X (TYPE_MP)
PL256X : PL2543,PL2561,PL2563,PL2565
The Vendor request used by the PL256X (TYPE_MP) is different from
the existing PL2303 series (TYPE_HXN / TYPE_HX ).
Therefore, different Vendor requests are used to issue related commands.

1. Added a new TYPE_MP type in pl2303_type, and then executes
   new Vendor request,new flow control and other related instructions
   if TYPE_MP is recognized.

2. Added a interface_Indexnumber in pl2303_serial_private, and then executes
   new USB index request, if TYPE_MP is recognized.

3. Because the new PL256X only accept the new Vendor request,
   the old Vendor request cannot be accepted (the error message
   will be returned)
   So first determine the bcdDevice in pl2303_detect_type.

4. In pl2303_open: Because TYPE_MP is different from the instruction of reset
   down/up stream used by TYPE_HXN/TYPE_HX.
   Therefore, we will also execute different instructions here.
   pl256X_uart_reset

5. In pl2303_set_termios: The UART flow control instructions used by
   TYPE_MP/TYPE_HXN/TYPE_HX are different.
   Therefore, we will also execute different instructions here.

6. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_MP is different
   from the vendor request instruction used by TYPE_HXN/TYPE_HX,
   it will also execute different instructions here.

7. In pl2303_update_reg: TYPE_MP used different register for flow control.
   Therefore, we will also execute different instructions here.

8. The max baud rate of TYPE_MP is 48M bps, and don't support divisor encoding.

Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
 drivers/usb/serial/pl2303.c | 114 ++++++++++++++++++++++++++++++++++--
 drivers/usb/serial/pl2303.h |   4 ++
 2 files changed, 112 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 940050c31482..dc449883bd1f 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -53,6 +53,10 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL256X_PRODUCT_ID_2P) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL256X_PRODUCT_ID_4P) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL256X_PRODUCT_ID_4P43) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL256X_PRODUCT_ID_2P_4P) },
 	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID) },
 	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID_RSAQ5) },
 	{ USB_DEVICE(ATEN_VENDOR_ID, ATEN_PRODUCT_ID),
@@ -140,10 +144,15 @@ MODULE_DEVICE_TABLE(usb, id_table);
 #define VENDOR_WRITE_REQUEST_TYPE	0x40
 #define VENDOR_WRITE_REQUEST		0x01
 #define VENDOR_WRITE_NREQUEST		0x80
+#define VENDOR_WRITE_MPREQUEST	0x80
 
 #define VENDOR_READ_REQUEST_TYPE	0xc0
 #define VENDOR_READ_REQUEST		0x01
 #define VENDOR_READ_NREQUEST		0x81
+#define VENDOR_READ_MPREQUEST		0x80
+
+#define PL256X_RESET_REQUEST_TYPE	0x40
+#define PL256X_RESET_REQUEST		0x96
 
 #define UART_STATE_INDEX		8
 #define UART_STATE_MSR_MASK		0x8b
@@ -171,6 +180,16 @@ MODULE_DEVICE_TABLE(usb, id_table);
 #define PL2303_HXN_FLOWCTRL_RTS_CTS	0x18
 #define PL2303_HXN_FLOWCTRL_XON_XOFF	0x0c
 
+#define PL256X_PORT_A_FLOWCTRL_REG	0xC005
+#define PL256X_PORT_B_FLOWCTRL_REG	0xD005
+#define PL256X_PORT_C_FLOWCTRL_REG	0xE005
+#define PL256X_PORT_D_FLOWCTRL_REG	0xF005
+
+#define PL256X_FLOWCTRL_MASK		0x43
+#define PL256X_FLOWCTRL_XON_XOFF	0x40
+#define PL256X_FLOWCTRL_RTS_CTS	0x03
+#define PL256X_FLOWCTRL_NONE		0x00
+
 static void pl2303_set_break(struct usb_serial_port *port, bool enable);
 
 enum pl2303_type {
@@ -180,6 +199,7 @@ enum pl2303_type {
 	TYPE_TB,
 	TYPE_HXD,
 	TYPE_HXN,
+	TYPE_MP,
 	TYPE_COUNT
 };
 
@@ -195,6 +215,8 @@ struct pl2303_type_data {
 struct pl2303_serial_private {
 	const struct pl2303_type_data *type;
 	unsigned long quirks;
+	u16 interface_IndexNumber;
+	u16 flowctrl_reg;
 };
 
 struct pl2303_private {
@@ -235,8 +257,32 @@ static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
 		.max_baud_rate		= 12000000,
 		.no_divisors		= true,
 	},
+	[TYPE_MP] = {
+		.name			= "MP",
+		.max_baud_rate		= 48000000,
+		.no_divisors		= true,
+	},
 };
 
+static int pl256X_uart_reset(struct usb_serial *serial, u16 value, u16 index)
+{
+	struct device *dev = &serial->interface->dev;
+	int res;
+
+	dev_dbg(dev, "%s - [%04x] = %02x\n", __func__, value, index);
+
+	res = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
+			PL256X_RESET_REQUEST, PL256X_RESET_REQUEST_TYPE,
+			value, index, NULL, 0, 100);
+	if (res) {
+		dev_err(dev, "%s - failed to write [%04x]: %d\n", __func__,
+								value, res);
+		return res;
+	}
+
+	return 0;
+}
+
 static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
 							unsigned char buf[1])
 {
@@ -247,6 +293,8 @@ static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
 
 	if (spriv->type == &pl2303_type_data[TYPE_HXN])
 		request = VENDOR_READ_NREQUEST;
+	else if (spriv->type == &pl2303_type_data[TYPE_MP])
+		request = VENDOR_READ_MPREQUEST;
 	else
 		request = VENDOR_READ_REQUEST;
 
@@ -278,6 +326,8 @@ static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16 index)
 
 	if (spriv->type == &pl2303_type_data[TYPE_HXN])
 		request = VENDOR_WRITE_NREQUEST;
+	else if (spriv->type == &pl2303_type_data[TYPE_MP])
+		request = VENDOR_WRITE_MPREQUEST;
 	else
 		request = VENDOR_WRITE_REQUEST;
 
@@ -303,7 +353,8 @@ static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
 	if (!buf)
 		return -ENOMEM;
 
-	if (spriv->type == &pl2303_type_data[TYPE_HXN])
+	if (spriv->type == &pl2303_type_data[TYPE_HXN] ||
+		spriv->type == &pl2303_type_data[TYPE_MP])
 		ret = pl2303_vendor_read(serial, reg, buf);
 	else
 		ret = pl2303_vendor_read(serial, reg | 0x80, buf);
@@ -436,6 +487,12 @@ static int pl2303_detect_type(struct usb_serial *serial)
 		return TYPE_HXD;
 	case 0x500:
 		return TYPE_TB;
+	case 0x4302:
+	case 0x4304:
+	case 0x6502:
+	case 0x6504:
+	case 0x6506:
+		return TYPE_MP;
 	}
 
 	dev_err(&serial->interface->dev,
@@ -449,6 +506,7 @@ static int pl2303_startup(struct usb_serial *serial)
 	enum pl2303_type type;
 	unsigned char *buf;
 	int ret;
+	unsigned int ifnum;
 
 	ret = pl2303_detect_type(serial);
 	if (ret < 0)
@@ -457,17 +515,39 @@ static int pl2303_startup(struct usb_serial *serial)
 	type = ret;
 	dev_dbg(&serial->interface->dev, "device type: %s\n", pl2303_type_data[type].name);
 
+	ifnum = serial->interface->altsetting->desc.bInterfaceNumber;
+
 	spriv = kzalloc(sizeof(*spriv), GFP_KERNEL);
 	if (!spriv)
 		return -ENOMEM;
 
+	if (type == TYPE_MP) {
+		switch (ifnum) {
+		case 0:
+			spriv->flowctrl_reg = PL256X_PORT_A_FLOWCTRL_REG;
+			break;
+		case 1:
+			spriv->flowctrl_reg = PL256X_PORT_B_FLOWCTRL_REG;
+			break;
+		case 2:
+			spriv->flowctrl_reg = PL256X_PORT_C_FLOWCTRL_REG;
+			break;
+		case 3:
+			spriv->flowctrl_reg = PL256X_PORT_D_FLOWCTRL_REG;
+			break;
+		}
+	}
+
 	spriv->type = &pl2303_type_data[type];
 	spriv->quirks = (unsigned long)usb_get_serial_data(serial);
 	spriv->quirks |= spriv->type->quirks;
+	spriv->interface_IndexNumber = ifnum;
 
 	usb_set_serial_data(serial, spriv);
 
-	if (type != TYPE_HXN) {
+	if (type == TYPE_MP)
+		pl2303_vendor_write(serial, spriv->flowctrl_reg, 0);
+	else if (type != TYPE_HXN) {
 		buf = kmalloc(1, GFP_KERNEL);
 		if (!buf) {
 			kfree(spriv);
@@ -529,13 +609,15 @@ static void pl2303_port_remove(struct usb_serial_port *port)
 static int pl2303_set_control_lines(struct usb_serial_port *port, u8 value)
 {
 	struct usb_device *dev = port->serial->dev;
+	struct usb_serial *serial = port->serial;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 	int retval;
 
 	dev_dbg(&port->dev, "%s - %02x\n", __func__, value);
 
 	retval = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
 				 SET_CONTROL_REQUEST, SET_CONTROL_REQUEST_TYPE,
-				 value, 0, NULL, 0, 100);
+				 value, spriv->interface_IndexNumber, NULL, 0, 100);
 	if (retval)
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, retval);
 
@@ -702,11 +784,13 @@ static int pl2303_get_line_request(struct usb_serial_port *port,
 							unsigned char buf[7])
 {
 	struct usb_device *udev = port->serial->dev;
+	struct usb_serial *serial = port->serial;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 	int ret;
 
 	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 				GET_LINE_REQUEST, GET_LINE_REQUEST_TYPE,
-				0, 0, buf, 7, 100);
+				0, spriv->interface_IndexNumber, buf, 7, 100);
 	if (ret != 7) {
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, ret);
 
@@ -725,11 +809,13 @@ static int pl2303_set_line_request(struct usb_serial_port *port,
 							unsigned char buf[7])
 {
 	struct usb_device *udev = port->serial->dev;
+	struct usb_serial *serial = port->serial;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 	int ret;
 
 	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
 				SET_LINE_REQUEST, SET_LINE_REQUEST_TYPE,
-				0, 0, buf, 7, 100);
+				0, spriv->interface_IndexNumber, buf, 7, 100);
 	if (ret < 0) {
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, ret);
 		return ret;
@@ -896,6 +982,10 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_RTS_CTS);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_update_reg(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_MASK,
+					PL256X_FLOWCTRL_RTS_CTS);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x60);
 		}
@@ -904,6 +994,10 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_XON_XOFF);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_update_reg(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_MASK,
+					PL256X_FLOWCTRL_XON_XOFF);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
 		}
@@ -912,6 +1006,10 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_NONE);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_update_reg(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_MASK,
+					PL256X_FLOWCTRL_NONE);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
 		}
@@ -959,6 +1057,9 @@ static int pl2303_open(struct tty_struct *tty, struct usb_serial_port *port)
 			pl2303_vendor_write(serial, PL2303_HXN_RESET_REG,
 					PL2303_HXN_RESET_UPSTREAM_PIPE |
 					PL2303_HXN_RESET_DOWNSTREAM_PIPE);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl256X_uart_reset(serial, 0,
+					spriv->interface_IndexNumber);
 		} else {
 			pl2303_vendor_write(serial, 8, 0);
 			pl2303_vendor_write(serial, 9, 0);
@@ -1052,6 +1153,7 @@ static int pl2303_carrier_raised(struct usb_serial_port *port)
 static void pl2303_set_break(struct usb_serial_port *port, bool enable)
 {
 	struct usb_serial *serial = port->serial;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 	u16 state;
 	int result;
 
@@ -1065,7 +1167,7 @@ static void pl2303_set_break(struct usb_serial_port *port, bool enable)
 
 	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
 				 BREAK_REQUEST, BREAK_REQUEST_TYPE, state,
-				 0, NULL, 0, 100);
+				 spriv->interface_IndexNumber, NULL, 0, 100);
 	if (result)
 		dev_err(&port->dev, "error sending break = %d\n", result);
 }
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index 6097ee8fccb2..82f301e80993 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -27,6 +27,10 @@
 #define PL2303_PRODUCT_ID_MOTOROLA	0x0307
 #define PL2303_PRODUCT_ID_ZTEK		0xe1f1
 
+#define PL256X_PRODUCT_ID_2P		0x2561
+#define PL256X_PRODUCT_ID_4P		0x2563
+#define PL256X_PRODUCT_ID_4P43	0x2543
+#define PL256X_PRODUCT_ID_2P_4P	0x2565
 
 #define ATEN_VENDOR_ID		0x0557
 #define ATEN_VENDOR_ID2		0x0547
-- 
2.25.1

