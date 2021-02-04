Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A8530EB7E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 05:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhBDEPk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 23:15:40 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37244 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229698AbhBDEPj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 23:15:39 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D116BC0138;
        Thu,  4 Feb 2021 04:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612412078; bh=nFngM0SGFZzW731mlmbhZN+uz8CWZy82SyClT/UDSVc=;
        h=Date:From:Subject:To:Cc:From;
        b=alXyPmPNqXpASC1PhFHEUrpgrFhtLm10RB4vpC0YV6WMOpWXOVn8nf4IF/rhTzklQ
         +saXo9cDaGA6AvaBp7DWuKV/7w7SLrwj2xcCEUe5x5t1fBGlBgYdxUi9CHCYiWd5vI
         13/mFFN8CnwDzVtdCbcUn3fVoL2l+1hn2QZwhlr2qE/xkWVno3yQ+l1mKny52R4MAd
         Sxcl6JRXUdY3upbmrWRSNnGD1HfKMmOfFbreeKkdaD7s57D0bGvXQVEaGyOcFCnFBI
         moMNp2KFQw0S9Zvqy6lQp1QFHuCLfgO0+zW8K4lOjU/+SzBC9w8hQcoLqKRGSWg9he
         JY8rkIdNnjm8w==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A4968A0068;
        Thu,  4 Feb 2021 04:14:37 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 03 Feb 2021 20:14:37 -0800
Date:   Wed, 03 Feb 2021 20:14:37 -0800
Message-Id: <7077bb0f5691732b9814ea76d38ae8e9312a61f5.1612412038.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Remove check for bounded driver
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The check for bounded gadget driver in dwc3_gadget_start() was to
prevent going through the initialization again without any cleanup. With
a recent update, the UDC framework guarantees this won't happen while
the UDC is started. Also, this check doesn't prevent requesting threaded
irq to the same dev_id, which will mess up the irq freeing logic. Let's
remove it.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
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

base-commit: d021e0694d77ee3cdc5d3fca2c8d53ae7575499a
-- 
2.28.0

