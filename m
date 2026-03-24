Return-Path: <linux-usb+bounces-35390-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFKeNA2JwmkLewQAu9opvQ
	(envelope-from <linux-usb+bounces-35390-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 13:52:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C0308B14
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 13:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9141305322A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 12:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCEF307492;
	Tue, 24 Mar 2026 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpeqCRT1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F1F2F9985
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356395; cv=none; b=O8Xpt5g6VvJARSylUPgfgaCnGy9R43mLzk1P6Lr/Lyawj9x3s6rRHi2ciA1HQ3mfQntQ5ERMw9fxnZRA8fHRiR8F6q+bLSl3LCzxGq574xsYzWbrB58Da/z/pMwe2qh26NyXtHE0zQ6+25CYGz+4y50MFLEVlT6+QO1CFP4QzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356395; c=relaxed/simple;
	bh=rs2tG+ZS48qYQKBFBc/jVdYwx/zYxuVGz8dNd89numg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g4RkdW/JqQK7Ocku6un76jqnFfoR9QS65MY1039mrPTVtWuUI7PL1NNA3f3oNDpfwslVVf/hTY7uePpwLMXtex6+nCraohON4yuO2yPzA0uzuLCaSL2YWVYxk1XTnfJrl/F4J3zjdTnplMbWkGqaIGYyckxhPUD0BFUiJTo4Clc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpeqCRT1; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-358ed696623so1850520a91.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774356393; x=1774961193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFnRgr19eG6pSFMCREHbcoZh394B45O1znTyphiEiew=;
        b=DpeqCRT1505q0FfHE88qf+4RtzaQ3521dkscELdHgObP1fjRcMZsTBAHLes8ttMFaO
         5pRiUOxNQrqaaV6DwbI5ixmRdD7gF4FI3pa8sk41VVA+kjRpN7YGXSdGe9N852DKG2o3
         73cVDrXsAKVRlsVXw0OTuAi71+60qWp7edYPkHk8L+ebkAKULfbVMipYbUOeA7rKlok8
         Mh0v1UBA8VGR6zFSV1G6rGQ9qV9cOvfVKpT0Z0e5Z7RUeQduSdqMTYr0T1M3Czu3sbcz
         AkrCu3WKL8icry7HagY4H3cSc0rxRTE2whBn/Z8yRqY+DSZD4Pifj/ow3SJK7cNhV232
         M+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774356393; x=1774961193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFnRgr19eG6pSFMCREHbcoZh394B45O1znTyphiEiew=;
        b=KbsvEsl5hZaIt56i54UQWZPJSse/rSOtWE+XaA5ZLA9my4qlT3TK+6Y17omO4S+Tvo
         8mcNPqMcdVDg7oD1n/YSNOcYEEb+AIUHXToyMQmkvpp3LQaqT9NiRFIKuY1PmY26L9kw
         opL4Vyamo4HcNHWMh8Fz7qTLJq9xYmgrQhvpWflPw5ZejkUGGGrGz35jEJqHbfztMaVk
         reCRmPslWJSo46GFxDwlDDkZozvgUzCUwEb/RsN956JGIR2wOpR6fT0tM687HjLpulYQ
         BGGgpQeNIC5P/7SfmxNrmr0Amb5DoLxsJFlR1OkvL8+UH0K6h9lHx2YVjkc0ThcOv/Cr
         RrUw==
X-Forwarded-Encrypted: i=1; AJvYcCUzrWZg2M91uO4IGr/YE/rvwAbQxGtzq4uUwX4IHdpv4WEpCbluBU/zoyOrMepkcFMCuG+E5Ulsgv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP9B9QTBFK2QDM70QkFNiEjTV0JtnS7/sg5VZ7GP/Pye1k5q9J
	CBixQnY8bac+FatDQQ6EHBtGWtOZmoA5sLQ+yFDOHv3im7XCC2NGt/4lOp8qm/Rg
X-Gm-Gg: ATEYQzxpPXYsDe+55okwYcilz/qYrHl2hyFMtnLS9ZM1krixBD9wWdjeZt1mVlD1b5O
	+jB8Yly6F4wUhYN0HJvHF/foZS0DLIRb5Soosde5+dDOe1PvwmiJStw1qPFeKbbMQPkFnYEpshA
	dD8+tvPBgrp6sQDsFy1nrPGmIFqeMDEaMPCFZGq8dtV2i1g7bHffBffoyf0CW6V0WDdBeoGvA/T
	L15bjtql6UQnasB6IizJQ0Hgdxi50XcqV5+6wzk+R3xJD7reQfMtN20AcMCNVurXN9H+K1QeTVT
	Ub6pc89nXHxFq4OsFR+/t2QgdIFGeTn1cUR95/p6+HXSXrwWKnyTWP+7zLqrQc43N5mF75zWtQ9
	uE68FfM2sKb1RfLZsdqF7MlrAg8x4KXvk/GubvouTH484PMl2TlFGDJtVQtLukfDtIpFI2TSLJV
	fPQJARjCdngCCjEaMqhfbKdvhW8YjQmrGR71+wD6H4QWeg/+KNWLkDvtO2CSA0eu/52j+OkGQhs
	zE7JOm0Lqs9Gex9Ej+myHwuhtaTMwxrXPDHkJVdghkGp/2Uecs=
X-Received: by 2002:a17:90b:380c:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-35bd2be6e27mr13252982a91.12.1774356392554;
        Tue, 24 Mar 2026 05:46:32 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-3815-168d-d124-984e-ab7c-6a3c.dynamic-ip6.hinet.net. [2001:b011:3815:168d:d124:984e:ab7c:6a3c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c031ed064sm2393095a91.9.2026.03.24.05.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:46:32 -0700 (PDT)
From: Charles Yeh <charlesyeh522@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-usb@vger.kernel.org
Cc: charles-yeh@prolific.com.tw,
	Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH] USB: serial: pl2303: add new PID to support PL256X (TYPE_MP)
Date: Tue, 24 Mar 2026 20:46:19 +0800
Message-Id: <20260324124619.843-1-charlesyeh522@gmail.com>
X-Mailer: git-send-email 2.32.0.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[prolific.com.tw,gmail.com];
	TAGGED_FROM(0.00)[bounces-35390-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charlesyeh522@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A88C0308B14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Prolific has developed a new USB to Multi-UART chip: PL256X (TYPE_MP)
PL256X : PL2543,PL2533,PL2565
The Vendor request used by the PL256X (TYPE_MP) is different from
the existing PL2303 series (TYPE_HXN / TYPE_HX ).
Therefore, different Vendor requests are used to issue related commands.

1. Added a new TYPE_MP type in pl2303_type, and then executes
   new Vendor request,new flow control and other related instructions
   if TYPE_MP is recognized.

2. Added a interface_num in pl2303_serial_private, and then executes
   new USB index request, if TYPE_MP is recognized.

3. Because the new PL256X only accept the new Vendor request,
   the old Vendor request cannot be accepted (the error message
   will be returned)
   So first determine the bcdDevice in pl2303_detect_type.

4. In pl2303_open: Because TYPE_MP is different from the instruction of reset
   down/up stream used by TYPE_HXN/TYPE_HX.
   Therefore, we will also execute different instructions here.
   pl256x_uart_reset

5. In pl2303_set_termios: The UART flow control instructions used by
   TYPE_MP/TYPE_HXN/TYPE_HX are different.
   Therefore, we will also execute different instructions here.

6. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_MP is different
   from the vendor request instruction used by TYPE_HXN/TYPE_HX,
   it will also execute different instructions here.

7. In pl2303_update_reg: TYPE_MP used different register for flow control.
   Therefore, we will also execute different instructions here.

8. The max baud rate of TYPE_MP is 24M bps, and don't support divisor encoding.

Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
 drivers/usb/serial/pl2303.c | 110 +++++++++++++++++++++++++++++++++---
 drivers/usb/serial/pl2303.h |   2 +-
 2 files changed, 104 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 50dc838e8115..e5bbda1d63b3 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -54,6 +54,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL256X_PRODUCT_ID_4P) },
 	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID) },
 	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID_RSAQ5) },
 	{ USB_DEVICE(ATEN_VENDOR_ID, ATEN_PRODUCT_ID),
@@ -144,10 +145,15 @@ MODULE_DEVICE_TABLE(usb, id_table);
 #define VENDOR_WRITE_REQUEST_TYPE	0x40
 #define VENDOR_WRITE_REQUEST		0x01
 #define VENDOR_WRITE_NREQUEST		0x80
+#define VENDOR_WRITE_MPREQUEST		0x80
 
 #define VENDOR_READ_REQUEST_TYPE	0xc0
 #define VENDOR_READ_REQUEST		0x01
 #define VENDOR_READ_NREQUEST		0x81
+#define VENDOR_READ_MPREQUEST		0x80
+
+#define PL256X_RESET_REQUEST_TYPE	0x40
+#define PL256X_RESET_REQUEST		0x96
 
 #define UART_STATE_INDEX		8
 #define UART_STATE_MSR_MASK		0x8b
@@ -175,6 +181,16 @@ MODULE_DEVICE_TABLE(usb, id_table);
 #define PL2303_HXN_FLOWCTRL_RTS_CTS	0x18
 #define PL2303_HXN_FLOWCTRL_XON_XOFF	0x0c
 
+#define PL256X_PORT_A_FLOWCTRL_REG	0xC005
+#define PL256X_PORT_B_FLOWCTRL_REG	0xD005
+#define PL256X_PORT_C_FLOWCTRL_REG	0xE005
+#define PL256X_PORT_D_FLOWCTRL_REG	0xF005
+
+#define PL256X_FLOWCTRL_MASK		0x43
+#define PL256X_FLOWCTRL_XON_XOFF	0x40
+#define PL256X_FLOWCTRL_RTS_CTS		0x03
+#define PL256X_FLOWCTRL_NONE		0x00
+
 static int pl2303_set_break(struct usb_serial_port *port, bool enable);
 
 enum pl2303_type {
@@ -184,6 +200,7 @@ enum pl2303_type {
 	TYPE_TB,
 	TYPE_HXD,
 	TYPE_HXN,
+	TYPE_MP,
 	TYPE_COUNT
 };
 
@@ -199,6 +216,8 @@ struct pl2303_type_data {
 struct pl2303_serial_private {
 	const struct pl2303_type_data *type;
 	unsigned long quirks;
+	u16 interface_num;
+	u16 flowctrl_reg;
 };
 
 struct pl2303_private {
@@ -239,8 +258,32 @@ static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
 		.max_baud_rate		= 12000000,
 		.no_divisors		= true,
 	},
+	[TYPE_MP] = {
+		.name			= "MP",
+		.max_baud_rate		= 24000000,
+		.no_divisors		= true,
+	},
 };
 
+static int pl256x_uart_reset(struct usb_serial *serial, u16 value, u16 index)
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
@@ -251,6 +294,8 @@ static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
 
 	if (spriv->type == &pl2303_type_data[TYPE_HXN])
 		request = VENDOR_READ_NREQUEST;
+	else if (spriv->type == &pl2303_type_data[TYPE_MP])
+		request = VENDOR_READ_MPREQUEST;
 	else
 		request = VENDOR_READ_REQUEST;
 
@@ -282,6 +327,8 @@ static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16 index)
 
 	if (spriv->type == &pl2303_type_data[TYPE_HXN])
 		request = VENDOR_WRITE_NREQUEST;
+	else if (spriv->type == &pl2303_type_data[TYPE_MP])
+		request = VENDOR_WRITE_MPREQUEST;
 	else
 		request = VENDOR_WRITE_REQUEST;
 
@@ -300,6 +347,7 @@ static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16 index)
 static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
 {
 	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
+	struct device *dev = &serial->interface->dev;
 	int ret = 0;
 	u8 *buf;
 
@@ -307,10 +355,12 @@ static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
 	if (!buf)
 		return -ENOMEM;
 
-	if (spriv->type == &pl2303_type_data[TYPE_HXN])
+	if (spriv->type == &pl2303_type_data[TYPE_HXN] ||
+		spriv->type == &pl2303_type_data[TYPE_MP]) {
 		ret = pl2303_vendor_read(serial, reg, buf);
-	else
+	} else {
 		ret = pl2303_vendor_read(serial, reg | 0x80, buf);
+	}
 
 	if (ret)
 		goto out_free;
@@ -461,6 +511,14 @@ static int pl2303_detect_type(struct usb_serial *serial)
 		case 0x905:	/* GT-2AB */
 		case 0x1005:	/* GC-Q20 */
 			return TYPE_HXN;
+		case 0x3302:
+		case 0x3304:
+		case 0x4302:
+		case 0x4304:
+		case 0x6502:
+		case 0x6504:
+		case 0x6506:
+			return TYPE_MP;
 		}
 		break;
 	}
@@ -495,6 +553,7 @@ static int pl2303_startup(struct usb_serial *serial)
 	enum pl2303_type type;
 	unsigned char *buf;
 	int ret;
+	unsigned int ifnum;
 
 	ret = pl2303_detect_type(serial);
 	if (ret < 0)
@@ -503,20 +562,42 @@ static int pl2303_startup(struct usb_serial *serial)
 	type = ret;
 	dev_dbg(&serial->interface->dev, "device type: %s\n", pl2303_type_data[type].name);
 
+	ifnum = serial->interface->altsetting->desc.bInterfaceNumber;
+
 	spriv = kzalloc_obj(*spriv);
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
+	spriv->interface_num = ifnum;
 
 	if (type == TYPE_HXD && pl2303_is_hxd_clone(serial))
 		spriv->quirks |= PL2303_QUIRK_NO_BREAK_GETLINE;
 
 	usb_set_serial_data(serial, spriv);
 
-	if (type != TYPE_HXN) {
+	if (type == TYPE_MP)
+		pl2303_vendor_write(serial, spriv->flowctrl_reg, PL256X_FLOWCTRL_NONE);
+	else if (type != TYPE_HXN) {
 		buf = kmalloc(1, GFP_KERNEL);
 		if (!buf) {
 			kfree(spriv);
@@ -578,13 +659,15 @@ static void pl2303_port_remove(struct usb_serial_port *port)
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
+				 value, spriv->interface_num, NULL, 0, 100);
 	if (retval)
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, retval);
 
@@ -764,7 +847,7 @@ static int pl2303_get_line_request(struct usb_serial_port *port,
 
 	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 				GET_LINE_REQUEST, GET_LINE_REQUEST_TYPE,
-				0, 0, buf, 7, 100);
+				0, spriv->interface_num, buf, 7, 100);
 	if (ret != 7) {
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, ret);
 
@@ -783,11 +866,13 @@ static int pl2303_set_line_request(struct usb_serial_port *port,
 							unsigned char buf[7])
 {
 	struct usb_device *udev = port->serial->dev;
+	struct usb_serial *serial = port->serial;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 	int ret;
 
 	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
 				SET_LINE_REQUEST, SET_LINE_REQUEST_TYPE,
-				0, 0, buf, 7, 100);
+				0, spriv->interface_num, buf, 7, 100);
 	if (ret < 0) {
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, ret);
 		return ret;
@@ -942,6 +1027,9 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_RTS_CTS);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_vendor_write(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_RTS_CTS);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x60);
 		}
@@ -950,6 +1038,9 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_XON_XOFF);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_vendor_write(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_XON_XOFF);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
 		}
@@ -958,6 +1049,9 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_NONE);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_vendor_write(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_NONE);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
 		}
@@ -1005,6 +1099,8 @@ static int pl2303_open(struct tty_struct *tty, struct usb_serial_port *port)
 			pl2303_vendor_write(serial, PL2303_HXN_RESET_REG,
 					PL2303_HXN_RESET_UPSTREAM_PIPE |
 					PL2303_HXN_RESET_DOWNSTREAM_PIPE);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl256x_uart_reset(serial, 0, spriv->interface_num);
 		} else {
 			pl2303_vendor_write(serial, 8, 0);
 			pl2303_vendor_write(serial, 9, 0);
@@ -1115,7 +1211,7 @@ static int pl2303_set_break(struct usb_serial_port *port, bool enable)
 
 	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
 				 BREAK_REQUEST, BREAK_REQUEST_TYPE, state,
-				 0, NULL, 0, 100);
+				 spriv->interface_num, NULL, 0, 100);
 	if (result) {
 		dev_err(&port->dev, "error sending break = %d\n", result);
 		return result;
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index d60eda7f6eda..8eb1e7b5d3ec 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -26,7 +26,7 @@
 #define PL2303_PRODUCT_ID_HCR331	0x331a
 #define PL2303_PRODUCT_ID_MOTOROLA	0x0307
 #define PL2303_PRODUCT_ID_ZTEK		0xe1f1
-
+#define PL256X_PRODUCT_ID_4P		0x2533
 
 #define ATEN_VENDOR_ID		0x0557
 #define ATEN_VENDOR_ID2		0x0547
-- 
2.51.0


