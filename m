Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342A322D24B
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 01:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGXXiz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 19:38:55 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52816 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726783AbgGXXiy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 19:38:54 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4D7484016D;
        Fri, 24 Jul 2020 23:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595633934; bh=u5Ndjt7UJwYlmSVfNEwvEeZmp3ViFkHox7cFIRUGt5s=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Zy5Qt9SIU1Op2/vXKqPbDCqOujF+RZjc80H4w3/xdY/GNMBjModOpNEujMtxUmOPV
         k0JfumBy/ARG4B6R17THB3q4LdA/LfGtc9eN9lqgTkEjfZtH0pFk3pvpADLiOdUmyN
         2ydesLlCKnvRd/rDWAjaUoc5CucjvXPu5ILWzLrp7N8L9nU7F2j4a3/400FnakbgCV
         Kw/7ARXYcZ0sLxu2rimjqfKxO0rIE9L1I3WSL8Dpuyx6cu98XhxYj+n+QdO7buPHou
         4ak3qOT/XDK2ZlogdM1nOao9u4wULPlaraaA25eQRQLnSeAC/uYDa/FcemRWH0tfEf
         3CIobcx80C8eQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 683AEA0096;
        Fri, 24 Jul 2020 23:38:52 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 16:38:52 -0700
Date:   Fri, 24 Jul 2020 16:38:52 -0700
Message-Id: <a8126d47799b239e9ed3c9bb6eef1ed6f6e8024a.1595631457.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 04/12] usb: gadget: Set max speed for SSP devices
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Roger Quadros <rogerq@ti.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A super-speed-plus device may operate at different sublink speeds (e.g.
gen2x2, gen1x2, or gen2x1). If the USB device supports different sublink
speeds at super-speed-plus, set the device to operate at the maximum
number of lanes and sublink speed possible. Introduce gadget ops
udc_set_num_lanes_and_speed to set the lane count and sublink speed for
super-speed-plus capable devices.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/gadget/udc/core.c | 24 +++++++++++++++++++-----
 include/linux/usb/gadget.h    |  3 +++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 4f82bcd31fd3..e5f569dc9ee0 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1114,12 +1114,26 @@ static inline void usb_gadget_udc_stop(struct usb_udc *udc)
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
index bd982669609c..0a4f72cfe3c4 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -323,6 +323,9 @@ struct usb_gadget_ops {
 			struct usb_gadget_driver *);
 	int	(*udc_stop)(struct usb_gadget *);
 	void	(*udc_set_speed)(struct usb_gadget *, enum usb_device_speed);
+	void	(*udc_set_num_lanes_and_speed)(struct usb_gadget *,
+					       unsigned int num_lanes,
+					       unsigned int ssid);
 	struct usb_ep *(*match_ep)(struct usb_gadget *,
 			struct usb_endpoint_descriptor *,
 			struct usb_ss_ep_comp_descriptor *);
-- 
2.11.0

