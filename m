Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D979B562340
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 21:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236888AbiF3Tfk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 15:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbiF3Tfj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 15:35:39 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839284132B
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 12:35:38 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id h192so296808pgc.4
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JB7sx4mYBlVrOKCS+hcQc2JLyuj+tIa+zut8Qu0t/NQ=;
        b=lI5oEWJOZMQcBNCfOvOZqTJ/Xl9N3knwLAWjgxn1/3cbDPAoNOY+3/iBboZZ+jvyNm
         dEycEuE3YzIoxRltEQ7aisfjD1TnMi9lyN0Z/NH64Glv97odgVJ5s+5O7xcnFt27vSyl
         gGzfij4gfHgf0/CsUhpli7JnrYaXCi2C4Crhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JB7sx4mYBlVrOKCS+hcQc2JLyuj+tIa+zut8Qu0t/NQ=;
        b=6MiBcag9Xxm+wQGAx2UaW5s3C1fiBBPG9S3B33FvP76LqXphY6qF6+1Gs6TdpwOWZH
         2QyBJGplcLIEJTgM5VkiTlbdpvAr8nL1oDzS9f+UrJh2Gpz7gdYsQGONP5bK8jiGJSyH
         VWeHTllUK6ml6qHeSYUa5u1gLn5oyUdoGhwTfD5u6a1Xl176FpFzlUH08SxU80G1Mnck
         h8PuldP+JB1sDDWphopZ/s/MWe8qORU7b9ALtZ/brPI2CaAtvdRFg1Fk03fBcgnwAdoo
         1hXAAmM2gxhOnLsh+SvqtVZbr2x6O9TW61LyzYUedyLdiAJqhqQFW1y64EGhCVB77Kis
         2CGw==
X-Gm-Message-State: AJIora9/fxhL8k1lV4QQ/+ksNdbEoJ4Y+JPZn929afVPB6Dxsn1UvKRj
        LznJOc6E8gdl3cGEQqg6r1z0kQ==
X-Google-Smtp-Source: AGRyM1tBj5AvR5N76508bLv8vvQ7+mbrRKoUoaGVIT1Qe/8Tayp0YFwSHXYnY5xqwSP6Myo2zad/gQ==
X-Received: by 2002:a63:82c3:0:b0:40c:c340:318d with SMTP id w186-20020a6382c3000000b0040cc340318dmr9035922pgd.191.1656617738025;
        Thu, 30 Jun 2022 12:35:38 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:9fbf:277c:23e1:eabb])
        by smtp.gmail.com with UTF8SMTPSA id p31-20020a056a000a1f00b0051bdb735647sm13936598pfh.159.2022.06.30.12.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:35:37 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v24 2/4] dt-bindings: usb: rts5411: Rename property 'companion-hub' to 'peer-hub'
Date:   Thu, 30 Jun 2022 12:35:28 -0700
Message-Id: <20220630123445.v24.2.Ie2bbbd3f690826404b8f1059d24edcab33ed898f@changeid>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220630193530.2608178-1-mka@chromium.org>
References: <20220630193530.2608178-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the context of USB the term 'companion-hub' is misleading, change the
name of the property to 'peer-hub'.

There are no upstream users of the 'companion-hub' property, neither in
the device tree, nor on the driver side, so renaming it shouldn't cause
any compatibility issues with existing device trees.

Changes in v24:
- patch added to the series

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v1)

 .../devicetree/bindings/usb/realtek,rts5411.yaml       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
index 04ee255eb4f0..50f2b505bdeb 100644
--- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -25,13 +25,13 @@ properties:
     description:
       phandle to the regulator that provides power to the hub.
 
-  companion-hub:
+  peer-hub:
     $ref: '/schemas/types.yaml#/definitions/phandle'
     description:
-      phandle to the companion hub on the controller.
+      phandle to the peer hub on the controller.
 
 required:
-  - companion-hub
+  - peer-hub
   - compatible
   - reg
 
@@ -49,7 +49,7 @@ examples:
             compatible = "usbbda,5411";
             reg = <1>;
             vdd-supply = <&pp3300_hub>;
-            companion-hub = <&hub_3_0>;
+            peer-hub = <&hub_3_0>;
         };
 
         /* 3.0 hub on port 2 */
@@ -57,6 +57,6 @@ examples:
             compatible = "usbbda,411";
             reg = <2>;
             vdd-supply = <&pp3300_hub>;
-            companion-hub = <&hub_2_0>;
+            peer-hub = <&hub_2_0>;
         };
     };
-- 
2.37.0.rc0.161.g10f37bed90-goog

