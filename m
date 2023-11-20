Return-Path: <linux-usb+bounces-3030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 457367F1950
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 18:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75CDA1C21812
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 17:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D822030B;
	Mon, 20 Nov 2023 17:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bqXXNWdp"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D28BE;
	Mon, 20 Nov 2023 09:06:10 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84998E0005;
	Mon, 20 Nov 2023 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700499969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fQQDcKI+dpqgp9ry2CvzyMUklTw/BkteRs5/KYF01kQ=;
	b=bqXXNWdpzIkufw4/eBc9jm55Uw3x8QkodfspyE1V7Jt+eTNF+aB5jVNMr63m7CJKLPL9V/
	25zj0k/IZmeIlj2rNI9vNOSsHQ1zIsBpG9jm8NDXSlWdiao3FRmKMgZsojofjej2IsLGQn
	4eUhchBUDXdeiYU1BlCqjjwjm3ruF33e6vUAI1nI5MXjt4EX83GhArHCoA4z3MQ0VlRUBY
	7kjlZPtdgMbG7ja9akO+ifJXVaAAzpSF9+3bRs/HDtUD3hXeITuXdenKFW4ESOuknxNc8r
	quOGntw4hqr2MDIbSBQKIhDfbNaVrP6+saU9tTuCjXizS1knc8rGLiNcuN/k6A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 20 Nov 2023 18:06:02 +0100
Subject: [PATCH v2 2/7] usb: cdns3-ti: remove runtime PM
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231120-j7200-usb-suspend-v2-2-038c7e4a3df4@bootlin.com>
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

The driver does not use RPM. It enables it & gets a reference at probe.
It then undoes that on probe error or at remove.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index 5945c4b1e11f..dc1594acdcee 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -135,13 +135,6 @@ static int cdns_ti_probe(struct platform_device *pdev)
 
 	rate_code = i;
 
-	pm_runtime_enable(dev);
-	error = pm_runtime_get_sync(dev);
-	if (error < 0) {
-		dev_err(dev, "pm_runtime_get_sync failed: %d\n", error);
-		goto err;
-	}
-
 	/* assert RESET */
 	reg = cdns_ti_readl(data, USBSS_W1);
 	reg &= ~USBSS_W1_PWRUP_RST;
@@ -179,16 +172,10 @@ static int cdns_ti_probe(struct platform_device *pdev)
 	error = of_platform_populate(node, NULL, NULL, dev);
 	if (error) {
 		dev_err(dev, "failed to create children: %d\n", error);
-		goto err;
+		return error;
 	}
 
 	return 0;
-
-err:
-	pm_runtime_put_sync(data->dev);
-	pm_runtime_disable(data->dev);
-
-	return error;
 }
 
 static int cdns_ti_remove_core(struct device *dev, void *c)
@@ -205,8 +192,6 @@ static void cdns_ti_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 
 	device_for_each_child(dev, NULL, cdns_ti_remove_core);
-	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
 
 	platform_set_drvdata(pdev, NULL);
 }

-- 
2.42.0


