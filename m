Return-Path: <linux-usb+bounces-11249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2F90630F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 06:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D28F3B21D69
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 04:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE537E0FC;
	Thu, 13 Jun 2024 04:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="KSBMEN3g"
X-Original-To: linux-usb@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16252F34
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 04:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718252508; cv=none; b=Hnij3gt/amIzvXvT+UZ94ZZfPUJstfdqbUZjUEjZThHQMeMKB/o4TDRnYM2SvOnJ+trPJImz8gznFFbOLUJeEYZuyHdKZudCAlu2701tLs1mYTE/OHNNp3thxWkwLxFiEqY8jBpkQsJ9ZryqHWfYxfOYZ/t8KfTVjIyWuaYrFTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718252508; c=relaxed/simple;
	bh=HQo2Sw4agF55zwVzOjGv5cIm+bU6XesqzSfB7bHaD0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KNDj9ELYdDtVI7MPUuYZ1X7GLFMKhrNzfBCGEE0R7X5P8scivFw/D5u1f92BWyWW5M8lr91fNzI/590x/UaW0k+FQzhodyy5rhFHYo9mV66uF09KWJu7h+bVjP3JP3ftbCTt0dWSsJcZ0lf222JGcsww5GyCQ9syAe3fCWn+3L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=KSBMEN3g; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id E484E2018F; Thu, 13 Jun 2024 12:21:35 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718252495;
	bh=S+YHJgRM035nLxthI4G82gaHJgS6T+YR08kZw9KBQvs=;
	h=From:Date:Subject:To:Cc;
	b=KSBMEN3gaumaS04MngmkQj7Idqi2x305ZiqlvpkV5RiN6bOsFjMuzkuT0BixzjFdQ
	 lRfWAk44G1P29/xZqyLDMbDSOhXAw+yEV+mvgc6/bMYeHkvo0OKMMwO4sdOwmhaSTn
	 rp+RCGTY0qdfEpIN8Z42TqkRFS0zM7HyDL4/vjPnsPTkxCISS+wCJ2RHdlIGG4nRIU
	 1Hz/Qxs0p0xRVbERsUPvG2ptffaVD3Ge4GYleH9RpjnKrtGytOKrQo0e7pgyrjJsZn
	 GM5iA5shjX7ecyjl3YL1vMsEeq7t3qM2N5/8eRxk5CvCDUjAA8guqiBLaeBTO3vysI
	 UpwOdDbRdA6CA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
Date: Thu, 13 Jun 2024 12:20:47 +0800
Subject: [PATCH v2] usb: gadget: aspeed_udc: fix device address
 configuration
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-aspeed-udc-v2-1-29501ce9cb7a@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAJ5zamYC/03MQQqDMBCF4avIrDuSpFWhq95DXKQzY82iRpIYW
 sS7NxUKXf4P3rdBlOAkwrXaIEh20fm5hDlVQJOdH4KOS4NR5qJardHGRYRxZULVMbGo1hCNUA5
 LkNG9DqwfSk8uJh/eh531d/0x5p/JGjWy6bp705yt0Hgjz0J+jimslGryz9quMOz7/gFjxalFr
 wAAAA==
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
Cc: stable@vger.kernel.org
Reviewed-by: Neal Liu <neal_liu@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
v2:
- Add Cc: stable@ tag
- v1: https://lore.kernel.org/r/20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au
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


