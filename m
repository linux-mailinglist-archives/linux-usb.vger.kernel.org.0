Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82962F2F5C
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388708AbfKGN3h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:37 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37246 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388008AbfKGN3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:36 -0500
Received: by mail-lj1-f195.google.com with SMTP id l20so2281514lje.4
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QHlkzVPGYoZV2+CMcfwNeUR5UtQIb8x4XIcb1f9JufI=;
        b=ozK6YCPl4PBkEhxS8ZMTAv4RH0bEXYBJSi+SOGTcEtyRZkNSwOoTX6L5tDNqNrvx5M
         OVLndalqIIyY0dCfGxoEYFLNkY7KV1c8F13zS9pi8fYlx+rXxvuJdBLKbryA8dfSE1DP
         mCdO0wyZ8AsYIqVETLkk1aYeXoNpOy2ufTDKBBx70+FbZmTj1rMfcjVhY7oK7i/h6RBL
         yIxaftAvknuy/s7cxap0Wflxy9s+HVW8k0Jw2ayb7MQmhqg7AmcdfVsjmJyeDGMUZ6Uw
         ruv7GoOKTi3CiPM8KoqmDlmPmWY+ZjzQtsxe2Zn3Ye6UUCIutA/hFCbxwrnVJNqbi9Qc
         T4vw==
X-Gm-Message-State: APjAAAV5lbowWV9FNVcuC/6MFgAUBJD1AGOy8bF4F9j9isxYIhJEO3+M
        ks2M9XClYrJKUdlijqXDOd2nDaxX
X-Google-Smtp-Source: APXvYqwm4FRA0fgAB9yLBQDqx5SS0jU2ep2o2q3pu+wRr4MB59+K/yj8sWFlAaBew6ZxybF+SYxw+A==
X-Received: by 2002:a2e:9784:: with SMTP id y4mr2530990lji.77.1573133375015;
        Thu, 07 Nov 2019 05:29:35 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id 4sm1006649lfa.95.2019.11.07.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:28 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000dy-T0; Thu, 07 Nov 2019 14:29:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 08/11] USB: serial: mos7840: drop serial struct accessor
Date:   Thu,  7 Nov 2019 14:29:01 +0100
Message-Id: <20191107132904.2379-9-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the helper used to retrieve the serial struct pointer from the port
structure.

Note that this helper was only used when the serial structure was
actually not needed.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 207b88d948a9..01787685a4ee 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -446,19 +446,6 @@ static void mos7840_led_activity(struct usb_serial_port *port)
 				jiffies + msecs_to_jiffies(LED_ON_MS));
 }
 
-static struct usb_serial *mos7840_get_usb_serial(struct usb_serial_port *port,
-						 const char *function)
-{
-	/* if no port was specified */
-	if (!port) {
-		/* then say that we don't have a valid usb_serial thing,
-		 * which will end up genrating -ENODEV return values */
-		return NULL;
-	}
-
-	return port->serial;
-}
-
 /*****************************************************************************
  * mos7840_bulk_in_callback
  *	this is the callback function for when we have received data on the
@@ -471,7 +458,6 @@ static void mos7840_bulk_in_callback(struct urb *urb)
 	struct usb_serial_port *port = mos7840_port->port;
 	int retval;
 	unsigned char *data;
-	struct usb_serial *serial;
 	int status = urb->status;
 
 	if (status) {
@@ -480,12 +466,6 @@ static void mos7840_bulk_in_callback(struct urb *urb)
 		return;
 	}
 
-	serial = mos7840_get_usb_serial(port, __func__);
-	if (!serial) {
-		mos7840_port->read_urb_busy = false;
-		return;
-	}
-
 	data = urb->transfer_buffer;
 	usb_serial_debug_data(&port->dev, __func__, urb->actual_length, data);
 
@@ -822,15 +802,10 @@ static int mos7840_chars_in_buffer(struct tty_struct *tty)
 
 static void mos7840_close(struct usb_serial_port *port)
 {
-	struct usb_serial *serial;
 	struct moschip_port *mos7840_port;
 	int j;
 	__u16 Data;
 
-	serial = mos7840_get_usb_serial(port, __func__);
-	if (!serial)
-		return;
-
 	mos7840_port = mos7840_get_port_private(port);
 	if (mos7840_port == NULL)
 		return;
@@ -866,13 +841,8 @@ static void mos7840_break(struct tty_struct *tty, int break_state)
 {
 	struct usb_serial_port *port = tty->driver_data;
 	unsigned char data;
-	struct usb_serial *serial;
 	struct moschip_port *mos7840_port;
 
-	serial = mos7840_get_usb_serial(port, __func__);
-	if (!serial)
-		return;
-
 	mos7840_port = mos7840_get_port_private(port);
 
 	if (mos7840_port == NULL)
-- 
2.23.0

