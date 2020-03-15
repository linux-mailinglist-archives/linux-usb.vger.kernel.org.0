Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70CF0185F60
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 20:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbgCOTQy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 15:16:54 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44309 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729112AbgCOTQv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 15:16:51 -0400
Received: by mail-pl1-f194.google.com with SMTP id d9so6882365plo.11;
        Sun, 15 Mar 2020 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QWPsdEuJoivN766vayf9ZE52PL5bRfQfO8yDnpnpf80=;
        b=YLGpToUOVh3x/T3ca5Ku8LUvtlGg/mn9uDKg38pRDzUwGgZXJb8tGa0GGOPvsWFdMf
         mZd5tqxB422axuWgaufL7EmQEjw5RQwVD9s3NzGvyfqMA4krbmIvAClbW2HX3kKJ2JMm
         CVP6iXWti5VDFOYIT2elJBcf8xMrAaIg2ufWPnwKfoXTjUiM/up7rMEJYlidVPjy5UEu
         QyKoKUR06GJ0assWVYuG8pjwzWQ7oMkR5ldrFRSvE4KL3Bfh/aoHmVkvEixds7fQQawa
         rqGIrCK9BOyWlfI61kycfL7SJvjPxBdD7XNhyOwOV4TcJsZIZeobTAKULDIoXyCBZYSi
         pSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QWPsdEuJoivN766vayf9ZE52PL5bRfQfO8yDnpnpf80=;
        b=QRu6PbrwYF7OWHgzQJ71DsyjFRuDp0QE7Q772ZjK+4naqKRKMNxYODzd4i9PlIqQea
         JtdJpouS5b3P8MLgrqZaFlZUlJiYvCSRUcymvzubYtQMPcKvOoH+KSill/3DRqMB8bw+
         N+L1dQ13G7zHq5s+3ztUJiBbwxeeJ83ZJcDy9pWC9KYA+Qy7NuimOjSRTWfzO1fZFsCw
         f3HeAx48TZbm4o8cx/6H9UIBhpmP4EqWi3OLGI69ujNu4g05sJbPwFXpMGwW/qMoF9XI
         vy+q+YnMBaOzpR7wFUYhWPE+aC6ceW20DURcuxwsFvvFk68X0hZE9leer/bg4n4KH+L8
         Nc8w==
X-Gm-Message-State: ANhLgQ3R+ntZ4VvmRMpETDYaKQYKCWHBicPisWt53GLXmg8BgKp7KLRN
        Frrv0ECOu6parRc0gaaqnZU=
X-Google-Smtp-Source: ADFU+vvc/zMCOFtXWvlFmafRLLAhKGqwy8p4BQG+HR/PLdDqKpEPagGalL4+6egi+jCXG4xF5oyHvA==
X-Received: by 2002:a17:90b:3742:: with SMTP id ne2mr21417380pjb.144.1584299809762;
        Sun, 15 Mar 2020 12:16:49 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
        by smtp.gmail.com with ESMTPSA id 13sm61431882pgo.13.2020.03.15.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 12:16:49 -0700 (PDT)
From:   rentao.bupt@gmail.com
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Colin Ian King <colin.king@canonical.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        taoren@fb.com
Cc:     Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 6/6] dt-bindings: usb: document aspeed vhub device ID/string properties
Date:   Sun, 15 Mar 2020 12:16:32 -0700
Message-Id: <20200315191632.12536-7-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200315191632.12536-1-rentao.bupt@gmail.com>
References: <20200315191632.12536-1-rentao.bupt@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tao Ren <rentao.bupt@gmail.com>

Update device tree binding document for aspeed vhub's device IDs and
string properties.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 No change in v2:
   - the patch is added into the series since v2.

 .../bindings/usb/aspeed,usb-vhub.yaml         | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
index 06399ba0d9e4..5b2e8d867219 100644
--- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -52,6 +52,59 @@ properties:
         minimum: 1
         maximum: 21
 
+  vhub-vendor-id:
+    description: vhub Vendor ID
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - maximum: 65535
+
+  vhub-product-id:
+    description: vhub Product ID
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - maximum: 65535
+
+  vhub-device-revision:
+    description: vhub Device Revision in binary-coded decimal
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - maximum: 65535
+
+  vhub-strings:
+    type: object
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^string@[0-9a-f]+$':
+        type: object
+        description: string descriptors of the specific language
+
+        properties:
+          reg:
+            maxItems: 1
+            description: 16-bit Language Identifier defined by USB-IF
+
+          manufacturer:
+            description: vhub manufacturer
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/string
+
+          product:
+            description: vhub product name
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/string
+
+          serial-number:
+            description: vhub device serial number
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/string
+
 required:
   - compatible
   - reg
@@ -74,4 +127,19 @@ examples:
             aspeed,vhub-generic-endpoints = <15>;
             pinctrl-names = "default";
             pinctrl-0 = <&pinctrl_usb2ad_default>;
+
+            vhub-vendor-id = <0x1d6b>;
+            vhub-product-id = <0x0107>;
+            vhub-device-revision = <0x0100>;
+            vhub-strings {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                string@0409 {
+                        reg = <0x0409>;
+                        manufacturer = "ASPEED";
+                        product = "USB Virtual Hub";
+                        serial-number = "0000";
+                };
+            };
     };
-- 
2.17.1

