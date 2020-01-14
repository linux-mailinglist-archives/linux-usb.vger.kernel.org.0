Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED57813ABE9
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 15:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgANOK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 09:10:27 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:36838 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726115AbgANOK1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 09:10:27 -0500
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 30816402D3;
        Tue, 14 Jan 2020 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1579011026; bh=+NgtUnVXytq/2PyXMUN0Op2uS6VEc7I7dFuTIr3fcWg=;
        h=Date:From:Subject:To:Cc:From;
        b=iyminmX08eByrtXSxMgIihIXJA/jf9RxX1BhDXv9lTnL4Qkbt34SWU8vhWhFIE42g
         0eBeuZF/DKTAod75xuro15LtxkBWUC955mhH6wUt0QU0Uxd/tJZVnuJJraX+jyiYEB
         SOkfEf6MJAHoGn8u17uQTXkB1zTRy1RbstyNa2S0IxghojH0LZMJWhpth+b4xrhuib
         L9j7TMylyJnSCZphdjHcxooNDAWlPCxSvU6U17SrlJw/jd5mJQ+SIgL1Mmy2LYqeN9
         6sABcJVTK4XFzG7RdPyZcO0oXTP/MoPW8qAKZ2e4HLtWeyp56EFr3kqJp+9V3Nxx1J
         SWB7mxRPAWaZg==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.126.211])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B7DA1A005B;
        Tue, 14 Jan 2020 14:10:22 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Tue, 14 Jan 2020 18:10:21 +0400
Date:   Tue, 14 Jan 2020 18:10:21 +0400
Message-Id: <b6c6cf924f280568b2a3c6ef918d8ce1fd16056f.1579010991.git.hminas@synopsys.com>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v2] usb: dwc2: Fix in ISOC request length checking
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Robert Baldyga <r.baldyga@samsung.com>,
        Felipe Balbi <balbi@ti.com>,
        Kyungmin Park <kyungmin.park@samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Moved ISOC request length checking from dwc2_hsotg_start_req() function to
dwc2_hsotg_ep_queue().

Fixes: 4fca54aa58293 ("usb: gadget: s3c-hsotg: add multi count support")
Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>

Changes for v2:
- fix typo in commit message
- fix tag formatting

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

