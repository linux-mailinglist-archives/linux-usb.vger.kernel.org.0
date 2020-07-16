Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32307222E45
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 23:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGPV66 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 17:58:58 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45404 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726201AbgGPV66 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 17:58:58 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 48D18C03D2;
        Thu, 16 Jul 2020 21:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936737; bh=4+YAjCQBeKFdrlVajc/fPuGvpK7dEUGHfe+2ncOcBs0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=WlXhaqDflhwLRAIi97XKWFLQGc8c6Lgt3G/SMIZAFTKHh29rNOkDK3G8oiGji4LfK
         zlkvCQA2eYhQd8368pSa2oh+/yW6XgdyeVlCLG2Qvhmcn2X+SWuS1m8CQWYN4EB1ap
         6aUv19ISaN/Pv+nJfWEM3jyOs3mzleiBVh+oM7A5ZBm25a2sdcch/KRRLJrdHW2pIj
         c86B27X4c+mqZ5j4pP7OkuM/+wmCikfNlqe3QboaFuxViEBwwyLtMgBElMOLO4bdVo
         FM6WqbKpbs8PPcUx2r6cVYp3+zORdCdsYPQThsMbmvGYDsmu8H53VUWztpY9R/+9+P
         +Mqnkw4Gt+xvA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B9F9DA022C;
        Thu, 16 Jul 2020 21:58:55 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:58:55 -0700
Date:   Thu, 16 Jul 2020 14:58:55 -0700
Message-Id: <9df612e56f3f67c570eca02ab171a3f45510553b.1594935978.git.thinhn@synopsys.com>
In-Reply-To: <cover.1594935978.git.thinhn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 04/11] usb: gadget: Set max speed for SSP devices
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Roger Quadros <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
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
 drivers/usb/gadget/udc/core.c | 24 +++++++++++++++++++-----
 include/linux/usb/gadget.h    |  3 +++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 2e28dde8376f..1e916b3943fe 100644
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

