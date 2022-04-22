Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E7150ADB5
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 04:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443315AbiDVCZ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 22:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443312AbiDVCZ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 22:25:56 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D454B1D9
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 19:23:05 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D96FE41EE3;
        Fri, 22 Apr 2022 02:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1650594184; bh=h52XUOknEGN1TU2cEyo7aHY8jT1Bcf3jS/DOvC2JQ3g=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=c4GkroXxUuYJkdns2U0tf81SC0AgObF+x6e074bK/WgdyzEj8ao0hwmqbQ9Ie20Q4
         3Zah75YwQ7ry9xVBzW1vFkGRmPWaQRSGI+CKSZKdolRoHPom0gOQRv9W6DFTsN4pOu
         rhtVfEMuTqK1Cpzl17J1HL1he2SPT+VU1FSXRDjSnR6x+NWYKx0HVOcuKCiHKK7LT3
         mQdSD+5aDPODmKEo4JJFadgZtGrwRXxPrfzmR0KlMIQFZF2Uy/G23sS7oMCqhCj8Lk
         4N14oyLMVU7Yrf2O3vA6WJVuEndaLjbK4hfSGDlSZLYvy/vX6RojvyjaldoYLtbq/8
         bNTSebyt7UQuA==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id BE05DA006F;
        Fri, 22 Apr 2022 02:23:03 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Thu, 21 Apr 2022 19:23:03 -0700
Date:   Thu, 21 Apr 2022 19:23:03 -0700
Message-Id: <2fcf3b5d90068d549589a57a27a79f76c6769b04.1650593829.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 6/6] usb: dwc3: gadget: Delay issuing End Transfer
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the controller hasn't DMA'ed the Setup data from its fifo, it won't
process the End Transfer command. Polling for the command completion may
block the driver from servicing the Setup phase and cause a timeout.
Previously we only check and delay issuing End Transfer in the case of
endpoint dequeue. Let's do that for all End Transfer scenarios.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 7c4d5f671687..f0fd7c32828b 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2056,16 +2056,6 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 		if (r == req) {
 			struct dwc3_request *t;
 
-			/*
-			 * If a Setup packet is received but yet to DMA out, the controller will
-			 * not process the End Transfer command of any endpoint. Polling of its
-			 * DEPCMD.CmdAct may block setting up TRB for Setup packet, causing a
-			 * timeout. Delay issuing the End Transfer command until the Setup TRB is
-			 * prepared.
-			 */
-			if (dwc->ep0state != EP0_SETUP_PHASE && !dwc->delayed_status)
-				dep->flags |= DWC3_EP_DELAY_STOP;
-
 			/* wait until it is processed */
 			dwc3_stop_active_transfer(dep, true, true);
 
@@ -3657,6 +3647,18 @@ void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	    (dep->flags & DWC3_EP_END_TRANSFER_PENDING))
 		return;
 
+	/*
+	 * If a Setup packet is received but yet to DMA out, the controller will
+	 * not process the End Transfer command of any endpoint. Polling of its
+	 * DEPCMD.CmdAct may block setting up TRB for Setup packet, causing a
+	 * timeout. Delay issuing the End Transfer command until the Setup TRB is
+	 * prepared.
+	 */
+	if (dwc->ep0state != EP0_SETUP_PHASE && !dwc->delayed_status) {
+		dep->flags |= DWC3_EP_DELAY_STOP;
+		return;
+	}
+
 	/*
 	 * NOTICE: We are violating what the Databook says about the
 	 * EndTransfer command. Ideally we would _always_ wait for the
-- 
2.28.0

