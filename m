Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4706E2DD6
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 11:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733136AbfJXJoX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 05:44:23 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:59294 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731944AbfJXJoX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 05:44:23 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 799A4C0B9C;
        Thu, 24 Oct 2019 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571910262; bh=fUY2GcpIecDaBHXOzQrcm/CoqHKCgzFIIV/5JmKZAFE=;
        h=Date:From:Subject:To:Cc:From;
        b=hUeVNqij5hODr68eZcNwSEoW2optAEXcwCpdIk8lthwXXOWP+xpubZOey1OgRXfEq
         emQ3xZBv9CqVtpTw5qjsgqPmG+IeAHnzkoZwpcUyJ/+wkqmpfHp3mJahXxEYoppnYQ
         aDC0BxJQ6dbD2yNSajSUntgY9qLgFNZObwHfiS/vYomONQyA9b5WwqB/1LD2HKf1Sg
         Y+RO0d9VZxpX6smttDM7F9nWxlHTWFvMKnCOVDRxvGSSs8TuspOJpn72OwpdrIYNqy
         r/fUKuhllUwvqh8xYpdmln6gkaNwA04/dngYBqBGx8xUsNSM20Phe+sOV3o7DrNBJ6
         HkhxpwXr0T02A==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.126.211])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2AF77A0097;
        Thu, 24 Oct 2019 09:44:18 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Thu, 24 Oct 2019 13:44:15 +0400
Date:   Thu, 24 Oct 2019 13:44:15 +0400
Message-Id: <aa1332773d7d160d66f7d8eb6604428363c5e151.1571910114.git.hminas@synopsys.com>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: Fix Stalling a Non-Isochronous OUT EP
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Stalling a Non-Isochronous OUT Endpoint flow changed according
programming guide.
In dwc2_hsotg_ep_sethalt() function for OUT EP should not be set STALL bit.
Instead should set SGOUTNAK in DCTL register. Set STALL bit should be
set only after GOUTNAKEFF interrupt asserted.

Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
---
 drivers/usb/dwc2/gadget.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6be10e496e10..d3335f7907fa 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3784,15 +3784,26 @@ static irqreturn_t dwc2_hsotg_irq(int irq, void *pw)
 		for (idx = 1; idx < hsotg->num_of_eps; idx++) {
 			hs_ep = hsotg->eps_out[idx];
 			/* Proceed only unmasked ISOC EPs */
-			if ((BIT(idx) & ~daintmsk) || !hs_ep->isochronous)
+			if (BIT(idx) & ~daintmsk)
 				continue;
 
 			epctrl = dwc2_readl(hsotg, DOEPCTL(idx));
 
-			if (epctrl & DXEPCTL_EPENA) {
+			//ISOC Ep's only
+			if ((epctrl & DXEPCTL_EPENA) && hs_ep->isochronous) {
 				epctrl |= DXEPCTL_SNAK;
 				epctrl |= DXEPCTL_EPDIS;
 				dwc2_writel(hsotg, epctrl, DOEPCTL(idx));
+				continue;
+			}
+
+			//Non-ISOC EP's
+			if (hs_ep->halted) {
+				if (!(epctrl & DXEPCTL_EPENA))
+					epctrl |= DXEPCTL_EPENA;
+				epctrl |= DXEPCTL_EPDIS;
+				epctrl |= DXEPCTL_STALL;
+				dwc2_writel(hsotg, epctrl, DOEPCTL(idx));
 			}
 		}
 
@@ -4310,19 +4321,20 @@ static int dwc2_hsotg_ep_sethalt(struct usb_ep *ep, int value, bool now)
 		epctl = dwc2_readl(hs, epreg);
 
 		if (value) {
-			epctl |= DXEPCTL_STALL;
+			if (!(dwc2_readl(hs, GINTSTS) & GINTSTS_GOUTNAKEFF))
+				dwc2_set_bit(hs, DCTL, DCTL_SGOUTNAK);
+			// STALL bit will be set in GOUTNAKEFF interrupt handler
 		} else {
 			epctl &= ~DXEPCTL_STALL;
 			xfertype = epctl & DXEPCTL_EPTYPE_MASK;
 			if (xfertype == DXEPCTL_EPTYPE_BULK ||
 			    xfertype == DXEPCTL_EPTYPE_INTERRUPT)
 				epctl |= DXEPCTL_SETD0PID;
+			dwc2_writel(hs, epctl, epreg);
 		}
-		dwc2_writel(hs, epctl, epreg);
 	}
 
 	hs_ep->halted = value;
-
 	return 0;
 }
 
-- 
2.11.0

