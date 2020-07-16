Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677B2222E4E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 23:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgGPV7k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 17:59:40 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45456 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbgGPV7k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 17:59:40 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D3100C078F;
        Thu, 16 Jul 2020 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936779; bh=og/NNtInoyBzTFT88CauX7gkTjqH4tIoh+/Lr5DDJpA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=R1p8pTQxSoQaInwZueqdKmHcZ0/4Q+fBGD6qwahr6T687rYWqiN+OUzwZj1HjNXvw
         IswjxPmNPpMTJ8StxC+7kcZVCvaUrQ4UHCO0t2mj3Icu5sEaA/5GJpO83z+wvgL4pE
         ncVJ+M4i7jgjlwQf5hGydVgMI+EKjbWCGA3Yp/3OYbkAItbB8A9Q7lkzO3hmZZMGzP
         jfLWtx1qIyoEkZiqqbqBDnq1XNlTmkXbPCIiY7PhpwUeHVv/Jc+ZRHtyF2rRlOEsuO
         LqISIobBxJepix0WRLZB5ixbOGN2yeuIxjU4Zt+zj97Gq5MZWOUrRsXeHL6UfwgcaM
         qoftjltQKafZA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A339EA0258;
        Thu, 16 Jul 2020 21:59:38 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:59:38 -0700
Date:   Thu, 16 Jul 2020 14:59:38 -0700
Message-Id: <8717065db3097cc0beedb0f6cf7e8fff52b1ba91.1594935978.git.thinhn@synopsys.com>
In-Reply-To: <cover.1594935978.git.thinhn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 11/11] usb: dwc3: gadget: Set speed only up to the max supported
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
 drivers/usb/dwc3/gadget.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 87a69a096b57..155251d67b4d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2254,6 +2254,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				  enum usb_device_speed speed)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
+	enum usb_device_speed	selected_speed = speed;
 	unsigned long		flags;
 	u32			reg;
 
@@ -2278,7 +2279,10 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
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
@@ -2298,7 +2302,8 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 			break;
 		default:
-			dev_err(dwc->dev, "invalid speed (%d)\n", speed);
+			dev_err(dwc->dev, "invalid speed (%d)\n",
+				selected_speed);
 
 			if (DWC3_IP_IS(DWC3))
 				reg |= DWC3_DCFG_SUPERSPEED;
@@ -2307,7 +2312,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 		}
 	}
 
-	if (DWC3_IP_IS(DWC32) && speed < USB_SPEED_SUPER_PLUS)
+	if (DWC3_IP_IS(DWC32) && selected_speed < USB_SPEED_SUPER_PLUS)
 		reg &= ~DWC3_DCFG_NUMLANES(~0);
 
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
-- 
2.11.0

