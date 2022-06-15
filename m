Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08F2A54CFB4
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 19:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245078AbiFORZ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 13:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237461AbiFORZ1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 13:25:27 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36062387A0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:25:26 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 31so10326223pgv.11
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n+O4l98CKUL7yv4rRVYlrIx5OvopY+8TSKj5Ikkq3GM=;
        b=gghcg5nU3xACsIsovR9FpypGdUvez5exCrXgZBOdo7LpwjPJv4H/xILX5Hh5GSy5Vr
         l8kPxW9GmVc8Ue3y7TtcIORtJWI+zjA9PJn1NSCuqpbQulo3RUP2z0+bPiSRi3JDw73y
         nnGGTMuH1knVYujxOboX7OYG0H0m+9TaUpjcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+O4l98CKUL7yv4rRVYlrIx5OvopY+8TSKj5Ikkq3GM=;
        b=HteCqIHPH6GlN5HAmA8QWidvcJ2+FKvzS8QXWcM2XrCP/Q/WipQToxq+Ccqix59Ym4
         OgNfe/viwgXLMW5Mt8iGmF8USpQK+oGfCQkOwZ3l/HiNWCraZ8ZSUnV2M44DApYk3fIy
         wQTigiIKq9BFhAHkMPQtTEmt3Ushc8RinsBMtkeEH8dEMXYb4FPOfZ8wGDgRWX6w9s6q
         B27Hbe6C2i7cEiaJMQzbnZ6lg4P9fY82oGi+oG92bg1CpC7O4KgLHViwWBmjQBC9ckbS
         N4PkfmAEz9EXyrqwm6L2ex0RlvKX8nAetJ2kFP7QOrmSxtvFNP9ViaMOvvNqaCGMx7Wu
         rOtQ==
X-Gm-Message-State: AJIora9Dqqn4BaX9Z7qbhDKGI5sowkQTdVg7enb+rUioexn9Oh2DJBAw
        baDYbccSQrg4Ug+ZUkqBPrYKPNyHnjwSyA==
X-Google-Smtp-Source: AGRyM1tGCvTtzArk3W0yqf67r0nmmu/yAlWJ8zSXcnyuv01jrd8kkfDlmi9jTJeyYPFVjrKXkwE8LA==
X-Received: by 2002:a63:ff19:0:b0:403:7c60:ae96 with SMTP id k25-20020a63ff19000000b004037c60ae96mr725428pgi.466.1655313925709;
        Wed, 15 Jun 2022 10:25:25 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 10:25:24 -0700 (PDT)
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
Subject: [PATCH v4 3/7] dt-bindings: usb: Add Type-C switch binding
Date:   Wed, 15 Jun 2022 17:20:19 +0000
Message-Id: <20220615172129.1314056-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce a binding which represents a component that can control the
routing of USB Type-C data lines as well as address data line
orientation (based on CC lines' orientation).

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v3:
- No changes.

Changes since v2:
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- Removed "items" from compatible.
- Fixed indentation in example.

 .../devicetree/bindings/usb/typec-switch.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml

diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
new file mode 100644
index 000000000000..78b0190c8543
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/typec-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB Type-C Switch
+
+maintainers:
+  - Prashant Malani <pmalani@chromium.org>
+
+description:
+  A USB Type-C switch represents a component which routes USB Type-C data
+  lines to various protocol host controllers (e.g USB, VESA DisplayPort,
+  Thunderbolt etc.) depending on which mode the Type-C port, port partner
+  and cable are operating in. It can also modify lane routing based on
+  the orientation of a connected Type-C peripheral.
+
+properties:
+  compatible:
+    const: typec-switch
+
+  mode-switch:
+    type: boolean
+    description: Specify that this switch can handle alternate mode switching.
+
+  orientation-switch:
+    type: boolean
+    description: Specify that this switch can handle orientation switching.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: OF graph binding modelling data lines to the Type-C switch.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Link between the switch and a Type-C connector.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - ports
+
+anyOf:
+  - required:
+      - mode-switch
+  - required:
+      - orientation-switch
+
+additionalProperties: true
+
+examples:
+  - |
+    drm-bridge {
+        usb-switch {
+            compatible = "typec-switch";
+            mode-switch;
+            orientation-switch;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    anx_ep: endpoint {
+                        remote-endpoint = <&typec_controller>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.36.1.476.g0c4daa206d-goog

