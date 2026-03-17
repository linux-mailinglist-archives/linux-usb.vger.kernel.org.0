Return-Path: <linux-usb+bounces-34968-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIldJcWYuWn5KwIAu9opvQ
	(envelope-from <linux-usb+bounces-34968-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:09:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7872B0A5F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7629130521D3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC873EB810;
	Tue, 17 Mar 2026 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Zyzrl0kT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584D37F739
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 18:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770897; cv=none; b=nbq+kOVeOrpPAZB4+Tay8/yrOvofmfOk6v5uQG7SldE0UiGFV8abRX01ru2YnSBMjlSXLbSHkxiDbvOOpaRb9PqSw5HjOyjbuviiWpldIgS6ad6C12c1Pk5TrecSsyI2686O+Pe7Tff9+t9fBB0BqW6iz5OiToqezAC9/uBsVcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770897; c=relaxed/simple;
	bh=wc0GFxLbCGBVmDS2XpWAyiiPfvrBfgtTcVXRLT/pt8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEPzIcyo1DMbdXC3ebF4WpI7B8JHDuzogivJFvCPA1UDxYu1/mS+0lkTrOKkpKRj/MkSagkFUgFgZgBMBPoYhWyW8IPpAnqDth9CwbZFxAJKb4ojPXxhOYnL7tFDyanCfJBeZm1c2TxbthSGvxlw6ytvJfhIcsL0EY3/+kuDLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Zyzrl0kT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48541edecf9so66188275e9.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770895; x=1774375695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8XGsFBJ+hu898M1fjVVq758+iOj2O06p054bPmG3Zo=;
        b=Zyzrl0kTRsorwuvn6vMVRAu/CxDMC8yrk+bEDId11kRiU1Cm1L4IZf2lQgs26XgMxe
         vSV/nQ3Ruyv1apT6DMFL32d1xIG0KREAnE0sjAfN3Ri3tOHuvcy0XuGhj31Oj03C0yBG
         UjVoK92njwbQckFtGiDI2K9WmPU7dJUc95MaAx2WLUZugykt8YvoDOVRe6ewj3e6DxwH
         AlyCRyLSEkgV+Pma7qp5Ko2meAzmQ8uS74CTTCovn7C2kvLb0a7D1qPQnN62RujCKQNx
         uBA6/GioAXMdmT2XzXqHEb7O/9hxtyw91W6ntEJWR+3z4NDdMAnV5Da3nqRmeh6FthcI
         TzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770895; x=1774375695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8XGsFBJ+hu898M1fjVVq758+iOj2O06p054bPmG3Zo=;
        b=WGV10P1oX6y7Z0oQGk3epVlMxXNXnkrMxi2wbsqCg6wGOfh3ahJOpGCh2eo4EtUxtp
         +DIM1SrDIvd5B4aaY3Tj6dEPf3L5fs3Vbh2wag321aqK00ylv/SsNSS2AN1B5arKVpe6
         5I84fJO1dIZqcsA0wybYjqjQMsMSm4LnpWGO3Ac2h+X/F9Ukj61qp0gS0iQgI6zeBUIf
         J8cDnJgUuqc0K+19sMzla79E0pN5Nqykzkv1oXah4QYzDXSuMklQ3kfsny+7VZXdFlxf
         MoSq06TDnnwbYQXYpgMO+dER6+yB9OJlqp/lRPVYfVkl0wDm4cIyTtbyKrzORNrthJOG
         m9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUWXtHRmLx2Wo/5y1IOtyaIq9Hd9PnHpbEeHOKBsBQvlZXghVLtVLpMLOnTvzsLyvjj8SyhNh9VrcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHgIoj/0PzEe3sv9qwQgw2eo0CGAkG/LzWqHk4wagqpYQS9agu
	dqv3tk1fhG/sPsoilOQCw1incz1ZcoFqbcNHqjZ9p2Dspbx05MwH+LHM+FO8lyiVt/c=
X-Gm-Gg: ATEYQzywxDb8tUZcHACM6/xZp/+wMI06ylD019dwLUTn0hd5eL4Vu+q7O4JqB8D+Bhp
	kNT8A+PIkXIhxhsOTgyTY0JEzwt0CIec9a/fWgiaVt/K/bK5UsiQqB5evizbsLbratlx9H8l3DY
	UH9NHM0120sO4KZSQ2VLit/IDpdf0ewSa1PUMAejbEf19xr9wJToDEPhXPyGD6O7Pan8ss8+Pwq
	SrdkkjIdwmK97vQR3ZW8WXHJXM0fJEw88TPDj8QXr+k9TfPU0gkskZHXWhuvRYay17urzBuLvdp
	nPw0wbZ8kuzCbFyukWMcubkYCnAP2Nyy1Ugo0PcBtZYubTwosIgcBcj/hcM7UsoyWCMf6oQFa3m
	E82myvWyCAI+DK9QliDg4oW9+Y6CKPH0rxHR39bOHIvvRh8RnuCM7wJHREAxC/H0FfCsgAi4KGu
	6kyd5Emov0d0ce2ZVh6X4cyoYwbvxUOWhRs453zTLShl+mVOFGrckUG7Z40HKC9vMUukkqjySTy
	6SEAQ==
X-Received: by 2002:a05:600c:8518:b0:485:4328:407a with SMTP id 5b1f17b1804b1-486f44435d3mr8363685e9.19.1773770894941;
        Tue, 17 Mar 2026 11:08:14 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:14 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:07:59 +0400
Subject: [PATCH v2 2/5] dt-bindings: usb: richtek,rt1711h: Switch ETEK
 ET7304 to use a fallback compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-husb311-v2-2-03c17c986abe@flipper.net>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
In-Reply-To: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=alchark@flipper.net;
 h=from:subject:message-id; bh=wc0GFxLbCGBVmDS2XpWAyiiPfvrBfgtTcVXRLT/pt8A=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNEWf+r0jqyTf7R7hK55CG1YtH5PxHqmuXWVk9cft
 W1Y6mU1s2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTUMdYxYuDiFICpNo9l+J8gFf5eUVz4LvMOAXtv5j3bO1s0nzovXVTZlpusmDunJZOR4cni7P6
 5sr+5LxqtPfBh3tQ17lelD2z6Ei3+S0bi5qLJlowA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34968-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[flipper.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F7872B0A5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As stated in the commit message of commit ec53fe37a560 ("usb: typec: tcpm:
Add vid and chip info for Etek ET7304"), the ETEK ET7304 is functionally
identical to the RT1715, so reflect it in the bindings via a fallback
compatible.

As there are various TCPCI chips by different vendors reimplementing the
registers and behavior of the RT1711H/RT1715, fallback compatibles will
scale better.

Fixes: cd763789d31a ("dt-bindings: usb: document the Etek ET7304 USB Type-C Port Controller")
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


