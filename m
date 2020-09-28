Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2040F27B2DA
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 19:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgI1ROA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 13:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgI1RN7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 13:13:59 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9498FC0613CE
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 10:13:59 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b17so1017830pji.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6LRa3EvjxYw5aX67BhkFrS+Y1RXh3J3rTX/vMwJ4fBY=;
        b=fUmFEKMPipnra4fmuQoqW2QD7diKt59CdvKRgJUQsIz3kme6UzweIUnkraR8O8Dxe+
         Lnj32eVJfWh211rHwYWM214y6149q4KKfvonKPYpPw0+E2VmREcBHn9tBfuDTm6HxMxk
         DnPAvbL8Hr7mCPlxxhDX5GFz9Ta8qYSDLN2lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6LRa3EvjxYw5aX67BhkFrS+Y1RXh3J3rTX/vMwJ4fBY=;
        b=MbICtrVDLzvj8cWV9X9HjdcF8i6DOYw+NjpuVr6Vh3UohRsTn0BYZJJhX1ZHBXnank
         bVk3HB9NmB7wWziMbC0UMTgsKWR2JHPoo0/cZlPyoGyh7QcQq0EZiYOPh0wSTLHiciIh
         sEFe2mBh8iZNry/a4OUwOl/iyRp2j610y9NoOZHTP7uSnbJSPLRuyVUhHxGQS2iBDe/s
         Nj2sZ1bOkqInqlyapkgOQ9doKNiFPHUITMuDzRjH1O3ZpXDDuTgtNcrugb7SSn8R3U1k
         roC7L6rAFSazw72iobB6haVb7OrUM0kLN5s/LXQU7hn9nARTaaKp9hWsGRoT9j/sLpON
         UnnQ==
X-Gm-Message-State: AOAM533CBzFyQom0F7K3rx1QLfuNx+j1nA4s0o9Ll6G21bYSGt6jZEOx
        lXBIrfMRbTihhHRmUGJENvbfeQ==
X-Google-Smtp-Source: ABdhPJyy/zNJpHFnMQFB7JuPIm4GDw3cJVD1GeygsRruKUtVR+7mZzv+HgAc6/mIiMlJZgHS/5Q9Wg==
X-Received: by 2002:a17:90a:ca17:: with SMTP id x23mr263620pjt.96.1601313239051;
        Mon, 28 Sep 2020 10:13:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id gq14sm1869082pjb.44.2020.09.28.10.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 10:13:58 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 1/2] dt-bindings: usb: Add binding for discrete onboard USB hubs
Date:   Mon, 28 Sep 2020 10:13:54 -0700
Message-Id: <20200928101326.v4.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Discrete onboard USB hubs (an example for such a hub is the Realtek
RTS5411) need to be powered and may require initialization of other
resources (like GPIOs or clocks) to work properly. This adds a device
tree binding for these hubs.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v3)

Changes in v3:
- updated commit message
- removed recursive reference to $self
- adjusted 'compatible' definition to support multiple entries
- changed USB controller phandle to be a node

Changes in v2:
- removed 'wakeup-source' and 'power-off-in-suspend' properties
- consistently use spaces for indentation in example

 .../bindings/usb/onboard_usb_hub.yaml         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onboard_usb_hub.yaml

diff --git a/Documentation/devicetree/bindings/usb/onboard_usb_hub.yaml b/Documentation/devicetree/bindings/usb/onboard_usb_hub.yaml
new file mode 100644
index 000000000000..c9783da3e75c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/onboard_usb_hub.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/onboard_usb_hub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for onboard USB hubs
+
+maintainers:
+  - Matthias Kaehlcke <mka@chromium.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - realtek,rts5411
+      - const: onboard-usb-hub
+
+  vdd-supply:
+    description:
+      phandle to the regulator that provides power to the hub.
+
+required:
+  - compatible
+  - vdd-supply
+
+examples:
+  - |
+    usb_hub: usb-hub {
+        compatible = "realtek,rts5411", "onboard-usb-hub";
+        vdd-supply = <&pp3300_hub>;
+    };
+
+    usb_controller {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub@1 {
+            compatible = "usbbda,5411";
+            reg = <1>;
+            hub = <&usb_hub>;
+        };
+
+        /* 3.0 hub on port 2 */
+        hub@2 {
+            compatible = "usbbda,411";
+            reg = <2>;
+            hub = <&usb_hub>;
+        };
+    };
+
+...
-- 
2.28.0.709.gb0816b6eb0-goog

