Return-Path: <linux-usb+bounces-34595-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nk5NnmWsWnkDAAAu9opvQ
	(envelope-from <linux-usb+bounces-34595-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:21:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0342673CF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE606301D0DC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E67E3DD518;
	Wed, 11 Mar 2026 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="3Pu7u19B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBEB20C029
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246061; cv=none; b=b+/1YNu5gj33kRnT5wAwsMXGBgeTxn/KlnLhlM3f0m2DEYmHtHcrNsjDxWGIP8EteOrWrXeP5B/9l7TQaO5UFbnruVcTA/wBy75eKOxUuS0LS/JcLgua0T9Ht14CsTFc/QgHvinu19h42a3k/TWw2lL2+IyjyVKqVOxNp3pUMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246061; c=relaxed/simple;
	bh=KSJSNgctAT7J2Xo5Q/xEeeommaFbrWm35Z3cp49EY7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kws/sYI5wDWvubBKCOJpXlhz7/XFirFWxe5tfNf9b7a5UgKuLXPxyeWjKgTvjY5irTp8RwyKXRg0QYQSunjz+9VE3+qSzW7sfOijRZ+VexiUs0NuayYH1WK10CyjwtPWoILd6ABVBcQj5UXp8xAZqfSeB6wn0zNDcgslRPJ4+ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=3Pu7u19B; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b94a19fdso77969f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773246057; x=1773850857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bzi3XIcBxTFWoz5//DP6Xpv7izpmnkI/JfV1bUZEMJo=;
        b=3Pu7u19B/YoUVmvgJ8bmRObMBcBH9M8BYjVcH4w8znul9UEMFbLUU9HHPRl6TTH/dy
         vErEQ4K/F9pslgY0QjrMWl91FEXLNonRNogJQfXJClUINu+m6RbHTBQKQPApmnZutGeJ
         isEIT6CXEH1t+9fHcgn8facHe4eU80IxBCY4Nw9eIZ9msI93f7FhIOVqcnGJ2t2V2PZ3
         IE5NMJnG/fwpsHi+SvOrMkCQi9PeYJmq24ffxWZM6bEOV1Qh4z/o/SREh+10POZyKwIu
         YCwVCngjKdYWW+tMA635h0NS88RDcIX7/nJndlZWxDwhVY2kdvqE7IzyFj6Vu8gD0x3l
         oYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246057; x=1773850857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bzi3XIcBxTFWoz5//DP6Xpv7izpmnkI/JfV1bUZEMJo=;
        b=MjV2AxIfvEFMs/x2N0DO5570kDHEqNH6pzhDnFWJB/9qMG7CZZPTBl2GLSdJ7lPAm9
         1EKypPyODtawT0ArJh6/cDE03zZ4+xma9pJuBeXuEHVhuiJq+6krFZxjGzn2N0Kfwg8k
         blZMjKjf3vVIk1fdbgk3l2TLU7k3hd2YU5onVOE5cVGeWgT/6j7iywAxrw5fYL/H4h+U
         XPszBrDl+5V4k1JcjVu0gQIjiCnrqZB4PFEoQijFuffzzdI7EJ8a9nTwf/rYY80n6wwU
         xD7/otvAO1TYIOAAN7tQD/C3UHfyI5pZMOgfvTPeDMZJOFGuTAE+2jTJBP0GYJw6/keP
         Df4w==
X-Forwarded-Encrypted: i=1; AJvYcCW/yB0UE8G/KH/DziyZnmaaXWTfGJ5XPvflMuwzHDjxoNva2ShsLyCtB0BdB3IjO11DY5B1PnvKj8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykd2N8jzd9IxEETdFaXRoOsj3JChRu857MGmMvnr+s/GKOfsWE
	KrOHyfmV5R8/TocMmlava1uV9ItXPIZzl+VUz/w8Jy5r9x7FrwApVMX6AEMfayiOF4E=
X-Gm-Gg: ATEYQzwzvWi1pIpXrSR6kezThiiRrgEUiQ6UZhqGEIsHp68VSeSI3CupM9X30sQDG8F
	XlnQiw/FfhwlXmyrYGkd0GQdkvKgA4WHhLCn59imD8bLxEpNt19iQ/+4RIP7w7iNSU7XMco3m+j
	GEPJNA+TAzOKB8LExAFbsJiv90crhhm0dGXR8ri1JsF7uB05GITSRbCl3CEt7uS15JIcP/2mlw1
	r0ejIB3yYKqlUTe2leowGHZ6fQap3s2aMQ2ES7HT1YqqAd15Ni8ocIk1nCPHRlQ8AKQwWUyW/3l
	EBibiUa4znK56gReusXMonfCfb1tufen8rWspvOt4m8tDMeMfF+JssmqdXWyKPDeIwSh8XAbHvr
	cKctAZ+UMa5qt3U9yNoZDuLyl9PUzCyAj8lyvjYNs/EVuel7KxoiOijgFmFli2eM+HCy3d9MZSN
	s1Mj7L64bc9tO86MlZqJKqpaHvgonkvSMEav0xxzgW7h9nWHt/IUrDXLHAPvREjznuM5lQqRq+1
	A/VlQ==
X-Received: by 2002:a05:6000:4201:b0:439:c78b:cbef with SMTP id ffacd0b85a97d-439f81f272cmr6543942f8f.25.1773246056849;
        Wed, 11 Mar 2026 09:20:56 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm283952f8f.23.2026.03.11.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:20:56 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 20:20:44 +0400
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Hynetek
 Semiconductor Co., Ltd.
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-husb311-v1-1-f25bcb58cff7@flipper.net>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
In-Reply-To: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=957; i=alchark@flipper.net;
 h=from:subject:message-id; bh=KSJSNgctAT7J2Xo5Q/xEeeommaFbrWm35Z3cp49EY7E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRunJa8jPnruenhO4qty3d46i/c4Za8Xlp1wd9Dwl9Cy
 9Ljxdee7JjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqn21lZJiWauzu4HTcXMNidtGSk6x2WkHGOgHr3worfSmJMbtXe4bhr/iENRY
 LX+S1lX45u0SDvXlB4IVylspZEVNenpZ7EVJtxgMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34595-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[flipper.net:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C0342673CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hynetek Semiconductor Co., Ltd. focuses on intelligent energy control
technology, mainly for the intelligent fast charging and digital energy
fields.

Link: https://en.hynetek.com/
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 04b7d1aaaef1..f1e6b1d03839 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -745,6 +745,8 @@ patternProperties:
     description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
+  "^hynetek,.*":
+    description: Hynetek Semiconductor Co., Ltd.
   "^hynitron,.*":
     description: Shanghai Hynitron Microelectronics Co. Ltd.
   "^hynix,.*":

-- 
2.52.0


