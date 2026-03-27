Return-Path: <linux-usb+bounces-35569-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE/cNhW1xmmgNwUAu9opvQ
	(envelope-from <linux-usb+bounces-35569-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 17:49:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131C347C97
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 17:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 892A030332C7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 16:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41C93612FE;
	Fri, 27 Mar 2026 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5oenN90"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B88535AC1C
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 16:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630079; cv=none; b=Rm4x8LyXLuaMPvJzxqH2WzQ5DY3k5F1+mQkb1svGut887EZWVeuRe5UTPipKkrsOwDZ2/DOHVGcCrlMYplY0MT1FmkSjOlv7gMgFm3ReftWCAdCeglwPf7RN4k8Tr2ch1VVYJT254thZt8g53ypMIe1CcVvVu2QhYsN4r9zfrzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630079; c=relaxed/simple;
	bh=UIodTV3hpL0XvV9F+VpVBsKxBAUh1LXR1IjMfNJEjwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWg5tP8Tq28I/W3hMrToZVWehgxr+rgWzh4DTgKJVwFWcwck8RFMh0eXmzyE/QS5JcnPAxkJSCu4xTFFqjpJc/jMdmhntZNSHgCR+sBByd6pbMS56Vi6lmFADzt2FeIDBwadQ+mZXYYAVZTOtpUaqmSiG1nHgE5WvJP7ATOEB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5oenN90; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b0afa0210bso12068425ad.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 09:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630077; x=1775234877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOuRJlmmqD4Xl6AKwZIJqCij8drZ2YSxq5ghkTBikxg=;
        b=s5oenN907ts3IfdUgF0/RFjP1evqpH8BehxykIfm7ZGBGFc8OLPXQxgTEjX+oVDeBY
         zi3KuMdzpt0h+RTx7YJUwWX5itXjp3iHbz+c01FwgGIYz6KN2Xk1jX4oxNjs5AHsdJGi
         yMUmKPfdto6r1C0tehf4dMlpNj28e561+X/5aO3yhNGlcj0Rvn8vEFSMKys06oYoh2PY
         tuVtYSqtOXifKxUf8WHp6P1jj7jwrf+fHDL5v/4RXz8+Px4M2L7bkmNHaBiv16NUjVCK
         j6pR0LTplV0+JTnSzEnYHuSNrLxS5p9G4531oHk01LfisMVkFFNlooMOUkjOmxqzvX8L
         75uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630077; x=1775234877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOuRJlmmqD4Xl6AKwZIJqCij8drZ2YSxq5ghkTBikxg=;
        b=cIddLCP8gTUzu+me+GnYmyStGa+4ZbpwPHOCyH8/+ilpq76ZZujS2ieykbK2SGMmZj
         3y8WYEJfPV3vaeV8jtPHghcA+IApj/Sf59BAvL6E5Or+prXgNNVRqwIvLOHcISTnLVCc
         I6eh0+AGzdfS4EVZf8miCkVloWsKwwyiVqa3wRcInAkjWRHyhtdxa39md4PI1kiyKUOQ
         kGBCKF4aTGB7kAljYbDztMnrDdipUnaxArEQw7RQqhDqlhmlPrJq3vyGjS3hk1XjySwR
         7QYLkMQnuQjMcMgn9cZkO74LfDojQvJ8K5XfdT87vcLUs6Yj190DUp98yXv+GD3C56e/
         Dtsw==
X-Gm-Message-State: AOJu0Yx7Gveh422gIS2XP4U+eh26OvYkAIiNPyuzdjRSK433Yn/FSqCo
	Of0G+5X0jPehjQBoeO2jPEeUgHOI5/Nn+7eA8m/7OwoUqJoySbwI3Cs/
X-Gm-Gg: ATEYQzzT57JO9USGcgpAR7cq3QHT1wVWO693OCNNZnCeu3Gk4Id44HP6xIl6HofEFwK
	LS/RHuZxfxYAVqeAUC3W5ap2M/w8djrx1IfE2a0iB6ExGAoUT6gzCWyJpz/VwrJcQA7VElrySLF
	cEKDTZkmLM9UZTXtFx2OExiYDoSXqSkExik97fk1JAH0H85+vHnlJvIHuHg7LXa4KA4f9DLpHPF
	fQAR4TAXc0cLZzAVZTBHRGq6sDluW7143t91s88mTcuI2QsFdagoSo1/Gd0cfDDlD9NNvvsZwS6
	aDhKn7jpwKVLVZFR16cJi19LlNZQfGYGfwwzZ5OXsXIvRbsx9bxOZLLNch4d/uc5u/sEDwaxIdr
	vQSi00MlLu4U3U9V7u9GpxhcvBlPzBXQPYS7PJxTiMt6xfeBbYj2zaecxKzlfFEdMdgNmkuGvzN
	oWoqqp0W1qD9KZ0ewdSQQ/q+5zBy4E6eMBL8fDcHBDbwFrEfrhoXqFJwI=
X-Received: by 2002:a17:903:37ce:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b0cdcc8106mr35196945ad.23.1774630077337;
        Fri, 27 Mar 2026 09:47:57 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:47:56 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:42 +0000
Subject: [PATCH v4 1/5] arm: dts: at91: remove unused
 #address-cells/#size-cells from sam9x60 udc node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-1-eb8b6e49b29d@gmail.com>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
In-Reply-To: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-35569-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.7.161.32:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:email]
X-Rspamd-Queue-Id: 8131C347C97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UDC node does not define any child nodes, so the "#address-cells" and
"#size-cells" properties are unnecessary. Remove these unused properties
to simplify the devicetree node and keep it consistent with DT conventions.

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
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


