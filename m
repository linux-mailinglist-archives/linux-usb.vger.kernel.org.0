Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0871AE22E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2019 03:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403923AbfIJB6f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Sep 2019 21:58:35 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:35452 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726903AbfIJB6f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Sep 2019 21:58:35 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D51CEC0D80;
        Tue, 10 Sep 2019 01:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1568080714; bh=eXAep5+eUkqEm1xwkG0TK1QBBzo3H0ry2NbsVCJXhCE=;
        h=Date:In-Reply-To:References:From:Subject:To:CC:From;
        b=bd9MXGbyT2ypvZokK+gO1M4M2cvd13/eHK5rvs3C4Rtl03KfTp0SI/Xcc7GdeMIfi
         jGgOHToR+dU+yYBb1ok77s4AfSYF8fJamHYytiOC3FRJWkXfwyquJQbNbYVrj50MlW
         iXxTBMShQ3L02AEjT5GhHGIa8E/eZms4I2nca1Plj7KxY6mCId69DzEaARbcHqZKgT
         umOqWc3aON/+s56+/k0KjJdrX5D73InTb8tvNOPInv4tA76ex3tQ+0lhvKCMz8MQ7z
         yni06lbuo7CKEZz/8A5adLDOLkxY4Or3W8AVMjRj+hdq9yRCiO5yJ1nJc0t9qU+hlz
         uCRPfApdfDMYw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id B6196A005A;
        Tue, 10 Sep 2019 01:58:34 +0000 (UTC)
Received: from US01WEHTC1.internal.synopsys.com (10.12.239.236) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 9 Sep 2019 18:58:34 -0700
Received: from te-lab16 (10.13.184.19) by us01wehtc1.internal.synopsys.com
 (10.12.239.236) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 9 Sep
 2019 18:58:32 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 09 Sep 2019 18:58:32
 -0700
Date:   Mon, 9 Sep 2019 18:58:32 -0700
Message-ID: <e5c791b5514a25c1a84f53ac5360d149b26b1cbc.1568080486.git.thinhn@synopsys.com>
In-Reply-To: <47eb7d52f0e361d64547460b45e48fcc87f13ece.1568080486.git.thinhn@synopsys.com>
References: <47eb7d52f0e361d64547460b45e48fcc87f13ece.1568080486.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/2] usb: dwc3: gadget: Properly set maxpacket limit
To:     Felipe Balbi <balbi@kernel.org>, <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
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
index 292e5e672868..cbda3bb4c1c0 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2205,7 +2205,6 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 {
 	struct dwc3 *dwc = dep->dwc;
 	int mdwidth;
-	int kbytes;
 	int size;
 
 	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
@@ -2221,17 +2220,17 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
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
 
@@ -2249,8 +2248,39 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
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

