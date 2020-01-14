Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5788E13A7CC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 12:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgANLCM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 06:02:12 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33881 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgANLCL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 06:02:11 -0500
Received: by mail-lj1-f195.google.com with SMTP id z22so13845570ljg.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2020 03:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oovl7D0vCEvPdIXVKgkzgDKdg6E80cIqWutVJlbSiKA=;
        b=lbUsJLSYxPLJGaWsp2pGVUyCg2B7fwgI3it8wq+8ud2AtcgMlLQjIwL2ET0GhpJ/uI
         +GCO6c8/3ivWyiAndxDYmbvfbjBxLxpd1Yz60x54tDchUvNeImRCysRMxEtP5E52ekqe
         zVr/RDnXLqFvWD0zSsqnv+m44yELJvw4LL0kWFErkWaNno6hitaH85ZesIEPuKaJl4Xl
         Zfm6+2VHHhxkCMLnGe8+sxdRF7ZVH50yE0YDPfUw20TT7uHxPelpJyDuydVM6eAYS/pp
         0H884nJZJYrRp8yEYnX2AVTxiZC0YawM6Hu7QoROPbf2wvTJYdmTQ3/LQBOTmVMRcekq
         KSUQ==
X-Gm-Message-State: APjAAAWFfe4KPtmWnr0Fwiw+e1dLZQzKKRisr7YWjH4QU5Yik05NS1TH
        78aDRbJZZWifdCz0DKFqSt8=
X-Google-Smtp-Source: APXvYqwLtD3TjOIF9UbwxoRdzmH/QYlB9Ero6OxwEb7ORfPjUFFI0jaA+cTZTjk4PL1WKD2c0uYJbg==
X-Received: by 2002:a2e:93d5:: with SMTP id p21mr13655888ljh.50.1578999729857;
        Tue, 14 Jan 2020 03:02:09 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id p15sm6999323lfo.88.2020.01.14.03.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 03:02:08 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1irJxY-0001Yw-Rv; Tue, 14 Jan 2020 12:02:08 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v2 1/2] USB: serial: opticon: add chars_in_buffer() implementation
Date:   Tue, 14 Jan 2020 12:01:45 +0100
Message-Id: <20200114110146.5929-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a chars_in_buffer() implementation so that the tty layer will wait
for outgoing buffered data to be drained when needed (e.g. on final
close()).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/opticon.c | 45 ++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/serial/opticon.c b/drivers/usb/serial/opticon.c
index ed2b4e6dca38..f7bccf14a71f 100644
--- a/drivers/usb/serial/opticon.c
+++ b/drivers/usb/serial/opticon.c
@@ -41,6 +41,7 @@ struct opticon_private {
 	bool rts;
 	bool cts;
 	int outstanding_urbs;
+	int outstanding_bytes;
 };
 
 
@@ -169,6 +170,7 @@ static void opticon_write_control_callback(struct urb *urb)
 
 	spin_lock_irqsave(&priv->lock, flags);
 	--priv->outstanding_urbs;
+	priv->outstanding_bytes -= urb->transfer_buffer_length;
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	usb_serial_port_softint(port);
@@ -182,8 +184,8 @@ static int opticon_write(struct tty_struct *tty, struct usb_serial_port *port,
 	struct urb *urb;
 	unsigned char *buffer;
 	unsigned long flags;
-	int status;
 	struct usb_ctrlrequest *dr;
+	int ret = -ENOMEM;
 
 	spin_lock_irqsave(&priv->lock, flags);
 	if (priv->outstanding_urbs > URB_UPPER_LIMIT) {
@@ -192,19 +194,16 @@ static int opticon_write(struct tty_struct *tty, struct usb_serial_port *port,
 		return 0;
 	}
 	priv->outstanding_urbs++;
+	priv->outstanding_bytes += count;
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	buffer = kmalloc(count, GFP_ATOMIC);
-	if (!buffer) {
-		count = -ENOMEM;
+	if (!buffer)
 		goto error_no_buffer;
-	}
 
 	urb = usb_alloc_urb(0, GFP_ATOMIC);
-	if (!urb) {
-		count = -ENOMEM;
+	if (!urb)
 		goto error_no_urb;
-	}
 
 	memcpy(buffer, buf, count);
 
@@ -213,10 +212,8 @@ static int opticon_write(struct tty_struct *tty, struct usb_serial_port *port,
 	/* The connected devices do not have a bulk write endpoint,
 	 * to transmit data to de barcode device the control endpoint is used */
 	dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_ATOMIC);
-	if (!dr) {
-		count = -ENOMEM;
+	if (!dr)
 		goto error_no_dr;
-	}
 
 	dr->bRequestType = USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT;
 	dr->bRequest = 0x01;
@@ -230,12 +227,9 @@ static int opticon_write(struct tty_struct *tty, struct usb_serial_port *port,
 		opticon_write_control_callback, port);
 
 	/* send it down the pipe */
-	status = usb_submit_urb(urb, GFP_ATOMIC);
-	if (status) {
-		dev_err(&port->dev,
-		"%s - usb_submit_urb(write endpoint) failed status = %d\n",
-							__func__, status);
-		count = status;
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret) {
+		dev_err(&port->dev, "failed to submit write urb: %d\n", ret);
 		goto error;
 	}
 
@@ -253,8 +247,10 @@ static int opticon_write(struct tty_struct *tty, struct usb_serial_port *port,
 error_no_buffer:
 	spin_lock_irqsave(&priv->lock, flags);
 	--priv->outstanding_urbs;
+	priv->outstanding_bytes -= count;
 	spin_unlock_irqrestore(&priv->lock, flags);
-	return count;
+
+	return ret;
 }
 
 static int opticon_write_room(struct tty_struct *tty)
@@ -279,6 +275,20 @@ static int opticon_write_room(struct tty_struct *tty)
 	return 2048;
 }
 
+static int opticon_chars_in_buffer(struct tty_struct *tty)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct opticon_private *priv = usb_get_serial_port_data(port);
+	unsigned long flags;
+	int count;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	count = priv->outstanding_bytes;
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return count;
+}
+
 static int opticon_tiocmget(struct tty_struct *tty)
 {
 	struct usb_serial_port *port = tty->driver_data;
@@ -383,6 +393,7 @@ static struct usb_serial_driver opticon_device = {
 	.open =			opticon_open,
 	.write =		opticon_write,
 	.write_room = 		opticon_write_room,
+	.chars_in_buffer =	opticon_chars_in_buffer,
 	.throttle =		usb_serial_generic_throttle,
 	.unthrottle =		usb_serial_generic_unthrottle,
 	.get_serial =		get_serial_info,
-- 
2.24.1

