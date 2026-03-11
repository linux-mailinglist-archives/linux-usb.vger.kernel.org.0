Return-Path: <linux-usb+bounces-34596-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEiiA4yWsWnkDAAAu9opvQ
	(envelope-from <linux-usb+bounces-34596-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:21:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F352673D6
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EEF0300FED5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACBF358395;
	Wed, 11 Mar 2026 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="XyysYn2e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778BB3DDDD3
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246065; cv=none; b=LYANZwgyeRysnA/E+NliFT8kUmevJ32mTiW8faKNDLi1FwG3nNrqllGsniQ6oOdC7BsVgFUUfg9LGo9X7KXJdsINQdU5dDU5K3BDR6S8tQiISBpfztlj1KyCQbBvPQVJZ3XzuuHn1jqfRYV6kvqZuICQKw8ZjOfOA91jeGlAy38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246065; c=relaxed/simple;
	bh=bMf9TRmYtn46zMSSe2mzXvRDTFA7QHx3kPDHNmgVLZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ehaf6l8TnKrJ3+Smn9V3CyEZ8D3MUHvi78vgcTvzaKALNGBOOR0WUPlDdK8ah4/d+ecrQ0atJABdxgeZIcerbUs+NZ6xbaQ2X7SJTWM8yGZoHrHd5tT8H160MGN2BgGpy9T5c5uJiIIX5zEhJMKtvLNTW0lI8J4Gc/7ksMBiWEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=XyysYn2e; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so57610f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773246060; x=1773850860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7BFBm0ORq4+JJOt2QbOg12ZPSD3QFxst8CC7tIRj8k=;
        b=XyysYn2esO5Wz6Wb4aZF2ec+aIfhvekfASh/1RvatdxJjNj9dzrHTuR5a5TDdajfO4
         0W3vWvniaxyTdUB/NXkzuDklAJLPcPfrli4OSTUpHyWbTIvfRb22IyMzcm/02KMbIykN
         2Tfbub9h0XjmBIJ88RUD1aHfZwFJN0HDuNMbeca9EHZxG8jj8/qg2+xA1XTz4RKyfT2H
         Fun0RVgs2vgbwma8w9hnAAh3O0cIqtMkUyp8iM63P/SkEqTdZHLmyUkzPSASWl9ygOkx
         s0P8RFlOm6r5cdm8kxXa5wJ7YxJGQaeKlbSLelPScdjqipkmCJFNMc0sRLKgvr12D7Mq
         rAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246060; x=1773850860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7BFBm0ORq4+JJOt2QbOg12ZPSD3QFxst8CC7tIRj8k=;
        b=j7AAMwRkO1m5v/I5t+ANA3j0fP16le8pnnicp31BxK5AfRDDpgODUn0yZCLvXTEiZs
         qJrl0OBGSITkHFGikRVrXGaAb6EgLH8XwvTTtT7kf5X9fjI/9zeZCMNxyBkQVzzcDD3D
         Snq3A632DsWQjY1jggWVUs/3M40fne5MPS+0jQ9MOBvfKPvpE6XFk7bTEE6ql78XzoL4
         kHu0eLFyErQddH2ggXzVAXp34kfpvmeIHUca3ACbc0eRmTlFjKVN4Belul2ZtGi/6818
         OUecJ5QDsc4ujDn5kYxHSG5k4OgAwz6ozcHhOZmXgSrGEeUjSnhpKen4g8wvKxV6VDxg
         v2oA==
X-Forwarded-Encrypted: i=1; AJvYcCXiLgJxWenecgqxG2DscGHlUyPh2IxmghZBbr4Qd9HeLZm6av+VibT34ivTCJaE9KWZAfiQS2rHnPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW+oTV0BM4tNbGWRXwAvsrRtkLE+KiD/EDfIkqj1VO0YWNXw/W
	Sn90aZG41WCzPrICPdJKorfKBGhM4oU9y9DQqMDdSjxEYM60HGAUfoKRyFas4LozCco=
X-Gm-Gg: ATEYQzzYSU18mx74/v2hcXIY7gc4J185J5bxu9Y9KCwND4Kg78SyF6va50BLisM3S80
	rJeYjd08J5fCZNfkTCcYy+48yJ0tKuUEti9GScn8tFBpBMijbXVwjV8mEtFx89UYZXfxzdkmU8D
	wT1+J1RcL62mbOYoLyNwudpzhc+JxNTcNmlqnqK3b62Hdlv3DnjywQVEw7lEPzMzGwQ5JinfGOT
	dwSCR44BsnCoJmZUNsoOnE3P3jgU4qdzctXgxZnUdhlNynfJzqGZ/IuqsX7/WGLGY9zOMjspZmE
	n0RuUaWsOSAj3q91No29gRETvbr9sHOlaXMWciJren1Rlch6Hj68zqsiC8V+Om6ZIZIeZogSPhN
	zol74HxJoZxEySLPDt8PCya+Vq+0hNWE4OTkfzWYp2RfODS19t+T81XE01djHWSJY+M3d3synvo
	Yh9qomyMKr+/VNQm7SEiwYtCbBIqhSlOaVI1PaEw7WvrjeAQ7a8yaZGSMsKhv3WHoeLB4hnVaMf
	A8Ppw==
X-Received: by 2002:a05:6000:4312:b0:439:c1b7:890d with SMTP id ffacd0b85a97d-439f8219facmr6362482f8f.26.1773246059591;
        Wed, 11 Mar 2026 09:20:59 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm283952f8f.23.2026.03.11.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:20:59 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 20:20:45 +0400
Subject: [PATCH 2/4] dt-bindings: usb: richtek,rt1711h: Add Hynetek HUSB311
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-husb311-v1-2-f25bcb58cff7@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=alchark@flipper.net;
 h=from:subject:message-id; bh=bMf9TRmYtn46zMSSe2mzXvRDTFA7QHx3kPDHNmgVLZU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRunJbcc2jLT4V9ix4K200se7ToyfSMgN7pC59fnRV6j
 tVEp5drQsdEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ioY6xjxMDFKQBXbcvwP/zaNvclqs9M5l+x+LTT/OzkBxrf6u8Z7341Y+cZ77S5K/8zMsxIy/j
 1mfvvhL+MrE8V/04w/nD/w+9XJl0WR/N4Hyvf28cPAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34596-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[flipper.net:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,xkwy2018.com:url,hynetek.com:url]
X-Rspamd-Queue-Id: 11F352673D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HUSB311 is a pin-compatible and register-compatible drop-in replacement
for RT1711H, so add its compatible string to the existing binding.

Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f09-bacd-0440d2c21088.pdf
Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526.pdf
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index ae611f7e57ca..b24502bc8213 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -21,8 +21,10 @@ properties:
     enum:
       - richtek,rt1711h
       - richtek,rt1715
+      - hynetek,husb311
     description:
       RT1711H support PD20, RT1715 support PD30 except Fast Role Swap.
+      HUSB311 is a rebrand of RT1711H which is pin and register compatible.
 
   reg:
     maxItems: 1

-- 
2.52.0


