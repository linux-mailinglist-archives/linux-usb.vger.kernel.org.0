Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337E12E7517
	for <lists+linux-usb@lfdr.de>; Wed, 30 Dec 2020 00:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgL2XEE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 18:04:04 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:14331 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgL2XED (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Dec 2020 18:04:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609283018; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=nVA9imMdXcE8PT6MSamn4YRBP3Ps+JuFDFv3elCOHP0=; b=X8G/DJfumR1svzr+FXMpP7fBoe9tjrEs97KXXfflQ5onGDVfPB/T+ZyELDiQ58YqHX/LYzvi
 2CbvpS/BP/5i3UCmUIx66SH9xZWnWgJOBDfrQd6jmwtcp0fKZxtK7rjondlKvUZbi0zF8SsQ
 VGX2/Dhd5422bjf5CGBHsXvFV/o=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5febb5c91d5c1fa4278951ac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Dec 2020 23:03:37
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 24085C433CA; Tue, 29 Dec 2020 23:03:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0E5D4C433CA;
        Tue, 29 Dec 2020 23:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0E5D4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     peter.chen@nxp.com, balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 1/3] usb: dwc3: gadget: Introduce a DWC3 VBUS draw callback
Date:   Tue, 29 Dec 2020 15:03:29 -0800
Message-Id: <1609283011-21997-2-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609283011-21997-1-git-send-email-wcheng@codeaurora.org>
References: <1609283011-21997-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some devices support charging while in device mode.  In these situations,
the USB gadget will notify the DWC3 gadget driver to modify the current
based on the enumeration and device state.  The usb_phy_set_power() API
will allow external charger entities to adjust the charge current through
the notifier block.

Reviewed-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/gadget.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c145da1d8ba5..69122f66978e 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2387,6 +2387,16 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
+static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
+{
+	struct dwc3		*dwc = gadget_to_dwc(g);
+
+	if (dwc->usb2_phy)
+		return usb_phy_set_power(dwc->usb2_phy, mA);
+
+	return 0;
+}
+
 static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.get_frame		= dwc3_gadget_get_frame,
 	.wakeup			= dwc3_gadget_wakeup,
@@ -2396,6 +2406,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.udc_stop		= dwc3_gadget_stop,
 	.udc_set_speed		= dwc3_gadget_set_speed,
 	.get_config_params	= dwc3_gadget_config_params,
+	.vbus_draw		= dwc3_gadget_vbus_draw,
 };
 
 /* -------------------------------------------------------------------------- */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

