Return-Path: <linux-usb+bounces-3032-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85747F1957
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 18:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A9728111C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 17:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B86E1CF9B;
	Mon, 20 Nov 2023 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dL93nhq7"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3F0CF;
	Mon, 20 Nov 2023 09:06:11 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F107DE0009;
	Mon, 20 Nov 2023 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700499970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wx2rOa/1wEHZbfuDfJmt7rGuUCDalwYHOdzLSZet/jw=;
	b=dL93nhq7nFnhEtJ3V4mIwOa6WoEfgxT7akOjFtbvuoyKjbdOcstvgX5pxBnhzz3GkK5VLk
	wHOaKzIqAg/izt16nhz15VAXHp5sb3mTgc1kLrR1k36BNWrCnj/iAtJkR4XloNHIWQazGx
	DuBgmmkpr/KXE3KTagG3GNOer/BxUdx5Sk6Bi51a+hlu+UOSVeji3sToe8xixLTY6ApxCN
	3ZYzkwwcuRSHU4kZVzvcKHYkVvazsiteXcVkft6N8xuN+naKz+ONMW95HT3EUS+H0jIFm/
	ETB5uql1rAzQjc4C5GjnvOjw0uFx2c73fcy/NKnh2KVLdENeuCttAqZ6rMUGKg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 20 Nov 2023 18:06:04 +0100
Subject: [PATCH v2 4/7] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231120-j7200-usb-suspend-v2-4-038c7e4a3df4@bootlin.com>
References: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
In-Reply-To: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Thomas Petazzoni thomas.petazzoni"@bootlin.com, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.3
X-GND-Sasl: theo.lebrun@bootlin.com

Hardware initialisation is only done at probe. The J7200 USB controller
is reset at resume because of power-domains toggling off & on. We
therefore reconfigure the hardware at resume.

Reuse the newly extracted cdns_ti_init_hw() function that contains the
register write sequence.

Only focus J7200 as other SoC are untested. If the controller does not
reset we do not want to redo reg writes.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index d4232b440e4e..84f93c2fcd5c 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -58,6 +58,7 @@ struct cdns_ti {
 	struct clk *usb2_refclk;
 	struct clk *lpm_clk;
 	int usb2_refclk_rate_code;
+	bool reset_on_resume;
 };
 
 static const int cdns_ti_rate_table[] = {	/* in KHZ */
@@ -172,6 +173,7 @@ static int cdns_ti_probe(struct platform_device *pdev)
 	data->usb2_refclk_rate_code = i;
 	data->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
 	data->usb2_only = device_property_read_bool(dev, "ti,usb2-only");
+	data->reset_on_resume = of_device_is_compatible(node, "ti,j7200-usb");
 
 	cdns_ti_init_hw(data);
 
@@ -202,7 +204,26 @@ static void cdns_ti_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+#ifdef CONFIG_PM
+
+static int cdns_ti_resume(struct device *dev)
+{
+	struct cdns_ti *data = dev_get_drvdata(dev);
+
+	if (data->reset_on_resume)
+		cdns_ti_init_hw(data);
+
+	return 0;
+}
+
+static const struct dev_pm_ops cdns_ti_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, cdns_ti_resume)
+};
+
+#endif /* CONFIG_PM */
+
 static const struct of_device_id cdns_ti_of_match[] = {
+	{ .compatible = "ti,j7200-usb", },
 	{ .compatible = "ti,j721e-usb", },
 	{ .compatible = "ti,am64-usb", },
 	{},
@@ -213,8 +234,9 @@ static struct platform_driver cdns_ti_driver = {
 	.probe		= cdns_ti_probe,
 	.remove_new	= cdns_ti_remove,
 	.driver		= {
-		.name	= "cdns3-ti",
+		.name		= "cdns3-ti",
 		.of_match_table	= cdns_ti_of_match,
+		.pm		= pm_ptr(&cdns_ti_pm_ops),
 	},
 };
 

-- 
2.42.0


