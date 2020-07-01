Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70EC21082F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 11:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbgGAJcO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 05:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729363AbgGAJcN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 05:32:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BD5C03E97B
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 02:32:13 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqZ6B-0003Po-LU; Wed, 01 Jul 2020 11:32:11 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqZ6A-0005jP-KN; Wed, 01 Jul 2020 11:32:10 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, balbi@kernel.org
Subject: [PATCH v4 1/3] usb: dwc3: gadget: add frame number mask
Date:   Wed,  1 Jul 2020 11:31:36 +0200
Message-Id: <20200701093137.19485-2-m.grzeschik@pengutronix.de>
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

This patch adds an define DWC3_FRNUMBER_MASK for the common used
0x3fff mask and uses it.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v4: - first version

 drivers/usb/dwc3/gadget.c | 4 ++--
 drivers/usb/dwc3/gadget.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8de6f10d335e1c0..5fb78535efa9bdc 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1403,7 +1403,7 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc3_ep *dep)
 		 * Check if we can start isoc transfer on the next interval or
 		 * 4 uframes in the future with BIT[15:14] as dep->combo_num
 		 */
-		test_frame_number = dep->frame_number & 0x3fff;
+		test_frame_number = dep->frame_number & DWC3_FRNUMBER_MASK;
 		test_frame_number |= dep->combo_num << 14;
 		test_frame_number += max_t(u32, 4, dep->interval);
 
@@ -1450,7 +1450,7 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc3_ep *dep)
 	else if (test0 && test1)
 		dep->combo_num = 0;
 
-	dep->frame_number &= 0x3fff;
+	dep->frame_number &= DWC3_FRNUMBER_MASK;
 	dep->frame_number |= dep->combo_num << 14;
 	dep->frame_number += max_t(u32, 4, dep->interval);
 
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index 24dca38720225dd..a0fc46f72b9e30a 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -54,6 +54,8 @@ struct dwc3;
 /* U2 Device exit Latency */
 #define DWC3_DEFAULT_U2_DEV_EXIT_LAT	0x1FF	/* Less then 511 microsec */
 
+/* Frame/Microframe Number Mask */
+#define DWC3_FRNUMBER_MASK		0x3fff
 /* -------------------------------------------------------------------------- */
 
 #define to_dwc3_request(r)	(container_of(r, struct dwc3_request, request))
-- 
2.27.0

