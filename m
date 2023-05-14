Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334F67020A2
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 01:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjENXLU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 May 2023 19:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjENXLT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 May 2023 19:11:19 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C037E79;
        Sun, 14 May 2023 16:11:17 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 13178847CF;
        Mon, 15 May 2023 01:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1684105876;
        bh=qbKC27OXD3a+sAVXe2pU/nJvOObH8por3f0ttK7EJVU=;
        h=From:To:Cc:Subject:Date:From;
        b=SBex1qckjm1XCOG9HjZ8nIISzCJVJh3vhFFDMbn7EADj+bGchV83E6pip/ZCKJlJM
         y2UNEP24O+FAPJydr382ff+4rXa63qAkcJ06jr420w12Br0ro50a9FHfLTKV0xSBA8
         H96ggcRDpH9ygeNm6Kmfb5WxNkiKwUxi5GI0o/hxxTUTuyWUBJW5HN5Hi+U0PfqSEj
         0RvAQUJbo5OW699Uh5scqaTtaXLsXCxg/05QFu8BaG/T3VOQED8P0af4S6N/ODnE5g
         qdwSq+ihR2VqBl6ihMm+T9kCt4ck25r3MW76BSjuwsf5F4FLGwtLPvceesgFVwY46J
         5oHkDMKyHUihg==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: snps,dwc3: Fix "snps,hsphy_interface" type
Date:   Mon, 15 May 2023 01:11:02 +0200
Message-Id: <20230514231102.788841-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The "snps,hsphy_interface" is string, not u8. Fix the type.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 50edc4da780e9..4f7625955cccc 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -287,7 +287,7 @@ properties:
     description:
       High-Speed PHY interface selection between UTMI+ and ULPI when the
       DWC_USB3_HSPHY_INTERFACE has value 3.
-    $ref: /schemas/types.yaml#/definitions/uint8
+    $ref: /schemas/types.yaml#/definitions/string
     enum: [utmi, ulpi]
 
   snps,quirk-frame-length-adjustment:
-- 
2.39.2

