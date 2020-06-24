Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CE620760D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 16:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404057AbgFXOtP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 10:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390822AbgFXOtO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jun 2020 10:49:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957ADC061795
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2020 07:49:14 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jo6i9-0001Wg-08; Wed, 24 Jun 2020 16:49:13 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jo6i7-0005hY-4R; Wed, 24 Jun 2020 16:49:11 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, kernel@pengutronix.de,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers more robust
Date:   Wed, 24 Jun 2020 16:49:06 +0200
Message-Id: <20200624144907.9604-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
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

From: Michael Olbrich <m.olbrich@pengutronix.de>

Currently __dwc3_gadget_start_isoc must be called very shortly after
XferNotReady. Otherwise the frame number is outdated and start transfer
will fail, even with several retries.

DSTS provides the lower 14 bit of the frame number. Use it in combination
with the frame number provided by XferNotReady to guess the current frame
number. This will succeed unless more than one 14 rollover has happened
since XferNotReady.

Start transfer might still fail if the frame number is increased
immediately after DSTS is read. So retries are still needed.
Don't drop the current request if this happens. This way it is not lost and
can be used immediately to try again with the next frame number.

With this change, __dwc3_gadget_start_isoc is still not successfully in all
cases bit it increases the acceptable delay after XferNotReady
significantly.

Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - removed last_frame_number from struct
          - included rollover variable

 drivers/usb/dwc3/gadget.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 421a0f73110a40b..0962ddd7fbf6ae6 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1276,7 +1276,7 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 
 static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep);
 
-static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
+static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep, bool keep_req)
 {
 	struct dwc3_gadget_ep_cmd_params params;
 	struct dwc3_request		*req;
@@ -1314,12 +1314,9 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 	}
 
 	ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
-	if (ret < 0) {
+	if (ret < 0 && (!keep_req || ret != -EAGAIN)) {
 		struct dwc3_request *tmp;
 
-		if (ret == -EAGAIN)
-			return ret;
-
 		dwc3_stop_active_transfer(dep, true, true);
 
 		list_for_each_entry_safe(req, tmp, &dep->started_list, list)
@@ -1335,7 +1332,7 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 	if (dep->stream_capable && req->request.is_last)
 		dep->flags |= DWC3_EP_WAIT_TRANSFER_COMPLETE;
 
-	return 0;
+	return ret;
 }
 
 static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
@@ -1458,7 +1455,7 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc3_ep *dep)
 	dep->start_cmd_status = 0;
 	dep->combo_num = 0;
 
-	return __dwc3_gadget_kick_transfer(dep);
+	return __dwc3_gadget_kick_transfer(dep, false);
 }
 
 static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
@@ -1481,9 +1478,25 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 	}
 
 	for (i = 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
-		dep->frame_number = DWC3_ALIGN_FRAME(dep, i + 1);
+		/*
+		 * frame_number is set from XferNotReady and may be already
+		 * out of date. DSTS only provides the lower 14 bit of the
+		 * current frame number. So add the upper two bits of
+		 * frame_number and handle a possible rollover.
+		 * This will provide the correct frame_number unless more than
+		 * rollover has happened since XferNotReady.
+		 */
+		u32 frame = __dwc3_gadget_get_frame(dwc);
+		bool rollover = frame < (dep->frame_number & 0x3fff);
+
+		dep->frame_number = (dep->frame_number & ~0x3fff) | frame;
+		if (rollover)
+			dep->frame_number += BIT(14);
+
+		dep->frame_number = DWC3_ALIGN_FRAME(dep, 1);
 
-		ret = __dwc3_gadget_kick_transfer(dep);
+		ret = __dwc3_gadget_kick_transfer(dep,
+				i + 1 < DWC3_ISOC_MAX_RETRIES);
 		if (ret != -EAGAIN)
 			break;
 	}
@@ -1567,7 +1580,7 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 		}
 	}
 
-	return __dwc3_gadget_kick_transfer(dep);
+	return __dwc3_gadget_kick_transfer(dep, false);
 }
 
 static int dwc3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
@@ -2719,7 +2732,7 @@ static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
 	if (status == -EXDEV && list_empty(&dep->started_list))
 		dwc3_stop_active_transfer(dep, true, true);
 	else if (dwc3_gadget_ep_should_continue(dep))
-		if (__dwc3_gadget_kick_transfer(dep) == 0)
+		if (__dwc3_gadget_kick_transfer(dep, false) == 0)
 			no_started_trb = false;
 
 out:
@@ -2904,7 +2917,7 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 			dwc3_gadget_ep_cleanup_cancelled_requests(dep);
 			if ((dep->flags & DWC3_EP_DELAY_START) &&
 			    !usb_endpoint_xfer_isoc(dep->endpoint.desc))
-				__dwc3_gadget_kick_transfer(dep);
+				__dwc3_gadget_kick_transfer(dep, false);
 
 			dep->flags &= ~DWC3_EP_DELAY_START;
 		}
-- 
2.27.0

