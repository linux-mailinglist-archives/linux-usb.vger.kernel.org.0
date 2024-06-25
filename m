Return-Path: <linux-usb+bounces-11660-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9646917499
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 01:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CD011F217A9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 23:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFAF17F4F4;
	Tue, 25 Jun 2024 23:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+SV1iaI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E117F4E5
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719357036; cv=none; b=aOVLWwpSVrksWyNerthVjOe8l20cTfvidxaAmELTEOohCibtQoe5JCrOT3+evikm88/X2s0n/OSH91S0dfN1i4UzTxmf47+ZtMpzpltdiH257fFuy/lQmC493PvMj2AMRdZBMS8ztMQqM8NV6FnrbUwdz8eFUVzVupSIiImBLKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719357036; c=relaxed/simple;
	bh=SxOrbuoNbvfQr7CP4JU8lZ3CIEKTcmSIOqMQOFcXQhE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gRzA9yV8wMsmYa4E3/Yi0aehDk1wkIR1lOf9juHCfByUDMiEtihstBPzBeHg7nmJ0HfMBF3PH9ELq59PAqWS/jCghKOxPPPx2FgCxQQtavTq3VcTJnzHDqFh8cnqeOdWOb7ITnAfVWPJqtS0Jd/4iAK+D51Dkhz9ta/kvhRlYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+SV1iaI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7065c413655so221265b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 16:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719357034; x=1719961834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OcF3DaDVxoLxwp70f8UuOqrTC98O97C9l2i22Q6HAbo=;
        b=e+SV1iaIxEsWUirB9PSAFR3LMP7/YD2fQvjyEddgJdZDhm75WfLC3Gk1+aL87lLVhm
         VyPC+BXoxlIh9B2/Qdnb261j+nvEvdeyufJkgGgsecTfBHE4fwdLukond5XNCt8+OklX
         7HxgnN50OoC3OVzCMqloERYVtI5jGuKD62AoncjMk5bfs901UnAxe5uuNN3ImwZjK2NJ
         pnyGl11qQ1pEI8PSrmxt1b77b97GiIJiG+nNlDWewAljd4fENlN1Jr+OJxgGMG1yyvhO
         J97jC4mWsJ/dsBD74vWy6xajbUA6RVsGvLtKjFC5Z9yRQgcYT9LLzf9lw0ri63TK0j0P
         eu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719357034; x=1719961834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcF3DaDVxoLxwp70f8UuOqrTC98O97C9l2i22Q6HAbo=;
        b=vZ6ffm5zPPWV5RZLVU7hMxzMxAQvA0ghGNgf+bsnaVZE+CYvOzpJ08ulvoRvuwIvK8
         qI9iKucyYZr4Y16dA64i14SEk1+/2XFvK8XuYwyCrqGRiL4CRYcGADkTYdDzAo7t+qlM
         aVYsJ0728k7KT08ouljxSAmSHqk1veDuSdNFYkqCCoKU+ewNMjU7n2NIZyOvz+ZWnMb6
         t6bKrlxI0JzankMazP/J1xptmQLll9DL28wma7SkxJb6ttnhhrtNF5USm7r+/ZfSRf+P
         T1anlwBWbG6qTxP8NgiwYbMCZhD4mdStRfZre/9klrSd6459MhL2yIBVo/oPuDnn4UFD
         2Pow==
X-Forwarded-Encrypted: i=1; AJvYcCVjUZIXSzbklNcMDGk2cd6QYQPWJ1dNrJ/U43AH6y+o0BOGbe4aaLfsusP/Yhfat+dGCqyAooQcnJPg4hE3XWaBFC4hTdMotkH0
X-Gm-Message-State: AOJu0YztxeQjbl5p5gv5Axj7lHSB//QXUyjDgrFLLvc5jY1CJDQASIKt
	G5I0mGglWXrwAw2IMvDXzcC6df3Srh02ICPeIjG2R19/1wLxGd4UWfUM+A==
X-Google-Smtp-Source: AGHT+IHlvDj1WHYJl2LBgMB8izkUuEAvDZNt+cG3rJ6b6o0SPa4F+ilf5AR8m9nDisdgcuTIsoZ2fg==
X-Received: by 2002:a05:6a20:432c:b0:1bc:e987:493f with SMTP id adf61e73a8af0-1bce9874c7amr12933150637.1.1719357034322;
        Tue, 25 Jun 2024 16:10:34 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1451:872:213b:5880])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70666aa4760sm6895073b3a.40.2024.06.25.16.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 16:10:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: peter.chen@kernel.org,
	thierry.reding@gmail.com,
	linux-usb@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] usb: chipidea: ci_hdrc_imx: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Tue, 25 Jun 2024 20:10:22 -0300
Message-Id: <20240625231023.436403-1-festevam@gmail.com>
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
 drivers/usb/chipidea/ci_hdrc_imx.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index a17b6d619305..bdc04ce919f7 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -557,7 +557,7 @@ static void ci_hdrc_imx_shutdown(struct platform_device *pdev)
 	ci_hdrc_imx_remove(pdev);
 }
 
-static int __maybe_unused imx_controller_suspend(struct device *dev,
+static int imx_controller_suspend(struct device *dev,
 						 pm_message_t msg)
 {
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
@@ -582,7 +582,7 @@ static int __maybe_unused imx_controller_suspend(struct device *dev,
 	return 0;
 }
 
-static int __maybe_unused imx_controller_resume(struct device *dev,
+static int imx_controller_resume(struct device *dev,
 						pm_message_t msg)
 {
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
@@ -618,7 +618,7 @@ static int __maybe_unused imx_controller_resume(struct device *dev,
 	return ret;
 }
 
-static int __maybe_unused ci_hdrc_imx_suspend(struct device *dev)
+static int ci_hdrc_imx_suspend(struct device *dev)
 {
 	int ret;
 
@@ -636,7 +636,7 @@ static int __maybe_unused ci_hdrc_imx_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ci_hdrc_imx_resume(struct device *dev)
+static int ci_hdrc_imx_resume(struct device *dev)
 {
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 	int ret;
@@ -652,7 +652,7 @@ static int __maybe_unused ci_hdrc_imx_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ci_hdrc_imx_runtime_suspend(struct device *dev)
+static int ci_hdrc_imx_runtime_suspend(struct device *dev)
 {
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 
@@ -664,15 +664,14 @@ static int __maybe_unused ci_hdrc_imx_runtime_suspend(struct device *dev)
 	return imx_controller_suspend(dev, PMSG_AUTO_SUSPEND);
 }
 
-static int __maybe_unused ci_hdrc_imx_runtime_resume(struct device *dev)
+static int ci_hdrc_imx_runtime_resume(struct device *dev)
 {
 	return imx_controller_resume(dev, PMSG_AUTO_RESUME);
 }
 
 static const struct dev_pm_ops ci_hdrc_imx_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ci_hdrc_imx_suspend, ci_hdrc_imx_resume)
-	SET_RUNTIME_PM_OPS(ci_hdrc_imx_runtime_suspend,
-			ci_hdrc_imx_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(ci_hdrc_imx_suspend, ci_hdrc_imx_resume)
+	RUNTIME_PM_OPS(ci_hdrc_imx_runtime_suspend, ci_hdrc_imx_runtime_resume, NULL)
 };
 static struct platform_driver ci_hdrc_imx_driver = {
 	.probe = ci_hdrc_imx_probe,
@@ -681,7 +680,7 @@ static struct platform_driver ci_hdrc_imx_driver = {
 	.driver = {
 		.name = "imx_usb",
 		.of_match_table = ci_hdrc_imx_dt_ids,
-		.pm = &ci_hdrc_imx_pm_ops,
+		.pm = pm_ptr(&ci_hdrc_imx_pm_ops),
 	 },
 };
 
-- 
2.34.1


