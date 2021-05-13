Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8592B37F469
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 10:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhEMItE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 04:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhEMIsx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 04:48:53 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B868CC061761
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:47:42 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id r12so553090wrp.1
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/MUoPEgr7S+EN5adm1Kdmts83A8Q5i0Lvytv6ggPvJo=;
        b=anHDEWhiidAK7u6uu2r4URyo2aTE0RiQ676a9+8uYRxJARa/9h5sRZ0eR31pYyFtu+
         IaeVseQYmTm5RjkyWxDyrjzT54kuS+VYahYXVKQ1hsW8E0yF++H43LCXODP7c8mc3JEH
         nIjmiJKfvKd0p/0ROifdqFFnRT6rV4rbihoE9l8vCG2WNsIHJvMx4kSup9JaEVPntb1R
         LJsVNb3FnMUOlFTiFDRZgigPngpNoyEp2QsMKxqB1+04EVj24oJOrvjApt0oj4Plzvd0
         qXpRLN32ZsVd5rvaCtWNIDDB6YRO4X6ri1B4/wjLQYtz8Sca5ZkIBWopaQgHvo6prt/8
         V9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/MUoPEgr7S+EN5adm1Kdmts83A8Q5i0Lvytv6ggPvJo=;
        b=AoazCnlQIzjk3oVlSr7P+oXj3LxAcnfyPDNljZe/+s1lv8cS1dhFjIIf99yI0nHUgh
         mrbzQiNNnXGtc4RidsnIEY3f0H5g6sRTHlJIhhKHg5qX1vxFw9vQA/3ny9+b+QI7z0H5
         S3jzwTiOkf5X431WYbtpBOUfBizvHECHvgKIFvqrL/STsyXld+whh4YmeKW3XO8O0aqV
         cTKP/JKkR/BIS0wIYkzHwjI3Yxe4YpD2Qg3rYoXkgYBbV6G0SctgQKXNU/+ajRdTJVqU
         NGgqP5PiKAnFnmtDvrVgpVvXSas6YDGSBHrGqXfUQL1HVRQRIz/kQnZ+9dUHFi2/2ugg
         4ffw==
X-Gm-Message-State: AOAM531CzDC1OqX0m4xLPYGfi0BuC2/6XkLaucjP32B9fmOQFVEDpbnu
        dEuLmdGhE/ttN5Sn4iWuYtaCFQ==
X-Google-Smtp-Source: ABdhPJwWDrbsBfoft1lrfWJvUXpKZFyffzVMFZMJUge7/zE1HowR6RojbZFsConrehjTBMK2atx2pg==
X-Received: by 2002:a05:6000:2c2:: with SMTP id o2mr17681444wry.398.1620895661505;
        Thu, 13 May 2021 01:47:41 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h15sm1730282wmq.4.2021.05.13.01.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 01:47:41 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v4 8/9] dt-bindings: usb: nxp,isp1760: add bindings
Date:   Thu, 13 May 2021 09:47:16 +0100
Message-Id: <20210513084717.2487366-9-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513084717.2487366-1-rui.silva@linaro.org>
References: <20210513084717.2487366-1-rui.silva@linaro.org>
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
 .../devicetree/bindings/usb/nxp,isp1760.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml

diff --git a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
new file mode 100644
index 000000000000..a88f99adfe8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
@@ -0,0 +1,69 @@
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
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: Host controller interrupt
+      - description: Device controller interrupt in isp1761
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: host
+      - const: peripheral
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    usb@40200000 {
+        compatible = "nxp,usb-isp1763";
+        reg = <0x40200000 0x100000>;
+        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+        bus-width = <16>;
+        dr_mode = "host";
+    };
+
+...
-- 
2.31.1

