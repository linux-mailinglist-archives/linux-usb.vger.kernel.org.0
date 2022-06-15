Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A93554CFBE
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 19:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349421AbiFOR0p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 13:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349161AbiFOR0l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 13:26:41 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71633ED31
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:26:40 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id k5-20020a17090a404500b001e8875e6242so2664661pjg.5
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aa7FUr+a4wTLA6dveYSDwzq+b8uS7oCLyp/1t0s5ZQk=;
        b=CAQ+dmgXLnCpOneVjwNL5kpN6rOGZbSytP5STuLrI3qdQ1hVnuP9caJgZQNzUdthYe
         uSsFNuTORwXK3GxXnictIpOtpinr5qhJLleVZNgZqY1c0P+lxBEvYCHdMbDup9dctw2z
         dEVcqC3DjUSckiueSzrMDLdfw55sIl/2w2+QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aa7FUr+a4wTLA6dveYSDwzq+b8uS7oCLyp/1t0s5ZQk=;
        b=UjDkuApRysLaC7fHBjGBO2sQd3inYN8D/Lu3h9uqqiKKhWCgFsDsikbY5RWIDVI1gj
         Egqb8iWuO608i0Emitogniv3ynWnggTRQgksWIPFtFD8yeGRKODJ7OuCjxFp5mcIJeCW
         qyWxbXVent1IrBB0jkEjjfIxnCg+L8eDpyQeg9I18MYyncH66vBcrP3rMin5gVlSrxdb
         k1k9OAmIngS2nnVHgF/LBaHPjJGZitSsHj4YsK0T7vqumM3SMaPxu2e6tGQTJS/mGChv
         bi2E9nybPveRkK3CyrJIsYDbzeMniB5Wl/E+toN+BOZsHUE6kDTiTYldAH0/ZOABlzFc
         rm+g==
X-Gm-Message-State: AJIora/EgjIMUBh3fYwZXSIItrmuMudPk8bxHVvRO3IzoHzVi2PrUYNv
        sEUtutPLf6GkBAHVQgoht3cuKg==
X-Google-Smtp-Source: AGRyM1uSrdUs/T/dpJk26aZhxjT4s9RRiOCflVK1iLxjEQj7cxNMUO+9tRjyyANhGXkkD90n+7hMZg==
X-Received: by 2002:a17:90a:f3c1:b0:1ea:a976:dd9a with SMTP id ha1-20020a17090af3c100b001eaa976dd9amr543523pjb.160.1655314000332;
        Wed, 15 Jun 2022 10:26:40 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 10:26:40 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v4 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch support
Date:   Wed, 15 Jun 2022 17:20:20 +0000
Message-Id: <20220615172129.1314056-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
alternate mode lane traffic between 2 Type-C ports.

Update the binding to accommodate this usage by introducing a switch
property.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v3:
- Fix unevaluatedProperties usage.
- Add additionalProperties to top level "switches" nodes.
- Make quotes consistent.
- Add '^..$' to regex.
(All suggested by Krzysztof Kozlowski)

Changes since v2:
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- Introduced patternProperties for "switch" children (suggested by
  Krzysztof Kozlowski).
- Added unevaluatedProperties descriptor (suggested by Krzysztof
  Kozlowski).
- Added "address-cells" and "size-cells" properties to "switches".


 .../display/bridge/analogix,anx7625.yaml      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 35a48515836e..bc6f7644db31 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -105,6 +105,34 @@ properties:
       - port@0
       - port@1
 
+  switches:
+    type: object
+    description: Set of switches controlling DisplayPort traffic on
+      outgoing RX/TX lanes to Type C ports.
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^switch@[01]$':
+        $ref: /schemas/usb/typec-switch.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maxItems: 1
+
+        required:
+          - reg
+
+    required:
+      - switch@0
+
 required:
   - compatible
   - reg
@@ -167,5 +195,41 @@ examples:
                     };
                 };
             };
+            switches {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                switch@0 {
+                    compatible = "typec-switch";
+                    reg = <0>;
+                    mode-switch;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        port@0 {
+                            reg = <0>;
+                            anx_typec0: endpoint {
+                                remote-endpoint = <&typec_port0>;
+                            };
+                        };
+                    };
+                };
+                switch@1 {
+                    compatible = "typec-switch";
+                    reg = <1>;
+                    mode-switch;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        port@0 {
+                            reg = <0>;
+                            anx_typec1: endpoint {
+                                remote-endpoint = <&typec_port1>;
+                            };
+                        };
+                    };
+                };
+            };
         };
     };
-- 
2.36.1.476.g0c4daa206d-goog

