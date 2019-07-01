Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE245BB63
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 14:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbfGAMVf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 08:21:35 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33186 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbfGAMVf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 08:21:35 -0400
Received: by mail-pl1-f193.google.com with SMTP id c14so7300873plo.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Jul 2019 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9xq2ues8Q1CovpyM7sFR63k8RknJu5yMhK6NAaqbUM=;
        b=hBQUZKpJ77Nar05ok8VFDkKu6urxecVjuv1CEm3M4iiZfKPPGMvOzb9JVU7ampqM8H
         EKzVxjuNvP7Mcm28wedQPgGnp717a+TXv4/SQXaiTkpCDR6sYCIX2yNKfH31xvMAVfjB
         p9el3vNrKQmylGQRHkdRu6DcNeLXOrEMAhC2PFZNDdRp8uW9QbyGNN3qZyz3K7+g9yDa
         vTaIuyMt+HAafgJvh4PQUmmRQVRugoytv3SEFpkh/5k72L7MCLWSo7bIFpsx1y7CDeYe
         T5P7HBWWPeBLjLpXGXcgcNP1h7UoZKJXOvINw+fY5Jm6HNCCAgdA1T2lYYJNwMj+dxD6
         SpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9xq2ues8Q1CovpyM7sFR63k8RknJu5yMhK6NAaqbUM=;
        b=SokJIHNhzjRC7Xi0oSfRTEDKOKt76RBSV4n6Tk61ZYjKBRDmn9BAFYV3HaxY6G3ijp
         kerTnHdGegS0zPkGV/R7NWhQO3N6htcEIbyIs5EdhIm8jAAwauS0WuyDuY8+vDNVrNNh
         eK9e82bXb2jPIlhQOjiSlPmnmv56a0rMyKT4OhnD675BwejXdxV/YExIHjRVbAD5PXZV
         u8sGzFG9iOLejGg/Yw0iCRgE2IJCC6HK7udTc7AVE5X07ZiMg56+WHrgmYWS/O7CKf78
         KrbnKSNfY5XOLalwzgH9GQQSHRm6dUO7fiEo1CZAAAvlhW61lxubvouEcGzv3XS6hdut
         sxiw==
X-Gm-Message-State: APjAAAVehktLzISgnou5ABGBzQU2nQ+Ty/ebEjLRXJbR/Fp5ls6yX1ze
        aElXHY7GOp2UFe2Un6uyaBo=
X-Google-Smtp-Source: APXvYqwuw7GuA0lYwMOs2cWcdbKfcbHpn81oJzbSyTDInywtooDg82KFas3XCRBEzvfPqXCndMkspw==
X-Received: by 2002:a17:902:27e6:: with SMTP id i35mr28671353plg.190.1561983693886;
        Mon, 01 Jul 2019 05:21:33 -0700 (PDT)
Received: from localhost.localdomain (114-25-46-24.dynamic-ip.hinet.net. [114.25.46.24])
        by smtp.gmail.com with ESMTPSA id h6sm650175pfb.20.2019.07.01.05.21.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 05:21:33 -0700 (PDT)
From:   Charles Yeh <charlesyeh522@gmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org
Cc:     charles-yeh@prolific.com.tw, Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH] [PATCH v6] USB: serial: pl2303: Add new PID to support PL2303HXN (TYPE_HXN)
Date:   Mon,  1 Jul 2019 20:21:14 +0800
Message-Id: <20190701122114.2952-1-charlesyeh522@gmail.com>
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
   The default of chip Reset Control is 0xFF(TYPE_HXN), therefore we will
   write 0x00 to reset down/up stream(TYPE_HXN).

4. In pl2303_set_termios: The UART flow control instructions used by
   TYPE_HXN/TYPE_HX/TYPE_01 are different.
   Therefore, we will also execute different instructions here.

5. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_HXN is different
   from the vendor request instruction used by TYPE_HX/TYPE_01,
   it will also execute different instructions here.

6. In pl2303_update_reg: TYPE_HXN used different register for flow control.
   Therefore, we will also execute different instructions here.

Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
changelog:
v6:
1. Modify pl2303_update_reg:TYPE_HXN used different register for flow control.
   Therefore, we will also execute different instructions here.
2. Modify define name: PL2303_HXN_RESET_DOWN_UPSTREAM to
   PL2303_HXN_RESET_CONTROL
3. Re-Sorting flow-control register definition by address.
4. Indent continuation lines at least tw tabs.

v5:
1. Modify pl2303_update_reg
2. add a patch version on subject
3. add a space after each colon at subject line
---
 drivers/usb/serial/pl2303.c | 127 +++++++++++++++++++++++++++++-------
 drivers/usb/serial/pl2303.h |   7 +-
 2 files changed, 108 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index d7abde14b3cf..d36d53b234c4 100644
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
@@ -130,9 +136,11 @@ MODULE_DEVICE_TABLE(usb, id_table);
 
 #define VENDOR_WRITE_REQUEST_TYPE	0x40
 #define VENDOR_WRITE_REQUEST		0x01
+#define VENDOR_WRITE_NREQUEST		0x80
 
 #define VENDOR_READ_REQUEST_TYPE	0xc0
 #define VENDOR_READ_REQUEST		0x01
+#define VENDOR_READ_NREQUEST		0x81
 
 #define UART_STATE_INDEX		8
 #define UART_STATE_MSR_MASK		0x8b
@@ -147,12 +155,22 @@ MODULE_DEVICE_TABLE(usb, id_table);
 #define UART_CTS			0x80
 
 #define PL2303_FLOWCTRL_MASK		0xf0
+#define PL2303_HXN_FLOWCTRL_MASK	0x1C
+#define PL2303_READ_TYPE_HX_STATUS	0x8080
+
+#define PL2303_HXN_RESET_CONTROL	0x07
+#define PL2303_HXN_FLOWCTRL		0x0A
+#define PL2303_HXN_CTRL_XON_XOFF	0x0C
+#define PL2303_HXN_CTRL_RTS_CTS		0x18
+#define PL2303_HXN_CTRL_NONE		0x1C
+
 
 static void pl2303_set_break(struct usb_serial_port *port, bool enable);
 
 enum pl2303_type {
 	TYPE_01,	/* Type 0 and 1 (difference unknown) */
 	TYPE_HX,	/* HX version of the pl2303 chip */
+	TYPE_HXN,	/* HXN version of the pl2303 chip */
 	TYPE_COUNT
 };
 
@@ -184,16 +202,26 @@ static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
 	[TYPE_HX] = {
 		.max_baud_rate		= 12000000,
 	},
+	[TYPE_HXN] = {
+		.max_baud_rate		= 12000000,
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
@@ -212,12 +240,19 @@ static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
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
@@ -232,12 +267,17 @@ static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
 {
 	int ret = 0;
 	u8 *buf;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 
 	buf = kmalloc(1, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	ret = pl2303_vendor_read(serial, reg | 0x80, buf);
+	if (spriv->type == &pl2303_type_data[TYPE_HXN])
+		ret = pl2303_vendor_read(serial, reg, buf);
+	else
+		ret = pl2303_vendor_read(serial, reg | 0x80, buf);
+
 	if (ret)
 		goto out_free;
 
@@ -320,6 +360,7 @@ static int pl2303_startup(struct usb_serial *serial)
 	struct pl2303_serial_private *spriv;
 	enum pl2303_type type = TYPE_01;
 	unsigned char *buf;
+	int res;
 
 	spriv = kzalloc(sizeof(*spriv), GFP_KERNEL);
 	if (!spriv)
@@ -341,26 +382,37 @@ static int pl2303_startup(struct usb_serial *serial)
 		type = TYPE_01;		/* type 1 */
 	dev_dbg(&serial->interface->dev, "device type: %d\n", type);
 
+	if (type == TYPE_HX) {
+		res = usb_control_msg(serial->dev,
+				usb_rcvctrlpipe(serial->dev, 0),
+				VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
+				PL2303_READ_TYPE_HX_STATUS, 0, buf, 1, 100);
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
 
@@ -719,14 +771,34 @@ static void pl2303_set_termios(struct tty_struct *tty,
 	}
 
 	if (C_CRTSCTS(tty)) {
-		if (spriv->quirks & PL2303_QUIRK_LEGACY)
-			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x40);
-		else
-			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x60);
+		if (spriv->quirks & PL2303_QUIRK_LEGACY) {
+			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK,
+				0x40);
+		} else if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
+			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
+				PL2303_HXN_FLOWCTRL_MASK,
+				PL2303_HXN_CTRL_RTS_CTS);
+		} else {
+			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK,
+				0x60);
+		}
 	} else if (pl2303_enable_xonxoff(tty, spriv->type)) {
-		pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
+		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
+			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
+				PL2303_HXN_FLOWCTRL_MASK,
+				PL2303_HXN_CTRL_XON_XOFF);
+		} else {
+			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK,
+				0xc0);
+		}
 	} else {
-		pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
+		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
+			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
+				PL2303_HXN_FLOWCTRL_MASK,
+				PL2303_HXN_CTRL_NONE);
+		} else {
+			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
+		}
 	}
 
 	kfree(buf);
@@ -767,8 +839,13 @@ static int pl2303_open(struct tty_struct *tty, struct usb_serial_port *port)
 		usb_clear_halt(serial->dev, port->read_urb->pipe);
 	} else {
 		/* reset upstream data pipes */
-		pl2303_vendor_write(serial, 8, 0);
-		pl2303_vendor_write(serial, 9, 0);
+		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
+			pl2303_vendor_write(serial, PL2303_HXN_RESET_CONTROL,
+				0);
+		} else {
+			pl2303_vendor_write(serial, 8, 0);
+			pl2303_vendor_write(serial, 9, 0);
+		}
 	}
 
 	/* Setup termios */
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index b0175f17d1a2..4a4a50586d5c 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -20,7 +20,12 @@
 #define PL2303_PRODUCT_ID_HCR331	0x331a
 #define PL2303_PRODUCT_ID_MOTOROLA	0x0307
 #define PL2303_PRODUCT_ID_ZTEK		0xe1f1
-
+#define PL2303_PRODUCT_ID_GC		0x23A3
+#define PL2303_PRODUCT_ID_GB		0x23B3
+#define PL2303_PRODUCT_ID_GT		0x23C3
+#define PL2303_PRODUCT_ID_GL		0x23D3
+#define PL2303_PRODUCT_ID_GE		0x23E3
+#define PL2303_PRODUCT_ID_GS		0x23F3
 
 #define ATEN_VENDOR_ID		0x0557
 #define ATEN_VENDOR_ID2		0x0547
-- 
2.20.1

