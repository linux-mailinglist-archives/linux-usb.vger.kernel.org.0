Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E30A1471CEA
	for <lists+linux-usb@lfdr.de>; Sun, 12 Dec 2021 21:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhLLUTz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Dec 2021 15:19:55 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:36601 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhLLUTy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Dec 2021 15:19:54 -0500
Received: by mail-wr1-f46.google.com with SMTP id u17so23891444wrt.3
        for <linux-usb@vger.kernel.org>; Sun, 12 Dec 2021 12:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lo3UsCaMaL5NAfBrYJDUAK0+9C+4ooYh+4fLJsKdab0=;
        b=KOjWC5DgtgOF3XopqQeDoC4MVI2YzCCJsJn8/SGztamIk/lV+JZzFLMjwvUek/C2ZM
         ndDa0DMlr49uRS9eqfUBYj92kbhkfjFObEG+DRifDkxdoBYEB7gRSZckSVQAGGFcawno
         RE8Bj4wJ63PdPyxMLUnd/xr0tiIADoDIRmI74SBLwB6JpcY+HM3hqnWw1yWG9+JaZsuc
         GYwJrxl1P8rOrMdxdpEL9pHK78VsdvHIneYLUsNdWmsIHSoRl63RP/4Nduknj9YE41Oj
         oLgEQCXOPnnBmlIeR+17DENRftJWrm5+h1WQ1IA3G8ePsuJi9eIh6KF9iSoXeRZMmBke
         q7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lo3UsCaMaL5NAfBrYJDUAK0+9C+4ooYh+4fLJsKdab0=;
        b=nGiFLe1ib8bXOrzIy0vxrP2W9uL448juZg6edSWnPe7EPaDcbEkHFtuxriHaLZvR0C
         uta8PcKEfM+6tBpR1Tm1EHK3RFEG/szTGrSQaXL0krmkg0UpDM0rl17pTuQd+QW2ZPHu
         VqxQQcQY3N26H2hgR+QL2A1DSduSIeV5+trC8KqKcc3tv4WZWk79PnBhgLUZCvXPU1nF
         XdxoJOqs3YM/N/RJBGwM/zphEReWnGmPJln3xIuYcEsdnrOGDB3xxSqiEWItbFm4nR5/
         m4yWyytGVaRzLp2eIsDEghG03OgdQMEEp6Psl3i9HlHUnFW4ZvDSL5JozoZZGcEV5H8y
         TKCA==
X-Gm-Message-State: AOAM531QX3Ng3u7rlukdBoMhozr62QdvHTuRCaV0kT+Rqt2z4744xfYW
        OlZKwgrN3b//EP4ofSavHcfDlQ==
X-Google-Smtp-Source: ABdhPJy0qTqHTrXdybd8Z/alToU7dWXX4j89dgDjRwcQXHgR+4kefRJlnJxM84Ub3lrX7YqunzPnCg==
X-Received: by 2002:adf:ee04:: with SMTP id y4mr28043885wrn.0.1639340333104;
        Sun, 12 Dec 2021 12:18:53 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.googlemail.com with ESMTPSA id p5sm9092710wrd.13.2021.12.12.12.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 12:18:52 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     khilman@baylibre.com
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, martin.blumenstingl@googlemail.com
Subject: [PATCH v5 2/3] phy: amlogic: meson8b-usb2: Use dev_err_probe()
Date:   Sun, 12 Dec 2021 21:18:43 +0100
Message-Id: <20211212201844.114949-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211212201844.114949-1-aouledameur@baylibre.com>
References: <20211212201844.114949-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the existing dev_err_probe() helper instead of open-coding the same
operation.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index cf10bed40528..77e7e9b1428c 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -265,8 +265,9 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk_usb);
 
 	priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
-	if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
-		return PTR_ERR(priv->reset);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset),
+				     "Failed to get the reset line");
 
 	priv->dr_mode = of_usb_get_dr_mode_by_phy(pdev->dev.of_node, -1);
 	if (priv->dr_mode == USB_DR_MODE_UNKNOWN) {
-- 
2.25.1

