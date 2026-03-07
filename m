Return-Path: <linux-usb+bounces-34175-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBVnHQntq2lziAEAu9opvQ
	(envelope-from <linux-usb+bounces-34175-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 10:16:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA08822AD8D
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 10:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E1F230347B5
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 09:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE33138947A;
	Sat,  7 Mar 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSJFScSH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011F3389454
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772874992; cv=none; b=OuwDnOv9eBi85jWlsjx0bCjQB9+gv/1kJJCa5boPm0vWOcUeV8B/8WPuI+2C3XgEhhrmDVe8z7OseZR5fxWjJk35gQqfMsgIqfo74P8c5yUPKYNdl88ggxoIAkPYrfTsPVEXdq3BnhM7XABrW/IXsv/+07Er53JzpMhuoo0h2q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772874992; c=relaxed/simple;
	bh=TOgEHLNDuV9hrgCrgPuAtFhAmugJ9ogGw2s9HsU/IRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGA9Sjux3tMJi832q1+7bEp0GeBu+k4ATA10Vy57xnkq61c25nmNU/27v8HlHDEcwsQnHeNulMzVw261TASvGpzl0lR/kM78wtEqABRO983QIjmxUPbFveNFhS6wADFE0wa43EyQoYYhHlcFP3zXZtzF6/96Rb5mZVYTwoFWMfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSJFScSH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ae46b9c70dso27394025ad.1
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2026 01:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772874990; x=1773479790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ycKvNZw221jxVdyVNWLOsWUbPtsOR7YJ3JJodsI6vE=;
        b=YSJFScSHC6naSRjwLeTGtw5mSGYVEiDCiVbjHyeaA+Iy1Wd+AITa2fOpHYgPgLk/jq
         20y4FZAdKzxjy5XUaTpMQMgWdwKkUJHYQA4Qv7/J7bTS0Bd2iZUFCzyumR4hX5JHq4rr
         hV8IKDZ95iBcLDi4h0ICdhH0iatO+lUIYI887MOjjL2lUcxmJGhhpxHEqArh6ooHLxL8
         DrW3zU8PeFwysBEHzBW/QoVeZN6528VwKBFXgqYAr0cLB4SFwHmxD+K/pS6JzIkTazWQ
         bnROpJUqphlc3DCGjd46LIlzYlbmqNg9k31t3cQcFlG9L6AwEMmAFxG0evZ9RVHyqAZA
         /H0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772874990; x=1773479790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ycKvNZw221jxVdyVNWLOsWUbPtsOR7YJ3JJodsI6vE=;
        b=vOHSYKgohD3/CG2SK4rToEfbYsvKTrxocy7TkJ1cn0fPqdEkwZiM1wnGgm1QCao7aO
         F2PtOBe4Hco1H0ZrXET1yrzwRmy0iuJa5zZDh2hEyEtTGkRgmSE4tRCNvR00/mH+XOLl
         HTTK0nr8lmxhsSyp4ZSNkmbrecWABjBJc8fW+9uN8EOMtX/ObVAeszx3IiFQ/VKO9lz/
         FCxU9BX1MtubDu+DK28fGjPQVHL/EREfyzo8BXbdSC3a7he+yqK9jfkqbP/QV0R7IeFu
         9wPD5GCRKCfk3kZ7T1UEnFjHSXP73KTCcpdjl2uZfcP3xMqREYpDTKXA59qxO5jfalOn
         hoaQ==
X-Gm-Message-State: AOJu0YyLb5/Le5Zdw7XjF4j5VmkoSx+O2oXNaebxZiT2j3LJNV2OjyFh
	rZRxbOF2npOLK5Y4eHivpoCVF4qVtzhMDLrIkeG1A8L5BG6z5yogSGdV
X-Gm-Gg: ATEYQzxoFw013z6EiWaKxU7pNACz+yksgyY496v4rWHQbidGlnARsYzR4v4n6LVYCzY
	f2A1PXVD/MN7LVND9LAr6uy1BjYNWdtvkwhVckOWPLUZ6b2Fj9nhkglvqX8tXgm9/w8LcvUPcT8
	F0cYKgML5ejt2fWwtCT9k1SQl8I3KzhqINNRITOq+Fl/XNUKlAaimyaTTcEJIuRWkBHJhZaEFDr
	IBM20ORNKAQc2Up5iJYtYIQcCO3WQ9N0l9brm6hPMvGqGkRH0sOyi//0TKJ5YVHiVFKC6IymfEu
	Jh9XcoqwKblHdbGjDu9kqwm99KQmwZaJACNh1t3Fm4S66P0zdlF+O1O0M629iHoBZ/t2pFkXRYu
	OQgBJ9jHh+ln2EBiIgop9Dj4b0iOjx8XRkV9KZsP1SDI2klY3ParviadeSpIFUwDbkn5+I8Mysy
	lKFEb41JZqCijduzckwtAQtjp4Zij8fYafSOcIxZQgVic=
X-Received: by 2002:a17:903:3c23:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2ae75b7e02emr98819375ad.13.1772874990333;
        Sat, 07 Mar 2026 01:16:30 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:29 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 07 Mar 2026 09:16:18 +0000
Subject: [PATCH v3 1/5] arm: dts: at91: remove unused
 #address-cells/#size-cells from sam9x60 udc node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-atmel-usb-v3-1-3dc48fe772be@gmail.com>
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
X-Rspamd-Queue-Id: EA08822AD8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34175-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.968];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.7.161.32:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The UDC node does not define any child nodes, so the "#address-cells" and
"#size-cells" properties are unnecessary. Remove these unused properties
to simplify the devicetree node and keep it consistent with DT conventions.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index b075865e6a76..e708b3df4ccd 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -75,8 +75,6 @@ ahb {
 		ranges;
 
 		usb0: gadget@500000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "microchip,sam9x60-udc";
 			reg = <0x00500000 0x100000
 				0xf803c000 0x400>;

-- 
2.53.0


