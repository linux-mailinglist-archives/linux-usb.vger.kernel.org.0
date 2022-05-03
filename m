Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBD52517DD2
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 08:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbiECG4w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 02:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbiECG43 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 02:56:29 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265051A81C
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 23:52:14 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id m20so31611579ejj.10
        for <linux-usb@vger.kernel.org>; Mon, 02 May 2022 23:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZIGxwKJ/Xe8wH7s0ybpa7g9C2aeLAWID2un0fZf5uMo=;
        b=qj15gElKMaakF51ZR6R/CMfWiS7bMRdDHn53Xm88wnJrmDD++GYBIPmydqnNRA5sD5
         6+q6gyCxnIfGShTyNjNrNj5Ds8tSDvl1G7xzFO8Sa9NeFCavVvpy1806aXw2URxPPB61
         EHJ4V0FdhSvjd2FnxDJ9ogUmjEcnBE23UEoq8IM34cNjyuZ9xu2DjapPKyfEgCiZwqqh
         PvpBCdJmD8sYo8DFsFXoh/T0/buwS41KxpGKKSlow6gzLIOizZUa14Vd/YJXk+qzdxgB
         E3MC/F13GmWYzBtkP+mDt13rlyMnx/QUtrOlg86EOuYEEme2flVtNf20kKYomzlh3XbY
         HROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZIGxwKJ/Xe8wH7s0ybpa7g9C2aeLAWID2un0fZf5uMo=;
        b=Bo3WPV99pMANmNyhGINQ5bNy4xdOxZLbYfjlloCnwDmQRqzN19pVwXm6PVp8nXxKL9
         uxhwnBsIhFniECy6As8vRqVI485WxGhO95MwKQuT2fJL7Nf5QfUL3SM8H802+oKDUhp8
         qKDisibnAR1RSXIZu5KavGt7l2PA+1iG/B7EXPUFrwpwEpKkmxFsmU3gVHDCqETL0k2m
         GZcJ4Scn/Ox/146GB7sUUSKgqXb5FZdDwAc0KfDrLu1ryPNfvVka3oFI7zFCbY+wc0/A
         UdBAwpaQQ8TnWdEw6UKRIHcN7d4QAvHGNo3oucX4lHx0Veu/s5XwSdT7z+TmFyZPliLg
         dcNQ==
X-Gm-Message-State: AOAM531Z/3/3FMTvcGQfOMt7LkTJ0+UEOl8MIBuLOLxwVAcUwjFe2lhz
        H02k7qQc3cech5cme58lBvy3IA==
X-Google-Smtp-Source: ABdhPJx3GV6N9roneIKzcY/dVCXCn9yS7etjaOFVuf7IhAKvkRpb5Z/aaFPh+B4A4fuSZ7UHH9cApw==
X-Received: by 2002:a17:906:9749:b0:6ef:bc52:1f94 with SMTP id o9-20020a170906974900b006efbc521f94mr14192498ejy.666.1651560732570;
        Mon, 02 May 2022 23:52:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hf27-20020a1709072c5b00b006f3ef214e2fsm4382915ejc.149.2022.05.02.23.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 23:52:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 5/6] ARM: dts: da850: use new 'dma-channels' property
Date:   Tue,  3 May 2022 08:52:00 +0200
Message-Id: <20220503065201.51818-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503065201.51818-1-krzysztof.kozlowski@linaro.org>
References: <20220503065201.51818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The '#dma-channels' property was deprecated in favor of one defined by
generic dma-common DT bindings.  Add new property while keeping old one
for backwards compatibility.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/da850.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index c3942b4e82ad..0386376fa486 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -679,7 +679,9 @@ cppi41dma: dma-controller@201000 {
 					    "scheduler", "queuemgr";
 				interrupts = <58>;
 				#dma-cells = <2>;
+				/* For backwards compatibility: */
 				#dma-channels = <4>;
+				dma-channels = <4>;
 				power-domains = <&psc1 1>;
 				status = "okay";
 			};
-- 
2.32.0

