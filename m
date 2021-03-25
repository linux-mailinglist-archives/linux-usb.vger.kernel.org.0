Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD61F34868F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 02:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbhCYBtY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 21:49:24 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42496 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235750AbhCYBs6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 21:48:58 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 11073C00CA;
        Thu, 25 Mar 2021 01:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1616636938; bh=KQeDhrHUhAFtHI2576ffKDubs0BKqK8t2eAtZWr5hXI=;
        h=Date:From:Subject:To:Cc:From;
        b=QTDo4plk8JHsFudg4hez4V8/ubrSkMnXnZJCAadPaG/7mdUqcKU8LzHF9WDomgJlI
         aIe8aPDniH0MaodKgLW/ZxZ5ZBfkJIDA3ox77NQJeyBC34M+knRY+Xk/1vbDrO2w35
         o5fOC5Z91RmUU3IjfPvmikyNWDNHS8bScOi7LfpQKZWTChwWFie8Gi0TGUXyBoWgXC
         fXLXdsbOHEKc0heh52tcg6Hkudjfeybmj/NdHZli0Mv9tU0hWHxFwbYvxDWRTbRSmq
         hI276CwduFC0H9/qcAO9l2ye91tY3Lu+AB8SNU6ry4k5taP6VTif4BvRmFVcNjewrp
         +Aeoxy4CzbXyA==
Received: from lab-vbox (unknown [10.205.139.29])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id BAE64A005E;
        Thu, 25 Mar 2021 01:48:56 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 24 Mar 2021 18:47:50 -0700
Date:   Wed, 24 Mar 2021 18:47:50 -0700
Message-Id: <f6c3bf1ec9d6e36a36ed84534988014f2dd70035.1616636455.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: Create helper function getting MDWIDTH
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Different controller IPs check different HW parameters for MDWIDTH.
To help with maintainability, create a helper function to consolidate
the logic in a single place.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h    | 19 +++++++++++++++++--
 drivers/usb/dwc3/debugfs.c | 12 ++++--------
 drivers/usb/dwc3/gadget.c  | 16 +++++-----------
 3 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 4ca4b4be85e4..265190b7074a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -860,8 +860,6 @@ struct dwc3_hwparams {
 /* HWPARAMS0 */
 #define DWC3_MODE(n)		((n) & 0x7)
 
-#define DWC3_MDWIDTH(n)		(((n) & 0xff00) >> 8)
-
 /* HWPARAMS1 */
 #define DWC3_NUM_INT(n)		(((n) & (0x3f << 15)) >> 15)
 
@@ -1458,6 +1456,23 @@ u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type);
 	 (!(_ip##_VERSIONTYPE_##_to) ||					\
 	  dwc->version_type <= _ip##_VERSIONTYPE_##_to))
 
+/**
+ * dwc3_mdwidth - get MDWIDTH value in bits
+ * @dwc: pointer to our context structure
+ *
+ * Return MDWIDTH configuration value in bits.
+ */
+static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
+{
+	u32 mdwidth;
+
+	mdwidth = DWC3_GHWPARAMS0_MDWIDTH(dwc->hwparams.hwparams0);
+	if (DWC3_IP_IS(DWC32))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+
+	return mdwidth;
+}
+
 bool dwc3_has_imod(struct dwc3 *dwc);
 
 int dwc3_event_buffers_setup(struct dwc3 *dwc);
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 5da4f6082d93..c85852d98b4b 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -638,16 +638,14 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	struct dwc3_ep		*dep = s->private;
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
-	int			mdwidth;
+	u32			mdwidth;
 	u32			val;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXFIFO);
 
 	/* Convert to bytes */
-	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
-	if (DWC3_IP_IS(DWC32))
-		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+	mdwidth = dwc3_mdwidth(dwc);
 
 	val *= mdwidth;
 	val >>= 3;
@@ -662,16 +660,14 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	struct dwc3_ep		*dep = s->private;
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
-	int			mdwidth;
+	u32			mdwidth;
 	u32			val;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
 
 	/* Convert to bytes */
-	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
-	if (DWC3_IP_IS(DWC32))
-		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+	mdwidth = dwc3_mdwidth(dwc);
 
 	val *= mdwidth;
 	val >>= 3;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e1442fc763e1..a9540cc1a1eb 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2337,9 +2337,7 @@ static void dwc3_gadget_setup_nump(struct dwc3 *dwc)
 	u32 reg;
 
 	ram2_depth = DWC3_GHWPARAMS7_RAM2_DEPTH(dwc->hwparams.hwparams7);
-	mdwidth = DWC3_GHWPARAMS0_MDWIDTH(dwc->hwparams.hwparams0);
-	if (DWC3_IP_IS(DWC32))
-		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+	mdwidth = dwc3_mdwidth(dwc);
 
 	nump = ((ram2_depth * mdwidth / 8) - 24 - 16) / 1024;
 	nump = min_t(u32, nump, 16);
@@ -2575,12 +2573,10 @@ static int dwc3_gadget_init_control_endpoint(struct dwc3_ep *dep)
 static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 {
 	struct dwc3 *dwc = dep->dwc;
-	int mdwidth;
+	u32 mdwidth;
 	int size;
 
-	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
-	if (DWC3_IP_IS(DWC32))
-		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+	mdwidth = dwc3_mdwidth(dwc);
 
 	/* MDWIDTH is represented in bits, we need it in bytes */
 	mdwidth /= 8;
@@ -2622,12 +2618,10 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
 {
 	struct dwc3 *dwc = dep->dwc;
-	int mdwidth;
+	u32 mdwidth;
 	int size;
 
-	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
-	if (DWC3_IP_IS(DWC32))
-		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+	mdwidth = dwc3_mdwidth(dwc);
 
 	/* MDWIDTH is represented in bits, convert to bytes */
 	mdwidth /= 8;

base-commit: 049d3db625a652e23488db88b6104de4d5b62f16
-- 
2.28.0

