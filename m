Return-Path: <linux-usb+bounces-34177-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBG/ATHtq2lziAEAu9opvQ
	(envelope-from <linux-usb+bounces-34177-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 10:17:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 844A922ADC8
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 10:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 803353034CBF
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 09:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975411C84AB;
	Sat,  7 Mar 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etzpPrPG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C073389E1D
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772875003; cv=none; b=oE4EcbgNut/onWGmSTh0iGKLVACQWV4NLYZoeT0VezKl/4B/xoEmxYH4igX7Z/HgSvQ0kFBwVZx2KqC2NL/3h6iw8rpj9dxi/ByD62Z4RLAUddFyO13nwUmyNH7kEWFlvx5V91g7JB0jisVhmfrMsVLfQAZkVnSg2ALb/y96OBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772875003; c=relaxed/simple;
	bh=cH8XHDO7Gb80UhJfjApmC6lvcN1SnHge5zBEZqU9hRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPtPjRKyfgRFCJDCpH9wOlWLN80J77wLdKbz1E5pEOFtOlXIjgyeHAWCMC4pzKVzEYwPwpSbVvuy4ExSTqMHEQeHoEH+rcFLOYn1Uu2UTxxPQEIueGMbWggsSvBoTBtrGScuVeRcZwkZWYOucqGr9oqZOM8RivnYbpCmlawnv7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etzpPrPG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a871daa98fso75643695ad.1
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2026 01:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772875000; x=1773479800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPJqfUemt+ZKLj6gPNDYrb4MQbmVYu6fyinUsFcbIMs=;
        b=etzpPrPGWmZMc6eJYL/dYyinbx01HcmnE1OBJXbt9zXbG+5wazbGypFBDk1HXlzSpd
         +KWMGBYQEvn0ObbAgbroHaDpjdEEgD2F2lPBh4eRfAL1ILDCi9Q1c9zln9yPFKLrAuZe
         hOxvwHl1YyJ+Rr76HpXBo67/G2tkF1Pfic2lzAyJgwrx5Z8tY+z492Qo8eIo+YsR2ON9
         /yeCWbLoERBDHhkzZAmMtOJcO/KKNaZxkhmCj/fhedNsLN5mxeTmJPTNxQc/sZ4HYF2C
         iKR+AmLWf/s/fnVkLfYaKL922hA2qOb+bl9o+eQW247PctAQ9l94/NEyBVYCa2olbTX5
         qlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772875000; x=1773479800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OPJqfUemt+ZKLj6gPNDYrb4MQbmVYu6fyinUsFcbIMs=;
        b=WvKoxWZN5/1heg3D5TDXKRKL6tS5bWq+NIx7V2ujopvzVp+9jqI8da8m95UsJ0K15O
         KP3iqTc1GAKTmKVrqrVNeGZTFh+62GRh4WlAI0tA7y+g7a0+EbVCqQVUAfUPq1l6CJJX
         ++WZHoM80jFOygNdWiVJ/jvF3BjudJi2fmaya+jjw5DPz14Ozy3k9IojpShDF0zORQQ7
         GDgKON87m5ItS3HwIWIiy490i/PxSr0eQygboHsWKwxtGEvdHnFr5RmIai9IR8tQ6NQx
         MYiLelfbtvw+mS530t85TMbEppfqRFSxmaFT26Vc8uQXWX09jd3Yai28BM6+Ztas0not
         ptIQ==
X-Gm-Message-State: AOJu0YwsmVgtvh33e7gz5mE38pwrkaCdbALDZtIEpbYhdakCxHZL+dFr
	y9sj8zuYtsCoglHJ0Ug6Uu1JJIIuX3LxCcwP04mXgSw7A2lUq3ZzytuT
X-Gm-Gg: ATEYQzwvdBVV4wiXc3RM56+BqD5qZtmT03jpnNTwgl/zEWsCMfy5FXLt1+LgaqjhISx
	PUrUZ/ppsWtZ7LlvWErSvq5NMMoHOS8LUsZl5ZvbnVp7kqrXyl1FlFcSu8DsWExIuUw0mDTMUG2
	x90PZaCMj0Z77JYbsK+Tka869wdWQQWQoe4JhOnFbmEE4SCJCNL0/6bpaRU+diFg3W6Iud12dX2
	BbuckNCHbikBQ6QXfMWzH+t414OISKL6naWjr/4WGOZC+jnRtcECx6SmSa1pv4+/SRVfk3fvFTo
	0t4Xxk1P7mM3k9QLS5yEWUkBBlfA80Tyak9k8O6q56JknhDER1NUM9FTT1FbDJpTpOFVL6ghyI+
	wHyR3grOJhllfcnwmqw3uoxM2r6jbS53X5vc5XA+Ly/ok6mN4lvQsU7eJpW1m1pUEdhw23Izc/b
	1X22tGJUQwtE5aqF63L+22695M0SK1Rt6D1oj0Zivzy7A=
X-Received: by 2002:a17:902:e5ca:b0:2ae:50ec:fa35 with SMTP id d9443c01a7336-2ae823a90f0mr55806145ad.24.1772874999680;
        Sat, 07 Mar 2026 01:16:39 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:39 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 07 Mar 2026 09:16:20 +0000
Subject: [PATCH v3 3/5] dt-bindings: usb: generic-ehci: fix schema
 structure and add at91sam9g45 constraints
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-atmel-usb-v3-3-3dc48fe772be@gmail.com>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
In-Reply-To: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 844A922ADC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34177-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add clock and phy constraints for atmel,at91sam9g45-ehci and reorganize
the allOf section to fix dtbs_check warnings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/generic-ehci.yaml      | 46 ++++++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 601f097c09a6..55a5aa7d7a54 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -9,19 +9,6 @@ title: USB EHCI Controller
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
-allOf:
-  - $ref: usb-hcd.yaml
-  - if:
-      properties:
-        compatible:
-          not:
-            contains:
-              const: ibm,usb-ehci-440epx
-    then:
-      properties:
-        reg:
-          maxItems: 1
-
 properties:
   compatible:
     oneOf:
@@ -167,6 +154,39 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: ibm,usb-ehci-440epx
+    then:
+      properties:
+        reg:
+          maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91sam9g45-ehci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: usb_clk
+            - const: ehci_clk
+
+        phy_type:
+          enum:
+            - utmi
+            - hsic
+
+      required:
+        - clocks
+        - clock-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.53.0


