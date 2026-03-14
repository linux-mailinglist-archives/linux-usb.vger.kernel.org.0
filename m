Return-Path: <linux-usb+bounces-34808-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FWYOu7UtWm15gAAu9opvQ
	(envelope-from <linux-usb+bounces-34808-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 22:36:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E5D28F089
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 22:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F7CD304501B
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 21:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7354338657B;
	Sat, 14 Mar 2026 21:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJ6AaJNM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FAF19CC14;
	Sat, 14 Mar 2026 21:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773524158; cv=none; b=VeMt1l9AdkPRnI0ejo/uRXL6F94mxbV2j699la6JUOIc36Hr6MLTMOUbxakQkDjw3RsYb1Dwyc2srNv9U65ejPRPHv0lHp9oyumz+Z0TqfHpHPL0REbPFXRj9/E87Qd9L34zvlv+grsSnhs02qT0pnAttwfdOcx6LEzbTKKbYP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773524158; c=relaxed/simple;
	bh=g/xBmMieTftFxOV0jXNzj4zN2BEPB7wVjagFNj+f0eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVCExsIQgp9haaHdTcge7iWjm0XiSTlUkV9TyE4dtIO3G6jbaIqvIoaDX78pqSgwzCL37B86IKxrXU0Kkbspu3kllJhVPw1JGD6zTn0CgU+7aGync4Fs2NWJbbLQ+ukKJUVdyiZObYvgIYqZW8xbLPg9uFhRHK5/dyuMCwXaFhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJ6AaJNM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90645C19425;
	Sat, 14 Mar 2026 21:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773524158;
	bh=g/xBmMieTftFxOV0jXNzj4zN2BEPB7wVjagFNj+f0eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CJ6AaJNMIrUx4Jy5SVUC5c4p+VKwQI8GLI9QDjcibATgdgHWp92LZ4VoAPpsOXuzU
	 0TgOcsozJv1pbnRj1o40ZjE0AJA8xIEHw0AFZovxEdkbGPGi+4WHOc8VdACdJuS0kT
	 GApQ1sJ4W7/RQpTQ9rFmOT1YSguvuVouvOvQf1RfgyCWcski+Wjm7OXb/z36xyDoye
	 TTOJDc6Szb2fhjWu0DPdI7Ig9oC7T9ygiJu16Tfzbf+rTZ8eY4Z3FmIEhqUDXy6Naf
	 riBEBbXqjdr6dqwCNQFjQk5IsgpJ5MvvwTD55IZPz2YyYSsRagUu4b//uhL+kK9KjQ
	 NyGobz41Dwudw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738B910854A8;
	Sat, 14 Mar 2026 21:35:58 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sat, 14 Mar 2026 21:35:36 +0000
Subject: [PATCH RESEND v8 1/6] dt-bindings: mfd: maxim,max77759: reference
 power-supply schema and add regulator property
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-max77759-charger-v8-1-226ca5f8c7d2@google.com>
References: <20260314-max77759-charger-v8-0-226ca5f8c7d2@google.com>
In-Reply-To: <20260314-max77759-charger-v8-0-226ca5f8c7d2@google.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773524157; l=1897;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=jhi3LiwPsleVWOln5S8qRndmcbOrwaP4Zb8w8wenVU0=;
 b=58aePZC6MIyU6BMALmMH8GnM0VxvXosdtOaKEqs2nUrnSRrP3eBEmueWGEz6hGgWGgdK9TLcq
 K2TAFQcnjW2D5K3ZcRu8Ko8MqlVcBrIVomYpa7sjiE7r+R+nc7orI26
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com
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
	TAGGED_FROM(0.00)[bounces-34808-lists,linux-usb=lfdr.de,amitsd.google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,linuxfoundation.org,google.com,linux.intel.com,samsung.com,gmail.com,linux-foundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	HAS_REPLYTO(0.00)[amitsd@google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 50E5D28F089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Amit Sunil Dhamne <amitsd@google.com>

Extend the max77759 binding to reference power-supply schema, so that
PMIC node can reference its supplier. Also, add regulator property to
control CHGIN (OTG) voltage.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/maxim,max77759.yaml          | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
index 525de9ab3c2b..42e4a84d5204 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
@@ -16,6 +16,9 @@ description: |
   The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors, USB
   Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
 
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml#
+
 properties:
   compatible:
     const: maxim,max77759
@@ -37,12 +40,18 @@ properties:
   nvmem-0:
     $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
 
+  chgin-otg-regulator:
+    type: object
+    description: Provides Boost for sourcing VBUS.
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - interrupts
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -59,6 +68,11 @@ examples:
 
             interrupt-controller;
             #interrupt-cells = <2>;
+            power-supplies = <&maxtcpci>;
+
+            chgin-otg-regulator {
+                regulator-name = "chgin-otg";
+            };
 
             gpio {
                 compatible = "maxim,max77759-gpio";

-- 
2.53.0.851.ga537e3e6e9-goog



