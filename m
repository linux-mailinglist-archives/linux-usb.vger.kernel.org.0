Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C368361384
	for <lists+linux-usb@lfdr.de>; Thu, 15 Apr 2021 22:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235035AbhDOUbh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Apr 2021 16:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbhDOUbe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Apr 2021 16:31:34 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2872C061756
        for <linux-usb@vger.kernel.org>; Thu, 15 Apr 2021 13:31:10 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id e7so29579208edu.10
        for <linux-usb@vger.kernel.org>; Thu, 15 Apr 2021 13:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=U8BBknPXjKv3gugOB25hQ9rGiFRBCAFHAlyjpDneQsc=;
        b=OHg8ezY/2/T57sWPDeuOCnWUXYKGFKmIze0MRdyBf5r/yAb2tSprsIgG4qwabmdM2G
         /auvO6Wd6GRuG9u39lTMlCMWMm3KSnFTFFzeH42VNI1W020+hwZjoooCKJDndycn9bcV
         mw2c7tLeoFAKrv2DwuzF6sneE2tIPJ70Lnj4HpTF6V5yiNzd2I2c+K/UubSPzSrDEkj3
         bC/RfS9FyXm1bR9WQ8NitIVVx/UrVoiS342tGcF2RJzM0L1X7ZiTFOv/sOnpfzfJh6hU
         8tj+Bm0ooMZzf6XL9lyy5lDww+fDbgzTO7jeuxNoOTyVwKVU9APnzsMb5vwLv1IY8274
         lslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=U8BBknPXjKv3gugOB25hQ9rGiFRBCAFHAlyjpDneQsc=;
        b=B8Owy15WBtlXqeZ1W2O6tWHtj1BL6estVBW7T/j73JdxH9PRxh7gBG/pXy3mgpt9w2
         FsANZhawqy42kRQI71/W7HyCe3Xn7CyccwTUHiliAVwY7XeytjdViKrh4Wkx5N6z5Ssq
         iq738kNPDWgEsU2AaNefhmaSSdn9WGSEoZfevYitMq0J8CK+PCUjUQlGuLI3FYpLnQ56
         WbFurEVCmrRSwUqvnnXSU6vnKYcoDZrkp7+NZwnhv/4OMaYU42zLjZ/ndj3j+BBFU9V1
         i3Fhge5gIN9XaHG7S1OtWjfcN38qGgRbzTWUXl5EKq7AdYLBGyponO443OLFoA99uRzS
         mQIg==
X-Gm-Message-State: AOAM531NY0NWWYAED434nQESNJz/E0p3Q1PVDs3oOG98u3FwYPJHUlNG
        BCKjleA8wvjm4cWM83lB2lzH2J/iBPI=
X-Google-Smtp-Source: ABdhPJzILtYCyHWUc505QP5Mr8JYb6hVBN+W6lidNx3RFHRPrZw0LyEcdx269F2GHYAI+0kFZwfrPA==
X-Received: by 2002:aa7:d397:: with SMTP id x23mr6554285edq.256.1618518669583;
        Thu, 15 Apr 2021 13:31:09 -0700 (PDT)
Received: from utop (200116b8004a9211f1acd1d963179bc9.dip.versatel-1u1.de. [2001:16b8:4a:9211:f1ac:d1d9:6317:9bc9])
        by smtp.gmail.com with ESMTPSA id lr27sm2678690ejb.8.2021.04.15.13.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 13:31:09 -0700 (PDT)
Sender: Malte Deiseroth <mdeiseroth88@googlemail.com>
From:   Malte Deiseroth <msdeiseroth@gmx.net>
X-Google-Original-From: Malte Deiseroth <mdeiseroth88@gmail.com>
Date:   Thu, 15 Apr 2021 22:31:06 +0200
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: Fix missing whitespace in function calls.
Message-ID: <20210415203106.GA122777@utop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Malte Deiseroth <mdeiseroth88@gmail.com>
---
 drivers/usb/misc/adutux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 45a387979935..6d15a097b007 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -183,10 +183,10 @@ static void adu_interrupt_in_callback(struct urb *urb)
 				dev->interrupt_in_buffer, urb->actual_length);
 
 			dev->read_buffer_length += urb->actual_length;
-			dev_dbg(&dev->udev->dev,"%s reading  %d\n", __func__,
+			dev_dbg(&dev->udev->dev, "%s reading  %d\n", __func__,
 				urb->actual_length);
 		} else {
-			dev_dbg(&dev->udev->dev,"%s : read_buffer overflow\n",
+			dev_dbg(&dev->udev->dev, "%s : read_buffer overflow\n",
 				__func__);
 		}
 	}
@@ -726,7 +726,7 @@ static int adu_probe(struct usb_interface *interface,
 		retval = -EIO;
 		goto error;
 	}
-	dev_dbg(&interface->dev,"serial_number=%s", dev->serial_number);
+	dev_dbg(&interface->dev, "serial_number=%s", dev->serial_number);
 
 	/* we can register the device now, as it is ready */
 	usb_set_intfdata(interface, dev);
-- 
2.27.0

