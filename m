Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26112468D85
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 22:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239572AbhLEWCa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 17:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239559AbhLEWC2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 17:02:28 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0861C061751
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 13:59:00 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id w1so35083538edc.6
        for <linux-usb@vger.kernel.org>; Sun, 05 Dec 2021 13:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lo3UsCaMaL5NAfBrYJDUAK0+9C+4ooYh+4fLJsKdab0=;
        b=ASw01r3PIJQON4NAGFYQKnXd2+BbWbCIcdAkLRviUUlHdvDyyOB4WiDEkudhci7DYF
         cfV32SihvIVCO6CuNoIquwRh3jlN5IIRJqpW2n6cQmEsuO/9a2WSGilXYJwxKJUyhXrr
         zSTl5Ok59h5DJIWpZnupzFisj1HXYXEdRdfg63cgswcdH1QbwneMOc9wbBcdGKDi1jH6
         vZh3u/9HEEBjvEk5KodBy0S/JjnWbXeKtHHXXLyeSlDCkPGNeHjrPSl4ixLBdgDIPRJT
         U/Tdpn58UaOwnTvfg5Y9kp+O6xashRxBjnMl/kfel2W+egtVFz4h30jQpE7q0bvvQI2Q
         KIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lo3UsCaMaL5NAfBrYJDUAK0+9C+4ooYh+4fLJsKdab0=;
        b=blkWVLkOnsGW4U6/78VhVk4PwVE4fs/1qSS06Exsal37h7GE23RGfc9FAFFClfm1je
         5ljqsUuZkv7M564BNa4H2HXaIkf4pMPC66tpIjaEH2g0eCzUZpe1kFAk41ecYm8ifirD
         TYLlEe1IcRW48BKoAlJ4vELJgHx8uoLTKudjFsjXGKtzoWpFTthvN3Jwrz9vloAnGrZh
         iGmkE/10+vQaMVbdGkkZnzTJTQxJEyiJeCmV6bLgDNAkgaccBXASp/5BAntc3H9gYPmL
         z5kxLlHcCc0we0h5QsYpavs7xSVqq8RXwWJqga/OlKCMTmiPJLGGsJ/hdl5NvRfyELkQ
         +H0A==
X-Gm-Message-State: AOAM531+PtHkZFsvI/cVVMZUA/AjZTpHAERb4Yt/8Zb/ljJ1GF+CacxA
        GpRpBN9k7eYn0C1C912qBVuvhw==
X-Google-Smtp-Source: ABdhPJxDW08rqxgjmev9uudRq1hMRU3rZw9W5A9cElENKHZZWg2qg6bvfqw0CJ9j156uWmJpH8XTjg==
X-Received: by 2002:a50:d68e:: with SMTP id r14mr48757026edi.5.1638741539361;
        Sun, 05 Dec 2021 13:58:59 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.googlemail.com with ESMTPSA id nc29sm5724291ejc.3.2021.12.05.13.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 13:58:59 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     khilman@baylibre.com
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, martin.blumenstingl@googlemail.com
Subject: [PATCH v4 2/3] phy: amlogic: meson8b-usb2: Use dev_err_probe()
Date:   Sun,  5 Dec 2021 22:58:45 +0100
Message-Id: <20211205215846.153703-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205215846.153703-1-aouledameur@baylibre.com>
References: <20211205215846.153703-1-aouledameur@baylibre.com>
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

