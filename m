Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D84FE1290
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 08:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389521AbfJWG6a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 02:58:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44336 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfJWG6a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 02:58:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 51AB860271; Wed, 23 Oct 2019 06:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571813909;
        bh=CXe3fnvFAEVNuq72rDcTAbCtLMuTM6Ca+3p5/3zlw64=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jNxB8qkMLQ19BQvdqyzyQS4skWNiPu13qjapa1Ha4jDFBhq1d3qCjoJL8Nifvd6Jd
         fVhQrs6A4xJpp234QVVPlYSjr+B+ni2+nzQT9dBKpzc8plz9gk/XZnqO9U2DYDuR8w
         boZdTszPJXB22Bh+d91RAQ242vT2jsyRPqUIZ/iU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C45E6090E;
        Wed, 23 Oct 2019 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571813908;
        bh=CXe3fnvFAEVNuq72rDcTAbCtLMuTM6Ca+3p5/3zlw64=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NiwmGE+T9LNiaFZ7ziKMrR31XGaLd5E2aK0QJQ7sDb2xpogm2ywmh29R7LgVJXxT1
         XiqAeTYaK5spwo0Miinp38oH+JAFjtU1AiKBZwfe6Qac4Lr3SvYYs5uoWBIwYmR1lu
         ZgC9krMMV7xPL487iLYrY8kCsjntNHqsWFMvdVsQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C45E6090E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Jack Pham <jackp@codeaurora.org>
Subject: [PATCH 2/2] usb: gadget: composite: Support more than 500mA MaxPower
Date:   Tue, 22 Oct 2019 23:57:53 -0700
Message-Id: <20191023065753.32722-2-jackp@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023065753.32722-1-jackp@codeaurora.org>
References: <20191023065753.32722-1-jackp@codeaurora.org>
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
   at USB 2.0 or below, likely wrapping around UINT8_MAX since
   the 2mA multiplier corresponds to a maximum of 610mA.

Fix these by adding checks against the current gadget->speed
when the c->MaxPower value is used and appropriately limit
based on whether it is currently at a low-/full-/high- or super-
speed connection.

Incidentally, 900 is not divisble by 8, so even for super-speed
the bMaxPower neds to be capped at 896mA, otherwise due to the
round-up division a MaxPower of 900 will result in an encoded
value of 904mA and many host stacks (including Linux and Windows)
of a root port will reject the configuration.

N.B. USB 3.2 Gen N x 2 allows for up to 1500mA but there doesn't
seem to be any any peripheral controller supported by Linux that
does two lane operation, so for now keeping the clamp at 900
should be fine.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/gadget/composite.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index e1db94d1fe2e..92ce3018f482 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -438,9 +438,10 @@ static u8 encode_bMaxPower(enum usb_device_speed speed,
 	if (!val)
 		return 0;
 	if (speed < USB_SPEED_SUPER)
-		return DIV_ROUND_UP(val, 2);
+		return DIV_ROUND_UP(min(val, 500U), 2);
 	else
-		return DIV_ROUND_UP(val, 8);
+		/* USB 3.x supports 900mA, but that isn't divisible by 8... */
+		return DIV_ROUND_UP(min(val, 896U), 8);
 }
 
 static int config_buf(struct usb_configuration *config,
@@ -852,6 +853,10 @@ static int set_config(struct usb_composite_dev *cdev,
 
 	/* when we return, be sure our power usage is valid */
 	power = c->MaxPower ? c->MaxPower : CONFIG_USB_GADGET_VBUS_DRAW;
+	if (gadget->speed < USB_SPEED_SUPER)
+		power = min(power, 500U);
+	else
+		power = min(power, 900U);
 done:
 	usb_gadget_vbus_draw(gadget, power);
 	if (result >= 0 && cdev->delayed_status)
@@ -2289,6 +2294,10 @@ void composite_resume(struct usb_gadget *gadget)
 		}
 
 		maxpower = cdev->config->MaxPower;
+		if (gadget->speed < USB_SPEED_SUPER)
+			maxpower = min_t(u16, maxpower, 500U);
+		else
+			maxpower = min_t(u16, maxpower, 900U);
 
 		usb_gadget_vbus_draw(gadget, maxpower ?
 			maxpower : CONFIG_USB_GADGET_VBUS_DRAW);
-- 
2.21.0

