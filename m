Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDCC310885
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 10:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhBEJ4v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 04:56:51 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54924 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230263AbhBEJyt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 04:54:49 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9D477402A6;
        Fri,  5 Feb 2021 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612518829; bh=ugFrW0wnZy7U60WArYo320RjNLHVD8Ny4534o7jnUg8=;
        h=Date:From:Subject:To:Cc:From;
        b=Kx7skKXcr0tJ1LLYjlmMW9E8bi4h+0HcSpXW7wVg8+C7783AewhxxX0m4PXf5HVZg
         2MmJ7lmWf9bRKezHPdEkcnc8Nmkk/X2M/2Rt/zi3ksn7UcNmdzIC0InRFt0K5HED/z
         iOSoJmpFMurC+NzYDSLt14UzJcRVeubkGGSNAqCIM7AJlt9mqn8zMc2fBtNzjdgBPr
         YVwgB/HMhf/MWEenLexPOmQ68FXozwEo9nt0U2Vo4rU/PsQYCjJhWDdhXdIpSZFOmV
         1zYuMGgjAMDKA6SwslByB/fSkTxQmfqnWHL9p/9NmcJ8thuDaccXJzBUKJ+bW7hvng
         d4ih8UGkgXASA==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3D3E3A0099;
        Fri,  5 Feb 2021 09:53:47 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 05 Feb 2021 01:53:47 -0800
Date:   Fri, 05 Feb 2021 01:53:47 -0800
Message-Id: <ccc90f316cf78bb5f7d46d3fd84f4c7f2c3020b1.1612518764.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2] usb: dwc3: gadget: Remove check for bounded driver
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The check for bounded gadget driver in dwc3_gadget_start() was to
prevent going through the initialization again without any cleanup. The
recent commit 49d08cfc7830 ("usb: udc: core: Introduce started state")
updated the UDC framework and guarantees this won't happen while the UDC
is started. Also, this check doesn't prevent requesting threaded irq to
the same dev_id, which will mess up the irq freeing logic. Let's remove
it.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v2:
- Provide reference to the recent UDC framework update

 drivers/usb/dwc3/gadget.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 86f257f12d45..6a18e822fa98 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2370,7 +2370,7 @@ static int dwc3_gadget_start(struct usb_gadget *g,
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
 	unsigned long		flags;
-	int			ret = 0;
+	int			ret;
 	int			irq;
 
 	irq = dwc->irq_gadget;
@@ -2379,29 +2379,14 @@ static int dwc3_gadget_start(struct usb_gadget *g,
 	if (ret) {
 		dev_err(dwc->dev, "failed to request irq #%d --> %d\n",
 				irq, ret);
-		goto err0;
+		return ret;
 	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	if (dwc->gadget_driver) {
-		dev_err(dwc->dev, "%s is already bound to %s\n",
-				dwc->gadget->name,
-				dwc->gadget_driver->driver.name);
-		ret = -EBUSY;
-		goto err1;
-	}
-
 	dwc->gadget_driver	= driver;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	return 0;
-
-err1:
-	spin_unlock_irqrestore(&dwc->lock, flags);
-	free_irq(irq, dwc);
-
-err0:
-	return ret;
 }
 
 static void __dwc3_gadget_stop(struct dwc3 *dwc)

base-commit: 23e32a595e115c09152488aa0508539e6f6a4237
-- 
2.28.0

