Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041843CF9C5
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 14:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbhGTMA4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 08:00:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57584 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229661AbhGTMAx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jul 2021 08:00:53 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 05C7045E95;
        Tue, 20 Jul 2021 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626784890; bh=tcUF+fY1A0iv1tKpGAeaj9fgtXIdHaLpHihvNPeGoWY=;
        h=Date:From:Subject:To:Cc:From;
        b=l2VZv+Mqx41ZBXjxSP/JeIBb6s10ulCoQ90ZxAIKQmk7tqpNYB0xMQYTI1k1sOmkL
         c+aKMFDDkj5O9t3i02Z6n0I4K8VVXhjjc6+e95IeyKbn9d/m34O2z9KZTNbr0FH2CM
         fvvslNYZaBI+FRRvTKON7V3io+62ua/KEX9TuQjv0SJlfT3+CEdzmDgifHnBwPgqoS
         JBwLcazq9wa78TWfeG0GA9/3qlaUFG2+TZEEt0Fzf1r4KXRMiQEM47hHwu/NSgWM/U
         y689h4vAwlNnSF/7ckKh07fdFZE/OJhqwRoKUwfZCBvAz8j0YsPK7/KilMucPdYcj3
         QdKs+X/rZsC0w==
Received: from Armenia_lab (armenia_lab.internal.synopsys.com [10.116.75.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id F0E9AA005C;
        Tue, 20 Jul 2021 12:41:25 +0000 (UTC)
Received: by Armenia_lab (sSMTP sendmail emulation); Tue, 20 Jul 2021 05:41:24 -0700
Date:   Tue, 20 Jul 2021 05:41:24 -0700
Message-Id: <967bad78c55dd2db1c19714eee3d0a17cf99d74a.1626777738.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v4] usb: dwc2: gadget: Fix sending zero length packet in DDMA mode.
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Paul Zimmerman <paulz@synopsys.com>, linux-usb@vger.kernel.org,
        Mian Yousaf Kaukab <yousaf.kaukab@intel.com>,
        Gregory Herrero <gregory.herrero@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Robert Baldyga <r.baldyga@samsung.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sending zero length packet in DDMA mode perform by DMA descriptor
by setting SP (short packet) flag.

For DDMA in function dwc2_hsotg_complete_in() does not need to send
zlp.

Tested by USBCV MSC tests.

Fixes: f71b5e2533de ("usb: dwc2: gadget: fix zero length packet transfers")
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 Changes in v4:
 - In DDMA mode should go forward to move status OUT phase
 Changes in v3:
 - Updated mail recipient list
 Changes in v2:
 - Minor typo correction in comments

 drivers/usb/dwc2/gadget.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index c581ee41ac81..807c3cfec8e9 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2749,12 +2749,14 @@ static void dwc2_hsotg_complete_in(struct dwc2_hsotg *hsotg,
 		return;
 	}
 
-	/* Zlp for all endpoints, for ep0 only in DATA IN stage */
+	/* Zlp for all endpoints in non DDMA, for ep0 only in DATA IN stage */
 	if (hs_ep->send_zlp) {
-		dwc2_hsotg_program_zlp(hsotg, hs_ep);
 		hs_ep->send_zlp = 0;
-		/* transfer will be completed on next complete interrupt */
-		return;
+		if (!using_desc_dma(hsotg)) {
+			dwc2_hsotg_program_zlp(hsotg, hs_ep);
+			/* transfer will be completed on next complete interrupt */
+			return;
+		}
 	}
 
 	if (hs_ep->index == 0 && hsotg->ep0_state == DWC2_EP0_DATA_IN) {

base-commit: 00a738b86ec0c88ad4745f658966f951cbe4c885
-- 
2.11.0

