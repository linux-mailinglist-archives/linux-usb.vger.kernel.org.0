Return-Path: <linux-usb+bounces-21845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CCA676F8
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 15:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BEA216B398
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 14:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850DD20E01E;
	Tue, 18 Mar 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b="zHaPeBJ3"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86D920E706
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309565; cv=none; b=tYk9xfQOLyiEeMvaM08snX6RlI8ZgFvkqWsUFvxGUXAriWd5416rsVrCLrKBjhnr5vxvkG0IVyI0PFtxK/BOsuCs7PKEWcXeJxm7lQp4KGYgr9dAmL4Dxa7nVd90cn46QZXQbUs7W6Ft+5P7RDbigLdY5uSdPqOlhVXJibPQ1vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309565; c=relaxed/simple;
	bh=GsClX9lXfgOTUK/SBc60Kx1MvDc+mSlT2+6CMj2NevU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WJL6la1/FLFBsyACqJg8lKgV0EpTk2efiUdxm9FQlp7sHgHeONq0/6bCeH28IcS/3pnBacU2eSN13E7UEoxzg7KXWRN68TsUOPTm39/woHaA3k+uWrRhjXSw3RG06bqFNnsCZXCukY0dCbEkgGs78dV+Ndki2idf3MAXO4u1J3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org; spf=pass smtp.mailfrom=jookia.org; dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b=zHaPeBJ3; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jookia.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1742309550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mD9gjISmFfmFyNt9ZaR5QZvNxXpnZhmWQGXGd9rJEUc=;
	b=zHaPeBJ3CvByyQCkswtT2HKswUtLC+zmsu4TMgac4Gn2TAM7tSCHd4nbKTp1hVDtQ1B6Mx
	7rUDEcBSRMaHgHa7TKM2g1zORtSxc4e/2q90vjJjwXzGSL4rL3SwlgG6xn/Qii9xLxFHL5
	zLP250HiI3TVVWW+Y5wA7XZjnxaws5ojZPMUymm8WzXCtvK/XCJH1APkHRKAUmHMjz/TFd
	9zcinQUPUlo1HxjXlAkSF094xJTMBVl6p12pWQ8aM3t2BEj4rNwP83aUtCjn34md+HP2fG
	8y7lJ96Fa+w3JmSQAHH1d7wD6/lECWyk4JBQJ/BvTHNDWqJK3nrs/EZ1AjvegQ==
From: John Watts <contact@jookia.org>
Date: Wed, 19 Mar 2025 01:52:20 +1100
Subject: [PATCH] USB: serial: ch341: Clear interrupt register after each
 interrupt
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-ch341-v1-1-9f33f051fc6a@jookia.org>
X-B4-Tracking: v=1; b=H4sIAKOI2WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0NL3eQMYxND3cTEJEtLY5M0w2RzIyWg2oKi1LTMCrA50bG1tQDhMjW
 sVwAAAA==
X-Change-ID: 20250319-ch341-aab9934f1c72
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 John Watts <contact@jookia.org>
X-Developer-Signature: v=1; a=openssh-sha256; t=1742309540; l=4895;
 i=contact@jookia.org; h=from:subject:message-id;
 bh=GsClX9lXfgOTUK/SBc60Kx1MvDc+mSlT2+6CMj2NevU=;
 b=U1NIU0lHAAAAAQAAAEoAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAAAgPs7MDd2XR
 g2uRE9caV1lPPPeu0VzIG9fPrrVmYyAhLcAAAAEc3NoOgAAAAZwYXRhdHQAAAAAAAAABnNoYTUx
 MgAAAGcAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAABAUSMJPYu1wDHaiiiR4a5D6A+
 dGQ4RzMRlIvrme4Zyng/fcaiAhjrwU2uJwUkXnRnoM2VGd48GrFsW5NNvgsS5BAUAAVLJ
X-Developer-Key: i=contact@jookia.org; a=openssh;
 fpr=SHA256:/gEvgms/9HpbgpcH+K7O4GYXmqkP7siJx9zHeEWRZTg
X-Migadu-Flow: FLOW_OUT

The CH340 adapter I have won't send interrupts unless you clear the
0x2727 register after each interrupt. The Windows driver does this but
neither the mainline Linux or OEM Linux driver do this.

Without this fix the device status flags for hardware flow control are
never updated.

As far as I can tell there is not a register to configure this
behaviour, this seems to be a hardware quirk. The chip reports an
identical version, vendor and product to a working chip. It's possible
this is a clone chip only tested against Windows.

Signed-off-by: John Watts <contact@jookia.org>
---
This fixes hardware flow control flags like RTS and CTS not updating on
a specific (fake?) CH340 chip I have.

John Paul Morrison reported an issue that sounds similar to this one in
2022:
https://lore.kernel.org/all/YlP1poVgy0bAP3MN@hovoldconsulting.com/T/
---
 drivers/usb/serial/ch341.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index d10e4c4848a0ab9073c4c93638a8796ab61ce3a6..8edbac18146cebd0ff7b9cfaca6853a2c5f047df 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -63,6 +63,7 @@
 #define CH341_REG_DIVISOR      0x13
 #define CH341_REG_LCR          0x18
 #define CH341_REG_LCR2         0x25
+#define CH341_REG_INTERRUPT    0x2727
 
 #define CH341_NBREAK_BITS      0x01
 
@@ -102,6 +103,9 @@ struct ch341_private {
 	u8 version;
 
 	unsigned long break_end;
+
+	struct work_struct interrupt_work;
+	struct usb_serial_port *port;
 };
 
 static void ch341_set_termios(struct tty_struct *tty,
@@ -306,6 +310,32 @@ static int ch341_get_status(struct usb_device *dev, struct ch341_private *priv)
 	return 0;
 }
 
+static int ch341_clear_interrupt(struct usb_device *dev)
+{
+	int r;
+
+	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
+			CH341_REG_INTERRUPT, 0);
+	if (r)
+		return r;
+
+	return 0;
+}
+
+static void ch341_interrupt_work(struct work_struct *work)
+{
+	struct ch341_private *priv =
+		container_of(work, struct ch341_private, interrupt_work);
+	struct usb_serial_port *port = priv->port;
+	int ret;
+
+	ret = ch341_clear_interrupt(port->serial->dev);
+	if (ret < 0) {
+		dev_err_once(&port->dev, "failed to clear interrupt: %d\n",
+			ret);
+	}
+}
+
 /* -------------------------------------------------------------------------- */
 
 static int ch341_configure(struct usb_device *dev, struct ch341_private *priv)
@@ -399,6 +429,9 @@ static int ch341_port_probe(struct usb_serial_port *port)
 	if (r < 0)
 		goto error;
 
+	INIT_WORK(&priv->interrupt_work, ch341_interrupt_work);
+	priv->port = port;
+
 	return 0;
 
 error:	kfree(priv);
@@ -438,8 +471,10 @@ static void ch341_dtr_rts(struct usb_serial_port *port, int on)
 
 static void ch341_close(struct usb_serial_port *port)
 {
+	struct ch341_private *priv = usb_get_serial_port_data(port);
 	usb_serial_generic_close(port);
 	usb_kill_urb(port->interrupt_in_urb);
+	flush_work(&priv->interrupt_work);
 }
 
 
@@ -466,6 +501,12 @@ static int ch341_open(struct tty_struct *tty, struct usb_serial_port *port)
 		goto err_kill_interrupt_urb;
 	}
 
+	r = ch341_clear_interrupt(port->serial->dev);
+	if (r < 0) {
+		dev_err(&port->dev, "failed to clear interrupt: %d\n", r);
+		goto err_kill_interrupt_urb;
+	}
+
 	r = usb_serial_generic_open(tty, port);
 	if (r)
 		goto err_kill_interrupt_urb;
@@ -474,6 +515,7 @@ static int ch341_open(struct tty_struct *tty, struct usb_serial_port *port)
 
 err_kill_interrupt_urb:
 	usb_kill_urb(port->interrupt_in_urb);
+	flush_work(&priv->interrupt_work);
 
 	return r;
 }
@@ -747,6 +789,7 @@ static void ch341_update_status(struct usb_serial_port *port,
 static void ch341_read_int_callback(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
+	struct ch341_private *priv = usb_get_serial_port_data(port);
 	unsigned char *data = urb->transfer_buffer;
 	unsigned int len = urb->actual_length;
 	int status;
@@ -770,6 +813,8 @@ static void ch341_read_int_callback(struct urb *urb)
 
 	usb_serial_debug_data(&port->dev, __func__, len, data);
 	ch341_update_status(port, data, len);
+	schedule_work(&priv->interrupt_work);
+
 exit:
 	status = usb_submit_urb(urb, GFP_ATOMIC);
 	if (status) {
@@ -830,6 +875,12 @@ static int ch341_reset_resume(struct usb_serial *serial)
 			dev_err(&port->dev, "failed to read modem status: %d\n",
 				ret);
 		}
+
+		ret = ch341_clear_interrupt(port->serial->dev);
+		if (ret < 0) {
+			dev_err(&port->dev, "failed to clear interrupt: %d\n",
+				ret);
+		}
 	}
 
 	return usb_serial_generic_resume(serial);

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250319-ch341-aab9934f1c72

Best regards,
-- 
John Watts <contact@jookia.org>


