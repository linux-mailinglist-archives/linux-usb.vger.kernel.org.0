Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BC52CAB50
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 20:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392325AbgLATCY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 14:02:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392316AbgLATCY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 14:02:24 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDE5C061A49
        for <linux-usb@vger.kernel.org>; Tue,  1 Dec 2020 11:01:30 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id t4so4324673wrr.12
        for <linux-usb@vger.kernel.org>; Tue, 01 Dec 2020 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4db92qgs7Cx19eXkYKoRrrPswVYgwmdMYfhe9hzWuuk=;
        b=EstpTfjBIGANDhV6j9xxplY0OMuMT3mXYXjXGWEmMkfck633Rx5GNrZCx+qvmEMTk+
         30qwQ2p/RMkaS/35v8gblXZPQ5pjuuuXUIHRjbcb/r9Lca2TSWINH0LzI3+v9pUWInbl
         CElsK8saKw913EWsTswc0UYIplLU1szE+p828DOBNswnjYIANOCm/BvG68L4F1O+we93
         X7dAM1fkwe+svPyP9YY6x7ADIGtkL69IQ/GPwVjDdfEtqbl4TT7hnrslBLdpo+TKRQfs
         2GYQE5TPX9j//2LJPbJxHR2IZ+EXn7+czPTTXYag0QyvyZSBDHHjtfEtv/BYbHQSDs01
         fT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4db92qgs7Cx19eXkYKoRrrPswVYgwmdMYfhe9hzWuuk=;
        b=Zp2WStyNj9OLpTh6/T5PIeA0VunxEPwYUzfcvPhPjJyGzv1sNWs7eMitReMT5x0+Jb
         yRJ17/0lQ/w7q4DaE0aiLwHhDoiTbyyVwO8Ksd0SUrZxO/CXBBCohNBHHLqFk4/MeGHu
         mGdWwkZ2IT1po65kxCp9yRwgS/Wp4hkWicXUau5KnNb8Cz5Nw6w8yGd1f9fipig5kcTy
         zRTzNgTq/vaI8TgfQw8ILGeN80qOCrqTBNW2Pt7hu3LS9Z1aAM3vu+dqMmWfg2Ly0vFL
         N75ZJodW3H8x5MvCIvOTRpNSS70LJ/68J4HXHw3DfbtOoTVoc/LEC4KXw5fWdPcFqt7r
         fMkw==
X-Gm-Message-State: AOAM533u6R1cKDnwshGx2iVTO59Y/g9kTnQEJ39xLqt7u4R0fsKXflCP
        talvOHGC/8cBWvtXj2fE8Qk42Q==
X-Google-Smtp-Source: ABdhPJwIXyPn73uqnfcK1Vyo37ATQR99pYmv4e0H6SMMvE1rbDlHUqqJvBW5/a62nbSNYjYvmSUivg==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr5761412wrw.221.1606849288897;
        Tue, 01 Dec 2020 11:01:28 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:40a4:a590:1da6:9599])
        by smtp.googlemail.com with ESMTPSA id 138sm887733wma.41.2020.12.01.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 11:01:28 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 3/3] phy: amlogic: meson8b-usb2: fix shared reset control use
Date:   Tue,  1 Dec 2020 20:01:00 +0100
Message-Id: <20201201190100.17831-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201190100.17831-1-aouledameur@baylibre.com>
References: <20201201190100.17831-1-aouledameur@baylibre.com>
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
changes since v1: [1]
* Moved reset_control_rearm after clk_disable_unprepare to clean things up
in reverse order of initialization for phy: amlogic: meson drivers

IMPORTANT:
This patchset depends on this patch [2], it adds reset_control_rearm() call
to the reset framework API, it has been approved by the maintainer, and
will be applied to reset/next

There is currently an immutable branch with it [3]

[1]: https://lore.kernel.org/lkml/20201113000508.14702-1-aouledameur@baylibre.com/
[2]: https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylibre.com/
[3]: git://git.pengutronix.de/git/pza/linux.git reset/shared-retrigger

 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 03c061dd5f0d..651eec41a896 100644
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
 
 	return 0;
 }
-- 
2.17.1

