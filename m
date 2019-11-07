Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5DC9F2F57
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388504AbfKGN3e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:34 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41120 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbfKGN3e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:34 -0500
Received: by mail-lf1-f68.google.com with SMTP id j14so1591568lfb.8
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gVxCcGkHQM/3+rGEIzFNU8KiSHclyzKNkWX8dKWpChQ=;
        b=EMwKD72OVaduri0JCeJ84dTjLlulaHU7pojL0suXT0hHvuurd9vgVbXde8/Nmteyw3
         LXACvTQQFuVLEF63RjO3VDM4Itdb27H5JKKdEM1fXZK73NixVoiMZarHnnupuYT9rKRD
         5/lJdOFz+HDiIEsMGu87fP8+UUOylcCjZYoG7vAxZ+jv2iisnwOSVpgwa7v1svC/4ZCK
         BXxygFhxaYOZIIxEMKz0hpwUQAxhvzPHfbhVa0O0xyZfU5fzC3NscsCIkJncykO+Ac+V
         pOezJqM4vKs+bDH/Lktjqp8SPw+wA43Mqbd+ZLfg9lLv6uo03g3raiWmIJJmYZWwKkeO
         2CCg==
X-Gm-Message-State: APjAAAXjlDJ+7k/BlbFMdIe/upfDM8ZinUTjCQa6GQeqSV3wz936BchA
        qSJGhPvoWRDs9R+6We7du+4=
X-Google-Smtp-Source: APXvYqxHK4hts7imHkGOM+6ubdtYS4G8/k5AjBnrFwMWJYDr5JX4epiRMtkSzxhZ+QedytY9yHuXWg==
X-Received: by 2002:a19:820e:: with SMTP id e14mr2449169lfd.29.1573133372409;
        Thu, 07 Nov 2019 05:29:32 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id a22sm977434ljn.58.2019.11.07.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:28 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000dt-Qa; Thu, 07 Nov 2019 14:29:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 07/11] USB: serial: mos7840: drop paranoid serial checks
Date:   Thu,  7 Nov 2019 14:29:00 +0100
Message-Id: <20191107132904.2379-8-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the likewise paranoid serial structure sanity checks.

USB serial core sets the serial pointer in the port structures at
initialisation and it is never cleared, and similar for the serial
structure type.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 38 ++----------------------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index dcb1e04a0514..207b88d948a9 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -446,28 +446,11 @@ static void mos7840_led_activity(struct usb_serial_port *port)
 				jiffies + msecs_to_jiffies(LED_ON_MS));
 }
 
-/* Inline functions to check the sanity of a pointer that is passed to us */
-static int mos7840_serial_paranoia_check(struct usb_serial *serial,
-					 const char *function)
-{
-	if (!serial) {
-		pr_debug("%s - serial == NULL\n", function);
-		return -1;
-	}
-	if (!serial->type) {
-		pr_debug("%s - serial->type == NULL!\n", function);
-		return -1;
-	}
-
-	return 0;
-}
-
 static struct usb_serial *mos7840_get_usb_serial(struct usb_serial_port *port,
 						 const char *function)
 {
-	/* if no port was specified, or it fails a paranoia check */
-	if (!port ||
-	    mos7840_serial_paranoia_check(port->serial, function)) {
+	/* if no port was specified */
+	if (!port) {
 		/* then say that we don't have a valid usb_serial thing,
 		 * which will end up genrating -ENODEV return values */
 		return NULL;
@@ -586,9 +569,6 @@ static int mos7840_open(struct tty_struct *tty, struct usb_serial_port *port)
 	int status;
 	struct moschip_port *mos7840_port;
 
-	if (mos7840_serial_paranoia_check(serial, __func__))
-		return -ENODEV;
-
 	mos7840_port = mos7840_get_port_private(port);
 	if (mos7840_port == NULL)
 		return -ENODEV;
@@ -966,9 +946,6 @@ static int mos7840_write(struct tty_struct *tty, struct usb_serial_port *port,
 	/* __u16 Data; */
 	const unsigned char *current_position = data;
 
-	if (mos7840_serial_paranoia_check(serial, __func__))
-		return -1;
-
 	mos7840_port = mos7840_get_port_private(port);
 	if (mos7840_port == NULL)
 		return -1;
@@ -1248,9 +1225,6 @@ static int mos7840_send_cmd_write_baud_rate(struct moschip_port *mos7840_port,
 	__u16 Data;
 	__u16 clk_sel_val;
 
-	if (mos7840_serial_paranoia_check(port->serial, __func__))
-		return -1;
-
 	dev_dbg(&port->dev, "%s - baud = %d\n", __func__, baudRate);
 	/* reset clk_uart_sel in spregOffset */
 	if (baudRate > 115200) {
@@ -1347,9 +1321,6 @@ static void mos7840_change_port_settings(struct tty_struct *tty,
 	int status;
 	__u16 Data;
 
-	if (mos7840_serial_paranoia_check(port->serial, __func__))
-		return;
-
 	if (!mos7840_port->open) {
 		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
 		return;
@@ -1488,14 +1459,9 @@ static void mos7840_set_termios(struct tty_struct *tty,
 				struct usb_serial_port *port,
 				struct ktermios *old_termios)
 {
-	struct usb_serial *serial = port->serial;
 	int status;
 	struct moschip_port *mos7840_port;
 
-
-	if (mos7840_serial_paranoia_check(serial, __func__))
-		return;
-
 	mos7840_port = mos7840_get_port_private(port);
 
 	if (mos7840_port == NULL)
-- 
2.23.0

