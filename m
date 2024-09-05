Return-Path: <linux-usb+bounces-14753-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAECF96E5D4
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 00:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E0C286884
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 22:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37121B12D3;
	Thu,  5 Sep 2024 22:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b="G7i6gfra"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEE41917D9
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 22:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576232; cv=none; b=D7B05Vqgt5luYaQZxiFZKy0nKjgU2yIf/n2PZgjKAQ4EklM1ciMlhiQauAVrcrF6g2L2Qnba+xuTwCWth60WDCNKUlyEZeVaNAZS34dpd7j3AV34QaL3Dh9nFJg70xl/gfOkC8JBoBXRAzPRuCYoW8uaA4gUKndwxoa4Wv3pYUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576232; c=relaxed/simple;
	bh=A83N4EdPeH6klcG/vMdyruELpo5wAk/YKpG1Wz3MBI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jhzD7CQtFMWfo5GXPcLV7S+FAYxylzuIyUpadgl4OLNaLwqqoDo2WDXOsWWCKX0PJCmDypaIUgSYzNgQN0eaNNlXrELO4YGZWWbOEzo/EpP1VQ1Q/qNK9/5iuVIKgCHqwlULoC81aKJePKb2w5V8QxmTRWEpHjjIcIkAHXKK1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com; spf=pass smtp.mailfrom=lodewillems.com; dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b=G7i6gfra; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lodewillems.com
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4X0Dt41LWpz9sw4;
	Fri,  6 Sep 2024 00:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lodewillems.com;
	s=MBO0001; t=1725576220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/JLNue/8wbisDanCTsQEB4YImoEx4/W/N9DUeZBDSuo=;
	b=G7i6gfra9fShom2c8P1ygOGlH/NzgqgsX0OQ57RrnRIGdkE8l5YPPxlL/E7++mQIBedO4I
	l5kDDme18q4+UtCakwXLxU1l7IcbO4Gl3cdFXddKyC+J4zxZDYJqeswR4XBy9DojDxNvgf
	PftNl6YEBgS9k6bY+CdHVg0Z9c92Rp3oe/3SCNx+OaO2h5jBnhWNcC2fYisZPKUgF0HTqQ
	EBwJgs0HD/F2c35mhdrWxZrgV+UFKw88JX67cHK3YYQaCX/uoUwMsZSZuIFMCpn4FFTS9f
	L2f+cHz37gWT5EOxP/zJ3hqRBX1X/FDw1zHjBa9zNaB59CnELiL56LstVQIPag==
From: Lode Willems <me@lodewillems.com>
To: Johan Hovold <johan@kernel.org>
Cc: Lode Willems <me@lodewillems.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: CH341: add hardware flow control RTS/CTS
Date: Fri,  6 Sep 2024 00:43:06 +0200
Message-ID: <20240905224326.7787-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4X0Dt41LWpz9sw4

This adds support for enabling and disabling
RTS/CTS hardware flow control.
Tested using a CH340E in combination with a CP2102.

Fixes part of the following bug report:
Link: https://bugzilla.kernel.org/show_bug.cgi?id=197109

CC: linux-usb@vger.kernel.org

Signed-off-by: Lode Willems <me@lodewillems.com>
---
 drivers/usb/serial/ch341.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 0870c6533f80..c3b3cae33a41 100644
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
 
+#define CH341_FLOW_CTL_NONE    0x000
+#define CH341_FLOW_CTL_RTSCTS  0x101
+
 #define CH341_QUIRK_LIMITED_PRESCALER	BIT(0)
 #define CH341_QUIRK_SIMULATE_BREAK	BIT(1)
 
@@ -478,6 +482,41 @@ static int ch341_open(struct tty_struct *tty, struct usb_serial_port *port)
 	return r;
 }
 
+static void ch341_set_flow_control(struct tty_struct *tty,
+				   struct usb_serial_port *port,
+				   const struct ktermios *old_termios)
+{
+	int r;
+
+	if (old_termios &&
+	    C_CRTSCTS(tty) == (old_termios->c_cflag & CRTSCTS))
+		return;
+
+	if (C_CRTSCTS(tty)) {
+		r = ch341_control_out(port->serial->dev, CH341_REQ_WRITE_REG,
+				      CH341_REG_FLOW_CTL |
+				      ((u16)CH341_REG_FLOW_CTL << 8),
+				      CH341_FLOW_CTL_RTSCTS);
+		if (r < 0) {
+			dev_err(&port->dev,
+				"%s - failed to enable flow control: %d\n",
+				__func__, r);
+			tty->termios.c_cflag &= ~CRTSCTS;
+		}
+	} else {
+		r = ch341_control_out(port->serial->dev, CH341_REQ_WRITE_REG,
+				      CH341_REG_FLOW_CTL |
+				      ((u16)CH341_REG_FLOW_CTL << 8),
+				      CH341_FLOW_CTL_NONE);
+		if (r < 0) {
+			dev_err(&port->dev,
+				"%s - failed to disable flow control: %d\n",
+				__func__, r);
+			tty->termios.c_cflag |= CRTSCTS;
+		}
+	}
+}
+
 /* Old_termios contains the original termios settings and
  * tty->termios contains the new setting to be used.
  */
@@ -546,6 +585,8 @@ static void ch341_set_termios(struct tty_struct *tty,
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	ch341_set_handshake(port->serial->dev, priv->mcr);
+
+	ch341_set_flow_control(tty, port, old_termios);
 }
 
 /*
-- 
2.46.0


