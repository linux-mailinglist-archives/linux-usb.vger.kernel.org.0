Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D75354773
	for <lists+linux-usb@lfdr.de>; Mon,  5 Apr 2021 22:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240702AbhDEUSb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 16:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235370AbhDEUS3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Apr 2021 16:18:29 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55AFAC061788
        for <linux-usb@vger.kernel.org>; Mon,  5 Apr 2021 13:18:23 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id l123so7354042pfl.8
        for <linux-usb@vger.kernel.org>; Mon, 05 Apr 2021 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=USPccDuBErsrLDvo9xZKt8gJcCaFBKn/zm39axGDpig=;
        b=ivLJ4kNskyKx3gkIq2Y10JTtg5e54/ou8XBMfsszwFNQXPnljfa4yyZVeRoGRzDekH
         3SgUqx8dcQdPgszpsgfUL8hmwz+nJWc8rCE1v7DjnJW/6uvnuncVeh4F4q8MCzUse59U
         31y1IQIvRFPM0Sn76meZ5DPJL5YE2S5HqOJ+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=USPccDuBErsrLDvo9xZKt8gJcCaFBKn/zm39axGDpig=;
        b=BIwyx2xuVTgHvQDo6ULLv5ER7SAeY/GkwM9cbuaC1SZRA6k9GxLf7Z9AoIpNw5BMwf
         3ByeLKrkzqgPjpPWETUT5ETfNko85PozzwUmBDwDarqi73G7PO/n77sf4H9xcRJfQj2E
         zYvfvUMY26cFxt0KtqQZ182/QEkR8qx1rqnVGAT+AvpYt+bz1eE4Fx2QHlusUM1mtbQq
         wtkyVlRY3+4bnvX2Z4Geu0pn6Va5+QJub4ySe3cQ0N3Mb4FrionC33Hx7fBPF5IyNGB4
         Gdnj6bbLreOxw8Pss+AP1TTT7rntTzIFfV6x1860D1oAyv3YbsRvI2AOdAtYfGdOU/wY
         LxJg==
X-Gm-Message-State: AOAM531PLaWwpkgc62N8VGJOHiRDBMdAA6E7cyrigVQoSSBdRIsflTRZ
        v5H8GJdh+zRopFPtTQTzJsRQ5g==
X-Google-Smtp-Source: ABdhPJx+DcDq6VtoFycad7CXCpXE557eDq6JXRjb1GikVprIVbmfbqFB/Og3krB15TwhW9gLeDKOxw==
X-Received: by 2002:a63:338e:: with SMTP id z136mr24333155pgz.115.1617653902952;
        Mon, 05 Apr 2021 13:18:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:455e:b8cf:5939:67da])
        by smtp.gmail.com with UTF8SMTPSA id v14sm263916pju.19.2021.04.05.13.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 13:18:22 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Peter Chen <peter.chen@nxp.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v6 1/5] dt-bindings: usb: Add binding for Realtek RTS5411 hub controller
Date:   Mon,  5 Apr 2021 13:18:13 -0700
Message-Id: <20210405124900.v6.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210405201817.3977893-1-mka@chromium.org>
References: <20210405201817.3977893-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Realtek RTS5411 is a USB 3.0 hub controller with 4 ports.

This initial version of the binding only describes USB related
aspects of the RTS5411, it does not cover the option of
connecting the controller as an i2c slave.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v7:
- added type ref for 'companion-hub' property

Changes in v6:
- Realtek binding instead of generic onboard_usb_hub
- added 'companion-hub' property
- added reference to 'usb-device.yaml'
- 'fixed' indentation of compatible entries to keep yamllint happy
- added 'additionalProperties' entry
- updated commit message

Changes in v5:
- updated 'title'
- only use standard USB compatible strings
- deleted 'usb_hub' node
- renamed 'usb_controller' node to 'usb-controller'
- removed labels from USB nodes
- added 'vdd-supply' to USB nodes

Changes in v4:
- none

Changes in v3:
- updated commit message
- removed recursive reference to $self
- adjusted 'compatible' definition to support multiple entries
- changed USB controller phandle to be a node

Changes in v2:
- removed 'wakeup-source' and 'power-off-in-suspend' properties
- consistently use spaces for indentation in example

 .../bindings/usb/realtek,rts5411.yaml         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
new file mode 100644
index 000000000000..b59001972749
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/realtek,rts5411.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for the Realtek RTS5411 USB 3.0 hub controller
+
+maintainers:
+  - Matthias Kaehlcke <mka@chromium.org>
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - usbbda,5411
+          - usbbda,411
+
+  vdd-supply:
+    description:
+      phandle to the regulator that provides power to the hub.
+
+  companion-hub:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description:
+      phandle to the companion hub on the controller.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-controller {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usbbda,5411";
+            reg = <1>;
+            vdd-supply = <&pp3300_hub>;
+            companion-hub = <&hub_3_0>;
+        };
+
+        /* 3.0 hub on port 2 */
+        hub_3_0: hub@2 {
+            compatible = "usbbda,411";
+            reg = <2>;
+            vdd-supply = <&pp3300_hub>;
+            companion-hub = <&hub_2_0>;
+        };
+    };
-- 
2.31.0.208.g409f899ff0-goog

