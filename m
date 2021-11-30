Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B5A462ABD
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 03:53:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbhK3C4g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 21:56:36 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43350 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232382AbhK3C4g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Nov 2021 21:56:36 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E655241978;
        Tue, 30 Nov 2021 02:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1638240798; bh=NR68YcFC/G1PMLTYpZlr/czb0Au18DhrE9qSEPqOMiM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=B1A/Bou4ckHqjFOtAF2sRrwuEK8RZ2dYkU26+THuxf7Qxkk+oqOsZBkFU7Hfyiiz8
         eRLcQCx3It/Jug3vADjR5fl9QZVOdCLKU+ybJcDPmzQUxl9Sc9Q6l5f7Fd2c0OumlC
         QoZ1IslyJfV9bQ0HSWRysO55QHoA9QFcurggtf2X3wD7JSrmDWXqcuXcuW4xYBBCFn
         WEUIY/OIWaeY7q0WssHLOY9ZwYXeDCAYAhmZbJfDQZC8zxxTa2xh/KZPU17+yxJZjq
         D3WSeniw8yCugkbP2cgCA/LQfnHB86RNlej3+1nnOXQBtLhGSRxMsfSL0Gsi8UQrN3
         EyBB44m93Af6Q==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id C254EA005F;
        Tue, 30 Nov 2021 02:53:16 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Mon, 29 Nov 2021 18:53:16 -0800
Date:   Mon, 29 Nov 2021 18:53:16 -0800
Message-Id: <997d9ebf38c6bba920d4ee77bd8c77bf81978a55.1638240306.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1638240306.git.Thinh.Nguyen@synopsys.com>
References: <cover.1638240306.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/3] usb: dwc3: gadget: Ignore Update Transfer cmd params
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The controller doesn't check for Update Transfer command parameters
DEPCMDPAR{0,1,2}. Writing to these registers is unnecessary. Ignoring
this improves performance slightly by removing the register write
delay.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 00b3f19c4d3e..f66baaef8a40 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -331,9 +331,17 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 		}
 	}
 
-	dwc3_writel(dep->regs, DWC3_DEPCMDPAR0, params->param0);
-	dwc3_writel(dep->regs, DWC3_DEPCMDPAR1, params->param1);
-	dwc3_writel(dep->regs, DWC3_DEPCMDPAR2, params->param2);
+	/*
+	 * For some commands such as Update Transfer command, DEPCMDPARn
+	 * registers are reserved. Since the driver often sends Update Transfer
+	 * command, don't write to DEPCMDPARn to avoid register write delays and
+	 * improve performance.
+	 */
+	if (DWC3_DEPCMD_CMD(cmd) != DWC3_DEPCMD_UPDATETRANSFER) {
+		dwc3_writel(dep->regs, DWC3_DEPCMDPAR0, params->param0);
+		dwc3_writel(dep->regs, DWC3_DEPCMDPAR1, params->param1);
+		dwc3_writel(dep->regs, DWC3_DEPCMDPAR2, params->param2);
+	}
 
 	/*
 	 * Synopsys Databook 2.60a states in section 6.3.2.5.6 of that if we're
-- 
2.28.0

