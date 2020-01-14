Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF1013A7C1
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 11:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728868AbgANK5I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 05:57:08 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38757 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgANK5I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 05:57:08 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so9474171lfm.5;
        Tue, 14 Jan 2020 02:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AK4H5oKIjYr2wZjOrbeVS5Z8MRQMGd91D6AnA03+yKc=;
        b=mljcX3z8f1NxZ5bp5NvdVd+sdoQXLmCYcZvG9tkF8brGLEolToNzLSZmLUyQARZMKa
         qbYYrNnX0NbTeU0PdtCvXAkYg/AOhRPEanhSuHrLLCEfKCGKQxB91eizp98Fw4yHLv9D
         yftZM0Ocq7+K9VVZm9ZKGNYGy20Hq1RrY5RN2I6gWfLaUN0+1gMDwvdZM4jM8cp7oq0m
         S87xmgSDEvH3/Wx58QNS6KjsAFZ0yDwO33Cevbu+m1wIOJR7cG1cyZ3+mIlWwInmg0WE
         lpIkb/XYSxNqx/SGNhSxOe5ckFgoGeVwO1hOzDnubcKWfR2nv6A9WdBi6S77kZwQ+cjB
         EmbQ==
X-Gm-Message-State: APjAAAVTuu1DhaH8lv7q6XQiGOjcZf9A2qk18LmbLqKs1Ln34mIgvYH1
        jtJ/m05tF652mAKzTQb3PVD8st5n
X-Google-Smtp-Source: APXvYqzTRki5Rxm/UFWnMldDRUxhIN/dptoTIPEWwRzBWUVWXcaTVe5aytEtJm/XYzQgJ7nREjWFrQ==
X-Received: by 2002:a19:7604:: with SMTP id c4mr1266545lff.101.1578999425934;
        Tue, 14 Jan 2020 02:57:05 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id i16sm7031332lfo.87.2020.01.14.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 02:57:04 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1irJse-00040w-V2; Tue, 14 Jan 2020 11:57:04 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: [PATCH 2/2] USB: serial: opticon: stop all I/O on close()
Date:   Tue, 14 Jan 2020 11:55:17 +0100
Message-Id: <20200114105517.15360-2-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114105517.15360-1-johan@kernel.org>
References: <20200114105517.15360-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Make sure to stop any submitted write URBs on close(). This specifically
avoids a NULL-pointer dereference or use-after-free in case of a late
completion event after driver unbind.

Fixes: 648d4e16567e ("USB: serial: opticon: add write support")
Cc: stable <stable@vger.kernel.org>	# 2.6.30: xxx: USB: serial: opticon: add chars_in_buffer() implementation
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/opticon.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/serial/opticon.c b/drivers/usb/serial/opticon.c
index f7bccf14a71f..61ce359221ec 100644
--- a/drivers/usb/serial/opticon.c
+++ b/drivers/usb/serial/opticon.c
@@ -42,6 +42,8 @@ struct opticon_private {
 	bool cts;
 	int outstanding_urbs;
 	int outstanding_bytes;
+
+	struct usb_anchor anchor;
 };
 
 
@@ -150,6 +152,15 @@ static int opticon_open(struct tty_struct *tty, struct usb_serial_port *port)
 	return res;
 }
 
+static void opticon_close(struct usb_serial_port *port)
+{
+	struct opticon_private *priv = usb_get_serial_port_data(port);
+
+	usb_kill_anchored_urbs(&priv->anchor);
+
+	usb_serial_generic_close(port);
+}
+
 static void opticon_write_control_callback(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
@@ -226,10 +237,13 @@ static int opticon_write(struct tty_struct *tty, struct usb_serial_port *port,
 		(unsigned char *)dr, buffer, count,
 		opticon_write_control_callback, port);
 
+	usb_anchor_urb(urb, priv->anchor);
+
 	/* send it down the pipe */
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
 	if (ret) {
 		dev_err(&port->dev, "failed to submit write urb: %d\n", ret);
+		usb_unanchor_urb(urb);
 		goto error;
 	}
 
@@ -364,6 +378,7 @@ static int opticon_port_probe(struct usb_serial_port *port)
 		return -ENOMEM;
 
 	spin_lock_init(&priv->lock);
+	init_usb_anchor(&priv->anchor);
 
 	usb_set_serial_port_data(port, priv);
 
@@ -391,6 +406,7 @@ static struct usb_serial_driver opticon_device = {
 	.port_probe =		opticon_port_probe,
 	.port_remove =		opticon_port_remove,
 	.open =			opticon_open,
+	.close =		opticon_close,
 	.write =		opticon_write,
 	.write_room = 		opticon_write_room,
 	.chars_in_buffer =	opticon_chars_in_buffer,
-- 
2.24.1

