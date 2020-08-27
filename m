Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70505254755
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 16:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgH0Osl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 10:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgH0Os3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 10:48:29 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72880C061232
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 07:48:28 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a65so5426332wme.5
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=US0rKLWi0Ij67svDuIlZzqQZrRksxzdQhyeGx2i0lHA=;
        b=S4pcjGYXLbtMtCdpP90WCSGT29fBBzW7vj9f/R0GaIuYOTidERM3wLubMrY4hB2pbg
         blCZiFzfpu7LOlZm6YLit8h2vBenAXIDzbDKpM1nyGz68tCsEf6aFR2LSVWXDA7UQFCi
         WdYhRjw+1HzPQng1fIkDEVMVYcChzzL2se2+/0o39WTH6pL6dzkjK9YOX3zfOt59Hpov
         GFIB09ihBviRr0RBGQ/59DE1I0zW9GY3AXKRJmmsRdkAzy83fGSOOEGX4+VsQReIfA77
         o1ay6NYxCmZ3A6ZpgyPhpvuXQanBmWwCd5U0T9nIpgxp/O7eFuV6j2CmKkNpXrP58sHC
         l3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=US0rKLWi0Ij67svDuIlZzqQZrRksxzdQhyeGx2i0lHA=;
        b=J9xwYFnLXF0rx+kbiawvz5FXpJpCQqrqjjxDMds4wmnR8E8l/NPxW0WzMNZdA9eLqn
         YB4Z7I+FretrO8EBBFOjgE86Ejw65m3q8H+yW2rQzDb10vKU0YgdsHTYfhfkFOZihgMK
         bI3Av3kEsl/tzE+VSXWRXtg6rA6Z5lCiAQtrmC9o3a6/KS3JjYPOJSn6TZNWjg8Wi7E4
         Xiczm6Emsj1pOsMN4e8yic7FGlHcpveVCJ9u2LCbZMtGu8npaZxxUR7eWuHfBw8mkr/I
         4raR7Z72m2GRqxznP4z7enzuDyrWL+fPCEbhIwjX91XLFr6c+3wKNW0SL5h4VFW1OCii
         dSKA==
X-Gm-Message-State: AOAM530YeQ8gelVVGpChx7yFdobqzXrM4K/fpaBDUTwypEVEPqeHEdeG
        dThPRBYFv7XIFJTnmLW3bVS08A==
X-Google-Smtp-Source: ABdhPJz1h5Fc45F5daqe66MhiGIVffd268qdCjCnPYhDLTXCqIsKqtcM61Fi0N5Ml5xq7+km3yCXYw==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr10242160wmc.122.1598539707094;
        Thu, 27 Aug 2020 07:48:27 -0700 (PDT)
Received: from amjad-ThinkPad-T490.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id 33sm6756659wri.16.2020.08.27.07.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:48:26 -0700 (PDT)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Dan Robertson <dan@dlrobertson.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "usb: dwc3: meson-g12a: fix shared reset control use"
Date:   Thu, 27 Aug 2020 16:48:10 +0200
Message-Id: <20200827144810.26657-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 7a410953d1fb4dbe91ffcfdee9cbbf889d19b0d7.

This commit breaks USB on meson-gxl-s905x-libretech-cc. Reverting
the change solves the issue.

In fact, according to the reset framework code, consumers must not use
reset_control_(de)assert() on shared reset lines when reset_control_reset
has been used, and vice-versa.

Moreover, with this commit, usb is not guaranted to be reset since the
reset is likely to be initially deasserted.

Reverting the commit will bring back the suspend warning mentioned in the
commit description. Nevertheless, a warning is much less critical than
breaking dwc3-meson-g12a USB completely. We will address the warning
issue in another way as a 2nd step.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 88b75b5a039c..1f7f4d88ed9d 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 		goto err_disable_clks;
 	}
 
-	ret = reset_control_deassert(priv->reset);
+	ret = reset_control_reset(priv->reset);
 	if (ret)
-		goto err_assert_reset;
+		goto err_disable_clks;
 
 	ret = dwc3_meson_g12a_get_phys(priv);
 	if (ret)
-		goto err_assert_reset;
+		goto err_disable_clks;
 
 	ret = priv->drvdata->setup_regmaps(priv, base);
 	if (ret)
@@ -752,7 +752,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	if (priv->vbus) {
 		ret = regulator_enable(priv->vbus);
 		if (ret)
-			goto err_assert_reset;
+			goto err_disable_clks;
 	}
 
 	/* Get dr_mode */
@@ -765,13 +765,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = priv->drvdata->usb_init(priv);
 	if (ret)
-		goto err_assert_reset;
+		goto err_disable_clks;
 
 	/* Init PHYs */
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
 		ret = phy_init(priv->phys[i]);
 		if (ret)
-			goto err_assert_reset;
+			goto err_disable_clks;
 	}
 
 	/* Set PHY Power */
@@ -809,9 +809,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	for (i = 0 ; i < PHY_COUNT ; ++i)
 		phy_exit(priv->phys[i]);
 
-err_assert_reset:
-	reset_control_assert(priv->reset);
-
 err_disable_clks:
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);
-- 
2.17.1

