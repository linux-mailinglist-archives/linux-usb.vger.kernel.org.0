Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2337A4D8BAB
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 19:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243778AbiCNSVa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 14:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243760AbiCNSV1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 14:21:27 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1901366AB
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:16 -0700 (PDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 817BC4003F
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647282015;
        bh=3F2+CAuLP5QZLFRCTc5YKJtMfEWVhLlhzdIM3Py96Yo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=o/g0x/LPDRZnBOVMej65YdHFbrr4rtuf1ugwj/EbdyLqBzkhbcq8h69LHRbrBULZl
         56n49IYWfOLKHNQgN/EfXI5nbegDJyYwtfio16RH6d4hTvKIgzpmz1eNFhtikz9Ek/
         lMXjFKEDGXaPGmOLAsHYKTipYo0dBkAk2gKHRu3oAcXdMscbru1NOwiQRL5LlSX4nR
         Qhil2K4n+4hnGZUwMX0KMJMcARC4hL5qVPlmzOJR0gjCK9vd/nhCXNhkod0pS670R8
         LnDOCSX4fu8i2oREe0473rrUymAP3RD+HUg4o/ZargeT/Eb45ES3AF+KqaTd10bd40
         xipn+Cc57cLXA==
Received: by mail-ej1-f71.google.com with SMTP id q22-20020a1709064cd600b006db14922f93so8372736ejt.7
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3F2+CAuLP5QZLFRCTc5YKJtMfEWVhLlhzdIM3Py96Yo=;
        b=5L4+Itjc01SQILUYIgVd5DPiaZtR75ked0thHUJnm6lnQQWOX63LLG01zhrzZBLv8g
         GjBDlFsLaZBBAkuAErLoupzeVD4+4NftFiVgM0eUsc9rjMJiQg5kDLzjKfHQpsNNIV0F
         JkykSf5jVL1MZx5NKe/uX5qrj7s/O4ksbN1DWryF+V2f37RcJ9eXkjHw1DBF1uAIz7di
         /VsE+vsWXwd99uDQO0QLkUo/6caj20AthgMpHRHzn/5xe4FE+jursI449OQwidA0e9n/
         TReoEzgk6SkVPdsc+NwsCYl/qLWwjUpTb9/i1llsUguTycx/OID+9h+PLR4W3NwDUTQ3
         rOAw==
X-Gm-Message-State: AOAM531nwO9MPRrl/rwnf4SlNxxC0KsSqxbIF1k0+kHPdTIjTzshbdjE
        MuIR6Wa/me/X/Uk4pZ0uhZwM4qTaY3cvGRStLxWDHX8qHFJIoZUlajcgq14sdHjs8p8n4clBtMC
        lDGzwoNUO5rVdGem8hXGhBuE12mSzFMFeMwdiPw==
X-Received: by 2002:a17:906:7953:b0:6da:951c:1173 with SMTP id l19-20020a170906795300b006da951c1173mr19830436ejo.465.1647282014952;
        Mon, 14 Mar 2022 11:20:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkcwlyOc0SXQwJvd/c10csYRaaMAinbSZyI/FaYE0QvgKDO1i/aLi/j5YzU3k9ZXqrCumxNw==
X-Received: by 2002:a17:906:7953:b0:6da:951c:1173 with SMTP id l19-20020a170906795300b006da951c1173mr19830421ejo.465.1647282014773;
        Mon, 14 Mar 2022 11:20:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i25-20020a50fd19000000b0041614eca4d1sm8566449eds.12.2022.03.14.11.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:20:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 4/5] dt-bindings: usb: samsung,exynos-usb2: add missing required reg
Date:   Mon, 14 Mar 2022 19:19:47 +0100
Message-Id: <20220314181948.246434-4-krzysztof.kozlowski@canonical.com>
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

"reg" property is required on Samsung S5PV210/Exynos EHCI/OHCI
controllers.

Fixes: 4bf2283cb208 ("dt-bindings: usb: samsung,exynos-usb2: convert to dtschema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Fixed commit in current next. If this should go as fix, I can split it
from the second commit.
---
 Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
index fbf07d6e707a..ef42c6fce73c 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
@@ -62,6 +62,7 @@ required:
   - interrupts
   - phys
   - phy-names
+  - reg
 
 allOf:
   - if:
-- 
2.32.0

