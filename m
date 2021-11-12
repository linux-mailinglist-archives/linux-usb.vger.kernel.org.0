Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54BD44EB71
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 17:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235457AbhKLQfu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 11:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235451AbhKLQfr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 11:35:47 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041C5C06127A
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 08:32:56 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t30so16463204wra.10
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 08:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EOnn36aeo16MhozSZgWuY/58jgLwvjCwwFTIYXWx3ds=;
        b=sakY2AHeEjqZFhuR1Qn7v0LUV+9sK+o5s4j6b15GXchii6gy/AmyjpFjM40oBvSa3W
         dG+l2iBOaCAbDXtharwfe9FlF4nu/LSUScGWTe0vFxBLbwxzMg68XdMZggC9DF8s5IjW
         XCZz2dWhRLXl9+SLbDlwKRpWYvMEUEykj8KUL6apBshn3V44q7ULfumIdqUpWrl7u+XL
         5amiri8sTYxGU4ASbEX5INr66OqInuAjYf0HwBMia/pRg9xQIr5gs//5Fa+n/QOjWRGi
         ch2+fFtQDW7R8J4A3KWdI1Y0MwS1JJaPVO48uJIVIg7VJq9eu939Z5RtJZmSxo/Xd5SN
         6QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EOnn36aeo16MhozSZgWuY/58jgLwvjCwwFTIYXWx3ds=;
        b=uTDnrPmZEEw2uCbUNCQAPnk5vKABq4Sj8EcYgomv51GYn0x/mQmTCVfBwhg3LIC703
         m4q+SrNdqHNOkMmo9jWZx8s8+pX2WrvPpRmT0D7NET9rcwnyvG5ejI6Mtuzers5Fbu9O
         hNxYul0fARi+gJH5A/9Q/CFjv1px5bl/V9PTAf5U7OZsH7v2IzU+tggLKJjUFh8gQHoB
         dVm6LXp8tThYjdI8XbbGoYxoaqbMcvlVgm8CNhWAjX7inewDz8V6wwvEbZ9PJh9ZBvLm
         aqpdIOSy9oYHa6I5IZi6VRTk1KB1zYjfCfbs/jgHiMj0gnn7U9vumCd0uwh0T9NKa9nb
         XNNQ==
X-Gm-Message-State: AOAM531otXDXB5JRnmNtY8qehAH6znj0DkF5+w10IAIwnqdG6w3L93QV
        S6uQ2OI0hdd2X42Kh4n99s5JSA==
X-Google-Smtp-Source: ABdhPJy3+UcYNBPyR34uuOLhM47GlKeQga5JGMrsFqE+xFIEv4G0dGAs8SpT0A2/2FT6JivlJG7PSw==
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr20154451wrw.78.1636734774629;
        Fri, 12 Nov 2021 08:32:54 -0800 (PST)
Received: from amjad.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id h15sm6253796wml.9.2021.11.12.08.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 08:32:54 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     khilman@baylibre.com
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v3 3/3] phy: amlogic: meson8b-usb2: fix shared reset control use
Date:   Fri, 12 Nov 2021 17:28:27 +0100
Message-Id: <20211112162827.128319-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112162827.128319-1-aouledameur@baylibre.com>
References: <20211112162827.128319-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use reset_control_rearm() call if an error occurs in case
phy_meson8b_usb2_power_on() fails after reset() has been called, or in
case phy_meson8b_usb2_power_off() is called i.e the resource is no longer
used and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework, use of reset_control_reset() on shared reset line should
be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index cf10bed40528..a6e74288ca8f 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -154,6 +154,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	ret = clk_prepare_enable(priv->clk_usb_general);
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB general clock\n");
+		reset_control_rearm(priv->reset);
 		return ret;
 	}
 
@@ -161,6 +162,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB DDR clock\n");
 		clk_disable_unprepare(priv->clk_usb_general);
+		reset_control_rearm(priv->reset);
 		return ret;
 	}
 
@@ -199,6 +201,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 				dev_warn(&phy->dev, "USB ID detect failed!\n");
 				clk_disable_unprepare(priv->clk_usb);
 				clk_disable_unprepare(priv->clk_usb_general);
+				reset_control_rearm(priv->reset);
 				return -EINVAL;
 			}
 		}
@@ -218,6 +221,7 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
+	reset_control_rearm(priv->reset);
 
 	/* power off the PHY by putting it into reset mode */
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-- 
2.25.1

