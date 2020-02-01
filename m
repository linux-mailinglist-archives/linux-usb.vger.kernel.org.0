Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6A814F588
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2020 01:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgBAA7X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 19:59:23 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:39774 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726264AbgBAA7W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 19:59:22 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90F5440195;
        Sat,  1 Feb 2020 00:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1580518762; bh=uGpipuytTO5b4imdpUVUtAyYcLl2bzSceakdLK1ldhs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=mUzWDEhedODZzS/oPSOBQOPijNY8P6cCax/R7VPZrsn8oqGjuiXuxoP18Mt2jZ6OP
         z1MYHgQ2bsvADsg7ZqU0n8wAhSG7xTvLBXlDI9/iGkBZ6ajZlbf2nKbQAc3C8o9fI5
         ndFOmdi0guk4In0YeEnw4tpHqd7EP0KYYToEIXKnXN/myvTynYIXbNmMM1InW+WMJW
         7Ni+KV19fkhzkRGz9R0nSDXVmG6FFJPilARSa66HEy2i3tqwWb4x/U3fzzLL24KlZ3
         9xMk3sBlwQUtGQm5tM/ENIOphDc0b4Vvg07XoKPCrmjyjSUCojmG/aZCaIbkc2Wknr
         IJWl3qDDUEZ7w==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 731F0A007C;
        Sat,  1 Feb 2020 00:59:21 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 31 Jan 2020 16:59:21 -0800
Date:   Fri, 31 Jan 2020 16:59:21 -0800
Message-Id: <2129c01baf47afc46c0d7d4a7567dff72193abc4.1576030839.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576030839.git.thinhn@synopsys.com>
References: <cover.1576030839.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RESEND PATCH v2 1/2] usb: dwc3: Fix GTXFIFOSIZ.TXFDEP macro name
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

