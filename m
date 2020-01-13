Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 715B31393B6
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 15:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgAMOc1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 09:32:27 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:38610 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726074AbgAMOc1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 09:32:27 -0500
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 21EC9406A2;
        Mon, 13 Jan 2020 14:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1578925946; bh=2e/CL/WxxLKbTKPXq/2cgskp+mjYF9OxWXeBg0loiWc=;
        h=Date:From:Subject:To:Cc:From;
        b=JqaO+C51MfN5qgSMrWqVgIz2WUc334H1s/MlOjPmbNyxZCGAugSbtp0zS+WyO9IAI
         8UpGOy8Xl7yHcAkxjr04fFGiFq5BaO6jLdJNxkGnofLTxHJfuMji8hpRO4KWztXcCH
         v2BpnB5Pl961mN6TjagHMNb17HPZSGrvrOMVuD1rx/RVNrWOfWeOL/f8KaBHqbkKit
         zGOYUMDYQWhhwo89/EX4U+zT3yNMTY71O68YGSqf7WDF92ZHoT+Lnmr2wJG6sqbnMe
         T9jEgd06pMrPa0ZRngRDERHfFTJiHIE/vUGfvrGyMZJ4xs/zEVJ+NhpEkLKA+/DK6R
         K+U9moA3NRquQ==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.126.211])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4F8F0A005B;
        Mon, 13 Jan 2020 14:32:23 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Mon, 13 Jan 2020 18:32:21 +0400
Date:   Mon, 13 Jan 2020 18:32:21 +0400
Message-Id: <d96e104b1913f11f0d3763f3badb0aaf9b3dae77.1578925847.git.hminas@synopsys.com>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: Fix in ISOC request length checking
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Move ISOC request length cheking from dwc2_hsotg_start_req() function to
dwc2_hsotg_ep_queue().

Fixes: 4fca54aa58293 "usb: gadget: s3c-hsotg: add multi count support"
Robert Baldyga <r.baldyga@samsung.com>

Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
---
 drivers/usb/dwc2/gadget.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 88f7d6d4ff2d..7b40cf5bdc2f 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1083,11 +1083,6 @@ static void dwc2_hsotg_start_req(struct dwc2_hsotg *hsotg,
 	else
 		packets = 1;	/* send one packet if length is zero. */
 
-	if (hs_ep->isochronous && length > (hs_ep->mc * hs_ep->ep.maxpacket)) {
-		dev_err(hsotg->dev, "req length > maxpacket*mc\n");
-		return;
-	}
-
 	if (dir_in && index != 0)
 		if (hs_ep->isochronous)
 			epsize = DXEPTSIZ_MC(packets);
@@ -1391,6 +1386,13 @@ static int dwc2_hsotg_ep_queue(struct usb_ep *ep, struct usb_request *req,
 	req->actual = 0;
 	req->status = -EINPROGRESS;
 
+	/* Don't queue ISOC request if length greater than mps*mc */
+	if (hs_ep->isochronous &&
+	    req->length > (hs_ep->mc * hs_ep->ep.maxpacket)) {
+		dev_err(hs->dev, "req length > maxpacket*mc\n");
+		return -EINVAL;
+	}
+
 	/* In DDMA mode for ISOC's don't queue request if length greater
 	 * than descriptor limits.
 	 */
-- 
2.11.0

