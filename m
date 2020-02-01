Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9605714F589
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2020 01:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgBAA7a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 19:59:30 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:39786 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726264AbgBAA7a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 19:59:30 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5515940195;
        Sat,  1 Feb 2020 00:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1580518769; bh=CduqsnmUme2liYXzBBY/x8Qjzx3G26OxBHGIJCnJQ0k=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=GhMc3DSGdkz67dDQcAbgy+COHVQ4gwMI5UzkRj7VV5OJJreY8Ecn66KRoaHQ3l39f
         kxR9XGLPeZrM7/kNGw5Ie7/kCc3YrA6PErwQg2WB1Hd+HHILJyE157gIv27hJ7MSvw
         Yy29PWk8syGqeipnsA5CqgkOUjXacW0xjfbdlIulp+tTMEVgJJheppacO+QbyCcc5+
         Kck3yYfsWMD5DH7op1yh/nP3wf6cqznEEMVYtlEC56aUyTaXOMOFoJfrLRg9kgtug/
         GoaFAurV4gCi43apr0qQ+1Lf6oPNoTleMVEPWi7g3ygI3O4wbWJWz+K/fSKb1nH4ua
         JPHlkWLEcdRAA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id EECD2A00A2;
        Sat,  1 Feb 2020 00:59:27 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 31 Jan 2020 16:59:27 -0800
Date:   Fri, 31 Jan 2020 16:59:27 -0800
Message-Id: <7817e1cfdd341a957c4be94ddf3843ae83516f5a.1576030839.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576030839.git.thinhn@synopsys.com>
References: <cover.1576030839.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RESEND PATCH v2 2/2] usb: dwc3: gadget: Properly set maxpacket limit
To:     Felipe Balbi <balbi@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the calculation of max packet size limit for IN endpoints is
too restrictive. This prevents a matching of a capable hardware endpoint
during configuration. Below is the minimum recommended HW configuration
to support a particular endpoint setup from the databook:

For OUT endpoints, the databook recommended the minimum RxFIFO size to
be at least 3x MaxPacketSize + 3x setup packets size (8 bytes each) +
clock crossing margin (16 bytes).

For IN endpoints, the databook recommended the minimum TxFIFO size to be
at least 3x MaxPacketSize for endpoints that support burst. If the
endpoint doesn't support burst or when the device is operating in USB
2.0 mode, a minimum TxFIFO size of 2x MaxPacketSize is recommended.

Base on these recommendations, we can calculate the MaxPacketSize limit
of each endpoint. This patch revises the IN endpoint MaxPacketSize limit
and also sets the MaxPacketSize limit for OUT endpoints.

Reference: Databook 3.30a section 3.2.2 and 3.2.3

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2 -
  None

 drivers/usb/dwc3/core.h   |  4 ++++
 drivers/usb/dwc3/gadget.c | 52 +++++++++++++++++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 6a6baadcb697..0f019db5e125 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -309,6 +309,10 @@
 #define DWC3_GTXFIFOSIZ_TXFDEP(n)	((n) & 0xffff)
 #define DWC3_GTXFIFOSIZ_TXFSTADDR(n)	((n) & 0xffff0000)
 
+/* Global RX Fifo Size Register */
+#define DWC31_GRXFIFOSIZ_RXFDEP(n)	((n) & 0x7fff)	/* DWC_usb31 only */
+#define DWC3_GRXFIFOSIZ_RXFDEP(n)	((n) & 0xffff)
+
 /* Global Event Size Registers */
 #define DWC3_GEVNTSIZ_INTMASK		BIT(31)
 #define DWC3_GEVNTSIZ_SIZE(n)		((n) & 0xffff)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 5da266173146..3b3e6a655c6a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2207,7 +2207,6 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 {
 	struct dwc3 *dwc = dep->dwc;
 	int mdwidth;
-	int kbytes;
 	int size;
 
 	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
@@ -2223,17 +2222,17 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 	/* FIFO Depth is in MDWDITH bytes. Multiply */
 	size *= mdwidth;
 
-	kbytes = size / 1024;
-	if (kbytes == 0)
-		kbytes = 1;
-
 	/*
-	 * FIFO sizes account an extra MDWIDTH * (kbytes + 1) bytes for
-	 * internal overhead. We don't really know how these are used,
-	 * but documentation say it exists.
+	 * To meet performance requirement, a minimum TxFIFO size of 3x
+	 * MaxPacketSize is recommended for endpoints that support burst and a
+	 * minimum TxFIFO size of 2x MaxPacketSize for endpoints that don't
+	 * support burst. Use those numbers and we can calculate the max packet
+	 * limit as below.
 	 */
-	size -= mdwidth * (kbytes + 1);
-	size /= kbytes;
+	if (dwc->maximum_speed >= USB_SPEED_SUPER)
+		size /= 3;
+	else
+		size /= 2;
 
 	usb_ep_set_maxpacket_limit(&dep->endpoint, size);
 
@@ -2251,8 +2250,39 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
 {
 	struct dwc3 *dwc = dep->dwc;
+	int mdwidth;
+	int size;
+
+	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+
+	/* MDWIDTH is represented in bits, convert to bytes */
+	mdwidth /= 8;
 
-	usb_ep_set_maxpacket_limit(&dep->endpoint, 1024);
+	/* All OUT endpoints share a single RxFIFO space */
+	size = dwc3_readl(dwc->regs, DWC3_GRXFIFOSIZ(0));
+	if (dwc3_is_usb31(dwc))
+		size = DWC31_GRXFIFOSIZ_RXFDEP(size);
+	else
+		size = DWC3_GRXFIFOSIZ_RXFDEP(size);
+
+	/* FIFO depth is in MDWDITH bytes */
+	size *= mdwidth;
+
+	/*
+	 * To meet performance requirement, a minimum recommended RxFIFO size
+	 * is defined as follow:
+	 * RxFIFO size >= (3 x MaxPacketSize) +
+	 * (3 x 8 bytes setup packets size) + (16 bytes clock crossing margin)
+	 *
+	 * Then calculate the max packet limit as below.
+	 */
+	size -= (3 * 8) + 16;
+	if (size < 0)
+		size = 0;
+	else
+		size /= 3;
+
+	usb_ep_set_maxpacket_limit(&dep->endpoint, size);
 	dep->endpoint.max_streams = 15;
 	dep->endpoint.ops = &dwc3_gadget_ep_ops;
 	list_add_tail(&dep->endpoint.ep_list,
-- 
2.11.0

