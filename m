Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A46805970EB
	for <lists+linux-usb@lfdr.de>; Wed, 17 Aug 2022 16:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240109AbiHQOW7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Aug 2022 10:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240089AbiHQOW4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Aug 2022 10:22:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A6590811
        for <linux-usb@vger.kernel.org>; Wed, 17 Aug 2022 07:22:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id e15so19260718lfs.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Aug 2022 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=9GC5bJ+m1U21wFCtiN8Hm7wauILLxWrJ9sFq+9fk+k0=;
        b=o8C3QM3Wu2kpOjLMF8uXobDHbQB4PKvFqLSry295hn20lPNVHWLgajWCgojrARkC5g
         BIIWNiFn4Xn9zHRsChY8osAeReyp7yCUDhjn8ahzlgy9LdImCgC1piAELmqnynX8qpG+
         aguWks3BSQGJQWjVlESm9WpIlGYpXFgA2OW3XG7jKfYckz9TFxd6RC6qAylzC59zR3PW
         tadzknNyfsWjM4aVfqZcNKQk7J7sR5rSrjM3bzg0o7Foo3SLOpePtX9KNiTcB0/fE1ZM
         bUncQNm049DKkKoeeGL5L/jrEMK87k3L4c0u5PA6Hcf4zK8YY+oILzmGrEexxttqUXwm
         1q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=9GC5bJ+m1U21wFCtiN8Hm7wauILLxWrJ9sFq+9fk+k0=;
        b=c6fz4pnj6qhLs+rnhBg8L7VzsrTvuAEPTENXmvLnDsO5TY3h3BlPJJoi5cTwi5XO23
         bCA82YqMctIkkGAUerIVKmR3AQL4zYvnCsLmWi2BPYs8hgVMX9JssN0JsUEdxq3rJTp2
         n+5c6yXhaZ2DESgf4sY8nByXbIJa5YC6chBFGp6QPu6nMM2/VZMR5oHrUOgS9DTCRVHO
         7g5Fruz2IGAqyBrY6QvivwDPVQREQORyh556A7cIM3WSIZRG5puvOxlKK6pY5TQwcK0O
         eLWNwrv0Hmgh2BrneCAOHdMrHb4BvgsQvlOLQeb/KxEnPc3aQ/a1dvwMM9Ua+3R+J2+h
         IkUg==
X-Gm-Message-State: ACgBeo3MNicEwLROZgdzXgISmzuc/BoOrCQPy8hAzBrcQv0zXQZ1X2T7
        yTkbD0eRYQQdezp4KBoeaPrYVg==
X-Google-Smtp-Source: AA6agR5cywzI8moCKPQfkI/f7EQoEdiKTJvRfYGYEKNF0cQLrCqZdnncv8cDcoXap/UvaZ10NS79Jg==
X-Received: by 2002:a05:6512:1584:b0:481:31e4:1489 with SMTP id bp4-20020a056512158400b0048131e41489mr8455124lfb.509.1660746171888;
        Wed, 17 Aug 2022 07:22:51 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u1-20020ac258c1000000b0047f7722b73csm1704647lfo.142.2022.08.17.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:22:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yu Chen <chenyu56@huawei.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Carvalho Chehab <mchehab+huawei@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] dt-bindings: phy: hisilicon,hi3660-usb3: simplify example
Date:   Wed, 17 Aug 2022 17:22:43 +0300
Message-Id: <20220817142246.828762-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817142246.828762-1-krzysztof.kozlowski@linaro.org>
References: <20220817142246.828762-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syscon and simple-mfd cannot be used without device specific compatible,
so simplify the example to fix this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/phy/hisilicon,hi3660-usb3.yaml   | 22 +++++--------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml b/Documentation/devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml
index c2e073e26190..20b79e2e8b82 100644
--- a/Documentation/devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml
+++ b/Documentation/devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml
@@ -41,20 +41,10 @@ additionalProperties: false
 
 examples:
   - |
-    bus {
-      #address-cells = <2>;
-      #size-cells = <2>;
-
-      usb3_otg_bc: usb3_otg_bc@ff200000 {
-        compatible = "syscon", "simple-mfd";
-        reg = <0x0 0xff200000 0x0 0x1000>;
-
-        usb-phy {
-          compatible = "hisilicon,hi3660-usb-phy";
-          #phy-cells = <0>;
-          hisilicon,pericrg-syscon = <&crg_ctrl>;
-          hisilicon,pctrl-syscon = <&pctrl>;
-          hisilicon,eye-diagram-param = <0x22466e4>;
-        };
-      };
+    usb-phy {
+        compatible = "hisilicon,hi3660-usb-phy";
+        #phy-cells = <0>;
+        hisilicon,pericrg-syscon = <&crg_ctrl>;
+        hisilicon,pctrl-syscon = <&pctrl>;
+        hisilicon,eye-diagram-param = <0x22466e4>;
     };
-- 
2.34.1

