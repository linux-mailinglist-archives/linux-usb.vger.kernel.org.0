Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3BFC5453E8
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 20:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242704AbiFISQe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 14:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245184AbiFISQd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 14:16:33 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95820262E2B
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 11:16:31 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id i15so4115619plr.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 11:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sovrs+mq8Q/Ap++aH+MjECZ+lkKpfvFBf2CG7NL+qc0=;
        b=ljGcCwBNKuZfCUmbieLH3JlrAHhYdwCrb3aqMfe+5IIZtxQfN9jCdjc0NtdfUhLwkG
         g4jThX8SzgLeCTdj/6FSiaxG7Zr2SjdYxJN7xzQSjkaK8P+iO3EZ2TDbyQ0UOgZYKQLW
         HrSCybyHiKNV1Iezy+bJuKEBFqYZAWykJrvoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sovrs+mq8Q/Ap++aH+MjECZ+lkKpfvFBf2CG7NL+qc0=;
        b=0P1lSgST5TN1jvHNfif36VH+0XvqfWXgmIDA+cHpYyx1mZJYZxlJi0I2xCdosa8UZ9
         tlXIllAxWyEUlAJRGWglmouvS5ZiphRnLSTfJRl3+OancZFSFU9AbXnBYN/KJvnoISEP
         +gdhi7k4iXbk7LqOWB7PDlvky7OcWEXx54jzJisc2iKFaNWVEVh53l/V3lidN5pU7oqV
         mMBQfkAzpfGiptqgBYedLhpQnw0k2KOLkGibNRnoHQtv2yQAZjeB/5AYq66EbTXXHAlE
         IFaBAO8XtBCPm0SbHMctwopkl0t/4wkSUzdZuSWzwZMNtja+YLh9L6hjPd6Lu86ED4J9
         xzlQ==
X-Gm-Message-State: AOAM533V80r4vqAMGwnyx5k5AqY+SDwOXwegBc6dTB1BlfzCw4mB0zSY
        PGDDj4tzxt2RK7P54gsH7T5tbw==
X-Google-Smtp-Source: ABdhPJxawWaDeR4dAEkaF6ko7UcSdYYyuB7X9Fr3Dw7YujettIghdwLeRH6ETRXZsafTAXCc4rdvxg==
X-Received: by 2002:a17:902:8c93:b0:167:879d:6670 with SMTP id t19-20020a1709028c9300b00167879d6670mr18912302plo.31.1654798591093;
        Thu, 09 Jun 2022 11:16:31 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id r14-20020a63ec4e000000b003fb0354c43asm17728049pgj.32.2022.06.09.11.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 11:16:30 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
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
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>, Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 3/7] dt-bindings: usb: Add Type-C switch binding
Date:   Thu,  9 Jun 2022 18:09:42 +0000
Message-Id: <20220609181106.3695103-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220609181106.3695103-1-pmalani@chromium.org>
References: <20220609181106.3695103-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce a binding which represents a component that can control the
routing of USB Type-C data lines as well as address data line
orientation (based on CC lines' orientation).

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

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

