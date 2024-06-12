Return-Path: <linux-usb+bounces-11162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA949048BF
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 04:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE436B22240
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 02:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E3A4C90;
	Wed, 12 Jun 2024 02:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="fL48R4Uz"
X-Original-To: linux-usb@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938534696
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 02:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718158091; cv=none; b=jy2yPGLhf5sXdiDrZap7Vr/hQHcMUCrJ6ccpILQGjiWsg8/eRyUzDQveAAzxO3hR0pSN5V9t96ex3rEbCAoFlTjMpVl3AmhBXBKyQtNrxWUKKFgIZZwxdGBJsA8B07kVfUZKup+kWfqGh3V2hOEhOQD2kfrSGmP7eyawE3RzLps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718158091; c=relaxed/simple;
	bh=cl19qSP8hdSCVvnd4cXugCUomIfeUwLbYtVdmDfIQig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CQ+FXjnu1W89DC5X0QPXMt51vRAiShtrU4M5m5c1pWAO7RU9Bb/XWYxnQEWbtvcP7VlMFuspWIowxYRUx7fppZhzuMcVaI5WhVRg0ao/QRMJFjNxdILwA1csnYDZcXYeA9UlsseXLxb7+5fVc5tjMHvr9KLp8FhbuHPoaKWRo/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=fL48R4Uz; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 7333A201FE; Wed, 12 Jun 2024 10:08:01 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718158081;
	bh=DB5rOb0/z6zqHMVZYKY5CxM6R3KYeCCK6hxDRwtNY6g=;
	h=From:Date:Subject:To:Cc;
	b=fL48R4Uzk+a8VXbNyXLDa0/KTKTQt89AdkNuyLDqjKayeJF72dnQKL82A1jpDUHF/
	 xrdfyEx4/tFAug6WGKLNsUqVYWLqYhx0TTZ8M/A0Nve0ZiXuBakG1PMLjthYwqntsd
	 LH0R8Ukri/SgsN+Bb0kz4VVLv0FsghGpzLhbnTt1Z6RB4WA3BkWGxQxoI5tCmKRAN3
	 oT1KXNroA8+mZSar8qZ+Ekjgu1SyMigc7yTmAQRr12gL0CrwxrJB0ie+voQ5Ux/dNT
	 zRN6Ieg8jHmWTJ7kl/SfGgx6gt06XFJOwRBvZ83vi4xIKJnFaqBcVou+UqsBkGZIxc
	 DM+//FAgGVW2Q==
From: Jeremy Kerr <jk@codeconstruct.com.au>
Date: Wed, 12 Jun 2024 10:07:33 +0800
Subject: [PATCH] usb: gadget: aspeed_udc: fix device address configuration
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAOUCaWYC/x3MQQqAIBBA0avIrBNUwqCrRAuZGWs2JkoRiHdPW
 r7F/w0qF+EKq2pQ+JEqVxqwkwI8QzpYCw2DM2423lodamYmfRNqsxASG+8QI4wgF47y/rNt7/0
 DjpD6xVwAAAA=
To: Neal Liu <neal_liu@aspeedtech.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.13.0

In the aspeed UDC setup, we configure the UDC hardware with the assigned
USB device address.

However, we have an off-by-one in the bitmask, so we're only setting the
lower 6 bits of the address (USB addresses being 7 bits, and the
hardware bitmask being bits 0:6).

This means that device enumeration fails if the assigned address is
greater than 64:

[  344.607255] usb 1-1: new high-speed USB device number 63 using ehci-platform
[  344.808459] usb 1-1: New USB device found, idVendor=cc00, idProduct=cc00, bcdDevice= 6.10
[  344.817684] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  344.825671] usb 1-1: Product: Test device
[  344.831075] usb 1-1: Manufacturer: Test vendor
[  344.836335] usb 1-1: SerialNumber: 00
[  349.917181] usb 1-1: USB disconnect, device number 63
[  352.036775] usb 1-1: new high-speed USB device number 64 using ehci-platform
[  352.249432] usb 1-1: device descriptor read/all, error -71
[  352.696740] usb 1-1: new high-speed USB device number 65 using ehci-platform
[  352.909431] usb 1-1: device descriptor read/all, error -71

Use the correct mask of 0x7f (rather than 0x3f), and generate this
through the GENMASK macro, so we have numbers that correspond exactly
to the hardware register definition.

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 3916c8e2ba01..821a6ab5da56 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -66,8 +66,8 @@
 #define USB_UPSTREAM_EN			BIT(0)
 
 /* Main config reg */
-#define UDC_CFG_SET_ADDR(x)		((x) & 0x3f)
-#define UDC_CFG_ADDR_MASK		(0x3f)
+#define UDC_CFG_SET_ADDR(x)		((x) & UDC_CFG_ADDR_MASK)
+#define UDC_CFG_ADDR_MASK		GENMASK(6, 0)
 
 /* Interrupt ctrl & status reg */
 #define UDC_IRQ_EP_POOL_NAK		BIT(17)

---
base-commit: 32f88d65f01bf6f45476d7edbe675e44fb9e1d58
change-id: 20240611-aspeed-udc-07dcde062ccf

Best regards,
-- 
Jeremy Kerr <jk@codeconstruct.com.au>


