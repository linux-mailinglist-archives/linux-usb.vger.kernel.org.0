Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C964DB609
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 17:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354704AbiCPQVL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 12:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245536AbiCPQVJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 12:21:09 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48BB6D4C6
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:54 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id o26so584276pgb.8
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0UobVydT6v+Is9Yv7AR/ZZyJ5Kvok9L9Dkq1B3Bfxw=;
        b=S4iF1OyiIvmQYnrHFWqvqFneKDf/NYedpBDBD90j/7Fqdzwkl4FNVdmbecn0jcZPFh
         VM8wgoZnuKdAClKb+1s7nQMvGaPn3ziY3hz2g9dAsmLhbUIcCzdFLQUSE+WYuWv05+7o
         CQCP3HnUrq3ALa84Uv1G4+Q0Moyy/zwutv9kuK3k4SepGMPaZy55wJjKhfIiVSimuMBb
         UBUzMhRQfs9XhJafvzSvhU8eoDN2zWFLhshE2sS9ctageaOCIvb8KT7AhgaHK2yg42RJ
         lfjER01xg12vugwRla/GmlVE6OH/YeQ9XisSWU636ykrFfBjeiXLAnYKe4L9x9CRu5qx
         qFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=C0UobVydT6v+Is9Yv7AR/ZZyJ5Kvok9L9Dkq1B3Bfxw=;
        b=fp2iPCWfmEh26skEt8u8L52GaETQTfzbfI08fdv24YOeKUimgsAM+pzProNAknaYjO
         yDnE2Y5/fXORlVaAADECGpLiCRP8/jjORz6+/GH81Job+nrw0y+P0KvSimJB/0i1XipG
         AZrApZ3cgYF7+BwlV5zhMDn2ozB9XCwKs/ya8ZKeN2OuZAIg2yphhxm48D03XAEP+VTa
         irIWr1/gnrXTkwxhy/+r+eo/2keCQQFHfxugscXd5kTiQ0nBqm/GFZ/kBoqXeaGm7Tdu
         CZ9ELLxEPFcmxnuzQskcjDLD8LD3B5v+eKrt7JSTCgBhHud27WH625pLkFqTcD8w0aGD
         B64w==
X-Gm-Message-State: AOAM532H9NfUjhOgtg2zaCrqQ6w53HsqLX+vaDL3uM8CSbGiaCGsT3lt
        NauUAqAj/JUAfOzghFOM/Ezjhf2yMUw=
X-Google-Smtp-Source: ABdhPJzn2sGzwiWDiKaczGXT8LdHQCRUzbJFwh8snwel181dG2zaGcznz/SQPyt8m9QiriUU4I78EQ==
X-Received: by 2002:a65:5a06:0:b0:375:81c9:74b1 with SMTP id y6-20020a655a06000000b0037581c974b1mr343999pgs.122.1647447594078;
        Wed, 16 Mar 2022 09:19:54 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id mt15-20020a17090b230f00b001bf191e6f08sm2988374pjb.9.2022.03.16.09.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 09:19:53 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>
Subject: [PATCH v3 4/9] media: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 01:19:30 +0900
Message-Id: <20220316161935.2049-5-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
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

