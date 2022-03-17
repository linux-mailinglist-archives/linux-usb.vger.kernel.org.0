Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237EF4DBE70
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 06:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiCQFfv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 01:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiCQFft (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 01:35:49 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B34117CA2
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:03:51 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id m84so2293769vke.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r+GUQbASJ031IRNOS38Vp2D7clnVc0CQYbgsYb/h5ZQ=;
        b=JXZekK0v+oveafrUSKuV84n5YvAPZKwtFlBQIWc/1e5wLxdGReDhGQM6+YiP1vLKWY
         0EKwVlxfxCMqAliJUzFMKnjpp20HpnENevMw6AEMvppxVLY43dQjSV9nD0FGcTTwd+Yq
         652zmlDgVpXfJecMYV5Q3Fz/kUXrhN7AHGhGM0Xie2CFUsSS1Iso/gx1BehwLe3EywAQ
         6/wWxMz6Dr9+VymXwBe9/QvMs8zgn2X0y2HFCCwGQK/FxKD/n7znUyLQkO5Rk17jrbTB
         sZsY7zwHRohj0eVHgkV2fyv1jZc1uGCMGJyC/vOOC3bZVUle9DwAfWVFH9I3K8FLHbjd
         jMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=r+GUQbASJ031IRNOS38Vp2D7clnVc0CQYbgsYb/h5ZQ=;
        b=uCMIqKoF3zpUJ/58Nw8KFO+JCACkFSo3ZUBWf38Cp3gY7UAbfP/9cxNT7Ww1JHBs7N
         z8oefs5itedp4L6SA5XJg0agAtPwJhssbLX3XOOckOuLlIl0xBSRPAopaKZZoRPw7Xox
         3lAJJX2ngyJ87qNyWH1Bc9ePr0H3ZisuXCJDRWMFUu/xjjEKyRf+3SkBbLXP3N7322Wd
         gzFY2pJKavQRPPViUves40KwhbLY3mcQo1iF0sD8w1R62lIkvF8Nd4oOxwHw4PqAHklX
         goMYoyg78hG0iHAlMvP9AYZeWVcgelJD/AAZ6hxAXO0KdnpNsZidZ2WBWF1fOSl3xJLs
         E/uQ==
X-Gm-Message-State: AOAM532DnMqxoP9GKShH+uDlWfn92N9l67j+fOJCePBE5sIJlLoH+90Z
        0GAbV6a34zheTsrS35if/3TXGdcZrPmt2g==
X-Google-Smtp-Source: ABdhPJzHxajGOcpr4xION5hDFG8g/oNd0u/3wSkmw7GEvb+BRkfH6m163oLB8qEwIJO2pAsbm+6GbA==
X-Received: by 2002:a17:903:3091:b0:153:9dcf:de71 with SMTP id u17-20020a170903309100b001539dcfde71mr2616699plc.7.1647489343244;
        Wed, 16 Mar 2022 20:55:43 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b004f78e446ff5sm5096734pfv.15.2022.03.16.20.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:55:42 -0700 (PDT)
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
Subject: [PATCH v4 5/9] net: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 12:55:10 +0900
Message-Id: <20220317035514.6378-6-mailhol.vincent@wanadoo.fr>
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

