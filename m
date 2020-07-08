Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA3721880D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbgGHMua (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:30 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44557 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729344AbgGHMu0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:26 -0400
Received: by mail-lf1-f68.google.com with SMTP id y18so26800064lfh.11
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sIAuoCjdhQjebZskIt0528un459ZXux9+rw/jvZ4lG4=;
        b=Z0Sq9h+xCEMd7/5P5Y7DIXsjhjssYXBUvyUO1psCoU7B5/RcrIZj9ZkEzk+xOuMJZe
         +3rymqweih4Gpu4x3pwRow8S+gywbX42sEH/uc1wfi7a+J1Nynsd+/sBSZU8Og5mYW8n
         afOyyk6e+xo79J7ya1kw1gDdbSrVRV86EkyVypYXqQEUh4FnkyQ7DmcFD2L5O6qOkreg
         stLL5rX6vYBo2X1Og+npy0IluPF6G3Da1Snws9Jsmsjv0sQHAKzykbYuLxJcK88a4zUf
         JGfUQ6irJa9F+sdGTzKeUfiUlEekhOVV4GlHFeoPwlwCw3x6uY3WGD8ATsXF0nJZkHfq
         6bfA==
X-Gm-Message-State: AOAM532XycQYh6pbHkofZTl6iQNvxi+cCGCjX4IqMkbfQ45v3NXOdISN
        nSBhZEXgEJwR3dpdwW/lVNnyBiI+rc8=
X-Google-Smtp-Source: ABdhPJyrVgwlN3yQoWlRFMsgiJ4Lg8L05MCaeH2Ofmz44sIF/4DWXfzgbcVQoicl+LhIYdpGAmMWHA==
X-Received: by 2002:a05:6512:783:: with SMTP id x3mr26267608lfr.126.1594212622405;
        Wed, 08 Jul 2020 05:50:22 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id d21sm892191ljo.85.2020.07.08.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-00045m-95; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 04/10] USB: serial: only set sysrq timestamp for consoles
Date:   Wed,  8 Jul 2020 14:49:54 +0200
Message-Id: <20200708125000.15659-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Only set the sysrq timestamp for console ports to avoid having every
driver also check the console flag when processing incoming data.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/f81232.c   |  4 ++--
 drivers/usb/serial/f81534.c   |  2 +-
 drivers/usb/serial/ftdi_sio.c |  2 +-
 drivers/usb/serial/generic.c  | 11 +++++++----
 drivers/usb/serial/mxuport.c  |  6 +++---
 drivers/usb/serial/pl2303.c   |  2 +-
 drivers/usb/serial/ssu100.c   |  5 +++--
 7 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index dcda7fb164b4..0c7eacc630e0 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -424,7 +424,7 @@ static void f81232_process_read_urb(struct urb *urb)
 		lsr = data[i];
 		tty_flag = f81232_handle_lsr(port, lsr);
 
-		if (port->port.console && port->sysrq) {
+		if (port->sysrq) {
 			if (usb_serial_handle_sysrq_char(port, data[i + 1]))
 				continue;
 		}
@@ -461,7 +461,7 @@ static void f81534a_process_read_urb(struct urb *urb)
 	lsr = data[len - 1];
 	tty_flag = f81232_handle_lsr(port, lsr);
 
-	if (port->port.console && port->sysrq) {
+	if (port->sysrq) {
 		for (i = 1; i < len - 1; ++i) {
 			if (!usb_serial_handle_sysrq_char(port, data[i])) {
 				tty_insert_flip_char(&port->port, data[i],
diff --git a/drivers/usb/serial/f81534.c b/drivers/usb/serial/f81534.c
index 2b39bda035c7..5661fd03e545 100644
--- a/drivers/usb/serial/f81534.c
+++ b/drivers/usb/serial/f81534.c
@@ -1238,7 +1238,7 @@ static void f81534_process_per_serial_block(struct usb_serial_port *port,
 			schedule_work(&port_priv->lsr_work);
 		}
 
-		if (port->port.console && port->sysrq) {
+		if (port->sysrq) {
 			if (usb_serial_handle_sysrq_char(port, data[i]))
 				continue;
 		}
diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 07b146d7033a..ade68405b015 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2561,7 +2561,7 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 
 	port->icount.rx += len - 2;
 
-	if (brkint || (port->port.console && port->sysrq)) {
+	if (brkint || port->sysrq) {
 		for (i = 2; i < len; i++) {
 			if (brkint && i == len - 1) {
 				if (usb_serial_handle_break(port))
diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 5cdf180cda23..05a2a3aa3963 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -355,13 +355,13 @@ void usb_serial_generic_process_read_urb(struct urb *urb)
 	 * stuff like 3G modems, so shortcircuit it in the 99.9999999% of
 	 * cases where the USB serial is not a console anyway.
 	 */
-	if (!port->port.console || !port->sysrq) {
-		tty_insert_flip_string(&port->port, ch, urb->actual_length);
-	} else {
+	if (port->sysrq) {
 		for (i = 0; i < urb->actual_length; i++, ch++) {
 			if (!usb_serial_handle_sysrq_char(port, *ch))
 				tty_insert_flip_char(&port->port, *ch, TTY_NORMAL);
 		}
+	} else {
+		tty_insert_flip_string(&port->port, ch, urb->actual_length);
 	}
 	tty_flip_buffer_push(&port->port);
 }
@@ -574,7 +574,7 @@ EXPORT_SYMBOL_GPL(usb_serial_generic_get_icount);
 #ifdef CONFIG_MAGIC_SYSRQ
 int usb_serial_handle_sysrq_char(struct usb_serial_port *port, unsigned int ch)
 {
-	if (port->sysrq && port->port.console) {
+	if (port->sysrq) {
 		if (ch && time_before(jiffies, port->sysrq)) {
 			handle_sysrq(ch);
 			port->sysrq = 0;
@@ -594,6 +594,9 @@ EXPORT_SYMBOL_GPL(usb_serial_handle_sysrq_char);
 
 int usb_serial_handle_break(struct usb_serial_port *port)
 {
+	if (!port->port.console)
+		return 0;
+
 	if (!port->sysrq) {
 		port->sysrq = jiffies + HZ*5;
 		return 1;
diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 2513ee902779..5d38c2a0f590 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -327,14 +327,14 @@ static void mxuport_process_read_urb_data(struct usb_serial_port *port,
 {
 	int i;
 
-	if (!port->port.console || !port->sysrq) {
-		tty_insert_flip_string(&port->port, data, size);
-	} else {
+	if (port->sysrq) {
 		for (i = 0; i < size; i++, data++) {
 			if (!usb_serial_handle_sysrq_char(port, *data))
 				tty_insert_flip_char(&port->port, *data,
 						     TTY_NORMAL);
 		}
+	} else {
+		tty_insert_flip_string(&port->port, data, size);
 	}
 	tty_flip_buffer_push(&port->port);
 }
diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index c5a2995dfa2e..048452d8a4a4 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -1101,7 +1101,7 @@ static void pl2303_process_read_urb(struct urb *urb)
 	if (line_status & UART_OVERRUN_ERROR)
 		tty_insert_flip_char(&port->port, 0, TTY_OVERRUN);
 
-	if (port->port.console && port->sysrq) {
+	if (port->sysrq) {
 		for (i = 0; i < urb->actual_length; ++i)
 			if (!usb_serial_handle_sysrq_char(port, data[i]))
 				tty_insert_flip_char(&port->port, data[i],
diff --git a/drivers/usb/serial/ssu100.c b/drivers/usb/serial/ssu100.c
index f6aea9f1be1a..01472b96bf38 100644
--- a/drivers/usb/serial/ssu100.c
+++ b/drivers/usb/serial/ssu100.c
@@ -517,13 +517,14 @@ static void ssu100_process_read_urb(struct urb *urb)
 	if (!len)
 		return;	/* status only */
 
-	if (port->port.console && port->sysrq) {
+	if (port->sysrq) {
 		for (i = 0; i < len; i++, ch++) {
 			if (!usb_serial_handle_sysrq_char(port, *ch))
 				tty_insert_flip_char(&port->port, *ch, flag);
 		}
-	} else
+	} else {
 		tty_insert_flip_string_fixed_flag(&port->port, ch, flag, len);
+	}
 
 	tty_flip_buffer_push(&port->port);
 }
-- 
2.26.2

