Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975962FC6EC
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 02:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbhATBiA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 20:38:00 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47308 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730690AbhATBhm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 20:37:42 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8E662C00AF;
        Wed, 20 Jan 2021 01:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1611106601; bh=/Od4x7TMuGQaxDBKbCNGNEOLL331Eb+0dM4nSypOd3c=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=FFJzWlxwCFYTOBAZRgv6z7+pH+SMuuRIIJCOqv4mncMqsgz8tqXDWOY+BbW16vZNm
         bmD4VhCA0fHcyBu8Mti+M3JMKcmtvSFFAoEPb/61DTN2Zv9Y4+O4lLSpb+7kJXE1hx
         xigYof8Pfc8gzcp5OiTiyXyTDrwWv4zvdRil43ZOAGoZGHZ/H+lcd3ZBOiod/H5mZN
         PsKVUwC9LYZtzOc2yGhy0j3Eb/gxdp0qm9S+R5swYBGUXgR/Pja4YOT4PlY04Tu8rL
         rDnUI/+8HRitzTlct1bRirYgq9Rk3CY1A+5XgOw0vTI0ntOq6wX6x62aTkklQ3Wyrt
         dCFuXdNFeK31w==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 37052A0096;
        Wed, 20 Jan 2021 01:36:40 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 19 Jan 2021 17:36:40 -0800
Date:   Tue, 19 Jan 2021 17:36:40 -0800
Message-Id: <4fae4a9ebb60464d64d8b8f6fdfc2777a2206a69.1611106162.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v7 6/6] usb: dwc3: gadget: Set speed only up to the max supported
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The setting of the device speed should be limited by the device's
maximum_speed. Check and prevent the driver from attempting to configure
higher than the maximum_speed.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v7:
- Rebase on Greg's usb-testing branch
Changes in v6:
- Rebase on Greg's usb-testing branch
- Update to follow the latest change of dwc3 on Greg's usb-testing branch
- Update commit message
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- None

 drivers/usb/dwc3/gadget.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0aa89e704a55..9acf515f6a67 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2064,9 +2064,14 @@ static void __dwc3_gadget_set_ssp_rate(struct dwc3 *dwc)
 
 static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
 {
+	enum usb_device_speed	speed;
 	u32			reg;
 
-	if (dwc->gadget_max_speed == USB_SPEED_SUPER_PLUS &&
+	speed = dwc->gadget_max_speed;
+	if (speed > dwc->maximum_speed)
+		speed = dwc->maximum_speed;
+
+	if (speed == USB_SPEED_SUPER_PLUS &&
 	    DWC3_IP_IS(DWC32)) {
 		__dwc3_gadget_set_ssp_rate(dwc);
 		return;
@@ -2092,7 +2097,7 @@ static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
 	    !dwc->dis_metastability_quirk) {
 		reg |= DWC3_DCFG_SUPERSPEED;
 	} else {
-		switch (dwc->gadget_max_speed) {
+		switch (speed) {
 		case USB_SPEED_LOW:
 			reg |= DWC3_DCFG_LOWSPEED;
 			break;
@@ -2112,7 +2117,7 @@ static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 			break;
 		default:
-			dev_err(dwc->dev, "invalid speed (%d)\n", dwc->gadget_max_speed);
+			dev_err(dwc->dev, "invalid speed (%d)\n", speed);
 
 			if (DWC3_IP_IS(DWC3))
 				reg |= DWC3_DCFG_SUPERSPEED;
@@ -2122,8 +2127,8 @@ static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
 	}
 
 	if (DWC3_IP_IS(DWC32) &&
-	    dwc->gadget_max_speed > USB_SPEED_UNKNOWN &&
-	    dwc->gadget_max_speed < USB_SPEED_SUPER_PLUS)
+	    speed > USB_SPEED_UNKNOWN &&
+	    speed < USB_SPEED_SUPER_PLUS)
 		reg &= ~DWC3_DCFG_NUMLANES(~0);
 
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
-- 
2.28.0

