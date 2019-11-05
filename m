Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB034EF774
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730603AbfKEImX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:23 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38773 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEImW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:22 -0500
Received: by mail-lj1-f196.google.com with SMTP id v8so5148690ljh.5
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nHDduFicuwITdkRhyKQcLW+FICHjtimOFQjrgu0AoZ0=;
        b=XFgcATtVHvlebmYdJRblBNwLzP1il4JPSCalr/VoH5ALscxVelToDmg1wttCYkmRVB
         YPQ4gNEZ76kxyKB/L7Kbype8O2Sm6SUNLr7HzwQWQlGpJkcJrIHCWlCxDjbIjM2+yXFm
         3tqCvEvKvxYXwJM3yGqziTbZL362sHTSIW7HLcgyYEnQISv+AMAWIgjBsyp4n0leq1R+
         uV8Kt2gAyOBRcKOGIfBuuRYGqWjTVWn6qBmAm0dgUFnXan4lprHZJn5MfsddPaOGrC6Z
         U5WzLKsCrbsDXZIa4rBq53G+TlEnuTgG3Dh6TBo5fxj3BmqTNHjg7P9uAOvLfjGIwe8x
         FZ+g==
X-Gm-Message-State: APjAAAX4eiiDvALDedD5MOPJWOAR+/1hb2PPE4wdOFU5PpFT/sCrbkJO
        91Qc7BKOMeCvgVxcRwZA2ho=
X-Google-Smtp-Source: APXvYqyFv6t7qRnt3va/sH9X3CisMyp6F4FS9Up1CvI00Sm8nEmKybgptCUYBOPrXJq6yTlQ6Df/+A==
X-Received: by 2002:a2e:2e10:: with SMTP id u16mr18614154lju.51.1572943340390;
        Tue, 05 Nov 2019 00:42:20 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id g2sm7648633lfc.37.2019.11.05.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPl-0004Gz-Nq; Tue, 05 Nov 2019 09:42:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 06/14] USB: legousbtower: drop redundant interrupt-in running flag
Date:   Tue,  5 Nov 2019 09:41:44 +0100
Message-Id: <20191105084152.16322-7-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the redundant interrupt-in-running flag, which tried to keep track
of when the interrupt-in URB was in flight. This isn't needed since we
can stop the URB unconditionally in tower_abort_transfers() and the URB
can not be submitted while usb_kill_urb() is running anyway.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 937bce23adf0..33533faa019e 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -206,7 +206,6 @@ struct lego_usb_tower {
 	struct usb_endpoint_descriptor* interrupt_in_endpoint;
 	struct urb*		interrupt_in_urb;
 	int			interrupt_in_interval;
-	int			interrupt_in_running;
 	int			interrupt_in_done;
 
 	char*			interrupt_out_buffer;
@@ -379,7 +378,6 @@ static int tower_open (struct inode *inode, struct file *file)
 			  dev,
 			  dev->interrupt_in_interval);
 
-	dev->interrupt_in_running = 1;
 	dev->interrupt_in_done = 0;
 	mb();
 
@@ -387,7 +385,6 @@ static int tower_open (struct inode *inode, struct file *file)
 	if (retval) {
 		dev_err(&dev->udev->dev,
 			"Couldn't submit interrupt_in_urb %d\n", retval);
-		dev->interrupt_in_running = 0;
 		goto unlock_exit;
 	}
 
@@ -450,11 +447,7 @@ static int tower_release (struct inode *inode, struct file *file)
 static void tower_abort_transfers (struct lego_usb_tower *dev)
 {
 	/* shutdown transfer */
-	if (dev->interrupt_in_running) {
-		dev->interrupt_in_running = 0;
-		mb();
-		usb_kill_urb(dev->interrupt_in_urb);
-	}
+	usb_kill_urb(dev->interrupt_in_urb);
 	if (dev->interrupt_out_busy)
 		usb_kill_urb(dev->interrupt_out_urb);
 }
@@ -731,15 +724,11 @@ static void tower_interrupt_in_callback (struct urb *urb)
 	}
 
 resubmit:
-	/* resubmit if we're still running */
-	if (dev->interrupt_in_running) {
-		retval = usb_submit_urb (dev->interrupt_in_urb, GFP_ATOMIC);
-		if (retval)
-			dev_err(&dev->udev->dev,
-				"%s: usb_submit_urb failed (%d)\n",
-				__func__, retval);
+	retval = usb_submit_urb(dev->interrupt_in_urb, GFP_ATOMIC);
+	if (retval) {
+		dev_err(&dev->udev->dev, "%s: usb_submit_urb failed (%d)\n",
+			__func__, retval);
 	}
-
 exit:
 	dev->interrupt_in_done = 1;
 	wake_up_interruptible (&dev->read_wait);
-- 
2.23.0

