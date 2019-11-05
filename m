Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51475EF76F
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730591AbfKEImT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:19 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33603 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbfKEImT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:19 -0500
Received: by mail-lf1-f68.google.com with SMTP id y127so14440042lfc.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Bog8rvlkwSMxmIHFiC0pn9jqybkql/feL3YCFo2leg=;
        b=kpiKyIZ/EwA9nIO/4Px5XQ+VymQpWm+Jvl+ID/xUA+c2hEkNG0rJ6w+iNCHlVhDaYP
         NEKJxQBru5sKj5VC7cyQcyDwZbVc0+Og4EScBB+1ddE3E2xhv+L3vhmVP7SEB08ICTAA
         1u1Xpe2Po8k7PlsllsuY4MdzLF7FsM6CbwfXztNpNd0f4+bIE7ACVQhTiwFtMKFaSs+F
         zlhDS+OUoMyNh0ni1kxZh+wDJFKZp6d3vjMTa/iSwdXtRdjYwT10Lhq/Hn7La2RrLOqk
         MZAfoXSwDW0qdDc/qNEyRKflYM7I6zOY6EYK/Grf3SjzIdx2OmNFobUTUo0/snw3j3De
         i6nQ==
X-Gm-Message-State: APjAAAW9SsrBCH/m1eEa58bKCxShHnqZxXXAZegD5TXhqF7ps1KKZ0gG
        9n3KObYuxxJtKRCvEhemE2YIuKcw
X-Google-Smtp-Source: APXvYqwI95lW70LQuZ75a8lOv4FAoISt7q+C0cNE78q1xt1MJQZv/cvFEpgbRy/y1tFBg6jrEF8E4w==
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr3209854lfi.24.1572943336133;
        Tue, 05 Nov 2019 00:42:16 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id 77sm12083227lfj.41.2019.11.05.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:13 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPl-0004Gj-FM; Tue, 05 Nov 2019 09:42:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 03/14] USB: legousbtower: zero driver data at allocation
Date:   Tue,  5 Nov 2019 09:41:41 +0100
Message-Id: <20191105084152.16322-4-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Zero the driver data at allocation rather than depend on explicit
zeroing, which easy to miss.

Also drop an unnecessary driver-data pointer initialisation.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index a3ae843e0a3a..c880d58e8683 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -791,45 +791,24 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
 {
 	struct device *idev = &interface->dev;
 	struct usb_device *udev = interface_to_usbdev(interface);
-	struct lego_usb_tower *dev = NULL;
+	struct lego_usb_tower *dev;
 	struct tower_get_version_reply *get_version_reply = NULL;
 	int retval = -ENOMEM;
 	int result;
 
 	/* allocate memory for our device state and initialize it */
-
-	dev = kmalloc (sizeof(struct lego_usb_tower), GFP_KERNEL);
-
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		goto exit;
 
 	mutex_init(&dev->lock);
-
 	dev->udev = usb_get_dev(udev);
-	dev->open_count = 0;
-	dev->disconnected = 0;
-
-	dev->read_buffer = NULL;
-	dev->read_buffer_length = 0;
-	dev->read_packet_length = 0;
 	spin_lock_init (&dev->read_buffer_lock);
 	dev->packet_timeout_jiffies = msecs_to_jiffies(packet_timeout);
 	dev->read_last_arrival = jiffies;
-
 	init_waitqueue_head (&dev->read_wait);
 	init_waitqueue_head (&dev->write_wait);
 
-	dev->interrupt_in_buffer = NULL;
-	dev->interrupt_in_endpoint = NULL;
-	dev->interrupt_in_urb = NULL;
-	dev->interrupt_in_running = 0;
-	dev->interrupt_in_done = 0;
-
-	dev->interrupt_out_buffer = NULL;
-	dev->interrupt_out_endpoint = NULL;
-	dev->interrupt_out_urb = NULL;
-	dev->interrupt_out_busy = 0;
-
 	result = usb_find_common_endpoints_reverse(interface->cur_altsetting,
 			NULL, NULL,
 			&dev->interrupt_in_endpoint,
-- 
2.23.0

