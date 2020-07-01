Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737CB21082E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 11:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgGAJcN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 05:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgGAJcN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 05:32:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C83DC061755
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 02:32:13 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqZ6B-0003Pp-L7; Wed, 01 Jul 2020 11:32:11 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqZ6A-0005jS-Kr; Wed, 01 Jul 2020 11:32:10 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, balbi@kernel.org,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Thinh Nguyen <thinhn@synopsys.com>
Subject: [PATCH v4 2/3] usb: dwc3: gadget: make starting isoc transfers more robust
Date:   Wed,  1 Jul 2020 11:31:37 +0200
Message-Id: <20200701093137.19485-3-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701093137.19485-1-m.grzeschik@pengutronix.de>
References: <20200701093137.19485-1-m.grzeschik@pengutronix.de>
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

Reviewed-by: Thinh Nguyen <thinhn@synopsys.com>
Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - removed last_frame_number from struct
          - included rollover variable
v2 -> v3: - moved the calculation before the retry loop
          - skipping the calculation if bInterval > 14
v3 -> v4: - used define for 0x3fff framenumber mask
          - added limitation for this to usb > fullspeed

 drivers/usb/dwc3/gadget.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 5fb78535efa9bdc..a2145f905d67067 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1463,6 +1463,7 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc3_ep *dep)
 
 static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 {
+	const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
 	struct dwc3 *dwc = dep->dwc;
 	int ret;
 	int i;
@@ -1480,6 +1481,27 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 			return dwc3_gadget_start_isoc_quirk(dep);
 	}
 
+	if (desc->bInterval <= 14 &&
+	    dwc->gadget.speed >= USB_SPEED_SUPER) {
+		u32 frame = __dwc3_gadget_get_frame(dwc);
+		bool rollover = frame <
+				(dep->frame_number & DWC3_FRNUMBER_MASK);
+
+		/*
+		 * frame_number is set from XferNotReady and may be already
+		 * out of date. DSTS only provides the lower 14 bit of the
+		 * current frame number. So add the upper two bits of
+		 * frame_number and handle a possible rollover.
+		 * This will provide the correct frame_number unless more than
+		 * rollover has happened since XferNotReady.
+		 */
+
+		dep->frame_number = (dep->frame_number & ~DWC3_FRNUMBER_MASK) |
+				     frame;
+		if (rollover)
+			dep->frame_number += BIT(14);
+	}
+
 	for (i = 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
 		dep->frame_number = DWC3_ALIGN_FRAME(dep, i + 1);
 
-- 
2.27.0

