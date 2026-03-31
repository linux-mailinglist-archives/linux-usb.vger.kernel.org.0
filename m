Return-Path: <linux-usb+bounces-35748-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIjwFU9XzGn/SQYAu9opvQ
	(envelope-from <linux-usb+bounces-35748-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 01:22:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B94CE372B3B
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 01:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18E5A3087D44
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 23:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331E447798D;
	Tue, 31 Mar 2026 23:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oG9m8IW3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351813A962E;
	Tue, 31 Mar 2026 23:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774999354; cv=none; b=lRnm+4OVFb8NtcnCQmLZ1okXjpm4i/Yp/C2T6DfvzkK31viSoCgyVYV4/Y96nw1gCWQyZs9l4kfFeRqMFWYLDC3Jt4p0uAD9paBxII2BTn/zcNrsk3Sa7n4iL3POT5Kef3kMGTWsYB17a5xIsA8roL6AGuIiHo4N7pxaXckqeoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774999354; c=relaxed/simple;
	bh=yVSkzMoIiEi6F+TnVZvEsbCsbH24NEdph1D1lWEfwb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5oBh1qUWOcNQC/7xyQWytA09dsJ7U7mScp96bH78yTNEjk+bzt1asro/UH0ZjS4kdnC5aeEhM6YKZj8B++Ph094yGV/b6MDFOOlhClaGfa6r1Tjj+MBG6JRGFUKEvGcf3hmkObs6n08ubLkkLfjn2klCDat7Pueuh3xem/xv3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oG9m8IW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E379FC2BCB3;
	Tue, 31 Mar 2026 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774999354;
	bh=yVSkzMoIiEi6F+TnVZvEsbCsbH24NEdph1D1lWEfwb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oG9m8IW3yKN5GnZosfRdEby1HARIrGONrA+Ydqpwxz0fOy4XJuVSDJK+ERu/btP0p
	 RZFddfOXAgHDsQc1Tg+CLXntvIebYKlzz2vOvSKvHFBbIjvADZeoYJeon5/vDGziNa
	 5/sG8bUYLeK0J0PnJnlNdjyqNWt1xV3F8MnP/1q4+8jWVSz1j8oImdMzXbRfS/KXcd
	 lJG8Ow4b4EqRjf0pn+3dJPtDOLx7N/UMn6gGT/H+WZtx8TDLuE3+j9iEMXFedpw8Qh
	 27HMFxZUFeZwInfyR0pfuKLRNOGAx6hqY45BfztckFKM0gyf5cA5wHRq+9DCGTPrkD
	 EOTf3Sg/MMpMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FA310F930D;
	Tue, 31 Mar 2026 23:22:33 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Tue, 31 Mar 2026 23:22:17 +0000
Subject: [PATCH v10 2/6] dt-bindings: usb: maxim,max33359: Add supply
 property for vbus
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-max77759-charger-v10-2-76f59233c369@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
In-Reply-To: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Reichel <sre@kernel.org>, Amit Sunil Dhamne <amitsd@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774999353; l=1273;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=4jiM5mZWw6E14KPjmNH7xjh21nEwmEWW4euwMH1QFQc=;
 b=DAKcYxzYxqOnI35WceC31tJzv55UFXjR6N1HfVLq3swOQaZh7NXlQ8S9E87bY5qm43+O9pzUe
 peSklwHuJKkALbz3D5coiOMgQ7Zx+VTA1pf/umiMXuDQWY3sxH6g4hW
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35748-lists,linux-usb=lfdr.de,amitsd.google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,google.com,gmail.com,linux-foundation.org,linux.intel.com,samsung.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	HAS_REPLYTO(0.00)[amitsd@google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B94CE372B3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Amit Sunil Dhamne <amitsd@google.com>

Add a regulator supply property for vbus. This notifies the regulator
provider to source vbus when Type-C operates in Source power mode,
while turn off sourcing vbus when operating in Sink mode or
disconnected.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 3de4dc40b791..e652a24902ea 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -32,6 +32,9 @@ properties:
     description:
       Properties for usb c connector.
 
+  vbus-supply:
+    description: Regulator to control sourcing Vbus.
+
 required:
   - compatible
   - reg
@@ -53,6 +56,7 @@ examples:
             reg = <0x25>;
             interrupt-parent = <&gpa8>;
             interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+            vbus-supply = <&chgin_otg_reg>;
 
             connector {
                 compatible = "usb-c-connector";

-- 
2.53.0.1118.gaef5881109-goog



