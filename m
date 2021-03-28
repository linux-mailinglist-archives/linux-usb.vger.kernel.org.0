Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A9C34BA48
	for <lists+linux-usb@lfdr.de>; Sun, 28 Mar 2021 01:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhC1AyL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Mar 2021 20:54:11 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33468 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230490AbhC1AyE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Mar 2021 20:54:04 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C772B40131;
        Sun, 28 Mar 2021 00:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1616892844; bh=xJ6R2DhjDbzsmPy3EZQ6uk3rTF39zvD3qXPyA6P/2i8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=jyVIPdQPr8ZUxRkVPF7/bkJwKymdu+PWF7r1ArcVZBixZ+5gvCQrmGj8Inta5Nb+o
         o7+2onSRspM64C6fbgMUR1vHerWIgVzDqv49EzZ2NBF66hZoj/ZLvBzefLJJfU2FlF
         OqzMGhsq6YgAv4iup8GKTw5KZ6gK7VLLwqJP60iwuMxks2dsX/f/Ntl5XMPNSxAOIz
         qBHQmHsvwIzXiTv6lxJWPVcoX3ggqwG7UEAXb9br1Uyj3NjIGT/NpcIpD77fKAWRl3
         2fE7RAC9QGXdg/q7uCnRBVfJhJ9KaZAW1bVZ/sYo0OpZK0+0vQKTUAyREGO3zsXO01
         3hhMm72J6xtYw==
Received: from lab-vbox (unknown [10.205.128.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 47444A007C;
        Sun, 28 Mar 2021 00:54:02 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Sat, 27 Mar 2021 17:54:01 -0700
Date:   Sat, 27 Mar 2021 17:54:01 -0700
Message-Id: <456329d36e8c188df5c234f3282595b630bf1470.1616892233.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <f6c3bf1ec9d6e36a36ed84534988014f2dd70035.1616636455.git.Thinh.Nguyen@synopsys.com>
References: <f6c3bf1ec9d6e36a36ed84534988014f2dd70035.1616636455.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2] usb: dwc3: Create helper function getting MDWIDTH
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
 Changes in v2:
 - Resend due to sending duplicate patches in its previous version
 - Rebased on top of Greg's usb-testing branch

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

base-commit: 24327c478b2fc17a01b21a4721f35f22a51fe12b
-- 
2.28.0

