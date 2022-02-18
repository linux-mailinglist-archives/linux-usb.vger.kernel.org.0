Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FAD4BBD2D
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 17:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237551AbiBRQPx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 11:15:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237567AbiBRQPr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 11:15:47 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A90C25B6E2
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 08:15:30 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 390693F1B7
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645200926;
        bh=ArqYovumOubQeXG2JMFc63fkt0qJo0xXojg7cAGT2ys=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=IfuhE60YfWrcO71eE6faaf28qx/9iergmJq7eI5NpZ0P+qm43qtLIBLxLXXTlUS5+
         nn54ncm1TgqQWHcrOxXJ9VdU2YjD4r3JVSXUqqJyqW8o7DE+nZk59lduWweQEwCc2U
         ariiY8z1jto9gyZHL3MwWTlNYdLIY5lyVrDYnSCKs2mZ8Fh2epZbgVAzcfHGNKeDrh
         PAZrdD5onQGCDKBdwzIceIOXtTk8ylhmxsgsKPYDadoB0wm4RdR0HLTQUMy2zdXVVz
         oqDenaXBrcDhCfpHltaPR5NbVxeKDMQvmNixnjvFyf+e3N0WH2yrtC9GKYl2Y+uSBQ
         pUr7EsU4NqheA==
Received: by mail-ed1-f70.google.com with SMTP id j10-20020a05640211ca00b004090fd8a936so5774094edw.23
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 08:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ArqYovumOubQeXG2JMFc63fkt0qJo0xXojg7cAGT2ys=;
        b=hHTYJ0h/mUePgkuXHESWT0jzJUVmygyDkFs2+BmoMIL1VNy/jAaanGE+ecJXTNIV1Y
         OjPG68wvWnQhdf4mZELLYd7cVo2ziHPRAeGrPiLjgM2Lhi1cZ3Juw294TYsdnxZ7jDM5
         f5ySmv7onMrU0u9HMLHaGYUwN9tczmZoEFY3VVhDYoGjno2rVKM7UENHNb6LEpx5y7N1
         ISv408EsfLFl07OQWoOE2yOrMyY/f4pM19R4Y2nt/FShde1qYAln0NMjRZxkJLFyf8wU
         /S0EZF3C5fV36rQNyunqifl1oHFi+Qm8cgvbCmaL9N1agN2iKC8/vlPtZktW0JyZwpUK
         EVrA==
X-Gm-Message-State: AOAM533yk4MYneHGBRf/ghf6EAxVYWfdMXEFH4cO+jsniIq9KwPBxwAG
        tfbEG0H6+aw8lUrfJI63Fd+DuBjRE5h0jqaaGKRYqVEbeUE7gV3LQds6lJMM0Vzy76qtKbhCJ1B
        kJcgYyIn4xc7slTgcydg8mfwVBslrMbZ/hqT7dg==
X-Received: by 2002:aa7:d403:0:b0:40f:739c:cbae with SMTP id z3-20020aa7d403000000b0040f739ccbaemr9144596edq.267.1645200925938;
        Fri, 18 Feb 2022 08:15:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLUc/jtciQ3hgHthIGyTcihNgoDi/ahnpFRpSQuYK90a2g0jWHWbYdDdGVN0jKHYlqHqIOog==
X-Received: by 2002:aa7:d403:0:b0:40f:739c:cbae with SMTP id z3-20020aa7d403000000b0040f739ccbaemr9144574edq.267.1645200925759;
        Fri, 18 Feb 2022 08:15:25 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id y21sm2325572ejq.185.2022.02.18.08.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 08:15:25 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: usb: dwc2: fix compatible of Intel Agilex
Date:   Fri, 18 Feb 2022 17:15:19 +0100
Message-Id: <20220218161522.52044-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Agilex USB DWC2 node is used as compatible with generic snps,dwc2
(just like Altera's Stratix10).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 481aaa09f3f2..048e352c531a 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -41,6 +41,7 @@ properties:
               - amlogic,meson8b-usb
               - amlogic,meson-gxbb-usb
               - amlogic,meson-g12a-usb
+              - intel,socfpga-agilex-hsotg
           - const: snps,dwc2
       - const: amcc,dwc-otg
       - const: apm,apm82181-dwc-otg
@@ -53,7 +54,6 @@ properties:
           - const: st,stm32mp15-hsotg
           - const: snps,dwc2
       - const: samsung,s3c6400-hsotg
-      - const: intel,socfpga-agilex-hsotg
 
   reg:
     maxItems: 1
-- 
2.32.0

