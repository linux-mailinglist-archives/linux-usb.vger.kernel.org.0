Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF13F2F58
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388613AbfKGN3f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:35 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41856 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbfKGN3e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:34 -0500
Received: by mail-lj1-f193.google.com with SMTP id m9so2261705ljh.8
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IWNc6gKaHd0LRi/YjZbjj6jKzYZ1Fwyj1A+ny0FdUCA=;
        b=pWDk4nFfMVCPBj8c6OWWuswNa9ZuRHubF6V/A7Fvhdon2bGtCeFZwYXJ8T2ETnDDJH
         kiaIEa5FN9efY4L/bDUruOsaFG+YIvjlri/zUh28k/PkgumPcQTdmCgALq0YuTQWU+lQ
         8RuGr+vGExFX0d2Qa71GV9LjM36qTVY6BvIPJ3cIpb6HKl6aODhEVO7nBNPmGX8jCLr9
         6I5+/JYnsGijJ5vZPaFNMMdvaaNE/h91YdfdyHKTj7Iw8/iJ/UydXTRgTbCZPi08LANd
         WW7rcPzHFfdYqOS8dVXDBQauJ0sYFNhmW75F9ss7rr3/eFhdsn3QPZkukWGOn1/pv4Fo
         M4IA==
X-Gm-Message-State: APjAAAUSyyIWjsM+BLN9TOUcShh3CHWQCMLPjHzxdGIfonnhyry7akt5
        7y517rgyODNKhld2uHJCgiNZcyfb
X-Google-Smtp-Source: APXvYqwV0cNNFUcA/zqPsf2Uht0SM/QHVV09iqlWJRAJ34OI9CZgtZpvMb8cEoTI4DLe0yXoKK+TOg==
X-Received: by 2002:a2e:3a09:: with SMTP id h9mr2546792lja.33.1573133371965;
        Thu, 07 Nov 2019 05:29:31 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r12sm2065336lfp.63.2019.11.07.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:28 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000e4-Vb; Thu, 07 Nov 2019 14:29:26 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 09/11] USB: serial: mos7840: drop port driver data accessors
Date:   Thu,  7 Nov 2019 14:29:02 +0100
Message-Id: <20191107132904.2379-10-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the custom port driver data accessors and paranoid sanity checks.
The driver data is not cleared until the driver is unbound.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 104 +++++------------------------------
 1 file changed, 13 insertions(+), 91 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 01787685a4ee..11706f2d4145 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -344,26 +344,6 @@ static void mos7840_dump_serial_port(struct usb_serial_port *port,
 
 }
 
-/************************************************************************/
-/************************************************************************/
-/*             I N T E R F A C E   F U N C T I O N S			*/
-/*             I N T E R F A C E   F U N C T I O N S			*/
-/************************************************************************/
-/************************************************************************/
-
-static inline void mos7840_set_port_private(struct usb_serial_port *port,
-					    struct moschip_port *data)
-{
-	usb_set_serial_port_data(port, (void *)data);
-}
-
-static inline struct moschip_port *mos7840_get_port_private(struct
-							    usb_serial_port
-							    *port)
-{
-	return (struct moschip_port *)usb_get_serial_port_data(port);
-}
-
 /************************************************************************/
 /************************************************************************/
 /*            U S B  C A L L B A C K   F U N C T I O N S                */
@@ -541,17 +521,13 @@ static void mos7840_bulk_out_data_callback(struct urb *urb)
 
 static int mos7840_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	struct usb_serial *serial = port->serial;
 	int response;
 	int j;
 	struct urb *urb;
 	__u16 Data;
 	int status;
-	struct moschip_port *mos7840_port;
-
-	mos7840_port = mos7840_get_port_private(port);
-	if (mos7840_port == NULL)
-		return -ENODEV;
 
 	usb_clear_halt(serial->dev, port->write_urb->pipe);
 	usb_clear_halt(serial->dev, port->read_urb->pipe);
@@ -773,14 +749,10 @@ static int mos7840_open(struct tty_struct *tty, struct usb_serial_port *port)
 static int mos7840_chars_in_buffer(struct tty_struct *tty)
 {
 	struct usb_serial_port *port = tty->driver_data;
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	int i;
 	int chars = 0;
 	unsigned long flags;
-	struct moschip_port *mos7840_port;
-
-	mos7840_port = mos7840_get_port_private(port);
-	if (mos7840_port == NULL)
-		return 0;
 
 	spin_lock_irqsave(&mos7840_port->pool_lock, flags);
 	for (i = 0; i < NUM_URBS; ++i) {
@@ -802,14 +774,10 @@ static int mos7840_chars_in_buffer(struct tty_struct *tty)
 
 static void mos7840_close(struct usb_serial_port *port)
 {
-	struct moschip_port *mos7840_port;
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	int j;
 	__u16 Data;
 
-	mos7840_port = mos7840_get_port_private(port);
-	if (mos7840_port == NULL)
-		return;
-
 	for (j = 0; j < NUM_URBS; ++j)
 		usb_kill_urb(mos7840_port->write_urb_pool[j]);
 
@@ -840,13 +808,8 @@ static void mos7840_close(struct usb_serial_port *port)
 static void mos7840_break(struct tty_struct *tty, int break_state)
 {
 	struct usb_serial_port *port = tty->driver_data;
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	unsigned char data;
-	struct moschip_port *mos7840_port;
-
-	mos7840_port = mos7840_get_port_private(port);
-
-	if (mos7840_port == NULL)
-		return;
 
 	if (break_state == -1)
 		data = mos7840_port->shadowLCR | LCR_SET_BREAK;
@@ -871,14 +834,10 @@ static void mos7840_break(struct tty_struct *tty, int break_state)
 static int mos7840_write_room(struct tty_struct *tty)
 {
 	struct usb_serial_port *port = tty->driver_data;
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	int i;
 	int room = 0;
 	unsigned long flags;
-	struct moschip_port *mos7840_port;
-
-	mos7840_port = mos7840_get_port_private(port);
-	if (mos7840_port == NULL)
-		return -1;
 
 	spin_lock_irqsave(&mos7840_port->pool_lock, flags);
 	for (i = 0; i < NUM_URBS; ++i) {
@@ -904,22 +863,17 @@ static int mos7840_write_room(struct tty_struct *tty)
 static int mos7840_write(struct tty_struct *tty, struct usb_serial_port *port,
 			 const unsigned char *data, int count)
 {
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	struct usb_serial *serial = port->serial;
 	int status;
 	int i;
 	int bytes_sent = 0;
 	int transfer_size;
 	unsigned long flags;
-
-	struct moschip_port *mos7840_port;
 	struct urb *urb;
 	/* __u16 Data; */
 	const unsigned char *current_position = data;
 
-	mos7840_port = mos7840_get_port_private(port);
-	if (mos7840_port == NULL)
-		return -1;
-
 	/* try to find a free urb in the list */
 	urb = NULL;
 
@@ -1000,14 +954,9 @@ static int mos7840_write(struct tty_struct *tty, struct usb_serial_port *port,
 static void mos7840_throttle(struct tty_struct *tty)
 {
 	struct usb_serial_port *port = tty->driver_data;
-	struct moschip_port *mos7840_port;
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	int status;
 
-	mos7840_port = mos7840_get_port_private(port);
-
-	if (mos7840_port == NULL)
-		return;
-
 	if (!mos7840_port->open) {
 		dev_dbg(&port->dev, "%s", "port not opened\n");
 		return;
@@ -1039,11 +988,8 @@ static void mos7840_throttle(struct tty_struct *tty)
 static void mos7840_unthrottle(struct tty_struct *tty)
 {
 	struct usb_serial_port *port = tty->driver_data;
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	int status;
-	struct moschip_port *mos7840_port = mos7840_get_port_private(port);
-
-	if (mos7840_port == NULL)
-		return;
 
 	if (!mos7840_port->open) {
 		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
@@ -1071,15 +1017,10 @@ static void mos7840_unthrottle(struct tty_struct *tty)
 static int mos7840_tiocmget(struct tty_struct *tty)
 {
 	struct usb_serial_port *port = tty->driver_data;
-	struct moschip_port *mos7840_port;
 	unsigned int result;
 	__u16 msr;
 	__u16 mcr;
 	int status;
-	mos7840_port = mos7840_get_port_private(port);
-
-	if (mos7840_port == NULL)
-		return -ENODEV;
 
 	status = mos7840_get_uart_reg(port, MODEM_STATUS_REGISTER, &msr);
 	if (status < 0)
@@ -1104,15 +1045,10 @@ static int mos7840_tiocmset(struct tty_struct *tty,
 			    unsigned int set, unsigned int clear)
 {
 	struct usb_serial_port *port = tty->driver_data;
-	struct moschip_port *mos7840_port;
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	unsigned int mcr;
 	int status;
 
-	mos7840_port = mos7840_get_port_private(port);
-
-	if (mos7840_port == NULL)
-		return -ENODEV;
-
 	/* FIXME: What locks the port registers ? */
 	mcr = mos7840_port->shadowMCR;
 	if (clear & TIOCM_RTS)
@@ -1429,13 +1365,8 @@ static void mos7840_set_termios(struct tty_struct *tty,
 				struct usb_serial_port *port,
 				struct ktermios *old_termios)
 {
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	int status;
-	struct moschip_port *mos7840_port;
-
-	mos7840_port = mos7840_get_port_private(port);
-
-	if (mos7840_port == NULL)
-		return;
 
 	if (!mos7840_port->open) {
 		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
@@ -1497,7 +1428,7 @@ static int mos7840_get_serial_info(struct tty_struct *tty,
 				   struct serial_struct *ss)
 {
 	struct usb_serial_port *port = tty->driver_data;
-	struct moschip_port *mos7840_port = mos7840_get_port_private(port);
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 
 	ss->type = PORT_16550A;
 	ss->line = mos7840_port->port->minor;
@@ -1520,12 +1451,6 @@ static int mos7840_ioctl(struct tty_struct *tty,
 {
 	struct usb_serial_port *port = tty->driver_data;
 	void __user *argp = (void __user *)arg;
-	struct moschip_port *mos7840_port;
-
-	mos7840_port = mos7840_get_port_private(port);
-
-	if (mos7840_port == NULL)
-		return -1;
 
 	switch (cmd) {
 		/* return number of bytes available */
@@ -1692,7 +1617,6 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 	 * common to all port */
 
 	mos7840_port->port = port;
-	mos7840_set_port_private(port, mos7840_port);
 	spin_lock_init(&mos7840_port->pool_lock);
 
 	/* minor is not initialised until later by
@@ -1718,7 +1642,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 		mos7840_port->DcrRegOffset = 0x16 + 3 * (phy_num - 2);
 	}
 	mos7840_dump_serial_port(port, mos7840_port);
-	mos7840_set_port_private(port, mos7840_port);
+	usb_set_serial_port_data(port, mos7840_port);
 
 	/* enable rx_disable bit in control register */
 	status = mos7840_get_reg_sync(port,
@@ -1859,9 +1783,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 
 static int mos7840_port_remove(struct usb_serial_port *port)
 {
-	struct moschip_port *mos7840_port;
-
-	mos7840_port = mos7840_get_port_private(port);
+	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 
 	if (mos7840_port->has_led) {
 		/* Turn off LED */
-- 
2.23.0

