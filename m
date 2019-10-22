Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25383E0C3F
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 21:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732251AbfJVTJu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 15:09:50 -0400
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:36058 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730186AbfJVTJt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 15:09:49 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 082F1C08CA;
        Tue, 22 Oct 2019 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571771389; bh=Z4Fe0WCvdYyiIcY4n0xzak9n0o7a3HJDpHUNzdNQJRY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=PRX30vfBjzuF/jmImBWew5yMcwFifCPJDkH2V1GUcEHL7B+zab+RtDUyazr/TZ+pj
         GjYeYAHhPnHnL8uQtVeaM16QE/ylLTxLSGv3XGyLzh735ftMHpardPzz+7Xw2KWgJL
         sQfxziJnP5G83DDf9y8PoKdwxzybw+9ATyo8XRTq24GCLK6pjKzDJ/zv0dQJ7shRHi
         osgLUt4udlTWJIJA+J2myI8Dpb54QloASU3OwGjUdo+PkvQvJZXcxLH5j7T6ubMNNE
         gVwevZ+S6V+g/9l9wl6v10qRc6sZYn89bdlaWJQN415HTMOGjo43+9y8QSwwu6hmIB
         BxRky8wsQhX/w==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id C77BCA005C;
        Tue, 22 Oct 2019 19:09:47 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 22 Oct 2019 12:09:47 -0700
Date:   Tue, 22 Oct 2019 12:09:47 -0700
Message-Id: <c493e890dc8f02500fa1356353b5ab6c830b9cf1.1571770732.git.thinhn@synopsys.com>
In-Reply-To: <cover.1571770732.git.thinhn@synopsys.com>
References: <cover.1571770732.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/4] usb: dwc3: gadget: Don't send unintended link state change
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DCTL.ULSTCHNGREQ is a write-only field. When doing a read-modify-write
to DCTL, the driver must make sure that there's no unintended link state
change request from whatever is read from DCTL.ULSTCHNGREQ. Set link
state change to no-action when the driver writes to DCTL.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 86dc1db788a9..24178b4b9d46 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -57,6 +57,8 @@ int dwc3_gadget_set_test_mode(struct dwc3 *dwc, int mode)
 		return -EINVAL;
 	}
 
+	/* Don't send link state change request */
+	reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
 	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 
 	return 0;
@@ -1822,6 +1824,9 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 		dwc->pullups_connected = false;
 	}
 
+	/* Don't send link state change request */
+	reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
+
 	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 
 	do {
@@ -2744,6 +2749,10 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
 	int			reg;
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+
+	/* Don't send link state change request */
+	reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
+
 	reg &= ~DWC3_DCTL_INITU1ENA;
 	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 
@@ -2799,6 +2808,10 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 	dwc3_reset_gadget(dwc);
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+
+	/* Don't send link state change request */
+	reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
+
 	reg &= ~DWC3_DCTL_TSTCTRL_MASK;
 	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 	dwc->test_mode = false;
@@ -2904,10 +2917,15 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		if (dwc->has_lpm_erratum && dwc->revision >= DWC3_REVISION_240A)
 			reg |= DWC3_DCTL_NYET_THRES(dwc->lpm_nyet_threshold);
 
+		/* Don't send link state change request */
+		reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
 		dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 	} else {
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 		reg &= ~DWC3_DCTL_HIRD_THRES_MASK;
+
+		/* Don't send link state change request */
+		reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
 		dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 	}
 
@@ -3017,6 +3035,9 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 
 				reg &= ~u1u2;
 
+				/* Don't send link state change request */
+				reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
+
 				dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 				break;
 			default:
-- 
2.11.0

