Return-Path: <linux-usb+bounces-23289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6CA96242
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 10:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AAB218889B8
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 08:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6B61AA7BF;
	Tue, 22 Apr 2025 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nFgCO6mJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B39296155
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310613; cv=none; b=j1cwBTINBBle4tYKhO9kS92+Ydg+HxMnK4odQUK5vob1M22/tWJ9GZg8dyFE1F7bZJbodHi1QRLttWHJYkqFEJBnnV9HP9q6RMUYjXxEvyVREmoFpQOcs422beSa9rCnN5mNvpbPc1kFJiaWU9tLZuFlsx16MOBgIKeNDtZyCrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310613; c=relaxed/simple;
	bh=1T63O1OlCD9JKHcCQsup6IB7KusjwVZkSD/cwdn6G4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbZzSZLL6xf6YrLuMznAzLJi7oOI72Dnipcy1niM88MDZhXWWOhP9BkOY29ASMXJTUVX5tBfi4VVu/n2TdmBWftY9PgdZLeefVRWU1UaE6PsEIgZiFHHDzS+NT6YdxD0cW2UM5BWoVGOT72m/KP+D9XI1nnSkcwa3KItBysMExs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nFgCO6mJ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73712952e1cso4539323b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745310611; x=1745915411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfY1cqMOlZNgD6sYRBGuCkyMRj2zV1J4ZTJazFwtz0s=;
        b=nFgCO6mJNRou2JyEHaI0dgJR+8f4zPcDFyNcmqxwtdNVJ6r5AwAOAn5fkivajbK3UA
         eJ8gk0LjUpunDK11AOslJxhOn+8tpgyQGNx/ZM6OtTlK98S9RiiJywSJ6ixc4XopfSiQ
         FO8FjHQjXvvLvs7kxecL3Vk8XoWTvznZWxSHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310611; x=1745915411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfY1cqMOlZNgD6sYRBGuCkyMRj2zV1J4ZTJazFwtz0s=;
        b=AcYPJzkE8o8crXORUeL+Z/5suVbPUtc6zLi81VNOVKzE37Bc8X/dtUlh8uicR0Z4cb
         YC9Ps9q29JyC2Jskj/syj7o4f6hJCEFFJDDnRhecmVqL+AxJS82fK4grx9IE+Wq1nRTH
         DdsMd1j6iBAvwUc2YxZVjGNqp6IrMZSVbKZJdwXqFPmbtkga6aD2RoVJn3y2fMilQ72/
         yhgeW3eKKiuCjl+KJsUwwWF6RvNput6PoKsgFx1Pjm6lf7kowHNDPOuljpreJyqV8Z3U
         y3jiV0BuUML79FX7CZMaEjUloyz6HuHORCTYMRmTz0BJCkLs17ClLieDWKCy30aSMucB
         6ZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjvjVYuzhP7xNVX0yBThhZ9KAWP5ci7nrC7Ic4OS/BUjvJMXGb/cS+YZ50IOaZ3zZ3GeiIrQiC4PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA8irHNUvvlOIpQqOBXVJqmlpS5jTIlRKudBoLQzPskhW6hCew
	lm19hNq76WUXVQ0an2F5MKBPApd/oDpW0UJpW3jVaggaeSQ1Ktu0qK3gyFkSRg==
X-Gm-Gg: ASbGncv/nErCmwnbl0BXfc9506VWKsWEHdo+GJXQMAw5SMbXdh+sLtGmqleOn+O9Fw7
	rd8daREGDo4Oc9C/qnP0bJ9fO0cJACiOYUAVH/Mucr/vFsdGeT95EDvLnRNmWzrJPePhl60BI7d
	05VU1xLFE+x6SLZ6EuwTTy7GoqbHlNT5yJ65gSzyv0Xip20zSeRhrO3OE39hCdvph211AHk7ATQ
	jt7LWqgfcUs6zTZwHDDGGrhv+FshXpR4j184iFjXz1LCJoEeqN+Px5eVnPoOCDUetRuJILPvRDi
	v4hRg+5ZvtMP/b3HmnlaXzq5mmOQpvn3g9tXts1qnNGZa7gq/iE6A6BtMH4xcE60
X-Google-Smtp-Source: AGHT+IFrR0SjHePrcDyloZ0SNU3e0mpIkK38kOSsRhDb/AUvmUbpn+VO4MBvrhULKtBCtjCKg1/Cug==
X-Received: by 2002:a05:6a00:2e1b:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73dc1616d31mr21371230b3a.24.1745310611398;
        Tue, 22 Apr 2025 01:30:11 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:90d6:56e4:9d90:9df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm7993576b3a.49.2025.04.22.01.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:30:11 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: usb: Introduce usb-hub.yaml
Date: Tue, 22 Apr 2025 16:28:27 +0800
Message-ID: <20250422082957.2058229-2-treapking@chromium.org>
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

Introduce a general USB hub binding that describes downstream ports
and hard wired USB devices for on-board USB hubs.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v3:
- Remove redundant schemas

Changes in v2:
- New in v2

 .../devicetree/bindings/usb/usb-hub.yaml      | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-hub.yaml b/Documentation/devicetree/bindings/usb/usb-hub.yaml
new file mode 100644
index 00000000000000..5238ab10576308
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-hub.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-hub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB Hub
+
+maintainers:
+  - Pin-yen Lin <treapking@chromium.org>
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  '#address-cells':
+    const: 1
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the peer hub on the controller.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      The downstream facing USB ports
+
+    patternProperties:
+      "^port@[1-9a-f][0-9a-f]*$":
+        $ref: /schemas/graph.yaml#/properties/port
+
+patternProperties:
+  '^.*@[1-9a-f][0-9a-f]*$':
+    description: The hard wired USB devices
+    type: object
+    $ref: /schemas/usb/usb-device.yaml
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usb123,4567";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            /* USB 2.0 device on port 5 */
+            device@5 {
+                reg = <5>;
+                compatible = "usb765,4321";
+            };
+        };
+
+        /* 3.0 hub on port 2 */
+        hub_3_0: hub@2 {
+            compatible = "usb123,abcd";
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


