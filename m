Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3819421D412
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 12:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgGMKzc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 06:55:32 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40974 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729357AbgGMKza (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 06:55:30 -0400
Received: by mail-lj1-f195.google.com with SMTP id z24so17045560ljn.8
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 03:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vF+Ftw0lHEaGEj6D/IkUOTFKGmzE//rEEn+R84Os3m4=;
        b=f39xiqC7tBekdZTlBfjEIBZmBAWvyNQkhIGH7JMg8nGbKWCcS8WJJFhzMTfJfBcN/7
         eLyDnncong2Q5O8RGtbZArDloASvLXEkF4+mdH1MNK5lzdpbwHYm8H+vN28dW0wyN8fX
         lXjhSR8Q5ZcqOW28K9Q8mObWDX7yGzzLRNczYx6ZMfrefm9VKkD3w+RZBsNiM+8uiRTV
         DZzvfoZFaGJ0ZQlwUqzq2Q0cd4wyUr23qXlPE8a4zyO9TQv+HkAfX74YVWQk4lWrK58p
         Ek1nspudB7gu2Yt1Zh+ZOg/CNHMx+5aEwecU/Dk3P7rOO8MvqJWI6SlUW2wCJsXz6Z3d
         zT1Q==
X-Gm-Message-State: AOAM530Ajn2PEDxbKsFWEpgU+Ge/MOpAEkNJdcEEp+fuoC702ua3DDJX
        WrPs4v9w6JA79web5XdVatCejWUOWhk=
X-Google-Smtp-Source: ABdhPJwe6Acc+C4xA0t/PXF13U4w105aeXkSZLmcF90Q1j2SvUWgtQMBayleuwYpiRMfMHTXM7IEZg==
X-Received: by 2002:a2e:b554:: with SMTP id a20mr46005131ljn.108.1594637727016;
        Mon, 13 Jul 2020 03:55:27 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id f24sm5513340ljc.99.2020.07.13.03.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 03:55:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1juw7S-0007FJ-5t; Mon, 13 Jul 2020 12:55:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Jarom=C3=ADr=20=C5=A0korpil?= <Jerry@jrr.cz>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/5] USB: serial: cp210x: add support for line-status events
Date:   Mon, 13 Jul 2020 12:55:14 +0200
Message-Id: <20200713105517.27796-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713105517.27796-1-johan@kernel.org>
References: <20200713105517.27796-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for line-status events that specifically can be used to
detect and report parity errors.

Enable the device's event-insertion mode whenever input-parity checking
is requested. This will insert line and modem status events into the
data stream.

Note that modem-status changes appear to be buffered until a character
is received (at least on CP2102) and support is therefore left
unimplemented.

On at least one type of these chips (CP2102), line breaks are not
reported as expected either (regardless of whether SERIAL_BREAK_CHAR is
set) so do not enable event-mode when !IGNBRK is requested for now.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 189 +++++++++++++++++++++++++++++++++++-
 1 file changed, 186 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index c01c7863dd1a..02e4acb2823b 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -50,6 +50,9 @@ static void cp210x_release(struct usb_serial *);
 static int cp210x_port_probe(struct usb_serial_port *);
 static int cp210x_port_remove(struct usb_serial_port *);
 static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
+static void cp210x_process_read_urb(struct urb *urb);
+static void cp210x_enable_event_mode(struct usb_serial_port *port);
+static void cp210x_disable_event_mode(struct usb_serial_port *port);
 
 static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x045B, 0x0053) }, /* Renesas RX610 RX-Stick */
@@ -253,9 +256,21 @@ struct cp210x_serial_private {
 	bool			use_actual_rate;
 };
 
+enum cp210x_event_state {
+	ES_DATA,
+	ES_ESCAPE,
+	ES_LSR,
+	ES_LSR_DATA_0,
+	ES_LSR_DATA_1,
+	ES_MSR
+};
+
 struct cp210x_port_private {
 	__u8			bInterfaceNumber;
 	bool			has_swapped_line_ctl;
+	bool			event_mode;
+	enum cp210x_event_state event_state;
+	u8 lsr;
 };
 
 static struct usb_serial_driver cp210x_device = {
@@ -281,7 +296,8 @@ static struct usb_serial_driver cp210x_device = {
 	.release		= cp210x_release,
 	.port_probe		= cp210x_port_probe,
 	.port_remove		= cp210x_port_remove,
-	.dtr_rts		= cp210x_dtr_rts
+	.dtr_rts		= cp210x_dtr_rts,
+	.process_read_urb	= cp210x_process_read_urb,
 };
 
 static struct usb_serial_driver * const serial_drivers[] = {
@@ -403,6 +419,15 @@ struct cp210x_comm_status {
  */
 #define PURGE_ALL		0x000f
 
+/* CP210X_EMBED_EVENTS */
+#define CP210X_ESCCHAR		0xec
+
+#define CP210X_LSR_OVERRUN	BIT(1)
+#define CP210X_LSR_PARITY	BIT(2)
+#define CP210X_LSR_FRAME	BIT(3)
+#define CP210X_LSR_BREAK	BIT(4)
+
+
 /* CP210X_GET_FLOW/CP210X_SET_FLOW read/write these 0x10 bytes */
 struct cp210x_flow_ctl {
 	__le32	ulControlHandshake;
@@ -809,6 +834,7 @@ static int cp210x_get_line_ctl(struct usb_serial_port *port, u16 *ctl)
 
 static int cp210x_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
 	int result;
 
 	result = cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_ENABLE);
@@ -820,10 +846,14 @@ static int cp210x_open(struct tty_struct *tty, struct usb_serial_port *port)
 	/* Configure the termios structure */
 	cp210x_get_termios(tty, port);
 
-	/* The baud rate must be initialised on cp2104 */
-	if (tty)
+	if (tty) {
+		/* The baud rate must be initialised on cp2104 */
 		cp210x_change_speed(tty, port, NULL);
 
+		if (I_INPCK(tty))
+			cp210x_enable_event_mode(port);
+	}
+
 	result = usb_serial_generic_open(tty, port);
 	if (result)
 		goto err_disable;
@@ -832,18 +862,128 @@ static int cp210x_open(struct tty_struct *tty, struct usb_serial_port *port)
 
 err_disable:
 	cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_DISABLE);
+	port_priv->event_mode = false;
 
 	return result;
 }
 
 static void cp210x_close(struct usb_serial_port *port)
 {
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+
 	usb_serial_generic_close(port);
 
 	/* Clear both queues; cp2108 needs this to avoid an occasional hang */
 	cp210x_write_u16_reg(port, CP210X_PURGE, PURGE_ALL);
 
 	cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_DISABLE);
+
+	/* Disabling the interface disables event-insertion mode. */
+	port_priv->event_mode = false;
+}
+
+static void cp210x_process_lsr(struct usb_serial_port *port, unsigned char lsr, char *flag)
+{
+	if (lsr & CP210X_LSR_BREAK) {
+		port->icount.brk++;
+		*flag = TTY_BREAK;
+	} else if (lsr & CP210X_LSR_PARITY) {
+		port->icount.parity++;
+		*flag = TTY_PARITY;
+	} else if (lsr & CP210X_LSR_FRAME) {
+		port->icount.frame++;
+		*flag = TTY_FRAME;
+	}
+
+	if (lsr & CP210X_LSR_OVERRUN) {
+		port->icount.overrun++;
+		tty_insert_flip_char(&port->port, 0, TTY_OVERRUN);
+	}
+}
+
+static bool cp210x_process_char(struct usb_serial_port *port, unsigned char *ch, char *flag)
+{
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+
+	switch (port_priv->event_state) {
+	case ES_DATA:
+		if (*ch == CP210X_ESCCHAR) {
+			port_priv->event_state = ES_ESCAPE;
+			break;
+		}
+		return false;
+	case ES_ESCAPE:
+		switch (*ch) {
+		case 0:
+			dev_dbg(&port->dev, "%s - escape char\n", __func__);
+			*ch = CP210X_ESCCHAR;
+			port_priv->event_state = ES_DATA;
+			return false;
+		case 1:
+			port_priv->event_state = ES_LSR_DATA_0;
+			break;
+		case 2:
+			port_priv->event_state = ES_LSR;
+			break;
+		case 3:
+			port_priv->event_state = ES_MSR;
+			break;
+		default:
+			dev_err(&port->dev, "malformed event 0x%02x\n", *ch);
+			port_priv->event_state = ES_DATA;
+			break;
+		}
+		break;
+	case ES_LSR_DATA_0:
+		port_priv->lsr = *ch;
+		port_priv->event_state = ES_LSR_DATA_1;
+		break;
+	case ES_LSR_DATA_1:
+		dev_dbg(&port->dev, "%s - lsr = 0x%02x, data = 0x%02x\n",
+				__func__, port_priv->lsr, *ch);
+		cp210x_process_lsr(port, port_priv->lsr, flag);
+		port_priv->event_state = ES_DATA;
+		return false;
+	case ES_LSR:
+		dev_dbg(&port->dev, "%s - lsr = 0x%02x\n", __func__, *ch);
+		port_priv->lsr = *ch;
+		cp210x_process_lsr(port, port_priv->lsr, flag);
+		port_priv->event_state = ES_DATA;
+		break;
+	case ES_MSR:
+		dev_dbg(&port->dev, "%s - msr = 0x%02x\n", __func__, *ch);
+		/* unimplemented */
+		port_priv->event_state = ES_DATA;
+		break;
+	}
+
+	return true;
+}
+
+static void cp210x_process_read_urb(struct urb *urb)
+{
+	struct usb_serial_port *port = urb->context;
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+	unsigned char *ch = urb->transfer_buffer;
+	char flag;
+	int i;
+
+	if (!urb->actual_length)
+		return;
+
+	if (port_priv->event_mode) {
+		for (i = 0; i < urb->actual_length; i++, ch++) {
+			flag = TTY_NORMAL;
+
+			if (cp210x_process_char(port, ch, &flag))
+				continue;
+
+			tty_insert_flip_char(&port->port, *ch, flag);
+		}
+	} else {
+		tty_insert_flip_string(&port->port, ch, urb->actual_length);
+	}
+	tty_flip_buffer_push(&port->port);
 }
 
 /*
@@ -1176,6 +1316,41 @@ static void cp210x_change_speed(struct tty_struct *tty,
 	tty_encode_baud_rate(tty, baud, baud);
 }
 
+static void cp210x_enable_event_mode(struct usb_serial_port *port)
+{
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret;
+
+	if (port_priv->event_mode)
+		return;
+
+	port_priv->event_state = ES_DATA;
+	port_priv->event_mode = true;
+
+	ret = cp210x_write_u16_reg(port, CP210X_EMBED_EVENTS, CP210X_ESCCHAR);
+	if (ret) {
+		dev_err(&port->dev, "failed to enable events: %d\n", ret);
+		port_priv->event_mode = false;
+	}
+}
+
+static void cp210x_disable_event_mode(struct usb_serial_port *port)
+{
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret;
+
+	if (!port_priv->event_mode)
+		return;
+
+	ret = cp210x_write_u16_reg(port, CP210X_EMBED_EVENTS, 0);
+	if (ret) {
+		dev_err(&port->dev, "failed to disable events: %d\n", ret);
+		return;
+	}
+
+	port_priv->event_mode = false;
+}
+
 static void cp210x_set_termios(struct tty_struct *tty,
 		struct usb_serial_port *port, struct ktermios *old_termios)
 {
@@ -1298,6 +1473,14 @@ static void cp210x_set_termios(struct tty_struct *tty,
 				sizeof(flow_ctl));
 	}
 
+	/*
+	 * Enable event-insertion mode only if input parity checking is
+	 * enabled for now.
+	 */
+	if (I_INPCK(tty))
+		cp210x_enable_event_mode(port);
+	else
+		cp210x_disable_event_mode(port);
 }
 
 static int cp210x_tiocmset(struct tty_struct *tty,
-- 
2.26.2

