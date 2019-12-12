Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5251911C394
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbfLLCuE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:50:04 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:38200 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727908AbfLLCuD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:50:03 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1462BC000E;
        Thu, 12 Dec 2019 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576119003; bh=R58ClqTzrKN7s9bi7xmaBqE5GOCm/2PDpQJMKv4pR/w=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=b/PuLrUP51gyzxaVw9u7M8enJGR40C0Aluiklzyk+KxaN4lQkAB1WMjJfUDZtbfgX
         3Q4XX2TCEmTsrxvRlgJWd/PYp9zSRnXnBARAph7OroogDfFO9++X93gppaLt7rYY6E
         Nmde3t+U4+DNnoGiv7/G8MeV+HQs0y+YZZJVl9xxkdob4F7Q+jAyvj3+1sSAaLuID0
         pVt97VjldcSeHx7VLxbJ2z4PTwj9OLk8G7t5iRqF9cOME4dt5kChCb/KGK808kfYpL
         Xd9irNXWHcY8qdPx/SU6rF0ky80pI4yN1OGgERcEG2+3ksmTs1KC/p7bGZwm6q/1Yv
         6G+lBDTr6btEQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A7FC0A005E;
        Thu, 12 Dec 2019 02:50:01 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:50:01 -0800
Date:   Wed, 11 Dec 2019 18:50:01 -0800
Message-Id: <26d33a2b42b350e6ac751d6179a8b5f9ce333c5b.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 10/14] usb: dwc3: Update HWPARAMS0.MDWIDTH for DWC_usb32
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb32 supports MDWIDTH larger than 255 and up to 1023 (10 bit
value). The field HWPARAMS6[9:8] field is used to store the upper 2-bit
values of the MDWIDTH. This patch checks that param and properly get the
MDWIDTH for DWC_usb32.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h    |  1 +
 drivers/usb/dwc3/debugfs.c | 14 ++++++++++++--
 drivers/usb/dwc3/gadget.c  |  7 +++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 8e729d4cd5bd..bd446dca0869 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -363,6 +363,7 @@
 #define DWC3_GHWPARAMS6_HNPSUPPORT		BIT(11)
 #define DWC3_GHWPARAMS6_SRPSUPPORT		BIT(10)
 #define DWC3_GHWPARAMS6_EN_FPGA			BIT(7)
+#define DWC3_GHWPARAMS6_MDWIDTH(n)		((n) & (0x3 << 8)) /* DWC_usb32 only */
 
 /* Global HWPARAMS7 Register */
 #define DWC3_GHWPARAMS7_RAM1_DEPTH(n)	((n) & 0xffff)
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 4fe8b1e1485c..7610f51e1f82 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -635,13 +635,18 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	struct dwc3_ep		*dep = s->private;
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
+	int			mdwidth;
 	u32			val;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXFIFO);
 
 	/* Convert to bytes */
-	val *= DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+	if (dwc3_is_usb32(dwc))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+
+	val *= mdwidth;
 	val >>= 3;
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
@@ -654,13 +659,18 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	struct dwc3_ep		*dep = s->private;
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
+	int			mdwidth;
 	u32			val;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
 
 	/* Convert to bytes */
-	val *= DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+	if (dwc3_is_usb32(dwc))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+
+	val *= mdwidth;
 	val >>= 3;
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index d56feea01066..569be19c84d3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1934,6 +1934,8 @@ static void dwc3_gadget_setup_nump(struct dwc3 *dwc)
 
 	ram2_depth = DWC3_GHWPARAMS7_RAM2_DEPTH(dwc->hwparams.hwparams7);
 	mdwidth = DWC3_GHWPARAMS0_MDWIDTH(dwc->hwparams.hwparams0);
+	if (dwc3_is_usb32(dwc))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
 
 	nump = ((ram2_depth * mdwidth / 8) - 24 - 16) / 1024;
 	nump = min_t(u32, nump, 16);
@@ -2271,6 +2273,9 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 	int size;
 
 	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+	if (dwc3_is_usb32(dwc))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+
 	/* MDWIDTH is represented in bits, we need it in bytes */
 	mdwidth /= 8;
 
@@ -2315,6 +2320,8 @@ static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
 	int size;
 
 	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+	if (dwc3_is_usb32(dwc))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
 
 	/* MDWIDTH is represented in bits, convert to bytes */
 	mdwidth /= 8;
-- 
2.11.0

