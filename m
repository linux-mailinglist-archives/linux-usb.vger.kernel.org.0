Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72284DB606
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 17:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356452AbiCPQVP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 12:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245536AbiCPQVO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 12:21:14 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9B86D4DB
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:57 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 132so585600pga.5
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r+GUQbASJ031IRNOS38Vp2D7clnVc0CQYbgsYb/h5ZQ=;
        b=cO660xgETIHLUrpD6DIGmRRyo1ItK3NMqraGYTT/+qHr/R7U2mAzw/JhJbOylfMYEr
         8kadrXDVYUw9Ww0iDJO1Bn5lx6EvZ/fTlJ6wU/IuEY2q/VkQjvuZflcaLhfOb5idwi3N
         4TAJ5LR8YoTiKvycgK0RBDQyEzjcHmXcCdmswn5pp4SvUSqX+IecUAqhke7WfMD1jGQ+
         /cLxNOx3P93C8LjNboRe0gAk1D7WL6M1H8L1oXl4Z/M2JGZYmjGO9yOi0ZVmOO6Y58FG
         6iFV17simPy9RYqYW0cRKkAsLh/NysWISZfCgIX6QmgvAAcsTGJzWy0iZL40sFTynPwb
         Qucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=r+GUQbASJ031IRNOS38Vp2D7clnVc0CQYbgsYb/h5ZQ=;
        b=2djxC8YsMMqW7S0h1mxCKpZlZB9lYs90LojBBp/9E+Ne7zMQbOtX2OhoWQiVaxtAFe
         VmgLy5SGQAuk0iPzXcomOhQEvFeHpMzYuCpTQLHDvlVVNMYdR9J/nW8wecuMCMrqKGX0
         iQqCY7SVlwdl0D05d+QgWEujO3HDCut1hKmS54q/PX3SrkJOxnycSy/koF87smranJkn
         2pj4gUKwxsB4EOZXaURkMxB2gHHywUIxudBLLKUwMdVIM2uSve3o/+Tzot3itJZjcoHv
         zbZ9PioM4xjamnMxvO2FimVEEpwEEc8ltTSr4ietwokDK3SmLaq8DhQAywuzjS4+NLdj
         S2sw==
X-Gm-Message-State: AOAM5314lmkMNVx+QeMQHLLehEZn2hFsfHElaZzx4r7MGiiipTlbR/lH
        QplFdud3iHXXZ+n6ij32FoM=
X-Google-Smtp-Source: ABdhPJyk6fHVRIwBAeR+Eedy5Invvyp1M47P7O7x7I9+lLz2dSWQEbKcm89brnrfxen1ovIPZPULLg==
X-Received: by 2002:a63:d34c:0:b0:381:b709:4e21 with SMTP id u12-20020a63d34c000000b00381b7094e21mr274439pgi.267.1647447597306;
        Wed, 16 Mar 2022 09:19:57 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id mt15-20020a17090b230f00b001bf191e6f08sm2988374pjb.9.2022.03.16.09.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 09:19:56 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Oliver Neukum <oliver@neukum.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>,
        Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Kalle Valo <kvalo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Helmut Schaa <helmut.schaa@googlemail.com>
Subject: [PATCH v3 5/9] net: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 01:19:31 +0900
Message-Id: <20220316161935.2049-6-mailhol.vincent@wanadoo.fr>
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

CC: Oliver Neukum <oliver@neukum.org>
CC: David S. Miller <davem@davemloft.net>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Woojung Huh <woojung.huh@microchip.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
CC: Ryder Lee <ryder.lee@mediatek.com>
CC: Kalle Valo <kvalo@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Stanislaw Gruszka <stf_xl@wp.pl>
CC: Helmut Schaa <helmut.schaa@googlemail.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/net/usb/cdc_ncm.c                      | 4 ++--
 drivers/net/usb/lan78xx.c                      | 4 ++--
 drivers/net/usb/rndis_host.c                   | 2 +-
 drivers/net/usb/usbnet.c                       | 4 ++--
 drivers/net/wireless/mediatek/mt76/usb.c       | 2 +-
 drivers/net/wireless/ralink/rt2x00/rt2x00usb.c | 4 ++--
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 15f91d691bba..63ce9d81f61b 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -441,7 +441,7 @@ static void cdc_ncm_update_rxtx_max(struct usbnet *dev, u32 new_rx, u32 new_tx)
 	 * .bind which is called before usbnet sets up dev->maxpacket
 	 */
 	if (val != le32_to_cpu(ctx->ncm_parm.dwNtbOutMaxSize) &&
-	    val % usb_maxpacket(dev->udev, dev->out, 1) == 0)
+	    val % usb_maxpacket(dev->udev, dev->out) == 0)
 		val++;
 
 	/* we might need to flush any pending tx buffers if running */
@@ -465,7 +465,7 @@ static void cdc_ncm_update_rxtx_max(struct usbnet *dev, u32 new_rx, u32 new_tx)
 	usbnet_update_max_qlen(dev);
 
 	/* never pad more than 3 full USB packets per transfer */
-	ctx->min_tx_pkt = clamp_t(u16, ctx->tx_max - 3 * usb_maxpacket(dev->udev, dev->out, 1),
+	ctx->min_tx_pkt = clamp_t(u16, ctx->tx_max - 3 * usb_maxpacket(dev->udev, dev->out),
 				  CDC_NCM_MIN_TX_PKT, ctx->tx_max);
 }
 
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index b8e20a3f2b84..7d35b683e005 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -4426,7 +4426,7 @@ static int lan78xx_probe(struct usb_interface *intf,
 		goto out4;
 
 	period = ep_intr->desc.bInterval;
-	maxp = usb_maxpacket(dev->udev, dev->pipe_intr, 0);
+	maxp = usb_maxpacket(dev->udev, dev->pipe_intr);
 	buf = kmalloc(maxp, GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
@@ -4444,7 +4444,7 @@ static int lan78xx_probe(struct usb_interface *intf,
 		dev->urb_intr->transfer_flags |= URB_FREE_BUFFER;
 	}
 
-	dev->maxpacket = usb_maxpacket(dev->udev, dev->pipe_out, 1);
+	dev->maxpacket = usb_maxpacket(dev->udev, dev->pipe_out);
 
 	/* Reject broken descriptors. */
 	if (dev->maxpacket == 0) {
diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
index 247f58cb0f84..de0b00bd2eca 100644
--- a/drivers/net/usb/rndis_host.c
+++ b/drivers/net/usb/rndis_host.c
@@ -333,7 +333,7 @@ generic_rndis_bind(struct usbnet *dev, struct usb_interface *intf, int flags)
 	net->hard_header_len += sizeof (struct rndis_data_hdr);
 	dev->hard_mtu = net->mtu + net->hard_header_len;
 
-	dev->maxpacket = usb_maxpacket(dev->udev, dev->out, 1);
+	dev->maxpacket = usb_maxpacket(dev->udev, dev->out);
 	if (dev->maxpacket == 0) {
 		netif_dbg(dev, probe, dev->net,
 			  "dev->maxpacket can't be 0\n");
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 9a6450f796dc..d5bf5733b277 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -229,7 +229,7 @@ static int init_status (struct usbnet *dev, struct usb_interface *intf)
 	pipe = usb_rcvintpipe (dev->udev,
 			dev->status->desc.bEndpointAddress
 				& USB_ENDPOINT_NUMBER_MASK);
-	maxp = usb_maxpacket (dev->udev, pipe, 0);
+	maxp = usb_maxpacket(dev->udev, pipe);
 
 	/* avoid 1 msec chatter:  min 8 msec poll rate */
 	period = max ((int) dev->status->desc.bInterval,
@@ -1789,7 +1789,7 @@ usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
 
 	if (!dev->rx_urb_size)
 		dev->rx_urb_size = dev->hard_mtu;
-	dev->maxpacket = usb_maxpacket (dev->udev, dev->out, 1);
+	dev->maxpacket = usb_maxpacket(dev->udev, dev->out);
 	if (dev->maxpacket == 0) {
 		/* that is a broken device */
 		status = -ENODEV;
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 0a7006c8959b..f84ea6996352 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -1132,7 +1132,7 @@ int mt76u_init(struct mt76_dev *dev,
 
 	INIT_WORK(&usb->stat_work, mt76u_tx_status_data);
 
-	usb->data_len = usb_maxpacket(udev, usb_sndctrlpipe(udev, 0), 1);
+	usb->data_len = usb_maxpacket(udev, usb_sndctrlpipe(udev, 0));
 	if (usb->data_len < 32)
 		usb->data_len = 32;
 
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
index 74c3d8cb3100..0827bc860bf8 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
@@ -586,10 +586,10 @@ static void rt2x00usb_assign_endpoint(struct data_queue *queue,
 
 	if (queue->qid == QID_RX) {
 		pipe = usb_rcvbulkpipe(usb_dev, queue->usb_endpoint);
-		queue->usb_maxpacket = usb_maxpacket(usb_dev, pipe, 0);
+		queue->usb_maxpacket = usb_maxpacket(usb_dev, pipe);
 	} else {
 		pipe = usb_sndbulkpipe(usb_dev, queue->usb_endpoint);
-		queue->usb_maxpacket = usb_maxpacket(usb_dev, pipe, 1);
+		queue->usb_maxpacket = usb_maxpacket(usb_dev, pipe);
 	}
 
 	if (!queue->usb_maxpacket)
-- 
2.34.1

