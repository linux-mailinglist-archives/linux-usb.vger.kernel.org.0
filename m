Return-Path: <linux-usb+bounces-32165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F77D10577
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 03:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DE0A305B1F0
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 02:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F273033EA;
	Mon, 12 Jan 2026 02:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="HsCjhaGy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D492A2F691C;
	Mon, 12 Jan 2026 02:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768185006; cv=none; b=jD/kxFMH21+rv4TTzSY8QBccfZSsYZZJVAHsBbfKxT7fyV/L/03V1G+FXxO47YYQog6Q7hGyQocmciAkMWAej0DRUB9At/clwl3Lv4dVHkrzf0CeU0lUihIzcoQSh6GeGGTdOeycAFlYAQ+wR+SrbWm+vyhIGEjNsxtZNRKyAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768185006; c=relaxed/simple;
	bh=ZUk0XCqrPTM2BxD4GagntJD2YihLggmTuoqrB2vQzCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=CZZw8JWz4MNNsHAQC0KKX4+AF7vYIFg5d/EZEtx2M18v5UA4YuoDsUW8WcUihXfV36s/8PNxICyXXegyQp0WHQG4o2OfIC68Rnvi7zBQ9ABDNvi6aEOPsCkL59Tc7YRv8kmDcJYgwdNd4rwCsY4mJI6nwSARKiLllhecTwyZAWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=HsCjhaGy; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768184919;
	bh=R9TYb4gWx4pQMa+mSrqRnpOcGO3Ou10FWe02WnyGdtE=;
	h=From:To:Subject:Date:Message-Id;
	b=HsCjhaGyq6iSWk0sh0vZVCJoTk+47MpM91l65NhLqjRXbYHzokt2NwAgPpb51cdgv
	 3OWzl6APzUt/iJbkvDxfDr9XLs43Cqbuo7gd7/lws6y6rGVsqN1aQGo1xlS7m+S1Bj
	 4LvoThSC97EUBUF0fUP12BkmDJz8HdYDDRnMBPUY=
X-QQ-mid: zesmtpsz4t1768184918tfa46568f
X-QQ-Originating-IP: NfTxhgrGshMWgayL2mvvN7B9ABsVR4W9bWkJBwKMPOw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 10:28:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7953789143671575021
EX-QQ-RecipientCnt: 23
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Hsun Lai <i@chainsx.cn>,
	John Clark <inindev@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: usb: Add binding for WCH CH334/CH335 hub controller
Date: Mon, 12 Jan 2026 10:28:21 +0800
Message-Id: <20260112022823.91-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260112022823.91-1-kernel@airkyi.com>
References: <20260112022823.91-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OX/+6nY/vs4TKOH7OjLM9IBHihBjqbrPr+6EC9hyLD721j9ZGGsnAEDc
	yFGcGiFe9VIjeDGYLtKpGKDejqqhxMR9AT8CJAULS0DPj31tYnM30cWoYAWuBdtJKHYIGqp
	p6hFq+m/bMx5iMLk+tE8MPXxopV9E+WP8FlxwU+VlE0PtTlKCzsIxT0lKnlwS5l5C+LfLZr
	dll5tYy9tijzoG2RRh2R8VWdKccXsz3Qw+8Xhk2ZNTBZCv35iRMqUoZqwTUDNzbtJ+dCtTK
	eDmxlbJGg9PyY8Q1xMGk4xvZ1C04eUXmgaFVPgy/oz7ATVJD7CAWkUzZ/3F0jtUk3xfWdpR
	aag5M2jp4Sk617nkw2G8uSLOKas9b5gyLX1ia6tZ4+Q8HUom/qHMvu7ANk2BfpCrr03qys7
	to8oDbAL6DRsas8gyhvc2nJUZRViU0ebN+gnscFld6Jlg86fRqPsMZd/7S7rO4duJJOLJiT
	v77YzMU3fEzUCnj+eUvjSNRExuA0QU7+pI4REu/MzoQf+P01gJVZ8BOrXFaGXuxgWSDb1/d
	l3zsjLW8qRBSfzD79jZF8JQ81+ZEzCnU5LQcZkkMI34QNtNUb/Qz4fAv4m7Yyhbqm8gOHAL
	cKci1HKLhIFZ/xGJfQuUUQUvDFfVdAWTXfn9QZ9thL5YzCG8EFn8ZohJNCcpr0KKreroMXa
	UB2BPXlFCJHGsbJuceHnMg6WeN6T8yB0kItZczhusPMUMH+Zc8GCbH/cwt8E8bIlhHJaEMy
	tgtGPOvO8Fy3VEXPimTVjRb1+0dJ0CVUmjaTerRKinroiFpzyHk6Bq886S9nT6gtoUsVYpp
	Bu4Kz/+z6P6pTbj72E7XUD+YgM4wFTuv9uy0D+lh/cVVfJSYLSKYVzY5tSIfpLyOAJXzNA+
	rZzIvVYP8A6VxhMjEyQTH1oFQx4vEh+ef+syQLnXiNadigaRe/0A17225QB9O7lvl/GzXxH
	fVjse/yZ2VIMmeUVwc+9BN+C70Km1YPxuU8dVqDVIiWC9mFy28QQw1VVTRpF3uV8THFJs0+
	TtHNsyh2qOVZEonWo7V2muwbD9nmo=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The WCH CH334/CH335[0] are USB2.0 protocol compliant 4-port USB HUB
controller chips, supporting USB2.0 high-speed and full-speed for
upstream ports, and USB2.0 high-speed 480Mbps, full-speed 12Mbps and
low-speed 1.5Mbps for downstream ports, supporting not only low-cost STT
mode (single TT schedules 4 downstream ports in time share), but also
supports high performance MTT mode (4 TTs each corresponding to 1 port,
concurrent processing).

Add a device tree binding for it.

[0]: https://www.wch-ic.com/downloads/CH334DS1_PDF.html

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml

diff --git a/Documentation/devicetree/bindings/usb/wch,ch334.yaml b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
new file mode 100644
index 000000000000..2eeb92f25b4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/wch,ch334.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WCH CH334/CH335 USB 2.0 Hub Controller
+
+maintainers:
+  - Chaoyi Chen <kernel@airkyi.com>
+
+allOf:
+  - $ref: usb-hub.yaml#
+
+properties:
+  compatible:
+    enum:
+      - usb1a86,8091
+
+  reg: true
+
+  reset-gpios:
+    description: GPIO controlling the RESET# pin.
+
+  vdd-supply:
+    description:
+      The regulator that provides 3.3V core power to the hub.
+
+  vdd2-supply:
+    description:
+      The regulator that provides 3.3V or 5V power to the hub.
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
+            maximum: 4
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub: hub@1 {
+            compatible = "usb1a86,8091";
+            reg = <1>;
+            reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+            vdd-supply = <&vcc_3v3>;
+        };
+    };
-- 
2.51.1


