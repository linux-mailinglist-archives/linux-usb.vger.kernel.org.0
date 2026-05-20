Return-Path: <linux-usb+bounces-37804-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLdSEyr1DWoz5AUAu9opvQ
	(envelope-from <linux-usb+bounces-37804-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 19:53:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3E594DCB
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 19:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99931307F689
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 17:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24123E3C62;
	Wed, 20 May 2026 17:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmJs9NaI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E381369D78
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296696; cv=none; b=QzOAXtBTOirxcins78XU8fpsgmmsA3C8HRL0TbHEbDduHzFcyjiVooDRN5abactwfifruaQmSM4ceFNAFOZWmBsFTdAWAeEIQWpjeXPmcy1BJAD0WEmnqeRAhj247/RCcO6cjAImFUxXJ+b61a/k6oOlGSKQJDUzE4+rroSoyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296696; c=relaxed/simple;
	bh=FLqUIX428NcdVXqPQ2yfeTF+6utbR8zEMIS+77WHeGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fNBd92vwxJgaKb6vhtd8tSNw5eFJ4dCWv4T2kxpwDjKYRuJTjYG3CcHEA5/bPPHH8MNDe7Nxobb2COC5iZcEFjLNVDqmBLaJWVaQ4e4CEDkfaXhRSHM36l8BTpccgICyEWvULES+vuCviL5K2O69vWYHY7N+6/UVf3oVvXhE2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmJs9NaI; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7c23248f3a3so52429557b3.1
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779296693; x=1779901493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Geiy5fyM7q9u/Ph5RCzfpkeFo9yFSQlzm5rQUMnd6z0=;
        b=XmJs9NaIioj6M2fCHZYqyj76Ogm8Uxt3zm6SDj4JZeQRgf+aBW8krHfIWxkuJB19N1
         qnEskcx2EWpkMcA7kRLLFhk5akAmjD8VGBIXCFKHANCbc9R1eQphwsi25YIFb9j48pe/
         kKER3XzozT5ikU3qGFRyuwnzJxnsaFldx6VOhmJoPW0TdVhtfPDoZd4iteq1tRnjI9nZ
         tY8OCbkJiepGf2G6ENLOV/msx5uN/2xb0OgDLFDQ9IGGIHwcBX2jikBX/PUpOCGUcI+G
         wCv4Acur0BFv2pvOtoTbOQ52qNTT8rDmHTxnlzauxOQlnltzCUxqiOy+ARhffx6DyvJb
         9R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779296693; x=1779901493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Geiy5fyM7q9u/Ph5RCzfpkeFo9yFSQlzm5rQUMnd6z0=;
        b=hqh2K+P+aH/o6fdSAPrDT16Qy6Q6WAp1K8VPV0TlWP7rE4HG+9pm7v0UpikXg16z9e
         70PypwiOtFf5czGMzoeLU8w6rdnbWN9ND/1eaZWgkB6f2+KcphBwhbyWEiUzgJeGtixf
         Kdpom9mPxJUe6D41v4b60Q8JItP7ZIXaSfPACJ6hMPtQNvRveaGYDqbFmkTX7rMojoZh
         6abINyx+bVhceo0Mfehfei95nqFhvX2JAGBl1417JtyH3beLk7DBK30Molraq+2Zqbd0
         9git4WwTsV0fV9LoaA/RVYLBAWfni5pj5ScdPx9suZY96uC5hcexbmuELEsjBhdEM3y1
         lT8g==
X-Forwarded-Encrypted: i=1; AFNElJ8XTp9j56OyouVPeemlOTpI06WwcYB42ZJ0tpxCqhNWlAOO/qO7IcwPO6Cqef0rr6ScDxHogqu6dYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS1twtdDZDwe84HU7E6OiEstkqvh+nR4lQ2ogk42hqYlmCiLF2
	dBLnfDcCUbz1Mgq2D27SCE2M/lg5HGB62D5qNsuztotCcSuB7Q5lrt0l
X-Gm-Gg: Acq92OG0Y79Km6vLEr21/HSdnEyIig4irNgK4D4uuOB2hNDn4Gghn+Z4H5D0QouWWz1
	mroWy61vo3lJtlFE4cdI2+S3hZKs8ZGmTYVM70S3BZtW8vylpRlzihHHCkPlBtKdFmxrAsUWMxi
	zymvFsdauXzpfQzEpO0xH67vbcKwNwy+WE4RKNkEJUBgy4IajHrC0T3gdvPKaa2nilqxKmEL+ou
	y9CbXUdHUKpWPkS+YoEovA/nyM6E30c4N8sWWtgcRtLjS536JS7YF/MMJRDcqhwHSQARpGW6yUK
	TqNzCDue6Jt90u4c3u4ECbpLWRBovTI9x0gqXs45Ia0R1o/S9yu1vxmL3k97ckCj7cCHA5Y6mut
	vvKnBar+B927ngthLdf5k9/KKytGn9IFDK+3yplxNo7ylglO8Wv0KDAhWysid48CRPL/EHL54Rj
	OHXk70jEP7C6RjJfyQsj+of18awGuBsKPxj7Bjall2oQ==
X-Received: by 2002:a05:690c:7341:b0:7bd:7039:f30a with SMTP id 00721157ae682-7c95d2d6960mr254992827b3.48.1779296693004;
        Wed, 20 May 2026 10:04:53 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cd0bfdc094sm51144937b3.32.2026.05.20.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:04:52 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file
Date: Wed, 20 May 2026 12:04:51 -0500
Message-ID: <20260520170451.2403-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37804-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 76A3E594DCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the deprecated .txt binding for richtek,rt1711h. It was
superseded by the YAML schema added in commit a72095ed8e65
("dt-bindings usb: typec: rt1711h: Add binding for Richtek RT1711H").

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Dropped patch 2/2 per Krzysztof's review. Resending patch 1 only.
- Added Reviewed-by tag to patch 1.

Changes in v2:
- Patch 1: No changes.
- Patch 2: Fix port node indentation in example; port is now correctly
  placed as a sibling of connector under rt1711h@4e.
v2: https://lore.kernel.org/all/20260518162014.18251-1-akash.sukhavasi@gmail.com/ 

v1: https://lore.kernel.org/all/20260518142901.1747-1-akash.sukhavasi@gmail.com/ 

 .../bindings/usb/richtek,rt1711h.txt          | 44 -------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
deleted file mode 100644
index 6f8115db2..000000000
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Richtek RT1711H TypeC PD Controller.
-
-Required properties:
- - compatible : Must be "richtek,rt1711h".
- - reg : Must be 0x4e, it's slave address of RT1711H.
- - interrupts : <a b> where a is the interrupt number and b represents an
-   encoding of the sense and level information for the interrupt.
-
-Required sub-node:
-- connector: The "usb-c-connector" attached to the tcpci chip, the bindings
-  of connector node are specified in
-  Documentation/devicetree/bindings/connector/usb-connector.yaml
-
-Example :
-rt1711h@4e {
-	compatible = "richtek,rt1711h";
-	reg = <0x4e>;
-	interrupt-parent = <&gpio26>;
-	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-
-	usb_con: connector {
-		compatible = "usb-c-connector";
-		label = "USB-C";
-		data-role = "dual";
-		power-role = "dual";
-		try-power-role = "sink";
-		source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
-		sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
-			     PDO_VAR(5000, 12000, 2000)>;
-		op-sink-microwatt = <10000000>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@1 {
-				reg = <1>;
-				usb_con_ss: endpoint {
-					remote-endpoint = <&usb3_data_ss>;
-				};
-			};
-		};
-	};
-};
-- 
2.54.0


