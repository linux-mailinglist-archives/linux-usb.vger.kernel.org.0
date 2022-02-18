Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF6C4BBD31
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 17:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237602AbiBRQPz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 11:15:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237586AbiBRQPt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 11:15:49 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D2B2B2E3C
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 08:15:33 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8D231405BC
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645200929;
        bh=Fdez1AmqlsBKbf0sdm0whcYqGiEOg3dPughdxsguAXI=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=NXI4erxcLg4wnIgsuHh0kFmU5I2lWf8FCMhIVgrGw8TBrb6T5DFUUGDfwyW5M5+oz
         ULtAfAVKWlILygLKj5zQ4L+10h8RgQHxNRWrNgWmKo3ov1kfoJV6hLULvMk6ZEWP9v
         ttra0hLl1n/I+E/GUF/TEDoheWpD7u1PluBhd08q9wh34/o5fLQaw64QKKXWuAzx9i
         0GmIkW56z8e1ADl40PeWqlO+XfNqCLNIWW8PP9bdjeA9yvA5rPXHQ6aJ47+Bxh2d/Y
         iq5PFOXIDK480EasAOcBLII3u12EhylNxRid+p8YC5fTIv7I6ejS9Uzq6PoGiSOBMh
         A+TOvXSYo/awA==
Received: by mail-ed1-f70.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so5805473edb.2
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 08:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fdez1AmqlsBKbf0sdm0whcYqGiEOg3dPughdxsguAXI=;
        b=eJyZcSvOHZxVsaNbQAhuDvkuUaajFqEZf1PG6L360Ni9e9tSZZi7JrOkgJEvW71R60
         BsDOJhdy5w18b/puHY3NenCpomQwofo+CkVHkG4+Tr0F3SmlyxEqyWq061pfE0f4U4sR
         e2/WIC0yybvIpzWNBi+1bsLp956WUuF4aCH80UplcNiaxtj4c+Det5HXofuV54Sd3yRY
         miSg26gAaK+tHe/ujOEJ7cbenVBlUWksOYauBRxbzmQfa+WSCISUAQSsYRtgaVqSSmmz
         4oBcTF2DYxJQA+K51k3Z4D9OV7oQotyGqvL4OepdYVORsX+p5Cae7JlHRsImMNKnWyO8
         90Gg==
X-Gm-Message-State: AOAM533Nm2c/1PEiIjMpoMFFW/PdJ5ctFCMLPrLTI7vKayc65nvVlK6s
        ijAaxJr3DiRc+ic9EW3F2a3QTqUgqT71GtsqKxX77olTzvul0v4/9fjFTxkM2twMUyS5B0hiuLm
        S1i+GBNcx/xJmN682MgIBdCcNu3G36M0WTda3oA==
X-Received: by 2002:a17:907:7053:b0:6a6:b835:dbd3 with SMTP id ws19-20020a170907705300b006a6b835dbd3mr6755944ejb.190.1645200928925;
        Fri, 18 Feb 2022 08:15:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxif3aG4j6jnGHwS6RzVrgD+2IJjpK+S4H+3CmJ2oLVH02iXXbrxboKEJzUTsWoN3HnciK9Tg==
X-Received: by 2002:a17:907:7053:b0:6a6:b835:dbd3 with SMTP id ws19-20020a170907705300b006a6b835dbd3mr6755917ejb.190.1645200928644;
        Fri, 18 Feb 2022 08:15:28 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id y21sm2325572ejq.185.2022.02.18.08.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 08:15:28 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: usb: dwc2: add disable-over-current
Date:   Fri, 18 Feb 2022 17:15:21 +0100
Message-Id: <20220218161522.52044-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220218161522.52044-1-krzysztof.kozlowski@canonical.com>
References: <20220218161522.52044-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver parses disable-over-current protection and some
implementations use it (e.g. Altera Stratix10), so document it in the
bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 1ba96706bbcb..1addab83f4fd 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -68,6 +68,10 @@ properties:
     items:
       - const: otg
 
+  disable-over-current:
+    type: boolean
+    description: whether to disable detection of over-current condition.
+
   iommus:
     maxItems: 1
 
-- 
2.32.0

