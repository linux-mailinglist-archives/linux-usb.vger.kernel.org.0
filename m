Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A77DF15141A
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 03:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgBDCFh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Feb 2020 21:05:37 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:40146 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726369AbgBDCFh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Feb 2020 21:05:37 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8B19AC00C3;
        Tue,  4 Feb 2020 02:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1580781936; bh=UELEYZuLMLEuSBFjPP7LJODnhR+789HCq27GY8QCJTQ=;
        h=Date:From:Subject:To:Cc:From;
        b=ChoBOgcjVyGQXonYGKBTlqOx+OQqxeV4fdwtVcSF2UeLYLY2WuLLwSzbrULOfNV9v
         v8JO27rGfqlGuTyw/1wDUReSf+XF0uSwj2xA0PkXTEdffW3T9Sm74VrXeU8jXt/1wM
         I6UkuEupRTwh8C8lhy9tCfen/7RZsh8/D6TI6GWT3c8zHeoQmvyIRfiRUSr8n6sm4v
         Y1NgqMi6ILYlFDckycenUOqRH76rX/iY5sYotB1/MLRP7AIetSIBJRPx9h8VNLz48T
         iMGb26vKMU3a0g9clvAGgDBTVZ4A4Y+zb2hbH+kmYBAUi4+lhoum3zcoD5/bGhuaZV
         PhynGfyozzJig==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id C2814A00CB;
        Tue,  4 Feb 2020 02:05:32 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 03 Feb 2020 18:05:32 -0800
Date:   Mon, 03 Feb 2020 18:05:32 -0800
Message-Id: <d2980d1597d171275deb6b245ff1c57e072a2930.1580780241.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2] usb: gadget: composite: Inform controller driver of self-powered
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Different configuration/condition may draw different power. Inform the
controller driver of the change so it can respond properly (e.g.
GET_STATUS request). This fixes an issue with setting MaxPower from
configfs. The composite driver doesn't check this value when setting
self-powered.

Cc: stable@vger.kernel.org
Fixes: 88af8bbe4ef7 ("usb: gadget: the start of the configfs interface")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
  - Add Cc to stable
  - Set/clear self-powered for suspend and resume also

 drivers/usb/gadget/composite.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 223f72d4d9ed..cb4950cf1cdc 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -861,6 +861,11 @@ static int set_config(struct usb_composite_dev *cdev,
 	else
 		power = min(power, 900U);
 done:
+	if (power <= USB_SELF_POWER_VBUS_MAX_DRAW)
+		usb_gadget_set_selfpowered(gadget);
+	else
+		usb_gadget_clear_selfpowered(gadget);
+
 	usb_gadget_vbus_draw(gadget, power);
 	if (result >= 0 && cdev->delayed_status)
 		result = USB_GADGET_DELAYED_STATUS;
@@ -2279,6 +2284,7 @@ void composite_suspend(struct usb_gadget *gadget)
 
 	cdev->suspended = 1;
 
+	usb_gadget_set_selfpowered(gadget);
 	usb_gadget_vbus_draw(gadget, 2);
 }
 
@@ -2307,6 +2313,9 @@ void composite_resume(struct usb_gadget *gadget)
 		else
 			maxpower = min(maxpower, 900U);
 
+		if (maxpower > USB_SELF_POWER_VBUS_MAX_DRAW)
+			usb_gadget_clear_selfpowered(gadget);
+
 		usb_gadget_vbus_draw(gadget, maxpower);
 	}
 
-- 
2.11.0

