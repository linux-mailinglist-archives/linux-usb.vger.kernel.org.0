Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A399920D61E
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jun 2020 22:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbgF2TRy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jun 2020 15:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731959AbgF2TRo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jun 2020 15:17:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AA5C02A565
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2020 06:22:11 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jptjd-0005C6-Hs; Mon, 29 Jun 2020 15:22:09 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jptjc-0001HP-8U; Mon, 29 Jun 2020 15:22:08 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, kernel@pengutronix.de,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers more robust
Date:   Mon, 29 Jun 2020 15:22:05 +0200
Message-Id: <20200629132206.3914-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
References: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
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
v2 -> v3: - moved the calculation before the retry loop
          - skipping the calculation if bInterval > 14

 drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8de6f10d335e1c0..7ad85a7d06f70bf 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1463,6 +1463,7 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc3_ep *dep)
 
 static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 {
+	const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
 	struct dwc3 *dwc = dep->dwc;
 	int ret;
 	int i;
@@ -1480,6 +1481,24 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 			return dwc3_gadget_start_isoc_quirk(dep);
 	}
 
+	if (desc->bInterval <= 14) {
+		u32 frame = __dwc3_gadget_get_frame(dwc);
+		bool rollover = frame < (dep->frame_number & 0x3fff);
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
+		dep->frame_number = (dep->frame_number & ~0x3fff) | frame;
+		if (rollover)
+			dep->frame_number += BIT(14);
+	}
+
 	for (i = 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
 		dep->frame_number = DWC3_ALIGN_FRAME(dep, i + 1);
 
-- 
2.27.0

