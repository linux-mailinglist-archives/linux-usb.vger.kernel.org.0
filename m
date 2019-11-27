Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA4CA10C02A
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 23:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbfK0WYn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 17:24:43 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:34734 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726947AbfK0WYn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Nov 2019 17:24:43 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 934C1C00A8;
        Wed, 27 Nov 2019 22:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1574893482; bh=5OEllFU4lJk8PxA3Ux/t5TE/IZsT/XGdK2+ZpCv8T+M=;
        h=Date:From:Subject:To:Cc:From;
        b=BPRxg78gEjtnASIpWg5ljnV4edXB+YyulObO1JfbeLNlhYaJ6JyTg2i6qkuKnM9er
         F/4gMK5IK1Cf9qHnRaeKY0U23X6+J93twJBNsvPMlzKaM9JobV/x8ZINUryHwdxzpy
         ZGzzSLsqjMZ83WiVtrxZSFuhL1iN6wBPvbbX0Hyrf1fa0bsS8Rr2WDsdk9mWtNV3bH
         PSmQVHLOjQD4+EAGeiVaXzq62bo+qFiKEk+hRwlHNf+DfAHnqQaBL9qvL6olbggP5d
         lxmPHNc21brlKs0/awZG9BNXAXFWeMA1zEGWpjfR2R+ekHBI0cbg2qAthhmoAPgEud
         H3e69AxiFuZsw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3D94DA007C;
        Wed, 27 Nov 2019 22:24:41 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 27 Nov 2019 14:24:40 -0800
Date:   Wed, 27 Nov 2019 14:24:40 -0800
Message-Id: <d120fc57ba8836df3f1dc597335499e2233aef53.1574893374.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Do link recovery for SS and SSP
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The controller always supports link recovery for device in SS and SSP.
Remove the speed limit check. Also, when the device is in RESUME or
RESET state, it means the controller received the resume/reset request.
The driver must send the link recovery to acknowledge the request. They
are valid states for the driver to send link recovery.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 7f97856e6b20..08bb26fe9fd4 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1709,7 +1709,6 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 	u32			reg;
 
 	u8			link_state;
-	u8			speed;
 
 	/*
 	 * According to the Databook Remote wakeup request should
@@ -1719,16 +1718,13 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
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

