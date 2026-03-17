Return-Path: <linux-usb+bounces-34914-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QATuIq0XuWmOpgEAu9opvQ
	(envelope-from <linux-usb+bounces-34914-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:58:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B652A6213
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D243F30A415D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 08:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0A130AAB3;
	Tue, 17 Mar 2026 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOCPDvEe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB8F39E18E;
	Tue, 17 Mar 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737740; cv=none; b=BYtxwUJ7pZ2Pu47SwW715o3hzNxgT+XHQ/lZOr4Ftp/aH6hzSpgHc/iBK8njuLn8C3GFjartb8i3wGDTG9M0GfYbK31H9hR9J+alOB1qLyMcK1lzltdYX500forqoHgE29P5hUOyyCzyceAvG+ci5nly+qu5G0qvM/RN4vOEuoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737740; c=relaxed/simple;
	bh=Vx+3Gg79TkcawnCe/8SC3Xa7vpDZh2uGK2Kphw+wyCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JA15rTpormzryyRsGLmwdTAFvwtcOXBGsJbI87cd018nnw23Qit4qD8ZoLEIRG1ZyM2C/rIcMDxzy4uBTq+EV2lTjxy0TunNbtSzbjY8GkbLXDwOeqqWpgJLDmIDcPphIyWEFv1Dhx5dGdYtUSXkqwaMCd4Ltm/CiU99JiTu7yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOCPDvEe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDE4C4CEF7;
	Tue, 17 Mar 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737738;
	bh=Vx+3Gg79TkcawnCe/8SC3Xa7vpDZh2uGK2Kphw+wyCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qOCPDvEe/5VDtNIxVEXI7h+MmEZltavg3tPqDIXLPuKJ4IkD90DbzZ7qdk1mvWOwV
	 DYscVPcVeMFsTycarbiK9lhiJSHTFiMbIeL1OXA+r6LOFeO46vJ2F+Lh+TCWVITrRl
	 XVK8f87N6z95zQqxv/mvZ51VUWV5oDDIPYP5f4PKjUo3Y7ZYPYjkixsaeSf9eu3aYQ
	 oYRULKPBrXQJoCIdMyurzawWrFM+iK4aaw7w4C9wJp/zCdwhOHaoiDB2GvGHRt0BAG
	 NgTjJIRDUt5PDN20rImO6HZSl5SnxwxJIM2b9APoEJGuyjC+dO6/llQLh89tFX1KPG
	 Ejecyqrkjb37Q==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 17 Mar 2026 08:55:03 +0000
Subject: [PATCH 2/3] dt-bindings: usb: Add support for Terminus FE1.1s
 USB2.0 Hub controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-03-usb-hub-fe1-v1-2-71ec3989f5be@kernel.org>
References: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
In-Reply-To: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Vx+3Gg79TkcawnCe/8SC3Xa7vpDZh2uGK2Kphw+wyCI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuRb7uzuXjxmZ/hNiDhTnAtCrMYVVwMfz0IS78
 SOC3yZqCCmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabkW+xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0shQ/+Osk1xsgrThvsq12/fPtf4yMdUQGEBvL95dWYi6QGxfHwVutq01aBG
 710gl2t72mwHBZQLl1F6zATUZYcqBI0cDz7wK/+ovdV47xw1z+f+R7CfGP4P3vkBJKoVEAbcyXH
 D/LrvuZ0YOigyfTn3oQmO1FKTHFflXeXeAUzm1f5vtTO7Ayml+q+yRQZmKethiMn7PJF+WufCMk
 m9F7VOxR4uWl8kq/nBbTL1h5ilznL5fVSedU6ZLyUP8aUzl1CX3ZtPXTTb0CnuU1qEkKd/gBHW6
 x+L3/cz8hvztPCYrPAX+qPhq4VP+2PSZ551bvHPre5O2DAnQ/QPCi+GQihYUYgpzn2pK9OQm0/I
 gw17kbvOJkbP6whar3vGo8ErHScAruGaYQNWLC8H3DtHyh3sjXPHFHIjb+0V8xRFJC1JXGOqDZ8
 kD3TV8FZ1SLnuWcmVUVwr48990yqLlb6lG0qG/kYgVIn6STkt/lcJQ2iCoaFdjoFxL9QqNd/r93
 gKEtwEpe1bU2exDg31rxIoJSNGhWlP4vt4Q0w0v8Nicarlakwhvjh8CLfFquuFf2pnDzkRs/RjQ
 u8STTh3Ieax2ahIL9W2ZNfz7a5WTQi7sNv1RvxKDW9a/i1yzFMAL+Bw0mRl8dFYYgc8X5mi/k2d
 WredA5qak/H0FA6e01E9duz9AiFhkQ=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34914-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	HAS_WP_URI(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[terminus-usa.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,0.0.0.1:email]
X-Rspamd-Queue-Id: 15B652A6213
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Terminus FE1.1s is USB2.0 protocol compliant 4-port USB HUB, It support
MTT (Multiple Transaction Translator) mode, the upstream port supports
high-speed 480MHz and full-speed 12MHz modes, also has integrated 5V to
3.3V, 1.8V regulator and Power-On-Reset circuit.

Introduce the DT binding for it.

Link: https://terminus-usa.com/wp-content/uploads/2024/06/FE1.1s-Product-Brief-Rev.-2.0-2023.pdf [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 .../devicetree/bindings/usb/terminus,fe11.yaml     | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/terminus,fe11.yaml b/Documentation/devicetree/bindings/usb/terminus,fe11.yaml
new file mode 100644
index 000000000000..93bb4066f851
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/terminus,fe11.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/terminus,fe11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Terminus FE1.1/1.1S USB 2.0 Hub Controller
+
+maintainers:
+  - Yixun Lan <dlan@kernel.org>
+
+allOf:
+  - $ref: usb-hub.yaml#
+
+properties:
+  compatible:
+    enum:
+      - usb1a40,0101
+
+  reg: true
+
+  reset-gpios:
+    description:
+      GPIO controlling the RESET#, but the reset line can be optional.
+
+  vdd-supply:
+    description:
+      Regulator supply to the hub, one of 3.3V or 5V can be chosen.
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
+            compatible = "usb1a40,0101";
+            reg = <1>;
+            reset-gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+    };

-- 
2.53.0


