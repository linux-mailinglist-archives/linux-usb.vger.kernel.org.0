Return-Path: <linux-usb+bounces-34970-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOSlANqYuWn5KwIAu9opvQ
	(envelope-from <linux-usb+bounces-34970-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:09:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F752B0A76
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 166AE304DEBF
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDB83F6608;
	Tue, 17 Mar 2026 18:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="vuKgi6LM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903373F54D7
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770901; cv=none; b=ADe65Y+G9g3/ta+gXZmvFrNgRDUPl5rr95QZnYXGI7romhTibyi66suDrhJ7wpHrglX6dpaftxUwDYUln031XjynRifhyUd3+e4Yq1zi6B+QyBIyBK1h4TYyDfNhOtLD8LJmro25t+C3pZTieDkceAkQna4KU4mHUEht/hSq27o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770901; c=relaxed/simple;
	bh=epfoYBJ5kMhEqlncsOICDIG4Pcj2iVFAfms6oCh1jN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rS1wROwpHm+vIAvEYTOyY1e5UDSPhMMuqKchYQP/EPuWFLKy2lfgX/xMNemvVWyQ2vv8MgllGcps65JdrFzSorjy2ZaCfmdNyAmWttwAckzqIqwysSMJThoibRu69xQf5C9lQs5B3B8NhgD2d+K3U4G8VAhjOn8rVZsvs4jQdAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=vuKgi6LM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b7c2788dso3743356f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770898; x=1774375698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=731Ga6b9jk+vDTqIbd2aR5h/exqq5f25J8gBUSvhBrw=;
        b=vuKgi6LMlydkn/zoJzrc+dwM8+D6vf3DiXg1lSdiJHXWveacf0Wofzv0YD8+/6cQzP
         Vjn9w1FNycDyy5xEG8JS6bnQ89JuT7eSScLuncq7wCiDyXugphcVcSkk9BXz2JgLhNu7
         UBr1Y+/Mt4T5FJouhFdgQTq4tosDJ2KtQF9arX4x7AFMHJm0wWW/nLD0igPuW1lQYEGk
         oBx4s6gXW5N5TLOUmf8jqnlNY5WNjajuQHpYkbqISSW7cKriD9TODm+TTjrwfbfFWiFb
         CC9NmDeguUSPIk5UTeOe/h5AQj+TIp6KYc5jd0Ma74OnSKJ0BRxplsgTsWebTWRw5dy3
         9esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770898; x=1774375698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=731Ga6b9jk+vDTqIbd2aR5h/exqq5f25J8gBUSvhBrw=;
        b=QBdY3POFFem4k/LsCFjB9Cgv+PMApMv1HB21CPnr/4g0BS0Urt/c/FjHTSMQw5IjqC
         GHLRgwEMG7a6NF8gjXmxukacWX00+0AHNgbZWM6Iiq0fh/cFdsG0a8rzUTYXghDtHp8R
         acfIYe7eEB0CaRjC3ggugpj4HuHoDIGwlXwd8xXd4k0OmMq13FSmPS/IKN90xMG0ZXZp
         bIl3MQaAEoBtSew9quZyf3GZPkkSbOo148MHi4QKqZgM8D+EKuBGUXqhU6d8Jh/bg9D4
         8erNKNuVK2yQp0d7z214v1xLCZ1ZtgT3Pcn+kUvgNPI6N39D5Xr+Ng6eWBODBkeGVfQo
         aoKw==
X-Forwarded-Encrypted: i=1; AJvYcCUXRrY+1aB3musqRflGcY0T7R6ZxPFZl58gOXFP6gIEExDpHtX4wxxDILdJUkbara6/uklzqMJcT6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd2AM1kidQ8tgwnE74YNY+8fM1/9dKUCEaH9i5b7NBElqZUCTv
	3BNQUQ5GgA0YbU80V2lv1Sv3o1ScFUhTpw3I+gV3NKjrx52v/DVWl9+2MQR9vLnbbDY=
X-Gm-Gg: ATEYQzzMCLV2Xpo7h7ewV+8yh4MsXhA4+oj3ggwz9NwiKZOBT5NoVBGrVtseYsxQsJ8
	H/huSOlYODNVGMfKPZfbwF2Ey/lPNenGK2H5qfAwIzt7UnJ7I0X26ltaducMehrT5pnTGvF6Vi9
	8N21O0LZXl96Xvdw6FAtaV51njSV02lH5MciOhE9u4R0qFQ0d/uUrKuFQsJYx8Qi100mkWoXFOm
	U9cvV1A9x1V5C3ggbCy1dxDow7fkDWybPk8Lfn41/TZOSAqa8jsG9otrHpbdK3U/v/vGGinMa4Q
	9+80Oa/CNnQD+fHrC8cjf6CrLcV48f0MfYDNTKdg4RKjtmw2MDDeJzJc9GtUyigAOgl3a6tTXaY
	yhzti/AEQkBwisTU0qsSNu1DESdYbeImYIa/3C1y5yKH2ixGFZ5LT/P0R5vDL68ncMI3Le66ZNe
	k9GKD/JkGIIEW9foZvbNzjK7jUkRO8JwqsfQJ0mNkhmr1bjTMs8VH7mqTenek0ZhA/zwr2l174+
	iLeXQ==
X-Received: by 2002:a05:6000:4008:b0:439:d769:ec56 with SMTP id ffacd0b85a97d-43b5264e4bemr458317f8f.0.1773770897921;
        Tue, 17 Mar 2026 11:08:17 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:17 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:08:00 +0400
Subject: [PATCH v2 3/5] dt-bindings: usb: richtek,rt1711h: Add Hynetek
 HUSB311
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-husb311-v2-3-03c17c986abe@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=alchark@flipper.net;
 h=from:subject:message-id; bh=epfoYBJ5kMhEqlncsOICDIG4Pcj2iVFAfms6oCh1jN0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNHmffKk5btH2plnp4uJynx2/ndxw7b1215POnEx9
 +DrzqspcR0TWRjEuBgsxRRZ5n5bYjvViG/WLg+PrzBzWJlAhkiLNDAAAQsDX25iXqmRjpGeqbah
 nqGhjrGOEQMXpwBMdaYJw//Yf0HnHzzy9WXnKZH0vuPgp/5X+do7deXsTyYPLzzenH6V4X/05/e
 TXzNb5SSHz7zzd/1exUQl/hU3hQwXnDcQLEw7u4QRAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34970-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[flipper.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hynetek.com:url,richtek.com:url]
X-Rspamd-Queue-Id: D5F752B0A76
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


