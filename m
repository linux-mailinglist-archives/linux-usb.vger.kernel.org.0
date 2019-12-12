Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD2011C389
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfLLCtO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:49:14 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:38140 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727811AbfLLCtO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:49:14 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 97B67C000E;
        Thu, 12 Dec 2019 02:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118953; bh=+uv0aGizPwuI7iAjKoi6qG7ZIqceYDZDhWw64zlhCm4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Wj9go4s2Q4bpsy9gmZGUvwgwSLUse7I1Toblr/G29KgZgRDCzvW8E/DtXjcsNNNXy
         JyoKsXX5luTsmOZHH7NNt0gWF6LDCFPU/55W3GAWQo5aLsAZvmyS1NWXc/RTM/IG3m
         jUEwVlh7I7uWalcrJI5tfpRY1BH/nvXhzPpTpCaZeKBpPxBvCi8cRjJeIpT2uqIL5d
         fa3Q1ERlWsutQXbAFrkocARNaAc9dEerNsrRJYjDE3OjX6W5uZgqi87iTb1stdbhgg
         B3pRDzbX2+EKASel5GQj5L3Aj4XT4L+L0lUvn50CazFJ7e+GfRuEmBcuA2Ex+tmBZs
         83U21InYPilyA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 68920A007C;
        Thu, 12 Dec 2019 02:49:12 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:49:12 -0800
Date:   Wed, 11 Dec 2019 18:49:12 -0800
Message-Id: <25394a433bb79ddf36d0ec52bc998b164e373bf4.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 02/14] usb: gadget: Add callback to set lane and transfer rate
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Roger Quadros <rogerq@ti.com>, zhengbin <zhengbin13@huawei.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce gadget opts udc_set_sublink_speed callback to set the lane
count and transfer rate (in lane speed mantissa of Gbps) for SuperSpeed
Plus capable gadgets. In the same way udc_set_speed, this function can
control the gadget's sublink attributes for SuperSpeed Plus.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/gadget/composite.c           |  2 ++
 drivers/usb/gadget/legacy/mass_storage.c |  2 ++
 drivers/usb/gadget/udc/core.c            | 38 +++++++++++++++++++++++++++++++-
 include/linux/usb/gadget.h               |  3 +++
 4 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 3b4f67000315..a4de5a8c0f19 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2353,6 +2353,8 @@ int usb_composite_probe(struct usb_composite_driver *driver)
 	gadget_driver->function =  (char *) driver->name;
 	gadget_driver->driver.name = driver->name;
 	gadget_driver->max_speed = driver->max_speed;
+	gadget_driver->max_lane_count = driver->max_lane_count;
+	gadget_driver->max_lsm = driver->max_lsm;
 
 	return usb_gadget_probe_driver(gadget_driver);
 }
diff --git a/drivers/usb/gadget/legacy/mass_storage.c b/drivers/usb/gadget/legacy/mass_storage.c
index f18f77584fc2..a0912c5afffc 100644
--- a/drivers/usb/gadget/legacy/mass_storage.c
+++ b/drivers/usb/gadget/legacy/mass_storage.c
@@ -223,6 +223,8 @@ static struct usb_composite_driver msg_driver = {
 	.name		= "g_mass_storage",
 	.dev		= &msg_device_desc,
 	.max_speed	= USB_SPEED_SUPER_PLUS,
+	.max_lane_count	= 2,
+	.max_lsm	= 10,
 	.needs_serial	= 1,
 	.strings	= dev_strings,
 	.bind		= msg_bind,
diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 51fa614b4079..a3b106a22a6e 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1120,6 +1120,35 @@ static inline void usb_gadget_udc_set_speed(struct usb_udc *udc,
 	}
 }
 
+/**
+ * usb_gadget_udc_set_sublink_attr - tells usb device controller the sublink
+ *    attributes supported by the current driver
+ * @udc: The device we want to set maximum speed
+ * @lane_count: The maximum number of lanes to connect
+ * @lsm: The maximum lane speed mantissa in Gbps to run
+ *
+ * In the same way as usb_gadget_udc_set_speed(), this function can set the
+ * gadget's sublink attributes for SuperSpeed Plus.
+ *
+ * This call is issued by the UDC Class driver before calling
+ * usb_gadget_udc_start() in order to make sure that we don't try to
+ * connect on speeds the gadget driver doesn't support.
+ */
+static inline void usb_gadget_udc_set_sublink_attr(struct usb_udc *udc,
+						   unsigned int lane_count,
+						   unsigned int lsm)
+{
+	if (udc->gadget->ops->udc_set_sublink_attr) {
+		unsigned int rate;
+		unsigned int lanes;
+
+		rate = min(lsm, udc->gadget->max_lsm);
+		lanes = min(lane_count, udc->gadget->max_lane_count);
+		udc->gadget->ops->udc_set_sublink_attr(udc->gadget,
+						       lanes, rate);
+	}
+}
+
 /**
  * usb_udc_release - release the usb_udc struct
  * @dev: the dev member within usb_udc
@@ -1353,7 +1382,14 @@ static int udc_bind_to_driver(struct usb_udc *udc, struct usb_gadget_driver *dri
 	udc->dev.driver = &driver->driver;
 	udc->gadget->dev.driver = &driver->driver;
 
-	usb_gadget_udc_set_speed(udc, driver->max_speed);
+	if (udc->gadget->ops->udc_set_sublink_attr &&
+	    udc->gadget->max_speed == USB_SPEED_SUPER_PLUS &&
+	    driver->max_lsm && driver->max_lane_count &&
+	    driver->max_speed == USB_SPEED_SUPER_PLUS)
+		usb_gadget_udc_set_sublink_attr(udc, driver->max_lane_count,
+						driver->max_lsm);
+	else
+		usb_gadget_udc_set_speed(udc, driver->max_speed);
 
 	ret = driver->bind(udc->gadget, driver);
 	if (ret)
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index cb7531a6f784..a8ee2480b408 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -319,6 +319,9 @@ struct usb_gadget_ops {
 			struct usb_gadget_driver *);
 	int	(*udc_stop)(struct usb_gadget *);
 	void	(*udc_set_speed)(struct usb_gadget *, enum usb_device_speed);
+	void	(*udc_set_sublink_attr)(struct usb_gadget *,
+					unsigned int lane_count,
+					unsigned int lsm);
 	struct usb_ep *(*match_ep)(struct usb_gadget *,
 			struct usb_endpoint_descriptor *,
 			struct usb_ss_ep_comp_descriptor *);
-- 
2.11.0

