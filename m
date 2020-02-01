Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDDD14F565
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2020 01:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgBAAZy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 19:25:54 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:38086 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726319AbgBAAZy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 19:25:54 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E0303C0080;
        Sat,  1 Feb 2020 00:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1580516753; bh=7JZgtHNCURp2lEh6F4Zh8drxO8LLv1fpp3XCFPN/N/0=;
        h=Date:From:Subject:To:Cc:From;
        b=iuAOjkb6zHOUkrBSB4EAvlImCfxlJd8FbsMvCZ9lNN9WjRsSXNndxd2o4UvB2/3wC
         p0PgVU24RwBPYK9gUiq6WSlkqEs1lkoGEqNZuOzt/H8fU6ggm80QfNlTFmqnJm0XnM
         0XmuHvmvSfxn4IJtx9VAwnViRiftvMi0L0i5Iy6YDGfwNp1kTK4SJPzuwBVhO2kvj5
         Fng9pZyR//SDX3I+qgLXXLUwUYS/oxOqM3CkzXFUMkWfRq4mTLOjkHxJGrE7drZPTw
         rtSJF2KWZSzMJ2A9W1se/X3WM4BcXPSrVhAV+hCETQvbzLURtCyP0VfnZ9bGkpLKEN
         4opZ74gW6W9og==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4E1C3A007C;
        Sat,  1 Feb 2020 00:25:51 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 31 Jan 2020 16:25:50 -0800
Date:   Fri, 31 Jan 2020 16:25:50 -0800
Message-Id: <20c05d4e60c97b03314ede8d7f2d7c29b34f665f.1576028945.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RESEND PATCH v2] usb: dwc3: gadget: Do link recovery for SS and SSP
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

Resend note -
  This was on Felipe's next branch some time ago,
  but it was lost somehow.

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

