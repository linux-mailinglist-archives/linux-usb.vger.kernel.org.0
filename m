Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F0C50ADB6
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 04:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443314AbiDVCZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 22:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443283AbiDVCZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 22:25:50 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5F4496A1
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 19:22:59 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DBE8FC48D0;
        Fri, 22 Apr 2022 02:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1650594178; bh=CHJkoWQNCSGaY7STeFa+E4EhIbBMFf5mac+XHy4QTDk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=R+T7o/ZFkxqGt1pAvjSRdptHLAXqfkCLvcW3Dtqqn2hewqsXm74i054LrHhxQxq5p
         aZcKq5pQiPFbJwuePrkL26lp5t+gegSczKZ3J+fGCU5Dbo9V1RkdCEK8zIfPUzoe5E
         LWe3edjJQOfLVjpJskoBXR7g1sHvMNRtExrgUUmfmtC6nxAp9kIUC9xholDwqyoKSb
         ylai1jFvCqzNkD1LpJSzRKRaB13rM27S2FlUFmsAkBllvuC1HAI3m54RYSxBZtPIfA
         GLc6BX8Q4ceIRa+hENOe2ZDxPFXBJ54ynflicbXCDUpyKrWZeAHIS9M0QTfvpzcdAO
         ZbG4aXbakzyqg==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A2567A006F;
        Fri, 22 Apr 2022 02:22:57 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Thu, 21 Apr 2022 19:22:57 -0700
Date:   Thu, 21 Apr 2022 19:22:57 -0700
Message-Id: <3c6643678863a26702e4115e9e19d7d94a30d49c.1650593829.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 5/6] usb: dwc3: gadget: Only End Transfer for ep0 data phase
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

The driver shouldn't be able to issue End Transfer to the control
endpoint at anytime. Typically we should only do so in error cases such
as invalid/unexpected direction of Data Phase as described in the
control transfer flow of the programming guide. It _may_ end started
data phase during controller deinitialization from soft disconnect or
driver removal. However, that should not happen because the driver
should be maintained in EP0_SETUP_PHASE during driver tear-down. On
soft-connect, the controller should be reset from a soft-reset and there
should be no issue starting the control endpoint.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e5f07c0e8ad9..7c4d5f671687 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3641,6 +3641,17 @@ static void dwc3_reset_gadget(struct dwc3 *dwc)
 void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	bool interrupt)
 {
+	struct dwc3 *dwc = dep->dwc;
+
+	/*
+	 * Only issue End Transfer command to the control endpoint of a started
+	 * Data Phase. Typically we should only do so in error cases such as
+	 * invalid/unexpected direction as described in the control transfer
+	 * flow of the programming guide.
+	 */
+	if (dep->number <= 1 && dwc->ep0state != EP0_DATA_PHASE)
+		return;
+
 	if (!(dep->flags & DWC3_EP_TRANSFER_STARTED) ||
 	    (dep->flags & DWC3_EP_DELAY_STOP) ||
 	    (dep->flags & DWC3_EP_END_TRANSFER_PENDING))
-- 
2.28.0

