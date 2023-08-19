Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3631678170C
	for <lists+linux-usb@lfdr.de>; Sat, 19 Aug 2023 05:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244973AbjHSDSB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Aug 2023 23:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244785AbjHSDRj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Aug 2023 23:17:39 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4AD4223
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 20:17:37 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-56cc461f34fso1007719eaf.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 20:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692415057; x=1693019857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wz7l2Nt7KOsakojMIBUT2YVYRMmwVU4JH/swQRaBmqA=;
        b=mYshb+Rn/3oQMH2VIbVz1A52sXeo6UhZTI9Ci68KggWZXvpTtBDlTcTm0Zb9Rdi61i
         sypgYsqCKqH901t+31x5FGrwLfNby8AhYS9U98qv78Dan/4Px+cVwfmWj1wl0rVRaKsY
         B83noMDKu+V2FpxP4eAcvyy3CkP/cExFyRgtoMjIgPFXEsNS6pNgVITs942I980UNXU3
         v/cX9Fiwp1lRO6TmBHY4HVGMDf5j2a34VRDIZwOZXiGGdqrhxgs57zJTwaBdVotwJTAp
         WA53bknQp1yVohelRcUMrcmAE9Ys5San+fs+rdiVmiR8XQHuUzBpY6yBZr1CtwjSYNN2
         HWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692415057; x=1693019857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wz7l2Nt7KOsakojMIBUT2YVYRMmwVU4JH/swQRaBmqA=;
        b=aLxrMhBCDD3aoacrNik2RmZbimPn2BaAD/N2Yaz+zwfxB7CHROzHxmPcYM2iaYmshR
         Z5TpyULGtkRHEVYxmzEjHr0ApIdaC6texHQh5Mgg4JTuV76r2uuuSU9HhD9vIGL4TOXU
         Q9rt9gWvQI0gpNdh/Z93AhNnOqn98sWZodILxZWChtPb974QCJehX9BB9qPj/AauqP92
         lrGxqs7SUKAbdNrCShNDrLGBYToIYgQAJUQJ0MgKGTi/CouxnzpIGZye6s70Vs+B3jQP
         BgnShAl5QTPAya2kI8COoIaiN8DdrfegrXH3Jrtrx6+jI6YuONi1CXEaFGhU0UJI1xst
         ggfw==
X-Gm-Message-State: AOJu0Yw2p4+y9gkQZBrPKwmpQkSWNzuZ+Nw/Z97+rvluJOhgJXd96PKO
        K6sQpkfZ7Hs3MdYWLFbrmIbebg==
X-Google-Smtp-Source: AGHT+IEHWIhbOpE4bIXnVimEwmLiWUBgqMQ3a5vV0u2jZL1ABZYcOvaZH4EGTDEVIcZmmf2p8BUZqw==
X-Received: by 2002:a4a:9c5a:0:b0:566:f763:8fb7 with SMTP id c26-20020a4a9c5a000000b00566f7638fb7mr1434181ook.2.1692415057099;
        Fri, 18 Aug 2023 20:17:37 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id p127-20020a4a4885000000b00569c5eadf15sm1505569ooa.26.2023.08.18.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 20:17:36 -0700 (PDT)
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
Subject: [PATCH 5/8] phy: exynos5-usbdrd: Add 26MHz ref clk support
Date:   Fri, 18 Aug 2023 22:17:28 -0500
Message-Id: <20230819031731.22618-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230819031731.22618-1-semen.protsenko@linaro.org>
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Modern Exynos chips (like Exynos850) might have 26 MHz OSCCLK external
clock, which is also used as a PHY reference clock. For some USB PHY
controllers (e.g USB DRD PHY block on Exynos850) there is no need to set
the refclk frequency at all (and corresponding bits in CLKRSTCTRL[7:5]
are marked RESERVED), so that value won't be set in the driver. But
even in that case, 26 MHz support still has to be added, otherwise
exynos5_rate_to_clk() fails, which leads in turn to probe error.

Add the correct value for 26MHz refclk to make it possible to add
support for new Exynos USB DRD PHY controllers.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 1ece4a1a1a6e..41508db87b9b 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -30,6 +30,7 @@
 #define EXYNOS5_FSEL_19MHZ2		0x3
 #define EXYNOS5_FSEL_20MHZ		0x4
 #define EXYNOS5_FSEL_24MHZ		0x5
+#define EXYNOS5_FSEL_26MHZ		0x82
 #define EXYNOS5_FSEL_50MHZ		0x7
 
 /* Exynos5: USB 3.0 DRD PHY registers */
@@ -244,6 +245,9 @@ static unsigned int exynos5_rate_to_clk(unsigned long rate, u32 *reg)
 	case 24 * MHZ:
 		*reg = EXYNOS5_FSEL_24MHZ;
 		break;
+	case 26 * MHZ:
+		*reg = EXYNOS5_FSEL_26MHZ;
+		break;
 	case 50 * MHZ:
 		*reg = EXYNOS5_FSEL_50MHZ;
 		break;
-- 
2.39.2

