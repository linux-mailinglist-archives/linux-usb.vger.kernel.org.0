Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C49EAEFB80
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 11:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388759AbfKEKgs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 05:36:48 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41443 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388695AbfKEKgs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 05:36:48 -0500
Received: by mail-lf1-f65.google.com with SMTP id j14so14706109lfb.8
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 02:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IKV85RxvHyY4pFWFHgYAEhT0nXOYN14ot7DMiLlwbhY=;
        b=nfq8XfvjctiD/Q9985dQ0rbj1jXJMPuIdhtBmY7picB9yOvXW9f0E/wNi4MXFtX0lJ
         b5l46XO90Tqw621cu/tviKWjRBU051DzoFnGRKfknwg3/+LVeM99paIFomRmXndZDJA6
         gQB0QZL0Kgcn6Dj7sAWdLmjCdp6Omel4oeIRZN0K0EBicHZmJlnUpN3SQzxDlnN8CrIN
         Laa/SWMYgxwuwO/zk4i1bxjUtIUtksamec06CMmdX7tup89+T5vIW4TNJ43hMNDBYY5v
         eaMKNvoJAnPPGgl4u3jmbH0VHWmd9ePaEjWkNfWRAIyZ20BA/brGNi4eZr74br66XhNF
         /PxQ==
X-Gm-Message-State: APjAAAWWyjchDGW3TPZgwMCSSDoU/kYi46tm/45RXJhfC5Sh2juEsIzG
        gudGB89qwF650C/qDzdyzZs=
X-Google-Smtp-Source: APXvYqx7AHCv3/M2NZli90sLj0EJ6yPWAqHry3LPESPGyXWX22ex2K0Kdyl3McABJGEwMpvhGeBvLg==
X-Received: by 2002:a19:a40c:: with SMTP id q12mr7865413lfc.65.1572950205502;
        Tue, 05 Nov 2019 02:36:45 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id k19sm8809567ljg.18.2019.11.05.02.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:36:43 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRwCZ-0001IU-AA; Tue, 05 Nov 2019 11:36:43 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/3] USB: idmouse: clean up runaway white space
Date:   Tue,  5 Nov 2019 11:36:38 +0100
Message-Id: <20191105103638.4929-4-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105103638.4929-1-johan@kernel.org>
References: <20191105103638.4929-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop space between function identifiers and opening parenthesis, which
was no longer even used consistently within the driver.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/idmouse.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/idmouse.c b/drivers/usb/misc/idmouse.c
index 9b9d5df829d5..4afb5ddfd361 100644
--- a/drivers/usb/misc/idmouse.c
+++ b/drivers/usb/misc/idmouse.c
@@ -56,7 +56,7 @@ static const struct usb_device_id idmouse_table[] = {
 #define FTIP_SCROLL  0x24
 
 #define ftip_command(dev, command, value, index) \
-	usb_control_msg (dev->udev, usb_sndctrlpipe (dev->udev, 0), command, \
+	usb_control_msg(dev->udev, usb_sndctrlpipe(dev->udev, 0), command, \
 	USB_TYPE_VENDOR | USB_RECIP_ENDPOINT | USB_DIR_OUT, value, index, NULL, 0, 1000)
 
 MODULE_DEVICE_TABLE(usb, idmouse_table);
@@ -157,8 +157,8 @@ static int idmouse_create_image(struct usb_idmouse *dev)
 
 	/* loop over a blocking bulk read to get data from the device */
 	while (bytes_read < IMGSIZE) {
-		result = usb_bulk_msg (dev->udev,
-				usb_rcvbulkpipe (dev->udev, dev->bulk_in_endpointAddr),
+		result = usb_bulk_msg(dev->udev,
+				usb_rcvbulkpipe(dev->udev, dev->bulk_in_endpointAddr),
 				dev->bulk_in_buffer + bytes_read,
 				dev->bulk_in_size, &bulk_read, 5000);
 		if (result < 0) {
@@ -222,7 +222,7 @@ static int idmouse_open(struct inode *inode, struct file *file)
 	int result;
 
 	/* get the interface from minor number and driver information */
-	interface = usb_find_interface (&idmouse_driver, iminor (inode));
+	interface = usb_find_interface(&idmouse_driver, iminor(inode));
 	if (!interface)
 		return -ENODEV;
 
@@ -246,7 +246,7 @@ static int idmouse_open(struct inode *inode, struct file *file)
 		result = usb_autopm_get_interface(interface);
 		if (result)
 			goto error;
-		result = idmouse_create_image (dev);
+		result = idmouse_create_image(dev);
 		usb_autopm_put_interface(interface);
 		if (result)
 			goto error;
-- 
2.23.0

