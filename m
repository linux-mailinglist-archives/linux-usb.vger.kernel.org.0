Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A56B33B2D70
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jun 2021 13:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbhFXLQW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Jun 2021 07:16:22 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:55376 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232378AbhFXLQU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Jun 2021 07:16:20 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A97C9C0B4B;
        Thu, 24 Jun 2021 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1624533241; bh=xmXIzEkmMzhx4lN0IwEcUbjcj8OiuoyfF8HOLYNDzE0=;
        h=Date:From:Subject:To:Cc:From;
        b=O6S/UVj1v8msDQ1qqYQ4vQDmiICF0fOimablru+y0kV736ldugppXtJIhXYYYXaHN
         4N785hP0LeHVTsXaXsjDmehSc3W9onfmtzkQlfLDj0+FTg54oaB122Gx1+v9YId8VT
         GOEDSch/nBxcrJjCXsLIjR9fSXB6EbzO5CnmsW1cdCK3nXpK67pDRd4+BEkD3XQRko
         dt6QYgkO6jCi9BWOhDjwg3ycsc9DSITwdqMCVsPgQxINlnV4r3oA0f82g/Ww80G3Zh
         Hj9XG2OIYBvGkdfJIQpiiBhpDsT0FFbj8YCljqaN1i19RfK0MQRQSSzlH59sP6qCZ9
         nva61IJYyBltw==
Received: from Armenia_lab (armenia_lab.internal.synopsys.com [10.116.75.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A2F12A005E;
        Thu, 24 Jun 2021 11:13:57 +0000 (UTC)
Received: by Armenia_lab (sSMTP sendmail emulation); Thu, 24 Jun 2021 04:13:56 -0700
Date:   Thu, 24 Jun 2021 04:13:56 -0700
Message-Id: <7de9dbf515b15464f8f6db3bab76123c950597d7.1624533048.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v2] usb: dwc2: gadget: Fix sending zero length packet in DDMA mode.
To:     linux-usb@vger.kernel.org
Cc:     John.Youn@synopsys.com, balbi@kernel.org, yousaf.kaukab@intel.com
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
 Changes in v2:
 - Minor typo correction in comments

 drivers/usb/dwc2/gadget.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index c581ee41ac81..bf456b4e191f 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2749,9 +2749,11 @@ static void dwc2_hsotg_complete_in(struct dwc2_hsotg *hsotg,
 		return;
 	}
 
-	/* Zlp for all endpoints, for ep0 only in DATA IN stage */
+	/* Zlp for all endpoints in non DDMA, for ep0 only in DATA IN stage */
 	if (hs_ep->send_zlp) {
-		dwc2_hsotg_program_zlp(hsotg, hs_ep);
+		if (!using_desc_dma(hsotg))
+			dwc2_hsotg_program_zlp(hsotg, hs_ep);
+
 		hs_ep->send_zlp = 0;
 		/* transfer will be completed on next complete interrupt */
 		return;

base-commit: 00a738b86ec0c88ad4745f658966f951cbe4c885
-- 
2.11.0

