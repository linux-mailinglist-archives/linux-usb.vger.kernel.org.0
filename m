Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C3F2B12FD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 01:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgKMAGS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 19:06:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgKMAGR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 19:06:17 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A283FC0613D4
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 16:06:17 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id j7so7880017wrp.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 16:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SvCqmojrOXPepsO1Q95hNkBgZWVIPjMyxB/8gJJcRy8=;
        b=eRuvBfW/w0YfQpAsNIggfETPocDNMewqXmrdbtLfYLawNTApaaz3vjA7PFcQiYyjG9
         dBaxdtuJUg9MvD94wZ1pZgIO5iK27fR6W3rhtr0P6/If0yO5Ixg++OgCzU1y6YuiIYMb
         RvZT6p6bWEzkirTINIWVSbRKEhpBxs0wCRrXHX+6ENfirp6DHb/QAJGUPG835JL+Hirv
         r9f4IUXkJGDCv0hWhbNA0Pm+27sLmdQZC8z+QFlDozejv74Mg0tbyowPRl9pSAm0ZWhD
         TO/mORp1bpQJuaXWlt1mXhXvDxXodpShZoiDAEIPwxEytiZiaJpyvWvGhxxWN6pxeZM6
         a8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SvCqmojrOXPepsO1Q95hNkBgZWVIPjMyxB/8gJJcRy8=;
        b=so2GHkUq1Ah6H3c4l6AUMfpTpipHpwTAM7/1y5pCdCWEIoxFZFSvWuOYuWhepr4QJH
         J7NSsb5DpB/TBAXj7Kyk0pDhm9ugS4SblPREoQS7iX7wDt7QpE25i+oaNWTwWrKo13ZO
         /pcR67pLtFY6Hk/LLB+JsxQtaC/Uu2tgTSojIWLRVwtGSV+99c2i/NyifkqYwx3KE4yb
         JnpnF1Ul0NcDQKfjNicyVVvomIbF0PIp0Ra3mgBrbV9qEzq9rZEmJE5tHCGSvHX1d7+o
         adSOao8YPUWAYAS6nOpatJuAEsffbCKMVMI4hyL1xckqnJsNv/zCTSoCt3l+cJAINntM
         6Y4A==
X-Gm-Message-State: AOAM533NYlX52aDPJZdT0DLI6RVEKHwyoaPOMOgkv4ynMH81idQTxk9/
        6Gv/Ncb/adOSIXpx47O7kex82Q==
X-Google-Smtp-Source: ABdhPJzAFcpXiDgVQFWzpsy/4A2RLg4B3ufujHE7pwk5uARBCcBmbVQ4mOIR9n0l9zMSEXD2xN1i9g==
X-Received: by 2002:a5d:654c:: with SMTP id z12mr2349004wrv.46.1605225975556;
        Thu, 12 Nov 2020 16:06:15 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
        by smtp.googlemail.com with ESMTPSA id t11sm2010114wrm.8.2020.11.12.16.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 16:06:14 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
Date:   Fri, 13 Nov 2020 01:05:06 +0100
Message-Id: <20201113000508.14702-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201113000508.14702-1-aouledameur@baylibre.com>
References: <20201113000508.14702-1-aouledameur@baylibre.com>
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
Important:
Please DO NOT merge before this patch [0] is merged, it adds 
reset_control_rearm() call to the reset framework API.

[0] https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylib
re.com/

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 43ec9bf24abf..e366c0b1e339 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -114,8 +114,10 @@ static int phy_meson_gxl_usb2_init(struct phy *phy)
 		return ret;
 
 	ret = clk_prepare_enable(priv->clk);
-	if (ret)
+	if (ret) {
+		reset_control_rearm(priv->reset);
 		return ret;
+	}
 
 	return 0;
 }
@@ -124,6 +126,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
 {
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
 
+	reset_control_rearm(priv->reset);
 	clk_disable_unprepare(priv->clk);
 
 	return 0;
-- 
2.17.1

