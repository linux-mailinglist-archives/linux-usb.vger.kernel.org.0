Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E5A37A29B
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhEKIwe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbhEKIwc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 04:52:32 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF79C061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:24 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id y124-20020a1c32820000b029010c93864955so743323wmy.5
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2YWjRqJN4fXNtvBK3pOJG8ZNsA1w+vwd3827gzQ4Yjo=;
        b=erN13O+9LeR5cuMLeedemjXBpw54UpWUp4ltuZ7cW4McHrTGhOkoTEZhFzjQdZ7hGa
         UcqdQG0hBKMrveP9fBYqFZiZbbPUcuHlQ0kstMNRHbx0NwoHbl1a0UDVOQlKGoF4ml5S
         ADPaiatFaHKzicdmDVxEYOXfj3n/bQhSnXcrCodumDMPMWO5uGcV+dnJ/tYimmW3l3Ua
         tieaNWSLREEy7Lg+VkhcP/qJ7IZW13GsAUz8XB432WdlVPIgwUPxONjxmcJG99Zo/8Zd
         DPO6k6zRyXV3MgBOmzVwcM/XOwtHNl8ocoqSjua7HTAUoSGsYmpFS0FWYfYtMKh4FCH9
         W8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2YWjRqJN4fXNtvBK3pOJG8ZNsA1w+vwd3827gzQ4Yjo=;
        b=UeiDiQg/W4/NdDMJEvSAKXCjarucYsfyFJOdr+YqYeU1S/MYgY/+CtO9+4WKsgaRHo
         P97gUiheOsx9QFd3X8Nnot7x3CXFc75rcaLXRmh5QxZR3vVwc8U+gOEAcS/28GEM4yAE
         kUcxkBeQt87NGz9eB3u00lif36YrxI+3FiLM4Ir2UOYVw66ndikt7nMT+zRAHyLSiUcv
         LBEKWOygvfQz/aJLVi19WBOzkBd55wVclvXiZScmEDuKcVBsAeLhIPHnAVxfx+b9hwB6
         7Zadm5fGPfbt9qUF3KW5gAqXfJQRvuMKuvMe4DEqgBQiVZ4Xwl48u2hRxMReqqErQJgm
         o/Tg==
X-Gm-Message-State: AOAM533ohGAx1y4sdG2SGTmU+Q90AwB4R29x9erpC0kLrIRO6BUF3+Kh
        ho1y+2z6x2TXFlIGTegY60aDdQ==
X-Google-Smtp-Source: ABdhPJzTQLOHAAv8cJLYrWnXrLsL8uxDFYtNHOvWSJ+sdXhbGUBIZgU3JuGOK/LVJKUsaUshrS4bmw==
X-Received: by 2002:a1c:b342:: with SMTP id c63mr4133218wmf.179.1620723083231;
        Tue, 11 May 2021 01:51:23 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j7sm23042980wmi.21.2021.05.11.01.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 01:51:22 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 8/9] dt-bindings: usb: nxp,isp1760: add bindings
Date:   Tue, 11 May 2021 09:51:00 +0100
Message-Id: <20210511085101.2081399-9-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511085101.2081399-1-rui.silva@linaro.org>
References: <20210511085101.2081399-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The nxp,isp1760 driver is old in the tree, but did not had a bindings
entry, since I am extend it to support isp1763 in the same family, use
this to add a proper yaml bindings file.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../devicetree/bindings/usb/nxp,isp1760.yaml  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml

diff --git a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
new file mode 100644
index 000000000000..0d76529e9662
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nxp,isp1760.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP ISP1760 family controller bindings
+
+maintainers:
+  - Sebastian Siewior <bigeasy@linutronix.de>
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |
+  NXP ISP1760 family, which includes ISP1760/1761/1763 devicetree controller
+  bindings
+
+properties:
+  compatible:
+    enum:
+      - nxp,usb-isp1760
+      - nxp,usb-isp1761
+      - nxp,usb-isp1763
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  bus-width:
+    description:
+      Number of data lines.
+    enum: [8, 16, 32]
+    default: 32
+
+  dr_mode:
+    enum:
+      - host
+      - peripheral
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    usb@40200000 {
+        compatible = "nxp,usb-isp1763";
+        reg = <0x40200000 0x100000>;
+        interrupts-parent = <&gic>;
+        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+        bus-width = <16>;
+        dr_mode = "host";
+    };
+
+...
-- 
2.31.1

