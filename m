Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65034176B59
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 03:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbgCCCtk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Mar 2020 21:49:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:45936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728917AbgCCCtk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Mar 2020 21:49:40 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3ADFB24697;
        Tue,  3 Mar 2020 02:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583203778;
        bh=XyfNhyeu8A4tgYWzLYud2ewpbACq3730lnYX41eebGQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OQvPf53gi5VDkxgg6Hgw29OBxI71f8zv9pwGZuGLC17VdStYc+PBKGd/CagH7KA97
         rfxWheQpcSdjeZm/5Fz6X723yDKm96V/frtUhZCNeh89q6/8chIASB2K4/kJQTUeL7
         RQtZmEuAsnxrx+DMCXpOWpuiMNZrymL73A7Zl5EY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jack Pham <jackp@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 04/22] usb: gadget: composite: Support more than 500mA MaxPower
Date:   Mon,  2 Mar 2020 21:49:15 -0500
Message-Id: <20200303024933.10371-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303024933.10371-1-sashal@kernel.org>
References: <20200303024933.10371-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jack Pham <jackp@codeaurora.org>

[ Upstream commit a2035411fa1d1206cea7d5dfe833e78481844a76 ]

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
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/composite.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 6e30b177aa224..5a4cf779b2692 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -441,9 +441,13 @@ static u8 encode_bMaxPower(enum usb_device_speed speed,
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
@@ -841,6 +845,10 @@ static int set_config(struct usb_composite_dev *cdev,
 
 	/* when we return, be sure our power usage is valid */
 	power = c->MaxPower ? c->MaxPower : CONFIG_USB_GADGET_VBUS_DRAW;
+	if (gadget->speed < USB_SPEED_SUPER)
+		power = min(power, 500U);
+	else
+		power = min(power, 900U);
 done:
 	usb_gadget_vbus_draw(gadget, power);
 	if (result >= 0 && cdev->delayed_status)
@@ -2280,7 +2288,7 @@ void composite_resume(struct usb_gadget *gadget)
 {
 	struct usb_composite_dev	*cdev = get_gadget_data(gadget);
 	struct usb_function		*f;
-	u16				maxpower;
+	unsigned			maxpower;
 
 	/* REVISIT:  should we have config level
 	 * suspend/resume callbacks?
@@ -2294,10 +2302,14 @@ void composite_resume(struct usb_gadget *gadget)
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
2.20.1

