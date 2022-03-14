Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D214D8BA1
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 19:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243734AbiCNSVZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 14:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243717AbiCNSVY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 14:21:24 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5915234BB6
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:13 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 31BA440029
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 18:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647282012;
        bh=XM2s1gZCmvaiMC5hvavtavOjROhOMhICf68KJhjCzDk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=KT/uX2sVsPSmI8vEtaWsTohMjRQSYMn2kSUM95g31pB9MVI+l0Te1LXH8Rq7XcVQw
         A3rF0QaSkgo5DkH1ij7nEZCCgFyv0PXmUEdTnH/Y0AksasFnPMQ3C6FtBRF7y6k8uy
         uMbg/McpRn3Wf+q3dv+UJQ9+f0blymVf99TV+rjSVEPKVeaHt8RfTAgAJ0u7abLLlt
         UVpbyVKthfi0rxqs2u+9hfoyR9jaQCpXPSYaWrWe2DozVIO+Wg/qL+4/5vGFyB151b
         j5pslMJTwoQawFw3CNj/EV7diyWPR3PZfhXWH+CYMYClb/11boZbxQaTiroPoOCCJd
         lQEILsrsNjZcw==
Received: by mail-ej1-f72.google.com with SMTP id d7-20020a1709061f4700b006bbf73a7becso8355052ejk.17
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XM2s1gZCmvaiMC5hvavtavOjROhOMhICf68KJhjCzDk=;
        b=KdNYWvmd8vc2FwKyOs7Ix/hWD7PF2nOJJdRdRJpkCbw0NxfH+j4IZR7Nius5N6AA50
         XMO4/yNCh7ION178f5nh+hmb675Gww3vGY7LNsYH64ttRWIYVlFFT7JxP8Ry8UC7SG/0
         /0TGFuP1SGIbyEXvVSxQDkFRCinMJKJemOiEmVhjGy5rXbhoHXMgcmHDYHc5FV0rNZr1
         FZjMRokxmVd83XDrKJg5BJHTZygQCfhUHWuxzc6wcd0ybiqr5avl7Sa64jc4Q1oDUziX
         mBiYxHarVETEfyyjLsWPWRlQA3zle+PVhqAzM2GgRUpdUoAD5Ph0YuuPttYOgmOgdcpB
         90BA==
X-Gm-Message-State: AOAM531SyESFM7RtCog1NyzsqAlvnd/ZLSA2XQG0d3TEHATabuf6kdJp
        rXd5d/V/g9hLlJcx1oIjpn3+rz5jZVMRXZTbuWztpwzw4gYNSjmvvY86vt9X9FhUliM8cF2f4lc
        XxNRnaMiPMg0M5j89el3exClkkJPCquwMznbeRw==
X-Received: by 2002:a17:906:a08b:b0:6b9:2e20:f139 with SMTP id q11-20020a170906a08b00b006b92e20f139mr20617749ejy.463.1647282011625;
        Mon, 14 Mar 2022 11:20:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5tg2FLtKp4Xqd7L0LVthZGXx0d5/uGsjTyL2DgIGrjaZnaYsMA1POfB2dWcScokMBvI7Axw==
X-Received: by 2002:a17:906:a08b:b0:6b9:2e20:f139 with SMTP id q11-20020a170906a08b00b006b92e20f139mr20617734ejy.463.1647282011472;
        Mon, 14 Mar 2022 11:20:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i25-20020a50fd19000000b0041614eca4d1sm8566449eds.12.2022.03.14.11.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:20:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/5] ARM: dts: s5pv210: align EHCI/OHCI nodes with dtschema
Date:   Mon, 14 Mar 2022 19:19:45 +0100
Message-Id: <20220314181948.246434-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
References: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
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
 arch/arm/boot/dts/s5pv210.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 353ba7b09a0c..a7aca54832d9 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -427,7 +427,7 @@ usbphy: usbphy@ec100000 {
 			status = "disabled";
 		};
 
-		ehci: ehci@ec200000 {
+		ehci: usb@ec200000 {
 			compatible = "samsung,exynos4210-ehci";
 			reg = <0xec200000 0x100>;
 			interrupts = <23>;
@@ -444,7 +444,7 @@ port@0 {
 			};
 		};
 
-		ohci: ohci@ec300000 {
+		ohci: usb@ec300000 {
 			compatible = "samsung,exynos4210-ohci";
 			reg = <0xec300000 0x100>;
 			interrupts = <23>;
-- 
2.32.0

