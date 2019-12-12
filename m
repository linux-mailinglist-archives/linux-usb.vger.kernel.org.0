Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED1F11C391
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbfLLCt5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:49:57 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41556 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727809AbfLLCt5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:49:57 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9ADB2404D4;
        Thu, 12 Dec 2019 02:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118996; bh=1nFrHquWmo0pLk8nxm3hCcqwlRp/L/59vEK/SXOpuG4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=HmDAHLGjo0t9KwqtCebNAOhcGb70azLwV7/C/2TISfffsPyvR8bApcFF/owrffGgv
         qa7ACHCMCbYyJyMo9EqbbH32Xd5RUbfvuBVlWexfYruqeYCDk572daTPsFeHT5yJYW
         Gr51uI31Orv143sZjQy9d73lJ44yoeheETYY72CUZFLUGlWR93kdZTnvpEov07on1s
         wkxZItwf9If1otgZmH+Vf16uta6kV3/JxTmlM/nldqghD2mqcWDktgtCNrEqXP7Pp4
         IPYVtZ8zmPS0ryJs7XFg1aYcjbvt4HDHKw6Srd5bensdt1hf+B3pH+Y3uvWRJ4x9GH
         bDg6CtzuYrRyg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8625DA007B;
        Thu, 12 Dec 2019 02:49:55 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:49:55 -0800
Date:   Wed, 11 Dec 2019 18:49:55 -0800
Message-Id: <dd7817eaa55d28642f9fbc9276e4637dbffe8b2b.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 09/14] usb: dwc3: gadget: Limit the setting of speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The setting of device speed should be limited by the device property
maximum_speed. This patch adds a check and limit that setting.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 06325e269234..d56feea01066 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2126,6 +2126,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				  enum usb_device_speed speed)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
+	enum usb_device_speed	allowable_speed = speed;
 	unsigned long		flags;
 	u32			reg;
 
@@ -2150,7 +2151,10 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	    !dwc->dis_metastability_quirk) {
 		reg |= DWC3_DCFG_SUPERSPEED;
 	} else {
-		switch (speed) {
+		if (speed > dwc->maximum_speed)
+			allowable_speed = dwc->maximum_speed;
+
+		switch (allowable_speed) {
 		case USB_SPEED_LOW:
 			reg |= DWC3_DCFG_LOWSPEED;
 			break;
@@ -2170,7 +2174,8 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 			break;
 		default:
-			dev_err(dwc->dev, "invalid speed (%d)\n", speed);
+			dev_err(dwc->dev, "invalid speed (%d)\n",
+				allowable_speed);
 
 			if (dwc3_is_usb3(dwc))
 				reg |= DWC3_DCFG_SUPERSPEED;
-- 
2.11.0

