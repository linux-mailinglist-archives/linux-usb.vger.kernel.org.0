Return-Path: <linux-usb+bounces-37970-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFuOAv1oEWrKlgYAu9opvQ
	(envelope-from <linux-usb+bounces-37970-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:44:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F05BDF8B
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51C493020849
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 08:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF042372EEA;
	Sat, 23 May 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAwhHM5J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730F374E73
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525869; cv=none; b=aPaWnHdR6uW6J2PXfMXtFRbPLntDv3AHkScp0JWmS1jnPKeOHbbZG18iJDe5/PtY9qXe0sEklgUHEkW+koJEF0TDliz2o1LQ9MnaSKiuy2QzOeUVu8m7ZDa1I3xLhVm3ZVuByzAcKvxtYJ63Eys9p4XlqQxCfRWG4ohnkHEqG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525869; c=relaxed/simple;
	bh=aCRvYddBbXrODXAsigivXkpsnAI8V+yb5mlCXcskyT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqDbicXZzMiQv3Y8iX8mCmEAiK67z6Rrrt6qcYLVp9vrK/msm6qDIFNcy08lBMp/n5fqf/SEk5hH0HCdyF0YoZKB5gKlSZjJlvUY3OazJ5s0ocsDvtJ6qqLQ4OI7ySBIXHjFDTzHltXG++U7dtIh1RhHotxRtbX0hjEK55a3JXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAwhHM5J; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68896f2e7d0so685939a12.0
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525866; x=1780130666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Qhj6rHOiahWvbVZuWT+FMPoy+y8UQ9yLqxFehsJ6oo=;
        b=OAwhHM5JqncDKe3JqEBG7ormYizSPXPfTRN/XxD0Wb1zPwzmhsedfWfsUSZ0Dgj7aL
         m3J3NFciv3Hj69N9HGgbmOkF6MA32KdzaEPMSY4mFDY6cyCVvDDuxaelUzM99TA2RmhS
         y3ompCB63rhwCR4EO257saawhyedKo3QZ8NaiPTmyFA9J5A8tzuqqXWLm8O3jg1TySFP
         ZIhSqUsVnFVmq+gYxDrlviTnxpAiWJNemtkKZKPvs1njM7ZB9Zlg+uPoSBk/2ynz45Wc
         SFRNiNgKyUiB6Sf7dDoyI+N/wp5vjHbzjslCONm5q7lgDj1Txd9tfpE+2oyYLWWbTR9B
         yOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525866; x=1780130666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Qhj6rHOiahWvbVZuWT+FMPoy+y8UQ9yLqxFehsJ6oo=;
        b=g7v5nxRCOvLRfnjV8VUQ7Nhh6QwTZH+G+BauumLqifyTQN9gpD3fQepvzZLsqey6UM
         dHdEzH19kQvSJvuRsQ3U8BhZZzKMza3da3LHl0qgiq/7od2dl/3OUqPS9k9ggZT/Jkxl
         IBuViustEk7cIyKKEIi0VULKzxMoquB30cf2EFSOpPnkPEOYliu3pKf1cIownV8n9sEX
         8F5DeMxoVumtBu6sGWK3ypYGTh1bDL9GxKMEG2upufcZGHYz0vyUZ1u+HScDDsi5zOED
         NgbElLB5Jdn1j0B/rLvmpg1yIOl+v9yZe/RnKctPUbr5h6UhUsV/1CrCVS7b7qxOXaFP
         eBhg==
X-Forwarded-Encrypted: i=1; AFNElJ/+VbPITEKxu7qW3EQVxJXj60sG9uhfuBuh/2epTtHSaA7bsLYvD+iT4f5qYpmnj0ATIEMfZFsMcKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtLaVPviCmLlMqenMcrsDT27DsknWqO3qCGhf2XQD0WUS+ZCvO
	SsmiGQhDLAAkLw0VE0hiZ1Tpfi9kAwYQfBi3ZLn3CAaibnFpGxNOEz9oXRYekA==
X-Gm-Gg: Acq92OESdfJGfyZRxp6SFGAO7jU3k0JwhQvHHmuhTqa01b3eOnwKWQSX1mLRmq3NRn0
	aJECtGL6t8LSWyVmDFljLMe+GeBDtMRAo1zfIGj4LgymhYiWVaK09pc/QV4qeBSfaQD2IDidCTZ
	2fO4Pj3Mjf3LqXj2uCKqwAJ5WeQls9cQthrQNQWHJag3wdMJmw6nEabqwTVjKs0ZqpTqpOhJU2h
	oDKGC7V3Jy6MT+5qDPWV9GkrwxbVybMAvut8o+JUQs0G6i96mbuXXBpDw/qxTFsb+HjdUE6I6rj
	ipbMxUEPTQKN6o1s7ZrP9WNJsUFeMimF/E/CLdzNNgijG96aDhW+eB2tmSKX9qPXssu/iotpI6M
	wevJJDwS4keoqTmQ3U0Zehbp8ME7/0NyG7S9N6reO6Rt/iB5vtHmow9aaTVHhONABvvku8oL4nw
	ALye+HNFQTDFT1
X-Received: by 2002:a17:906:4594:b0:b9d:e301:20db with SMTP id a640c23a62f3a-bdd274c9a91mr321047766b.25.1779525865586;
        Sat, 23 May 2026 01:44:25 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d70a5sm154042966b.48.2026.05.23.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:44:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: net: Document Infineon/Intel XMM6260 modem
Date: Sat, 23 May 2026 11:44:06 +0300
Message-ID: <20260523084408.50346-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523084408.50346-1-clamor95@gmail.com>
References: <20260523084408.50346-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37970-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 786F05BDF8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe the Infineon/Intel XMM6260, a 3G-focused, slim modem platform
designed for smartphones, data cards, and Machine-to-Machine (M2M)
applications.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/infineon,xmm6260.yaml        | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6260.yaml

diff --git a/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
new file mode 100644
index 000000000000..ffff58e479ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
@@ -0,0 +1,74 @@
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
+  in HSIC mode; however, to work properly, the modem must control this line.
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
+  vbat-supply:
+    description: Supply connected to the VBAT lines.
+
+  infineon,modem-pwrseq:
+    description:
+      Contains phandle pointing to the modem's power sequence.
+    $ref: /schemas/types.yaml#/definitions/phandle
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
+        infineon,modem-pwrseq = <&xmm6260_modem_pwrseq>;
+        vbat-supply = <&vdd_3v3_vbat>;
+    };
-- 
2.51.0


