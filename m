Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21B2111A14D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 03:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfLKCZ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 21:25:56 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:33114 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727230AbfLKCZ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 21:25:56 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 66F51C0BBA;
        Wed, 11 Dec 2019 02:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576031155; bh=uGpipuytTO5b4imdpUVUtAyYcLl2bzSceakdLK1ldhs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=C4rWLMvVHOEF2s4ghSfkGCR3/upqOkGIr9iwGfWy2ab4bHUtLoq6ktIZNccQ2aMm/
         tx0tRnorjR8gae5mweM1mOUkSCjqiJH2GbRFonDo43FHWIKZz9wTYEUvg2Otz6dcs5
         huiCzuHl3dgz1TaKqWa3yHY2y02SmC6z8pzknA/9AJWN5ZGNqc/FvY3Wruv0qefbUI
         2w6Wadg3dGBjqWs/MikXqeIUfrnjdoclXwpqmQFm0EL/UQr4/5Vcu2uwrMiK6LCt3R
         RfpbVotN64qZnTWfjWG8XFp7+YDdz8zv2VuTe1NN/5KlE6T3IyB9i94HFT4jdXv3Lq
         U2HeQ+D/LGUAg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1C8B2A0066;
        Wed, 11 Dec 2019 02:25:54 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 10 Dec 2019 18:25:54 -0800
Date:   Tue, 10 Dec 2019 18:25:54 -0800
Message-Id: <2129c01baf47afc46c0d7d4a7567dff72193abc4.1576030839.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576030839.git.thinhn@synopsys.com>
References: <cover.1576030839.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 1/2] usb: dwc3: Fix GTXFIFOSIZ.TXFDEP macro name
To:     Felipe Balbi <balbi@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Change the macro name DWC3_GTXFIFOSIZ_TXFDEF to DWC3_GTXFIFOSIZ_TXFDEP
to match with the register name GTXFIFOSIZ.TXFDEP.

Fixes: 457e84b6624b ("usb: dwc3: gadget: dynamically re-size TxFifos")
Fixes: 0cab8d26d6e5 ("usb: dwc3: Update DWC_usb31 GTXFIFOSIZ reg fields")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2 -
  Added Fixes tags

 drivers/usb/dwc3/core.h   | 4 ++--
 drivers/usb/dwc3/gadget.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1c8b349379af..6a6baadcb697 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -305,8 +305,8 @@
 
 /* Global TX Fifo Size Register */
 #define DWC31_GTXFIFOSIZ_TXFRAMNUM	BIT(15)		/* DWC_usb31 only */
-#define DWC31_GTXFIFOSIZ_TXFDEF(n)	((n) & 0x7fff)	/* DWC_usb31 only */
-#define DWC3_GTXFIFOSIZ_TXFDEF(n)	((n) & 0xffff)
+#define DWC31_GTXFIFOSIZ_TXFDEP(n)	((n) & 0x7fff)	/* DWC_usb31 only */
+#define DWC3_GTXFIFOSIZ_TXFDEP(n)	((n) & 0xffff)
 #define DWC3_GTXFIFOSIZ_TXFSTADDR(n)	((n) & 0xffff0000)
 
 /* Global Event Size Registers */
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 3dcdde9080f5..5da266173146 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2216,9 +2216,9 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 
 	size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1));
 	if (dwc3_is_usb31(dwc))
-		size = DWC31_GTXFIFOSIZ_TXFDEF(size);
+		size = DWC31_GTXFIFOSIZ_TXFDEP(size);
 	else
-		size = DWC3_GTXFIFOSIZ_TXFDEF(size);
+		size = DWC3_GTXFIFOSIZ_TXFDEP(size);
 
 	/* FIFO Depth is in MDWDITH bytes. Multiply */
 	size *= mdwidth;
-- 
2.11.0

