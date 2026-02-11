Return-Path: <linux-usb+bounces-33302-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC7FNQoQjWnoyQAAu9opvQ
	(envelope-from <linux-usb+bounces-33302-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 00:26:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E961284C7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 00:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AF6F303A88A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 23:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB883590B3;
	Wed, 11 Feb 2026 23:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9eKW+0F"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F534EF14;
	Wed, 11 Feb 2026 23:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770852354; cv=none; b=eVu4+fQ/wVdWZ2N4Aep1lVmzsYygM3Ku4QhyXQsztdt6Ko2qRgQML/TzksKSb5Qpd1fxn9iUS2/X5uVQSY9v3r5LpPnry1Ot9UNBNfaJeh3v3385ygt0SwzJ/tOF8VRcLSB8XM9ElSKUBLfdV99BWVyqnlnrasNv6zQfQMgnmCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770852354; c=relaxed/simple;
	bh=PlwEmw3A4E0VP3WkGD5smTIJlIwmqzK8kRIVO8EOQW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSJJvSCn8x0T3ijRAZQUibReNsHHrdapnyoIiDDP/ZW2ZiPVGKmVOLA1BgJImvfI9D8UGPfBarCPvi+H09MSr7sijYXutNkAHqLC0drjO32qkkDmKEGsNsmvxuNO3uS57PMR4UCNWfZz4qiknw9dgScldw35NL8s9W9aoPCn3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9eKW+0F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A627AC16AAE;
	Wed, 11 Feb 2026 23:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770852353;
	bh=PlwEmw3A4E0VP3WkGD5smTIJlIwmqzK8kRIVO8EOQW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r9eKW+0FVErzbqjbLV/oTWzDBEsplM6XG7Gt8SeI0arDNA3g2MY4EgNoMP5AbcPBz
	 QW8mVIczQg7zkBBnXMjsT7ZaeYCFgf5AP8N/CYGd0R/lwo8leEqPsMd6lloS2uZ//+
	 COqVNovNdNW2JETpf09BB2HT1SgKb5ap5+f+/u0ye2RolPH/0in/ehzQnBcI3tFlIU
	 cu4ARglTgIo6wS4SXDsVKc5b/U7ERrf/LaAH1XQhq9JrFR3uZAMvzBIAE0cXVE/8Qu
	 kTjg4Jy9OtZdteys++lpiOKtXGtlEyVvyho0xFzHQN6OiyVprRkac18OsorTzMTgvg
	 wd0pLSXapaYgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D2CECD6F9;
	Wed, 11 Feb 2026 23:25:53 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Wed, 11 Feb 2026 23:25:35 +0000
Subject: [PATCH 1/2] dt-bindings: connector: Add sink properties to comply
 with PD 3.1 spec
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-skedb-v1-1-616340426cdc@google.com>
References: <20260211-skedb-v1-0-616340426cdc@google.com>
In-Reply-To: <20260211-skedb-v1-0-616340426cdc@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Kyle Tso <kyletso@google.com>, 
 RD Babiera <rdbabiera@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770852352; l=4787;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=40ogrCcivnEF/evwbFDrjls1wMnY+vyXmAsgygJKhzE=;
 b=smnhzMHObSMHKVKd34C+12b8BOSyLH1WkwhnrzCDQ7JCFOMmY/TBOsuOB9RcAFdwYMAq8LUf1
 IOJavVJfL+oBGZWDor//g05X9ZjBggfDgGC4f/TVYEYFYdI/5RPb96Y
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33302-lists,linux-usb=lfdr.de,amitsd.google.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[amitsd@google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C4E961284C7
X-Rspamd-Action: no action

From: Amit Sunil Dhamne <amitsd@google.com>

Add additional properties for ports supporting sink mode. The properties
define certain hardware and electrical properties such as sink load
step, sink load characteristics, sink compliance and charging adapter
Power Delivery Profile (PDP) for the connector. These properties need to
be defined for a Type-C port in compliance with the PD 3.1 spec.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 .../bindings/connector/usb-connector.yaml          | 34 ++++++++++++++++++++++
 .../devicetree/bindings/usb/maxim,max33359.yaml    |  4 +++
 include/dt-bindings/usb/pd.h                       | 18 ++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 11e40d225b9f..901986de3e2b 100644
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
index 3de4dc40b791..46a3748c8be4 100644
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
index e6526b138174..6cff2339bda3 100644
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
2.53.0.239.g8d8fc8a987-goog



