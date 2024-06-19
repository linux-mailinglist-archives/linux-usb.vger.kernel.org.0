Return-Path: <linux-usb+bounces-11457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8590F727
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 21:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44BF2856CB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 19:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95DB524B4;
	Wed, 19 Jun 2024 19:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Da6Fk/dS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B531D52B
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 19:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718826268; cv=none; b=O9vbosu37ky87PvUdHOK3HxSoCBexwF/Qz9cPzsOKTj/WuONBjzbsORc1k4FPLfwl4BcyA3XTBfpEuGB+Gnk/8X3pXP3sm/JW8iv4ICDQHRuCcS3Za9pAtu/QZNeuRw3tw01+tHbabWEMzQD7kEXsR2k21Hk8ucbp0123QnWgy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718826268; c=relaxed/simple;
	bh=9oTPB6T8QXZWeuhJqr7A2ukk5D26tPebi73iJ9qj9+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rvgYajH3Lgf4b5TxD+OmptXKOdko7n99Z0ikSNMWODm7unUP8TzWq1YsBGFMEhCO+T5dmaPGhG5irSWqQmD2vI9azrlm6RUR1WjQi5mMEEsy5V6TjMzvLDduMnUCl8Pd9twtyPpgbFekS3nWvivKdrwjMrhkaz7ixuwjICWqgC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Da6Fk/dS; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f09b457fdso10723466b.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 12:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718826263; x=1719431063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KpEQyE+YkRv+2nXwcyWiwvRSRvDzznXlscaTbbfcZos=;
        b=Da6Fk/dSbH8f6vQwTmkh1KsfHgXWKof5uOW/29mhIOaawk76Lbf3l/97kEhOVq+8vh
         uNF5ASYRQ86Fn3gxIAeUGxVOqLnktvfXt0p7GGy6ed0KwJ4c2lnsurqozLaX/X+/XbSI
         ataYR1tY1AlXeQYeR8xW1Xz2zyQhKUJBzKLG7O8Pi+Zz3LEtT6upvAA/q4Wzp2IPiv2g
         CGeOPdOdIxQ99hhdrWruThJeJaYNUqS0qsWGLcGhWH35oNnZ+MdVCtFXKc3xwfHB//9C
         x5VX8RFC1kp9C3FDwjPE4bPIuuBdEv26JFQN2gfoGEpbx3uWLQd0F4GhvFxhItOqOcLM
         42QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718826263; x=1719431063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpEQyE+YkRv+2nXwcyWiwvRSRvDzznXlscaTbbfcZos=;
        b=nMzvtrGAeV3cJp4nAoawNEQ9z4BJIPsxOqdEUPnXuYlgObEjAE/Y/E3BV5pYn2vmhB
         RnRhcyrL1ZWnraTHEGpxphAtICrDWwzJsQHtIkkSs7VH0zVDvHCbvK/YnzhVXdiFJ3XC
         ZbnY0B2gxXdHalvoe7dJXjN4MLzyrlrGJKKJbY03PVZrSrBhAf7ZRIe2EY862hfFs9Or
         wattW6YS2fBTFoy8SCzOeqVdbWryQB1pLmaMWg1rfzhqgd0fYNhxM3K2aVbanyhHk0HM
         xnPUJv7vtuWPuoic7HO74b9erCe7/QxwqUCHey66M4QJnLkUR8dgxvRzHD2bIxfZzFCq
         9MHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDoi0LZ6q41FtwyHuXJc6DUfFLY+9RtK2CYWVU4VOIpdd7kWBP9jkY/mi5wt1sDyZhzVceOZ3lCx26twDMjdawfzHxILc4c6Bf
X-Gm-Message-State: AOJu0YzNbzuAOBS8rHgao/DjMk7A+meZuLkp5vXjTTX6dT1XoUm3hxa+
	Rz1+AKcXq06rgh+ETnUBbty7OwvtCXUL4aM8qsfqo0uXi2g5fQKF/EGCdN+BsY0=
X-Google-Smtp-Source: AGHT+IFPh4M1XYnhwbMXy3dRhojxqiaMc7D2I4f7qCcPECo/AP2mlLLLPmc4l4fJa6vX4QTjPlD82w==
X-Received: by 2002:a17:907:9158:b0:a6f:7834:d3fa with SMTP id a640c23a62f3a-a6fab617a0dmr178164066b.18.1718826263247;
        Wed, 19 Jun 2024 12:44:23 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3faasm691619466b.5.2024.06.19.12.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 12:44:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Richard Leitner <richard.leitner@linux.dev>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: misc: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Wed, 19 Jun 2024 21:44:13 +0200
Message-ID: <20240619194413.2544537-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=9oTPB6T8QXZWeuhJqr7A2ukk5D26tPebi73iJ9qj9+A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmczUOesjN3jMxNuYpplObeVdslHmj0ojDOBWMv Yk92kt783qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnM1DgAKCRCPgPtYfRL+ Tu92CACyNSY+7E+i1J3JnsfDV1yGIqMNCRjciZyne08vV7Wp1udzO7irFCr4sZexv3584n3jR9D bgPw/tpNNr6POmOTDH6RtepstSOAmB48OXHYEpTe6xCPGHkizZso+sfvYYn9KEUWVhBgYxl7DHm 5HsdTG+J5SY80UQ4ORmxiMnHI3npLXCkeIboqYWzxtuMgYmr93JiWFyVN3Jq+yB9yMonjIp0xPb ybpZEtmI4Zt2uL1v2JNehHQxW9hH5cNfHDn+3hNx0g5l5Zf4N87TbOzq2j99nYfDCWdwM/tym7Z 63P2VETZhwNRBu06b4uNtQOe1IlNtOsa4geqymw0yF7WWUz3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/usb/misc/usb251xb.c | 18 +++++++++---------
 drivers/usb/misc/usb3503.c  |  2 +-
 drivers/usb/misc/usb4604.c  |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 7da404f55a6d..b98cda1cef73 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -726,15 +726,15 @@ static int __maybe_unused usb251xb_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(usb251xb_pm_ops, usb251xb_suspend, usb251xb_resume);
 
 static const struct i2c_device_id usb251xb_id[] = {
-	{ "usb2422", 0 },
-	{ "usb2512b", 0 },
-	{ "usb2512bi", 0 },
-	{ "usb2513b", 0 },
-	{ "usb2513bi", 0 },
-	{ "usb2514b", 0 },
-	{ "usb2514bi", 0 },
-	{ "usb2517", 0 },
-	{ "usb2517i", 0 },
+	{ "usb2422" },
+	{ "usb2512b" },
+	{ "usb2512bi" },
+	{ "usb2513b" },
+	{ "usb2513bi" },
+	{ "usb2514b" },
+	{ "usb2514bi" },
+	{ "usb2517" },
+	{ "usb2517i" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, usb251xb_id);
diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 72765077932c..3b33e4878c60 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -390,7 +390,7 @@ static SIMPLE_DEV_PM_OPS(usb3503_platform_pm_ops, usb3503_platform_suspend,
 		usb3503_platform_resume);
 
 static const struct i2c_device_id usb3503_id[] = {
-	{ USB3503_I2C_NAME, 0 },
+	{ USB3503_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, usb3503_id);
diff --git a/drivers/usb/misc/usb4604.c b/drivers/usb/misc/usb4604.c
index 065e269ba4e3..c9a2fb3518ae 100644
--- a/drivers/usb/misc/usb4604.c
+++ b/drivers/usb/misc/usb4604.c
@@ -135,7 +135,7 @@ static SIMPLE_DEV_PM_OPS(usb4604_i2c_pm_ops, usb4604_i2c_suspend,
 		usb4604_i2c_resume);
 
 static const struct i2c_device_id usb4604_id[] = {
-	{ "usb4604", 0 },
+	{ "usb4604" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, usb4604_id);

base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
-- 
2.43.0


