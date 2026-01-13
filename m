Return-Path: <linux-usb+bounces-32237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EAED17D15
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 392B73004E3A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F4338947E;
	Tue, 13 Jan 2026 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="UIIbASgm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E033803FC;
	Tue, 13 Jan 2026 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298354; cv=none; b=r79xkXaNWTlS19w6Lke4d9pR6lM/SfNtTmzunA0MzeICUX3tmmJuMn9w0VTqJMI1x2iHutMlfu28CVoZILPmwLBQkPk7MeEfae3pIOHoVUwvFzKOSwr9t7caw1K7tLVaLLwzKZ707J/t9P8YdYg2BEz1KfsrH0IMRGpth6Q6/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298354; c=relaxed/simple;
	bh=KKIy8bffqboLgIzZdy9VTzkBZvzsoRtEKAUmG9MsrUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Lw8IPuVYm5Eo4uHyzOVtXH/qNrYGyrNocOb6vfRBZEW5Up+qnL1FieXTToWWmOmhKF5aTPAYObTyYsVxQdMRZ+Z5rXqUbTGgyKpOnm2NmwhGX33S7odvgmZ0o4RMU4hZActzEA5BA6ifgEiMYNckOj7x3jA2F/Z+GVzOgGoJ7Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=UIIbASgm; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768298328;
	bh=GDKzmeAw2EfPngSK1JjEE8ej+BjDp2O4aeKtxqj6nSk=;
	h=From:To:Subject:Date:Message-Id;
	b=UIIbASgmnSXGjNpzAMRtJ3AZTz3R0rmiog+Xyf0hZth/eQwnZgWgiFSyCTegLNef4
	 tmVWlA8INlk3pBR3Amb97TyquronsIhD3aGD4ejjl+Wn404HEUVxeSVtfFywZLnKpV
	 BQvRBM79Gtp0axLZea5tXl1IPvIn3edLWcJdwZ4U=
X-QQ-mid: zesmtpgz5t1768298322tbc62f475
X-QQ-Originating-IP: X5wLQKBIWwIYozPCEspkxvcfEXL4vp1S15FmBCjxBFc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 Jan 2026 17:58:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13575297886688582276
From: Chaoyi Chen <kernel@airkyi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Pin-yen Lin <treapking@chromium.org>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: Add binding for WCH CH334/CH335 hub controller
Date: Tue, 13 Jan 2026 17:58:26 +0800
Message-Id: <20260113095827.115-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260113095827.115-1-kernel@airkyi.com>
References: <20260113095827.115-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NcvPTSedPcpHIOcWwMz8BJ5VTnul7c092Pem9zUBU9V5IjAVcvfNG2zc
	8VK9BRwf8wVA/Cun3f197BEY5sTe0Cdn3T0vVtVQWd9RpSPvsgNF0c8yXzPqFdAilll5Xgm
	rQ2djlqa9ec4ZPbM9D2Ugz6JHfDZ8uWRYMdav6GJzWfebdE2NnkcGHSOWJVPPWrmG+5SwKG
	+h2oG42b0D8Vq3mPEXQX4aBl1HgRZtDmi4uAgn6kW08sJ0huJ9DQYgSueOI6rR8l1vbASMI
	NQADMQPc+91B3xGREHCSfDMEi6smhy2YfdZPtxzV47/dAw4hPuTYS+iTNimuiJeWUxzBYIA
	BmNM3Symn64i/QLhXLHYOkBogV/nIxzif2tXUiPrOGqwkzs9GseWuKgBf/iOBdqAjWGUYbk
	Q43ts3NjieHYKiKPLWoV1UMAlG3HR3Aj5gYC805XUaSmMkGiubftO+00nUZT4XvkPu6Q79l
	SV4ql7ePoKRVBhWSPEdCTzIeLFCkuAj7qcMc2cfBvu6/d0oeNXaShdmYNgyH3zXx1oJCDW+
	OSby6HU1Lk2L5IqwCH19BTkFRSkKAKfGNnwDxfOnmKLsKaWhrWyrGaa97CEc8mV0n/JQW1G
	1kIKhrcXAky00sVlrYyKRhgtgJkOdZ0QLM2G4rAXzxZrhWVhamqwhzMIN8RS1fQp4W1rsu4
	EAW9Xkfx5VBgbVzCzKEtk4A018zV77riYsSPe1vy4a+M7+ik9VVQZy6mlEve1M2dQyw3Tzg
	/FBP4/eJQYS383pJ0WvkQwsgRT2RzYAFRebqV9QT4aorbrH7w7+9eIqL1r4KPlg+PpKa5Tb
	qQRYv45uPa+yGkc16H5+m9ALJKBGThvZsL8tZqBJykUKCFwkRiBUG0oHm5Jc6St3tBSqBGX
	3O6s8/5HXSRykNdhu5UJetdZAAVNQq1BYk+9itQ7AwnIejB/K1ciuR9KEn/TrWhxsXYfDky
	Tj61Gz8qh5joCC4f81mu1sDQqaVVM09VFxmuTPFN0lHH58Dsaf1sSmjXYCWqjRvylFwNa1D
	EgnkYyUFPpQpYTkUYIXSOciY42pFQ=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
Changes in v2:
- Fix the incorrect reset GPIO polarity.
- Use a more meaningful supply name.
---
 .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml

diff --git a/Documentation/devicetree/bindings/usb/wch,ch334.yaml b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
new file mode 100644
index 000000000000..2fdca14dc1de
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
+  vdd33-supply:
+    description:
+      The regulator that provides 3.3V core power to the hub.
+
+  v5-supply:
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub: hub@1 {
+            compatible = "usb1a86,8091";
+            reg = <1>;
+            reset-gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+            v5-supply = <&vcc_3v3>;
+            vdd33-supply = <&vcc_3v3>;
+        };
+    };
-- 
2.51.1


