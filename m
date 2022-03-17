Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2934DBE10
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 06:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiCQFSO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 01:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiCQFSM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 01:18:12 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA6624B0B3
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:04:14 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id u124so4362270vsb.10
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0UobVydT6v+Is9Yv7AR/ZZyJ5Kvok9L9Dkq1B3Bfxw=;
        b=NwFq3WRQgaPOSTO7NDag6/iDsC1L55EztiJodmO7Ftgc1CusDtCAdACw6jN0NYuQfU
         aDPCI6eSdAl/y2IIlpMzc9pgiYhjMSux8V5/FumjQCva+0fab4IFufRvQ/U4kE4tTCjF
         nx9RIvM71XzVFu4+1zEzIBS4ej7TRRouwQPJzEdn/wXIGzZo/i3WzRyWwiqeaxf4jUO9
         /LT6nlOJBZH/XD8h7MWExnYLYe6fTOqTLdzmIq65kXIjhRteKpydRll4TZfJzwfFyvY0
         CJ8BT39Q1QJkRhnfsWfbVTqvETcGciIv2ZYDfNoHkcRSDXOLplvBNEmnuwewMnVdXutb
         DIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=C0UobVydT6v+Is9Yv7AR/ZZyJ5Kvok9L9Dkq1B3Bfxw=;
        b=8LjPOGxWGMaLDlaNx77rWhnvG7LobddPyENgqPmqDT4WjOEHOQIb5UexpN4plehwnN
         p7OOs4qpyuo6/h8to/DCQt724p3HuvXhXsw2XP8pKIlGRJm9wRoylWI0wUJxBka7k9ib
         aDeBHy1BR5qSkuWLVP5RLBH+vrmbg7rhzo4lH7+CjMLj4oErygSGafFrVRzsPxlIkNQw
         tMaaEG+WhYqY38h9vwH2c3BLhSGtfOtgeMEaTqG7rlGCv6pQR+3M1KQDAjFQrT1tVKQD
         Veg7Z1yawld6bVgbEfgvFYOdy7AJFP0LOi7yAj16VR7qhdy8srzKWNQL1ISgA53MeDKz
         BZNw==
X-Gm-Message-State: AOAM532wNonVZTBQjrEmsfYPzyn59x8L7NxBX8X1kPSsSU8HZUkZ5m4p
        ZIu61sIo+eMRbhe18SFHsjk3Qk6caKs/rQ==
X-Google-Smtp-Source: ABdhPJxy8sQml40L5v4wp3bSLjjT4sfp6qBY2oiHT0Ed3ZqZsp+zt+AXTlt+iSejbAZQMte0pB1xDw==
X-Received: by 2002:a17:902:ec89:b0:153:f480:5089 with SMTP id x9-20020a170902ec8900b00153f4805089mr288580plg.166.1647489340043;
        Wed, 16 Mar 2022 20:55:40 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b004f78e446ff5sm5096734pfv.15.2022.03.16.20.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:55:39 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>
Subject: [PATCH v4 4/9] media: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 12:55:09 +0900
Message-Id: <20220317035514.6378-5-mailhol.vincent@wanadoo.fr>
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

CC: Sean Young <sean@mess.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Benjamin Valentin <benpicco@googlemail.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/media/rc/ati_remote.c           | 4 ++--
 drivers/media/rc/mceusb.c               | 2 +-
 drivers/media/rc/streamzap.c            | 2 +-
 drivers/media/rc/xbox_remote.c          | 2 +-
 drivers/media/usb/tm6000/tm6000-dvb.c   | 2 +-
 drivers/media/usb/tm6000/tm6000-input.c | 2 +-
 drivers/media/usb/tm6000/tm6000-video.c | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
index c12dda73cdd5..3155e876616d 100644
--- a/drivers/media/rc/ati_remote.c
+++ b/drivers/media/rc/ati_remote.c
@@ -773,7 +773,7 @@ static int ati_remote_initialize(struct ati_remote *ati_remote)
 
 	/* Set up irq_urb */
 	pipe = usb_rcvintpipe(udev, ati_remote->endpoint_in->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 	maxp = (maxp > DATA_BUFSIZE) ? DATA_BUFSIZE : maxp;
 
 	usb_fill_int_urb(ati_remote->irq_urb, udev, pipe, ati_remote->inbuf,
@@ -784,7 +784,7 @@ static int ati_remote_initialize(struct ati_remote *ati_remote)
 
 	/* Set up out_urb */
 	pipe = usb_sndintpipe(udev, ati_remote->endpoint_out->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 	maxp = (maxp > DATA_BUFSIZE) ? DATA_BUFSIZE : maxp;
 
 	usb_fill_int_urb(ati_remote->out_urb, udev, pipe, ati_remote->outbuf,
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 2dc810f5a73f..0834d5f866fd 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1728,7 +1728,7 @@ static int mceusb_dev_probe(struct usb_interface *intf,
 		pipe = usb_rcvintpipe(dev, ep_in->bEndpointAddress);
 	else
 		pipe = usb_rcvbulkpipe(dev, ep_in->bEndpointAddress);
-	maxp = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(dev, pipe);
 
 	ir = kzalloc(sizeof(struct mceusb_dev), GFP_KERNEL);
 	if (!ir)
diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 16ba85d7c090..deb85330c940 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -307,7 +307,7 @@ static int streamzap_probe(struct usb_interface *intf,
 	}
 
 	pipe = usb_rcvintpipe(usbdev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(usbdev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(usbdev, pipe);
 
 	if (maxp == 0) {
 		dev_err(&intf->dev, "%s: endpoint Max Packet Size is 0!?!\n",
diff --git a/drivers/media/rc/xbox_remote.c b/drivers/media/rc/xbox_remote.c
index 98d0b43608ad..7424b2031152 100644
--- a/drivers/media/rc/xbox_remote.c
+++ b/drivers/media/rc/xbox_remote.c
@@ -171,7 +171,7 @@ static int xbox_remote_initialize(struct xbox_remote *xbox_remote,
 
 	/* Set up irq_urb */
 	pipe = usb_rcvintpipe(udev, endpoint_in->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 	maxp = (maxp > DATA_BUFSIZE) ? DATA_BUFSIZE : maxp;
 
 	usb_fill_int_urb(xbox_remote->irq_urb, udev, pipe, xbox_remote->inbuf,
diff --git a/drivers/media/usb/tm6000/tm6000-dvb.c b/drivers/media/usb/tm6000/tm6000-dvb.c
index 4990fa886d7a..335f747b0375 100644
--- a/drivers/media/usb/tm6000/tm6000-dvb.c
+++ b/drivers/media/usb/tm6000/tm6000-dvb.c
@@ -120,7 +120,7 @@ static int tm6000_start_stream(struct tm6000_core *dev)
 	pipe = usb_rcvbulkpipe(dev->udev, dev->bulk_in.endp->desc.bEndpointAddress
 							  & USB_ENDPOINT_NUMBER_MASK);
 
-	size = usb_maxpacket(dev->udev, pipe, usb_pipeout(pipe));
+	size = usb_maxpacket(dev->udev, pipe);
 	size = size * 15; /* 512 x 8 or 12 or 15 */
 
 	dvb->bulk_urb->transfer_buffer = kzalloc(size, GFP_KERNEL);
diff --git a/drivers/media/usb/tm6000/tm6000-input.c b/drivers/media/usb/tm6000/tm6000-input.c
index 84602edf3fe8..5136e9e202f1 100644
--- a/drivers/media/usb/tm6000/tm6000-input.c
+++ b/drivers/media/usb/tm6000/tm6000-input.c
@@ -340,7 +340,7 @@ static int __tm6000_ir_int_start(struct rc_dev *rc)
 		dev->int_in.endp->desc.bEndpointAddress
 		& USB_ENDPOINT_NUMBER_MASK);
 
-	size = usb_maxpacket(dev->udev, pipe, usb_pipeout(pipe));
+	size = usb_maxpacket(dev->udev, pipe);
 	dprintk(1, "IR max size: %d\n", size);
 
 	ir->int_urb->transfer_buffer = kzalloc(size, GFP_ATOMIC);
diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm6000/tm6000-video.c
index e293f6f3d1bc..d855a19551f3 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -570,7 +570,7 @@ static int tm6000_prepare_isoc(struct tm6000_core *dev)
 			       dev->isoc_in.endp->desc.bEndpointAddress &
 			       USB_ENDPOINT_NUMBER_MASK);
 
-	size = usb_maxpacket(dev->udev, pipe, usb_pipeout(pipe));
+	size = usb_maxpacket(dev->udev, pipe);
 
 	if (size > dev->isoc_in.maxsize)
 		size = dev->isoc_in.maxsize;
-- 
2.34.1

