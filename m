Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99AF422A51C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 04:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387745AbgGWCMa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 22:12:30 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34918 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387467AbgGWCM3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 22:12:29 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C6817C0086;
        Thu, 23 Jul 2020 02:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595470348; bh=rnAYw+47mEnKZG2Ss6GS1alBDC4HFlgYBgnld3FgN6A=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=jShtVkcfku/GnuSzSrvcAQcsoAexhF27MJVdydy4f3AOp5j/YI7Lyy0Pzb8cZAv8z
         4g+19+Kf6Z+3vk4VVSk6Q3BGugh1n7+d3niEzna1JtVPplU4+6zmHpxF14v+CORBWc
         aPDqvEW8CNxOdhYw86G4pOgFfVfKW6xl7zwZ3YOpNBN3fkN33hRpTENtRBpug4Ah7s
         L8Zsh/ffWKbFLg98kt5gXy/5ovVlCUwJaz4tZv07Pw8B18h4avRCbfowQequgewpVS
         m2ZE9//GUj/nw8bBPQqkMVZGVb/hG24G/7ZlHzqik9GcXfONOBbTt74Y9IShHy9sLJ
         u7O+OWIKU9fhQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 16EA2A009A;
        Thu, 23 Jul 2020 02:12:27 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 22 Jul 2020 19:12:27 -0700
Date:   Wed, 22 Jul 2020 19:12:27 -0700
Message-Id: <c1380732055c6609c5b836df2061d3e0944cd58a.1595468673.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595468673.git.thinhn@synopsys.com>
References: <cover.1595468673.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 04/12] usb: gadget: Set max speed for SSP devices
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
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
 Changes in v2:
 - None

 drivers/usb/gadget/udc/core.c | 24 +++++++++++++++++++-----
 include/linux/usb/gadget.h    |  3 +++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 5241603bd008..5fea14cc9dbd 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1112,12 +1112,26 @@ static inline void usb_gadget_udc_stop(struct usb_udc *udc)
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
index 2ab929eed928..ec4ed17e7bf5 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -322,6 +322,9 @@ struct usb_gadget_ops {
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

