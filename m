Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D74E11221A6
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 02:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfLQBqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 20:46:40 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:55634 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726016AbfLQBqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 20:46:40 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C4B2240642;
        Tue, 17 Dec 2019 01:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576547199; bh=rhTW2NSI3AmIWcrLJ7AdaMaUQ761WbCrn/LTimbT80M=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=b69KJLco6WH+8WCIgj/5q35KPoqho77+ynTBuqqfr5nnj8X0U+NJNwk/Vh62er68i
         cCl1onRtySDKjN8tVpyfje156FOAIdQy610gJ7/fAr4FbE2/gPPol0fzM9VEumQGnS
         RXrn9pIjRiwdH1KjRF8ylcRgR/AtBDP2Rt96LCE6mv4cyMvq6VoU6ln0A7ECws52D+
         8srobgka+gadO+g0rCSTmjOpN6n+X2Zdg0NRJXCulzrKFGrEN3wkA7ey19YKa9yNQ+
         Ki1jeoNcucNQ7K6YaPWpK+7FhT4rIXzPaLgoWzDmS1BG7zLZONhCQx5mZMyMMGRbx4
         R/8+W1aaYQQiA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B0275A00D4;
        Tue, 17 Dec 2019 01:46:38 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 16 Dec 2019 17:46:38 -0800
Date:   Mon, 16 Dec 2019 17:46:38 -0800
Message-Id: <9ec449e9cd3baa6e014de04efbf4dd263c4b156c.1576546936.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576546936.git.thinhn@synopsys.com>
References: <cover.1576546936.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 3/3] usb: dwc3: gadget: Remove END_TRANSFER delay
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
 drivers/usb/dwc3/gadget.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 61b7bef98cf9..fe9a7e37725c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2702,16 +2702,13 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
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
@@ -2720,8 +2717,7 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	 * by writing GUCTL2[14]. This polling is already done in the
 	 * dwc3_send_gadget_ep_cmd() function so if the mode is
 	 * enabled, the EndTransfer command will have completed upon
-	 * returning from this function and we don't need to delay for
-	 * 100us.
+	 * returning from this function.
 	 *
 	 * This mode is NOT available on the DWC_usb31 IP.
 	 */
@@ -2739,9 +2735,6 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
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

