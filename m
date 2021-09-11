Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38F8407902
	for <lists+linux-usb@lfdr.de>; Sat, 11 Sep 2021 17:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhIKPRc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Sep 2021 11:17:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:52722 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230472AbhIKPRb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Sep 2021 11:17:31 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 94EECC0824;
        Sat, 11 Sep 2021 15:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1631373379; bh=j9NGvUfDaxXJEXx7lWsh576TgdmnmbaI/3pC/GxtzIU=;
        h=Date:From:Subject:To:Cc:From;
        b=iEiZ3t025GfNkODpNxfoeX3bGY23siDFfSfdVF+QIx89XlL7/42dzLNNkL/ut8HSw
         vJOn30NAZ32yupcrHqyagifvwAwflQfY6itsCydOYfuy0uqfkJ9U4jGhIb601gLipI
         aP8eLC5P4jn+AUJthg83UdtKeudUwg8AWO0wanlmi96Txt4qhCguQt8R3Rp9QjNcLr
         GzzOPWTs9x8a5QCEDhZfK1+kR2WPtSvq1XGiuPhY/50wdEWDF+12K65WZl/V5ogwrp
         GSAeUg4lzgcvO+yE/m/pejP7pkYNAmq6JEvkjTJ8SltigfnGlLPlDzMpaMsr8SkqLm
         PhU5VSAsRounA==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.75.77])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 60322A005C;
        Sat, 11 Sep 2021 15:16:15 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Sat, 11 Sep 2021 19:16:14 +0400
Date:   Sat, 11 Sep 2021 19:16:14 +0400
Message-Id: <df7851e6416a7817140c2be65a479a2650d746d8.1631356397.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: gadget: Fix ISOC transfer complete handling for DDMA
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
interrupt. This both interrupts are set while dwc2_hsotg_epint()
handler called. Each interrupt should be handled separately: first
XferComplete interrupt then BNA interrupt, otherwise last completed
transfer will not be giveback to function driver as completed
request.

Fixes: 729cac693eec ("usb: dwc2: Change ISOC DDMA flow")
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/gadget.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 837237e4bc96..1c11fb89406d 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3039,9 +3039,7 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 
 		/* In DDMA handle isochronous requests separately */
 		if (using_desc_dma(hsotg) && hs_ep->isochronous) {
-			/* XferCompl set along with BNA */
-			if (!(ints & DXEPINT_BNAINTR))
-				dwc2_gadget_complete_isoc_request_ddma(hs_ep);
+			dwc2_gadget_complete_isoc_request_ddma(hs_ep);
 		} else if (dir_in) {
 			/*
 			 * We get OutDone from the FIFO, so we only

base-commit: 1b4f3dfb4792f03b139edf10124fcbeb44e608e6
-- 
2.11.0

