Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 093D511A14E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 03:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbfLKC0C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 21:26:02 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:33120 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727230AbfLKC0B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 21:26:01 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 586A5C0BB2;
        Wed, 11 Dec 2019 02:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576031161; bh=F4WtGHXeSe2dNwnpc2CsnY/H6ze1l7a+mon+9FETNaU=;
        h=Date:From:Subject:To:Cc:From;
        b=RTp9Hd1jpZwXO+OpXsdEIOI7kdUmsvwJTOhCfCwBDtnnj4sdviGmmvx8k/ZFka1+Q
         enry4Q4tH+pgMgxJ4xJAg5gDJiB0+ZalCpmnia92IfPWDrFh3Y6xZc19Y3otnEGweG
         r/Emv57harVe1t+0DrXA91XhA2zPnMvhvzqM87AinDtz/pxtNuu8Q0x44oCxOAVUmu
         sUcoXIg39iT10xg1GTS6PEeygtGBjm2HhtFd2JPlIuRlSuRaYcbeD4yKyPQpJu+YOH
         pJl2rV3Pzln5QY7FcNE1YOXWwRhVQJRimVVDEY30StvXl2gFjFSd4cuLGdhUitlDZJ
         2OxuSsP9avTdw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2B49FA005E;
        Wed, 11 Dec 2019 02:26:00 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 10 Dec 2019 18:26:00 -0800
Date:   Tue, 10 Dec 2019 18:26:00 -0800
Message-Id: <20c05d4e60c97b03314ede8d7f2d7c29b34f665f.1576028945.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2] usb: dwc3: gadget: Do link recovery for SS and SSP
To:     Felipe Balbi <balbi@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The controller always supports link recovery for device in SS and SSP.
Remove the speed limit check. Also, when the device is in RESUME or
RESET state, it means the controller received the resume/reset request.
The driver must send the link recovery to acknowledge the request. They
are valid states for the driver to send link recovery.

Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
Fixes: ee5cd41c9117 ("usb: dwc3: Update speed checks for SuperSpeedPlus")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2 -
  Added Fixes tags

 drivers/usb/dwc3/gadget.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a9aba716bf80..3dcdde9080f5 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1712,7 +1712,6 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 	u32			reg;
 
 	u8			link_state;
-	u8			speed;
 
 	/*
 	 * According to the Databook Remote wakeup request should
@@ -1722,16 +1721,13 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 	 */
 	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
 
-	speed = reg & DWC3_DSTS_CONNECTSPD;
-	if ((speed == DWC3_DSTS_SUPERSPEED) ||
-	    (speed == DWC3_DSTS_SUPERSPEED_PLUS))
-		return 0;
-
 	link_state = DWC3_DSTS_USBLNKST(reg);
 
 	switch (link_state) {
+	case DWC3_LINK_STATE_RESET:
 	case DWC3_LINK_STATE_RX_DET:	/* in HS, means Early Suspend */
 	case DWC3_LINK_STATE_U3:	/* in HS, means SUSPEND */
+	case DWC3_LINK_STATE_RESUME:
 		break;
 	default:
 		return -EINVAL;
-- 
2.11.0

