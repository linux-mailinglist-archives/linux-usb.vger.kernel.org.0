Return-Path: <linux-usb+bounces-35506-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CETvHvwnxWkU7QQAu9opvQ
	(envelope-from <linux-usb+bounces-35506-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 13:35:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDB0335434
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 13:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAD4A300E171
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 12:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FFB332616;
	Thu, 26 Mar 2026 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PP4ZXDdd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7226AC3
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528235; cv=none; b=kQ3ldeKrx3l5Kk9/MaDWiG7Wf/9nKuGVWkWy7cyTRPokwguM0+H/FIxc5BjrdOyPwyHnPdKzn9vED5LOGynit7lltrEPrFf2MTCvk9avq4NRYkQnxI/4+OamW+NQ8laMfSYDTeQ0U+rnjuwr5FPsqd7rK8ZZC9wPrk7MdzysOcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528235; c=relaxed/simple;
	bh=PI57nXkzKLftcZbxM0TI2LYKp9w4h0YDIS2/wGyTBtE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G/zmC1qXO6LkD0r13ZKqN56bIYlXtrQ19cT11acg1ZVWNdc0wo/kHKtJkrjON3FIQ18lfPtGFpt2vOFwhjRTGtkPQyVZoUCbHrWhJYdGuG+dFjGhRMRaIfjsxi/MnraoVRzNLFttJGZhbe4nSdnBTzMVbsjjcbR2ZVhptlHT7+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PP4ZXDdd; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35c16db1b53so541392a91.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774528233; x=1775133033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttSO1Wgv3yMDZ4ooUtgGqzkKuaVSE7o61jwTl3weWWo=;
        b=PP4ZXDddwwUPVt0YEimlx5NquGh0aOW88oAAIB/8K0fTCE6NsPwg5DbUfa+nxzBmbt
         Xrq98iOUgZC+OL6jvXroqHh5fvPQtcYkUNgSYlsJ9Ih66n145duwKub9M6xoa9tZQOOu
         reex0m55lFSnwJCBDbqa6rvrJbckCXePa6J8Z0CVnVoAIcO32rZWpqG6Q9Bqbnq5LLJg
         KBdCZ0ozaf6FOnSH7+gnqaBt09nvaq1D1QcedRZVft0JsRsN7T80cKREifYBcmo2xc66
         pP64mGVmdxMYMlisRU3syBAovzpI184s4ya5daOydVIU6NGP3nMpS3Oe/YL210j/nAHv
         H0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528233; x=1775133033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttSO1Wgv3yMDZ4ooUtgGqzkKuaVSE7o61jwTl3weWWo=;
        b=L4QDmjZRnBJUfmHuMmcmqUJgIG4pNzfghrWSrGICeRzW/jk5iBymqaINnAyTqviFB7
         sXjKcolfpEvNdnsEu4EQATvZvDaJyjQWkLkY5yS+I1CRKhOcs5nP3SBPSWTA2FUpS5Er
         O/WbnfUbd7n5jlmcqX6btYBCJr1SbOvN0339QJcLXx5AhV+Kly+7HUzChP1fE4RNtR8f
         kTfxr1SW0hpdsf5GvffZ0ydoQo7MzIM4+QunKPXdvIFq6r3mXtHljXt/yALg1xK/Xevx
         a3Zu4vkXC+yVn/vF6iVbk2joMSs88uS6/g7CG1YLg8zrhlc5Ut3KOMo1oGYatluWspmn
         o3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVyZYaIJTzRYbjeoulm7WvgTmLN28hntg2WU+/nTRxt0nYY2Ndi1xFczLxRQjTWYozyO5wkaBWvnug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1+TqtjF+qZMiOL1BvWppFmygR4zUPeizMo3xI+jZtDuoEQxAH
	rXy67D9ZZ6mN65iXWlOvs/dufGa8j1QLvdgGdaSLr7CnpyeWbJbEIp6ZDFD6sEj+wy8=
X-Gm-Gg: ATEYQzx+0LBF6PVxgtyC3FZc24s6ZiSNOFSXADxYv2ySMh/7Ikdg9QzVbJJ0UT1JEcQ
	P+Eqdq3Lpqc0oe5jVGFSNhH/VzZAAtv6MN2p27pn06Ntz+RAuiZs8cy0EY3+NiixqKLJXmb51wB
	+QCg9EYOLxWVe0KIxBwbH8BJBzTyRmf0OanPZgmqNQXxjCZrstkQ+JSKbVfBUfToad5OM/ux4xR
	diqQU1578hgn/QkLeKrwQVhp+45LVpjEgDNKoH2BsUurAGwB+HJQRpX2vVNtBk+LEhKlmY8z2Rz
	W82f+QfgbBFLDdHwec3Y2RXJxvEjNhAGkO7sqa0kZfhVl9QpHowPGL4IJxYIFMEhEngDm9y1WyJ
	SF8d0Z0IRN8fV2z0F1jb1V/JXGLN4lWzUZvDxPxlDVvuNP5F42izluEvYI5K3Fc7nPy973MXLn2
	bhyQ+kVEFHupPtEO2i5iG1UG4T586erDtUbhvdO0CSdl61kACUh+50FXSoh+QG2qpoU/tuwn4hj
	9ZUb6YfWCaDK/EGCTeytvmqcT5jAG9P1c+/4VKt1flWhs0j6w==
X-Received: by 2002:a17:90b:2e46:b0:35b:a7be:ae62 with SMTP id 98e67ed59e1d1-35c0dde3e2amr6552100a91.30.1774528232761;
        Thu, 26 Mar 2026 05:30:32 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-3815-168d-099c-8cde-4cb5-f889.dynamic-ip6.hinet.net. [2001:b011:3815:168d:99c:8cde:4cb5:f889])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a81757sm2180387a91.6.2026.03.26.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:30:32 -0700 (PDT)
From: Charles Yeh <charlesyeh522@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-usb@vger.kernel.org
Cc: charles-yeh@prolific.com.tw,
	Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH v2] USB: serial: pl2303: add new PID to support PL256X (TYPE_MP)
Date: Thu, 26 Mar 2026 20:30:23 +0800
Message-Id: <20260326123023.1711-1-charlesyeh522@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[prolific.com.tw,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35506-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charlesyeh522@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EDDB0335434
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
v2:
 - remove unused variable 'dev' in pl2303_update_reg
---
 drivers/usb/serial/pl2303.c | 109 +++++++++++++++++++++++++++++++++---
 drivers/usb/serial/pl2303.h |   2 +-
 2 files changed, 103 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 50dc838e8115..67b78d2fcc92 100644
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
 
@@ -307,10 +354,12 @@ static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
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
@@ -461,6 +510,14 @@ static int pl2303_detect_type(struct usb_serial *serial)
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
@@ -495,6 +552,7 @@ static int pl2303_startup(struct usb_serial *serial)
 	enum pl2303_type type;
 	unsigned char *buf;
 	int ret;
+	unsigned int ifnum;
 
 	ret = pl2303_detect_type(serial);
 	if (ret < 0)
@@ -503,20 +561,42 @@ static int pl2303_startup(struct usb_serial *serial)
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
@@ -578,13 +658,15 @@ static void pl2303_port_remove(struct usb_serial_port *port)
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
 
@@ -764,7 +846,7 @@ static int pl2303_get_line_request(struct usb_serial_port *port,
 
 	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 				GET_LINE_REQUEST, GET_LINE_REQUEST_TYPE,
-				0, 0, buf, 7, 100);
+				0, spriv->interface_num, buf, 7, 100);
 	if (ret != 7) {
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, ret);
 
@@ -783,11 +865,13 @@ static int pl2303_set_line_request(struct usb_serial_port *port,
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
@@ -942,6 +1026,9 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_RTS_CTS);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_vendor_write(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_RTS_CTS);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x60);
 		}
@@ -950,6 +1037,9 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_XON_XOFF);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_vendor_write(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_XON_XOFF);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
 		}
@@ -958,6 +1048,9 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_NONE);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_vendor_write(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_NONE);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
 		}
@@ -1005,6 +1098,8 @@ static int pl2303_open(struct tty_struct *tty, struct usb_serial_port *port)
 			pl2303_vendor_write(serial, PL2303_HXN_RESET_REG,
 					PL2303_HXN_RESET_UPSTREAM_PIPE |
 					PL2303_HXN_RESET_DOWNSTREAM_PIPE);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl256x_uart_reset(serial, 0, spriv->interface_num);
 		} else {
 			pl2303_vendor_write(serial, 8, 0);
 			pl2303_vendor_write(serial, 9, 0);
@@ -1115,7 +1210,7 @@ static int pl2303_set_break(struct usb_serial_port *port, bool enable)
 
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


