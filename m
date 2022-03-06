Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 593FA4CE9F3
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 08:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbiCFH6Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 02:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbiCFH6Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 02:58:24 -0500
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8283DCD5
        for <linux-usb@vger.kernel.org>; Sat,  5 Mar 2022 23:57:27 -0800 (PST)
Received: from localhost.localdomain ([106.133.32.90])
        by smtp.orange.fr with ESMTPA
        id Qljkni9jQu3WEQllanB7wq; Sun, 06 Mar 2022 08:57:26 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: MDU0YmViZGZmMDIzYiBlMiM2NTczNTRjNWZkZTMwOGRiOGQ4ODf3NWI1ZTMyMzdiODlhOQ==
X-ME-Date: Sun, 06 Mar 2022 08:57:26 +0100
X-ME-IP: 106.133.32.90
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Ville Syrjala <syrjala@sci.fi>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henk Vergonet <Henk.Vergonet@gmail.com>
Subject: [PATCH v2 05/10] Input: remove third argument of usb_maxpacket()
Date:   Sun,  6 Mar 2022 16:55:19 +0900
Message-Id: <20220306075524.706660-6-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

