Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CD04DBE7B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 06:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiCQFgY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 01:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiCQFgR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 01:36:17 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38C625514F
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:05:11 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id kd12so3498152qvb.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0m2uZXk20PdTOX8X4iHJpxmoZkDdwnaHqyVWbQ8Vag=;
        b=XaZZWMyFr4uVkDPH/w9n+ZZADx4KcRFl9mxserld2Viy3glIMITLbeh1znXs+Q5wW2
         RCg8P7tjTnrxLdf6yTSi2sjid4bV5ZPCzFXin3HZ4KTWiXr1DQXHSpdb0KpZR6ClLHN+
         vNnwkqQ8QwRBV9kZjHSfdGN6lkGrYJ0H2HFtKM7EbNut6afdcw20lAXTAJOmjT0bBz6h
         jDtJz3p1B/JHv22GkZqN1y7D66tkDzQlbccUpRinvpdPG0S8gW2ZZzYziSuD9DjI5XyQ
         pNpksmFQgq2TsDPSxwm7Ypt1GE9TTUDdNExBXmnQTaumajq8wOJUh8PISNmtCxgfB1sc
         6ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=f0m2uZXk20PdTOX8X4iHJpxmoZkDdwnaHqyVWbQ8Vag=;
        b=kgNUYXblZfXbE6M7xWvth4vUACejqH0xbicYTqFle/r3Xiq0fo89WAgFEWuM8whCeR
         t1NrQpgLfyX3ELDgfwneeDVMENIerVuGYEc5CCDARlpTQZcznporM9/yNt7mkjntneKI
         GFOII4cr9yDjbjIZoHUmoy/1OoT/BjL2fRfK7TOG7gbjNxYB//4l8hvOGaeXWzTEuax5
         Z5poY3z5yTxZb2/+YjEeN1xX831uqa1Mhh8kRcXEd4nYRoTma0seEViD6S6g7uy8pI3r
         08BvTnSXoeJzqhN3gdEw5XmmuA8dIpsqiWNaWWgURi7NvD91Yn2UY7qw1sRqZUJQeU/N
         xpdQ==
X-Gm-Message-State: AOAM5312ZYUidDnmjpBztD0AnmMx9trCDN8j1t5Wq0NGfMgCYHWMEqAN
        RPVtlKHMzhKjVBfPUoFFzfMBYqsZQNcyPg==
X-Google-Smtp-Source: ABdhPJxqfk77R42LMVMKcN2JUjsEY++xS3EfPZSx5b+Oo8O/jR6XhUG5Pgf4ZPeD0hXgwExWCZzcKg==
X-Received: by 2002:a17:903:11cc:b0:151:71e4:dadc with SMTP id q12-20020a17090311cc00b0015171e4dadcmr3046602plh.78.1647489338157;
        Wed, 16 Mar 2022 20:55:38 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b004f78e446ff5sm5096734pfv.15.2022.03.16.20.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:55:37 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Ville Syrjala <syrjala@sci.fi>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henk Vergonet <Henk.Vergonet@gmail.com>
Subject: [PATCH v4 3/9] Input: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 12:55:08 +0900
Message-Id: <20220317035514.6378-4-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The third argument of usb_maxpacket(): in_out has been deprecated
because it could be derived from the second argument (e.g. using
usb_pipeout(pipe)).

N.B. function usb_maxpacket() was made variadic to accommodate the
transition from the old prototype with three arguments to the new one
with only two arguments (so that no renaming is needed). The variadic
argument is to be removed once all users of usb_maxpacket() get
migrated.

CC: Ville Syrjala <syrjala@sci.fi>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Henk Vergonet <Henk.Vergonet@gmail.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/input/misc/ati_remote2.c         | 2 +-
 drivers/input/misc/cm109.c               | 2 +-
 drivers/input/misc/powermate.c           | 2 +-
 drivers/input/misc/yealink.c             | 2 +-
 drivers/input/tablet/acecad.c            | 2 +-
 drivers/input/tablet/pegasus_notetaker.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/ati_remote2.c b/drivers/input/misc/ati_remote2.c
index 8a36d78fed63..946bf75aa106 100644
--- a/drivers/input/misc/ati_remote2.c
+++ b/drivers/input/misc/ati_remote2.c
@@ -639,7 +639,7 @@ static int ati_remote2_urb_init(struct ati_remote2 *ar2)
 			return -ENOMEM;
 
 		pipe = usb_rcvintpipe(udev, ar2->ep[i]->bEndpointAddress);
-		maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+		maxp = usb_maxpacket(udev, pipe);
 		maxp = maxp > 4 ? 4 : maxp;
 
 		usb_fill_int_urb(ar2->urb[i], udev, pipe, ar2->buf[i], maxp,
diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index f515fae465c3..728325a2d574 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -745,7 +745,7 @@ static int cm109_usb_probe(struct usb_interface *intf,
 
 	/* get a handle to the interrupt data pipe */
 	pipe = usb_rcvintpipe(udev, endpoint->bEndpointAddress);
-	ret = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	ret = usb_maxpacket(udev, pipe);
 	if (ret != USB_PKT_LEN)
 		dev_err(&intf->dev, "invalid payload size %d, expected %d\n",
 			ret, USB_PKT_LEN);
diff --git a/drivers/input/misc/powermate.c b/drivers/input/misc/powermate.c
index c4e0e1886061..c1c733a9cb89 100644
--- a/drivers/input/misc/powermate.c
+++ b/drivers/input/misc/powermate.c
@@ -374,7 +374,7 @@ static int powermate_probe(struct usb_interface *intf, const struct usb_device_i
 
 	/* get a handle to the interrupt data pipe */
 	pipe = usb_rcvintpipe(udev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 
 	if (maxp < POWERMATE_PAYLOAD_SIZE_MIN || maxp > POWERMATE_PAYLOAD_SIZE_MAX) {
 		printk(KERN_WARNING "powermate: Expected payload of %d--%d bytes, found %d bytes!\n",
diff --git a/drivers/input/misc/yealink.c b/drivers/input/misc/yealink.c
index 8ab01c7601b1..69420781db30 100644
--- a/drivers/input/misc/yealink.c
+++ b/drivers/input/misc/yealink.c
@@ -905,7 +905,7 @@ static int usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	/* get a handle to the interrupt data pipe */
 	pipe = usb_rcvintpipe(udev, endpoint->bEndpointAddress);
-	ret = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	ret = usb_maxpacket(udev, pipe);
 	if (ret != USB_PKT_LEN)
 		dev_err(&intf->dev, "invalid payload size %d, expected %zd\n",
 			ret, USB_PKT_LEN);
diff --git a/drivers/input/tablet/acecad.c b/drivers/input/tablet/acecad.c
index a38d1fe97334..56c7e471ac32 100644
--- a/drivers/input/tablet/acecad.c
+++ b/drivers/input/tablet/acecad.c
@@ -130,7 +130,7 @@ static int usb_acecad_probe(struct usb_interface *intf, const struct usb_device_
 		return -ENODEV;
 
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(dev, pipe);
 
 	acecad = kzalloc(sizeof(struct usb_acecad), GFP_KERNEL);
 	input_dev = input_allocate_device();
diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index 749edbdb7ffa..c608ac505d1b 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -296,7 +296,7 @@ static int pegasus_probe(struct usb_interface *intf,
 	pegasus->intf = intf;
 
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
-	pegasus->data_len = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	pegasus->data_len = usb_maxpacket(dev, pipe);
 
 	pegasus->data = usb_alloc_coherent(dev, pegasus->data_len, GFP_KERNEL,
 					   &pegasus->data_dma);
-- 
2.34.1

