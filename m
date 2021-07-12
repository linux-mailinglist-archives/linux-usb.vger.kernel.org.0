Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3833C5B47
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 13:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234966AbhGLLIb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 07:08:31 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:39392 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232342AbhGLLI3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 07:08:29 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9A3B0C0556;
        Mon, 12 Jul 2021 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626087941; bh=d0abQrR6HahCK2W+3V86zoqY2C2jJO+56m9oBkXVUGQ=;
        h=Date:From:Subject:To:Cc:From;
        b=Jc2o8Lpq7soSaPhWSSlCW1I3AkKxL1pWPeLNQfyQo02RvJ5f6TWI8HfEA1JhFFdDq
         RWYk9ZEFZt4TCrDA1nywcXuHWzx0WC8Gp2cI2k1Eq/76lbw1CtlfhPDTtDRyhf1svr
         k3FKbDsuN8FyvH5Wk56odyGeY3jUOyl2FNrx/1eexKca0lYNb8bujhuxJurshj83nq
         hze5dhmVenKYKgg7Rxgs/Y2+ZCEgdT+rY8VBUqc2cgui/rnMlT80e//ZZ7T3cbOGcY
         MWaHC2rPBl7bDamg9aQiOqVMKOMxAtPo571FYfF+Ev1ocXQ6QGqiDo4aGWIFe1YV6Q
         hOFkYaj7hRY0g==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.75.77])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 08164A005D;
        Mon, 12 Jul 2021 11:05:37 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Mon, 12 Jul 2021 15:05:36 +0400
Date:   Mon, 12 Jul 2021 15:05:36 +0400
Message-Id: <106acd249c1a5db9e106010d21b51cdda3a21354.1626087098.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v3] usb: dwc2: gadget: Fix sending zero length packet in DDMA mode.
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

For DDMA in function dwc2_hsotg_complete_in() does not need to send zlp.

Tested by USBCV MSC tests.

Fixes: f71b5e2533de ("usb: dwc2: gadget: fix zero length packet transfers")
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 Changes in v3:
 - Updated mail recipient list
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

base-commit: 89c222503a5bda476be00a2668abd7ea435e1cfa
-- 
2.11.0

