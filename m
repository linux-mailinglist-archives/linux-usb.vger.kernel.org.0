Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25DE3541B82
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 23:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381961AbiFGVsX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 17:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381735AbiFGVrg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 17:47:36 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6642383D1
        for <linux-usb@vger.kernel.org>; Tue,  7 Jun 2022 12:08:03 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d22so15589275plr.9
        for <linux-usb@vger.kernel.org>; Tue, 07 Jun 2022 12:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sFse0rFSlJ0YYavNaa4y03OPGbaMuJtoNAgCQ6a6W8c=;
        b=egqwCoKZqBXVLuKBc5pBZJMLx1Er/E5gqJBY0WIV+gpES8qbQTYV1aLLMoL19SXphc
         lK8Gh8uUsJd8XfsnR+jIcEghA1Fey7gwOw5VGvdRT3NcD8yrHBZpl106Q8KajEC6vdqb
         v4+28bPMXQbxefQML/1CAGdjIvco9R8BEzTQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sFse0rFSlJ0YYavNaa4y03OPGbaMuJtoNAgCQ6a6W8c=;
        b=GYHOepBeIZFPQGUKLWcUDRUsQFuX3F71xCBKEOrP+SCutakvoehtqf02GZHrYLA3KF
         Kyrt7f9UW7zqPPfSHKVloVTWNiDR0407bAusWrOKk9ZEiUkUwGa+05sEhtwd4hGVrogJ
         awxZIheTxqI21W1kw0K79ow0RftYwhVGt2pAk7BvNPpf0pW3Cyh72EMHVS5ZDVv8m5oZ
         MseDjqXwYjS1QrqGswLVGaXorZFZ6y5pRdkRr/9WacNPDuEF2QoactNJ/RfLvAp2oKJE
         x70xXmn/Xj8VQKXt3WLrTE8APvsPPj5RQmhgzbTG+8dlPWI9dUGBPI05uV0/otLasarz
         P/eg==
X-Gm-Message-State: AOAM532j7eqdiwc2rntF44kfW5+jX4o23MtrpyUzPUXhuKym9q9raT9N
        sKzjYlo/kop2pi4v3fowueIMDA==
X-Google-Smtp-Source: ABdhPJxRnlpJtnHj8QUvVU0+Lwk4T4sd6PIecvJFEsj9C43AuOQ/lHFYgRv7vIv5lWTUWerChJvSkw==
X-Received: by 2002:a17:90b:224e:b0:1e6:8ae1:8e1a with SMTP id hk14-20020a17090b224e00b001e68ae18e1amr30682456pjb.59.1654628882986;
        Tue, 07 Jun 2022 12:08:02 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id g29-20020aa79ddd000000b0050dc762819esm13236084pfq.120.2022.06.07.12.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 12:08:02 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch support
Date:   Tue,  7 Jun 2022 19:00:22 +0000
Message-Id: <20220607190131.1647511-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607190131.1647511-1-pmalani@chromium.org>
References: <20220607190131.1647511-1-pmalani@chromium.org>
MIME-Version: 1.0
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

Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
alternate mode lane traffic between 2 Type-C ports.

Update the binding to accommodate this usage by introducing a switch
property.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 .../display/bridge/analogix,anx7625.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 35a48515836e..7e1f655ddfcc 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -105,6 +105,26 @@ properties:
       - port@0
       - port@1
 
+  switches:
+    type: object
+    description: Set of switches controlling DisplayPort traffic on
+      outgoing RX/TX lanes to Type C ports.
+
+    properties:
+      switch:
+        $ref: /schemas/usb/typec-switch.yaml#
+        maxItems: 2
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
@@ -167,5 +187,41 @@ examples:
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
+                              remote-endpoint = <&typec_port0>;
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
+                              remote-endpoint = <&typec_port1>;
+                            };
+                        };
+                    };
+                };
+            };
         };
     };
-- 
2.36.1.255.ge46751e96f-goog

