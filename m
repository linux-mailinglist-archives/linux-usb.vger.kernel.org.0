Return-Path: <linux-usb+bounces-28894-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A94BB8A57
	for <lists+linux-usb@lfdr.de>; Sat, 04 Oct 2025 08:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 586D24E45DC
	for <lists+linux-usb@lfdr.de>; Sat,  4 Oct 2025 06:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B56238150;
	Sat,  4 Oct 2025 06:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpwAO1Nu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F4224234
	for <linux-usb@vger.kernel.org>; Sat,  4 Oct 2025 06:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759560989; cv=none; b=AeTy7d7d6dVuwEp5xqsubjGkdAXbIy36A3d7lzCI5WcJvMcZ0moWs/8yXoZZf8J68S+Dr+KsLXSRuIBwtBWWLD81N6qtwk6rXHx0ypyYuqKlnMoodHWlPKo/uLO9j8ENmoMZakSXt+kw+5081FwuH2hFa4it4a8vm/i4FLF77OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759560989; c=relaxed/simple;
	bh=Akg62ZfHSXk8/MAeJYQ188NE63lSNc+b3eVzEJKBmqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7OMVVC+zVrRalP+yHojo9wCoo8jHSJGTqPs8EgklWJzUSNbnu64NuiJQRCbImALqfxZAUD4U2bxcZtmjXkyaZ1z8gBtnd75129dK/Lgl8cfbhklxCUQhsgggYimm1QvWzh0BZms/nwM616O6M/B+02w5LLKglaXMrpIGMkI5fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpwAO1Nu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so2727883b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Oct 2025 23:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759560986; x=1760165786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/31utkvfUNb/M8r9xoY+/XrOhevw5/hi8IXZ2URA6Q=;
        b=jpwAO1NusXWJVf0e/4CQmHLh8EsABqHwebnybBocDtM3SxFDX1UwlpGFXSPyC0J0g0
         Y2EJAfKgi2AOzLg3AmdRVvFKqfNeyHowX56q6cFovnUCUYHE5pun2GjDcwyRxS/+0IQ7
         GfMEB2pL4WDEJMH9awYidVYjL0rqt4fjTBhv/gzjtpUdxqDMykdMISL+tGejlguZ7DB4
         niJX6ekFihrAPFYNwezBCRRuxYPVuAblppjFc+KXCQDgXnUkMrYFESuqgA5SSOuWbOqT
         /Q5la7sItuKpFWbl3++IUHTQoaJgWapA/O08cymfNXe+uR/vP8qHdFkFg/GiHHPIMfCw
         C5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759560986; x=1760165786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/31utkvfUNb/M8r9xoY+/XrOhevw5/hi8IXZ2URA6Q=;
        b=l68nlKGTaFVozOo0ZHiAk5DUA9vm8Pby/8dflpsjH4KbDbJI7e55xUoakraiq3DG41
         SX7XTxxO0i06Z5cgm67m8breiAXMJCDTu9XAtvjqMxltmHr351KErWr9+WaqKVQHQ96B
         5ETZj3Ebos90K0jJBwIvi9KJQp/Uxfw6xPRWDxD4ck+mZzxMN56IkiDq2eJSNTA2DD0z
         9573kcgRbY4IJ4VJrCQ5c1smyjnjgpPuWya2DSlGUkMgXG42MatRFEs14ZF7Nk1sEWDh
         BboEFFbtvkJ2N1BN/iPNM+nhtgddLduYzFcY8Se/1zvmKk3yJnIF+FPUN5TynU99YjkU
         vKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXibZKxcdLkBbIwBuW2YL7/UnRIPDTaRP/Wd0tMImmHOwVN1bsG7C7NGiR3YmrvxvXA29uH/4ZCFts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3TUDlJVYvGo7rikaLzbaMzUeweugAnifF8UCX7IXa0+PhFHjI
	1a2YttuOcTiKxWOULfmauKZbCaG8YVcQQKwt8dkZQPk0Mk/TbpkA28am2Irgs+67
X-Gm-Gg: ASbGnctMEZdlJ23GhMjvtUY+FlVO7QHwZhRb4S0CtUKSwA8mg1+soZRCD6tVhNrLSCO
	Fg6116/qDKEIuf5SY1BrgE7OQRfUZ+MYdCtA7iK+4lg0kqfT0jFm3lMDYgQU4R+YYnUferWgZgg
	tCmK1jsy/DNf4CyegBJkPDC5XT8RdIOtOK33/NcybOgpis0qkhsaqDF4GF6QjXGhA2epffuY53P
	KTKttMDKNb/Ah3bofeQlr+Be490AHrHoOwYnQLNLdZslrzgHFTdpdClEoiFo9vukJWlbc+uGitt
	20khAAgmgA6xR6U4jzYSdR0c2AXxjeYReZlaz0jOyITThI7xmpgk6VOe/QapC9cmaqDnJvl/fVp
	XbKRkVSwlGVfDiHbarO+fYq7LTzYD3NQ4axVQe+YYy7vxAaKA7pUgdSsBxSaKdQ==
X-Google-Smtp-Source: AGHT+IFD7GHyG9wTtVtGlBN3EdoD8sakaAaNr/H/4XHW4uSuPD+X3zU0Xm9uor2HWS1YrnouFiQMmA==
X-Received: by 2002:a05:6a21:32a8:b0:2fd:a3b:933d with SMTP id adf61e73a8af0-32b6212a95amr8167723637.58.1759560986198;
        Fri, 03 Oct 2025 23:56:26 -0700 (PDT)
Received: from mentee25.. ([2405:201:d003:7033:7b72:2259:4f28:5ecc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ebe5f2sm10022160a91.11.2025.10.03.23.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 23:56:25 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH] usb: serial: fix: space prohibited before comma separator
Date: Sat,  4 Oct 2025 12:26:18 +0530
Message-ID: <20251004065618.70151-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Run `checkpatch.pl` script on path `drivers/usb/serial/*`.
Find ERROR: space prohibited before that ',' (ctx:WxE).

Doesn't claim any functionality changes in any of the modified
file.

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 drivers/usb/serial/ark3116.c          | 12 ++++++------
 drivers/usb/serial/ftdi_sio.c         |  2 +-
 drivers/usb/serial/iuu_phoenix.c      |  4 ++--
 drivers/usb/serial/keyspan_usa90msg.h |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/serial/ark3116.c b/drivers/usb/serial/ark3116.c
index 800b04fe37fa..f1cc4e36e4e6 100644
--- a/drivers/usb/serial/ark3116.c
+++ b/drivers/usb/serial/ark3116.c
@@ -143,18 +143,18 @@ static int ark3116_port_probe(struct usb_serial_port *port)
 	ark3116_write_reg(serial, UART_FCR, 0);
 	/* handshake control */
 	priv->hcr = 0;
-	ark3116_write_reg(serial, 0x8     , 0);
+	ark3116_write_reg(serial, 0x8, 0);
 	/* modem control */
 	priv->mcr = 0;
 	ark3116_write_reg(serial, UART_MCR, 0);
 
 	if (!(priv->irda)) {
-		ark3116_write_reg(serial, 0xb , 0);
+		ark3116_write_reg(serial, 0xb, 0);
 	} else {
-		ark3116_write_reg(serial, 0xb , 1);
-		ark3116_write_reg(serial, 0xc , 0);
-		ark3116_write_reg(serial, 0xd , 0x41);
-		ark3116_write_reg(serial, 0xa , 1);
+		ark3116_write_reg(serial, 0xb, 1);
+		ark3116_write_reg(serial, 0xc, 0);
+		ark3116_write_reg(serial, 0xd, 0x41);
+		ark3116_write_reg(serial, 0xa, 1);
 	}
 
 	/* setup baudrate */
diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 49666c33b41f..f5d4335c4f6c 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -190,7 +190,7 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(FTDI_VID, FTDI_8U232AM_PID) },
 	{ USB_DEVICE(FTDI_VID, FTDI_8U232AM_ALT_PID) },
 	{ USB_DEVICE(FTDI_VID, FTDI_232RL_PID) },
-	{ USB_DEVICE(FTDI_VID, FTDI_8U2232C_PID) ,
+	{ USB_DEVICE(FTDI_VID, FTDI_8U2232C_PID),
 		.driver_info = (kernel_ulong_t)&ftdi_8u2232c_quirk },
 	{ USB_DEVICE(FTDI_VID, FTDI_4232H_PID) },
 	{ USB_DEVICE(FTDI_VID, FTDI_232H_PID) },
diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index c21dcc9b6f05..fc71aaea3229 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -360,7 +360,7 @@ static void iuu_led_activity_on(struct urb *urb)
 	usb_fill_bulk_urb(port->write_urb, port->serial->dev,
 			  usb_sndbulkpipe(port->serial->dev,
 					  port->bulk_out_endpointAddress),
-			  port->write_urb->transfer_buffer, 8 ,
+			  port->write_urb->transfer_buffer, 8,
 			  iuu_rxcmd, port);
 	usb_submit_urb(port->write_urb, GFP_ATOMIC);
 }
@@ -380,7 +380,7 @@ static void iuu_led_activity_off(struct urb *urb)
 	usb_fill_bulk_urb(port->write_urb, port->serial->dev,
 			  usb_sndbulkpipe(port->serial->dev,
 					  port->bulk_out_endpointAddress),
-			  port->write_urb->transfer_buffer, 8 ,
+			  port->write_urb->transfer_buffer, 8,
 			  iuu_rxcmd, port);
 	usb_submit_urb(port->write_urb, GFP_ATOMIC);
 }
diff --git a/drivers/usb/serial/keyspan_usa90msg.h b/drivers/usb/serial/keyspan_usa90msg.h
index c4ca0f631d20..e01df75140c7 100644
--- a/drivers/usb/serial/keyspan_usa90msg.h
+++ b/drivers/usb/serial/keyspan_usa90msg.h
@@ -69,7 +69,7 @@ struct keyspan_usa90_portControlMessage
 		txMode,			// TXMODE_DMA or TXMODE_BYHAND
 
 		setTxFlowControl,	// host requests tx flow control be set
-		txFlowControl	,	// use TX_FLOW... bits below
+		txFlowControl,	        // use TX_FLOW... bits below
 		setRxFlowControl,	// host requests rx flow control be set
 		rxFlowControl,	// use RX_FLOW... bits below
 		sendXoff,		// host requests XOFF transmitted immediately
-- 
2.43.0


