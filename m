Return-Path: <linux-usb+bounces-14495-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FCF9687C3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 14:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38E211C21D8D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 12:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9DB19C569;
	Mon,  2 Sep 2024 12:43:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E571619E99E
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725281037; cv=none; b=HoavboztK+JB432BFeB82qQIqOwFUp2Y3JHy2GoI4uJVqNgGII5gh9p/jCh1hT1w4XOIhoxHh/pZVnK8SKKwo8zPsrMTRBE20hLbtA71pbALF6X3anohvDDocfYjjjTO1BPqPq0bIfEIzs3xrf7o9ZfCxzPxNtm0S1/H0QYfWLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725281037; c=relaxed/simple;
	bh=uUQs0mIm8KPoC+2KXI/xnjHUKBQgLz9t0to3ezHib4Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAaKA6vHUhlbCnCdLu92lQRlLNPIsBvwC1LFBX/+Splqh0eRgroNaxdsyQMx8+613sw4PsYaBOvBW9T7NOx/b0J5r8XWre8Nx+Ajr0YLg3dNCWC0ZcUdp9WgF1xgSXGRTsAGB/y+AzuxASy8YTvDWtYNypT67n3vEvMEruYMGP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wy7j02wbBz1S9WN;
	Mon,  2 Sep 2024 20:43:32 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id D45801400D4;
	Mon,  2 Sep 2024 20:43:50 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Sep
 2024 20:43:49 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <patchwork@huawei.com>, <Thinh.Nguyen@synopsys.com>,
	<gregkh@linuxfoundation.org>, <shawnguo@kernel.org>,
	<s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-usb@vger.kernel.org>, <vz@mleia.com>, <stern@rowland.harvard.edu>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH 1/2] usb: dwc3: Use helper function devm_clk_get_enabled()
Date: Mon, 2 Sep 2024 20:30:19 +0800
Message-ID: <20240902123020.29267-2-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240902123020.29267-1-zhangzekun11@huawei.com>
References: <20240902123020.29267-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf500003.china.huawei.com (7.202.181.241)

devm_clk_get() and clk_prepare_enable() can be replaced by helper
function devm_clk_get_enabled(). Let's use devm_clk_get_enabled() to
simplify code and avoid calling clk_disable_unprepare().

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 47 ++++++++--------------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 392fa1232788..a7e5ee797ae7 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -178,37 +178,20 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 			return PTR_ERR(dwc3_imx->glue_base);
 	}
 
-	dwc3_imx->hsio_clk = devm_clk_get(dev, "hsio");
-	if (IS_ERR(dwc3_imx->hsio_clk)) {
-		err = PTR_ERR(dwc3_imx->hsio_clk);
-		dev_err(dev, "Failed to get hsio clk, err=%d\n", err);
-		return err;
-	}
+	dwc3_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
+	if (IS_ERR(dwc3_imx->hsio_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc3_imx->hsio_clk),
+				     "Failed to get and enable hsio clk\n");
 
-	err = clk_prepare_enable(dwc3_imx->hsio_clk);
-	if (err) {
-		dev_err(dev, "Failed to enable hsio clk, err=%d\n", err);
-		return err;
-	}
-
-	dwc3_imx->suspend_clk = devm_clk_get(dev, "suspend");
-	if (IS_ERR(dwc3_imx->suspend_clk)) {
-		err = PTR_ERR(dwc3_imx->suspend_clk);
-		dev_err(dev, "Failed to get suspend clk, err=%d\n", err);
-		goto disable_hsio_clk;
-	}
-
-	err = clk_prepare_enable(dwc3_imx->suspend_clk);
-	if (err) {
-		dev_err(dev, "Failed to enable suspend clk, err=%d\n", err);
-		goto disable_hsio_clk;
-	}
+	dwc3_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
+	if (IS_ERR(dwc3_imx->suspend_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc3_imx->suspend_clk),
+				     "Failed to get and enable suspend clk\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto disable_clks;
-	}
+	if (irq < 0)
+		return irq;
+
 	dwc3_imx->irq = irq;
 
 	imx8mp_configure_glue(dwc3_imx);
@@ -259,25 +242,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 disable_rpm:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-disable_clks:
-	clk_disable_unprepare(dwc3_imx->suspend_clk);
-disable_hsio_clk:
-	clk_disable_unprepare(dwc3_imx->hsio_clk);
 
 	return err;
 }
 
 static void dwc3_imx8mp_remove(struct platform_device *pdev)
 {
-	struct dwc3_imx8mp *dwc3_imx = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
 	pm_runtime_get_sync(dev);
 	of_platform_depopulate(dev);
 
-	clk_disable_unprepare(dwc3_imx->suspend_clk);
-	clk_disable_unprepare(dwc3_imx->hsio_clk);
-
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 }
-- 
2.17.1


