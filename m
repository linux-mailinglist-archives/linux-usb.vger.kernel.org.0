Return-Path: <linux-usb+bounces-2818-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F897E9EA1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5865D1F215B1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBAE21353;
	Mon, 13 Nov 2023 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CdUrQ5QZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8C1210F4;
	Mon, 13 Nov 2023 14:27:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F66D60;
	Mon, 13 Nov 2023 06:27:03 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CF531C0003;
	Mon, 13 Nov 2023 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699885621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhQIX2l1AguLqLqqSuhrXlTHhHreB3Yx+m4gIExyzdk=;
	b=CdUrQ5QZKlKgfAHkaN5pRMkm6kJPA7FlAgX2N1M8ahm8ex2+uOgnaxX7lYbma/37xjoiRR
	XvjQ+AmQaJMrockgTuSlRkL1QUubiF49WGsh9YTkowiuuvRhl9EoaH3DspwDotkBdXLOwv
	LE9brLy6qOvyZkXRkYRhk8wg2GPX19qZGyr7ebhITZO+h+rXHfrYQk9V53UF5D5aVE3HeL
	XdU2nwVZ5T0MfN8IR33H+UiHkN7fy69Xr1hkKECt9SoTyZ5PR5IBBIj8p0aBPrddSnfhPS
	4m30yACn8GeoehQ57l1oVuMsJrzUg2PcR25Enpzsly5sV9f6yLG5IeL/tKxM+g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 13 Nov 2023 15:26:58 +0100
Subject: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for J7200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
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

Hardware initialisation is only done at probe. The J7200 USB controller
is reset at resume because of power-domains toggling off & on. We
therefore (1) toggle PM runtime at suspend/resume & (2) reconfigure the
hardware at resume.

Reuse the newly extracted cdns_ti_init_hw() function that contains the
register write sequence.

We guard this behavior based on compatible to avoid modifying the
current behavior on other platforms. If the controller does not reset
we do not want to touch PM runtime & do not want to redo reg writes.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 48 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index c331bcd2faeb..50b38c4b9c87 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -197,6 +197,50 @@ static int cdns_ti_probe(struct platform_device *pdev)
 	return error;
 }
 
+#ifdef CONFIG_PM
+
+static int cdns_ti_suspend(struct device *dev)
+{
+	struct cdns_ti *data = dev_get_drvdata(dev);
+
+	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
+		return 0;
+
+	pm_runtime_put_sync(data->dev);
+
+	return 0;
+}
+
+static int cdns_ti_resume(struct device *dev)
+{
+	struct cdns_ti *data = dev_get_drvdata(dev);
+	int ret;
+
+	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
+		return 0;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "pm_runtime_get_sync failed: %d\n", ret);
+		goto err;
+	}
+
+	cdns_ti_init_hw(data);
+
+	return 0;
+
+err:
+	pm_runtime_put_sync(data->dev);
+	pm_runtime_disable(data->dev);
+	return ret;
+}
+
+static const struct dev_pm_ops cdns_ti_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(cdns_ti_suspend, cdns_ti_resume)
+};
+
+#endif /* CONFIG_PM */
+
 static int cdns_ti_remove_core(struct device *dev, void *c)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -218,6 +262,7 @@ static void cdns_ti_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id cdns_ti_of_match[] = {
+	{ .compatible = "ti,j7200-usb", },
 	{ .compatible = "ti,j721e-usb", },
 	{ .compatible = "ti,am64-usb", },
 	{},
@@ -228,8 +273,9 @@ static struct platform_driver cdns_ti_driver = {
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
2.41.0


