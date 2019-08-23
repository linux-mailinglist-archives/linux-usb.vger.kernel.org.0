Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8D59A5F2
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 05:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404144AbfHWDPx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 23:15:53 -0400
Received: from gate.crashing.org ([63.228.1.57]:56344 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbfHWDPx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 23:15:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7N3FfEZ028509;
        Thu, 22 Aug 2019 22:15:42 -0500
Message-ID: <bc390967a9ac59e658ae79ba74a23a6ca898351b.camel@kernel.crashing.org>
Subject: [PATCH 1/2] usb: gadget: net2280: Move all "ll" registers in one
 structure
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     Guido Kiener <guido@kiener-muenchen.de>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Fri, 23 Aug 2019 13:15:41 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The split into multiple structures of the "ll" register bank is
impractical. It makes it hard to add ll_lfps_timers_2 which is
at offset 0x794, which is outside of the existing "lfps" structure
and would require us to add yet another one.

Instead, move all the "ll" registers into a single usb338x_ll_regs
structure, and add ll_lfps_timers_2 while at it. It will be used
in a subsequent patch.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/net2280.c | 28 ++++++++++---------------
 drivers/usb/gadget/udc/net2280.h |  3 ---
 include/linux/usb/usb338x.h      | 35 +++++++++++++++++++++++---------
 3 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index b6bbe2e448ba..e0191146ba22 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -2244,30 +2244,30 @@ static void usb_reinit_338x(struct net2280 *dev)
 	}
 
 	/* Hardware Defect and Workaround */
-	val = readl(&dev->ll_lfps_regs->ll_lfps_5);
+	val = readl(&dev->llregs->ll_lfps_5);
 	val &= ~(0xf << TIMER_LFPS_6US);
 	val |= 0x5 << TIMER_LFPS_6US;
-	writel(val, &dev->ll_lfps_regs->ll_lfps_5);
+	writel(val, &dev->llregs->ll_lfps_5);
 
-	val = readl(&dev->ll_lfps_regs->ll_lfps_6);
+	val = readl(&dev->llregs->ll_lfps_6);
 	val &= ~(0xffff << TIMER_LFPS_80US);
 	val |= 0x0100 << TIMER_LFPS_80US;
-	writel(val, &dev->ll_lfps_regs->ll_lfps_6);
+	writel(val, &dev->llregs->ll_lfps_6);
 
 	/*
 	 * AA_AB Errata. Issue 4. Workaround for SuperSpeed USB
 	 * Hot Reset Exit Handshake may Fail in Specific Case using
 	 * Default Register Settings. Workaround for Enumeration test.
 	 */
-	val = readl(&dev->ll_tsn_regs->ll_tsn_counters_2);
+	val = readl(&dev->llregs->ll_tsn_counters_2);
 	val &= ~(0x1f << HOT_TX_NORESET_TS2);
 	val |= 0x10 << HOT_TX_NORESET_TS2;
-	writel(val, &dev->ll_tsn_regs->ll_tsn_counters_2);
+	writel(val, &dev->llregs->ll_tsn_counters_2);
 
-	val = readl(&dev->ll_tsn_regs->ll_tsn_counters_3);
+	val = readl(&dev->llregs->ll_tsn_counters_3);
 	val &= ~(0x1f << HOT_RX_RESET_TS2);
 	val |= 0x3 << HOT_RX_RESET_TS2;
-	writel(val, &dev->ll_tsn_regs->ll_tsn_counters_3);
+	writel(val, &dev->llregs->ll_tsn_counters_3);
 
 	/*
 	 * Set Recovery Idle to Recover bit:
@@ -2276,10 +2276,10 @@ static void usb_reinit_338x(struct net2280 *dev)
 	 * - It is safe to set for all connection speeds; all chip revisions.
 	 * - R-M-W to leave other bits undisturbed.
 	 * - Reference PLX TT-7372
-	 */
-	val = readl(&dev->ll_chicken_reg->ll_tsn_chicken_bit);
+	*/
+	val = readl(&dev->llregs->ll_tsn_chicken_bit);
 	val |= BIT(RECOVERY_IDLE_TO_RECOVER_FMW);
-	writel(val, &dev->ll_chicken_reg->ll_tsn_chicken_bit);
+	writel(val, &dev->llregs->ll_tsn_chicken_bit);
 
 	INIT_LIST_HEAD(&dev->gadget.ep0->ep_list);
 
@@ -3669,12 +3669,6 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 							(base + 0x00b4);
 		dev->llregs = (struct usb338x_ll_regs __iomem *)
 							(base + 0x0700);
-		dev->ll_lfps_regs = (struct usb338x_ll_lfps_regs __iomem *)
-							(base + 0x0748);
-		dev->ll_tsn_regs = (struct usb338x_ll_tsn_regs __iomem *)
-							(base + 0x077c);
-		dev->ll_chicken_reg = (struct usb338x_ll_chi_regs __iomem *)
-							(base + 0x079c);
 		dev->plregs = (struct usb338x_pl_regs __iomem *)
 							(base + 0x0800);
 		usbstat = readl(&dev->usb->usbstat);
diff --git a/drivers/usb/gadget/udc/net2280.h b/drivers/usb/gadget/udc/net2280.h
index b65a797544d7..85d3ca1698ba 100644
--- a/drivers/usb/gadget/udc/net2280.h
+++ b/drivers/usb/gadget/udc/net2280.h
@@ -178,9 +178,6 @@ struct net2280 {
 	struct net2280_dep_regs		__iomem *dep;
 	struct net2280_ep_regs		__iomem *epregs;
 	struct usb338x_ll_regs		__iomem *llregs;
-	struct usb338x_ll_lfps_regs	__iomem *ll_lfps_regs;
-	struct usb338x_ll_tsn_regs	__iomem *ll_tsn_regs;
-	struct usb338x_ll_chi_regs	__iomem *ll_chicken_reg;
 	struct usb338x_pl_regs		__iomem *plregs;
 
 	struct dma_pool			*requests;
diff --git a/include/linux/usb/usb338x.h b/include/linux/usb/usb338x.h
index 7189e3387bf9..20020c1336d5 100644
--- a/include/linux/usb/usb338x.h
+++ b/include/linux/usb/usb338x.h
@@ -113,7 +113,10 @@ struct usb338x_ll_regs {
 	u32   ll_ltssm_ctrl1;
 	u32   ll_ltssm_ctrl2;
 	u32   ll_ltssm_ctrl3;
-	u32   unused[2];
+	u32   unused1;
+
+	/* 0x710 */
+	u32   unused2;
 	u32   ll_general_ctrl0;
 	u32   ll_general_ctrl1;
 #define     PM_U3_AUTO_EXIT                                     29
@@ -136,29 +139,41 @@ struct usb338x_ll_regs {
 	u32   ll_general_ctrl2;
 #define     SELECT_INVERT_LANE_POLARITY                         7
 #define     FORCE_INVERT_LANE_POLARITY                          6
+
+	/* 0x720 */
 	u32   ll_general_ctrl3;
 	u32   ll_general_ctrl4;
 	u32   ll_error_gen;
-} __packed;
+	u32   unused3;
+
+	/* 0x730 */
+	u32   unused4[4];
 
-struct usb338x_ll_lfps_regs {
-	/* offset 0x748 */
+	/* 0x740 */
+	u32   unused5[2];
 	u32   ll_lfps_5;
 #define     TIMER_LFPS_6US                                      16
 	u32   ll_lfps_6;
 #define     TIMER_LFPS_80US                                     0
-} __packed;
 
-struct usb338x_ll_tsn_regs {
-	/* offset 0x77C */
+	/* 0x750 */
+	u32   unused6[8];
+
+	/* 0x770 */
+	u32   unused7[3];
 	u32   ll_tsn_counters_2;
 #define     HOT_TX_NORESET_TS2                                  24
+
+	/* 0x780 */
 	u32   ll_tsn_counters_3;
 #define     HOT_RX_RESET_TS2                                    0
-} __packed;
+	u32   unused8[3];
 
-struct usb338x_ll_chi_regs {
-	/* offset 0x79C */
+	/* 0x790 */
+	u32   unused9;
+	u32   ll_lfps_timers_2;
+#define     LFPS_TIMERS_2_WORKAROUND_VALUE			0x084d
+	u32   unused10;
 	u32   ll_tsn_chicken_bit;
 #define     RECOVERY_IDLE_TO_RECOVER_FMW                        3
 } __packed;


