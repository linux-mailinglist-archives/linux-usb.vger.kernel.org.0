Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF70A2B2C14
	for <lists+linux-usb@lfdr.de>; Sat, 14 Nov 2020 09:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgKNINI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Nov 2020 03:13:08 -0500
Received: from z5.mailgun.us ([104.130.96.5]:53953 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgKNINI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Nov 2020 03:13:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605341587; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oYttXSsvr3yGBRboyetOc9UMCdoUc2jyN9VMkw7rr9U=; b=JcXJTBtFsvbVS6DBQnFmJSGv8Vs6RLqyYabwdbClfw8ZgLbWOJd7USDoUchvUVoYXtsm71cH
 CqObJSPxIL0BxKwUvxKS3JY2d62Vk5ZO9dB8EX9hwk3YImN7ecDEFdl38L6Kz4sdEWm+i88D
 IhwWdy11xJdPzqGsweAjhxRlkks=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5faf9185d3e05bb6db809355 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 14 Nov 2020 08:12:53
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7A30FC433CB; Sat, 14 Nov 2020 08:12:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ACA04C433F0;
        Sat, 14 Nov 2020 08:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ACA04C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 3/3] usb: gadget: configfs: Add a specific configFS reset callback
Date:   Sat, 14 Nov 2020 00:12:47 -0800
Message-Id: <20201114081247.25063-4-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201114081247.25063-1-wcheng@codeaurora.org>
References: <20201114081247.25063-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In order for configFS based USB gadgets to set the proper charge current
for bus reset scenarios, expose a separate reset callback to set the
current to 100mA based on the USB battery charging specification.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/gadget/configfs.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 56051bb97349..80ca7ff2fb97 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1481,6 +1481,28 @@ static void configfs_composite_disconnect(struct usb_gadget *gadget)
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }
 
+static void configfs_composite_reset(struct usb_gadget *gadget)
+{
+	struct usb_composite_dev *cdev;
+	struct gadget_info *gi;
+	unsigned long flags;
+
+	cdev = get_gadget_data(gadget);
+	if (!cdev)
+		return;
+
+	gi = container_of(cdev, struct gadget_info, cdev);
+	spin_lock_irqsave(&gi->spinlock, flags);
+	cdev = get_gadget_data(gadget);
+	if (!cdev || gi->unbind) {
+		spin_unlock_irqrestore(&gi->spinlock, flags);
+		return;
+	}
+
+	composite_reset(gadget);
+	spin_unlock_irqrestore(&gi->spinlock, flags);
+}
+
 static void configfs_composite_suspend(struct usb_gadget *gadget)
 {
 	struct usb_composite_dev *cdev;
@@ -1530,7 +1552,7 @@ static const struct usb_gadget_driver configfs_driver_template = {
 	.unbind         = configfs_composite_unbind,
 
 	.setup          = configfs_composite_setup,
-	.reset          = configfs_composite_disconnect,
+	.reset          = configfs_composite_reset,
 	.disconnect     = configfs_composite_disconnect,
 
 	.suspend	= configfs_composite_suspend,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

