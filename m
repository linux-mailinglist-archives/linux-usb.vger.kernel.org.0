Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0977B21128C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 20:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732965AbgGASZA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 14:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732960AbgGASY7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 14:24:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C4BC08C5DE
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 11:24:59 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqhPj-0004Pe-RH; Wed, 01 Jul 2020 20:24:55 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqhPj-0007RC-55; Wed, 01 Jul 2020 20:24:55 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, balbi@kernel.org,
        Thinh Nguyen <thinhn@synopsys.com>
Subject: [PATCH v5 3/3] usb: dwc3: gadget: when the started list is empty stop the active xfer
Date:   Wed,  1 Jul 2020 20:24:53 +0200
Message-Id: <20200701182453.25299-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701182453.25299-1-m.grzeschik@pengutronix.de>
References: <20200701182453.25299-1-m.grzeschik@pengutronix.de>
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

When we have nothing left to be queued after handling the last trb
we have to stop the current transfer. This way we can ensure that
the next request will be queued with a new and valid timestamp
and will not directly run into an missed xfer.

Reviewed-by: Thinh Nguyen <thinhn@synopsys.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - This Patch replaces the following patch by Michael Olbrich:
            usb: dwc3: gadget: restart the transfer if a isoc request is queued too late
v2 -> v3: - rearranged condition for easier read (suggested by Tinh Nguyen)
v3 -> v4: - no changes
v4 -> v5: - fixed wording in commit message
---
 drivers/usb/dwc3/gadget.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index b8240ab0ccdaf2a..f6098ce9e7d4ac0 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2738,7 +2738,9 @@ static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
 	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
 		goto out;
 
-	if (status == -EXDEV && list_empty(&dep->started_list))
+	if (usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
+		list_empty(&dep->started_list) &&
+		(list_empty(&dep->pending_list) || status == -EXDEV))
 		dwc3_stop_active_transfer(dep, true, true);
 	else if (dwc3_gadget_ep_should_continue(dep))
 		if (__dwc3_gadget_kick_transfer(dep) == 0)
-- 
2.27.0

