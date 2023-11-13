Return-Path: <linux-usb+bounces-2821-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3807E9EA5
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A94A1C20878
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE95321374;
	Mon, 13 Nov 2023 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iGLuVOPw"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116321111;
	Mon, 13 Nov 2023 14:27:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727B2D72;
	Mon, 13 Nov 2023 06:27:04 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F7B31C0012;
	Mon, 13 Nov 2023 14:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699885623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+i4FLnvd6XaZ4FK4Rv/lHlLAWGwtUlxb23vylnIS6g=;
	b=iGLuVOPw+l/CxkdcZ/4FKg7+dIPMY8gL2CbmKr/0Umw9RnIJxa4RBep3RmGFRt7kBhrULY
	VwDCidB9ZXtJYNGEpMm+OebAMZUXYfTlOC6WPRXCsQDlE1rFkoETqtaBtODxEpHk8vM0Bx
	LvlOx6U2BL5fGVNNpN7HaBySe3mYNLBKTD5yVXxf6L9o/9DkK2O9Yc7v4HMH5ikcI5xrYs
	hhMFaP0Q7LaWWeg4Tl1vJKHTS/U2TKBee34xMElK4UoDmNjz25wzhPMHV0ugN4Xb5s/+Ze
	rxZOWCT2xetF5zM9gJBUSr2jeXjWlU+EC2QJA2RM+Z+BtYedyq0w4twkS9L2XA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 13 Nov 2023 15:27:00 +0100
Subject: [PATCH 5/6] usb: cdns3-ti: notify cdns core that hardware resets
 across suspend on J7200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231113-j7200-usb-suspend-v1-5-ad1ee714835c@bootlin.com>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
In-Reply-To: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.3
X-GND-Sasl: theo.lebrun@bootlin.com

Use the CDNS3_RESET_ON_RESUME quirk flag to inform the cdns3 core that
our J7200 USB controller will lose power during suspend. It therefore
must be reconfigured when we resume.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index 50b38c4b9c87..c65714c783fb 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -16,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include "core.h"
 
 /* USB Wrapper register offsets */
 #define USBSS_PID		0x0
@@ -127,6 +128,7 @@ static int cdns_ti_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
+	const struct of_dev_auxdata *auxdata;
 	struct cdns_ti *data;
 	unsigned long rate;
 	int error, i;
@@ -182,7 +184,8 @@ static int cdns_ti_probe(struct platform_device *pdev)
 
 	cdns_ti_init_hw(data);
 
-	error = of_platform_populate(node, NULL, NULL, dev);
+	auxdata = of_device_get_match_data(dev);
+	error = of_platform_populate(node, NULL, auxdata, dev);
 	if (error) {
 		dev_err(dev, "failed to create children: %d\n", error);
 		goto err;
@@ -261,8 +264,20 @@ static void cdns_ti_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static struct cdns3_platform_data cdns_ti_j7200_pdata = {
+	.quirks = CDNS3_RESET_ON_RESUME,
+};
+
+static const struct of_dev_auxdata cdns_ti_j7200_auxdata[] = {
+	{
+		.compatible = "cdns,usb3",
+		.platform_data = &cdns_ti_j7200_pdata,
+	},
+	{},
+};
+
 static const struct of_device_id cdns_ti_of_match[] = {
-	{ .compatible = "ti,j7200-usb", },
+	{ .compatible = "ti,j7200-usb", .data = cdns_ti_j7200_auxdata, },
 	{ .compatible = "ti,j721e-usb", },
 	{ .compatible = "ti,am64-usb", },
 	{},

-- 
2.41.0


