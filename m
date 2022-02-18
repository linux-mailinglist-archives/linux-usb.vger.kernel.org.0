Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 496944BBC29
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 16:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237002AbiBRP1h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 10:27:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbiBRP1g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 10:27:36 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432531C9184;
        Fri, 18 Feb 2022 07:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645198038; x=1676734038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5hszIpACq830CHAc9LWqRkaIQSuXCBv2ejSsmu6cIA4=;
  b=DWfOAKFLfJHWum2aYOrFX/UGX0DhuI2rZ6IJ8+UjkpTu1iGfXNLe+QhH
   XE+Fhpa4WqBr3da3C2Ykwano5wwf7QNcGcDwdyn0+bFVk6nAa4pAGb6er
   QiVP+vl0F1rxVeKNa65j0NkWGH1SMBcwrxS9462fTjjS5oM0KFIWiT9Bx
   Amqt0GjB4QB3iDItbgh3bB0bKgILzuPOTIK4wAfCyeEPTRjajqS/xbS/B
   BXltlpVp2MWOslSLetWhp0LZz1P70TViAbMMXcU4cxGvL7IlTs3vjBAt0
   ngXujb0qzk41WhpzZE+xOKL/Iei4PPYuBO8b2cQjWIqDcgJT4ow0n506Q
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635199200"; 
   d="scan'208";a="22181139"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Feb 2022 16:27:14 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 18 Feb 2022 16:27:14 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 18 Feb 2022 16:27:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645198034; x=1676734034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5hszIpACq830CHAc9LWqRkaIQSuXCBv2ejSsmu6cIA4=;
  b=iuB/VtaX5bOz1Bmss91Pxd4EgEFopCoBwgwKnIZdZcnZuITiYfwu0Y5D
   P08aiDj1BmjDQfcNuhiJqTLuzZ6StFfoNZiD8MOr2GeKy5BQaHBdqUQlI
   u4FgYBTaVDDDmdpUWrexRgOKLRStZazLFNysiHYKhu3NCXArlYYOtDHr2
   7SUMKqSZIxwa3nJLMlPcLv4t2FtmDt3JXzq0Xb/efE0m3NEAcWS5RNZOB
   31u+dtDMyppskSUo+A/KdpXV4l72dTZXoY+g+ef2BYCaR/QPmJYnSLTeI
   7FIZzU/3ZNkOCtqTehbKs4eR8lCTa7X7OqP34/J/260wvVWMxm5uXdxor
   A==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635199200"; 
   d="scan'208";a="22181138"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Feb 2022 16:27:14 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4D50A280075;
        Fri, 18 Feb 2022 16:27:14 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH v5 1/4] usb: dwc3: imx8mp: rename iomem base pointer
Date:   Fri, 18 Feb 2022 16:27:04 +0100
Message-Id: <20220218152707.2198357-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218152707.2198357-1-alexander.stein@ew.tq-group.com>
References: <20220218152707.2198357-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Until now the iomem used is not USB glue as the name suggests, but
HSIO BLK_CTL. Rename the struct member accordingly. This is a preparing
patch for when USB glue is actually used.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Li Jun <jun.li@nxp.com>
---
Changes in v5:
* Added Reviewed-by: Li Jun

 drivers/usb/dwc3/dwc3-imx8mp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index d328d20abfbc..1c8fe657b3a9 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -39,7 +39,7 @@
 struct dwc3_imx8mp {
 	struct device			*dev;
 	struct platform_device		*dwc3;
-	void __iomem			*glue_base;
+	void __iomem			*hsio_blk_base;
 	struct clk			*hsio_clk;
 	struct clk			*suspend_clk;
 	int				irq;
@@ -55,7 +55,7 @@ static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
 	if (!dwc3)
 		return;
 
-	val = readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	val = readl(dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 
 	if ((dwc3->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci)
 		val |= USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
@@ -64,16 +64,16 @@ static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
 		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
 		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
 
-	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 }
 
 static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)
 {
 	u32 val;
 
-	val = readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	val = readl(dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
-	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 }
 
 static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
@@ -115,9 +115,9 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 
 	dwc3_imx->dev = dev;
 
-	dwc3_imx->glue_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(dwc3_imx->glue_base))
-		return PTR_ERR(dwc3_imx->glue_base);
+	dwc3_imx->hsio_blk_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dwc3_imx->hsio_blk_base))
+		return PTR_ERR(dwc3_imx->hsio_blk_base);
 
 	dwc3_imx->hsio_clk = devm_clk_get(dev, "hsio");
 	if (IS_ERR(dwc3_imx->hsio_clk)) {
-- 
2.25.1

