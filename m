Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7F04D8BAC
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 19:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243787AbiCNSVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 14:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243767AbiCNSV2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 14:21:28 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4941B366A2
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:18 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0409B40026
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647282017;
        bh=ZZZmUkbhHody3cQg6YTtcASZbjcHkXRB0CKHR4Vfcs0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=pcz4R4pQTgOWbSqMi/K0lGM02Aag0jQBcF5nHYhwmvoo5bpnn8JCDkku1RG4HrQWz
         A4+ZkU5P4CdO2xU9eCudeyIiDuHLYQV7uJ3n5vq3GdM01YkskS/4eC3fxAR3Onx6hl
         BNd0XwjcePV+E+s0FR+HhWrwGnfyKC5eMmfSY12w3GXovCC7apnPLnTGAxVJxMP9QR
         396T2fHJQFhcFR+r7BTHiSRPNwNrkQVfFTRE39R9CsNyHqJtMi2qh4tx2tlh7NLhUx
         X/rmKWx/0CxzFss3KtSXjy94p9w8WXMCZ6aWAAzPanHDiIjfIJVzcL2sSNSdVkfhdX
         5kRoKssevUUMQ==
Received: by mail-ej1-f70.google.com with SMTP id 13-20020a170906328d00b006982d0888a4so8299159ejw.9
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZZZmUkbhHody3cQg6YTtcASZbjcHkXRB0CKHR4Vfcs0=;
        b=RS36Sj+nUyKa0MJrdvhpySveyyfd0QbyLmzmV0CH/ibawpegxv7q0YLyPidKapsmY5
         zj2yyaVYX8K+BjNp5xRBpxu1fcLRy4oSjlccw5PvtqNaak2dhG6K+6+v97mCLQ50pS5Z
         dTXGsRumCD/qqqa/7gv2v1ZIiqmrxCRozOjXnnFyabUgJWW9WeDW4R30W+3TTBbZReeQ
         yoSh/OESe9EHjVsxDwBaqSxgpcElb+JyauWiOsnvKBZ7tWGkOA/C3cOrLw/gMvT+e9QY
         6bKAEW5mnN6Zj5Vyn0uVZeb/yWCQuupUQ2iL/UOre9amKFvRr1LnjXzjU4BTej18sTNh
         l6Jw==
X-Gm-Message-State: AOAM533SIgqs1GN2l06p5Pq1I9iSoqCPwdzGXqIOEBC8nOtJ6RK9tUMx
        ci8Yn0qwz2tu06vjeAyoQRhSazyfbSvlv4bl4uEgVBDZOmtV4M7hdphdWzgmlRcv/52Mnu7WwUq
        N8NqPRpwhqctSjNiK+6lNeRbCgcrW53wf5/zasQ==
X-Received: by 2002:a17:906:174f:b0:6d0:5629:e4be with SMTP id d15-20020a170906174f00b006d05629e4bemr19138895eje.525.1647282016652;
        Mon, 14 Mar 2022 11:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxilSk6aR5x6eRg2Sw08ds9XOo2mHj9ui0uVFPKjg2yLuwqGtgXaY6G1Ov0G1h2AdMHYrbneQ==
X-Received: by 2002:a17:906:174f:b0:6d0:5629:e4be with SMTP id d15-20020a170906174f00b006d05629e4bemr19138877eje.525.1647282016448;
        Mon, 14 Mar 2022 11:20:16 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i25-20020a50fd19000000b0041614eca4d1sm8566449eds.12.2022.03.14.11.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:20:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 5/5] dt-bindings: usb: samsung,exynos-usb2: include usb-hcd schema
Date:   Mon, 14 Mar 2022 19:19:48 +0100
Message-Id: <20220314181948.246434-5-krzysztof.kozlowski@canonical.com>
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

Remove parts duplicated with usb-hcd.yaml DT schema and include it
directly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/usb/samsung,exynos-usb2.yaml         | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
index ef42c6fce73c..76e25b9efebd 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
@@ -15,9 +15,6 @@ properties:
       - samsung,exynos4210-ehci
       - samsung,exynos4210-ohci
 
-  '#address-cells':
-    const: 1
-
   clocks:
     maxItems: 1
 
@@ -46,15 +43,6 @@ properties:
       Only for controller in EHCI mode, if present, specifies the GPIO that
       needs to be pulled up for the bus to be powered.
 
-  '#size-cells':
-    const: 0
-
-patternProperties:
-  "^.*@[0-9a-f]{1,2}$":
-    description: The hard wired USB devices
-    type: object
-    $ref: /usb/usb-device.yaml
-
 required:
   - compatible
   - clocks
@@ -65,6 +53,7 @@ required:
   - reg
 
 allOf:
+  - $ref: usb-hcd.yaml#
   - if:
       properties:
         compatible:
@@ -74,7 +63,7 @@ allOf:
       properties:
         samsung,vbus-gpio: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

