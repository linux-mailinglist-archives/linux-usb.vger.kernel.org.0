Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08364195334
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 09:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgC0IqV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 04:46:21 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46509 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgC0IqU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 04:46:20 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jHkd6-0001qQ-Oo; Fri, 27 Mar 2020 09:46:16 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jHkd4-0000fZ-E7; Fri, 27 Mar 2020 09:46:14 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     lars@metafoo.de, alexandru.Ardelean@analog.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, bigeasy@linutronix.de,
        m.olbrich@pengutronix.de, kernel@pengutronix.de
Subject: [PATCH] usb: dwc3: gadget: don't dequeue requests on already disabled endpoints
Date:   Fri, 27 Mar 2020 09:43:03 +0100
Message-Id: <20200327084302.606-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <dc52d6a0-12ed-a34c-01c4-0fc5ccbf7b1d@metafoo.de>
References: <dc52d6a0-12ed-a34c-01c4-0fc5ccbf7b1d@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dwc3_gadget_ep_disable gets called before the last request gets
dequeued.

In __dwc3_gadget_ep_disable all started, pending and cancelled
lists for this endpoint will call dwc3_gadget_giveback in
dwc3_remove_requests.

After that no list containing the afterwards dequed request,
therefor it is not necessary to run the dequeue routine.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
@Lars-Peter Clausen:

This patch addresses the case that not queued requests get dequeued.
The only case that this happens seems on disabling the gadget.

 drivers/usb/dwc3/gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 9a6f741d1db0dc..5d4fa8d6c93e49 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1609,6 +1609,9 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 
 	trace_dwc3_ep_dequeue(req);
 
+	if (!(dep->flags & DWC3_EP_ENABLED))
+		return 0;
+
 	spin_lock_irqsave(&dwc->lock, flags);
 
 	list_for_each_entry(r, &dep->pending_list, list) {
-- 
2.26.0.rc2

