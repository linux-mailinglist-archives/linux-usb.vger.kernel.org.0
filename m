Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5951A77EA70
	for <lists+linux-usb@lfdr.de>; Wed, 16 Aug 2023 22:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346014AbjHPULf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Aug 2023 16:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346100AbjHPUL0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Aug 2023 16:11:26 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA37F3
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 13:11:24 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6bca3588edbso4837734a34.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 13:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692216684; x=1692821484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Lws75iJ418dvUiFUMpSCZSJpyx26Sbj9eIlHFk1PcY=;
        b=gN0LEIm74Bz0xvqXdVi1r5MAh02OiOvRcyxW0f5+qOT1fJ/7dmXHMYpRBo7e8fuedD
         8E4aeaIwULrgMTSxCM6jl7PiqnX64zMuGoumHx0wl9gy/X+Bc+FYvDnQVSxw7e/jJLxx
         HlLEC2nruRP1nKj8dGZNxRz3ZfnKUDUPrlmrFzHIumdsS2pBPPbZXXu7Io7JbR8rLxHT
         52TZ66fWdg83GsKplHOCsehJ/qqNNLkipPKwsrkQB02DfKddjUYHpd4MCyGel9BmX377
         U5dFdwvUhxoGzVKdzENDAKD78Yk6dYBnyZPLXU7qe5kjSmRbYP6Yqyeb0vQob5B29ZEV
         EGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692216684; x=1692821484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Lws75iJ418dvUiFUMpSCZSJpyx26Sbj9eIlHFk1PcY=;
        b=F0RWj3mRluEr7Yo8dWFEPkIhM7UDd4E9oDGX6oN5QNCY0b5O9ZjaWV0lLkqvBSs6FB
         XWmW5k/U/Wjs3QBY7OCsyv1a5iRz4T62buAA7Anknz/CNm0ctjMlV6gaDHhs2cGbBcfk
         N6/d8wfWWTetU6sI20tZLQ40M1hIxGmL9BOivU+2P/SWTvjksA4ewnSnf2zVDnMjphs9
         J4LfsfUNNvjPcgQQs6REZptTwFMcu04RC8DC4sOWSjbUXakU4mkFZA8UoT8lOaJl5KiV
         GPuKvR+ghrH9xSB/k2OpHDIhE/N4Lqx/C+CC+HvLM0AzqOa/y5z4faHfgOeiTDpcScKf
         i7nQ==
X-Gm-Message-State: AOJu0YwC/yt91flohDbiKdN6MGSp15s1sQW/9vV9d0VqpLG/Hwvd7/yd
        8kkp04ym/3b8Z1dH2f88+r8D5g==
X-Google-Smtp-Source: AGHT+IFnT/6Su+IdemW7NvD/jLoMyj22j+Z2P6LjjB67eLjhfM9Ka2Q7lSUSr79I01dl9GO21DBAtw==
X-Received: by 2002:a9d:6a99:0:b0:6b8:dc53:9efd with SMTP id l25-20020a9d6a99000000b006b8dc539efdmr3138769otq.3.1692216684263;
        Wed, 16 Aug 2023 13:11:24 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id i6-20020a9d6506000000b006b58616daa1sm6349374otl.2.2023.08.16.13.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 13:11:23 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: Fix Exynos5433 compatible
Date:   Wed, 16 Aug 2023 15:11:23 -0500
Message-Id: <20230816201123.3530-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The correct compatible for Exynos5433 is "samsung,exynos5433-dwusb3".
Fix the typo in its usage.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Fixes: 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to dtschema")
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 42ceaf13cd5d..240f41b7133a 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -72,7 +72,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: samsung,exynos54333-dwusb3
+            const: samsung,exynos5433-dwusb3
     then:
       properties:
         clocks:
-- 
2.39.2

