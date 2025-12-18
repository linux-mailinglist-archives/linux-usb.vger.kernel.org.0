Return-Path: <linux-usb+bounces-31580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE65CCC431
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97E1B30E477B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 14:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C78828851E;
	Thu, 18 Dec 2025 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="up+ynGcy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D36260566;
	Thu, 18 Dec 2025 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766067647; cv=none; b=u7S/ZxXRmCoELRv16gjgnR1av9HJoI5GsTloyNaqCRSjDnQN/JYM94mrqLLlbg4jCosYbwU5uXxp5HZ/APk9/e/+kq5+Aonaz4fPrph1UjJMJtcceRIj/t/O06xW6vL49qMANteSiMA7hxibJOw1JrQ4PRrkwRv9nXQ14l01A3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766067647; c=relaxed/simple;
	bh=ZoOMPbu15uszbv6DNmVkTA9G5hpJWLOSYd86M5kLijs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZatylDpJTE522zMVzj/NyjPB4oWJOV9XDCapNx0lgaWxVXnEhJxCUmLNNvTziyuEd5+j5FZKjnb54X0gz3avfRfFad0rBtM8xg/w9EM61aBOW3bIBP1rAJ+KGid1sUPCNK74al1xmtNx1Cx9HLwIut+3NxrhI8vJueknwadJ75A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=up+ynGcy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B941C19421;
	Thu, 18 Dec 2025 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766067646;
	bh=ZoOMPbu15uszbv6DNmVkTA9G5hpJWLOSYd86M5kLijs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=up+ynGcyvTia1cbBevKvKgN+sJ0JztDcjqoXnmXolQIbdGojikh4G4M3vzwoPIKub
	 tLN35WOwM9b3e5CYr8n2evL23Ly+FWYZ5VKM0E/GTgOupbr8aOYB6F6SazFGpdnUM3
	 iB3Jfm/jj0/3CKZmM+PVJygQo+vPLW8pem5ADUQ7gCMbSLtNwVOOdpBSaKiKi7pEJL
	 pCTs2EJxAP2O5+ivdm+Od8g53DOh3crkQAwURCIav0VbeHR3C7GY5UqjEvSmjU8Hk1
	 8/RvAWgFbUJ3zBLiM0qvc+omFK6YUVIBuxmmLd+zAeleUfPl/OXcv3nwJScmyk+Hjl
	 CMNVqepCL9IoA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWEs0-000000001YO-42Jo;
	Thu, 18 Dec 2025 15:20:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Ma Ke <make24@iscas.ac.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/5] usb: gadget: lpc32xx_udc: clean up probe error labels
Date: Thu, 18 Dec 2025 15:19:44 +0100
Message-ID: <20251218141945.5884-5-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218141945.5884-1-johan@kernel.org>
References: <20251218141945.5884-1-johan@kernel.org>
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


