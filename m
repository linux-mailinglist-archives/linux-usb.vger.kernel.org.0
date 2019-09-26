Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48C20BEE2B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 11:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730206AbfIZJM5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 05:12:57 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39630 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfIZJM4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 05:12:56 -0400
Received: by mail-lf1-f66.google.com with SMTP id 72so1122501lfh.6
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 02:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nSE68eO8cJa8cg6l73GI+YOtkPnzSUMRPGBx5GZoj60=;
        b=p7HF6LJW5vg+Ysf+/RdzN8bX7F42qNSCKYzS/82k5ALK2Ir+1wl/DsCVef/Sm5DHnn
         JqqKv4Tqo/ICxdmhYcy3ODs7TMzKNn240swIQ1N/mtQ41hZn9ar1xgahTFeGdzFxPvB2
         YDDEpXh+MqCX7cf7ZNT/O/SPQt5l9sEK55YiCUOU3OqfVYqL3Tq+vIF9rTDSJ8yjSTKT
         i2nlDIIZXmx9PYsyDxL9kljhFvcuxeB9NC93k9U1O2LQ36YNfjJWPWVif9LXzQiBR+Cx
         ooUMbL9UEfY4Q9tUDFzncU+LveYdbX9b8nBQ/WLBao+/TgvLraBgmyjxr46HLaqCBXml
         pjGQ==
X-Gm-Message-State: APjAAAXHQhTKto5uS0rkiqnzV+XrPZ+LYbvAtUEjvU4wlW1KKw2hDSg3
        oErw80temaARF2acIxOloyQ=
X-Google-Smtp-Source: APXvYqxEjsmdA2zxDZyYIBrrPaQxeYTA1ERQYGR2Zv29SlxxWDi6kyEsT9NXW4IRGI4t7L3Mb/Tsng==
X-Received: by 2002:ac2:4424:: with SMTP id w4mr1474829lfl.65.1569489167423;
        Thu, 26 Sep 2019 02:12:47 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id z8sm451426lfg.18.2019.09.26.02.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:12:45 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iDPpS-0006Qx-AR; Thu, 26 Sep 2019 11:12:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/4] USB: usblcd: drop redundant disconnect mutex
Date:   Thu, 26 Sep 2019 11:12:26 +0200
Message-Id: <20190926091228.24634-8-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926091228.24634-1-johan@kernel.org>
References: <20190926091228.24634-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the redundant disconnect mutex which was introduced after the
open-disconnect race had been addressed generally in USB core by commit
d4ead16f50f9 ("USB: prevent char device open/deregister race").

Specifically, the rw-semaphore in core guarantees that all calls to
open() will have completed and that no new calls to open() will occur
after usb_deregister_dev() returns. Hence there is no need use the
driver data as an inverted disconnected flag.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/usblcd.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/usb/misc/usblcd.c b/drivers/usb/misc/usblcd.c
index aa982d3ca36b..b898650a5570 100644
--- a/drivers/usb/misc/usblcd.c
+++ b/drivers/usb/misc/usblcd.c
@@ -37,9 +37,6 @@ static const struct usb_device_id id_table[] = {
 };
 MODULE_DEVICE_TABLE(usb, id_table);
 
-static DEFINE_MUTEX(open_disc_mutex);
-
-
 struct usb_lcd {
 	struct usb_device	*udev;			/* init: probe_lcd */
 	struct usb_interface	*interface;		/* the interface for
@@ -95,17 +92,10 @@ static int lcd_open(struct inode *inode, struct file *file)
 		return -ENODEV;
 	}
 
-	mutex_lock(&open_disc_mutex);
 	dev = usb_get_intfdata(interface);
-	if (!dev) {
-		mutex_unlock(&open_disc_mutex);
-		mutex_unlock(&lcd_mutex);
-		return -ENODEV;
-	}
 
 	/* increment our usage count for the device */
 	kref_get(&dev->kref);
-	mutex_unlock(&open_disc_mutex);
 
 	/* grab a power reference */
 	r = usb_autopm_get_interface(interface);
@@ -388,7 +378,6 @@ static int lcd_probe(struct usb_interface *interface,
 		/* something prevented us from registering this driver */
 		dev_err(&interface->dev,
 			"Not able to get a minor for this device.\n");
-		usb_set_intfdata(interface, NULL);
 		goto error;
 	}
 
@@ -434,14 +423,9 @@ static int lcd_resume(struct usb_interface *intf)
 
 static void lcd_disconnect(struct usb_interface *interface)
 {
-	struct usb_lcd *dev;
+	struct usb_lcd *dev = usb_get_intfdata(interface);
 	int minor = interface->minor;
 
-	mutex_lock(&open_disc_mutex);
-	dev = usb_get_intfdata(interface);
-	usb_set_intfdata(interface, NULL);
-	mutex_unlock(&open_disc_mutex);
-
 	/* give back our minor */
 	usb_deregister_dev(interface, &lcd_class);
 
-- 
2.23.0

