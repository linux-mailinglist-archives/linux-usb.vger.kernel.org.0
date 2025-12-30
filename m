Return-Path: <linux-usb+bounces-31824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5FCE8947
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 03:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F9B2302F827
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 02:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478F62F617C;
	Tue, 30 Dec 2025 02:38:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9FF2D9EFB;
	Tue, 30 Dec 2025 02:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767062281; cv=none; b=KMM4UmOImB4IZHMBTT+CfFJq9wujHrjqKKgOW3jV5/Gv/eCRTvDvFb0jOFJzxXiW32+upT2b1UizNTXywkew+VHWr6/ShNezybVyxkHmrvCnKSyz5yTTlrO+XnG6xjLtutJIsOHTUUUUvaOkAGipPxpR0zbX/0SjKg9dZ+5oGmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767062281; c=relaxed/simple;
	bh=yNMyl0qFHcHPIgB03TVHeV9mSqzndrb6C3GTAOp8LJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1Bi3KL7QWc4jJztbf+DwnBvANRjpU3l1+p5DOqNI4o0z+8ytDQOGnKawMSe6zh32Xv/XQCySLbG1KC5Wf55xCO+V+fm2wPUxNft+J+PcEcxUOHyiM9lQHcPHGKuwfwIxJHveKa9cBxksxN3m/NV6D/Y7CCz9bJ9US+g2j7ISXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowACXQW3oOlNpIqZOAg--.5334S4;
	Tue, 30 Dec 2025 10:37:38 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: soc: canaan: Add top syscon for Canaan K230 SoC
Date: Tue, 30 Dec 2025 10:37:21 +0800
Message-ID: <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXQW3oOlNpIqZOAg--.5334S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyxXr4xuFW7WF1kJr1fWFg_yoW8KrWxpr
	yxCFyfKrs5WF1aya1SkFy8Wa43Ga97Cr18Aw1ayryDtrn8Ga4jyaya9rW3Za1UXFyxGay2
	vFWSvFy7Kr1DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

The Canaan K230 SoC top system controller provides register access
to configure related modules. It includes a USB2 PHY and eMMC/SDIO PHY.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 .../soc/canaan/canaan,k230-hisys-cfg.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml

diff --git a/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml b/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
new file mode 100644
index 000000000000..77875f2d4f48
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/canaan/canaan,k230-hisys-cfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan K230 HiSysConfig system controller
+
+maintainers:
+  - Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
+
+description:
+  The Canaan K230 HiSysConfig system controller provides register access to
+  configure high-speed peripherals (e.g. eMMC/SDIO PHY tuning) and USB PHY
+  configuration.
+
+properties:
+  compatible:
+    items:
+      - const: canaan,k230-hisys-cfg
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  usb-phy@70:
+    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
+    unevaluatedProperties: false
+
+  usb-phy@90:
+    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    hi_sys_config: syscon@91585000 {
+        compatible = "canaan,k230-hisys-cfg", "syscon", "simple-mfd";
+        reg = <0x91585000 0x400>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        usbphy0: usb-phy@70 {
+            compatible = "canaan,k230-usb-phy";
+            reg = <0x70 0x1C>, <0xb0 0x8>;
+            clocks = <&sysclk K230_HS_USB0_AHB_GATE>;
+            #phy-cells = <0>;
+        };
+
+        usbphy1: usb-phy@90 {
+            compatible = "canaan,k230-usb-phy";
+            reg = <0x90 0x1C>, <0xb8 0x8>;
+            clocks = <&sysclk K230_HS_USB1_AHB_GATE>;
+            #phy-cells = <0>;
+        };
+    };
-- 
2.52.0


