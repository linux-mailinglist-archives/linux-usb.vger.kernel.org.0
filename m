Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C2554BACC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jun 2022 21:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344442AbiFNTml (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 15:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344359AbiFNTmj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 15:42:39 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EF9205D2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 12:42:38 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id o17so8590730pla.6
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 12:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ZJFZpaUYvLKyNF9q+LY72zbgzs/nGyR/EwoxYaYQ1M=;
        b=NmuP2Skdd5n3bGLCNoER1Bcoij3SJxX/7ftaF2q12rYMoal3MZgBSsHGVLdGjuEQAk
         /TXsLNHVehRshc+JIy8NXlnK8wctd8uYo7/eup1XrczVTQbbRb6QVPbYOX1Gp+TIZrp7
         U5GlS7NtpdzLWTESA9UQ/RiHnsYC9gCeJiXis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ZJFZpaUYvLKyNF9q+LY72zbgzs/nGyR/EwoxYaYQ1M=;
        b=61ZjE7Yg7HHv8E4q5BynuC9yuJlJ3+eIn0ObPYTEhCema7oKGYbVDPYdhzQktDtio4
         pWkWUfqo1/0xrW/dibH/Bc46zaKdJKTguyOz73lWWJGI4gXaD79J1h0xFr0Hp1wC1tSa
         rZFPGpD/KNzsfozhQoCe5okMsBN3/v45pQoL933zte5rPxApbLhxyq+Fg8tfTzV8R7TD
         ZBBw1CPNeT+WUrkXUR3CTosxIScmNjClL0vESQffo+huoG+k5PjhdW4PfcVp9IGV/K/N
         a4Ld3CJjYP1FM5NrOO+ZT0VE3fe2oc+eRsBZvpQIIAXEIpeFlCWlDJz9cJfkfGJw5ybo
         bMyA==
X-Gm-Message-State: AJIora+tN5TbQ4U/D1RyBOd704tw0Lj+wUJ+axSbWTklZQW5nbzztpAx
        YiS2SFna8FDlSMG6QMHSCFmZhQ==
X-Google-Smtp-Source: AGRyM1t/o/wb2VbxM3MoZhym1+ZRjJ5p6nx1fVnXuS2wmx6yNAHsevoLdCilrD9eNpTSPGjijydqVA==
X-Received: by 2002:a17:90b:4a92:b0:1e8:2ba1:64bf with SMTP id lp18-20020a17090b4a9200b001e82ba164bfmr6118811pjb.41.1655235758368;
        Tue, 14 Jun 2022 12:42:38 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id l21-20020a17090a409500b001df3a251cc2sm10014426pjg.4.2022.06.14.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 12:42:37 -0700 (PDT)
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
Subject: [PATCH v3 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch support
Date:   Tue, 14 Jun 2022 19:34:38 +0000
Message-Id: <20220614193558.1163205-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220614193558.1163205-1-pmalani@chromium.org>
References: <20220614193558.1163205-1-pmalani@chromium.org>
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

Changes since v2:
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- Introduced patternProperties for "switch" children (suggested by Krzysztof Kozlowski).
- Added unevaluatedProperties descriptor (suggested by Krzysztof Kozlowski).
- Added "address-cells" and "size-cells" properties to "switches".

 .../display/bridge/analogix,anx7625.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 35a48515836e..cb4a23391244 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -105,6 +105,33 @@ properties:
       - port@0
       - port@1
 
+  switches:
+    type: object
+    description: Set of switches controlling DisplayPort traffic on
+      outgoing RX/TX lanes to Type C ports.
+    unevaluatedProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      'switch@[01]':
+        $ref: /schemas/usb/typec-switch.yaml#
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
@@ -167,5 +194,41 @@ examples:
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

