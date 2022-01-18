Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0404926EA
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 14:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241893AbiARNQj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 08:16:39 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:30777 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236141AbiARNQj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jan 2022 08:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511799; x=1674047799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6DdLsqqroNMKr6Xyes2xsy1sE+X7bKTqbAbUFZzzPF8=;
  b=KRbbWasGygE1RUVUhxmFczbVCWH4jaqnmy2RWbx6FVqHBMB+fwcflR3F
   6fzMZCco/3uXS2cr6Ar084RPq8uYNcuHBS57TeJq2I/6LsL2Jbo0NkEET
   Ekt9VU2Jra0X4ncBrnsVKrqn5lYfDkGC6TQ2wAQud7t1D6a0AHyAJJ3C+
   ZLcDnTHoygqIFK2wCejvzOY01hz9MdE27ABRkR2DuDoClcB1eb5TaxqCO
   d7HU7Evg5xAAssXdeV5t/k0NQh/lNwn/6cbC0PVayiKTKXUiot5Jk4ARd
   pQUyqx7ZalozVvmCVvd7OYMqxkLeCv+exYrESpBMRjm4UgvJxc54YvVLs
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564685"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Jan 2022 14:16:36 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Jan 2022 14:16:36 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Jan 2022 14:16:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511796; x=1674047796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6DdLsqqroNMKr6Xyes2xsy1sE+X7bKTqbAbUFZzzPF8=;
  b=NGJq9N7X45RTy/1mX6sj0MQxihw8T3rlZU+EydPy6tH3GGgfM88OpF4S
   Xdocyg5+p5Z66YB4SoNJUyYp7IqoJi5FDThQnYLwLQjz7GQBsuPdFlf1k
   OMvsrqUNgYGwAxfUJeMe/+sXMRZZvHtWJOJPNjzG9+aMu0tDb8Q/59S96
   fs6owTGQZmtIrNVwwXRs9FNkZg/udCSyUoc38e1jDrf8C0iIKLPQ0lI6n
   +sqrZEALnsn34ZSRo61LtRH7INj2wMQHDjxw8ig0AlKy4LA7NHPM/Z+s0
   m+aJUzVbfXqJsdK/x6r46DlB9i7Vi+Mm7fbAzkud0PBBxDWMA5ZFaDsof
   g==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564684"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jan 2022 14:16:36 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5793B280075;
        Tue, 18 Jan 2022 14:16:36 +0100 (CET)
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
Subject: [PATCH v3 1/4] usb: dwc3: imx8mp: rename iomem base pointer
Date:   Tue, 18 Jan 2022 14:16:23 +0100
Message-Id: <20220118131626.926394-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
References: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Until now the iomem used is not USB glue as the name suggests, but
HSIO BLK_CTL. Rename the struct member accordingly. This is a preparing
patch for when USB glue is actually used.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
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

