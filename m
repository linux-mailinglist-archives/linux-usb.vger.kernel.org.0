Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA2B2F58BF
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbhANCyx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:54:53 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54762 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727393AbhANCyw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 21:54:52 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5A421C00EB;
        Thu, 14 Jan 2021 02:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610592832; bh=wCECJLxEql/0s9XFULQniV2CTnU6HAwLxidoDcapPFY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=NePJRzVYOfW6O7u3G2IGSYp5PdQgkOoOJMvcnPDMxxD9s/b2qrCiqLGlfwdSWgT4/
         unXP/nQazdl6IZ2thxougUrBNT1oyi6z2fLFx161msuJtLT9uQ4K/yoTbKvRtxYm6a
         jG66GzYoxnvEqDj51sOwcY4gHBIIJ7MKOZKGpeoebO244jWBzKqzADsVyXjk5rEr39
         rQ1CEbFFnahsnwncdLG2UFHNDHWYcvDnQArya35FrgNvT++LD9BF8i4K0VUWGcQD5f
         N2oL83ovnchEtMO/XPwvMqep5vYNwxZGCQL0aVntEzN1lwvAzb1MU55lplv5MPTBmL
         mLQ00Jg4N4Xpw==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2BD97A007C;
        Thu, 14 Jan 2021 02:53:51 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 18:53:51 -0800
Date:   Wed, 13 Jan 2021 18:53:51 -0800
Message-Id: <4bd3b87df2020330ebfd9962a5a57b19bd3552de.1610592135.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v6 11/11] usb: dwc3: gadget: Set speed only up to the max supported
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
index f46498f6d794..c9abc5e762b6 100644
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

