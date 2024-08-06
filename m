Return-Path: <linux-usb+bounces-13132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF8B948E07
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 13:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9117F1C232EF
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 11:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F7E1C37A5;
	Tue,  6 Aug 2024 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tw9X1Irb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2AF1BD015
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944588; cv=none; b=kcgZMoTAEiyy+6KPvAd4d7EZDRapc5bZH41asWKty8CmYomQCKSs39VL+y8dOYgY+k7RPCyBV2cg/jgNBzfqPvOw1oRcvxlJ8il6ndh1j6emzytwiPiz4dgQoYZkywW5h+nH0RA6pNvNBfTnGCCJKMTBFGdDghFwPap1DNg2bRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944588; c=relaxed/simple;
	bh=Z6xlId7q0Vfm+FeJ3zQeLCCXzCKiMho5wSh4gtbswc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nf6rwwQVWdpmcW0x6KY237Q4U8zD9SgdlpjkGHbMZFZAwUVuMCAMlD6vmrOtbbLClXCUc4YChnakZ3zP7Sommw+CROUhh/lp0U9Ngl5OT1PGuCOP9f/h5q0they0j123AS+2q0IB87T3Jwlboipl1fyQCWsXbwmwKWrNGD/1htk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tw9X1Irb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2cd46049d2bso169039a91.3
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2024 04:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722944586; x=1723549386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pH/NKRMVdwEmIgLR7UulwVxQzWNz1LIelnNAG0aSToQ=;
        b=Tw9X1IrbiegfbK6BJd94xZx0SqyFXnaUJP0l5Np6iIonVrBhLid2dxxMdUd+9BVhMR
         AyUtrYZx1kk6sQ1PEfifi2IsN0JBz60WPyD/ZcxHF8fUddFqQQsGUpnBiJMBqX/F714i
         SU4Y4Ur4fxWZq+DJd5RnFvbFy8GrTVUl0FfSoKznSN+22QaPiPvJLyv3FykFfWFnK9Ot
         io9uGodUFjhufD1pbx6QhvKE8TDivWK8MW/oQa3my71CUFP6QHgTvQVPAT8s4SEwFEMM
         czyEi32poPtEz5j3bF+xGWvVJsOyGsONzu5+/fBJTdk/9pjM53b8hi6yT+F969vg7WV6
         GhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944586; x=1723549386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH/NKRMVdwEmIgLR7UulwVxQzWNz1LIelnNAG0aSToQ=;
        b=VMuaSBiu1mMkoZnI58ph4tlgI9cxkbVtLd9mwQ6WDiJkK2J/xgEH9sgd7bPRExPFlQ
         iL33XWbfJSPfFMg4kwrI+Dk+KhRqrgiHlmvC+XTNGl+pLT3V426UkW5Z80zaaAXwkY1K
         6vWfaYCLNdwOlTG0e3gAhqBRxIsgkcBPYCMTitXtox2Qc30n1ssvKZDyFaExhJaaNTpx
         qJXei0kEw/05Wj7jD5d1hBGYV156EMXNKKiLee8m1ZGqIZVWSqsutUHWik9MKvV2PIyE
         6O5UtUB8D/avJYrAl0KQJyb2BtxefEkujscL2J47XShC5ZafQWUddP/rIWPhR87YTtZY
         q9gA==
X-Forwarded-Encrypted: i=1; AJvYcCX685vVCa0S5JgL03/XIu+h/prxju3sb5sVYZxJjJofd648udCB86TiXyMXtLhD6QMXWWWF8Y8H0vM=@vger.kernel.org
X-Gm-Message-State: AOJu0YznzagDZ6FEQ1pHf4NMA4tezuYji4j65cce+XfhNlQx2TQDPS1z
	YZyQ++Vz2C0W42MimMEZSWRrOSAxs2yzT2v85dI82hbhXGH+hEQ5
X-Google-Smtp-Source: AGHT+IFgvhOHFRNvB5yg48uIGUBXXpWCcGVIkdqI3DQEmLQNwk7SE1SYo72hNTyEEkGV82QRW8043Q==
X-Received: by 2002:a17:90a:c68b:b0:2cb:4382:668f with SMTP id 98e67ed59e1d1-2cff958fd7amr10079172a91.5.1722944585723;
        Tue, 06 Aug 2024 04:43:05 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3668:14ca:30e:638f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf96996sm9007938a91.16.2024.08.06.04.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:43:05 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Thinh.Nguyen@synopsys.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] usb: dwc3: imx8mp: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Tue,  6 Aug 2024 08:42:31 -0300
Message-Id: <20240806114231.2603055-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS()/SET SYSTEM_SLEEP_PM_OPS() with their modern
RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() alternatives.

The combined usage of pm_ptr() and RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 8ee448068503..a8bd0850a873 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -282,8 +282,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 }
 
-static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx,
-					      pm_message_t msg)
+static int dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 {
 	if (dwc3_imx->pm_suspended)
 		return 0;
@@ -297,8 +296,7 @@ static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx,
 	return 0;
 }
 
-static int __maybe_unused dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx,
-					     pm_message_t msg)
+static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 {
 	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3);
 	int ret = 0;
@@ -331,7 +329,7 @@ static int __maybe_unused dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx,
 	return ret;
 }
 
-static int __maybe_unused dwc3_imx8mp_pm_suspend(struct device *dev)
+static int dwc3_imx8mp_pm_suspend(struct device *dev)
 {
 	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
 	int ret;
@@ -349,7 +347,7 @@ static int __maybe_unused dwc3_imx8mp_pm_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused dwc3_imx8mp_pm_resume(struct device *dev)
+static int dwc3_imx8mp_pm_resume(struct device *dev)
 {
 	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
 	int ret;
@@ -379,7 +377,7 @@ static int __maybe_unused dwc3_imx8mp_pm_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused dwc3_imx8mp_runtime_suspend(struct device *dev)
+static int dwc3_imx8mp_runtime_suspend(struct device *dev)
 {
 	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
 
@@ -388,7 +386,7 @@ static int __maybe_unused dwc3_imx8mp_runtime_suspend(struct device *dev)
 	return dwc3_imx8mp_suspend(dwc3_imx, PMSG_AUTO_SUSPEND);
 }
 
-static int __maybe_unused dwc3_imx8mp_runtime_resume(struct device *dev)
+static int dwc3_imx8mp_runtime_resume(struct device *dev)
 {
 	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
 
@@ -398,9 +396,9 @@ static int __maybe_unused dwc3_imx8mp_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dwc3_imx8mp_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dwc3_imx8mp_pm_suspend, dwc3_imx8mp_pm_resume)
-	SET_RUNTIME_PM_OPS(dwc3_imx8mp_runtime_suspend,
-			   dwc3_imx8mp_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(dwc3_imx8mp_pm_suspend, dwc3_imx8mp_pm_resume)
+	RUNTIME_PM_OPS(dwc3_imx8mp_runtime_suspend, dwc3_imx8mp_runtime_resume,
+		       NULL)
 };
 
 static const struct of_device_id dwc3_imx8mp_of_match[] = {
@@ -414,7 +412,7 @@ static struct platform_driver dwc3_imx8mp_driver = {
 	.remove_new	= dwc3_imx8mp_remove,
 	.driver		= {
 		.name	= "imx8mp-dwc3",
-		.pm	= &dwc3_imx8mp_dev_pm_ops,
+		.pm	= pm_ptr(&dwc3_imx8mp_dev_pm_ops),
 		.of_match_table	= dwc3_imx8mp_of_match,
 	},
 };
-- 
2.34.1


