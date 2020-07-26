Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260C122DB31
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 03:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgGZBgW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 21:36:22 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:44738 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726870AbgGZBgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 21:36:21 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 244FBC00A4;
        Sun, 26 Jul 2020 01:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595727381; bh=IoIpYWUbBgyDgfAVz1ui3L1DGhQB8+u/80SeUDRgvZE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=k48CT+LqSudhiOAAh7n5jEsJwVPOWkGqazLFew7cET273UPsahLma3/M+opAkTCtq
         Hm4alGCo+RAayErfLXVpq1w6GGn3hLG56EcrvsqB7BDGzAHuXUL/bcQbZfcUAmQ/UT
         WEJUvVJwdTSfw/dHyaejwxdG9Bh5hj9lDVtrEtRN5MlLNVwAHRMQ3WdlzSImQkKOdm
         barY+s43VyGfgB+YE95C1pCAGmC74+UBRzr/6pWjNwOhQypWbLfqYM6ZW5H64DY6Mu
         m1107D5CvVt8DpKMc2VHgla3nOt8G0bxc/lbVazuH/q4Dwm3LnNj8l4Mh3PXrTYf3C
         vTOiMOmvPRquA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 67A19A0099;
        Sun, 26 Jul 2020 01:36:18 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sat, 25 Jul 2020 18:36:18 -0700
Date:   Sat, 25 Jul 2020 18:36:18 -0700
Message-Id: <ca08434f44e6649aa3e3fe93e3aa7f3488cd0fb3.1595727196.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595727196.git.thinhn@synopsys.com>
References: <cover.1595727196.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v4 04/12] usb: gadget: Set max speed for SSP devices
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
index d25aefaacba0..3bbd8d7a80ad 100644
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
2.11.0

