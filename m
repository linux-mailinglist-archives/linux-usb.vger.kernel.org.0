Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 641F114E75A
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 04:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbgAaDLS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jan 2020 22:11:18 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:61633 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727739AbgAaDLS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jan 2020 22:11:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580440277; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wqEWA4wFxI0pRS7NRnDxUYPwmvGuufP8N7JVY0M8WDU=; b=NfwWCn8adYQvjBTIntqF7c+cn6vwbGb+FzERZtvCuNHPERZtc57bLOPuw37/+8w1qaRCflBs
 lNlJR7Q5QdbF8UIX9BlnEE1ySEqd22uK9HaBmursbeNEtXJv0AyV3BoziqDWhakWIHkBRe2q
 M/QYTBNn9d9o1MKPUXkv1fXkYUE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e339acf.7fb954c75a08-smtp-out-n01;
 Fri, 31 Jan 2020 03:11:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E0A6C43383; Fri, 31 Jan 2020 03:11:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ACF3CC433CB;
        Fri, 31 Jan 2020 03:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ACF3CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v4 2/2] usb: gadget: composite: Support more than 500mA MaxPower
Date:   Thu, 30 Jan 2020 19:10:36 -0800
Message-Id: <20200131031036.28255-2-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200131031036.28255-1-jackp@codeaurora.org>
References: <20200131031036.28255-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB 3.x SuperSpeed peripherals can draw up to 900mA of VBUS power
when in configured state. However, if a configuration wanting to
take advantage of this is added with MaxPower greater than 500
(currently possible if using a ConfigFS gadget) the composite
driver fails to accommodate this for a couple reasons:

 - usb_gadget_vbus_draw() when called from set_config() and
   composite_resume() will be passed the MaxPower value without
   regard for the current connection speed, resulting in a
   violation for USB 2.0 since the max is 500mA.

 - the bMaxPower of the configuration descriptor would be
   incorrectly encoded, again if the connection speed is only
   at USB 2.0 or below, likely wrapping around U8_MAX since
   the 2mA multiplier corresponds to a maximum of 510mA.

Fix these by adding checks against the current gadget->speed
when the c->MaxPower value is used (set_config() and
composite_resume()) and appropriately limit based on whether
it is currently at a low-/full-/high- or super-speed connection.

Because 900 is not divisible by 8, with the round-up division
currently used in encode_bMaxPower() a MaxPower of 900mA will
result in an encoded value of 0x71. When a host stack (including
Linux and Windows) enumerates this on a single port root hub, it
reads this value back and decodes (multiplies by 8) to get 904mA
which is strictly greater than 900mA that is typically budgeted
for that port, causing it to reject the configuration. Instead,
we should be using the round-down behavior of normal integral
division so that 900 / 8 -> 0x70 or 896mA to stay within range.
And we might as well change it for the high/full/low case as well
for consistency.

N.B. USB 3.2 Gen N x 2 allows for up to 1500mA but there doesn't
seem to be any any peripheral controller supported by Linux that
does two lane operation, so for now keeping the clamp at 900
should be fine.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
v4: rebased on usb-next (v5.6-rc1)

v3: Change round-up to round-down division. Fixed up checks in
    composite_resume() to look more like that in set_config().

v2: Fix typos in commit text and reworded the blurb about rounding

 drivers/usb/gadget/composite.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index cd303a3ea680..223f72d4d9ed 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -438,9 +438,13 @@ static u8 encode_bMaxPower(enum usb_device_speed speed,
 	if (!val)
 		return 0;
 	if (speed < USB_SPEED_SUPER)
-		return DIV_ROUND_UP(val, 2);
+		return min(val, 500U) / 2;
 	else
-		return DIV_ROUND_UP(val, 8);
+		/*
+		 * USB 3.x supports up to 900mA, but since 900 isn't divisible
+		 * by 8 the integral division will effectively cap to 896mA.
+		 */
+		return min(val, 900U) / 8;
 }
 
 static int config_buf(struct usb_configuration *config,
@@ -852,6 +856,10 @@ static int set_config(struct usb_composite_dev *cdev,
 
 	/* when we return, be sure our power usage is valid */
 	power = c->MaxPower ? c->MaxPower : CONFIG_USB_GADGET_VBUS_DRAW;
+	if (gadget->speed < USB_SPEED_SUPER)
+		power = min(power, 500U);
+	else
+		power = min(power, 900U);
 done:
 	usb_gadget_vbus_draw(gadget, power);
 	if (result >= 0 && cdev->delayed_status)
@@ -2278,7 +2286,7 @@ void composite_resume(struct usb_gadget *gadget)
 {
 	struct usb_composite_dev	*cdev = get_gadget_data(gadget);
 	struct usb_function		*f;
-	u16				maxpower;
+	unsigned			maxpower;
 
 	/* REVISIT:  should we have config level
 	 * suspend/resume callbacks?
@@ -2292,10 +2300,14 @@ void composite_resume(struct usb_gadget *gadget)
 				f->resume(f);
 		}
 
-		maxpower = cdev->config->MaxPower;
+		maxpower = cdev->config->MaxPower ?
+			cdev->config->MaxPower : CONFIG_USB_GADGET_VBUS_DRAW;
+		if (gadget->speed < USB_SPEED_SUPER)
+			maxpower = min(maxpower, 500U);
+		else
+			maxpower = min(maxpower, 900U);
 
-		usb_gadget_vbus_draw(gadget, maxpower ?
-			maxpower : CONFIG_USB_GADGET_VBUS_DRAW);
+		usb_gadget_vbus_draw(gadget, maxpower);
 	}
 
 	cdev->suspended = 0;
-- 
2.24.0
