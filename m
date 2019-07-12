Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A46664BC
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 04:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbfGLCzK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 22:55:10 -0400
Received: from gate.crashing.org ([63.228.1.57]:54484 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729332AbfGLCzJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 22:55:09 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6C2rnGg010240;
        Thu, 11 Jul 2019 21:54:05 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 05/12] usb: gadget: aspeed: Don't reject requests on suspended devices
Date:   Fri, 12 Jul 2019 12:53:41 +1000
Message-Id: <20190712025348.21019-6-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712025348.21019-1-benh@kernel.crashing.org>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A disconnect may just suspend the hub in absence of a physical
disconnect detection. If we start rejecting requests, the mass
storage function gets into a spin trying to requeue the same
request for ever and hangs.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 13 +++++++++----
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c |  2 +-
 drivers/usb/gadget/udc/aspeed-vhub/epn.c |  2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 678bbdbd0971..71e2416858fd 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -204,14 +204,19 @@ int ast_vhub_std_dev_request(struct ast_vhub_ep *ep,
 	u16 wValue, wIndex;
 
 	/* No driver, we shouldn't be enabled ... */
-	if (!d->driver || !d->enabled || d->suspended) {
+	if (!d->driver || !d->enabled) {
 		EPDBG(ep,
-		      "Device is wrong state driver=%p enabled=%d"
-		      " suspended=%d\n",
-		      d->driver, d->enabled, d->suspended);
+		      "Device is wrong state driver=%p enabled=%d\n",
+		      d->driver, d->enabled);
 		return std_req_stall;
 	}
 
+	/*
+	 * Note: we used to reject/stall requests while suspended,
+	 * we don't do that anymore as we seem to have cases of
+	 * mass storage getting very upset.
+	 */
+
 	/* First packet, grab speed */
 	if (d->gadget.speed == USB_SPEED_UNKNOWN) {
 		d->gadget.speed = ep->vhub->speed;
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
index b64dca7933b0..022b777b85f8 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
@@ -379,7 +379,7 @@ static int ast_vhub_ep0_queue(struct usb_ep* u_ep, struct usb_request *u_req,
 		return -EINVAL;
 
 	/* Disabled device */
-	if (ep->dev && (!ep->dev->enabled || ep->dev->suspended))
+	if (ep->dev && !ep->dev->enabled)
 		return -ESHUTDOWN;
 
 	/* Data, no buffer and not internal ? */
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 35941dc125f9..7475c74aa5c5 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -352,7 +352,7 @@ static int ast_vhub_epn_queue(struct usb_ep* u_ep, struct usb_request *u_req,
 
 	/* Endpoint enabled ? */
 	if (!ep->epn.enabled || !u_ep->desc || !ep->dev || !ep->d_idx ||
-	    !ep->dev->enabled || ep->dev->suspended) {
+	    !ep->dev->enabled) {
 		EPDBG(ep, "Enqueuing request on wrong or disabled EP\n");
 		return -ESHUTDOWN;
 	}
-- 
2.17.1

