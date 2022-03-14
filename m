Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3400B4D8B9E
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 19:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239145AbiCNSVX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 14:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243717AbiCNSVW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 14:21:22 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B4E34BB7
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:11 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8F86740026
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647282010;
        bh=U8OU69oA8CY5cA8ZS5yQs0dGgRqDiUpqozJ7NxlASIk=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=b2NvLmlZ0LfX8sNcJUapJJWj1z7h6pw3iLWcqKk7ARfy4/ZovpR79m4prxfvvyB77
         HlM7o5Vo4EcvfSBL7dIwEl58fXMAGoo68VejJGUmv0gQbbwhJxOvqhPYFKk4SKtGPW
         JEEWZvf+ten4Ns6uTbK9+mdx10bUsmAMU5wQP42UWhswuE8OsUXoxpyIQTQuRlhhC+
         zqXIEYZ/bXIpykw4WgOP+xryIaadwFvrxNDSNbxaGdvItlnuzCaOO/QTtN/qowOU03
         cJwnkF5YQN7tu8sD1oos21C5bil6IQsyZycp/Ys+aIh0btBBnfEfjnbq0BeERYfRKw
         iQlsOQ6qW1ewA==
Received: by mail-ej1-f72.google.com with SMTP id k16-20020a17090632d000b006ae1cdb0f07so8365126ejk.16
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U8OU69oA8CY5cA8ZS5yQs0dGgRqDiUpqozJ7NxlASIk=;
        b=w4x9yzS4bh+XvGwcTPvGLWiBajNGMlppSFk186PxyL80L7l39uFS2uWaM+gWjod/g3
         oF/1/4jeN+X36S5pvbzF3t/77zTa8zY6TbWv/wI4qZg0qJc7Hf2uvlcepEkb58aWRQFg
         dKurwlK6eSpW0B4bZw7ZuWF17EyzNDUslmHEnVmyDm9okpGdntI21M8iOutP/xDID2pN
         S6lYZTWZk8XFOdfHTjsN2h6tlibloVQMEIJqquVPDWn8uPY5xJvbV3YXh55PcEzNcx5c
         sfCCGEeL2jMt2o5bQsZ4/VkKBpI+PTHMgc1uAzCgN4t+urdjIKSISkBKySoIze6RuiRf
         52+w==
X-Gm-Message-State: AOAM533RqZ6bjb80FGwvAQabZZuRK9tC1h3fHIvzY8s8oVw7HZnpgMit
        ayyxPcT8MzLC4JrglqFoRFCHhIHMOOTzAGwH+7jV3emvqQSMC9KMFuPKYZttYJ4qos8wbd4ieza
        mGp+FUvmCscTk77qY+KR2UuL+vLZiI6gqEQH38Q==
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id q7-20020a1709064cc700b006d07efb049fmr19162184ejt.639.1647282009783;
        Mon, 14 Mar 2022 11:20:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykfuiix6CGfcuVN3LbtcoNjfp49yxsV/G1SXPbVJxr5AUlGKmZWMubD6N2B5kngeBfouUT/A==
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id q7-20020a1709064cc700b006d07efb049fmr19162170ejt.639.1647282009622;
        Mon, 14 Mar 2022 11:20:09 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i25-20020a50fd19000000b0041614eca4d1sm8566449eds.12.2022.03.14.11.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:20:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/5] ARM: dts: exynos: align EHCI/OHCI nodes with dtschema on Exynos4
Date:   Mon, 14 Mar 2022 19:19:44 +0100
Message-Id: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The node names should be generic and USB DT schema expects "usb" names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e81b3ee4e0f7..5fd17bc52321 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -373,7 +373,7 @@ hsotg: hsotg@12480000 {
 			status = "disabled";
 		};
 
-		ehci: ehci@12580000 {
+		ehci: usb@12580000 {
 			compatible = "samsung,exynos4210-ehci";
 			reg = <0x12580000 0x100>;
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
@@ -384,7 +384,7 @@ ehci: ehci@12580000 {
 			phy-names = "host", "hsic0", "hsic1";
 		};
 
-		ohci: ohci@12590000 {
+		ohci: usb@12590000 {
 			compatible = "samsung,exynos4210-ohci";
 			reg = <0x12590000 0x100>;
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.32.0

