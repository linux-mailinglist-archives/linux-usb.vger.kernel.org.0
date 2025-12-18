Return-Path: <linux-usb+bounces-31596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F790CCC8E2
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 941FD3026F1A
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C214734FF5A;
	Thu, 18 Dec 2025 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQCBCB8U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346DF34F480;
	Thu, 18 Dec 2025 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072245; cv=none; b=KjDnw3yh0U2kN3abDXHafjKhv9HgR+8PXaa3Vwe7+TVk/zcd2J0gxDeJEsA+yVhCzL2jfxEzkL0OD0eGajBbfdIDC8YTOBirK/NHKX5nrBUIS6r/6kCt/2lU0/G1CFnx/mhTVyu+sHoZXSJvihr/IifAQJgRPcR5Od3Z1zcJ8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072245; c=relaxed/simple;
	bh=M5TuPLyAwIQ91mQDDGCWXB9OR3GiCuPErHP1m44ElZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAPehThDxWriNqOIwhfGSe3DrRrOFcCYz3Gm/5ApYt8Hlc7hU+xv95qCnd1d9jhXxKuJx/Ajv5rl5N23uxPxA/R0QRSGonH4hHarSaEf9Uys+AUv2az00PpcxpAY759BnDit3gHoI+kSmo/GuwDVoLubZX1L/LOOjFJ1mRzB22E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQCBCB8U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25F2C19422;
	Thu, 18 Dec 2025 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766072244;
	bh=M5TuPLyAwIQ91mQDDGCWXB9OR3GiCuPErHP1m44ElZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vQCBCB8U3lJb9xIbHhKZa8AQzL2K2w74Mj3KdARYjue/rdtnhz4Hldo1qDWnSRSTd
	 VBhejAXQgBlSCu1Dq7rLQHzTm2yNyizR2DNu0WWqznrCJHLirXaJabZmZzzaIQ6QSv
	 H7vjAga+XxydVg5hpS05mYoHCh+tK11H7c5NMXBMBukVwgU19oOwH8ZjJLyvgxLO4T
	 9GS2SI13BE/c8DopYE84JyMbfuCT5KcKetc4QBAHVGIbb/vee3oZDEYlF9Ra4H5K9Q
	 iEioKWfWZOa//0FsyQY3wcjEwDKrzXB67twSt5W2LsbfUY/gh6Ct+0FLM8PhpQGVJY
	 LozsVmXcHmdaw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWG4B-0000000056I-1QXU;
	Thu, 18 Dec 2025 16:37:23 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Ma Ke <make24@iscas.ac.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 5/5] usb: ohci-nxp: clean up probe error labels
Date: Thu, 18 Dec 2025 16:35:19 +0100
Message-ID: <20251218153519.19453-6-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218153519.19453-1-johan@kernel.org>
References: <20251218153519.19453-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Error labels should be named after what they do rather than after from
where they are jumped to.

Rename the probe error labels for consistency and to improve
readability.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/host/ohci-nxp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
index 509ca7d8d513..7663f2aa35e9 100644
--- a/drivers/usb/host/ohci-nxp.c
+++ b/drivers/usb/host/ohci-nxp.c
@@ -169,13 +169,13 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 
 	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret)
-		goto fail_disable;
+		goto err_put_client;
 
 	dev_dbg(&pdev->dev, "%s: " DRIVER_DESC " (nxp)\n", hcd_name);
 	if (usb_disabled()) {
 		dev_err(&pdev->dev, "USB is disabled\n");
 		ret = -ENODEV;
-		goto fail_disable;
+		goto err_put_client;
 	}
 
 	/* Enable USB host clock */
@@ -183,7 +183,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 	if (IS_ERR(usb_host_clk)) {
 		dev_err(&pdev->dev, "failed to acquire and start USB OHCI clock\n");
 		ret = PTR_ERR(usb_host_clk);
-		goto fail_disable;
+		goto err_put_client;
 	}
 
 	isp1301_configure();
@@ -192,13 +192,13 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 	if (!hcd) {
 		dev_err(&pdev->dev, "Failed to allocate HC buffer\n");
 		ret = -ENOMEM;
-		goto fail_disable;
+		goto err_put_client;
 	}
 
 	hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(hcd->regs)) {
 		ret = PTR_ERR(hcd->regs);
-		goto fail_resource;
+		goto err_put_hcd;
 	}
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
@@ -206,7 +206,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENXIO;
-		goto fail_resource;
+		goto err_put_hcd;
 	}
 
 	ohci_nxp_start_hc();
@@ -220,9 +220,9 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 	}
 
 	ohci_nxp_stop_hc();
-fail_resource:
+err_put_hcd:
 	usb_put_hcd(hcd);
-fail_disable:
+err_put_client:
 	put_device(&isp1301_i2c_client->dev);
 	isp1301_i2c_client = NULL;
 	return ret;
-- 
2.51.2


