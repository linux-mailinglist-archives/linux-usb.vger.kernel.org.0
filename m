Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6E3407A2A
	for <lists+linux-usb@lfdr.de>; Sat, 11 Sep 2021 20:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233412AbhIKS7v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Sep 2021 14:59:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:58142 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233408AbhIKS7t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Sep 2021 14:59:49 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1AD61C0887;
        Sat, 11 Sep 2021 18:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1631386715; bh=iRdLnZD8c38q3+DUKejSeZbUyWBInQBjtmBi4XuIEJ4=;
        h=Date:From:Subject:To:Cc:From;
        b=hS29hD5LV8ReH8il00RU26ZKPzNA6iHO8AaiPkY1Cowe0HX9O1/C4+Z0/XxyAYck8
         54RZT4braPuTObo/5QZ0ingHL2xtBHXaCauwvG9oB6YwRduIWubHfp74cktfk3o9XB
         iE9XVicE+e5JDKpRx+kyglwUHaxy9/37USMR7aAPZ7IzxvY7NZi4jZqm59nmxNlWTO
         ji78VUGS+aHA0sAlpSp7pPE85NRYNhw+mP6naQLjPz7n3duzFUwWRoJJs3JporuKRI
         y+uwmGTxKI5Q5u2SQvzbAI/V4MSrAU2I6XZRJvGK2hD5raqzG2T52wRlhyANAr6ybS
         0l0q8Ibq9VyNg==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.75.77])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 5121BA005D;
        Sat, 11 Sep 2021 18:58:30 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Sat, 11 Sep 2021 22:58:30 +0400
Date:   Sat, 11 Sep 2021 22:58:30 +0400
Message-Id: <a36981accc26cd674c5d8f8da6164344b94ec1fe.1631386531.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v2] usb: dwc2: gadget: Fix ISOC transfer complete handling for DDMA
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When last descriptor in a descriptor list completed with XferComplete
interrupt, core switching to handle next descriptor and assert BNA
interrupt. Both these interrupts are set while dwc2_hsotg_epint()
handler called. Each interrupt should be handled separately: first
XferComplete interrupt then BNA interrupt, otherwise last completed
transfer will not be giveback to function driver as completed
request.

Fixes: 729cac693eec ("usb: dwc2: Change ISOC DDMA flow")
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 Changes in v2:
 - Fix typo in commit message

 drivers/usb/dwc2/gadget.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index f09cbdfac9df..11d85a6e0b0d 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3067,9 +3067,7 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 
 		/* In DDMA handle isochronous requests separately */
 		if (using_desc_dma(hsotg) && hs_ep->isochronous) {
-			/* XferCompl set along with BNA */
-			if (!(ints & DXEPINT_BNAINTR))
-				dwc2_gadget_complete_isoc_request_ddma(hs_ep);
+			dwc2_gadget_complete_isoc_request_ddma(hs_ep);
 		} else if (dir_in) {
 			/*
 			 * We get OutDone from the FIFO, so we only

base-commit: 353f497ca8c913cd25ae06c7f94e3b0ff4124dd8
-- 
2.11.0

