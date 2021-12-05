Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD659468D87
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 22:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239600AbhLEWCa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 17:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239546AbhLEWC1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 17:02:27 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AECC061751
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 13:59:00 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id e3so35205619edu.4
        for <linux-usb@vger.kernel.org>; Sun, 05 Dec 2021 13:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3AnWy+mVImsPoWfiIuMG6Au3yFCtHwQVYr21g6LIJdc=;
        b=2vQAzbnneWi/dJ7qVHsqvynEsRlHsmojxV6FboORhzrOWZLH+vfu4GDPLq1cbeBaVN
         597eGNxXtDjhk4Go6uu35rJg5WRDQwGQJQbn4h6N2bJ64tjkcpp1e09jsEm0FEyOIyNQ
         1xW1Rrehd1HzLpvaOUTd08Xpbvp+GlGjgL8/kjWQerOUPd4HLoTaEdRvLlLXZronEowZ
         h5qDzo9PttQPpVBsbdby6OTY5KsF4nzqx6DFD0nnkHa1d09Qc/euvYym+lqZ3yfQenhp
         p3gjQ8BMJztow6DjkQgwaRtyl699HwZt07eOTSecxJkC2OeinP6hiwTEDHnQTVB8LaIa
         3izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3AnWy+mVImsPoWfiIuMG6Au3yFCtHwQVYr21g6LIJdc=;
        b=E+h491wmnO6lgV7oxUo3eJNuYpwY7jhW0XLXpNQ1idzI/3xoQz2eJY2DAxT1WRSLM3
         iugeIzNTbZ8+JeR9pXHUwY7zGXCCyvWeXxD0O+gvykkII5edwfm4n3SdamAztC2x4YPX
         1d6BAyb/yXxjmrZpQKZ96nkhmxc2qjS6+EFrRT5GivP7Thso/2Wqq/pQ9AB6zHTvxciV
         1xbsQNnpqzn3R8+YAOVWNz5YwP6Df6RmBtOI1LwJzmup/6+fRSVDZkM0sWX1ERga/QPE
         FGeZNNr71UpxA81Aq0+lCZd/F8IF1HAQqjyU0DFDHXTkCZUFrFkT/y05Inb5HLKtGtr6
         JCcQ==
X-Gm-Message-State: AOAM530sJSVsWz12UaryRUVvtS1CQr8w7+zoXNnkj7p0+bK6GZVy5eMb
        f6ZxZ/w9ReBCIf6vOgfLiZlhGQ==
X-Google-Smtp-Source: ABdhPJyrdhlAej+Y0j7bVwl22/TJv/4bsr28Ql2eGHPiPqD/W7PyF7tQAjNVsjJ+K+DEkbjNOQWvVA==
X-Received: by 2002:a17:906:dbef:: with SMTP id yd15mr39336054ejb.354.1638741538543;
        Sun, 05 Dec 2021 13:58:58 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.googlemail.com with ESMTPSA id nc29sm5724291ejc.3.2021.12.05.13.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 13:58:58 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     khilman@baylibre.com
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v4 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
Date:   Sun,  5 Dec 2021 22:58:44 +0100
Message-Id: <20211205215846.153703-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205215846.153703-1-aouledameur@baylibre.com>
References: <20211205215846.153703-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use reset_control_rearm() call if an error occurs in case
phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework. Therefore, use of reset_control_reset() on shared reset line
should be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
changes since v3:
- Remove unnecessary reset_control_rearm() after reset_control_reset()
failure.

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 2b3c0d730f20..d2f56075dc57 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -125,6 +125,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
 
 	clk_disable_unprepare(priv->clk);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
-- 
2.25.1

