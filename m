Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E5048AAE0
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 10:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237246AbiAKJxa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 04:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348172AbiAKJx2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 04:53:28 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7D8C061751
        for <linux-usb@vger.kernel.org>; Tue, 11 Jan 2022 01:53:28 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id s1so31877702wra.6
        for <linux-usb@vger.kernel.org>; Tue, 11 Jan 2022 01:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A+i9WMf7INTV7WCiMlaX+eZZQolId/EOXyuyr4T+wZU=;
        b=X/P92XWcAUFvR3YEqhxSTn9r+eVg0V0NdBO5apYmzV/a7t25cEbaojIT38kHdrpG5O
         ZvKQCC+gg0RrRpkxbOTwei1qDh3oDHZ9wh9CzqQBvngfvUKTmt+dNSVL1oHFZRhlgI1I
         T4nVsQ8iPQJSsW1UY4HR6I4e7wQIAGMRRJ9YT2c779CbPuwsz/hc+2vtnKTtbRCO5DQt
         2igqhJqekzn1rAwGdqWMW26X6EdJx2BGy9EkTbhax9IzB2MIa1ceUpkWRBBx3OzpZuU8
         bT05pVhBMmE7RqUK3B+VsexoV8eBa+ENdsknN555IDZY0qcseTdv+Ulx0AmEbkQqRAsv
         ClGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A+i9WMf7INTV7WCiMlaX+eZZQolId/EOXyuyr4T+wZU=;
        b=Upmh5P8X0nZg7W2KUgr8+p08AncQ3bke153U8Yaxk3LEbjFJXJitY6XtHz2cCZKsp5
         7YaBS3B7aEAaaydXiSuLVFdty+hefb8aqUAmyl2tJFuhbII1D9bV1Ms45w/g7QaoULQL
         WQFOv2Rsa22WAlSnki1QGfC3VSvUp/qcOHPw3h1QwmvEmFbgaE6YUITeQlcJmsHKbCND
         BVs7TPbwhxcJsttI06+0u3XpOkaeB4I9cRTt8Ygjgbnz75Eklf7kWaD813n07SZhiFiW
         VR+t+0REipQiIpum+cUi0N51DCELpAMZFBOzePLcNoCxjOnnYraCrrjA4lzafWkSpY4g
         LByg==
X-Gm-Message-State: AOAM533NfGK10V723yR/vaUu+7wADWs9DEotzzZ799IiSHYAxPbCt9HD
        UVqPEH8wT6qicXk4ioUPfkARyA==
X-Google-Smtp-Source: ABdhPJwh7rSklXagPFgtG7DKSa9/4llHAcDXK4XwiB5AjfRTsyZsnMgjJY7WB4LdEMyqAuoUtnxN3Q==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr3064155wrm.193.1641894806884;
        Tue, 11 Jan 2022 01:53:26 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.googlemail.com with ESMTPSA id l18sm1248916wms.24.2022.01.11.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 01:53:26 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     kishon@ti.com
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, khilman@baylibre.com,
        linux-phy@lists.infradead.org, vkoul@kernel.org,
        martin.blumenstingl@googlemail.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 2/3] phy: amlogic: meson8b-usb2: Use dev_err_probe()
Date:   Tue, 11 Jan 2022 10:52:54 +0100
Message-Id: <20220111095255.176141-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111095255.176141-1-aouledameur@baylibre.com>
References: <20220111095255.176141-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the existing dev_err_probe() helper instead of open-coding the same
operation.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
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

