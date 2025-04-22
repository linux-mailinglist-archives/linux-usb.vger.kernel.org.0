Return-Path: <linux-usb+bounces-23356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F83A97AC8
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 01:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1839A1B60CFD
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 23:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D190E1F4606;
	Tue, 22 Apr 2025 23:00:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F0190472
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 23:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745362814; cv=none; b=cc3jXZSuon8P3laRUdbRl+8OlZOR0QIrQwve0DnI6s/QfWNvBAiwvW1SbzGs1HEOVM0ztR9njr8Ms8I6m9xSAftvI0iPgqtWNuM7N572z+rKeqMS47mfMt0fJ2bzeVppJ2UcNf58oJxczmDztXwfvSwOGA21fVh2NYYDYIQHaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745362814; c=relaxed/simple;
	bh=7Hp67WPO6rmYrKyEr9r4WkF4d02+ZghMezpCzmvjs4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r/IKK9TtgyobF7vuw9OFYQszmhJoDWNjqQT1DKZ6aV+63rllhILXiqRzbSXRn7zZFXNzb2cL9t9chzsqtNAgPZfK7Ttn2dScyKB2uwYKBuYYdoE87im7Xhwu+H7Hyc7Re96NtNR7iVTEMdmEDYLcW+h/CXT9gGALDkf0gud7HNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id D5A1A233A9;
	Wed, 23 Apr 2025 02:00:01 +0300 (MSK)
Date: Wed, 23 Apr 2025 02:00:00 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH] usb: isp1760: increase buffer size to avoid overflow
Message-ID: <20250422230000.GA857@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

isp1760_field_set() may access the udc->fields array beyond the size
of DC_FIELD_MAX up to HC_FIELD_MAX, which is (now) bigger. Increase
the buffer size to max(DC_FIELD_MAX,HC_FIELD_MAX) to avoid possible
overflow.

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org).

Fixes: 1da9e1c06873 ("usb: isp1760: move to regmap for register access")
Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
---
 drivers/usb/isp1760/isp1760-hcd.h  | 2 +-
 drivers/usb/isp1760/isp1760-regs.h | 2 ++
 drivers/usb/isp1760/isp1760-udc.h  | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
index ee3063a34de3bccf..a2ba48c84a8dd513 100644
--- a/drivers/usb/isp1760/isp1760-hcd.h
+++ b/drivers/usb/isp1760/isp1760-hcd.h
@@ -50,7 +50,7 @@ struct isp1760_hcd {
 	void __iomem		*base;
 
 	struct regmap		*regs;
-	struct regmap_field	*fields[HC_FIELD_MAX];
+	struct regmap_field	*fields[FIELD_MAX];
 
 	bool			is_isp1763;
 	const struct isp1760_memory_layout	*memory_layout;
diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
index 3a6751197e970013..b4644fc1f88a82f0 100644
--- a/drivers/usb/isp1760/isp1760-regs.h
+++ b/drivers/usb/isp1760/isp1760-regs.h
@@ -267,6 +267,8 @@ enum isp176x_device_controller_fields {
 	DC_FIELD_MAX,
 };
 
+#define	FIELD_MAX	(DC_FIELD_MAX>HC_FIELD_MAX?DC_FIELD_MAX:HC_FIELD_MAX)
+
 /* ISP1763 */
 /* Initialization Registers */
 #define ISP1763_DC_ADDRESS		0x00
diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp1760-udc.h
index 22044e86bc0ecb84..e01c95161526a3db 100644
--- a/drivers/usb/isp1760/isp1760-udc.h
+++ b/drivers/usb/isp1760/isp1760-udc.h
@@ -69,7 +69,7 @@ struct isp1760_udc {
 	char *irqname;
 
 	struct regmap *regs;
-	struct regmap_field *fields[DC_FIELD_MAX];
+	struct regmap_field *fields[FIELD_MAX];
 
 	struct usb_gadget_driver *driver;
 	struct usb_gadget gadget;


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

