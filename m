Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13263471CEC
	for <lists+linux-usb@lfdr.de>; Sun, 12 Dec 2021 21:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhLLUT5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Dec 2021 15:19:57 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:46663 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbhLLUTx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Dec 2021 15:19:53 -0500
Received: by mail-wr1-f49.google.com with SMTP id u1so23774055wru.13
        for <linux-usb@vger.kernel.org>; Sun, 12 Dec 2021 12:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DEqcYQHdC1ee15LjGbKeJnBTc82RghuCYEwGrhqwf58=;
        b=6QCZInTlhtGHs38K6PWllebPY8PZ+XsQY7+py5EcxK/xQEWqo2ZYxwOMD1TGr7kglD
         Wt/Ncm7hC9ZiYci4RWw/ubJhzWkzrFZd3HEwq7xF0LOLLJ2CXHmB1xmTVYN4cdEMfdBi
         lo6KEWy8FCtr3vgpXkTF3zx4hgEBZpnQny//4xw/HEf5C6k653SPMPPqjRSJby0LwOZ7
         oCyJxOaCy9IiFeKR68HBGnf7vx+ViNCe0U7TD/LpXfRNx02cfKrN8/0T/Z42mWX/q9G9
         TLa8lon0OVJUJnuaKqVr+deYpHj35k8GdoafyjFs/Exf2notApgT2P0/MEPy0+amvdUc
         aLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DEqcYQHdC1ee15LjGbKeJnBTc82RghuCYEwGrhqwf58=;
        b=nLJpC97z/uyCsZIt0SM5uqZfUtr2HpQvNmSIB5TqBmIETmruSlZlsaRROzC3Txfv/h
         bYUrEptAYvegHy7CFg0xe4W8iJKoQPdbRK9H8+mOWa1XyfexfAp0sfprgMUO4sRMGEP9
         Ezwv2hKRGngDQuWJkNvhdPX8VK9cPZARt4SJklzLUn/6o/ry2ls3ra83LNuB00vnlXqr
         H4XmTy9zBYxDsMdO8u0KgfewwH7kOqJNjveSxlR7Mlx/yOcQ2TdcIcRmxy9BGMjsEjas
         i++oIe3YyGxpPQHMrDjy81Pqk+qpnEcp73PALCqaJaFQHmI1TNDaXT+KpF7TVuj4z18B
         MeKA==
X-Gm-Message-State: AOAM5303yF71kuoSfm/rk0pQeKZlGMjl7GhfNcGwAJoMTxb3bmaHTQcl
        31taM6Jg1DaAzpiYjeCftifHPg==
X-Google-Smtp-Source: ABdhPJzStHaYQvzjekJD0BKEjsvQ9ILU/QVO4EtStIMs6xGVZ5obEqnflRGFG/O+HRqSNlE3tT/vzw==
X-Received: by 2002:adf:a389:: with SMTP id l9mr27656312wrb.121.1639340332397;
        Sun, 12 Dec 2021 12:18:52 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.googlemail.com with ESMTPSA id p5sm9092710wrd.13.2021.12.12.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 12:18:52 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     khilman@baylibre.com
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v5 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
Date:   Sun, 12 Dec 2021 21:18:42 +0100
Message-Id: <20211212201844.114949-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211212201844.114949-1-aouledameur@baylibre.com>
References: <20211212201844.114949-1-aouledameur@baylibre.com>
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
changes since v4:
- Call reset_control_rearm() after clk_prepare_enable() fails

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 2b3c0d730f20..db17c3448bfe 100644
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
@@ -125,6 +127,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
 
 	clk_disable_unprepare(priv->clk);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
-- 
2.25.1

