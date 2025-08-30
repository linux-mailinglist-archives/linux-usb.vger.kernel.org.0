Return-Path: <linux-usb+bounces-27394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 442C4B3CA53
	for <lists+linux-usb@lfdr.de>; Sat, 30 Aug 2025 13:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F07D189C6BC
	for <lists+linux-usb@lfdr.de>; Sat, 30 Aug 2025 11:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064182773F5;
	Sat, 30 Aug 2025 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dsyx5OLa"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4E275870
	for <linux-usb@vger.kernel.org>; Sat, 30 Aug 2025 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756551934; cv=none; b=BsQObNZ4KaS/LRwVWY8qK7M/Q8VXp/TsWRenJfrVWsJGay+3nzubW8Svd/8m4oOq6+E4KxIBPknXBzN/uf73qKcMBTXUYbR+Gk5l95A6d5RcpgUEWbYh4EcZvfFUOO6D1SY5KYlC0rLJF/Uw9l4wB5DMsmFhgL6rQv+SLZsM3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756551934; c=relaxed/simple;
	bh=/KD5l739dunYlba49vMptsdtoAjaH+WTxMZs40EP7x4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m6y8KLRO1KqllRkt93PTu+3nCfGeqmbhdwf679sS1IJ5joEF2XLuODd9YT+c98EPaE80xOl9tw7M8Etm0jSNVZiMqdiMXg8oXxAbnrgTzLaNPCk6DkZW0SiIa5LPrGpWdcTV6nITO9FYL6RtQKzvAQ7Tc8Mn4fH6rsZXPs7Q6M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dsyx5OLa; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756551927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y6eUtUQ02u5rezVEVOgcTxRprhXqjnk3WqB6i5j0+DI=;
	b=dsyx5OLaLkbGBVOV2cA+VO323Uaoo28CF7YowEEWLL1EjbStcsce8x4ke/e+jbvOo4uQBb
	IfWce4okynDccVnJ4+9cRL2wmuIpzvEnC4jVdtTxUBNPYULxpwPrlSmWYZcLOXJXp4cGTj
	aZeUNFxEevxjH2FacO90OYwhw26VAoI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-usb@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: ucsi: stm32: Use min() to improve ucsi_stm32g0_fw_cb()
Date: Sat, 30 Aug 2025 13:04:20 +0200
Message-ID: <20250830110426.10007-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use min() to improve ucsi_stm32g0_fw_cb() and avoid calculating
'end - data' twice.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 57ef7d83a412..838ac0185082 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/unaligned.h>
@@ -523,11 +524,7 @@ static void ucsi_stm32g0_fw_cb(const struct firmware *fw, void *context)
 	data = fw->data;
 	end = fw->data + fw->size;
 	while (data < end) {
-		if ((end - data) < STM32G0_I2C_BL_SZ)
-			size = end - data;
-		else
-			size = STM32G0_I2C_BL_SZ;
-
+		size = min(end - data, STM32G0_I2C_BL_SZ);
 		ret = ucsi_stm32g0_bl_write(g0->ucsi, addr, data, size);
 		if (ret) {
 			dev_err(g0->dev, "Write failed %d\n", ret);
-- 
2.50.1


