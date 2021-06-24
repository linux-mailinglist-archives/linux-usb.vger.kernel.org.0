Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E813B281E
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jun 2021 09:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhFXHE3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Jun 2021 03:04:29 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:43304 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229454AbhFXHE2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Jun 2021 03:04:28 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E2ABBC0B39;
        Thu, 24 Jun 2021 07:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1624518130; bh=3IaNpKsXs8zGMv44mhIIHI2F9/SqWHCi+gnKaoegfHw=;
        h=Date:From:Subject:To:Cc:From;
        b=gOJ3HmjiCxpf8YsEM06vqAoRXmwOVNWW09UyGVNubW1zLd9uovlBUUsyziZxMV5cO
         k8NIXX+lVk+rPAkGaOn6hhCjySFRKb4HOgsxSp3gW4gLsLhosMQhVhjhib1LzsIvVh
         bDpxgzBA1/tjy7yIUO3gYha4sKsmPZRuJ7xJflgJ4XwGgOY4jGO8EFbzacNH8ehL24
         UNxxheucBLsm55gRfbRtDROzWuT2aXZAM1ZQ1XpTuK+RZp4+GDYdK7YjbPgnelVDpL
         udxmzbq9tXUEQP6M839DEv36TCYLKbBfRjQnu2mKmQuSjwwC1GhTq4USpsVuQnk+G9
         ITy3HjCnj15SQ==
Received: from Armenia_lab (armenia_lab.internal.synopsys.com [10.116.75.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D6BA7A005C;
        Thu, 24 Jun 2021 07:02:06 +0000 (UTC)
Received: by Armenia_lab (sSMTP sendmail emulation); Thu, 24 Jun 2021 00:02:05 -0700
Date:   Thu, 24 Jun 2021 00:02:05 -0700
Message-Id: <84d3432b0331ea5f612eb10ad1c03ba89cc4d5a2.1624517653.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: gadget: Fix sending zero length packet in DDMA mode.
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
 drivers/usb/dwc2/gadget.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index c581ee41ac81..f467db1747d6 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2749,9 +2749,11 @@ static void dwc2_hsotg_complete_in(struct dwc2_hsotg *hsotg,
 		return;
 	}
 
-	/* Zlp for all endpoints, for ep0 only in DATA IN stage */
+	/* Zlp for all endpoints in non_DDMA, for ep0 only in DATA IN stage */
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

