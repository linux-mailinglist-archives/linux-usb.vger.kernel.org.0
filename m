Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF7A22DB3A
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 03:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgGZBhK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 21:37:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:44770 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726870AbgGZBhK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 21:37:10 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC42FC00A4;
        Sun, 26 Jul 2020 01:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595727429; bh=uhuR//mEvgHtlmhF9eex6xCFPc79tr2ILwVUeXNX0RY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=jOlz0ETXcSfbxDDWMBe6iwcMfyHRgoOIZ1r4msCS4oWvekR9HeBSbx8TeI09Bfe0v
         SuPfHcnfL5+N3g9FI5FXFuZEgmXN+7oHYSAXRe3sWBdpBwVNuCzP8pKYrI0HKrXBxz
         BIM6XiH6vThO3izlGPKhKR6BptUu8P/6ONmSyj4l53FHFCUS6CVoLzdD7ua9dY8FrU
         Eq6hKHSdSw0u1Tpg9TUw2EW8zKoLFc80NDWuguxscy4Q93ejJYY3RoDvMzK2JO6rxy
         vK0thEAwU5MWKJCOJk1s3s7clpOg240exXpRN0TJjRUx/xIF7NVvA1OVhVtLnpQ17Z
         jFDROW5ML6fsQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 9A1B7A006F;
        Sun, 26 Jul 2020 01:37:08 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sat, 25 Jul 2020 18:37:08 -0700
Date:   Sat, 25 Jul 2020 18:37:08 -0700
Message-Id: <d13f757adcf742ad1f87aed946aeaef160539ce2.1595727196.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595727196.git.thinhn@synopsys.com>
References: <cover.1595727196.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v4 12/12] usb: dwc3: gadget: Set speed only up to the max supported
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The setting of device speed should be limited by the device's
maximum_speed. This patch adds a check and prevent the driver from
attempting to configure higher than the maximum_speed.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Changes in v4:
 - None
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/dwc3/gadget.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 05defaf0f745..f62a9519287a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2276,6 +2276,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				  enum usb_device_speed speed)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
+	enum usb_device_speed	selected_speed = speed;
 	unsigned long		flags;
 	u32			reg;
 
@@ -2300,7 +2301,10 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	    !dwc->dis_metastability_quirk) {
 		reg |= DWC3_DCFG_SUPERSPEED;
 	} else {
-		switch (speed) {
+		if (speed > dwc->maximum_speed)
+			selected_speed = dwc->maximum_speed;
+
+		switch (selected_speed) {
 		case USB_SPEED_LOW:
 			reg |= DWC3_DCFG_LOWSPEED;
 			break;
@@ -2320,7 +2324,8 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 			break;
 		default:
-			dev_err(dwc->dev, "invalid speed (%d)\n", speed);
+			dev_err(dwc->dev, "invalid speed (%d)\n",
+				selected_speed);
 
 			if (DWC3_IP_IS(DWC3))
 				reg |= DWC3_DCFG_SUPERSPEED;
@@ -2329,7 +2334,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 		}
 	}
 
-	if (DWC3_IP_IS(DWC32) && speed < USB_SPEED_SUPER_PLUS)
+	if (DWC3_IP_IS(DWC32) && selected_speed < USB_SPEED_SUPER_PLUS)
 		reg &= ~DWC3_DCFG_NUMLANES(~0);
 
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
-- 
2.11.0

