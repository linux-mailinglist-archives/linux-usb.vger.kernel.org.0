Return-Path: <linux-usb+bounces-37157-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDY7NdUq/mn/nQAAu9opvQ
	(envelope-from <linux-usb+bounces-37157-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 20:26:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED24FA910
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 20:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 769E53031014
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 18:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295003D6CB5;
	Fri,  8 May 2026 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJyMfAqU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2F21862A;
	Fri,  8 May 2026 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264763; cv=none; b=cJvcbkQwU/SmUP2RIT3zmJFtjmcgoQmh+RJiYSUhqIX9mEC0uE1+hQAhcFDrSPQaALF6j1DKw8TL8YfXauBsIWAobbLcBS+Hq6XlDuiT5dkbWTmB4eywr7KOuMjgGTKwgKbQ9QFHZw5zA3FGnNxqF36KJFHJ5WwOb2ldeAkBjLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264763; c=relaxed/simple;
	bh=38qbE3vXEBRan4uOHnNqJ8N8mEhisyv5CbhWDXO+zuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i8vw3u8biK9PePaEe2DtlTrJcWK8Jh3X/2oeHPUpw513MkLdpMybmcHfL7wSb2hIbrRGcZG5t/EaXVt26oQfvC2ZPBme1Ffbqfi9RWyvblDdlVimdBORIAhJ2b48BH+kOTKLcgISX9AzqqVhQtNe7wY+cHFJl7Es6r5c5canlfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJyMfAqU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA0CC2BCB0;
	Fri,  8 May 2026 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778264763;
	bh=38qbE3vXEBRan4uOHnNqJ8N8mEhisyv5CbhWDXO+zuE=;
	h=From:To:Cc:Subject:Date:From;
	b=EJyMfAqUbxcjjWdW1xL/1Tj3WYb6ZVMDdFdQUJ6tpQGj+TutHpgtiXxaMgg2RX+i3
	 AVlv4rUz7sOIp0sIlTJDDXAB247UjdqNrRqtbPdRPxICIjhYsPO0saeJp8KbzNhyYm
	 6dDqmLmJ9eGDPnQOO/rGGV0cgVkhAQ2TLJ/SXBmFdoBroaeIuLf68ySeNcSYYwVi03
	 rQgifzDP2GL/wboStz5euvAHpBRghipCNp4QqU8CEEBrVS9ingZen9isAZHSTUdX03
	 ykv+P9vu22SR+GDLfxpC24KT1lJbPVRTUwKxi0owcXKEjL0tAPrVwu0p3ooBvOS+FX
	 2EELICS+IZ0BA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: ti,omap4-musb: Drop duplicate 'usb-phy' property constraints
Date: Fri,  8 May 2026 13:25:55 -0500
Message-ID: <20260508182556.1759173-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 77ED24FA910
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,ti.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37157-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The deprecated 'usb-phy' property is documented already in usb.yaml and
doesn't need a type definition here. It just needs constraints on how
many entries there are.

As this is a host controller, reference usb-hcd.yaml which then
references usb.yaml.

Fixes: 70fcdc82cf4a ("dt-bindings: usb: ti,omap4-musb: convert to DT schema")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml b/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml
index a3d15f217658..e1887e490e02 100644
--- a/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml
@@ -81,9 +81,7 @@ properties:
     const: usb2-phy
 
   usb-phy:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: Phandle for the PHY device.
-    deprecated: true
+    maxItems: 1
 
   ctrl-module:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -96,6 +94,9 @@ required:
   - interrupts
   - interrupt-names
 
+allOf:
+  - $ref: usb-hcd.yaml#
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0


