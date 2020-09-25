Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEB6277E1B
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgIYCmq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:42:46 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50906 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726764AbgIYCmq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:42:46 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D0F2B409E3;
        Fri, 25 Sep 2020 02:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001765; bh=8dZuPgZ9N3HkdsphAA2Z+KsusJis8CVVF6M0eieZqpw=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=eYRVNzvE7eOuFPriYlvoPYLf7Gc51mo7HtI9lqES5DPiBTmFafKnlH9MEpz7yhfId
         yINhlEYMdBPkAvTZDhEEzzIMECWOmdFTesFrl1UR47JxkuDsMffyVFwKY+nQ0SUVyM
         vOK5pvuKjwuoOIga03o1Cu7RA1aDslenKX6btj5SQ9DiiNCvMye8nPIdDx1VpFPvr+
         2hrh2iaKILoMGfG4IUlz6tZByNHHcYUno+QdaLYmboVlvpJjFkWLRVB3TLG0KfuI+x
         Dp+j2ZMiM7w7IueIK4UtD5wHWCEsGlBB9oB1OMnJZk1IYpLEQ9idb9dHSSqb4tuNbl
         fbp+B+B/ayNjQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A6685A0096;
        Fri, 25 Sep 2020 02:42:44 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:42:44 -0700
Date:   Thu, 24 Sep 2020 19:42:44 -0700
Message-Id: <c84400bcfe61ebf7242dcc9bf5edbe1764add46c.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 10/12] usb: dwc3: gadget: Implement setting of sublink speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implement gadget ops udc_set_num_lanes_and_speed. This allows the
gadget/core driver to select number of lanes to use and the sublink
speed the controller supports.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- None

 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c | 64 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index c4a33545530d..f456de5f551c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -385,6 +385,8 @@
 #define DWC3_GUCTL2_RST_ACTBITLATER		BIT(14)
 
 /* Device Configuration Register */
+#define DWC3_DCFG_NUMLANES(n)	(((n) & 0x3) << 30) /* DWC_usb32 only */
+
 #define DWC3_DCFG_DEVADDR(addr)	((addr) << 3)
 #define DWC3_DCFG_DEVADDR_MASK	DWC3_DCFG_DEVADDR(0x7f)
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e60161205bf9..12399abd12fa 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2384,6 +2384,62 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
+static void dwc3_gadget_set_num_lanes_and_speed(struct usb_gadget *g,
+						unsigned int num_lanes,
+						unsigned int ssid)
+{
+	struct dwc3			*dwc = gadget_to_dwc(g);
+	struct usb_sublink_speed	*ssa = NULL;
+	unsigned int			lanes;
+	unsigned long			flags;
+	u32				reg;
+	int				i;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (dwc->maximum_speed < USB_SPEED_SUPER_PLUS)
+		goto done;
+
+	for (i = 0; i < g->ssac + 1; i++) {
+		if (g->sublink_speed[i].id == ssid) {
+			ssa = &g->sublink_speed[i];
+			break;
+		}
+	}
+
+	if (!ssa) {
+		dev_err(dwc->dev, "SSID not found (%d)\n", ssid);
+		goto done;
+	}
+
+	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg &= ~DWC3_DCFG_SPEED_MASK;
+
+	switch (ssa->mantissa) {
+	case 5:
+		reg |= DWC3_DCFG_SUPERSPEED;
+		break;
+	case 10:
+		reg |= DWC3_DCFG_SUPERSPEED_PLUS;
+		break;
+	default:
+		dev_err(dwc->dev, "invalid lane speed mantissa (%d)\n",
+			ssa->mantissa);
+		goto done;
+	}
+
+	/* Lane configuration is only available to DWC_usb32 */
+	if (DWC3_IP_IS(DWC32)) {
+		lanes = clamp_t(unsigned int, num_lanes, 1,
+				dwc->maximum_num_lanes);
+		reg &= ~DWC3_DCFG_NUMLANES(~0);
+		reg |= DWC3_DCFG_NUMLANES(lanes - 1);
+	}
+
+	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+done:
+	spin_unlock_irqrestore(&dwc->lock, flags);
+}
+
 static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.get_frame		= dwc3_gadget_get_frame,
 	.wakeup			= dwc3_gadget_wakeup,
@@ -2392,6 +2448,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.udc_start		= dwc3_gadget_start,
 	.udc_stop		= dwc3_gadget_stop,
 	.udc_set_speed		= dwc3_gadget_set_speed,
+	.udc_set_num_lanes_and_speed = dwc3_gadget_set_num_lanes_and_speed,
 	.get_config_params	= dwc3_gadget_config_params,
 };
 
@@ -3844,7 +3901,12 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 		goto err5;
 	}
 
-	dwc3_gadget_set_speed(dwc->gadget, dwc->maximum_speed);
+	if (DWC3_IP_IS(DWC32) && dwc->maximum_speed == USB_SPEED_SUPER_PLUS)
+		dwc3_gadget_set_num_lanes_and_speed(dwc->gadget,
+				dwc->maximum_num_lanes,
+				dwc->gadget->max_speed_ssid);
+	else
+		dwc3_gadget_set_speed(dwc->gadget, dwc->maximum_speed);
 
 	return 0;
 
-- 
2.28.0

