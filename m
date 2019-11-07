Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F195CF2F5B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388683AbfKGN3g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:36 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43581 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388525AbfKGN3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:36 -0500
Received: by mail-lj1-f193.google.com with SMTP id y23so2258606ljh.10
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SwpaxTxNJWgIEUxyPB9fMbXiAXc6MAAqO3URuJG+Mhs=;
        b=kH6VmNdtIVKLbkCm5Oy+VzrZP0VCvkzEaEEcGFpnj2j+Vq/dZLcIN6d0jopEAc3e3r
         w9gNaeW30ujf7PX6zrJvmweMbVxnKzumzyP2aVjQD4lltEzjpRzQv58W5KT/lUPBS3kB
         kgoH7LbIxFEMue8ZnzacXwp/XALJLA8L95kRTveB7gvhzX3Royz7UN8JC9YygPSR2Nsg
         9lR20FL+wAfdFHn/wxA86evKx114HKVfNFoh2TvZiVIpB1Pil8nvQ82S/6n596g3JeUY
         BBf+tytupi9l/cTKecNcRHRO/LPuGDbZrCERQmyXqW4X4DgZC4nc/nAAXebEnjfPiZ8/
         k61g==
X-Gm-Message-State: APjAAAVC8qH0mfvWbXXuWvV4QIUngAoHcpWXBnW/SeWpzMRctMcpCq4Z
        BB38wu6FTdV5KPzZNhev8cQYMP4r
X-Google-Smtp-Source: APXvYqzsZghg0fLak90MCL47dHkSfRKVbImbgdRtPKJOnFQxbOn4blxDbaPKOH5Z+pRjQdDtkq8FJQ==
X-Received: by 2002:a2e:8784:: with SMTP id n4mr2569290lji.230.1573133373882;
        Thu, 07 Nov 2019 05:29:33 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id e10sm980560ljp.23.2019.11.07.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:28 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqo-0000eD-5s; Thu, 07 Nov 2019 14:29:26 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 11/11] USB: serial: mos7840: drop port open flag
Date:   Thu,  7 Nov 2019 14:29:04 +0100
Message-Id: <20191107132904.2379-12-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the redundant port open flag and corresponding checks. USB serial
core will not call any of these driver callbacks for a closed port, and the
write URBs are stopped at close().

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index f5c08effa3ab..23f91d658cb4 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -198,7 +198,6 @@ struct moschip_port {
 	struct urb *read_urb;	/* read URB for this port */
 	__u8 shadowLCR;		/* last LCR value received */
 	__u8 shadowMCR;		/* last MCR value received */
-	char open;
 	struct usb_serial_port *port;	/* loop back to the owner of this object */
 
 	/* Offsets */
@@ -497,8 +496,7 @@ static void mos7840_bulk_out_data_callback(struct urb *urb)
 		return;
 	}
 
-	if (mos7840_port->open)
-		tty_port_tty_wakeup(&port->port);
+	tty_port_tty_wakeup(&port->port);
 
 }
 
@@ -714,9 +712,6 @@ static int mos7840_open(struct tty_struct *tty, struct usb_serial_port *port)
 	/* initialize our port settings */
 	/* Must set to enable ints! */
 	mos7840_port->shadowMCR = MCR_MASTER_IE;
-	/* send a open port command */
-	mos7840_port->open = 1;
-	/* mos7840_change_port_settings(mos7840_port,old_termios); */
 
 	return 0;
 err:
@@ -791,8 +786,6 @@ static void mos7840_close(struct usb_serial_port *port)
 
 	Data = 0x00;
 	mos7840_set_uart_reg(port, INTERRUPT_ENABLE_REGISTER, Data);
-
-	mos7840_port->open = 0;
 }
 
 /*****************************************************************************
@@ -951,11 +944,6 @@ static void mos7840_throttle(struct tty_struct *tty)
 	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	int status;
 
-	if (!mos7840_port->open) {
-		dev_dbg(&port->dev, "%s", "port not opened\n");
-		return;
-	}
-
 	/* if we are implementing XON/XOFF, send the stop character */
 	if (I_IXOFF(tty)) {
 		unsigned char stop_char = STOP_CHAR(tty);
@@ -985,11 +973,6 @@ static void mos7840_unthrottle(struct tty_struct *tty)
 	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	int status;
 
-	if (!mos7840_port->open) {
-		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
-		return;
-	}
-
 	/* if we are implementing XON/XOFF, send the start character */
 	if (I_IXOFF(tty)) {
 		unsigned char start_char = START_CHAR(tty);
@@ -1221,11 +1204,6 @@ static void mos7840_change_port_settings(struct tty_struct *tty,
 	int status;
 	__u16 Data;
 
-	if (!mos7840_port->open) {
-		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
-		return;
-	}
-
 	lData = LCR_BITS_8;
 	lStop = LCR_STOP_1;
 	lParity = LCR_PAR_NONE;
@@ -1362,11 +1340,6 @@ static void mos7840_set_termios(struct tty_struct *tty,
 	struct moschip_port *mos7840_port = usb_get_serial_port_data(port);
 	int status;
 
-	if (!mos7840_port->open) {
-		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
-		return;
-	}
-
 	/* change the port settings to the new ones specified */
 
 	mos7840_change_port_settings(tty, mos7840_port, old_termios);
-- 
2.23.0

