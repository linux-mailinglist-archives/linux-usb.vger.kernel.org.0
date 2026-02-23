Return-Path: <linux-usb+bounces-33595-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PKMMvCznGnsJwQAu9opvQ
	(envelope-from <linux-usb+bounces-33595-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 21:09:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D96917CBF5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 21:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1161F30C3998
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 20:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0DD376BEB;
	Mon, 23 Feb 2026 20:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q+xQ0PPn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094536C0C2;
	Mon, 23 Feb 2026 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877138; cv=none; b=vGNFtUMeyKnYNtXdPOFrVRMJLA4YM/TO2wN7S4PaHpEeQu52JAy5KyMdbWlROSljTBqkBKfrq6Cpolq7QQMwBAHqWyye0N+lANP+g+MAez4TKZwTEeFTF1qW5ywydCGbRImhj2VZhtA5Rdkd82CEcnA2sIMyAeWzfeDDX27QX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877138; c=relaxed/simple;
	bh=yS0FaWfkpmHEikMpMYRQQxRjgfhNjAFnVJW9DERmNM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anwusoCc9CXvPCNg5+tfrdvBOYO5QJrVFXFUwK16AcFqC4fCIPUZs8S8r1x35iJvipT2mVKkPmuqbQnoccEA/9m2uUGb1aOWbFYBSB1MxNXf3OBEhXNMSIxeYIr+NgwBV2UTcOnoXh4dFUHDcTOJ+UNrOUFy6eKcxWqGIWawJkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q+xQ0PPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C66E3C19421;
	Mon, 23 Feb 2026 20:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771877137;
	bh=yS0FaWfkpmHEikMpMYRQQxRjgfhNjAFnVJW9DERmNM8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q+xQ0PPnqKHww8nXcpe8My0UYMEswRVcwqSPKjgw3ezf4nRxie9wtxXioyw3H7Pqo
	 7UQsp37cN0nVY8s+o0tF7h7fQuY/Ue3AdKoHHfktenxXydSZ8yjT74iE/UAC9GTLsa
	 NuG7m1jNKIP0gZRRoQvkRCGXNq/Ms2OxkWSgOLyXV+smf8ANtGnUKk0FAXmbXy+pJu
	 cDh1+hZnH1+Ncfqj0GiTFVZ75VmjAU3JsC47GbrPQLTb44px6+nPY4uszC+gOwqOqI
	 2sNNxYlMFwiSb5hiKQHjfK+xazZ9ugAvEl5/vj8Jn9B4Lz2MEDHJKFAgw7Imlr/7OI
	 6grR8J+QM5vEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B07EC112B;
	Mon, 23 Feb 2026 20:05:37 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Mon, 23 Feb 2026 20:05:37 +0000
Subject: [PATCH v2 1/2] dt-bindings: connector: Add sink properties to
 comply with PD 3.1 spec
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-skedb-v2-1-60675765bc7e@google.com>
References: <20260223-skedb-v2-0-60675765bc7e@google.com>
In-Reply-To: <20260223-skedb-v2-0-60675765bc7e@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Kyle Tso <kyletso@google.com>, 
 RD Babiera <rdbabiera@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771877137; l=5005;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=itAb/PFy1mTfeBP3j6zX7HovF8nRNtIK4I8TOhIQRWs=;
 b=gOkLUA0mTKyTHT3HQBh6EBJAolQp30L9Wydf3EI8g4F+vDDakOCmY9D44qlV719DumoKoBMQE
 EXOnNqvdwApAGo21CRz0nXpqiZ2Y7UgdekxGGd2kE9O9KleMkxr0zaI
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33595-lists,linux-usb=lfdr.de,amitsd.google.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[amitsd@google.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D96917CBF5
X-Rspamd-Action: no action

From: Amit Sunil Dhamne <amitsd@google.com>

Add additional properties for ports supporting sink mode. The properties
define certain hardware and electrical properties such as sink load
step, sink load characteristics, sink compliance and charging adapter
Power Delivery Profile (PDP) for the connector. These properties need to
be defined for a Type-C port in compliance with the PD 3.1 spec.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/connector/usb-connector.yaml          | 34 ++++++++++++++++++++++
 .../devicetree/bindings/usb/maxim,max33359.yaml    |  4 +++
 include/dt-bindings/usb/pd.h                       | 18 ++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 11e40d225b9f3a0d0aeea7bf764f1c00a719d615..901986de3e2b2734452c99eea8076f4b03c4a688 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -300,6 +300,40 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     maxItems: 4
 
+  sink-load-step:
+    description: Indicates the preferred load step slew rate in mA/usec for
+      the port (in sink mode). This property is defined in "6.5.13.7" of
+      "USB Power Delivery Specification Revision 3.1 Version 1.8".
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [150, 500]
+    default: 150
+
+  sink-load-characteristics:
+    description: Indicates the port's (in sink mode) preferred load
+      characteristics. Users can leverage SINK_LOAD_CHAR() defined in
+      dt-bindings/usb/pd.h to populate this field. This property is defined in
+      "6.5.13.8" of "USB Power Delivery Specification Revision 3.1 Version 1.8".
+    $ref: /schemas/types.yaml#/definitions/uint16
+
+  sink-compliance:
+    description: Represents the types of sources the sink device has been tested
+      and certified with. This property is defined in "6.5.13.9" of
+      "USB Power Delivery Specification Revision 3.1 Version 1.8"
+      Bit 0 when set indicates it has been tested on LPS compliant source
+      Bit 1 when set indicates it has been tested on PS1 compliant source
+      Bit 2 when set indicates it has been tested on PS2 compliant source
+    $ref: /schemas/types.yaml#/definitions/uint8
+    maximum: 7
+
+  charging-adapter-pdp-milliwatt:
+    description: This corresponds to the Power Delivery Profile rating of the
+      charging adapter shipped or recommended for use with the connector port.
+      This property is a requirement to infer the USB PD property
+      "SPR Sink Operational PDP" given in "6.5.13.14" of
+      "USB Power Delivery Specification Revision 3.1 Version 1.8".
+    minimum: 0
+    maximum: 100000
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 3de4dc40b79192b60443421b557bd2fb18683bf7..46a3748c8be4dd1972c69cac6f90a990f7315953 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -75,6 +75,10 @@ examples:
                                        PDO_FIXED(9000, 2000, 0)>;
                 sink-bc12-completion-time-ms = <500>;
                 pd-revision = /bits/ 8 <0x03 0x01 0x01 0x08>;
+                sink-load-step = <150>;
+                sink-load-characteristics = /bits/ 16 <SINK_LOAD_CHAR(0, 1, 1, 2)>;
+                sink-compliance = /bits/ 8 <(COMPLIANCE_LPS | COMPLIANCE_PS1)>;
+                charging-adapter-pdp-milliwatt = <18000>;
             };
         };
     };
diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index e6526b13817452abd7ec74bc64e94183feddd39e..6cff2339bda3967e017166cc3cc3bd24e2f7d4b0 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -465,4 +465,22 @@
 	 | ((vbm) & 0x3) << 15 | (curr) << 14 | ((vbi) & 0x3f) << 7	\
 	 | ((gi) & 0x3f) << 1 | (ct))
 
+/*
+ * Sink Load Characteristics
+ * -------------------------
+ *  <15>    :: Can tolerate vbus voltage droop
+ *  <11:14> :: Duty cycle in 5% increments when bits 4:0 are non-zero
+ *  <10:5>  :: Overload period in 20ms when bits 4:0 are non-zero
+ *  <4:0>   :: Percent overload in 10% increments. Values higher than 25 are
+ *             clipped to 250%
+ */
+#define SINK_LOAD_CHAR(vdroop, duty_cycle, period, percent_ol)		\
+	(((vdroop) & 0x1) << 15 | ((duty_cycle) & 0xf) << 11 |		\
+	 ((period) & 0x3f) << 5 | ((percent_ol) & 0x1f))
+
+/* Compliance */
+#define COMPLIANCE_LPS		(1 << 0)
+#define COMPLIANCE_PS1		(1 << 1)
+#define COMPLIANCE_PS2		(1 << 2)
+
 #endif /* __DT_POWER_DELIVERY_H */

-- 
2.53.0.371.g1d285c8824-goog



