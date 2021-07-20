Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8F93CF5DC
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 10:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhGTHbO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 03:31:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10666 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233955AbhGTHaJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Jul 2021 03:30:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626768647; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=GDDAIIRW8L9Y1qw9IzLhoYgOdUsjfao0Yv3U2Ll8bkE=; b=uRTxxP2GRtlaveIeIOKnvR/D94162UgspItByNenV6hYdzfXR1vJamS9cu0UJgNRh9Nnh22m
 lRDIC7xfG2/6twv/IP49qxN7v3N0pf/j9/ovXf8jjXskYPsrz5rZuyCH2SW3CloAkR1D4CpL
 Q/W4C+AFWKJWeeywk5f47Yf6AXQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f684f7c923fb7e0959c0ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 08:10:31
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15000C4360C; Tue, 20 Jul 2021 08:10:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0F8AC4338A;
        Tue, 20 Jul 2021 08:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C0F8AC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Jack Pham <jackp@codeaurora.org>,
        Ronak Vijay Raheja <rraheja@codeaurora.org>
Subject: [PATCH] usb: gadget: composite: Allow bMaxPower=0 if self-powered
Date:   Tue, 20 Jul 2021 01:09:07 -0700
Message-Id: <20210720080907.30292-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the composite driver encodes the MaxPower field of
the configuration descriptor by reading the c->MaxPower of the
usb_configuration only if it is non-zero, otherwise it falls back
to using the value hard-coded in CONFIG_USB_GADGET_VBUS_DRAW.
However, there are cases when a configuration must explicitly set
bMaxPower to 0, particularly if its bmAttributes also has the
Self-Powered bit set, which is a valid combination.

This is specifically called out in the USB PD specification section
9.1, in which a PDUSB device "shall report zero in the bMaxPower
field after negotiating a mutually agreeable Contract", and also
verified by the USB Type-C Functional Test TD.4.10.2 Sink Power
Precedence Test.

The fix allows the c->MaxPower to be used for encoding the bMaxPower
even if it is 0, if the self-powered bit is also set.  An example
usage of this would be for a ConfigFS gadget to be dynamically
updated by userspace when the Type-C connection is determined to be
operating in Power Delivery mode.

Co-developed-by: Ronak Vijay Raheja <rraheja@codeaurora.org>
Signed-off-by: Ronak Vijay Raheja <rraheja@codeaurora.org>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/gadget/composite.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 72a9797dbbae..504c1cbc255d 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -482,7 +482,7 @@ static u8 encode_bMaxPower(enum usb_device_speed speed,
 {
 	unsigned val;
 
-	if (c->MaxPower)
+	if (c->MaxPower || (c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
 		val = c->MaxPower;
 	else
 		val = CONFIG_USB_GADGET_VBUS_DRAW;
@@ -936,7 +936,11 @@ static int set_config(struct usb_composite_dev *cdev,
 	}
 
 	/* when we return, be sure our power usage is valid */
-	power = c->MaxPower ? c->MaxPower : CONFIG_USB_GADGET_VBUS_DRAW;
+	if (c->MaxPower || (c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
+		power = c->MaxPower;
+	else
+		power = CONFIG_USB_GADGET_VBUS_DRAW;
+
 	if (gadget->speed < USB_SPEED_SUPER)
 		power = min(power, 500U);
 	else
-- 
2.24.0

