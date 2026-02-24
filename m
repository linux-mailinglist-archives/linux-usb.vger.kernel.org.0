Return-Path: <linux-usb+bounces-33653-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pfQZA0mlnWmvQwQAu9opvQ
	(envelope-from <linux-usb+bounces-33653-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 14:19:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F216187840
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 14:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A098031C943C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 13:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD4B39C63B;
	Tue, 24 Feb 2026 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdCpSlH5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D8D39E165
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938939; cv=none; b=Sa1lVygD1SYzluXEWtdiPix9OWqQlg2jMGOxESOjc/CkRjrtCdh57vBoeCpa5x1jocPYONMwQepeKIz8PWtzDnxF4DaoU8SRXZeJfOQjNybISzGkTJ7bNbEnPePB1npltDWwNCtL2hlpxdDvePeJgkCDNoF0qqu0ghJxkms6wi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938939; c=relaxed/simple;
	bh=Gggo2FgINM2WUDHfNHU07LBnf1tkxqi7jKz6gpfZ9Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/vhF8+2QAt3/tlVT+IJ6jx/WI5GxFw3+BCEtkkHu7/Q8/pcS7mgqOTeu43x6RG87nttVLL5M0UyMZs+VC+czYd25Nenir4pfi3QRutBLZA0PSeMnwpZk0M+7oOk76kQpxMvUj1Nt25+27Scs+JR0dPfQY7qZ2tBiwNILrFWwxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdCpSlH5; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8249fc726e9so2864049b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 05:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771938935; x=1772543735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKCYhHbR6vSjsD8wHgb8LL/2bafBoxxkBbchRF8aJrw=;
        b=mdCpSlH55n1i90IQpYSETcv90bbdjyDpI77mChTx2UEHaK8fF12QD4eQbptkVIDJSd
         qBReks3beVCCqm3oebYIrv5wnyT3OmuIx/6TCFUXgn4gcjXhMUWM7qzvH9NWm7UPrc8X
         ZVw2lTf51jqjwDkgHAJS/ScmVjG9kn3lLHbFiCPyWCkTJUQScIJXOR/KL0+QnEZQe5fp
         /yNy48EjmeFYu6JpSut9goYiftiUF71B6v7nwfMnSE9Zvi3vFEYyFoJSQ8gi+xW3JmN9
         pb19eQf6GQUYuEkWxCjaESeynHhsFgmARonTNcuvKOfolWucFL9+vn5gqLg1xIQxsPyN
         M/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938935; x=1772543735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKCYhHbR6vSjsD8wHgb8LL/2bafBoxxkBbchRF8aJrw=;
        b=oR/KWcRlBSI2Br8kEifCnCF8eLg9ME7ded915Uzhn7szEUPxVFF0oI/2gXSNrqvCp8
         fUPpbAqoQGhmEy2d4sGtHi3xiuMBqPWzIoNKIpWQUqxLnbPvaMq0GPdscEyarJ++EIhQ
         bgS+HpVtKEceqgpYQMEuEGG5gt8BfuxHDpUdEE6n9aLtSuR/Ju2+lojZwhJu9xV+DmFE
         uvhppMa9vEmrIa9PTspuFgYQVa3BNndaRxXm1btHGAfRqoy/M2sJ4PcsrAN+wNw44BuY
         6ul088sutsfsVmONrtI6dOvDg0jhgp9FUdNHiVGgN+txNt2SCx8MZS8Frn1Ew6E8rCrK
         sbtg==
X-Gm-Message-State: AOJu0Ywmem+uDJH1i8gTfSIqbiECeiM+5KnLWomoQHav+UM+/IYiKbm7
	JDo0xPFLUm/rQeqalfO9KLHCLIebHw3wqMZymOESHkHJvNin0uzJ5Fc3
X-Gm-Gg: AZuq6aK3NDxlTCto3cUkkCKt0Objw+nlXhti4M8MzHUVVzx30O60z7hr6cJsf9P1nMj
	AMV8Q6woDZti+x1rST4CedwCB900HGHuLGC/vdcsP8Hj30ejHirHZsLCHsAZZeG07u/WBzhJmAx
	BSt+48Pu9gYx0tI4vKgSj/4VQJM/sfSp59CMCg4U2jJEGcPdtpKsAEVKulphljlDEFu4pwqQvpv
	KlSLmgjHRjjuCeLxXdBayvkamTSPRIYYBqd5T8RWKwdMRIyu7nOOS+SlX3mIod//IcsdNPElIvf
	gPiK1OcZ+DZr90xfD4wjmINc34nQheJgPjV83uKQ7Ef+IATxmj/Z9t7QxLhJQo/u/kGx2EhnL3k
	KoeMu5pag+TRIOMA8Ue026ySZ5cO6e0HLTeasLKGKE+7KE7enF862U4ZENawRy6QdWi3aHv+fMA
	lxiN5l86NRf52AhXs1k+LgHzOj6GGw9xZVBt7N5QJdqg==
X-Received: by 2002:a05:6a21:9984:b0:38d:ed39:35a0 with SMTP id adf61e73a8af0-39545f8e14fmr11302252637.61.1771938935081;
        Tue, 24 Feb 2026 05:15:35 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.171.51])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm10794013a12.24.2026.02.24.05.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:15:34 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 24 Feb 2026 13:12:59 +0000
Subject: [PATCH v2 2/4] dt-bindings: usb: generic-ehci: fix schema
 structure and add at91sam9g45 constraints
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-atmel-usb-v2-2-6d6a615c9c47@gmail.com>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
In-Reply-To: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33653-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 5F216187840
X-Rspamd-Action: no action

Add clock and phy constraints for atmel,at91sam9g45-ehci and reorganize
the allOf section to fix dtbs_check warnings.

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


