Return-Path: <linux-usb+bounces-37264-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNaBIKzjAWoEmAEAu9opvQ
	(envelope-from <linux-usb+bounces-37264-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:11:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E850FD22
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DE69306A568
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 13:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D253FD136;
	Mon, 11 May 2026 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTVG2x2U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14EA3FD14F
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507869; cv=none; b=RT1MprAWmIPAD/H42vm7W1jzgOZr3/wQQxPf5wi6yu02RsZIh6tKw8kLQ0VqAsWC1x1/gEaqjwLGyKr8eN9NqYnAPZUnXBemQ3gcIn3R+Bsq+CJLXx9O2s/ApbKmKtERAOyY8cDXsXRfSSGvV7nHu/27i3+8rXkFG2pLIJzZH8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507869; c=relaxed/simple;
	bh=Xp/TUYJI1eAs/D+9Nq+dELgCqu+Ss/welMktAjHcpbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJexrR+sS7KyDSm1Nv0GEmV9e2J9R2gHbgcdIBo4q5CjDJk5HlO4f29cNW0rjiieg8+nuZNwMsHJ9rrUW0kTFrs8Ol3uQHdutHpmpgU+xWER2E4rKiI9UFFCNvVrp8r84wo6YFiKvbVudNCubXDoh1/B1BBrrK7m35HrzcZy0kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTVG2x2U; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so8987263a12.0
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507855; x=1779112655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnjnB0/XPfthXcOXqkhM1htDcff/BGb30MwU7TWoKRg=;
        b=jTVG2x2Uzv7Dt8V8cSlP4y777+8Umg8UZR4qC4X5tWhuFi4FWQFNdi99gObVcIVWYh
         oLpRMdYIKJRz+zUeMBhJnJe+itGJ90THEwF47hQ+KNBpGdZB6q5rFu9bf59ndsOdvCvM
         Pe+W8fTkPch001mxqd1ckVyc+AHxBBIQgZcEF0IqMap+LmMV52rvWEiXhqKR8Xn2SgxS
         SKuwV96wcJpgR+Ocjcc01yCZT91wqWZFCUf7QMF33+IHkiuZWvgV3uA5qGPksBook4i5
         2BuxZcWbQ9hMYGsLBMuuKGCerc0YwGOI6q9KSl4wRVofStDZ6PQBX7nYY3DJtUeE0fdq
         t1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507855; x=1779112655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnjnB0/XPfthXcOXqkhM1htDcff/BGb30MwU7TWoKRg=;
        b=FvAe4WpRuoDjFIRaxnFv4ALiSvN83+sk+FQufXngirYEYe8qnrRYy7w2o/hSddT2/9
         m3U4zynThn4SZXpAWxRZNRDQZeOfU7DEPA/+HY9ejAR1CMWC7cRjgxjmhY4bVWuL5Hre
         Dmp5InMoWQZ54D60bWpALZBuxl45VaoIfEkjo2qG27i5SmJugYtK6sq7e4P2E/D4dDVN
         mLFVv45YvfUWDGG7aXy3zsULb7eCR1okYSo4Y16KUYolMmhMFAM9LEF7iT22UE88TZyx
         JmycepyOc1hLhknBsvuRYs+tmhaHJrzam5NlgbXktMA2KYOLLKrs6PDDSVtBysE99Cgl
         rRgw==
X-Forwarded-Encrypted: i=1; AFNElJ90zNZ5dE+73WK9HCjeHmdcuZ6FvjRVofT4AEs56Mq2jiktou+SjVXlJWtpp+8UuHX6ih73YHU/Dps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlONx3pNDGIpzpzRctnWlhZ+tD28rndTMFguvmyrbLhnmCjF9M
	Qecf5Qo8QxH+J6Ezb0ZrwX9xg1HKCkbvieZDfsfeM8FcR9l5NRzvX1Kw
X-Gm-Gg: Acq92OGSHzm8Hi+r/5HxBRTnxiYrff2EOLOH44ymDGupi5B4hV61ExF0fiDEc9Ys0nO
	pB62lZJacoViL8itsZgVc9JnB9/xyTgmMq3Qvw47TuWIGCipIt6Qo9TYV+FaL8kEbI34+a+1dz2
	U+k/oPX6XYdCjAjjTtZXVvPNZeE578EHGvWQaqqNNRTnf4OwngI7DSge1pfF4uyCKnj9v64KWNY
	705y6K92AfT7h6SCAtSlApIMnCeSb+o1kmo8R3tRKGOfjY+TCjiZ8nZVIT+tG4o9zMJgdP/KfgM
	xUvQuxCkOxvCEyYF6TktEMYQgt88WjOrN06+n4TxH3UzwiQwOq+SWcXSW3Hrh+4I1c17N7WZWJd
	TUuLIlzmAX4Xnsk7mzSuEnnefaPbxM4QqIg9K9tB/zQ9OJMTLMOfB1KqxtR0OKLRQnbuhYjN6HH
	mvxIcqp6aoEjHS
X-Received: by 2002:a05:6402:b8a:b0:671:9dec:ba3 with SMTP id 4fb4d7f45d1cf-67e0ee9abb2mr5590673a12.13.1778507854968;
        Mon, 11 May 2026 06:57:34 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 5/6] dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY
Date: Mon, 11 May 2026 16:57:00 +0300
Message-ID: <20260511135703.62470-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AB6E850FD22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37264-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,nvidia.com,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	NEURAL_HAM(-0.00)[-0.965];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Document the XMM6260 PHY used by various devices based on the Nvidia Tegra
SoC, describing its usage

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/phy/nvidia,tegra-xmm6260.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
new file mode 100644
index 000000000000..0346433c9772
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nvidia,tegra-xmm6260.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra PHY for XMM6260 modem
+
+description:
+  A hardware configuration used in Tegra SoCs to provide proper interaction
+  between the application processor and the modem, as well as control over
+  one of the SoC's USB lines for the modem.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra-xmm6260
+
+  enable-gpios:
+    description: GPIO connected to the EINT1 pin
+    maxItems: 1
+
+  nvidia,usb-bus:
+    description:
+      Contains two phandles; the first is pointing to the Host's USB controller
+      and the second linking to the controller's PHY.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 2
+
+  phy-supply:
+    description: Supply powering the PHY.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - nvidia,usb-bus
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    phy {
+        compatible = "nvidia,tegra-xmm6260";
+
+        enable-gpios = <&gpio 165 GPIO_ACTIVE_HIGH>;
+        phy-supply = <&vdd_3v3_vbat>;
+
+        nvidia,usb-bus = <&hsic_usb>, <&phy2>;
+        #phy-cells = <0>;
+    };
-- 
2.51.0


