Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECCCB5FE6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 11:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbfIRJO1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 05:14:27 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40629 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfIRJO1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Sep 2019 05:14:27 -0400
Received: by mail-ed1-f65.google.com with SMTP id v38so5933719edm.7
        for <linux-usb@vger.kernel.org>; Wed, 18 Sep 2019 02:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4MqDpBby76wd3K4Ia7woU05CPBtEODFGfgBPlxY0o7k=;
        b=suiAozuQvphXFWxTpJSH2lqz8cNSSlgNSTU88xYHel8p7FcWaUPsPjn5A9maakY4Gu
         2elmT1Rx/3jrr0jQvLfJFONllgwtUs93me1GnEd0LRY8/qsacjLsoBViZO9RJ3rZDpmX
         KxHDMESuichNjGTpfFUPipxl2bl18+REAniwhk7Uy3NfwDDemO+gBRdi5OT/aIBU7aKn
         bUUAQVHF3tYRppDACCsqdiVODfjbyUyXxhb0SKWfZdTZjCQs8QIj5OWPYdJYdDP8F940
         VCbrvjuqaGIp9ZWOO8j/uT2P1KQtBNVZIuRAUf9s/JJbZQIqeNN7sUY0z4tGB2h48tP9
         cpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4MqDpBby76wd3K4Ia7woU05CPBtEODFGfgBPlxY0o7k=;
        b=mjFtloQRvcoafnaIR+/DtykThfAKace7X/CK4uqDlnkPjqMMij46S2JfWjeuhz0SKA
         6QKXNhQlGAm1rVpauex6DKl1Dn/XteDpHmCj1B0QvzxJr/E+OgBZXQTDeANd0rMEBaWW
         EBdR3HGor/QaeRXZ0c6QsLIdeEhQFXI3dDBrV7heyjm8OuYo3F8VxhJbIVObFoGbWyd1
         spsgSKn5a6MS6EpoVyLYjoZvBLAtBmrjxpbXLJwUXy0A0BAeTT6AX2MHWf/JMgyV/ZK2
         KQqIh8COnYXyH6+KNIh97rIjFfqXWqMJvehCIV1y3cbWr96zcoE80d4Fm0OyktLlojIF
         8JpA==
X-Gm-Message-State: APjAAAXaQjIVchkGAtyuuT3k+FqA1BRE2pxNXua1xdm9K2Y3CIwtYm07
        mPFXpIgBRwF3SEkArVR0edlpwmunjeI=
X-Google-Smtp-Source: APXvYqwo7tSg8fUhl0O2t1UsKTcdKMC3GaSCdQNkfoH5bMQOnMwkS9p5jRAgookbfkO0//gZKUwThg==
X-Received: by 2002:a17:906:f259:: with SMTP id gy25mr8760959ejb.2.1568798065083;
        Wed, 18 Sep 2019 02:14:25 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id j6sm588871ejv.36.2019.09.18.02.14.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 02:14:24 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-usb@vger.kernel.org
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] USB: serial: add port statistics
Date:   Wed, 18 Sep 2019 11:14:15 +0200
Message-Id: <20190918091415.23683-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

Add additional port statistics like received and transmitted bytes
the way /proc/tty/driver/serial does.

As usbserial driver already provides USB related information and
this line is longer than 100 characters, this patch adds an
additional line with the same port number:

0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...
0: tx:112 rx:0

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 drivers/usb/serial/usb-serial.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index a3179fea38c8..154e65b6895f 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -42,6 +42,9 @@
 #define USB_SERIAL_TTY_MAJOR	188
 #define USB_SERIAL_TTY_MINORS	512	/* should be enough for a while */
 
+static int serial_get_icount(struct tty_struct *tty,
+				struct serial_icounter_struct *icount);
+
 /* There is no MODULE_DEVICE_TABLE for usbserial.c.  Instead
    the MODULE_DEVICE_TABLE declarations in each serial driver
    cause the "hotplug" program to pull in whatever module is necessary
@@ -471,10 +474,13 @@ static int serial_proc_show(struct seq_file *m, void *v)
 
 	seq_puts(m, "usbserinfo:1.0 driver:2.0\n");
 	for (i = 0; i < USB_SERIAL_TTY_MINORS; ++i) {
+		struct tty_struct *tty;
+		struct serial_icounter_struct icount;
 		port = usb_serial_port_get_by_minor(i);
 		if (port == NULL)
 			continue;
 		serial = port->serial;
+		tty = port->port.tty;
 
 		seq_printf(m, "%d:", i);
 		if (serial->type->driver.owner)
@@ -491,6 +497,22 @@ static int serial_proc_show(struct seq_file *m, void *v)
 		seq_printf(m, " path:%s", tmp);
 
 		seq_putc(m, '\n');
+		if (!serial_get_icount(tty, &icount)) {
+			seq_printf(m, "%d:", i);
+			seq_printf(m, " tx:%d rx:%d",
+					icount.tx, icount.rx);
+			if (icount.frame)
+				seq_printf(m, " fe:%d",	icount.frame);
+			if (icount.parity)
+				seq_printf(m, " pe:%d",	icount.parity);
+			if (icount.brk)
+				seq_printf(m, " brk:%d", icount.brk);
+			if (icount.overrun)
+				seq_printf(m, " oe:%d", icount.overrun);
+			if (icount.buf_overrun)
+				seq_printf(m, " bo:%d", icount.buf_overrun);
+			seq_putc(m, '\n');
+		}
 		usb_serial_put(serial);
 		mutex_unlock(&serial->disc_mutex);
 	}
-- 
2.17.0

