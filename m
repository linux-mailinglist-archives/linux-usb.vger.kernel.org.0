Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F93277E15
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgIYCmK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:42:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50854 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726829AbgIYCmJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:42:09 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 485A540624;
        Fri, 25 Sep 2020 02:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001729; bh=TBeZIl7QPvmU04DUqCJEnXFPm+UzA1btzjRp1kVqZgM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=lPJZz2hUVqHgxGo7PNHBlZ8Yv3lGrmA/kaymSufXHrJUcwzpN9n33Bsoe21pMFZ2V
         aXpjJ0MlbcheyCTh9XAU8R443EjjZG06FtL3pPoabUqxCcqaQgI/cDL19njHK9vjlO
         mNFEEnzddDMP+uQqAcjvP5XytlpzfgpOo+UeDI7rXQo9ErpzkkRsjbIY49S4aWIC4F
         a48VraHfc71+e05Cv/RCaX5Zu9TitHeIMS2uApzy1FhRN+qGOT/PmWN8dP3vcqXna0
         oDt5qbFicOzRAEZtGVT0wNqHG7p4cGHd4a61C/SWX86SbDLy0F7ORzMfrPS4eZluly
         eKnk4YYEFmTtA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 9883CA0099;
        Fri, 25 Sep 2020 02:42:07 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:42:07 -0700
Date:   Thu, 24 Sep 2020 19:42:07 -0700
Message-Id: <a2fc6555a3cf4cce4180fcbd680bdc6557e8adc5.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 04/12] usb: gadget: Set max speed for SSP devices
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>, Jun Li <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A super-speed-plus device may operate at different sublink speeds (e.g.
gen2x2, gen1x2, or gen2x1). If the USB device supports different sublink
speeds at super-speed-plus, set the device to operate at the maximum
number of lanes and sublink speed possible. Introduce gadget ops
udc_set_num_lanes_and_speed to set the lane count and sublink speed for
super-speed-plus capable devices.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- Add identifier name for usb_gadget in gadget ops
  (*udc_set_num_lanes_and_speed) to avoid checkpatch warning
Changes in v3:
- None
Changes in v2:
- None

 drivers/usb/gadget/udc/core.c | 24 +++++++++++++++++++-----
 include/linux/usb/gadget.h    |  3 +++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index debf54205d22..10c0903cf311 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1117,12 +1117,26 @@ static inline void usb_gadget_udc_stop(struct usb_udc *udc)
 static inline void usb_gadget_udc_set_speed(struct usb_udc *udc,
 					    enum usb_device_speed speed)
 {
-	if (udc->gadget->ops->udc_set_speed) {
-		enum usb_device_speed s;
+	struct usb_gadget *gadget = udc->gadget;
+	enum usb_device_speed s;
 
-		s = min(speed, udc->gadget->max_speed);
-		udc->gadget->ops->udc_set_speed(udc->gadget, s);
-	}
+	if (speed == USB_SPEED_UNKNOWN)
+		s = gadget->max_speed;
+	else
+		s = min(speed, gadget->max_speed);
+
+	/*
+	 * If the UDC supports super-speed-plus and different sublink speeds,
+	 * then set the gadget to the max possible sublink speed for
+	 * super-speed-plus symmetric lanes.
+	 */
+	if (s == USB_SPEED_SUPER_PLUS &&
+	    gadget->ops->udc_set_num_lanes_and_speed)
+		gadget->ops->udc_set_num_lanes_and_speed(gadget,
+							 gadget->max_num_lanes,
+							 gadget->max_speed_ssid);
+	else if (gadget->ops->udc_set_speed)
+		gadget->ops->udc_set_speed(gadget, s);
 }
 
 /**
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index cd9433f5a602..cccf3b0fba0a 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -323,6 +323,9 @@ struct usb_gadget_ops {
 			struct usb_gadget_driver *);
 	int	(*udc_stop)(struct usb_gadget *);
 	void	(*udc_set_speed)(struct usb_gadget *, enum usb_device_speed);
+	void	(*udc_set_num_lanes_and_speed)(struct usb_gadget *gadget,
+					       unsigned int num_lanes,
+					       unsigned int ssid);
 	struct usb_ep *(*match_ep)(struct usb_gadget *,
 			struct usb_endpoint_descriptor *,
 			struct usb_ss_ep_comp_descriptor *);
-- 
2.28.0

