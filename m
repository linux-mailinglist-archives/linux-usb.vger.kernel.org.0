Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EABAAE204
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 14:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfD2MNA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 08:13:00 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40061 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbfD2MNA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 08:13:00 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so4985780plr.7
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 05:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKyjEr/Rfjfh0O04poPnaaNgITAAHAf6lPMgH9siAVU=;
        b=LzlIWvcGbYmx2nUcOL1hUxDzKluSvNRPNX+4PqCvlqSWAeCEBWlaZmCuQh1jwQsgZc
         MgG56Pa/GEDl8DkzH3xnEDU3F3f0/+wqZrOEQ/tAqPkVtWj5ipT45ReTBB7yq5xWy/yZ
         fQT49Hpc6241hQIwANTz1P/f/WekEU4iiO5iCtNqk/Yk8+krZ5XAWFVkcuchm3SvaM6S
         EoU1AZJrsNp8UG89n2iTnJ0PygRTsKymQ63qWTVQIGWqlfxufKygMvJze2cl0+2rQXM0
         YFsO0i2xYOT+6lI3bC8yWjQMvSJnQlK1x8U+KDKSEq84pZEiz+G4pgrrM/8Hlm4lQF52
         TsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKyjEr/Rfjfh0O04poPnaaNgITAAHAf6lPMgH9siAVU=;
        b=SLLPKfwST6dzMQVTshSHz9mXu9hwss9/xoGH9wVOqKCcwcde/Bt7HKx0sQewgIGlk/
         lFQLxVEwEdyoHJYOVKZ2OIRFP0LrLV2cQajSbu1moZdhwfsXz8aDe3de4T+5YuiUt8b6
         ynDqt90GKndZbNnOyaqxRVbNABtCDGFIPfDKw/jQUR2Uau82Q02R4LmaUKNQTlwghuWS
         3Osle6lChtkRn66Dx3kxKFmn62CnTgYZsAeONi7YteiF1CpJVdRO88eRnMal0QotxrDB
         c5x8VQZ/moUifsNJ09AOE/cyYm0IUTH99KOD5PK1ckAKPVSe9Nd46ZUsS5xJWVUglqjG
         xy6Q==
X-Gm-Message-State: APjAAAUxoRZfWYth/aV69W0Sw9v2noElVdDA7DvkrJH+UFeidzJrtHJw
        YFhs5PogNO7RCiGoX0BQPeY=
X-Google-Smtp-Source: APXvYqzOD/ywPO7aJaEMeOKX2Q6LrcPLJ/qFakyRzTNLuGn+jwLdB6oq5ftlsImUgie/7a6AQTXPFg==
X-Received: by 2002:a17:902:e402:: with SMTP id ci2mr26351096plb.154.1556539979065;
        Mon, 29 Apr 2019 05:12:59 -0700 (PDT)
Received: from localhost.localdomain (111-249-15-202.dynamic-ip.hinet.net. [111.249.15.202])
        by smtp.gmail.com with ESMTPSA id i3sm47312810pfa.90.2019.04.29.05.12.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 05:12:58 -0700 (PDT)
From:   Charles Yeh <charlesyeh522@gmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org
Cc:     charles-yeh@prolific.com.tw, Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH] [PATCH v2] USB:serial:pl2303:Add new PID to support PL2303HXN (TYPE_HXN)
Date:   Mon, 29 Apr 2019 20:12:37 +0800
Message-Id: <20190429121237.13136-1-charlesyeh522@gmail.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Prolific has developed a new USB to UART chip: PL2303HXN
PL2303HXN : PL2303GC/PL2303GS/PL2303GT/PL2303GL/PL2303GE/PL2303GB
The Vendor request used by the PL2303HXN (TYPE_HXN) is different from
the existing PL2303 series (TYPE_HX & TYPE_01).
Therefore, different Vendor requests are used to issue related commands.

1. Added a new TYPE_HXN type in pl2303_type_data, and then executes
   new Vendor request,new flow control and other related instructions
   if TYPE_HXN is recognized.

2. Because the new PL2303HXN only accept the new Vendor request,
   the old Vendor request cannot be accepted (the error message
   will be returned)
   So first determine the TYPE_HX or TYPE_HXN through
   PL2303_READ_TYPE_HX_STATUS in pl2303_startup.

  2.1 If the return message is "1", then the PL2303 is the existing
      TYPE_HX/ TYPE_01 series.
      The other settings in pl2303_startup are to continue execution.
  2.2 If the return message is "not 1", then the PL2303 is the new
      TYPE_HXN series.
      The other settings in pl2303_startup are ignored.
      (PL2303HXN will directly use the default value in the hardware,
       no need to add additional settings through the software)

3. In pl2303_open: Because TYPE_HXN is different from the instruction of reset
   down/up stream used by TYPE_HX.
   Therefore, we will also execute different instructions here.

4. In pl2303_set_termios: The UART flow control instructions used by
   TYPE_HXN/TYPE_HX/TYPE_01 are different.
   Therefore, we will also execute different instructions here.

5. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_HXN is different
   from the vendor request instruction used by TYPE_HX/TYPE_01,
   it will also execute different instructions here.

Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
 drivers/usb/serial/pl2303.c | 107 +++++++++++++++++++++++++++++-------
 drivers/usb/serial/pl2303.h |   6 ++
 2 files changed, 92 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index bb3f9aa4a909..d938091ba4cc 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -47,6 +47,12 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_MOTOROLA) },
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_ZTEK) },
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_TB) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GC) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GB) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GT) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
 	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID) },
 	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID_RSAQ5) },
 	{ USB_DEVICE(ATEN_VENDOR_ID, ATEN_PRODUCT_ID),
@@ -129,9 +135,11 @@ MODULE_DEVICE_TABLE(usb, id_table);
 
 #define VENDOR_WRITE_REQUEST_TYPE	0x40
 #define VENDOR_WRITE_REQUEST		0x01
+#define VENDOR_WRITE_NREQUEST		0x80
 
 #define VENDOR_READ_REQUEST_TYPE	0xc0
 #define VENDOR_READ_REQUEST		0x01
+#define VENDOR_READ_NREQUEST		0x81
 
 #define UART_STATE_INDEX		8
 #define UART_STATE_MSR_MASK		0x8b
@@ -145,11 +153,19 @@ MODULE_DEVICE_TABLE(usb, id_table);
 #define UART_OVERRUN_ERROR		0x40
 #define UART_CTS			0x80
 
+#define PL2303_READ_TYPE_HX_STATUS	0x8080
+#define PL2303_TYPE_HXN_FLOW_CTRL	0x0A
+#define PL2303_TYPE_HXN_CTRL_RTS_CTS	0xFA
+#define PL2303_TYPE_HXN_CTRL_XON_XOFF	0xEE
+#define PL2303_TYPE_HXN_NONE_FLOW	0xFF
+#define PL2303_TYPE_HXN_RESET_DOWN_UPSTREAM	0x07
+
 static void pl2303_set_break(struct usb_serial_port *port, bool enable);
 
 enum pl2303_type {
 	TYPE_01,	/* Type 0 and 1 (difference unknown) */
 	TYPE_HX,	/* HX version of the pl2303 chip */
+	TYPE_HXN,	/* HXN version of the pl2303 chip */
 	TYPE_COUNT
 };
 
@@ -179,16 +195,26 @@ static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
 	[TYPE_HX] = {
 		.max_baud_rate =	12000000,
 	},
+	[TYPE_HXN] = {
+		.max_baud_rate =	12000000,
+	},
 };
 
 static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
 							unsigned char buf[1])
 {
 	struct device *dev = &serial->interface->dev;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 	int res;
+	u8 request;
+
+	if (spriv->type == &pl2303_type_data[TYPE_HXN])
+		request = VENDOR_READ_NREQUEST;
+	else
+		request = VENDOR_READ_REQUEST;
 
 	res = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
-			VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
+			request, VENDOR_READ_REQUEST_TYPE,
 			value, 0, buf, 1, 100);
 	if (res != 1) {
 		dev_err(dev, "%s - failed to read [%04x]: %d\n", __func__,
@@ -207,12 +233,19 @@ static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
 static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16 index)
 {
 	struct device *dev = &serial->interface->dev;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 	int res;
+	u8 request;
 
 	dev_dbg(dev, "%s - [%04x] = %02x\n", __func__, value, index);
 
+	if (spriv->type == &pl2303_type_data[TYPE_HXN])
+		request = VENDOR_WRITE_NREQUEST;
+	else
+		request = VENDOR_WRITE_REQUEST;
+
 	res = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
-			VENDOR_WRITE_REQUEST, VENDOR_WRITE_REQUEST_TYPE,
+			request, VENDOR_WRITE_REQUEST_TYPE,
 			value, index, NULL, 0, 100);
 	if (res) {
 		dev_err(dev, "%s - failed to write [%04x]: %d\n", __func__,
@@ -292,6 +325,7 @@ static int pl2303_startup(struct usb_serial *serial)
 	struct pl2303_serial_private *spriv;
 	enum pl2303_type type = TYPE_01;
 	unsigned char *buf;
+	int res;
 
 	spriv = kzalloc(sizeof(*spriv), GFP_KERNEL);
 	if (!spriv)
@@ -313,26 +347,37 @@ static int pl2303_startup(struct usb_serial *serial)
 		type = TYPE_01;		/* type 1 */
 	dev_dbg(&serial->interface->dev, "device type: %d\n", type);
 
+	if (type == TYPE_HX) {
+		res = usb_control_msg(serial->dev,
+			usb_rcvctrlpipe(serial->dev, 0),
+			VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
+			PL2303_READ_TYPE_HX_STATUS, 0, buf, 1, 100);
+		if (res != 1)
+			type = TYPE_HXN;
+	}
+
 	spriv->type = &pl2303_type_data[type];
 	spriv->quirks = (unsigned long)usb_get_serial_data(serial);
 	spriv->quirks |= spriv->type->quirks;
 
 	usb_set_serial_data(serial, spriv);
 
-	pl2303_vendor_read(serial, 0x8484, buf);
-	pl2303_vendor_write(serial, 0x0404, 0);
-	pl2303_vendor_read(serial, 0x8484, buf);
-	pl2303_vendor_read(serial, 0x8383, buf);
-	pl2303_vendor_read(serial, 0x8484, buf);
-	pl2303_vendor_write(serial, 0x0404, 1);
-	pl2303_vendor_read(serial, 0x8484, buf);
-	pl2303_vendor_read(serial, 0x8383, buf);
-	pl2303_vendor_write(serial, 0, 1);
-	pl2303_vendor_write(serial, 1, 0);
-	if (spriv->quirks & PL2303_QUIRK_LEGACY)
-		pl2303_vendor_write(serial, 2, 0x24);
-	else
-		pl2303_vendor_write(serial, 2, 0x44);
+	if (type != TYPE_HXN) {
+		pl2303_vendor_read(serial, 0x8484, buf);
+		pl2303_vendor_write(serial, 0x0404, 0);
+		pl2303_vendor_read(serial, 0x8484, buf);
+		pl2303_vendor_read(serial, 0x8383, buf);
+		pl2303_vendor_read(serial, 0x8484, buf);
+		pl2303_vendor_write(serial, 0x0404, 1);
+		pl2303_vendor_read(serial, 0x8484, buf);
+		pl2303_vendor_read(serial, 0x8383, buf);
+		pl2303_vendor_write(serial, 0, 1);
+		pl2303_vendor_write(serial, 1, 0);
+		if (spriv->quirks & PL2303_QUIRK_LEGACY)
+			pl2303_vendor_write(serial, 2, 0x24);
+		else
+			pl2303_vendor_write(serial, 2, 0x44);
+	}
 
 	kfree(buf);
 
@@ -679,13 +724,27 @@ static void pl2303_set_termios(struct tty_struct *tty,
 	if (C_CRTSCTS(tty)) {
 		if (spriv->quirks & PL2303_QUIRK_LEGACY)
 			pl2303_vendor_write(serial, 0x0, 0x41);
-		else
+		else if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
+			pl2303_vendor_write(serial, PL2303_TYPE_HXN_FLOW_CTRL,
+						PL2303_TYPE_HXN_CTRL_RTS_CTS);
+		} else {
 			pl2303_vendor_write(serial, 0x0, 0x61);
+		}
 	} else if (I_IXON(tty) && !I_IXANY(tty) && START_CHAR(tty) == 0x11 &&
 			STOP_CHAR(tty) == 0x13) {
-		pl2303_vendor_write(serial, 0x0, 0xc0);
+		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
+			pl2303_vendor_write(serial, PL2303_TYPE_HXN_FLOW_CTRL,
+						PL2303_TYPE_HXN_CTRL_XON_XOFF);
+		} else {
+			pl2303_vendor_write(serial, 0x0, 0xc0);
+		}
 	} else {
-		pl2303_vendor_write(serial, 0x0, 0x0);
+		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
+			pl2303_vendor_write(serial, PL2303_TYPE_HXN_FLOW_CTRL,
+						PL2303_TYPE_HXN_NONE_FLOW);
+		} else {
+			pl2303_vendor_write(serial, 0x0, 0x0);
+		}
 	}
 
 	kfree(buf);
@@ -726,8 +785,14 @@ static int pl2303_open(struct tty_struct *tty, struct usb_serial_port *port)
 		usb_clear_halt(serial->dev, port->read_urb->pipe);
 	} else {
 		/* reset upstream data pipes */
-		pl2303_vendor_write(serial, 8, 0);
-		pl2303_vendor_write(serial, 9, 0);
+		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
+			pl2303_vendor_write(serial,
+					PL2303_TYPE_HXN_RESET_DOWN_UPSTREAM,
+					 0);
+		} else {
+			pl2303_vendor_write(serial, 8, 0);
+			pl2303_vendor_write(serial, 9, 0);
+		}
 	}
 
 	/* Setup termios */
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index 559941ca884d..fb9dd2ba4456 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -20,6 +20,12 @@
 #define PL2303_PRODUCT_ID_HCR331	0x331a
 #define PL2303_PRODUCT_ID_MOTOROLA	0x0307
 #define PL2303_PRODUCT_ID_ZTEK		0xe1f1
+#define PL2303_PRODUCT_ID_GC		0x23A3
+#define PL2303_PRODUCT_ID_GB		0x23B3
+#define PL2303_PRODUCT_ID_GT		0x23C3
+#define PL2303_PRODUCT_ID_GL		0x23D3
+#define PL2303_PRODUCT_ID_GE		0x23E3
+#define PL2303_PRODUCT_ID_GS		0x23F3
 
 
 #define ATEN_VENDOR_ID		0x0557
-- 
2.20.1

