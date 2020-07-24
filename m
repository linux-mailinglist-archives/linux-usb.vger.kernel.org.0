Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CA922D254
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 01:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgGXXjn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 19:39:43 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:41918 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726592AbgGXXjn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 19:39:43 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 176D5C0089;
        Fri, 24 Jul 2020 23:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595633983; bh=xAwVcmzm9Oe0n34N3OLwdBdnmXoHuL4WZkDfW7N5bU0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=D7nV1Q5UpgPOLe8PpPJup2uhNSVAWDw3QS+gTbDRvJZ1dI4HytbsfH6/1MN1uFJcq
         I/1QNDYyFjugno7xNiIjVdwljnu4bpQ7B7HzqSwRVJMrFKnVlzN9t9EGlvv6SrrmK+
         NbtP5jReuSNK/Nhm7KxpmCYzjvjW7yo/U2Fj0lZ9cZMnFQEhHhVX/CRyyzblXxfPpx
         4cZbZGh5nz4WZeJ+EvEpEtiZrTmNng9oxl0xE+CYlyIQSUFM9sluzjTs6rYF3Mcple
         8dl87ZjCR3cVsEiJY2KAyiYUr9DJNVpkbOVHkMW1OEyqkrIRIRXMLiCEb9gIsi78Bd
         qWIm5XOjvjgjg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id DBE76A0096;
        Fri, 24 Jul 2020 23:39:41 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 16:39:41 -0700
Date:   Fri, 24 Jul 2020 16:39:41 -0700
Message-Id: <fdc29491276115ff5ffdd6b340f5da8554555ba8.1595631457.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 12/12] usb: dwc3: gadget: Set speed only up to the max supported
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

