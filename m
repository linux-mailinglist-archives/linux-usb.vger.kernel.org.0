Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90AC8240E7F
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 21:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbgHJTNj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 15:13:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:44740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729797AbgHJTNg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Aug 2020 15:13:36 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DA482224D;
        Mon, 10 Aug 2020 19:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597086816;
        bh=ARaebd6r23AHRp7i41bEOBhp4oRUZXhVKblrjOHtCy8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IvLs79vSfPs9UZeeNoKk0EoUofo+kwkWAN5m14Z5X4XfvhyDQaSxBu+xaaS/DRcmf
         2HqBVDNepmQYZl6b+vgCrbWFPav5yl24D0QPxnKmFmoSw/whJ9Tdn+Km5kyXTsjQSC
         RQC6a0n890s8N1KkC/sGdOwI1VKoMuO/uNXfkhmw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sasi Kumar <sasi.kumar@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 25/31] bdc: Fix bug causing crash after multiple disconnects
Date:   Mon, 10 Aug 2020 15:12:53 -0400
Message-Id: <20200810191259.3794858-25-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810191259.3794858-1-sashal@kernel.org>
References: <20200810191259.3794858-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sasi Kumar <sasi.kumar@broadcom.com>

[ Upstream commit a95bdfd22076497288868c028619bc5995f5cc7f ]

Multiple connects/disconnects can cause a crash on the second
disconnect. The driver had a problem where it would try to send
endpoint commands after it was disconnected which is not allowed
by the hardware. The fix is to only allow the endpoint commands
when the endpoint is connected. This will also fix issues that
showed up when using configfs to create gadgets.

Signed-off-by: Sasi Kumar <sasi.kumar@broadcom.com>
Signed-off-by: Al Cooper <alcooperx@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c |  4 ++++
 drivers/usb/gadget/udc/bdc/bdc_ep.c   | 16 ++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 01b44e1596237..4c557f3154460 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -283,6 +283,7 @@ static void bdc_mem_init(struct bdc *bdc, bool reinit)
 	 * in that case reinit is passed as 1
 	 */
 	if (reinit) {
+		int i;
 		/* Enable interrupts */
 		temp = bdc_readl(bdc->regs, BDC_BDCSC);
 		temp |= BDC_GIE;
@@ -292,6 +293,9 @@ static void bdc_mem_init(struct bdc *bdc, bool reinit)
 		/* Initialize SRR to 0 */
 		memset(bdc->srr.sr_bds, 0,
 					NUM_SR_ENTRIES * sizeof(struct bdc_bd));
+		/* clear ep flags to avoid post disconnect stops/deconfigs */
+		for (i = 1; i < bdc->num_eps; ++i)
+			bdc->bdc_ep_array[i]->flags = 0;
 	} else {
 		/* One time initiaization only */
 		/* Enable status report function pointers */
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index d49c6dc1082dc..9ddc0b4e92c9c 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -615,7 +615,6 @@ int bdc_ep_enable(struct bdc_ep *ep)
 	}
 	bdc_dbg_bd_list(bdc, ep);
 	/* only for ep0: config ep is called for ep0 from connect event */
-	ep->flags |= BDC_EP_ENABLED;
 	if (ep->ep_num == 1)
 		return ret;
 
@@ -759,10 +758,13 @@ static int ep_dequeue(struct bdc_ep *ep, struct bdc_req *req)
 					__func__, ep->name, start_bdi, end_bdi);
 	dev_dbg(bdc->dev, "ep_dequeue ep=%p ep->desc=%p\n",
 						ep, (void *)ep->usb_ep.desc);
-	/* Stop the ep to see where the HW is ? */
-	ret = bdc_stop_ep(bdc, ep->ep_num);
-	/* if there is an issue with stopping ep, then no need to go further */
-	if (ret)
+	/* if still connected, stop the ep to see where the HW is ? */
+	if (!(bdc_readl(bdc->regs, BDC_USPC) & BDC_PST_MASK)) {
+		ret = bdc_stop_ep(bdc, ep->ep_num);
+		/* if there is an issue, then no need to go further */
+		if (ret)
+			return 0;
+	} else
 		return 0;
 
 	/*
@@ -1911,7 +1913,9 @@ static int bdc_gadget_ep_disable(struct usb_ep *_ep)
 		__func__, ep->name, ep->flags);
 
 	if (!(ep->flags & BDC_EP_ENABLED)) {
-		dev_warn(bdc->dev, "%s is already disabled\n", ep->name);
+		if (bdc->gadget.speed != USB_SPEED_UNKNOWN)
+			dev_warn(bdc->dev, "%s is already disabled\n",
+				 ep->name);
 		return 0;
 	}
 	spin_lock_irqsave(&bdc->lock, flags);
-- 
2.25.1

