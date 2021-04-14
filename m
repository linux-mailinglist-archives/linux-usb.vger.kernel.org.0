Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B526035EA7A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 03:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbhDNBh4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 21:37:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45948 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229699AbhDNBhy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 21:37:54 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 97E9FC00CE;
        Wed, 14 Apr 2021 01:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618364254; bh=5qFiAqBrPQojzAgNsp+z408/XSQddac6y8k4c3HsMAQ=;
        h=Date:From:Subject:To:Cc:From;
        b=CnAVdWnGhebCLLzXjRHc4mbz+FEPLE3ANPUuDxNu86JQPRj+sNmLQIQQsfKFPDzHj
         065YYKrBwBaP83+lybj2X+IZet/PtIiQDgAyKSWzbjsjatgMygfo1CTAk2OPlbcogq
         1l9Qrt6Ltd1GyqS6pcVEH34QgUb+Krdi6vfVPTJWz/5N+5z5YTFIBwHjsdckQpqjA1
         vykglDfmN8FzFq4gaoHqHt8xcut+YKSaSEDwE6kyE59zY9hkmMD1HLr5TxI3tt+2+V
         xX7U7CsPX00l2YoBh6QHmvYyRbm1H1gp92irpHioy5EFe11tcXk7iPMZBPsClmMGR0
         V9uVNwD+ge5zQ==
Received: from lab-vbox (unknown [10.205.144.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 18D70A0096;
        Wed, 14 Apr 2021 01:37:28 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Tue, 13 Apr 2021 18:36:23 -0700
Date:   Tue, 13 Apr 2021 18:36:23 -0700
Message-Id: <1b784826dfee46adaa65c42d33934339d0c1f2a7.1618364095.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Check for disabled LPM quirk
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the device doesn't support LPM, make sure to disable the LPM
capability and don't advertise to the host that it supports it.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e1b04c976da5..509f01b1d830 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3484,6 +3484,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 	/* Enable USB2 LPM Capability */
 
 	if (!DWC3_VER_IS_WITHIN(DWC3, ANY, 194A) &&
+	    !dwc->usb2_lpm_disable &&
 	    (speed != DWC3_DSTS_SUPERSPEED) &&
 	    (speed != DWC3_DSTS_SUPERSPEED_PLUS)) {
 		reg = dwc3_readl(dwc->regs, DWC3_DCFG);
@@ -3510,6 +3511,12 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 
 		dwc3_gadget_dctl_write_safe(dwc, reg);
 	} else {
+		if (dwc->usb2_lpm_disable) {
+			reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+			reg &= ~DWC3_DCFG_LPM_CAP;
+			dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+		}
+
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 		reg &= ~DWC3_DCTL_HIRD_THRES_MASK;
 		dwc3_gadget_dctl_write_safe(dwc, reg);
@@ -3958,7 +3965,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	dwc->gadget->ssp_rate		= USB_SSP_GEN_UNKNOWN;
 	dwc->gadget->sg_supported	= true;
 	dwc->gadget->name		= "dwc3-gadget";
-	dwc->gadget->lpm_capable	= true;
+	dwc->gadget->lpm_capable	= !dwc->usb2_lpm_disable;
 
 	/*
 	 * FIXME We might be setting max_speed to <SUPER, however versions

base-commit: 401411bbc4e62bcbcc020c2c458ecb90843140a8
-- 
2.28.0

