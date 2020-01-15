Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCB4213B940
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 06:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgAOFzq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 00:55:46 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:44176 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725962AbgAOFzq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 00:55:46 -0500
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 943A3406E6;
        Wed, 15 Jan 2020 05:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1579067746; bh=58RCWf0esTGTXB2WWpwacE9UNEjRZTkDQCJ7K0y5p9I=;
        h=Date:From:Subject:To:Cc:From;
        b=KrnMldqKnXE9XO9L9dbonHMisuZPRveVb49SvsqEWRyyQF9tecU7mCVt6b9XX8s6m
         7TiwZaNqf/aK2DSgdZ3fPNuwtesxnvNY8Y9Wh75Lqwn5Czl2pUrPR4GGBiYKXmgqnd
         ccSNioET4AyB/b26Ehn69EHTavqWraXy5znIVZXzJci04YsOq5s4OxQGW93epMhK9B
         MIQglAmbMzKDLulubeVg//HdAWB41LJGhjoMSv0PmQixz5dPIheDDDdcILAdOzy29n
         9V8NnqqrhxxdFTXg+qqu4Pt2xq5J0W7vIpUvzCTo1mJbDsoRYVl2pkZMIH8hVCEVFG
         OBoHQYEXSu7zQ==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.126.211])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A767FA005C;
        Wed, 15 Jan 2020 05:55:41 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Wed, 15 Jan 2020 09:55:40 +0400
Date:   Wed, 15 Jan 2020 09:55:40 +0400
Message-Id: <8c5bd0c646737fe97770d33355b8e197ea28f303.1579067350.git.hminas@synopsys.com>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v3] usb: dwc2: Fix in ISOC request length checking
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
---
Changes for v3:
- Fix commit message format
Changes for v2:
- Fix typo in commit message
- Fix tags formatting

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

