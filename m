Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1112BE2801
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 04:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436786AbfJXCP5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 22:15:57 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:58626 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436605AbfJXCP5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 22:15:57 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CB69EC0239;
        Thu, 24 Oct 2019 02:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571883356; bh=Qj7MaDOXqFXYmlayYiTBixG3sFATVpQdY6vxqDaCJsk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=DlqzONlFsAj34HfpUSLwLGNiwFdfoZ1KkW/hiJg6Z/eu/djBPNzeaDlTiyeaCqxfB
         LdrpYcBYrwrk4pob3y3EgQ61SOaSspcqNF55jbqCiDNMqs0pHnh3qKRk6QIEnOWfYM
         Eqrcy5+X1rba7MenOZ9xL/VXtzCLywZZI4abpAxZ9QWXdTbgflqXX1k+NErJy9q5p+
         LG/G/cLh6DWCKTG6lW2FWneI/ayGyRueRpnmqapecLOcHmSyM4LSXBVqHDqlZXEjAJ
         ZoOMfTEMoXe5VaZe/o5kPhbfrtLT1P1vHkeVEAvVVRCrMsUg7L5FTAyAM3i3HBusO0
         xIwXnNN2zkpWQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 9C0F5A005A;
        Thu, 24 Oct 2019 02:15:55 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 23 Oct 2019 19:15:55 -0700
Date:   Wed, 23 Oct 2019 19:15:55 -0700
Message-Id: <11954a39aa8a2ee06c561ffad60932f50366af59.1571882179.git.thinhn@synopsys.com>
In-Reply-To: <cover.1571882179.git.thinhn@synopsys.com>
References: <cover.1571882179.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 3/4] usb: dwc3: gadget: Clear DCTL.ULSTCHNGREQ before set
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
index 5856c8c96418..7f97856e6b20 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -111,6 +111,9 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state)
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

