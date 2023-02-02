Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD68D68810C
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbjBBPGH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjBBPF6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:05:58 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444449218E
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350339; x=1706886339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yU4VNxdbrt4ELJlgWza+xlTgWqZ+P0dgSErXeZeWRzw=;
  b=dsMFyVSGocmSEJ+kkEmbX9rgmv5Me7YTs6lsE9UTFRltKr/vcmc6NiXS
   OedLYAQmRCfMOtSRwGYv7P5M6V0CjEXBHknL52asjRBr4x6/j0QU8yOf/
   FS6KG76iKgoviDvVk5MaPesDjhZTWUgoTPGOIZQC3aYvZpBYYQWgBsC3W
   fT92Xbo1cXbZFLm6jZkCHFVRbJRlbB2GU/lB7WYWo+LClw7Skia/x+KTZ
   NI3cAGmemKCuAQfUJXo2vZMFmaGIyzsKib+AoPX6j+oRXy4fYl9Zy3qQ6
   XxwZPliuN2EdY7eCXImxr8m+34k/oL+tm0W9HTkdKoTxarNiPcmCwWN3V
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327113991"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327113991"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905717"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905717"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:03:54 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/11] xhci: add helpers for enabling and disabling interrupters
Date:   Thu,  2 Feb 2023 17:04:58 +0200
Message-Id: <20230202150505.618915-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
References: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Simple helpers to set and clear the IE (interrupter enable) bit
for an interrupter.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8dc3f2c00577..6183ce8574b1 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -292,6 +292,32 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 		xhci_info(xhci, "Fault detected\n");
 }
 
+static int xhci_enable_interrupter(struct xhci_interrupter *ir)
+{
+	u32 iman;
+
+	if (!ir || !ir->ir_set)
+		return -EINVAL;
+
+	iman = readl(&ir->ir_set->irq_pending);
+	writel(ER_IRQ_ENABLE(iman), &ir->ir_set->irq_pending);
+
+	return 0;
+}
+
+static int xhci_disable_interrupter(struct xhci_interrupter *ir)
+{
+	u32 iman;
+
+	if (!ir || !ir->ir_set)
+		return -EINVAL;
+
+	iman = readl(&ir->ir_set->irq_pending);
+	writel(ER_IRQ_DISABLE(iman), &ir->ir_set->irq_pending);
+
+	return 0;
+}
+
 #ifdef CONFIG_USB_PCI
 /*
  * Set up MSI
@@ -610,7 +636,6 @@ static int xhci_init(struct usb_hcd *hcd)
 
 /*-------------------------------------------------------------------------*/
 
-
 static int xhci_run_finished(struct xhci_hcd *xhci)
 {
 	struct xhci_interrupter *ir = xhci->interrupter;
@@ -629,8 +654,7 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	writel(temp, &xhci->op_regs->command);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable primary interrupter");
-	temp = readl(&ir->ir_set->irq_pending);
-	writel(ER_IRQ_ENABLE(temp), &ir->ir_set->irq_pending);
+	xhci_enable_interrupter(ir);
 
 	if (xhci_start(xhci)) {
 		xhci_halt(xhci);
@@ -734,6 +758,7 @@ static void xhci_stop(struct usb_hcd *hcd)
 {
 	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_interrupter *ir = xhci->interrupter;
 
 	mutex_lock(&xhci->mutex);
 
@@ -770,8 +795,7 @@ static void xhci_stop(struct usb_hcd *hcd)
 			"// Disabling event ring interrupts");
 	temp = readl(&xhci->op_regs->status);
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-	temp = readl(&xhci->interrupter->ir_set->irq_pending);
-	writel(ER_IRQ_DISABLE(temp), &xhci->interrupter->ir_set->irq_pending);
+	xhci_disable_interrupter(ir);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
@@ -1227,8 +1251,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
 		temp = readl(&xhci->op_regs->status);
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-		temp = readl(&xhci->interrupter->ir_set->irq_pending);
-		writel(ER_IRQ_DISABLE(temp), &xhci->interrupter->ir_set->irq_pending);
+		xhci_disable_interrupter(xhci->interrupter);
 
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
-- 
2.25.1

