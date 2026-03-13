Return-Path: <linux-usb+bounces-34750-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA3RA5UctGlLhQAAu9opvQ
	(envelope-from <linux-usb+bounces-34750-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 15:17:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66658284C63
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 15:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23AC832449AE
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 14:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B143976A3;
	Fri, 13 Mar 2026 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fSMsv3AF"
X-Original-To: linux-usb@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49716317164;
	Fri, 13 Mar 2026 14:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411152; cv=none; b=tyLZm2GHvaR99uZskDU8gKF28XjiAdFml9ZNetNbpb6WpkCErC9MDS4PCeZS8+2Ivsq7mBQvtknIiF/o6wJWClF+QlhWAqzwvkBnpdDNKehFRQdhpFX6rwzrLDnXriAyi7090UID3NeUOnQCcRGxxrFTj5dTeYFdHxw4DMgJP+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411152; c=relaxed/simple;
	bh=PxFg/Zz2g6RSbfEJ5qOmR/kgxLuCrp2pJQD2tP/Fq/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XcUsIUOFkE315KnQNoeAd6MKipjb8LolVidwwbXsSCRhzq/IK6q29k5MvKJ+ra9P4BIpKDBlExgXEibWNxvGPwJhVqmNuB6kG+2QPlruoCmJaEsmZCx5xO0QN49NVyhoOGFFhuoibgPO5yRWJjJUydROw2aly9W+PuMp+vcrAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fSMsv3AF; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=kAVg/sYPnXBAvpoucWG8yYJST8CnCLSxx7MYSqDw6RA=; b=fSMsv3AF1L9YrqaMOW8ZGzbX+C
	rrGJfl+v6Y7UxlPpXN4KrEU9oZwLkAqXxqtZlijRqjSmq1BkQZ4/DtRJ/8GMSkaK1wrI1WxU2Ogiv
	GPeXblft23YaC+UvTep6pA/yBhVDk/gifacj4OKJHJsu1vgD1V49BDDGsSm1mxFoPquqqJEKK1YGG
	VWgNGeUipfZl+wjN14uvEQCiw9iMq1IjfYBwnFt0ygJnYSgOswz/LKUGFgrKhdOuEPL61fODd7s6d
	+UTPMAoXsgEfSqYLoN1z/3pGxxE/vYhHgUbYLQ/cJsZUTfediWpOBh6zCzXkQxc0bXqHb1/8Z1eCT
	vd7CIcig==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w13Fc-000AWh-1Q;
	Fri, 13 Mar 2026 15:12:28 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w13Fc-000NT6-0l;
	Fri, 13 Mar 2026 15:12:28 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: usb: ti,usb8041: Support nested USB hubs
Date: Fri, 13 Mar 2026 15:12:19 +0100
Message-ID: <20260313141220.1843488-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27939/Fri Mar 13 07:24:42 2026)
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34750-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-usb@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ew.tq-group.com:dkim,ew.tq-group.com:mid]
X-Rspamd-Queue-Id: 66658284C63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Onboard USB hubs might be nested. Add the reference for the generic
usb-hub.yaml binding and lift the restriction on peer-hub.
A (downstream) hub might only be connected on USB High-Speed lines.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/usb/ti,usb8041.yaml   | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
index 5e3eae9c2961c..07e13fae640b7 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: usb-device.yaml#
+  - $ref: usb-hub.yaml#
 
 properties:
   compatible:
@@ -30,17 +31,20 @@ properties:
     description:
       VDD power supply to the hub
 
-  peer-hub:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandle to the peer hub on the controller.
+  peer-hub: true
+
+patternProperties:
+  '^.*@[1-9a-f][0-9a-f]*$':
+    description: The hard wired USB devices
+    type: object
+    $ref: /schemas/usb/usb-device.yaml
+    additionalProperties: true
 
 required:
   - compatible
   - reg
-  - peer-hub
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -56,7 +60,14 @@ examples:
             compatible = "usb451,8142";
             reg = <1>;
             peer-hub = <&hub_3_0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
             reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+
+            hub@1 {
+              compatible = "usb123,4567";
+              reg = <1>;
+            };
         };
 
         /* 3.0 hub on port 2 */
-- 
2.43.0


