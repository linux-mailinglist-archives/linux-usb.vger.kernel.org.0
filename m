Return-Path: <linux-usb+bounces-32375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B69D229EB
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 07:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6CF7309480E
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 06:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBD12DB7B5;
	Thu, 15 Jan 2026 06:43:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C9C246798;
	Thu, 15 Jan 2026 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459425; cv=none; b=nCLeazT53/G5zneo1gPpC++zcAje9683otwuIdRyTuKmXezrBbPfjdjZNUAu4LGOpxFjwCzfEeVlSbwuQDu05tugPbr51P3Ulhu+dmq7iH+mmQkrYmWbn4DaY/PFtkj3f25Weiroi3mRkgMWoJH+DO3bZ1rWJTEUgKf+pLCtHU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459425; c=relaxed/simple;
	bh=PCbBvucDj+zutptctE4rfxrZKax2o/ZnTSOHfz4l0Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHxiXrEuUpgZM0rXNIKMucRGX0/YpMIwu+AW100IlNxmyTJpIs4CQqAUGkad4OWrCIvJSqrNmWx4OFpD/d63LFO997nx52PsO5VBCP0Hnc/1ochKprqH99x/M8KKnV1PI86xTO9t5dWrEFb+i/5lC3NFws9KS0Uiufw5PsTmcMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.69])
	by APP-01 (Coremail) with SMTP id qwCowAAn0GtWjGhpw5fDBA--.30809S3;
	Thu, 15 Jan 2026 14:42:42 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	18771902331@163.com,
	cyy@cyyself.name,
	TroyMitchell988@gmail.com,
	kingxukai@zohomail.com,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	gaohan@iscas.ac.cn
Subject: [PATCH v2 1/4] dt-bindings: phy: Add Canaan K230 USB PHY
Date: Thu, 15 Jan 2026 14:42:19 +0800
Message-ID: <20260115064223.21926-2-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAn0GtWjGhpw5fDBA--.30809S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWrJw4fCr18KrWUtryrZwb_yoW8GF48pa
	s7uF92grsagF4ayws3KF18Ca43ArWkCFyfKr13t34UKF1DW3WYy3yakry5Zw1UJFs7CFWj
	vFZa9Fy7Kr1qyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7sRRFks3UUUUU==
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

K230 SoC USB PHY requires configuring registers for control and
configuration. Add USB phy bindings for K230 SoC.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 .../bindings/phy/canaan,k230-usb-phy.yaml     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml b/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
new file mode 100644
index 000000000000..be54efd612ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/canaan,k230-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan K230 USB2.0 PHY
+
+maintainers:
+  - Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
+
+properties:
+  compatible:
+    const: canaan,k230-usb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usbphy: usb-phy@91585000 {
+        compatible = "canaan,k230-usb-phy";
+        reg = <0x0 0x91585000 0x0 0x400>;
+        #phy-cells = <1>;
+    };
-- 
2.52.0


