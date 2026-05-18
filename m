Return-Path: <linux-usb+bounces-37629-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOkLEKh1C2oZIAUAu9opvQ
	(envelope-from <linux-usb+bounces-37629-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:25:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1908573598
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CECA4304346D
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 20:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8B2384223;
	Mon, 18 May 2026 20:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzxtwpUZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C27D2ECEB9
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135789; cv=none; b=Vgj3kJ9cqYSDdO9jbhDAbBm3Y/U9OeFfswzbQoJqj2NK2A25xRyyL9SxfNAvxiDT6COAQwihJ8+vmPF3OI0JbqGzN85ovmTlQAMdJZNTScHQCzSCOG8g4ynv/GnGdykhRnb68nGs/VmiVmDKo4tLBu9IHIIucekbkjC/oE5EOE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135789; c=relaxed/simple;
	bh=xgChc86S/ky0hTX1WHgw+ITaDh9vre+/OuTho3WUOIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QoydvRMdjZohBZ3w91Ad3xlWDetlxZkNBU7CY9C1S3mcCxe1mePy7RX55I7UNZ3ico0zFfITIAMmtN40PILfKU5zbZUa6ORJoyaAXYirUrXd510pDC/xbIr0+63rH0JIMdNgDY42mvuiErxmnknaudofBHHcFAAPWv5os4oUY9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzxtwpUZ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a746f9c092so4519787e87.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135785; x=1779740585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+gznpkaSXk+Nx5SKTS+MzsNikKdxnv7goUi1xVYfHc=;
        b=fzxtwpUZDYCDvuwfiHAQeeWnO5BJMe7Pcw0EVEfLvJ7vwbeIHgQezBzhH+aIBJ3abN
         VyK/Jlm7KQIyoBJ3oU/y2IsFMjqrwfEBWHP8K5aU/TPYmklkyRU+4Cd5wHJiIJFAVOU5
         esSrflyKAosviPnVBCVaszt0O14G+KfmWbVapChrKBROSJYJbtEMwhSqdnv/upmHxYaj
         K5uoLgyay9FXk5lSu/HCKHlpH6/+Ut4vzg5BynDnhLvYfrW1MkGLEotikZYusEoRN6/j
         TjvhWo6n+7rUboZ/ptV7dA7ttNQ7wLjMHDA5mGqaku8/svxiKc3ogkcv0MsTKKWcCdXw
         ELdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135785; x=1779740585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K+gznpkaSXk+Nx5SKTS+MzsNikKdxnv7goUi1xVYfHc=;
        b=KUTH2Z5+UoWk3oMT3P89uEANJCDw23gazspYWSGTASZAhFTX17VWnEjO1lywKbKKG8
         9ghtKB/rvg0fZsjx8s5p/qTwHepavf6BLfMjuoYOAdyCnuz+3wDvK8XxoWGDgODHQJXb
         tJxH94U0/kwGX591j9Ly2wFwmoXtrXAOj/3Q3UD6EyQAFcm1Q6BR3gQNuS0fFHC3CZiK
         QRDICJJCU9EYRt6Ii7r+sa0H+PophVqE7KJgQQQxtnew1cV9ls+fi8prpu59JyLpHXUR
         ifXBBSLZwW6taBGKZ9kHSvq2Bqdib+NZ2Rd/tIQO74uRE1Q2d/6FFeQyxovC3MBT2/Mv
         sRkw==
X-Forwarded-Encrypted: i=1; AFNElJ8bfyh/JSj1sqnlMj3iCrXxO+B1QmrQoi6H3wMw5YiFsRMGjpl3vS19J7+0uPYmjP+DBiQ8xIIcVoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwyMn5tRrkcbcLzwsGEQzGwNcxLMMHmWfdpM1zmioyjFsJFMVR
	YRTZGRS3sPvMgzprfKHj5IWJ0Bl9PQ3I2N/TJSyn8EwiDfETFPAR7cBG
X-Gm-Gg: Acq92OFv4gXJ7Qnz2T9fgYidYBDBiwOlfXIhx9NRJcYPJlcw/WFKiK7X4SzYcWrG2DM
	BLbiFe/j8kNCmfvB3HDiS3JoOkKbosP7KhpTLJH1+KZrT4c5eIxtF/bkI+EvNX4WoGBQv5EHPIy
	fQ3TEvo1SvmL1lozWHPz4XePIlFRFP1tieZC2424NfgeUY7oBcMIkOkMQ04oBiMFMUW2QM2EOO8
	/igUo48u20THXfvIbNfJyDM8teBJSjJsSEjjdRy7H6kZ+/GaFoA9zx6Q2MMWugA238KOs7MHE8n
	V/cC36tWisXC/VaJRepZuAPwyaF2O+/CGnJlq/ln8Sn+acnYdSCrpd1XmWo+w1QxdzZS6M4Njkt
	vIdW8nzR9MxOt/bmLtgu3uKE/SOIh06glJcnWusAmiv+dSfSQKo/AtmJjRvaUPMLJKsqDuf7o5V
	KH71OEzzOY0sfCSV/TN4awXfoJOFX4uIz9YjFkYdMKDJbmGYC8gm4=
X-Received: by 2002:a05:6512:1044:b0:5a8:837a:2a98 with SMTP id 2adb3069b0e04-5a8ffc6705bmr6263143e87.14.1779135785334;
        Mon, 18 May 2026 13:23:05 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.23.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:23:03 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 2/6] dt-bindings: usb: add Qualcomm PMI8998 Type-C controller
Date: Tue, 19 May 2026 01:22:47 +0500
Message-ID: <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37629-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taygoth@gmail.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,devicetree.org:url,0.0.5.20:email]
X-Rspamd-Queue-Id: D1908573598
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PMI8998 PMIC integrates a USB Type-C detection block in its SMB2
charger USBIN region at offset 0x1300. The block performs CC sensing,
debounce and Rp/Rd resolution in hardware and reports role changes
through a single consolidated "type-c-change" interrupt.

This is architecturally distinct from the qcom,pmic-typec binding
(PM8150B / PMI632 family) which exposes a granular 8-16 IRQ topology
fanned out per Type-C event for a software TCPM state machine. PMI8998
has neither the per-event IRQs nor a register layout compatible with
the TCPM code path, so this binding describes a separate hardware-
managed role-switch controller.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 .../bindings/usb/qcom,pmi8998-typec.yaml      | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
new file mode 100644
index 000000000000..f2814f5ce3de
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,pmi8998-typec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PMI8998 USB Type-C role-switch controller
+
+maintainers:
+  - Maxim Furman <taygoth@gmail.com>
+
+description:
+  The PMI8998 PMIC integrates a USB Type-C detection block inside its SMB2
+  charger USBIN region at offset 0x1300. CC sensing, debounce and Rp/Rd
+  resolution are performed in hardware, and the negotiated role is reported
+  through a single consolidated "type-c-change" interrupt.
+
+  This block is distinct from the TCPM-based qcom,pmic-typec controllers
+  (PM8150B, PMI632, etc.) — PMI8998 lacks the granular per-event interrupt
+  topology those parts expose and the driver therefore translates the
+  hardware-decided role directly into a usb_role_switch_set_role() call
+  rather than running a software TCPM state machine. Power Delivery is not
+  supported by this binding.
+
+properties:
+  compatible:
+    const: qcom,pmi8998-typec
+
+  reg:
+    maxItems: 1
+    description: Type-C SPMI register base offset (typically 0x1300).
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: type-c-change
+
+  vdd-vbus-supply:
+    description:
+      VBUS source regulator enabled when the controller transitions to
+      USB host mode so bus-powered downstream peripherals can be powered.
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - connector
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@1300 {
+            compatible = "qcom,pmi8998-typec";
+            reg = <0x1300>;
+
+            interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+            interrupt-names = "type-c-change";
+
+            vdd-vbus-supply = <&pmi8998_vbus>;
+
+            connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        pmi8998_hs_in: endpoint {
+                            remote-endpoint = <&usb_1_dwc3_hs>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.47.3


