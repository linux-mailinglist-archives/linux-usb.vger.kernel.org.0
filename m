Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61FBBE0C40
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 21:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732436AbfJVTKF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 15:10:05 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:51042 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729696AbfJVTKF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 15:10:05 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 19F3AC0D22;
        Tue, 22 Oct 2019 19:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571771405; bh=uLOYdKOEXB4a8pu4zgFHYTlYQmavBw2OJ3qMWN7cles=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ENJy0waT3djI0xqR3+I9b2uy6LX1kEXfvesBC26Gdpu9kcqhfTrotjIjqC/h27SI9
         Cw6KlEfsrgLVOAuQrb4zWGRK+sB8hTwePtHkdSJjraj+GDy53mxDZpaFhpJcFiJcoc
         um2yGrKGLPNH7pCD2QUTh/5lrHwT23b4oq2LH1QlaRlNDlfJljQGk+AG4d/eCxxawC
         XX8McNZgZLnNQfFGDwQpXnyh99HGZ6eA7dN29QFG/Ag5srnpLuitMY1NhrvgIXVZgK
         pRSoBT5QAza7XmJD58/fbkkb2YSNg4lOtDeXs7Gj4ojf0oqP89DmGOAUB+I+D6WQXC
         r2Hty9ZQfVFow==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E8328A005A;
        Tue, 22 Oct 2019 19:09:53 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 22 Oct 2019 12:09:53 -0700
Date:   Tue, 22 Oct 2019 12:09:53 -0700
Message-Id: <fad80cae64bf9ff62385774707d3488fbd55f20c.1571770732.git.thinhn@synopsys.com>
In-Reply-To: <cover.1571770732.git.thinhn@synopsys.com>
References: <cover.1571770732.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/4] usb: dwc3: gadget: Set link state to RX_Detect on disconnect
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When DWC3 receives disconnect event, it needs to set the link state to
RX_Detect.

DWC_usb3 3.30a programming guide 4.1.7

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 24178b4b9d46..37631d2e2a2e 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2748,6 +2748,8 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
 {
 	int			reg;
 
+	dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RX_DET);
+
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 
 	/* Don't send link state change request */
-- 
2.11.0

