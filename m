Return-Path: <linux-usb+bounces-11661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 422E191749A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 01:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0B571F21642
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 23:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286DD17F500;
	Tue, 25 Jun 2024 23:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alL2Li5+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B4D17F4F7
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 23:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719357038; cv=none; b=GJ2fOO7lIyrjLATx2SLYUiZXTdu6L+DSZRT03upoVfwQf5oj+jsszAlq9rwg9Eecs8/EeLrl4YTIGarA/hk/6ZACShK2+oVHHP4Qh0xQSPRgNBJVgYc9Tm/ZWNriUNO6rQkftSe/S2eMnfbooz6kA1y3miywtZEr9Xa/i0QqKDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719357038; c=relaxed/simple;
	bh=IM5zcGBJ+zT7t/1agzVMJrCJKtgAkgbPZ08DgtZCQ/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=boXxp+hxSSdoWTM2kAaY0B1NYqjJq3ZrwsvpEiJ2F3x1HD/C88B5hxyAI9w2SNpvTW6pMvtVSmqS2ONymzD75JRchDzTV8wzktr8vzf5BWH2kOTZMxlqc1ApEEsYTQcRbR0mYJsSp9BZCvasLTNeVhzMV0BXw2d40WhnmHo9tB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alL2Li5+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70677fe5d87so111150b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 16:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719357037; x=1719961837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20liNpV52OBTnI1eg5T5BQ+42IauGzSVqUcpZqIs4tc=;
        b=alL2Li5+0zgjW1+vvfZvBrTp8IYaZac50r9qvWZlAKRrwN30lET1XmY3XWks87fWNV
         4lOAv3OJP7ZvpjI3jV4rrtwaarBhvhqulb51D410YvUkwJ5JFHkv4EU2o3hXw3xBsgCK
         P6J2MjjAFibk/DSk9xyDBDw0Dj8lI2aSbGYQaQ8ScIDrc9nFFPTX+KreaUFHYMBlBvEl
         qvNDcEM3HANINF1FpWY2wX9bHTq2ZDoL9TPkdB9i627wsGIsA9QPBATJ8FhpNz7fonbR
         nDKeaXy76QBxOn2JoLGHIuGeq8Hgf3zXdbd63x4s+RkBveHPi4uFuM5hY1dSEzksadTb
         7EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719357037; x=1719961837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20liNpV52OBTnI1eg5T5BQ+42IauGzSVqUcpZqIs4tc=;
        b=h5bQbKgcItnVQB8nveKIqQ0uiFNjDdN3bDHyyvtEFl8w6UP/CjiW396ANmLtbY0vGK
         xh42uz5MZcaUk4kmIt8VkQkbl/5i9tZna/UDHiBw5tYB5ED+aHRdITK5IZkqSIot0k2J
         OXj9uF6P2zILFN3pBuhnMUstBO1yr6HGq/Qg0hRTx37V5I1WtSkwuVktnyPx2VDj4WmV
         C931/GtqBTr4vFo5hNCQR8tEVzoZYKF4THiavLkIljpFTAQ4aH8yMEcGKYJTExomQQ2P
         v4IVdvDlLjhHIL+AA2Qd+o/pmZ63dmKzEUm/gJn+hBEud1o2utCiSPPYWeUhd2oksImz
         jSFw==
X-Forwarded-Encrypted: i=1; AJvYcCURdoX8XiwWC+yjFmlMm6zG16lGEtx2phIY9yKi1lMJsjnHcUmJWgBswynq0c5ar0GCRPnd4KaN0vr1ou8+zCAmk9ZzeNugE3O2
X-Gm-Message-State: AOJu0YxupM6OTDVj0LBgw8ITa2nhUr4oUKx0u/WjBAVb5S8P1GK3uITl
	72Fr4L3th+xYOFszvAulgOiRfsfhf7iYORYgoxEa2oqiCCeE/nLxCzGcJA==
X-Google-Smtp-Source: AGHT+IFjUVqcU/qZZHKkSS3Wsb2QFYnDj3iTT2PNtbPof8dfHHDA6zsphUyNVBEhWSRp325eVbdW7g==
X-Received: by 2002:a05:6a00:8702:b0:705:daf0:9004 with SMTP id d2e1a72fcca58-706680c1610mr10794220b3a.3.1719357036484;
        Tue, 25 Jun 2024 16:10:36 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1451:872:213b:5880])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70666aa4760sm6895073b3a.40.2024.06.25.16.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 16:10:36 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: peter.chen@kernel.org,
	thierry.reding@gmail.com,
	linux-usb@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] usb: chipidea: ci_hdrc_tegra: Switch to RUNTIME_PM_OPS()
Date: Tue, 25 Jun 2024 20:10:23 -0300
Message-Id: <20240625231023.436403-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625231023.436403-1-festevam@gmail.com>
References: <20240625231023.436403-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern RUNTIME_PM_OPS()
alternative.

The combined usage of pm_ptr() and RUNTIME_PM_OPS allows the compiler
to evaluate if the runtime suspend/resume() functions are used at build
time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 2cc305803217..9538d425f0a0 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -372,7 +372,7 @@ static void tegra_usb_remove(struct platform_device *pdev)
 	pm_runtime_force_suspend(&pdev->dev);
 }
 
-static int __maybe_unused tegra_usb_runtime_resume(struct device *dev)
+static int tegra_usb_runtime_resume(struct device *dev)
 {
 	struct tegra_usb *usb = dev_get_drvdata(dev);
 	int err;
@@ -386,7 +386,7 @@ static int __maybe_unused tegra_usb_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra_usb_runtime_suspend(struct device *dev)
+static int tegra_usb_runtime_suspend(struct device *dev)
 {
 	struct tegra_usb *usb = dev_get_drvdata(dev);
 
@@ -396,15 +396,14 @@ static int __maybe_unused tegra_usb_runtime_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops tegra_usb_pm = {
-	SET_RUNTIME_PM_OPS(tegra_usb_runtime_suspend, tegra_usb_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(tegra_usb_runtime_suspend, tegra_usb_runtime_resume, NULL)
 };
 
 static struct platform_driver tegra_usb_driver = {
 	.driver = {
 		.name = "tegra-usb",
 		.of_match_table = tegra_usb_of_match,
-		.pm = &tegra_usb_pm,
+		.pm = pm_ptr(&tegra_usb_pm),
 	},
 	.probe = tegra_usb_probe,
 	.remove_new = tegra_usb_remove,
-- 
2.34.1


