Return-Path: <linux-usb+bounces-35036-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDgPDFF4ummTWwIAu9opvQ
	(envelope-from <linux-usb+bounces-35036-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 11:02:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF652B99A0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 11:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72464307D3C3
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AE03AD505;
	Wed, 18 Mar 2026 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="SmanW40n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344C3AB284
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825847; cv=none; b=NZipyMHzz/kIL4maiNxY9WywXi4VjwQDQV55rXChjSUqxy6YGZfjXfj1hXOpONjHBvO1wBP1qkZvsj9Z9ibHtjqBcRqGIP4yIaVgrCmwkPKTrgERs9nmffbGIMAhE+T2h0SGt2oHeUCdqWgWC5sr5poPmNmKaSFqScqwSL5PYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825847; c=relaxed/simple;
	bh=GqV9jHnB6vOGqFl6hGeHh+r3aQFkoAZMS2/NpkSzSog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bzKdLVRLSHdXPqvuakFPt0m/ZFUyRt3S19ynsDezAvaaDOLaZU1xjJ+9zWcJsKs5j1i6h6fvNC/iAtHi26CzIrFjB6is/LZl8CHyWKgMuiJCIeuGkuPC2SnjNYnng8ypDmgLJUugS4rmZVGpex1r+kk482uJoYKWdRo87x468lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=SmanW40n; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66778a3c1c4so2186026a12.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 02:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773825844; x=1774430644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/MiiNuGZe5qCVi/lzQnH6rWOF6clmtSGfhPb+vVi6U=;
        b=SmanW40nGIm1P9AdIoXNdmtwSk/6pH9MzMQBvIB6PkUVs79jc/km5rlLZEvvQwHLin
         NUt+lwaZ2Zo99IovLi+vZ362kfNGbaiBeHd/IvriJ2tYVctgtYnKkTM3FMUFqGVeoiOp
         9bOOhrNPwtChRa3uvNGhGJMRT2IF3vbBJCHKI44Izepdni36lFaWSF+AtGYweaTmHGBz
         rguIY/NWLGRGag8J+xLDYG8nPqO7pvCNV+pHQWM/ZAsEsKgrj5FIbcJ4ZY3P0u41en5z
         O5ffqT1DpzigEfZmhLia7DhtFW2EvtO+9hY2yrxwj9G/eWNM8YJOamQDiB6fD4565qEX
         qHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825844; x=1774430644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/MiiNuGZe5qCVi/lzQnH6rWOF6clmtSGfhPb+vVi6U=;
        b=BvDenUPgfL2FLa/w6iq/ZDWM2Uvf53YIxR+qheqHpGuxPMqp+iXBi52UVSoT1bdAoN
         K9PqFU1cSf/D6D4zPW361I3A5H/SPEDkidGu/EfP4M3AkvFiLcNy+f6ClTB+PaZZqRh7
         GSZXA3Y8AL7AtwBhwWkwLt1/skwaH5p4Y7T38yu5OtXXA014p53nL6pS/HKPfuXe+7oL
         mhRlWmOP0TwyCRytfeH9JmxbiTSrCY2oVNdSktYPTcQDvl7md3BE8q1rFh8pvBhvzenY
         3F9sucuCGHsJmOLcIITf3QNM2bvtE4yNjQl4C3FXy82rDJJvAvRMNMf9MjWWal6O/Wg7
         Jyiw==
X-Forwarded-Encrypted: i=1; AJvYcCXBDezjW1LKVCL+W/2P739B7/85F/xlxVAuUWWikEHzgQs8FdmVWDD7kWLxheCG54aq6aEp2f2JHvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMSIDUGx9Fz0GnoYP3iPlJPesnrpnBAx1HIcxVIZK4xl86ZhN
	ayO+danWhk3tWDld+Q9QwvjXn19Y5cKAvFT3Pa0R+s7cNpeAZmHg/KuYgtPCukwfl/Y=
X-Gm-Gg: ATEYQzwwNpQTh9nr2FlDA3PLEi9IA/4u89veS7lrV3o/i2yW7I6I+WUcmRiEPpRVFLv
	ork/RX/F1QIETLDdklT1RP06fE2wSV78UL6pqLu5vLVX6e4Hl67BbwdN9J2krXpBpCv2ixy/sHT
	UsG1ZV770fGnlUz1ACQfeGQwYSJvJWZNUhf88mZNWwfDmfj0tENIuGA/9crkF5hYLlDJaLFULZm
	0rI3L+rk94Q9qizKJsjIAIkAk1dI35UQ+DdkzRRiO0Wd/v9DoqnXH1ebCRk17fL7vIoKPIvzmWX
	9zQugBb/06PJsav2mtstHiR4Yz6QR9zH2K3JpZQJ3nReQaFHb9i2igH/hiR4RC8+xSgRWDWf5UU
	Fdu4od4ScA4uHrrFzeQQpOPEiN+a1qBOF20dbg+bhSHmZ4PS530dKzzVmP2iDGiJ6UJc4yHd3TL
	Zs6xREqc5EQkJdki1yZSjmxYrFkZSEUPPYd1+ZMCPzlhc=
X-Received: by 2002:a05:6402:401e:b0:663:71dc:1278 with SMTP id 4fb4d7f45d1cf-667b214e0a3mr1859786a12.1.1773825844152;
        Wed, 18 Mar 2026 02:24:04 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667afb4cf11sm1309970a12.13.2026.03.18.02.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:24:03 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 13:23:44 +0400
Subject: [PATCH v3 2/4] dt-bindings: usb: richtek,rt1711h: Switch ETEK
 ET7304 to use a fallback compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-husb311-v3-2-2b32e6192b9c@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=alchark@flipper.net;
 h=from:subject:message-id; bh=GqV9jHnB6vOGqFl6hGeHh+r3aQFkoAZMS2/NpkSzSog=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTuytd40P/00gSjgrtcF2PYFpdeFbyVrBnOo+h4nzOsg
 yHjo9fpjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKaabQ3D/7DngSo8Bv/CFt27w/2+bfaPZU7LvA/xzrevXXg+KcQsgoORYV/st0U
 L25+mP8oRXF6XYznjWRVPIx/7Axk7nelrmbTiuAE=
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
	TAGGED_FROM(0.00)[bounces-35036-lists,linux-usb=lfdr.de];
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
	NEURAL_SPAM(0.00)[0.774];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flipper.net:dkim,flipper.net:email,flipper.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BF652B99A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As stated in [1], ETEK ET7304 is functionally identical to Richtek RT1715,
so reflect it in the bindings via a fallback compatible.

As there are various TCPCI chips by different vendors reimplementing the
registers and behavior of the RT1711H/RT1715, fallback compatibles will
scale better.

[1]
Link: https://lore.kernel.org/all/20260220-et7304-v3-2-ede2d9634957@gmail.com/
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index 1eb611f35998..62169daddb4c 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -18,10 +18,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - etekmicro,et7304
-      - richtek,rt1711h
-      - richtek,rt1715
+    oneOf:
+      - const: richtek,rt1711h
+      - const: richtek,rt1715
+      - items:
+          - enum:
+              - etekmicro,et7304
+          - const: richtek,rt1715
     description:
       RT1711H support PD20, ET7304 and RT1715 support PD30 except Fast Role Swap.
 

-- 
2.52.0


