Return-Path: <linux-usb+bounces-35058-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPInM0O7umk4bQIAu9opvQ
	(envelope-from <linux-usb+bounces-35058-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:48:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E02A2BD818
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF5A930D6842
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E183DE431;
	Wed, 18 Mar 2026 14:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="eXUceUfZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B743F3DD511
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844403; cv=none; b=DvI4MMche5QLmpuhLCXMGpRqE4Sm5zAa/X2uUk+Ed/xj5D8FIUEt8+N7F/TY1On47tpNaOPYqdOMaW/C4Oererkj+rK5H/wixur0wmrKLckXUUEUZfToSU0If0Dqsq0HLdJiBr6IcCKhf+u+xwDqjlW4l6Z6tV3Aq1E/MZ8Ksa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844403; c=relaxed/simple;
	bh=SWwU2pOPUl8qRUMi6Zu0uI8G4Sbh5J1V/0WUKZlPYKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OhVmfmLY+XKMybQYg4u5FftwdGCfNtfSo2V7uo1UM6Wj5k4P5E86p7sU3GFMeYZ/1TGQYQhUAQnYVM5k6cAiZs0O+RVjyYqlHVssrr7N9knYP1q3pwLN99yxKc4N7mcZoVxNBVeF68EO53rbZ22IEp63joQY++Qc2fA5Xn7/Ry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=eXUceUfZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48541edecf9so75671475e9.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773844400; x=1774449200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAbEi8TFYqnDaY8fBbFVjb7bhf3BVzUht5+vvpwhfSY=;
        b=eXUceUfZGGd/AwubPq7g4u1OUSJusxFnHx+O451/KHkDynugiQWr59gH+LjjsuMbIT
         ECRakzS2Kq3LYboKBii5Tfj9VthqpgMr0UP3vc8ZeA1BOo2yYKnuWoRY1tHXglq7v3PG
         bXSt4h29NXcxe+AX5pBMXwnMFQN2u08AIw9XtutDAQJCad2Xgw+rAGpB2EV4o750XEL0
         maxsfiHz24e82EBEiWyRu+L/+7ssY4buOgg81jXlJwr8BavDqUFk8eHdpVqdazKt/rNI
         gEyKE4IlQHdTkvW+vvUPqDqLBlfJ+CU/XyMzdgO26atZccp0rgybmtes9ueeAV2nm/cJ
         ek3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844400; x=1774449200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAbEi8TFYqnDaY8fBbFVjb7bhf3BVzUht5+vvpwhfSY=;
        b=YSoQVIQVujlEFgtWuEc75ro4g6wSypq3Mhqra2VDkSMA7EedzwdNG9ET5Qi0FpEMcE
         DqptpIEPARxhgCBf0JFmuIfXRHDu4GNJfCAXbeJ7YoYtcwc8ECi2T0CPjOv+J7OkidKq
         312SiO67b/maV03pvF/wq7cTtfCrt/SHD+UKxCpu4agpbbHqhxtuYpfng37eBOFCLW5o
         JsI6YoWZd8j+87WBYPtqavV3TdxN5frF79RWGEQMfK2pz6s6oxQMkc6Io005g1ikFgC3
         wbKkenXXorZHBPgM8+xA1nATszcxkZMQ4753N8wxivmJvrraRuVK8gdlx0bwZQPNhBrp
         WOwA==
X-Forwarded-Encrypted: i=1; AJvYcCWwB08NoaaNSSk/x8vZVOmITi5i8YuyESkN70fykhizCSjjjEEePhKax+gcYAr8nvuvbwIojTo35XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJCx918L0HZ/+rkpvQlFjJ6DIVlfbOJaI/QZqzt4YOcNYcbWg
	v1+Ii/Z5wop3azgbMKqpybVya0Ykd/2ye9YmF5wolyJsjUYFk9XaBlqZ+vM98EUKevQ=
X-Gm-Gg: ATEYQzwehRuTIt8zqLYShyWllK+xRqIBqpNRcDye1Ep0IrjIwh7F/eZnL4LXk578ikH
	SO3R33AX6ephqvtlWTIjMANWm6T0V6JcRFo+fXgI1L/UX8yM7odICx/O1Du5vVK5LgahuZ7Yp7f
	PnAI+0kAUmP5WiLnqvWiIihJl2FqTfzmwvLRlTGhaBwZUcw1W+LJ0C3kz5nluR/oAT+XJeHA3+X
	TAaWg8bOXDrZ7GXA5KubCtMVYykjZz6YGNenJdieeyjx/la1SpaLiZSbJTThIUJNqy8GrRVf6Dk
	sT9YmY4MKzRgD8kcStyKJ7kt9div2Sg3+5QXyOo/X4NkLNN15EjYekVMjV/mEN46xONIqBwIGQp
	r3kCtik2pHorCdA60WHz5EQMt87ASb3VIna4v9Hbba4CMv+K7HmaemZVdS9k0SR5kMi8OqoSZVS
	AT76BihMablkFeiVV2han+MRcLL2xfgWyLSk/sVcWUu84pQuqj6FUHzQ4sa5jyZ9dGTkl6PugAr
	Ch5gQ==
X-Received: by 2002:a05:600c:34d5:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-486f4457b0fmr57784475e9.26.1773844399943;
        Wed, 18 Mar 2026 07:33:19 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm270642085e9.3.2026.03.18.07.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:33:19 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 18:32:55 +0400
Subject: [PATCH v4 3/4] dt-bindings: usb: richtek,rt1711h: Add Hynetek
 HUSB311
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-husb311-v4-3-69e029255430@flipper.net>
References: <20260318-husb311-v4-0-69e029255430@flipper.net>
In-Reply-To: <20260318-husb311-v4-0-69e029255430@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=alchark@flipper.net;
 h=from:subject:message-id; bh=SWwU2pOPUl8qRUMi6Zu0uI8G4Sbh5J1V/0WUKZlPYKM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTu2r6kJebd/O8X46MuTIhZ12Ls2OkgcKAzegJbpcrxK
 v3nvHu9OyawMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 Q0MdYx0jBi5OAZjq2i0MX6UDZJJX6aeZlGn1vzH2trgR4Ph5x5dZf9csZ5bOuKZ1kZFhYfb1/eu
 1/eNXLA2sfevTXlX3qq/n5Mtbod9Ndn4+KbaYFQA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35058-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[flipper.net:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[richtek.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,flipper.net:mid,hynetek.com:url,xkwy2018.com:url]
X-Rspamd-Queue-Id: 2E02A2BD818
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HUSB311 is a pin-compatible and register-compatible drop-in replacement
for RT1711H, so add its compatible string to the existing binding.

Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f09-bacd-0440d2c21088.pdf
Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526.pdf
Link: https://www.richtek.com/assets/product_file/RT1711H/DS1711H-04.pdf
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index 210090308e7c..7ded36384518 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -22,12 +22,17 @@ properties:
       - enum:
           - richtek,rt1711h
           - richtek,rt1715
+      - items:
+          - enum:
+              - hynetek,husb311
+          - const: richtek,rt1711h
       - items:
           - enum:
               - etekmicro,et7304
           - const: richtek,rt1715
     description:
       RT1711H support PD20, ET7304 and RT1715 support PD30 except Fast Role Swap.
+      HUSB311 is a rebrand of RT1711H which is pin and register compatible.
 
   reg:
     maxItems: 1

-- 
2.52.0


