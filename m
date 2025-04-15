Return-Path: <linux-usb+bounces-23091-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31323A8A373
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 17:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DEB51901068
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 15:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ECB27B4F3;
	Tue, 15 Apr 2025 15:55:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEE920FAA9
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732509; cv=none; b=G+6CRCAn1rGYgHJZ/Ptw56rwxaqYZZBPIKO/uheZ5AGIQ+yWtaCqulBWNvxxtCWXMLBDfBqzRn6MMVXwQl7aEbnFFXvzIrlnpgYldvtEEjAHBCJDb5AVXL7vcrDLrZqQnw5ftrUzuJ0Ik+1yK25DYWy4rUiFUdfrSl+LIydnZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732509; c=relaxed/simple;
	bh=tSGwgcDyV/ObVPKLNEjz3NYDx+ebapAhFJfN/wjNmYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFv+QxjsNt8KXX7phycM579iQt7l6Juv7lQRNX7NjvRZTvHkdI69KrZb2nEmgwujmQr/WAi37QfrZcigOE0qqSseiepbqtc4Wlr+3aQPxw3NGaemqtOZubDcgBEraptk15uNd3GMGeJuSgRBq7B2mnkfp4lH8M4urjq8q5g2BhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id E1E0C2337F;
	Tue, 15 Apr 2025 18:46:47 +0300 (MSK)
Date: Tue, 15 Apr 2025 18:46:46 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH] usb: isp1760: avoid return of uninitialized values
Message-ID: <20250415154646.GA6814@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Whether regmap_raw_read() or regmap_field_read() would fail,
functions isp1760_udc_read_raw(), isp1760_udc_read_raw16()
and isp1760_field_read() may return the uninitialized value.
Add explicit initialization to avoid that.

Fixes: 1da9e1c06873 ("usb: isp1760: move to regmap for register access")
Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
---
 drivers/usb/isp1760/isp1760-core.h | 2 +-
 drivers/usb/isp1760/isp1760-udc.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
index 91e0ee3992a75fb6..d5822454eb4b6112 100644
--- a/drivers/usb/isp1760/isp1760-core.h
+++ b/drivers/usb/isp1760/isp1760-core.h
@@ -58,7 +58,7 @@ void isp1760_set_pullup(struct isp1760_device *isp, bool enable);
 
 static inline u32 isp1760_field_read(struct regmap_field **fields, u32 field)
 {
-	unsigned int val;
+	unsigned int val = 0;
 
 	regmap_field_read(fields[field], &val);
 
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 2af89ee28baac04b..dc9e630a576da76a 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -59,7 +59,7 @@ static void isp1760_udc_write(struct isp1760_udc *udc, u16 field, u32 val)
 
 static u32 isp1760_udc_read_raw(struct isp1760_udc *udc, u16 reg)
 {
-	__le32 val;
+	__le32 val = 0;
 
 	regmap_raw_read(udc->regs, reg, &val, 4);
 
@@ -68,7 +68,7 @@ static u32 isp1760_udc_read_raw(struct isp1760_udc *udc, u16 reg)
 
 static u16 isp1760_udc_read_raw16(struct isp1760_udc *udc, u16 reg)
 {
-	__le16 val;
+	__le16 val = 0;
 
 	regmap_raw_read(udc->regs, reg, &val, 2);
 

-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

