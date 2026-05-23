Return-Path: <linux-usb+bounces-37964-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBKOJtNlEWr7lQYAu9opvQ
	(envelope-from <linux-usb+bounces-37964-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:31:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0465BDE5B
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA578301C105
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 08:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41B6362120;
	Sat, 23 May 2026 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc675ppB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABBB349CCA
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525041; cv=none; b=LRr1d499atLvdBbJFPA6/FBISqNGKKysbJnx8/7/SU90nlHrkrc+KHfwm5YOeRrucr2Imx5ezCrn2wMEn1U9mDaZudPQ8rai0V5BHhXWySj5Gt2g1p4L13AGBAJqiqRRiLi8D2llaDqGATy3S5iRqwbeiLHSGeNGRt/h9ouzzqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525041; c=relaxed/simple;
	bh=RFk4nd6bXVOHvzs0Um8Cm7YAd9OzwjBPCs0pyzgoFWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i41/Zm1lpsg+BcYdaVOdufaJ4VekI8CL+0nsKU2RWJBJGtZI9z1stfDrNvXsYTH94gywKQ12xsksdmiaDDAh8ejZ8B+tWADXP/0VTZi470/d5eT2AILS4AmTtEZskQK+3rhnlYypESuQvGexbp698tLXuPdItERyk3iMLQPXCcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oc675ppB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b936331786dso1029958266b.3
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525037; x=1780129837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csVvMr98OyRGdIIeLSoE7oflCBXwh48FuWRULAXXVcU=;
        b=oc675ppBo2F7gBEfP/n/NeUIwg8MU3fq00oAODh9iYz+WyRmsqF7EAMqZEPUfBbCIZ
         be2eLhO+UrtGyqPXm3Tx5+FZ4uQ/ChWj5Nk4tkIQ7XKJZD/+ZfTWOpet5eXIJyNqyPcO
         Z44NSPBPYZDnXTOQi6dF/vfH5V0J2dCjI+SfmQ+ljRR/CBgeCVW1poUsfIn5FdoyB8Uh
         zkpgHwyP44saQ2CqXh8ax8wzelauBobar0t06WjKMhUq+YnD3pyFa5LH/2tQGV/sG8Af
         aUq0olDHM3JTodU8hXyOcls+SwxSkD6v4gleByWrfA7JGOWDOYt7GzAhxCz70/GtZ/JW
         7nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525037; x=1780129837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csVvMr98OyRGdIIeLSoE7oflCBXwh48FuWRULAXXVcU=;
        b=eclvX7fP+IQyD0QB05ZPKKNFRLfiT9CwI6bDI7cpzeiRygrIekYUgx1enrIfrhu7Jn
         SG1pACpw7/Ayfq3/oYLG6/uTEBv5TXOz0Ly0m4r9H9cU1s0t3+xQ5/kzvU1e1whtu0qp
         /olFIkRzwhhuyl9DlMYFlChjhHlrWXevlcxnfpfsmI8i+7ePZrDUf4CX9akX5iFtZkvh
         1CzWb5kKM81hAFoguR+YkhOTXobkI7LMUDL1QfiuX95hedYtG5aexax/SANQUKtzBA0v
         vrTSqw9BrAqrjhJM90tN/WwBUIdp4RBHBuvkNWzEjpSa7OPnCjGeQCwY8Afc8hxAU+gh
         luow==
X-Gm-Message-State: AOJu0YyG2fAx3nRavmVUOHYUl2ke+WDPUYN/IAW47Hkmg5yCOCljhND/
	9Md4QOjd4ySU6wnxop73QIz8KJDpsUNIvBkS3do4nihVVVHPHlk0b3Kr
X-Gm-Gg: Acq92OF44YuxKCE4lyrGRNB/kDXY65dF7g3800w1jfFSox5xnk0eN0YaUi9hm34H6iq
	AkLXg+ciM+81yax5hgd8DhNWxjNNbIyYi/RzBzlKu+cF4zpvp0WspwxybqnIuY/7Vd1oxOnKDBF
	7I/toPiQPG2Gh7+KkL7TbZ1FZofUXVgVxad+Q3Ad8KRoKspat0KVDS7KItBOXVOqeeCKowFORkv
	59lHx3spmSK/mN/SN1ucpiaoi1NfQ7BeEub30P8rviRs5Uo2FSrUvgpVDDQf8SVLltHK9s9pjDo
	YnNLmSPfx9RNLvf5am+vlhWCw/XS8IfniBpVWpjO81hEo/HSB1BINI/ok7z06GFre4xhRf+uifJ
	PDKc9wG/rmsx972aOAXGp7Yc/2bgPOi+D9Yrfnji6b3aeVnsiCk9zIue37Lr0hXnyNO3XKlvGSy
	KYx5118flDSbidpKHyHmTH3qI=
X-Received: by 2002:a17:907:3ea2:b0:bdb:b76c:4dd0 with SMTP id a640c23a62f3a-bdd263c954cmr455094666b.40.1779525036960;
        Sat, 23 May 2026 01:30:36 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a dedicated schema
Date: Sat, 23 May 2026 11:30:09 +0300
Message-ID: <20260523083013.46372-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
References: <20260523083013.46372-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37964-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,nvidia.com,gmail.com,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[7d000000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5B0465BDE5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move all Tegra-specific Chipidea devices and their properties into a
dedicated schema file, by analogy with i.MX.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/usb/chipidea,usb2-tegra.yaml     | 88 +++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
 2 files changed, 88 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
new file mode 100644
index 000000000000..78046f8a63ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/chipidea,usb2-tegra.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra USB2 ChipIdea USB controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-ehci
+          - nvidia,tegra20-udc
+          - nvidia,tegra30-ehci
+          - nvidia,tegra30-udc
+          - nvidia,tegra114-udc
+          - nvidia,tegra124-udc
+      - items:
+          - enum:
+              - nvidia,tegra114-ehci
+              - nvidia,tegra124-ehci
+              - nvidia,tegra210-ehci
+          - const: nvidia,tegra30-ehci
+
+  operating-points-v2:
+    description: A phandle to the OPP table containing the performance states.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  nvidia,phy:
+    description: phandle of usb phy that connects to the port. Use "phys" instead.
+    $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
+
+  nvidia,needs-double-reset:
+    description: Indicates double reset or not.
+    type: boolean
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+allOf:
+  - $ref: chipidea,usb2-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra30-udc";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA30_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        phys = <&phy1>;
+        power-domains = <&pd_core>;
+        operating-points-v2 = <&usbd_dvfs_opp_table>;
+
+        dr_mode = "otg";
+
+        hnp-disable;
+        srp-disable;
+        adp-disable;
+
+        usb-role-switch;
+        extcon = <&charger>, <&extcon>; /* vbus, id */
+        vbus-supply = <&usb_otg_vbus>;
+
+        port {
+            usb_in: endpoint {
+                remote-endpoint = <&connector_out>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 691d6cf02c27..5abca0572714 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -17,20 +17,8 @@ properties:
           - chipidea,usb2
           - lsi,zevio-usb
           - nuvoton,npcm750-udc
-          - nvidia,tegra20-ehci
-          - nvidia,tegra20-udc
-          - nvidia,tegra30-ehci
-          - nvidia,tegra30-udc
-          - nvidia,tegra114-udc
-          - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
-      - items:
-          - enum:
-              - nvidia,tegra114-ehci
-              - nvidia,tegra124-ehci
-              - nvidia,tegra210-ehci
-          - const: nvidia,tegra30-ehci
       - items:
           - const: xlnx,zynq-usb-2.20a
           - const: chipidea,usb2
@@ -65,16 +53,6 @@ properties:
       - description: register offset
       - description: phy index
 
-  nvidia,phy:
-    description: phandle of usb phy that connects to the port. Use "phys" instead.
-    $ref: /schemas/types.yaml#/definitions/phandle
-    deprecated: true
-
-  nvidia,needs-double-reset:
-    description: Indicates double reset or not.
-    type: boolean
-    deprecated: true
-
   ulpi:
     type: object
     additionalProperties: false
-- 
2.51.0


