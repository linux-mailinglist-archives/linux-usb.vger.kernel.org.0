Return-Path: <linux-usb+bounces-23290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4BFA96217
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 10:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43BE43BA674
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 08:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C431EF397;
	Tue, 22 Apr 2025 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CONSz473"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3329617C
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310617; cv=none; b=O9yJfaIiWVGIzKyIYq3T9Z6KKQ0VfUw/pg/EAS3/MOfqLJtSL/CSXCj7BEBBuipKGMMnqU6qLTcJI21BwEQAxogxUJ+83z00Jk1M5D7Pyy306j/lJWYd8EUNM4gMV8HuB2/S+oLXegkkrnAjPz7ClPOtJT/4ML4WFnxGUPmUeMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310617; c=relaxed/simple;
	bh=OLzKae4I998fNj/zk9Djh7y8ZWg4PpchrZAtCztxhu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iUQxW4e4zFOGK7/HUmjGMER2Q8ApsIB3z8jps1oLIXQrmar67y0F2/2Hvs3egnRcTTY5e6eDyQgvhMAAjDlXxEE+Wop0So/8Z0oPjlv/nDN7b6F16vyMLsstG+z/TxtTCmYIOBNujmuVi5/dugRPRP8cM4+p+A3S+7IsRYli37k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CONSz473; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22d95f0dda4so11433895ad.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745310614; x=1745915414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRLvv5HiEyH3iLEdmowlRjZc+EOHCnDKoYX5NsqMYbM=;
        b=CONSz473HK+jFEPqoN/PAEmGGdoYliUcx604dVbz6E8IckXBgnUXeIvfmjbxHtLu4h
         pMpdkfbF+z7s5eV56TlaKqOJLzfJsGt9vxeiSz7tMZ4qm4Nih3TeHoQRjQEPw817Qp2J
         bKkn5oL8xMttlnTFSEnLsM9bdiBHb3iIR/ESU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310614; x=1745915414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRLvv5HiEyH3iLEdmowlRjZc+EOHCnDKoYX5NsqMYbM=;
        b=tHTm24GzmOiieadshcaTJuVZtdsiMa1zSIv/CyeP5e1+WqQE7yK4aqyugEIWd+UL9f
         TX5X2zyg97ukOgzNSTcFFi50DreWGCTxzuygVPHYSPn0xKdiocISSGHK632YbvPrUWRq
         xSsiSY4An6uZOZUy4Gio7xuwFChcxoTPPPJR3YAEwvc8Mhi+jPBLrgNPVcYjYuWKyu5e
         lWoYcdJKUvZDc65ViPuXnnoYgH3V6KgfzizjgEY+WDh6SMhqSWGX3o3imXG5iE73u+rD
         d48KmkF3P4DHWjxVnDz90fBhqjrSzZUCvhrIWPKBzRo+jAC9BhmsDMeIMSHvVf72Fz3H
         YU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtPMS86PSlptV+C+zy/hah6O9B2d9jN/RgbGxEGGPxxQ4VKIlq87uQVUlbu5elWMlE5FAh/mtQzsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKz2sTAho0bSKUcIW5rAmiJ5wVV5i+xqvuYQ4hiRVvufAS4tJ4
	X51W3RVGDk0kQu1Vjjs+3Qm5hxYk/eZ9Nx9eBKA0U4yvVJu2ysapOs+wI1BDmA==
X-Gm-Gg: ASbGncvZK+nyn0aGGXMTPymHNIcGjNdn79ODE+hs7OPRe5/SW+h4SzU7zyYFTvVzwJJ
	NNnEg5GQveANN9zaUhSOFe+qjNoj0nfFHDSMgj52L4/9/Wm7HZWzmG/5WY3tIG/ucg8zuC++Hfi
	yEz4c5ip0QtStDegV4HbJW0HXSKbTqlRVOE+oXVm+aAlM1tcqAQ42G+tprm47SS4/U5/q9sw9BZ
	Hj9xJdpbrT/45BMG654bG34zOaNOG8r3m2NngUelSwtp8piyI/Q7It5Ec1tL57pXhbr7i93fEMg
	/CJMLdIm5Gnwj+TxXkIxTTQWiFsRfVi6VENoVpa+IsOe7ifcTGFz5rdv+AikjMQ3
X-Google-Smtp-Source: AGHT+IGFVBZMSXezmJu45/qaFcB/uHZsgGdMKJG/2+9zUCCtVU6t3oJE9FXRAtpFbxEhMSdiz+OzHw==
X-Received: by 2002:a17:902:e5cf:b0:220:d078:eb33 with SMTP id d9443c01a7336-22c536195bdmr221367945ad.36.1745310613817;
        Tue, 22 Apr 2025 01:30:13 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:90d6:56e4:9d90:9df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm7993576b3a.49.2025.04.22.01.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:30:13 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: usb: Add binding for PS5511 hub controller
Date: Tue, 22 Apr 2025 16:28:28 +0800
Message-ID: <20250422082957.2058229-3-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250422082957.2058229-1-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parade PS5511 is USB hub with 4 USB 3.2 compliant 5Gbps downstream(DS)
ports, and 1 extra USB 2.0 downstream port. The hub has one reset pin
control and two power supplies (3V3 and 1V1).

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v3:
- Remove redundant schemas
- Update the schema for downstream ports and devices

Changes in v2:
- Inherit usb-hub.yaml
- Fix bindings to reject port@5/device@5 for 3.0 hub correctly
- Minor string fixes

 .../bindings/usb/parade,ps5511.yaml           | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/parade,ps5511.yaml

diff --git a/Documentation/devicetree/bindings/usb/parade,ps5511.yaml b/Documentation/devicetree/bindings/usb/parade,ps5511.yaml
new file mode 100644
index 00000000000000..10d002f09db8af
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/parade,ps5511.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/parade,ps5511.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS5511 4+1 Port USB 3.2 Gen 1 Hub Controller
+
+maintainers:
+  - Pin-yen Lin <treapking@chromium.org>
+
+properties:
+  compatible:
+    enum:
+      - usb1da0,5511
+      - usb1da0,55a1
+
+  reset-gpios:
+    items:
+      - description: GPIO specifier for RESETB pin.
+
+  vddd11-supply:
+    description:
+      1V1 power supply to the hub
+
+  vdd33-supply:
+    description:
+      3V3 power supply to the hub
+
+  peer-hub: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@':
+        $ref: /schemas/graph.yaml#/properties/port
+
+        properties:
+          reg:
+            minimum: 1
+            maximum: 5
+
+additionalProperties:
+  properties:
+    reg:
+      minimum: 1
+      maximum: 5
+
+required:
+  - peer-hub
+
+allOf:
+  - $ref: usb-hub.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            enum:
+              - usb1da0,55a1
+    then:
+      properties:
+        ports:
+          properties:
+            port@5: false
+
+      patternProperties:
+        '^.*@5$': false
+
+examples:
+  - |
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usb1da0,55a1";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            /* USB 2.0 device on port 5 */
+            device@5 {
+                reg = <5>;
+                compatible = "usb123,4567";
+            };
+        };
+
+        /* 3.0 hub on port 2 */
+        hub_3_0: hub@2 {
+            compatible = "usb1da0,5511";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                /* Type-A connector on port 3 */
+                port@3 {
+                    reg = <3>;
+                    endpoint {
+                        remote-endpoint = <&usb_a0_ss>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.49.0.805.g082f7c87e0-goog


