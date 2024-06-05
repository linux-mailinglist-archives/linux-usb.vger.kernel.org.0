Return-Path: <linux-usb+bounces-10923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B12F8FD507
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 20:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70D0A1C22E4E
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 18:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C42214659A;
	Wed,  5 Jun 2024 18:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bosRmD0V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABC1144300
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 18:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610567; cv=none; b=qAEmbhwDJOCLpXe3qgtfuIdEvjX6Ezx15KwPQv/euITInHVRuO8UTTW3DRjXfEuapRZBY5f5C8pe3ZqEG5+aDGuY060jAJUG7tiIBuZVAQilVno2mZzXshDfbI5DV39iHm/XoN52FokSIpqVPZ/6h/dfmZpo1yZ2wyZUQWeVqJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610567; c=relaxed/simple;
	bh=eF30gjQEDuHJ/IYGm6d82rKPYlogi0y1Le1+CTBv8es=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cU0BT3PLpQFZmVqkSuxMCBZLIUvoty1nizTaeXaWI7avo93RLyzgEzw6CEfY3Z27C/Je3TM5f4s75mVM6xIFkGft8qI6JIZkqcUbr/ii76Q026LQWaR1VPx5XTxlIqF7aqbn76Jx+hgT/T0bYYu6F57mqWHi2+xl4b0VJy8iAno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bosRmD0V; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-627ec18b115so496207b3.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2024 11:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610564; x=1718215364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5YxZkBMx7xM0lBc97o2/iv7RwAsHr+ZFIuj4hushzk=;
        b=bosRmD0VAZb+uNeHi7HIWEvwXg4aQpu6UokJkBAlLIP/mwUBkraTcuWQxK3I7oKf92
         IUqNEgKeAor+QlQfrxVSX46Wr8qSmnre7Lod1wkkTeP1WiYmtzlXHsm6O3NcweNaf3ya
         Qandj21eqkSssUvIpP1j/ByVvuTqh/97jqaJeYq3PTsSsF6edkETmP9wm72ftlMYpBuP
         miYX+L6h9T7WRJYqPenCfll5CtFtSZIBP1XQjvu5Eg6N2CYzUGIsxekAXrrCObtum9/3
         0mZb0apPgAHlNJwLvOjE2WR6cA9sNf2aU7/wo0Eq6mAi9yMTDLfZS5nu4m+yBkRZ20EB
         ZVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610564; x=1718215364;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5YxZkBMx7xM0lBc97o2/iv7RwAsHr+ZFIuj4hushzk=;
        b=T1TwsTmx/carGhBEJR5TgVG6co3uWdOgJXYbi1LBG2v1i0NCbyBtjzbZoE9PWDQVX/
         LmM3VXB30K769cLjFNomyzA1A0EJjeWUjtbIyccwiyAbIrvsD6J64ia20hfXmNiyne38
         zDNvUegjBTnWTkKdyQAYlW1nIG9nD/HhmpsZML3GwRtYNoNv5n2LQutGbg8GYb0blene
         i9wXKMwDC39+0M9DUtge5gLIRvvhqkGXFa33qlH45GI5zj3Cf/6rroTr18tiTp6GwzCl
         OZIfxN7uaAbsAJJ+tGP4NpBTVXZ3JTcwa3b/57PS1dGtZ3MQIroMnw/U/uXWU1dvoSRM
         SS1g==
X-Forwarded-Encrypted: i=1; AJvYcCWe8u9EzSvrFNFP/AVpn6/e7oS5yuJsJ+491LWm+LXKIxHQppugWNxDJv24ERyq9oDJ1TO1i/GGj0mkjuw+KRTmfsTCmRF1CNHq
X-Gm-Message-State: AOJu0YwCrBBJDivrmDHbydPB1LctdATRrGVoDKmSHSCm1ZFHSgVtFBwI
	yePwYaBKScixZgF12nZiAu2YxTi/EPvqimZ8vpfo1241l89FVwTHWVvU520mx1hMva15NYBabHO
	G89gdiuyeZg==
X-Google-Smtp-Source: AGHT+IGCU+GmK3Rf3XT5eiVn8GBJTqffr6kRhdYR5C7W1ubGEWJe6ysf+n1fV0SHLE+oXrcbvgWtj6KwbrbfFQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:884:b0:61d:3304:c25e with SMTP
 id 00721157ae682-62cbb5b3bc3mr8573737b3.7.1717610564108; Wed, 05 Jun 2024
 11:02:44 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:31 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-1-joychakr@google.com>
Subject: [PATCH v1 10/17] mtd: core: Change nvmem reg_read/write return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406050200.8BOdZUla-lkp@intel.com/
Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/mtd/mtdcore.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..b13752ec2f1c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -530,8 +530,8 @@ int mtd_pairing_groups(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL_GPL(mtd_pairing_groups);
 
-static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
-			      void *val, size_t bytes)
+static ssize_t mtd_nvmem_reg_read(void *priv, unsigned int offset,
+				  void *val, size_t bytes)
 {
 	struct mtd_info *mtd = priv;
 	size_t retlen;
@@ -541,7 +541,7 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 	if (err && err != -EUCLEAN)
 		return err;
 
-	return retlen == bytes ? 0 : -EIO;
+	return retlen;
 }
 
 static int mtd_nvmem_add(struct mtd_info *mtd)
@@ -919,8 +919,8 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	return nvmem;
 }
 
-static int mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
-				       void *val, size_t bytes)
+static ssize_t mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
+					   void *val, size_t bytes)
 {
 	struct mtd_info *mtd = priv;
 	size_t retlen;
@@ -930,11 +930,11 @@ static int mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	return retlen == bytes ? 0 : -EIO;
+	return retlen;
 }
 
-static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
-				       void *val, size_t bytes)
+static ssize_t mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
+					   void *val, size_t bytes)
 {
 	struct mtd_info *mtd = priv;
 	size_t retlen;
@@ -944,7 +944,7 @@ static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	return retlen == bytes ? 0 : -EIO;
+	return retlen;
 }
 
 static int mtd_otp_nvmem_add(struct mtd_info *mtd)
-- 
2.45.1.467.gbab1589fc0-goog


