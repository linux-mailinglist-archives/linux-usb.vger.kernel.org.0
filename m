Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114DC2FC6ED
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 02:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730916AbhATBiD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 20:38:03 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57296 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730654AbhATBhm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 20:37:42 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3855D4017C;
        Wed, 20 Jan 2021 01:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1611106595; bh=IAPwLDcEN3gYEJV/JZW4Fq/T06tRVNo1U1OgnxRvVU8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=jEq5dfZ7uUd243clO4KM8hnHthAvMPktPPDXoWJYN1H629gZDGcGC5QRB1GOICuKS
         FgMDYR57INGTh31XYgNvRiTD2Qre4DAR3HZia3nISuRqXfo+LbclO/0gRwxSb6FCol
         lNGC/8SouB/qB4YBFH5NQv004o0H+iPIw/pqvtuxG0631+NNEbcwz61wnaxn7bRr8z
         0YAnie0dqy7SlI+kgPoDZfJb5ZxadKZr/KW5ssDId+D+UCj1nqFzZ4U3/YgD5EnlCB
         CaZEbgjz7FBLEgsM9WgUzMejBqkmU5zM5FnK3TweGEk9dd0ASF4hRIaWexEx2VoKqp
         titLM1CU14RuA==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 22D92A0068;
        Wed, 20 Jan 2021 01:36:34 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 19 Jan 2021 17:36:34 -0800
Date:   Tue, 19 Jan 2021 17:36:34 -0800
Message-Id: <2389592188d2e37a2ee45edaf04d942b19f3af82.1611106162.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v7 5/6] usb: dwc3: gadget: Track connected SSP rate and lane count
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Track the number of connected lanes and speed in corresponding enum
usb_ssp_rate for SuperSpeed Plus capable device.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v7:
- Rebase on Greg's usb-testing branch
Changes in v6:
- Rebase on Greg's usb-testing branch
- Update commmit message
- Update to report the rate and lane count in usb_ssp_rate enum
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- Update commit with updated field name
- No longer use DWC3_LSM_5/10_GBPS macros
Changes in v2:
- Fix missing check for gen1x2 when writing to sublink speed attributes
- Minor fix in commit message (first commit sentence ended with comma)

 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 61ac298f3e8e..052b20d52651 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -461,6 +461,8 @@
 #define DWC3_DEVTEN_USBRSTEN		BIT(1)
 #define DWC3_DEVTEN_DISCONNEVTEN	BIT(0)
 
+#define DWC3_DSTS_CONNLANES(n)		(((n) >> 30) & 0x3) /* DWC_usb32 only */
+
 /* Device Status Register */
 #define DWC3_DSTS_DCNRD			BIT(29)
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 14ab5594a595..0aa89e704a55 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2120,6 +2120,12 @@ static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 		}
 	}
+
+	if (DWC3_IP_IS(DWC32) &&
+	    dwc->gadget_max_speed > USB_SPEED_UNKNOWN &&
+	    dwc->gadget_max_speed < USB_SPEED_SUPER_PLUS)
+		reg &= ~DWC3_DCFG_NUMLANES(~0);
+
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
 }
 
@@ -3369,12 +3375,18 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 	struct dwc3_ep		*dep;
 	int			ret;
 	u32			reg;
+	u8			lanes = 1;
 	u8			speed;
 
 	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
 	speed = reg & DWC3_DSTS_CONNECTSPD;
 	dwc->speed = speed;
 
+	if (DWC3_IP_IS(DWC32))
+		lanes = DWC3_DSTS_CONNLANES(reg) + 1;
+
+	dwc->gadget->ssp_rate = USB_SSP_GEN_UNKNOWN;
+
 	/*
 	 * RAMClkSel is reset to 0 after USB reset, so it must be reprogrammed
 	 * each time on Connect Done.
@@ -3389,6 +3401,11 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 		dwc->gadget->ep0->maxpacket = 512;
 		dwc->gadget->speed = USB_SPEED_SUPER_PLUS;
+
+		if (lanes > 1)
+			dwc->gadget->ssp_rate = USB_SSP_GEN_2x2;
+		else
+			dwc->gadget->ssp_rate = USB_SSP_GEN_2x1;
 		break;
 	case DWC3_DSTS_SUPERSPEED:
 		/*
@@ -3410,6 +3427,11 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 		dwc->gadget->ep0->maxpacket = 512;
 		dwc->gadget->speed = USB_SPEED_SUPER;
+
+		if (lanes > 1) {
+			dwc->gadget->speed = USB_SPEED_SUPER_PLUS;
+			dwc->gadget->ssp_rate = USB_SSP_GEN_1x2;
+		}
 		break;
 	case DWC3_DSTS_HIGHSPEED:
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(64);
@@ -3904,6 +3926,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	dev->platform_data		= dwc;
 	dwc->gadget->ops		= &dwc3_gadget_ops;
 	dwc->gadget->speed		= USB_SPEED_UNKNOWN;
+	dwc->gadget->ssp_rate		= USB_SSP_GEN_UNKNOWN;
 	dwc->gadget->sg_supported	= true;
 	dwc->gadget->name		= "dwc3-gadget";
 	dwc->gadget->lpm_capable	= true;
-- 
2.28.0

