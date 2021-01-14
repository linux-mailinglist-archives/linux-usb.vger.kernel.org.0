Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8765A2F58B7
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbhANCyK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:54:10 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42078 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726266AbhANCyJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 21:54:09 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1CDA74023D;
        Thu, 14 Jan 2021 02:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610592789; bh=gQUPNcqLD59RQybV3S857P7GuP31zxyogNTdApKiLWk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=PeLGxPG7eqi1qM5VdVVwetkzNm6gcIfJ574VFelIfnFYZDWdjvrnjtj8D39oAryjY
         DxYKOulPoy1DYj5NnlKlgRG4rST51NcbFZA1i1OG0egH5HNsHmibZ9RBhrouYdw4L0
         S8Ri2M999d5ZzmyoP3Hm6u6Q3MTkPqsQWhFLz+JRQXLQEvPCMYz+cYkr5FYw+/4+q7
         1ywnNpKORljkV4HF6CmerBY7BwmhL1EAYBsFnqQS5UiwCraSIZm46v58CRdNMMkWYO
         CmfaCPVdJw+y7GBv6GjSf5ny21BoVJrqsXI5tIBWfhOhrMt1iX3cbgOqK1jJkM3Vtv
         +zbfATfPsNEUg==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 0ECD6A005E;
        Thu, 14 Jan 2021 02:53:07 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 18:53:07 -0800
Date:   Wed, 13 Jan 2021 18:53:07 -0800
Message-Id: <9b85357cdadc02e3f0d653fd05f89eb46af836e1.1610592135.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v6 04/11] usb: gadget: Introduce udc_set_ssp_rate() for SSP
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A SuperSpeed Plus device may operate at different speed and lane count
(i.e. gen2x2, gen1x2, or gen2x1). Introduce gadget ops
udc_set_ssp_rate() to set the desire corresponding usb_ssp_rate for
SuperSpeed Plus capable devices.

If the USB device supports different speeds at SuperSpeed Plus, set the
device to operate with the maximum number of lanes and speed.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v6:
- Rebase on Greg's usb-testing branch
- Rename udc_set_num_lanes_and_speed() to udc_set_ssp_rate()
- Use usb_ssp_rate enum as a parameter instead of SSID
- Update commit message
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

 drivers/usb/gadget/udc/core.c | 16 +++++++++++-----
 include/linux/usb/gadget.h    |  2 ++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 98cf9216f3cb..4173acdcd35b 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1133,12 +1133,18 @@ static inline void usb_gadget_udc_stop(struct usb_udc *udc)
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
+	if (s == USB_SPEED_SUPER_PLUS && gadget->ops->udc_set_ssp_rate)
+		gadget->ops->udc_set_ssp_rate(gadget, gadget->max_ssp_rate);
+	else if (gadget->ops->udc_set_speed)
+		gadget->ops->udc_set_speed(gadget, s);
 }
 
 /**
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 02483c862444..ee04ef214ce8 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -323,6 +323,8 @@ struct usb_gadget_ops {
 			struct usb_gadget_driver *);
 	int	(*udc_stop)(struct usb_gadget *);
 	void	(*udc_set_speed)(struct usb_gadget *, enum usb_device_speed);
+	void	(*udc_set_ssp_rate)(struct usb_gadget *gadget,
+			enum usb_ssp_rate rate);
 	struct usb_ep *(*match_ep)(struct usb_gadget *,
 			struct usb_endpoint_descriptor *,
 			struct usb_ss_ep_comp_descriptor *);
-- 
2.28.0

