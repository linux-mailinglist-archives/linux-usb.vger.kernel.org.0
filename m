Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2062632DD
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 18:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730878AbgIIQwh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 12:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730748AbgIIQFE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Sep 2020 12:05:04 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BABF6C0617AA
        for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2020 09:04:21 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so3523675wrl.12
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2020 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=525kvdCFfP6vs4euxtRyN/bmEj6gYMQQf93QffJLH3A=;
        b=tsCjd686H2XcxuZwg50wJa8jxHM60y6x5v+SKzXYwU47orkfCv3NDMlaRM+myScK/D
         XDFtgC4ypLQvlLNbXTeT8OarPbAWxN/0euZR3PpyKHd0xywLRn6tz0j5Rh3ZX57sKbGF
         HgzMW9gUbEZ86wzctxI4pBcFAVz6xqFd4gUDiLB4TPTF/kKYPZtIxCad5cXmlaWQA/Yq
         V8H+hzERhOsIWtH6FXNmv21X5Ish/Y65rmFIbGsWh236ij4dg32oMfp4CgwHJnolWA4r
         sBW4ogBZI6i94fnIRdnpn5Mxt6AoUyk+HAJTpINivcLjM5vPtI4F/Vpin0jNNR0qcZ/D
         kOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=525kvdCFfP6vs4euxtRyN/bmEj6gYMQQf93QffJLH3A=;
        b=MMLRXMypco+sHCXe3iTWHr8OsjcSw9aBN9XoIiXJsJCHGsEskhDBqcPtLF/VDRjmbM
         04lrTgxRj9Hu2qEwiuAu5NBMkTjh1ZHS7nkaaIDDwUKDRf04st1Me25sVUpf3n3EOQZt
         8ztV2s0PYmwrydEHME2m3pFiGsuBuvAEltRym/ay5TQQgRDnD/hhQzEwRYfF/I6XWO9H
         zWIgKO/lSz5h4CMZDKmCsLWpHUXxBhq5l9CJNpxVkIt1EHf2cj8V1Jm04I6XiXXqepeL
         QC2cZ7B8XQG0gRuwS26127ZMNC/12NYHsZlpw7hVPVFlAFVNWFVyO81+DqTp1F3TR5yk
         YOOQ==
X-Gm-Message-State: AOAM530f6C9wzrLS+GD2LJOJBlrNylf8IfYmWFRAbUvkIKyyd0JHbMqp
        oIrkHj54sSWG2OGVgzvC5fADFg==
X-Google-Smtp-Source: ABdhPJxlZaMGy1wnS6RuAf/ra7q+ROMfSMgTlio9QHnRZDZEnBprM5gFMtIESCe2xil5ZgJ01A61eg==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr5019825wru.180.1599667460271;
        Wed, 09 Sep 2020 09:04:20 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
        by smtp.gmail.com with ESMTPSA id y6sm4850700wrn.41.2020.09.09.09.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 09:04:19 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, balbi@kernel.org,
        martin.blumenstingl@googlemail.com
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 3/5] usb: dwc-meson-g12a: Add support for USB on AXG SoCs
Date:   Wed,  9 Sep 2020 18:04:07 +0200
Message-Id: <20200909160409.8678-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200909160409.8678-1-narmstrong@baylibre.com>
References: <20200909160409.8678-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Amlogic AXG is close from the GXL Glue but with a single OTG PHY.

It needs the same init sequence as GXL & GXM, but it seems it doesn't need
the host disconnect bit.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 1f7f4d88ed9d..90275c13c224 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -215,6 +215,19 @@ static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
 	.usb_post_init = dwc3_meson_gxl_usb_post_init,
 };
 
+static struct dwc3_meson_g12a_drvdata axg_drvdata = {
+	.otg_switch_supported = true,
+	.clks = meson_gxl_clocks,
+	.num_clks = ARRAY_SIZE(meson_gxl_clocks),
+	.phy_names = meson_a1_phy_names,
+	.num_phys = ARRAY_SIZE(meson_a1_phy_names),
+	.setup_regmaps = dwc3_meson_gxl_setup_regmaps,
+	.usb2_init_phy = dwc3_meson_gxl_usb2_init_phy,
+	.set_phy_mode = dwc3_meson_gxl_set_phy_mode,
+	.usb_init = dwc3_meson_g12a_usb_init,
+	.usb_post_init = dwc3_meson_gxl_usb_post_init,
+};
+
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
@@ -930,6 +943,10 @@ static const struct of_device_id dwc3_meson_g12a_match[] = {
 		.compatible = "amlogic,meson-gxm-usb-ctrl",
 		.data = &gxm_drvdata,
 	},
+	{
+		.compatible = "amlogic,meson-axg-usb-ctrl",
+		.data = &axg_drvdata,
+	},
 	{
 		.compatible = "amlogic,meson-g12a-usb-ctrl",
 		.data = &g12a_drvdata,
-- 
2.22.0

