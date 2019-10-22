Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5EB0E0C41
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 21:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732542AbfJVTKM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 15:10:12 -0400
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:36114 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729696AbfJVTKL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 15:10:11 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3AD10C08B9;
        Tue, 22 Oct 2019 19:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571771411; bh=xeePJAmW2kK1b5Lzcx3jp9qVTEeHFNdz5IIjFlm/wzE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=I9Uwh3KaM1RCw557mJk8jdlIVOSPJ3t8uReC3ZqIZlWMlr9fHpvFlh9exAINmOfAC
         W5H8/PXcCT9e7tQF4DIsCpZ6cyZoGYFbXdt8QRuFQ+/Vnoc4vWGCdzyEBgTm4fF3b1
         rYpl90CTg8XfTz+zRAaXFjeNpoJs3tiJgQJAOEYfPW/Nl0vEB6YcSOzrxy2244dV4z
         ennlv7eJv0VeRUI/LIx5U4ml2mQ7cB0ZDdTkBVIyNIiXTEZb7ISLnIl5mp04emFmC+
         xI7zLxh5fRWWcHMdk5C1UZa9V6o4HWZ3TZ2Fx4oyKaZyp3pOUPeTgIU5vTM09f/cmr
         TWTVxYrSvldaA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 0C548A005A;
        Tue, 22 Oct 2019 19:10:10 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 22 Oct 2019 12:10:10 -0700
Date:   Tue, 22 Oct 2019 12:10:10 -0700
Message-Id: <90732ce7d362021ba0e8709c8b9c9e2eb02b83c2.1571770732.git.thinhn@synopsys.com>
In-Reply-To: <cover.1571770732.git.thinhn@synopsys.com>
References: <cover.1571770732.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 3/4] usb: dwc3: gadget: Clear DCTL.ULSTCHNGREQ before set
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Send a no-action link state change request before the actual request
so DWC3 can send the same request whenever we call
dwc3_gadget_set_link_state().

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 37631d2e2a2e..03d58254d1e6 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -113,6 +113,9 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state)
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
 
+	/* set no action before sending new link state change */
+	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+
 	/* set requested state */
 	reg |= DWC3_DCTL_ULSTCHNGREQ(state);
 	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
-- 
2.11.0

