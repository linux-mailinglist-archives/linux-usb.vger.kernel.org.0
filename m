Return-Path: <linux-usb+bounces-31597-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76350CCC8FA
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E4FF305934F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDB134FF57;
	Thu, 18 Dec 2025 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARrXLmth"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349A934F483;
	Thu, 18 Dec 2025 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072245; cv=none; b=dIXFZLLvcq6kNHecOYtRTl9siu39RpxwG6p2Vw/7TtmHsaDMgFbPdWqnUR+JkfRy6LBwiQkVH3k77JQyegj2fPXWHE6NtOdDnZyU/kdYK5fI2iRTXAH3IzX35Rnx6ewvmdHiyD8bKHUeeimWPKDVT4/p9coLP0CPXCbBGhymHyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072245; c=relaxed/simple;
	bh=ZoOMPbu15uszbv6DNmVkTA9G5hpJWLOSYd86M5kLijs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqD2MtpKrMLTGUbbieEKoMa4EpYw1cX/inEe1LT8PR9VU5+TDQsPHGYU/CQ6D7OlrNAuHhQrdQy4tpvLohoOUHNbZWZv69RXFuIKyD6h8aeYUhWIn+GORZcKRc5ZMD/uresAfwW4Y2UvQGJusKWnNEl4mbV5VrDDTOL2EyO5FgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARrXLmth; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EBFC116B1;
	Thu, 18 Dec 2025 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766072244;
	bh=ZoOMPbu15uszbv6DNmVkTA9G5hpJWLOSYd86M5kLijs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ARrXLmthoQzcPVXhaYLeXGKQvRncwxFmyVK2BOyfWGzgs/SkZOtdjcrsti/dLx+2V
	 EWbAOFUp+5/0nF32HIHUy7n4efVG3UOg8otc8h0tHrHJqI5zxR4e1gc/QEjJOPnSa5
	 cyt33ElQk/MogBjDNRaG4mDu6TiUVC/t20rcxA6zJT7uPSrGo/r76G5WhAgaz9Yj3h
	 gkL3p1cy9lRB5reF3yZSmwLxrYIhYxp+54nQIIS1x0r3Ukq34nidYEjxBsV31JIC7I
	 bvouw5wTVRZTQoHCYIz1Q0OTrKGvtKcotDRqUDXp4SCmGROOekcZJMCOK1QUaFJeGN
	 ZsIOBtX0PN3zQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWG4B-0000000056F-16Ah;
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
Subject: [PATCH v2 4/5] usb: gadget: lpc32xx_udc: clean up probe error labels
Date: Thu, 18 Dec 2025 16:35:18 +0100
Message-ID: <20251218153519.19453-5-johan@kernel.org>
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
 drivers/usb/gadget/udc/lpc32xx_udc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index a962d4294fbe..83c7e243dcf9 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3084,7 +3084,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	if (!udc->udca_v_base) {
 		dev_err(udc->dev, "error getting UDCA region\n");
 		retval = -ENOMEM;
-		goto i2c_fail;
+		goto err_disable_clk;
 	}
 	udc->udca_p_base = dma_handle;
 	dev_dbg(udc->dev, "DMA buffer(0x%x bytes), P:0x%08x, V:0x%p\n",
@@ -3097,7 +3097,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	if (!udc->dd_cache) {
 		dev_err(udc->dev, "error getting DD DMA region\n");
 		retval = -ENOMEM;
-		goto dma_alloc_fail;
+		goto err_free_dma;
 	}
 
 	/* Clear USB peripheral and initialize gadget endpoints */
@@ -3111,14 +3111,14 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	if (retval < 0) {
 		dev_err(udc->dev, "LP request irq %d failed\n",
 			udc->udp_irq[IRQ_USB_LP]);
-		goto irq_req_fail;
+		goto err_destroy_pool;
 	}
 	retval = devm_request_irq(dev, udc->udp_irq[IRQ_USB_HP],
 				  lpc32xx_usb_hp_irq, 0, "udc_hp", udc);
 	if (retval < 0) {
 		dev_err(udc->dev, "HP request irq %d failed\n",
 			udc->udp_irq[IRQ_USB_HP]);
-		goto irq_req_fail;
+		goto err_destroy_pool;
 	}
 
 	retval = devm_request_irq(dev, udc->udp_irq[IRQ_USB_DEVDMA],
@@ -3126,7 +3126,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	if (retval < 0) {
 		dev_err(udc->dev, "DEV request irq %d failed\n",
 			udc->udp_irq[IRQ_USB_DEVDMA]);
-		goto irq_req_fail;
+		goto err_destroy_pool;
 	}
 
 	/* The transceiver interrupt is used for VBUS detection and will
@@ -3137,7 +3137,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	if (retval < 0) {
 		dev_err(udc->dev, "VBUS request irq %d failed\n",
 			udc->udp_irq[IRQ_USB_ATX]);
-		goto irq_req_fail;
+		goto err_destroy_pool;
 	}
 
 	/* Initialize wait queue */
@@ -3146,7 +3146,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 
 	retval = usb_add_gadget_udc(dev, &udc->gadget);
 	if (retval < 0)
-		goto add_gadget_fail;
+		goto err_destroy_pool;
 
 	dev_set_drvdata(dev, udc);
 	device_init_wakeup(dev, 1);
@@ -3158,13 +3158,12 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	dev_info(udc->dev, "%s version %s\n", driver_name, DRIVER_VERSION);
 	return 0;
 
-add_gadget_fail:
-irq_req_fail:
+err_destroy_pool:
 	dma_pool_destroy(udc->dd_cache);
-dma_alloc_fail:
+err_free_dma:
 	dma_free_coherent(&pdev->dev, UDCA_BUFF_SIZE,
 			  udc->udca_v_base, udc->udca_p_base);
-i2c_fail:
+err_disable_clk:
 	clk_disable_unprepare(udc->usb_slv_clk);
 err_put_client:
 	put_device(&udc->isp1301_i2c_client->dev);
-- 
2.51.2


