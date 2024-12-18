Return-Path: <linux-usb+bounces-18656-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2369F6C64
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 18:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE017169060
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 17:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8311FA8D8;
	Wed, 18 Dec 2024 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b="MSBI0u/V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCBC153BF7;
	Wed, 18 Dec 2024 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734543417; cv=none; b=PE8T49ExXnLHDoGaTOqCO8M14Ehc+q04oCaHXHYZBQ51O1m//mO82oXqY/KD7KM8qldvMJ5Apbp9I/7cx18tJEXszaoQ+uaqIksFZRxDvX5MLNkXCT9zdsoVs36jlFKnzko6THskilM6nHiefDZv+iKfarh2KGqo8tOaZoWdGlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734543417; c=relaxed/simple;
	bh=+xdIeD+NVU++6kXkYUXE6kSZEzB3OKK/7vpuCq3ViU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RmjrOUZ4gzejaRXAa1QWDD7YFhe2aH0EyAs0FWgtXbpK1/Z6mJPhlSWRuh2Ru4V8sDYD3zhPJGOFRtPeLi778nmNcE0TCGhGSn+kuFG5Vbktmd26R0rrVbAASSnV7GIabQt2/HPGrYfcLFMFgweEmDmGiPpyY1Gl8HwMHhNL+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com; spf=pass smtp.mailfrom=lodewillems.com; dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b=MSBI0u/V; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lodewillems.com
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YD17x0qlCz9t00;
	Wed, 18 Dec 2024 18:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lodewillems.com;
	s=MBO0001; t=1734543405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6TZboJLzCLEyQkE1qCAlqpx+rXuN+caXrOTcAeOcuPY=;
	b=MSBI0u/Vdtr/U1VgyFw9/NERcpRZNMuOSU1JdvjHqKYx3zcLe6gLDHHXFYU9CXSrNEN05o
	hY1BZsPi3p0wjZSa2vHpwg6oIXpkvLcWZJTa6rHUziCGVKwXQrFpuhGCOGCmYBgn0O6vOh
	9szBBWFd/DMy2A3gVIEbUQ3InPx3ZwPbnN976LkqB0Dw5im6pGnywpT4+7eWG8rFOqUCU9
	6dz/DwY3T8c8zuh9jtSCBKqZzZ80H1eIwU9ZQ/THEjwOwe2AOEPEgi2ioF6p/Awnwui/is
	v/oubLtYiRsu6Ttvf45UjUX1iuYWqn4caukfjKBlD3hOiNa4dAMIpGW1ZdX80Q==
From: Lode Willems <me@lodewillems.com>
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lode Willems <me@lodewillems.com>
Subject: [PATCH v2] USB: serial: CH341: add hardware flow control RTS/CTS
Date: Wed, 18 Dec 2024 18:25:05 +0100
Message-ID: <20241218173611.10307-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4YD17x0qlCz9t00

This adds support for enabling and disabling
RTS/CTS hardware flow control.
Tested using CH341A and CH340E.

Fixes part of the following bug report:
Link: https://bugzilla.kernel.org/show_bug.cgi?id=197109

Signed-off-by: Lode Willems <me@lodewillems.com>
---

Changes in v2:
 - Change the CH341_FLOW_CTL_* values to be 8 bits wide
 - Set flow control setting unconditionally
 - Prepare parameters and do one control request
 - Drop the error message

 drivers/usb/serial/ch341.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index d10e4c4848a0..c255a8437e4a 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -63,6 +63,7 @@
 #define CH341_REG_DIVISOR      0x13
 #define CH341_REG_LCR          0x18
 #define CH341_REG_LCR2         0x25
+#define CH341_REG_FLOW_CTL     0x27
 
 #define CH341_NBREAK_BITS      0x01
 
@@ -77,6 +78,9 @@
 #define CH341_LCR_CS6          0x01
 #define CH341_LCR_CS5          0x00
 
+#define CH341_FLOW_CTL_NONE    0x00
+#define CH341_FLOW_CTL_RTSCTS  0x01
+
 #define CH341_QUIRK_LIMITED_PRESCALER	BIT(0)
 #define CH341_QUIRK_SIMULATE_BREAK	BIT(1)
 
@@ -478,6 +482,28 @@ static int ch341_open(struct tty_struct *tty, struct usb_serial_port *port)
 	return r;
 }
 
+static void ch341_set_flow_control(struct tty_struct *tty,
+				   struct usb_serial_port *port,
+				   const struct ktermios *old_termios)
+{
+	int r;
+	u16 flow_ctl;
+
+	if (C_CRTSCTS(tty))
+		flow_ctl = ((u16)CH341_FLOW_CTL_RTSCTS << 8) | CH341_FLOW_CTL_RTSCTS;
+	else
+		flow_ctl = ((u16)CH341_FLOW_CTL_NONE << 8) | CH341_FLOW_CTL_NONE;
+
+	r = ch341_control_out(port->serial->dev,
+			      CH341_REQ_WRITE_REG,
+			      ((u16)CH341_REG_FLOW_CTL << 8) | CH341_REG_FLOW_CTL,
+			      flow_ctl);
+	if (r < 0 && old_termios) {
+		tty->termios.c_cflag &= ~CRTSCTS;
+		tty->termios.c_cflag |= (old_termios->c_cflag & CRTSCTS);
+	}
+}
+
 /* Old_termios contains the original termios settings and
  * tty->termios contains the new setting to be used.
  */
@@ -546,6 +572,8 @@ static void ch341_set_termios(struct tty_struct *tty,
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	ch341_set_handshake(port->serial->dev, priv->mcr);
+
+	ch341_set_flow_control(tty, port, old_termios);
 }
 
 /*
-- 
2.47.1


