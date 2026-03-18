Return-Path: <linux-usb+bounces-35037-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMhSCJZ1ummTWwIAu9opvQ
	(envelope-from <linux-usb+bounces-35037-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 10:51:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A753A2B96E8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 10:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3465308A52E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851493B0AFD;
	Wed, 18 Mar 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="wtqs018i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25A3AE184
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825850; cv=none; b=CYO4xNChe7HULO8yZuguW1yBSd19Tni/9W8jHNgQIC1nfzVyQ78IVeB5YB4jnDLWw4ifdAjIoWUIyQjnkeexWJ8Nwsq/k/sZ1qvzhYgEwfHnj09SUN7TZp1y1cfeS/9rEi1DQ91s+k+jx8HR/NaFaBGj/N6JRVKPvVX+qsBax4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825850; c=relaxed/simple;
	bh=epfoYBJ5kMhEqlncsOICDIG4Pcj2iVFAfms6oCh1jN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVE9wEWbSmdMwvecBTWHXhSIq1gRNgvTEX+jeugInO2gEjqchvgLYzBOIlZXnt1jQ/cahGeqmeJW1Un1A2e+Iqqrl5d09+k+V5my6wbETXYE8xM7EICmXaDH6Htj0tfdpzRlE6qjEcnLA3mXPe6s6AzhVOFX8SqwclXLyfFjeZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=wtqs018i; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so11874260a12.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 02:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773825846; x=1774430646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=731Ga6b9jk+vDTqIbd2aR5h/exqq5f25J8gBUSvhBrw=;
        b=wtqs018iaxF/77BptQuErmiXjMGcIGMTYsVQ0QCszXBi/VlZMzo6zf5gIV79VHZHV8
         dUbHH1nb1nbSpr9b9Lio6VwrQRplgP+FFtDz8fkUgbly6ciIWmtACaqTaUwPFRWoVh5E
         eBh2e4FXT4vYmscB8RyHdM0sAPFfzlduRYtHmTZFq50SV+3BSv3/nDldx+veNdNUBMnc
         yfJO4CFP/H8OifzoGHdKSAAUhkBgG/IesltPmPhMe7M0gYmcjteC1FP/406CGmS3A6yy
         yaS2K59289X6kNuGTMKkaCcDOjIlZbjQrC1sUjq4IgYCo2voNla+NV9sfbaVj8U5ppuO
         LTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825846; x=1774430646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=731Ga6b9jk+vDTqIbd2aR5h/exqq5f25J8gBUSvhBrw=;
        b=PH3tVyGlpB4fmnVVqsZOYhNOF09SrTzb0hEUrwb4FPg1G+KkWl446CqrvAHo+64/t6
         /+MESuF3vUlobxpkUgM9GfGUaV4McBJ5h+4gBe0YxFuST1vYr+f7ETDGVNyi784XzCaN
         zm3njgA2urUUHKMDvxaWKJjZ6dPfc8fRkA1+0QgaZ6YL6FXBOsivMrr1qTsWsWOt/zYb
         CX/2h3nkqSPi3qy9biZ5Zp6Cpit3WR7Aedhrq+uqRFhKHDh7oYk4RtkDcvgKRWqIZEcC
         YugOg9jPbM8Iu8wmjQnzs3JtOXGVSQkrLDRKbNE2DP2RjlFvaki7Gx1rHAT1EJuiRu1x
         2bAg==
X-Forwarded-Encrypted: i=1; AJvYcCVawm1P257SkqknucoVH9ups8aD9Gx8fJK+Q3U8ztgB1yybKjHC/Q5tyycZuK2xnPz2hqxWnaPdnTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWuF3e0B/AsEcigJLw8iT2eUVPptVQvaVdeS93no5VuesPCaw
	uYc5yUt1n1gPmUiG4EO6zaSig02JJtkA1DWW4899vCqsW+1Do8ag6woWUFNHH56Zzm0=
X-Gm-Gg: ATEYQzxCwoqPm3P45bi7RqYM4NjvKRlHM6bN3Io3KisfxlWG4EtQ8B5iDkwb1QQ7qvg
	c+6RFtHb0yRHXvB2PX3Pn99g7O1ijp2jcxOCiKYqUrwvVxQLtsUh9ebQL1doZ4vj3T/zN9yh8Xu
	JKTpVpmrChOUVLKRupPFYfc5jtZ9vUZ1TTJ4Gvk7kmGC/5+cnVxhnyzp4uby+OM5834N8p23ewa
	ozXeUHQ8cc+DFiZWnRIf0an3QvTVfbzFF9V30rLHCNbaehu2E+ZJBvf106h4Uh1DvZeW6cRtpq3
	n7DCyCxCvgGlRcHG+cY2zN0eTLjl2eF2m7n8ZNtfB81GswVhGokm5QPVuiLrSSp9Ed0qfD5HklL
	D2TWoi3uDG18yuTkJbwNTR2jdo8IOhev6hbb61/9lZexwsHq1IXzz0DgW+Ptyxzb7xwOWUnHGMf
	2R0v0p2/CUNQStFItHM02UZsyZqxXCawjewFQELAn92zk=
X-Received: by 2002:a05:6402:5c9:b0:667:83af:b623 with SMTP id 4fb4d7f45d1cf-667b214dcddmr1841585a12.4.1773825846470;
        Wed, 18 Mar 2026 02:24:06 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667afb4cf11sm1309970a12.13.2026.03.18.02.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:24:06 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 13:23:45 +0400
Subject: [PATCH v3 3/4] dt-bindings: usb: richtek,rt1711h: Add Hynetek
 HUSB311
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-husb311-v3-3-2b32e6192b9c@flipper.net>
References: <20260318-husb311-v3-0-2b32e6192b9c@flipper.net>
In-Reply-To: <20260318-husb311-v3-0-2b32e6192b9c@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=alchark@flipper.net;
 h=from:subject:message-id; bh=epfoYBJ5kMhEqlncsOICDIG4Pcj2iVFAfms6oCh1jN0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTuytf4yzbN8+Ga/aJdD4vMGht1jbdlMdu8Yvf4rjVPV
 6L6xofYjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKY6KI2RYQ1r7DclZ6XzWTwnT93bNVGzM/K3Vs9pq5S1t94GeHbHVDEyfJe9srO
 H9fgdkZWX9zSn/CgTPvBUOvjX564ylv3H/j2I4wYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [4.34 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[193.32.126.212:received];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[flipper.net:s=google];
	TAGGED_FROM(0.00)[bounces-35037-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[flipper.net,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[flipper.net:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.649];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hynetek.com:url,xkwy2018.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,flipper.net:mid,richtek.com:url]
X-Rspamd-Queue-Id: A753A2B96E8
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
index 62169daddb4c..f818d07d39c6 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -21,12 +21,17 @@ properties:
     oneOf:
       - const: richtek,rt1711h
       - const: richtek,rt1715
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


