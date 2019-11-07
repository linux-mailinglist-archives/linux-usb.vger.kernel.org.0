Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6A73F2F59
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388668AbfKGN3f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:35 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42633 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388008AbfKGN3e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:34 -0500
Received: by mail-lj1-f195.google.com with SMTP id n5so2261302ljc.9
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jfFfffzVTcOgudBE4JWMItypAKlcFqsOjrXitM3DElM=;
        b=fbZ5rglsr/BStOFRhzpVL8HdFNtGwqQHiEeW4wqHapRKCEFE59vaVxlQDL+uj+DKS9
         FS55oWL6FskImSe5lBbLIzMGDPix5EGzRnrcJ+WIEbcf6HQAgQeBpzDqvP/QdRokpjJP
         C0bIEx/B21MpSIUPIPlt/uE39xxGBGiHktBTmIeUSgNjZphIwdwzD7DdmeriJc9XHe51
         pDCcpp86JEMQkeOpEn0+yvCgW5DT4wSuAflzMlm1qdutI0I3wfmXBrl5HaWhxhBf9arP
         KSF2vfhhc/wPpHv4ES61sNaIsrOiZw1hOEJjxy251CVx1V7+zMROldiiM6Ir/Q+EqWDg
         Tabg==
X-Gm-Message-State: APjAAAXMncrr06Sy+tV/I4dQ8Y0RG2ijUoSxsPfsK8/HZajRDxxD/FSi
        MANJJNL2bzVIxrJvyBu+NJo=
X-Google-Smtp-Source: APXvYqzTOvv6eD9J6GtQBHPyYrWAdQLjP/f6B1JbkDgOtI22oKoRrD53JZIqNTlHorBnGskksnmqAg==
X-Received: by 2002:a2e:a304:: with SMTP id l4mr2436754lje.178.1573133371058;
        Thu, 07 Nov 2019 05:29:31 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id e14sm1652147ljb.75.2019.11.07.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:28 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000dp-Nl; Thu, 07 Nov 2019 14:29:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 06/11] USB: serial: mos7840: drop paranoid port checks
Date:   Thu,  7 Nov 2019 14:28:59 +0100
Message-Id: <20191107132904.2379-7-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the paranoid port structure sanity checks which are confusing at
best.

The driver data port pointer is set at port probe and never cleared,
while USB serial core sets the tty driver data at install and won't call
any driver functions with a NULL port pointer.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 92 ++++--------------------------------
 1 file changed, 8 insertions(+), 84 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 92180687097f..dcb1e04a0514 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -446,21 +446,6 @@ static void mos7840_led_activity(struct usb_serial_port *port)
 				jiffies + msecs_to_jiffies(LED_ON_MS));
 }
 
-static int mos7840_port_paranoia_check(struct usb_serial_port *port,
-				       const char *function)
-{
-	if (!port) {
-		pr_debug("%s - port == NULL\n", function);
-		return -1;
-	}
-	if (!port->serial) {
-		pr_debug("%s - port->serial == NULL\n", function);
-		return -1;
-	}
-
-	return 0;
-}
-
 /* Inline functions to check the sanity of a pointer that is passed to us */
 static int mos7840_serial_paranoia_check(struct usb_serial *serial,
 					 const char *function)
@@ -482,7 +467,6 @@ static struct usb_serial *mos7840_get_usb_serial(struct usb_serial_port *port,
 {
 	/* if no port was specified, or it fails a paranoia check */
 	if (!port ||
-	    mos7840_port_paranoia_check(port, function) ||
 	    mos7840_serial_paranoia_check(port->serial, function)) {
 		/* then say that we don't have a valid usb_serial thing,
 		 * which will end up genrating -ENODEV return values */
@@ -501,10 +485,10 @@ static struct usb_serial *mos7840_get_usb_serial(struct usb_serial_port *port,
 static void mos7840_bulk_in_callback(struct urb *urb)
 {
 	struct moschip_port *mos7840_port = urb->context;
+	struct usb_serial_port *port = mos7840_port->port;
 	int retval;
 	unsigned char *data;
 	struct usb_serial *serial;
-	struct usb_serial_port *port;
 	int status = urb->status;
 
 	if (status) {
@@ -513,12 +497,6 @@ static void mos7840_bulk_in_callback(struct urb *urb)
 		return;
 	}
 
-	port = mos7840_port->port;
-	if (mos7840_port_paranoia_check(port, __func__)) {
-		mos7840_port->read_urb_busy = false;
-		return;
-	}
-
 	serial = mos7840_get_usb_serial(port, __func__);
 	if (!serial) {
 		mos7840_port->read_urb_busy = false;
@@ -562,14 +540,12 @@ static void mos7840_bulk_in_callback(struct urb *urb)
 
 static void mos7840_bulk_out_data_callback(struct urb *urb)
 {
-	struct moschip_port *mos7840_port;
-	struct usb_serial_port *port;
+	struct moschip_port *mos7840_port = urb->context;
+	struct usb_serial_port *port = mos7840_port->port;
 	int status = urb->status;
 	unsigned long flags;
 	int i;
 
-	mos7840_port = urb->context;
-	port = mos7840_port->port;
 	spin_lock_irqsave(&mos7840_port->pool_lock, flags);
 	for (i = 0; i < NUM_URBS; i++) {
 		if (urb == mos7840_port->write_urb_pool[i]) {
@@ -584,9 +560,6 @@ static void mos7840_bulk_out_data_callback(struct urb *urb)
 		return;
 	}
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return;
-
 	if (mos7840_port->open)
 		tty_port_tty_wakeup(&port->port);
 
@@ -605,19 +578,14 @@ static void mos7840_bulk_out_data_callback(struct urb *urb)
 
 static int mos7840_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
+	struct usb_serial *serial = port->serial;
 	int response;
 	int j;
-	struct usb_serial *serial;
 	struct urb *urb;
 	__u16 Data;
 	int status;
 	struct moschip_port *mos7840_port;
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return -ENODEV;
-
-	serial = port->serial;
-
 	if (mos7840_serial_paranoia_check(serial, __func__))
 		return -ENODEV;
 
@@ -850,9 +818,6 @@ static int mos7840_chars_in_buffer(struct tty_struct *tty)
 	unsigned long flags;
 	struct moschip_port *mos7840_port;
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return 0;
-
 	mos7840_port = mos7840_get_port_private(port);
 	if (mos7840_port == NULL)
 		return 0;
@@ -882,9 +847,6 @@ static void mos7840_close(struct usb_serial_port *port)
 	int j;
 	__u16 Data;
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return;
-
 	serial = mos7840_get_usb_serial(port, __func__);
 	if (!serial)
 		return;
@@ -927,9 +889,6 @@ static void mos7840_break(struct tty_struct *tty, int break_state)
 	struct usb_serial *serial;
 	struct moschip_port *mos7840_port;
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return;
-
 	serial = mos7840_get_usb_serial(port, __func__);
 	if (!serial)
 		return;
@@ -967,9 +926,6 @@ static int mos7840_write_room(struct tty_struct *tty)
 	unsigned long flags;
 	struct moschip_port *mos7840_port;
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return -1;
-
 	mos7840_port = mos7840_get_port_private(port);
 	if (mos7840_port == NULL)
 		return -1;
@@ -998,6 +954,7 @@ static int mos7840_write_room(struct tty_struct *tty)
 static int mos7840_write(struct tty_struct *tty, struct usb_serial_port *port,
 			 const unsigned char *data, int count)
 {
+	struct usb_serial *serial = port->serial;
 	int status;
 	int i;
 	int bytes_sent = 0;
@@ -1005,15 +962,10 @@ static int mos7840_write(struct tty_struct *tty, struct usb_serial_port *port,
 	unsigned long flags;
 
 	struct moschip_port *mos7840_port;
-	struct usb_serial *serial;
 	struct urb *urb;
 	/* __u16 Data; */
 	const unsigned char *current_position = data;
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return -1;
-
-	serial = port->serial;
 	if (mos7840_serial_paranoia_check(serial, __func__))
 		return -1;
 
@@ -1104,9 +1056,6 @@ static void mos7840_throttle(struct tty_struct *tty)
 	struct moschip_port *mos7840_port;
 	int status;
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return;
-
 	mos7840_port = mos7840_get_port_private(port);
 
 	if (mos7840_port == NULL)
@@ -1146,9 +1095,6 @@ static void mos7840_unthrottle(struct tty_struct *tty)
 	int status;
 	struct moschip_port *mos7840_port = mos7840_get_port_private(port);
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return;
-
 	if (mos7840_port == NULL)
 		return;
 
@@ -1296,18 +1242,11 @@ static int mos7840_calc_baud_rate_divisor(struct usb_serial_port *port,
 static int mos7840_send_cmd_write_baud_rate(struct moschip_port *mos7840_port,
 					    int baudRate)
 {
+	struct usb_serial_port *port = mos7840_port->port;
 	int divisor = 0;
 	int status;
 	__u16 Data;
 	__u16 clk_sel_val;
-	struct usb_serial_port *port;
-
-	if (mos7840_port == NULL)
-		return -1;
-
-	port = mos7840_port->port;
-	if (mos7840_port_paranoia_check(port, __func__))
-		return -1;
 
 	if (mos7840_serial_paranoia_check(port->serial, __func__))
 		return -1;
@@ -1399,6 +1338,7 @@ static int mos7840_send_cmd_write_baud_rate(struct moschip_port *mos7840_port,
 static void mos7840_change_port_settings(struct tty_struct *tty,
 	struct moschip_port *mos7840_port, struct ktermios *old_termios)
 {
+	struct usb_serial_port *port = mos7840_port->port;
 	int baud;
 	unsigned cflag;
 	__u8 lData;
@@ -1406,15 +1346,6 @@ static void mos7840_change_port_settings(struct tty_struct *tty,
 	__u8 lStop;
 	int status;
 	__u16 Data;
-	struct usb_serial_port *port;
-
-	if (mos7840_port == NULL)
-		return;
-
-	port = mos7840_port->port;
-
-	if (mos7840_port_paranoia_check(port, __func__))
-		return;
 
 	if (mos7840_serial_paranoia_check(port->serial, __func__))
 		return;
@@ -1557,14 +1488,10 @@ static void mos7840_set_termios(struct tty_struct *tty,
 				struct usb_serial_port *port,
 				struct ktermios *old_termios)
 {
+	struct usb_serial *serial = port->serial;
 	int status;
-	struct usb_serial *serial;
 	struct moschip_port *mos7840_port;
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return;
-
-	serial = port->serial;
 
 	if (mos7840_serial_paranoia_check(serial, __func__))
 		return;
@@ -1659,9 +1586,6 @@ static int mos7840_ioctl(struct tty_struct *tty,
 	void __user *argp = (void __user *)arg;
 	struct moschip_port *mos7840_port;
 
-	if (mos7840_port_paranoia_check(port, __func__))
-		return -1;
-
 	mos7840_port = mos7840_get_port_private(port);
 
 	if (mos7840_port == NULL)
-- 
2.23.0

