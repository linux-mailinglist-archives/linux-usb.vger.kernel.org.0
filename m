Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D7775E1F
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2019 07:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfGZFG6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jul 2019 01:06:58 -0400
Received: from gate.crashing.org ([63.228.1.57]:45175 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbfGZFG6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jul 2019 01:06:58 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6Q55j3Q017580;
        Fri, 26 Jul 2019 00:05:50 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Linux USB List <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 02/10] usb: gadget: aspeed: Cleanup EP0 state on port reset
Date:   Fri, 26 Jul 2019 15:05:31 +1000
Message-Id: <20190726050539.7875-3-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726050539.7875-1-benh@kernel.crashing.org>
References: <20190726050539.7875-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Otherwise, we can have a stale state after a disconnect and reconnect
causing errors on the first SETUP packet to the device.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 3 +++
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 9 +++++++++
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 1 +
 3 files changed, 13 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 6b1b16b17d7d..678bbdbd0971 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -55,6 +55,9 @@ static void ast_vhub_dev_enable(struct ast_vhub_dev *d)
 	if (d->enabled)
 		return;
 
+	/* Cleanup EP0 state */
+	ast_vhub_reset_ep0(d);
+
 	/* Enable device and its EP0 interrupts */
 	reg = VHUB_DEV_EN_ENABLE_PORT |
 		VHUB_DEV_EN_EP0_IN_ACK_IRQEN |
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
index e2927fb083cf..5e4714d7febb 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
@@ -459,6 +459,15 @@ static const struct usb_ep_ops ast_vhub_ep0_ops = {
 	.free_request	= ast_vhub_free_request,
 };
 
+void ast_vhub_reset_ep0(struct ast_vhub_dev *dev)
+{
+	struct ast_vhub_ep *ep = &dev->ep0;
+
+	ast_vhub_nuke(ep, -EIO);
+	ep->ep0.state = ep0_state_token;
+}
+
+
 void ast_vhub_init_ep0(struct ast_vhub *vhub, struct ast_vhub_ep *ep,
 		       struct ast_vhub_dev *dev)
 {
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 4ed03d33a5a9..2e7ef387f4f0 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -507,6 +507,7 @@ void ast_vhub_init_hw(struct ast_vhub *vhub);
 /* ep0.c */
 void ast_vhub_ep0_handle_ack(struct ast_vhub_ep *ep, bool in_ack);
 void ast_vhub_ep0_handle_setup(struct ast_vhub_ep *ep);
+void ast_vhub_reset_ep0(struct ast_vhub_dev *dev);
 void ast_vhub_init_ep0(struct ast_vhub *vhub, struct ast_vhub_ep *ep,
 		       struct ast_vhub_dev *dev);
 int ast_vhub_reply(struct ast_vhub_ep *ep, char *ptr, int len);
-- 
2.17.1

