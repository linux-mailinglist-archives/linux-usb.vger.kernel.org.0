Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B6314A592
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 14:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgA0N7C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 08:59:02 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34251 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgA0N7C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jan 2020 08:59:02 -0500
Received: by mail-pg1-f196.google.com with SMTP id r11so5209499pgf.1;
        Mon, 27 Jan 2020 05:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SHolRPg0m8smXLQiIHsWoHZ6uEiJ6L4xqwMHqTUOZII=;
        b=CMClr8xR/vzMlFHSniodUnq6hdXQ5SJE3d0Ue+KnUKivbaZc5HsyCTI0b8378iD04/
         /YUTxGrzskbemiYG+C1fFUdmP8IwlIWd7cDus87oqgqCl8lSIWVgffIe7+xkB2tuTVpj
         ZYgj/qfvpkopSGAOEDTTVl6WbwCYR0fHapSgUewkutkjQabAFh4Pe2tNiOVvl3+t3q6t
         Ar50RTjQyvawr3UXX0rcd5PV6loT2VEcAvaJhAwokfzFoCc6RaVYwtq1ru1wfFEK5rmn
         dB390ZUtqQXJG77ZvEGp+lj3lkAgAIhRHVFcHpB47rNHHkrh+aSu4pVjXruQDu5AOhsM
         cJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SHolRPg0m8smXLQiIHsWoHZ6uEiJ6L4xqwMHqTUOZII=;
        b=mz1n6YT4/aZl53UKcZ0FDuMWgnrhxiEyZ9+y7cIvHfLI+h33XMlT+FhUMFjW22iiyy
         40yIz2AkpteohEnUCI9m6jfC0fAWg2OJJx+EwscNeOSpPV+FbLr+i3jTfYquwH6UGz5S
         5bU9+5oF6pwOdBgF3+ThtrmuZ+VcnMrLEL/dgt1a1av4eooC33E5NBmF6qv26ahRGnnW
         4ZlySSphP+5y1M7nNUsVqGQMbbfAj/1mZZmukIqWnSVFiY363htuY7q+33GDx53dFrXI
         Ja6n6tBzZuVvwi0FHscTBv3+OIiAkbzkwfGLQQ1UXuYtMpQNot0ihG56/IFGW+DLh+ux
         V8gw==
X-Gm-Message-State: APjAAAX9kBE8rtQold+niCujhoxDMcJf5+YgHFJcbvhztA0JD4QzV2h+
        9M5rL/MGtQpI0FTUz9KlMmY=
X-Google-Smtp-Source: APXvYqyLLUIJ53lGLIXCrkyyudP6ClzJQ22YcI076etIWIaq1vR0oag7wSYwsNZihwn75Mvl1ZKm8w==
X-Received: by 2002:a63:2d44:: with SMTP id t65mr20803705pgt.112.1580133541647;
        Mon, 27 Jan 2020 05:59:01 -0800 (PST)
Received: from localhost ([216.24.177.237])
        by smtp.gmail.com with ESMTPSA id b24sm15872895pfo.55.2020.01.27.05.58.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 05:59:01 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH] usb: phy: tegra: make the code simple by devm_platform_ioremap_resource()
Date:   Mon, 27 Jan 2020 21:58:41 +0800
Message-Id: <20200127135841.17935-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

make the code simple by use devm_platform_ioremap_resource() function
to replace platform_get_resource() and devm_ioremap().

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index ea7ef1dc0b42..8220bb4ce1ed 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -944,20 +944,12 @@ static int read_utmi_param(struct platform_device *pdev, const char *param,
 static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 			  struct platform_device *pdev)
 {
-	struct resource *res;
 	int err;
 	struct tegra_utmip_config *config;
 
 	tegra_phy->is_ulpi_phy = false;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get UTMI pad regs\n");
-		return  -ENXIO;
-	}
-
-	tegra_phy->pad_regs = devm_ioremap(&pdev->dev, res->start,
-		resource_size(res));
+	tegra_phy->pad_regs = devm_platform_ioremap_resource(pdev, 1);
 	if (!tegra_phy->pad_regs) {
 		dev_err(&pdev->dev, "Failed to remap UTMI pad regs\n");
 		return -ENOMEM;
@@ -1054,7 +1046,6 @@ MODULE_DEVICE_TABLE(of, tegra_usb_phy_id_table);
 static int tegra_usb_phy_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
-	struct resource *res;
 	struct tegra_usb_phy *tegra_phy = NULL;
 	struct device_node *np = pdev->dev.of_node;
 	enum usb_phy_interface phy_type;
@@ -1071,14 +1062,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	}
 	tegra_phy->soc_config = match->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get I/O memory\n");
-		return  -ENXIO;
-	}
-
-	tegra_phy->regs = devm_ioremap(&pdev->dev, res->start,
-		resource_size(res));
+	tegra_phy->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (!tegra_phy->regs) {
 		dev_err(&pdev->dev, "Failed to remap I/O memory\n");
 		return -ENOMEM;
-- 
2.25.0

