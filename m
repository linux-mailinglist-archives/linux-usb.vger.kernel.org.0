Return-Path: <linux-usb+bounces-37262-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD3gCq7hAWrqlwEAu9opvQ
	(envelope-from <linux-usb+bounces-37262-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:03:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7750F95A
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 437123071379
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 13:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2D73FE37A;
	Mon, 11 May 2026 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9/+y0hs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6CD3FB7DE
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507859; cv=none; b=hd5M+NmKh6SU8v5Tn+TCGiJnjSRajWZ0/UaURmuiCNORntQBnA5QvLv1vUCkqxCEjalAE6qFIVWrkRcxRG4Mx+r0NuCJBF9/ll4NRz68VTNN3oZBzOgzf1IYG3G6ShMgdgPVWXEoWVStC52YHteEeWXDjatIozSOaEoF0ipeiVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507859; c=relaxed/simple;
	bh=UGnwnynsk6MCY6H8VDntAGqr8yOAgR5+RJ5mxZdLHZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jo2dTFWoqfMwNN1hFFDDS0NGz66IISLWWrjBpch8uldeY/ED9265Qatz9Sg1KFqvmLm/NWvFROrslDRIBbEp0dnkaK1pksTUSbXXaHco6guLMUKpLq88NSTqulOnQOOOV42nECm19Oe/KnRUsF0QVlDjSuq1rpernqU7oieI4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9/+y0hs; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so8987054a12.0
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507849; x=1779112649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdX1Hn1whpHFxpnqtCP4cLwf/y3NxkK7GqmkakB9h2s=;
        b=R9/+y0hsEtFzQUpXgRzvAmmYxgz7ExkZm8O+9rT+NpyAQ+/o3KRP0XrYpX2R1BaRiD
         dCsIcCGAD2D5hCQtE8KM9A/7Gt+9IGEXFkHeOUdWfAEYp/pQR4+rSDaaE4FUMuFxQ+8h
         J600jYbyV3MjK/A5N53AEdRGi78N+3Z/KdK05SqBtl0gEnxxeVEQb7vX1y+9qI8w705L
         j+333xmAqAkVuIziNy4BOtLC+ykB50F9jwqVWcuxUa6Ua/HUBKL4yygjUJPUekW5esJS
         3haLAUCso3T0lB21StROK8z7cdSHI1Fd+lGnLQXbuA3RuBXWggRxuaSz3K7cCz7V5lFh
         SoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507849; x=1779112649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WdX1Hn1whpHFxpnqtCP4cLwf/y3NxkK7GqmkakB9h2s=;
        b=q9zVvVjYrkHT4wZWt8OqMa/V9AYAyyoE1+3MrVZT6mTA4QHfSo9Taq1VlIkuzq9W+I
         mozvfoLUaGObn9CFoKn5ps5MlErMFHkYnvGl8mDeUAJ5FQnCL82GSgVFWQ1sPOTxOa5n
         VwWA8qSSsqMAschij/NGx0Rx1nr0zpuOtd1Q2NLLoyiOu3Xwzn9z40Cc8cNLPdpJTLNj
         xy4S/ICo/4tYf2KqPGur0GOrUneYWrkkOTLtEC/xzhp7ilc2F+4c5/2l6g1Vo9aPPG8C
         XAsSNGBQ6vA0Dq00p+7NLNtJI3ZjDGo6yD9ixNiOH8Vi+azMfV4HdO/xeaRK3tpHnfRR
         yBcA==
X-Forwarded-Encrypted: i=1; AFNElJ9j3InxYSF+CgERAUhCF2EZPyHf4FK8nLZhb6vigcyhvVSaxe8BXVS7IUROwBrmYDtQyeMnHNL4Jz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqA0yIKTIrVHt/LLekBAAWpDoAub/o4LoreoX43hQGkGPf1/Y
	fpTdWJtpKYyZgBnmrEJLolasjRXqpFtn9/16w54D3mwBTYXF6e0E/AtH
X-Gm-Gg: Acq92OFWLJHHYbTKfm4+/RV6jlllYSOOBAFL1wFeS1KPL6XExYqm5ZiXfxOtuSfGT0R
	XWsjWn7oyLSVm3heC2RFQqVhGeT1U9vI00c14FywdMywey2/DBsZF6VoelJHQt7hZ4U6niNUqhw
	Y7wsoJFeqa2fODFrHJ4JFU0SLDOAVD32LhGtDAGGL4SKAa1n4MKSrGTGyUCubQJnpWItsj+7RfV
	DuqRfIqb3tsUN3lu+VEUP6lP+ao6dMGagnxUbrwbmMaTYqP7pkESLpggW9nYpALzIUJWCqmgiLX
	9FPXrDCOkb/sTnztIx66e6neoutqMi5IYgwCV/XSSulJh711YK+s2A9yRsdiD4SBGm2nIidGZIE
	bERqIs2Ndo0SqzHrSsUqAE2627m016FLlH5BNPCR+3XsjrTCSI5WmfHGEEMqRDUcPGwocEdzGeD
	r9T4aOW+6OQMMix9m2EdQjnw8=
X-Received: by 2002:a05:6402:4506:b0:670:d548:62a1 with SMTP id 4fb4d7f45d1cf-67e0ddef87amr8352750a12.3.1778507849153;
        Mon, 11 May 2026 06:57:29 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:27 -0700 (PDT)
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
Subject: [PATCH v1 3/6] dt-bindings: net: Document Infineon/Intel XMM6260 modem
Date: Mon, 11 May 2026 16:56:58 +0300
Message-ID: <20260511135703.62470-4-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: ACB7750F95A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37262-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.964];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Action: no action

Describe the Infineon/Intel XMM6260, a 3G-focused, slim modem platform
designed for smartphones, data cards, and Machine-to-Machine (M2M)
applications.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/net/infineon,xmm6260.yaml        | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6260.yaml

diff --git a/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
new file mode 100644
index 000000000000..d34d7125274f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/infineon,xmm6260.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon/Intel XMM6260 embedded USB modem
+
+description:
+  The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
+  for smartphones, data cards, and Machine-to-Machine (M2M) applications.
+  The modem is usually connected via the application processor's USB line
+  in HSIC mode; however, to work properly, the modem must control this line
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: infineon,xmm6260
+
+  interrupts:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to the ON1 pin
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO connected to the RESET_PWRDWN_N pin
+    maxItems: 1
+
+  ap-wake-gpios:
+    description: GPIO connected to the EINT3 pin
+    maxItems: 1
+
+  cp-wake-gpios:
+    description: GPIO connected to the EINT2 pin
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  vbat-supply:
+    description: Supply connected to the VBAT lines.
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    modem {
+        compatible = "infineon,xmm6260";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <168 IRQ_TYPE_EDGE_BOTH>;
+
+        enable-gpios = <&gpio 112 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&gpio 169 GPIO_ACTIVE_LOW>;
+
+        cp-wake-gpios = <&gpio 151 GPIO_ACTIVE_HIGH>;
+        ap-wake-gpios = <&gpio 168 GPIO_ACTIVE_HIGH>;
+
+        phys = <&xmm6260_phy>;
+        vbat-supply = <&vdd_3v3_vbat>;
+    };
-- 
2.51.0


