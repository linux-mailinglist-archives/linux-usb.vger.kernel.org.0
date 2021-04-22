Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90F6368982
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 01:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237141AbhDVXwO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 19:52:14 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46238 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231605AbhDVXwN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 19:52:13 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 09F0FC0551;
        Thu, 22 Apr 2021 23:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619135498; bh=5pCWckvumA29Ypm9Ddue9yy1WxqOZGzda1GKqNPbW4A=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=OskTcISrzXz6WEip85v6rk6ldR0ghpjFOaWIldW2LkvRn48q9t68Mc5FKFZNsv41h
         NRUhX+OukGIerovQ/6hxHtUFvsw7Tuo8KM//6ZX0v9dAhmH/qJUJCVZGqAPWO6W3AX
         3poRwTMHkLSnuaTlnGLke09hB7mBsUcj5LlvlDfZVa/A+r9JSa/CC2vSUlqCADxMLU
         hbWYtMCpp9BlajxrMRvhndaAUS+8XfSpMyKNg8MJ31Vf2vSe1DioEzEZmNvfDq2Xor
         iU9lTbkGRNiodFpMOXBgSZzg7Beho7s+mK7D49aSq6m33T6Ljo9Ff027ugTfYA/eR3
         4uDJQwOEmCnMg==
Received: from lab-vbox (unknown [10.205.129.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 89DEBA007C;
        Thu, 22 Apr 2021 23:51:36 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 22 Apr 2021 16:51:36 -0700
Date:   Thu, 22 Apr 2021 16:51:36 -0700
Message-Id: <f76cc4a9c8c4ab325f5babe03c57b039166360b0.1619134559.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1619134559.git.Thinh.Nguyen@synopsys.com>
References: <cover.1619134559.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/2] usb: dwc3: Capture new capability register GHWPARAMS9
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb32 introduces a new HW capability register GHWPARAMS9. Capture
this in the dwc->hwparams.hwparams9 field.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.c | 3 +++
 drivers/usb/dwc3/core.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 2f118ad43571..b6e53d8212cd 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -570,6 +570,9 @@ static void dwc3_cache_hwparams(struct dwc3 *dwc)
 	parms->hwparams6 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS6);
 	parms->hwparams7 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS7);
 	parms->hwparams8 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS8);
+
+	if (DWC3_IP_IS(DWC32))
+		parms->hwparams9 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS9);
 }
 
 static int dwc3_core_ulpi_init(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 7e3afa5378e8..b678200cc51e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -143,6 +143,7 @@
 #define DWC3_GHWPARAMS8		0xc600
 #define DWC3_GUCTL3		0xc60c
 #define DWC3_GFLADJ		0xc630
+#define DWC3_GHWPARAMS9		0xc680
 
 /* Device Registers */
 #define DWC3_DCFG		0xc700
@@ -857,6 +858,7 @@ struct dwc3_hwparams {
 	u32	hwparams6;
 	u32	hwparams7;
 	u32	hwparams8;
+	u32	hwparams9;
 };
 
 /* HWPARAMS0 */
-- 
2.28.0

