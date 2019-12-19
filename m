Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD328125984
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 03:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfLSCO6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 21:14:58 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47308 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726463AbfLSCO6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 21:14:58 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AE9D9C0098;
        Thu, 19 Dec 2019 02:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576721697; bh=lN9gSyxLlYaTMLHgf5eQwE4US3H02Ozrv2yhrc79c3E=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=iLaZXMkgBCZnxUH6jfH4jmwv4gRV5EoAearpSLZ3Dy0bv8311paAsqZXJNZG/KeLM
         gjatZuAkfGNcnUmymXZPkWWwAuTV5D3wpUCsi1EEjj3PpqfH+sPi0UFRlQ8O293Kw7
         bHHk88hLXV73ek6jSHg+e4DRyh8Pim9B1WDfM+4k3moFHPJn1Fx3RmJYaOZWhVNDKd
         sGWD0NkwtRsxAxccnjLeFVhDigotmHbZ6dAQ9q3e7hH089b75H73xrFgr6thbWlHCZ
         Yj98PKM7cB4V3rXjXxMgpKzOOKUgGHZdE1BH7C3NJwC5eAOkm6a6uhHZl6GLjA5ih+
         0cnGb9j8LeP1w==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 80AA0A006D;
        Thu, 19 Dec 2019 02:14:56 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 18 Dec 2019 18:14:56 -0800
Date:   Wed, 18 Dec 2019 18:14:56 -0800
Message-Id: <ba66a4882a861749b29b7c80db33d686080dab09.1576715470.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576715470.git.thinhn@synopsys.com>
References: <cover.1576715470.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 3/3] usb: dwc3: gadget: Remove END_TRANSFER delay
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We had a 100us delay to synchronize the END_TRANSFER command completion
before giving back requests to the function drivers. Now, the controller
driver can handle cancelled TRBs with the requests' cancelled_list and
it can also wait until the END_TRANSFER completion before starting new
transfers. Synchronization can simply base on the controller's command
completion interrupt. The 100us delay is no longer needed. Remove this
arbitrary delay.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
 - Remove unused variable

 drivers/usb/dwc3/gadget.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 61b7bef98cf9..05dbeae1308a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2686,7 +2686,6 @@ static void dwc3_reset_gadget(struct dwc3 *dwc)
 static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	bool interrupt)
 {
-	struct dwc3 *dwc = dep->dwc;
 	struct dwc3_gadget_ep_cmd_params params;
 	u32 cmd;
 	int ret;
@@ -2702,16 +2701,13 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	 * much trouble synchronizing between us and gadget driver.
 	 *
 	 * We have discussed this with the IP Provider and it was
-	 * suggested to giveback all requests here, but give HW some
-	 * extra time to synchronize with the interconnect. We're using
-	 * an arbitrary 100us delay for that.
+	 * suggested to giveback all requests here.
 	 *
 	 * Note also that a similar handling was tested by Synopsys
 	 * (thanks a lot Paul) and nothing bad has come out of it.
-	 * In short, what we're doing is:
-	 *
-	 * - Issue EndTransfer WITH CMDIOC bit set
-	 * - Wait 100us
+	 * In short, what we're doing is issuing EndTransfer with
+	 * CMDIOC bit set and delay kicking transfer until the
+	 * EndTransfer command had completed.
 	 *
 	 * As of IP version 3.10a of the DWC_usb3 IP, the controller
 	 * supports a mode to work around the above limitation. The
@@ -2720,8 +2716,7 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	 * by writing GUCTL2[14]. This polling is already done in the
 	 * dwc3_send_gadget_ep_cmd() function so if the mode is
 	 * enabled, the EndTransfer command will have completed upon
-	 * returning from this function and we don't need to delay for
-	 * 100us.
+	 * returning from this function.
 	 *
 	 * This mode is NOT available on the DWC_usb31 IP.
 	 */
@@ -2739,9 +2734,6 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 		dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
 	else
 		dep->flags |= DWC3_EP_END_TRANSFER_PENDING;
-
-	if (dwc3_is_usb31(dwc) || dwc->revision < DWC3_REVISION_310A)
-		udelay(100);
 }
 
 static void dwc3_clear_stall_all_ep(struct dwc3 *dwc)
-- 
2.11.0

