Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43832B2C16
	for <lists+linux-usb@lfdr.de>; Sat, 14 Nov 2020 09:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgKNINJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Nov 2020 03:13:09 -0500
Received: from z5.mailgun.us ([104.130.96.5]:21085 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbgKNINI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Nov 2020 03:13:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605341588; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PKB5XOOkfINAZgloSMx1fyL8MXZucBTUB4IzGca1/Hc=; b=XcOXGHJCZvig5fvfpTaw0Bft5/KmjGTbfwrytRss9TotOUQ9D6XFz0ShzhDApj22ywQFCj3C
 GOmn5m1V0L9a81H3R6GiOS+v1ozaDYbFYOl+V4MYZPn4DAZdKlQMnlCUY1vtqx0c8Xx7xW3H
 012AFfipJyHXQqLF99HtVnD5foI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5faf918557dd92cbec798498 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 14 Nov 2020 08:12:53
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E0482C433C8; Sat, 14 Nov 2020 08:12:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 21240C433C9;
        Sat, 14 Nov 2020 08:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 21240C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 2/3] usb: gadget: composite: Split composite reset and disconnect
Date:   Sat, 14 Nov 2020 00:12:46 -0800
Message-Id: <20201114081247.25063-3-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201114081247.25063-1-wcheng@codeaurora.org>
References: <20201114081247.25063-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a specific composite reset API to differentiate between disconnect and
reset events.  This is needed for adjusting the current draw accordingly
based on the USB battery charging specification.  The device is only allowed
to draw the 500/900 mA (HS/SS) while in the CONFIGURED state, and only 100 mA
in the connected and UNCONFIGURED state.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/gadget/composite.c | 21 +++++++++++++++++++--
 include/linux/usb/composite.h  |  2 ++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 05b176c82cc5..a41f7fe4b518 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2036,7 +2036,7 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 	return value;
 }
 
-void composite_disconnect(struct usb_gadget *gadget)
+static void __composite_disconnect(struct usb_gadget *gadget)
 {
 	struct usb_composite_dev	*cdev = get_gadget_data(gadget);
 	unsigned long			flags;
@@ -2053,6 +2053,23 @@ void composite_disconnect(struct usb_gadget *gadget)
 	spin_unlock_irqrestore(&cdev->lock, flags);
 }
 
+void composite_disconnect(struct usb_gadget *gadget)
+{
+	usb_gadget_vbus_draw(gadget, 0);
+	__composite_disconnect(gadget);
+}
+
+void composite_reset(struct usb_gadget *gadget)
+{
+	/*
+	 * Section 1.4.13 Standard Downstream Port of the USB battery charging
+	 * specification v1.2 states that a device connected on a SDP shall only
+	 * draw at max 100mA while in a connected, but unconfigured state.
+	 */
+	usb_gadget_vbus_draw(gadget, 100);
+	__composite_disconnect(gadget);
+}
+
 /*-------------------------------------------------------------------------*/
 
 static ssize_t suspended_show(struct device *dev, struct device_attribute *attr,
@@ -2373,7 +2390,7 @@ static const struct usb_gadget_driver composite_driver_template = {
 	.unbind		= composite_unbind,
 
 	.setup		= composite_setup,
-	.reset		= composite_disconnect,
+	.reset		= composite_reset,
 	.disconnect	= composite_disconnect,
 
 	.suspend	= composite_suspend,
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 2040696d75b6..0d8a71471512 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -525,6 +525,8 @@ extern struct usb_string *usb_gstrings_attach(struct usb_composite_dev *cdev,
 extern int usb_string_ids_n(struct usb_composite_dev *c, unsigned n);
 
 extern void composite_disconnect(struct usb_gadget *gadget);
+extern void composite_reset(struct usb_gadget *gadget);
+
 extern int composite_setup(struct usb_gadget *gadget,
 		const struct usb_ctrlrequest *ctrl);
 extern void composite_suspend(struct usb_gadget *gadget);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

