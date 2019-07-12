Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C8D664AF
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 04:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbfGLCyG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 22:54:06 -0400
Received: from gate.crashing.org ([63.228.1.57]:54439 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729051AbfGLCyG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 22:54:06 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6C2rnGe010240;
        Thu, 11 Jul 2019 21:53:59 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 03/12] usb: gadget: aspeed: Fix EP0 stall handling
Date:   Fri, 12 Jul 2019 12:53:39 +1000
Message-Id: <20190712025348.21019-4-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712025348.21019-1-benh@kernel.crashing.org>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When stalling EP0, we need to wait for an ACK interrupt,
otherwise we may get out of sync on the next setup packet
data phase. Also we need to ignore the direction when
processing that interrupt as the HW reports a potential
mismatch.

Implement this by adding a stall state to EP0. This fixes
some reported issues with mass storage and some hosts.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 48 +++++++++++++++--------
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  1 +
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
index 5e4714d7febb..b64dca7933b0 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
@@ -105,18 +105,20 @@ void ast_vhub_ep0_handle_setup(struct ast_vhub_ep *ep)
 	       (crq.bRequestType & USB_DIR_IN) ? "in" : "out",
 	       ep->ep0.state);
 
-	/* Check our state, cancel pending requests if needed */
-	if (ep->ep0.state != ep0_state_token) {
+	/*
+	 * Check our state, cancel pending requests if needed
+	 *
+	 * Note: Under some circumstances, we can get a new setup
+	 * packet while waiting for the stall ack, just accept it.
+	 *
+	 * In any case, a SETUP packet in wrong state should have
+	 * reset the HW state machine, so let's just log, nuke
+	 * requests, move on.
+	 */
+	if (ep->ep0.state != ep0_state_token &&
+	    ep->ep0.state != ep0_state_stall) {
 		EPDBG(ep, "wrong state\n");
 		ast_vhub_nuke(ep, -EIO);
-
-		/*
-		 * Accept the packet regardless, this seems to happen
-		 * when stalling a SETUP packet that has an OUT data
-		 * phase.
-		 */
-		ast_vhub_nuke(ep, 0);
-		goto stall;
 	}
 
 	/* Calculate next state for EP0 */
@@ -165,7 +167,7 @@ void ast_vhub_ep0_handle_setup(struct ast_vhub_ep *ep)
  stall:
 	EPDBG(ep, "stalling\n");
 	writel(VHUB_EP0_CTRL_STALL, ep->ep0.ctlstat);
-	ep->ep0.state = ep0_state_status;
+	ep->ep0.state = ep0_state_stall;
 	ep->ep0.dir_in = false;
 	return;
 
@@ -299,8 +301,8 @@ void ast_vhub_ep0_handle_ack(struct ast_vhub_ep *ep, bool in_ack)
 		if ((ep->ep0.dir_in && (stat & VHUB_EP0_TX_BUFF_RDY)) ||
 		    (!ep->ep0.dir_in && (stat & VHUB_EP0_RX_BUFF_RDY)) ||
 		    (ep->ep0.dir_in != in_ack)) {
+			/* In that case, ignore interrupt */
 			dev_warn(dev, "irq state mismatch");
-			stall = true;
 			break;
 		}
 		/*
@@ -335,12 +337,22 @@ void ast_vhub_ep0_handle_ack(struct ast_vhub_ep *ep, bool in_ack)
 			dev_warn(dev, "status direction mismatch\n");
 			stall = true;
 		}
+		break;
+	case ep0_state_stall:
+		/*
+		 * There shouldn't be any request left, but nuke just in case
+		 * otherwise the stale request will block subsequent ones
+		 */
+		ast_vhub_nuke(ep, -EIO);
+		break;
 	}
 
-	/* Reset to token state */
-	ep->ep0.state = ep0_state_token;
-	if (stall)
+	/* Reset to token state or stall */
+	if (stall) {
 		writel(VHUB_EP0_CTRL_STALL, ep->ep0.ctlstat);
+		ep->ep0.state = ep0_state_stall;
+	} else
+		ep->ep0.state = ep0_state_token;
 }
 
 static int ast_vhub_ep0_queue(struct usb_ep* u_ep, struct usb_request *u_req,
@@ -390,8 +402,12 @@ static int ast_vhub_ep0_queue(struct usb_ep* u_ep, struct usb_request *u_req,
 	spin_lock_irqsave(&vhub->lock, flags);
 
 	/* EP0 can only support a single request at a time */
-	if (!list_empty(&ep->queue) || ep->ep0.state == ep0_state_token) {
+	if (!list_empty(&ep->queue) ||
+	    ep->ep0.state == ep0_state_token ||
+	    ep->ep0.state == ep0_state_stall) {
 		dev_warn(dev, "EP0: Request in wrong state\n");
+	        EPVDBG(ep, "EP0: list_empty=%d state=%d\n",
+		       list_empty(&ep->queue), ep->ep0.state);
 		spin_unlock_irqrestore(&vhub->lock, flags);
 		return -EBUSY;
 	}
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 2e7ef387f4f0..00f922604a1c 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -257,6 +257,7 @@ enum ep0_state {
 	ep0_state_token,
 	ep0_state_data,
 	ep0_state_status,
+	ep0_state_stall,
 };
 
 /*
-- 
2.17.1

