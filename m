Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6DE62D822
	for <lists+linux-usb@lfdr.de>; Thu, 17 Nov 2022 11:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239586AbiKQKhT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Nov 2022 05:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234774AbiKQKhF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 05:37:05 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 89AB62FA;
        Thu, 17 Nov 2022 02:37:04 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A17AA1477;
        Thu, 17 Nov 2022 02:37:10 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DCB73F73B;
        Thu, 17 Nov 2022 02:37:02 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bin Liu <b-liu@ti.com>
Cc:     Icenowy Zheng <uwu@icenowy.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, soc@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: [PATCH v4 01/11] dt-bindings: usb: sunxi-musb: add F1C100s MUSB compatible string
Date:   Thu, 17 Nov 2022 10:36:46 +0000
Message-Id: <20221117103656.1085840-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117103656.1085840-1-andre.przywara@arm.com>
References: <20221117103656.1085840-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Icenowy Zheng <uwu@icenowy.me>

Allwinner F1C100s has a hybrid MUSB controller between the A10 one and
the A33 one.

Add a compatible string for it.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/usb/allwinner,sun4i-a10-musb.yaml         | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
index 8992eff6ce387..f972ce976e860 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -13,10 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-musb
-      - const: allwinner,sun6i-a31-musb
-      - const: allwinner,sun8i-a33-musb
-      - const: allwinner,sun8i-h3-musb
+      - enum:
+          - allwinner,sun4i-a10-musb
+          - allwinner,sun6i-a31-musb
+          - allwinner,sun8i-a33-musb
+          - allwinner,sun8i-h3-musb
+          - allwinner,suniv-f1c100s-musb
       - items:
           - enum:
               - allwinner,sun8i-a83t-musb
-- 
2.25.1

