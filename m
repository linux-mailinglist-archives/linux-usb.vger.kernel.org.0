Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8951FE6D8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 04:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729105AbgFRCgq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 22:36:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:43334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729220AbgFRBNw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Jun 2020 21:13:52 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13FD921924;
        Thu, 18 Jun 2020 01:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592442831;
        bh=Xb46VIF6qOBv8zsM170FowwD/AuodtSM1Q+ABQKgOX4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sVCekNJvCQJauudsOpvFLk8FZYge472cISJy+xZrWaWCx3NberAzYHLWONu3xIcnF
         2F737pXV1YRO5rZMcHXUsC/qfEpXbvyn5BBwDdAPFl85qRz/q8QZFDTmplPi6pQb1+
         o/cUVL8YNDQeQqK6Yw/mTj7sKMH9uPBEGSU0hwKk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Colin Ian King <colin.king@canonical.com>,
        Felipe Balbi <balbi@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.7 266/388] usb: gadget: lpc32xx_udc: don't dereference ep pointer before null check
Date:   Wed, 17 Jun 2020 21:06:03 -0400
Message-Id: <20200618010805.600873-266-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit eafa80041645cd7604c4357b1a0cd4a3c81f2227 ]

Currently pointer ep is being dereferenced before it is null checked
leading to a null pointer dereference issue.  Fix this by only assigning
pointer udc once ep is known to be not null.  Also remove a debug
message that requires a valid udc which may not be possible at that
point.

Addresses-Coverity: ("Dereference before null check")
Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index cb997b82c008..465d0b7c6522 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -1614,17 +1614,17 @@ static int lpc32xx_ep_enable(struct usb_ep *_ep,
 			     const struct usb_endpoint_descriptor *desc)
 {
 	struct lpc32xx_ep *ep = container_of(_ep, struct lpc32xx_ep, ep);
-	struct lpc32xx_udc *udc = ep->udc;
+	struct lpc32xx_udc *udc;
 	u16 maxpacket;
 	u32 tmp;
 	unsigned long flags;
 
 	/* Verify EP data */
 	if ((!_ep) || (!ep) || (!desc) ||
-	    (desc->bDescriptorType != USB_DT_ENDPOINT)) {
-		dev_dbg(udc->dev, "bad ep or descriptor\n");
+	    (desc->bDescriptorType != USB_DT_ENDPOINT))
 		return -EINVAL;
-	}
+
+	udc = ep->udc;
 	maxpacket = usb_endpoint_maxp(desc);
 	if ((maxpacket == 0) || (maxpacket > ep->maxpacket)) {
 		dev_dbg(udc->dev, "bad ep descriptor's packet size\n");
@@ -1872,7 +1872,7 @@ static int lpc32xx_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 static int lpc32xx_ep_set_halt(struct usb_ep *_ep, int value)
 {
 	struct lpc32xx_ep *ep = container_of(_ep, struct lpc32xx_ep, ep);
-	struct lpc32xx_udc *udc = ep->udc;
+	struct lpc32xx_udc *udc;
 	unsigned long flags;
 
 	if ((!ep) || (ep->hwep_num <= 1))
@@ -1882,6 +1882,7 @@ static int lpc32xx_ep_set_halt(struct usb_ep *_ep, int value)
 	if (ep->is_in)
 		return -EAGAIN;
 
+	udc = ep->udc;
 	spin_lock_irqsave(&udc->lock, flags);
 
 	if (value == 1) {
-- 
2.25.1

