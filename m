Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B864781712
	for <lists+linux-usb@lfdr.de>; Sat, 19 Aug 2023 05:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244808AbjHSDR7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Aug 2023 23:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244721AbjHSDRh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Aug 2023 23:17:37 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F744421D
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 20:17:36 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1c26bb27feeso984895fac.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 20:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692415055; x=1693019855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pE2SxwAc9ssHdvgA5CR8AU2aj+QN0B7Vb8/YfT44UQo=;
        b=wsZmh2lRuqo61LoKoXTbKZ4QPkX36QOioP1vC2ZE6A2GkvQOkE9QKAmDc+wmhOFk+V
         HxA8VFlS4bx5n/XsDD65Y+S6aUjQQX/oHxdfA/lGf8MHKZ0NiExp20GUcm9ZqO6BR/2k
         TNiTqpf+U4NQdouPRCpwnbVUlEgxpxmsfakT9aN8MGnJDqF7maaammaf/vJEn8iAnqCk
         o8zb+qN3XM2+3XaCYY/ZNGh8pwN75gB18CXykNsVfrj8uBUuf2qlSy6VP3aCGdmbw27a
         qki58sjVqAmhdaNmOQQrjxdcwr+P+TKsP7vvtgnk7No3G8wSObYBffos5iJrQn3tNskm
         2Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692415055; x=1693019855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pE2SxwAc9ssHdvgA5CR8AU2aj+QN0B7Vb8/YfT44UQo=;
        b=ffqqiHnDTWJj2tAmDEfWOHr3CvegH1sDbqjS2A5ZoujIclJx4aNcyp9AblOq7TY9dS
         tUJrLFH+R0+Y/EL37Xm+ZF7dRAZjRoAjWhnbQEDxy69nXowAlA6fFKvOyvGzZrX3/5EA
         0sesvNFA1bqzVTxo/8Dhv0Npi2hvABogltPCSQM5MpJU8KJwKBNoX9d9z70E2nzv6VSL
         bWLT9QBbHhyfPPt2r4hqU01uY66v86q0aUvX/f3XKElIRyS9hNMSFzswr9632aFGZYXh
         lbgu2Ty5zxkPSQrlEx+9qUgB2rjwBHLcAwg2HxMXAQYCYye09JAjAqF4axff2g7WUc+j
         p7cQ==
X-Gm-Message-State: AOJu0Yym3bMAbwcJUalroQfmi2fashEYgTRH/mNi59MeIbPeg+m538in
        IZN9wWeDo1hnrKUsckvlj9QnXQ==
X-Google-Smtp-Source: AGHT+IGwN20mZxiyx0bg2sXc9CDI9nvRQ0khtew3DAEDJbK4jTTSyqkBbLjLhbnjlq8G3ilSFSFg8g==
X-Received: by 2002:a05:6870:e38e:b0:1c8:c27f:7d9b with SMTP id x14-20020a056870e38e00b001c8c27f7d9bmr1474715oad.27.1692415055429;
        Fri, 18 Aug 2023 20:17:35 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id gq20-20020a056870d91400b001c5a3e31474sm1711347oab.45.2023.08.18.20.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 20:17:35 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/8] usb: dwc3: exynos: Add support for Exynos850 variant
Date:   Fri, 18 Aug 2023 22:17:26 -0500
Message-Id: <20230819031731.22618-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230819031731.22618-1-semen.protsenko@linaro.org>
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add Exynos850 compatible string and associated driver data. Only two
clocks are needed for this SoC:
  - bus_early: bus clock needed for registers access
  - ref: USB 2.0 DRD reference clock (50 MHz)

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f882dd647340..5d365ca51771 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -163,6 +163,12 @@ static const struct dwc3_exynos_driverdata exynos7_drvdata = {
 	.suspend_clk_idx = 1,
 };
 
+static const struct dwc3_exynos_driverdata exynos850_drvdata = {
+	.clk_names = { "bus_early", "ref" },
+	.num_clks = 2,
+	.suspend_clk_idx = -1,
+};
+
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
 		.compatible = "samsung,exynos5250-dwusb3",
@@ -173,6 +179,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-dwusb3",
 		.data = &exynos7_drvdata,
+	}, {
+		.compatible = "samsung,exynos850-dwusb3",
+		.data = &exynos850_drvdata,
 	}, {
 	}
 };
-- 
2.39.2

