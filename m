Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89BED1A4D6C
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2020 04:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgDKCOD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Apr 2020 22:14:03 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36604 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726671AbgDKCOD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Apr 2020 22:14:03 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C3C41C00A7;
        Sat, 11 Apr 2020 02:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1586571242; bh=3s6KEae8ikk5m3F3Mivhp+2U9IN3tkrxAT3oV2HVrng=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=l8ag8eJW828jXYdWSpvH0zbA3e6mPA/ChWVmxRd3A1QBchzjBg9V8WVd7/84eztnc
         XUPfmzUmn9kh7O13DwGfOIjt9nxpJFtKVijw81HbG4Q3bNxsTFp3z/1Y8X6zi86PEq
         Ow4s/Iy38FqzqIyeFB4RqkSNu2zxTdma2VLNcZkdo6zjAjEUK/vDZ1aOjI+nfDU9J+
         TQJtsa3HZfnGnEsourYVJMMGBl5ZZld44qTlLDXgD6TL+Bnvv9TqZPSccWsla6V0Ra
         RE9f0kcLnGdckIgoX9vRgv91U+C8anbgAblvEYz99HUnkDsZVHx4PWm/ivSkFhWEOI
         tcyNSyT3jB0JA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 94B6BA007B;
        Sat, 11 Apr 2020 02:14:01 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 10 Apr 2020 19:14:01 -0700
Date:   Fri, 10 Apr 2020 19:14:01 -0700
Message-Id: <8a8007221ff27eeeb4cb2e7042496fbe3e7a6527.1586570825.git.thinhn@synopsys.com>
In-Reply-To: <cover.1586570825.git.thinhn@synopsys.com>
References: <cover.1586570825.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/2] usb: dwc3: Get MDWIDTH for DWC_usb32
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb32 supports MDWIDTH value larger than 255 and up to 1023. The
field HWPARAMS6[9:8] stores the upper 2-bit values of the DWC_usb32's
MDWIDTH. Check that parameter and properly get the MDWIDTH for
DWC_usb32.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h    |  3 +++
 drivers/usb/dwc3/debugfs.c | 14 ++++++++++++--
 drivers/usb/dwc3/gadget.c  |  7 +++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 3b3b751f23ae..2fba02985715 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -366,6 +366,9 @@
 #define DWC3_GHWPARAMS6_SRPSUPPORT		BIT(10)
 #define DWC3_GHWPARAMS6_EN_FPGA			BIT(7)
 
+/* DWC_usb32 only */
+#define DWC3_GHWPARAMS6_MDWIDTH(n)		((n) & (0x3 << 8))
+
 /* Global HWPARAMS7 Register */
 #define DWC3_GHWPARAMS7_RAM1_DEPTH(n)	((n) & 0xffff)
 #define DWC3_GHWPARAMS7_RAM2_DEPTH(n)	(((n) >> 16) & 0xffff)
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 4fe8b1e1485c..6d9de334e46a 100644
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
+	if (DWC3_IP_IS(DWC32))
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
+	if (DWC3_IP_IS(DWC32))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+
+	val *= mdwidth;
 	val >>= 3;
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index b3b8db9db319..880cb00da706 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2010,6 +2010,8 @@ static void dwc3_gadget_setup_nump(struct dwc3 *dwc)
 
 	ram2_depth = DWC3_GHWPARAMS7_RAM2_DEPTH(dwc->hwparams.hwparams7);
 	mdwidth = DWC3_GHWPARAMS0_MDWIDTH(dwc->hwparams.hwparams0);
+	if (DWC3_IP_IS(DWC32))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
 
 	nump = ((ram2_depth * mdwidth / 8) - 24 - 16) / 1024;
 	nump = min_t(u32, nump, 16);
@@ -2294,6 +2296,9 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 	int size;
 
 	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+	if (DWC3_IP_IS(DWC32))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
+
 	/* MDWIDTH is represented in bits, we need it in bytes */
 	mdwidth /= 8;
 
@@ -2338,6 +2343,8 @@ static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
 	int size;
 
 	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+	if (DWC3_IP_IS(DWC32))
+		mdwidth += DWC3_GHWPARAMS6_MDWIDTH(dwc->hwparams.hwparams6);
 
 	/* MDWIDTH is represented in bits, convert to bytes */
 	mdwidth /= 8;
-- 
2.11.0

