Return-Path: <linux-usb+bounces-33083-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFlCH4LrgmnqewMAu9opvQ
	(envelope-from <linux-usb+bounces-33083-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:47:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 279ACE269F
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7A2F306B09D
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 06:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443C638735E;
	Wed,  4 Feb 2026 06:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MonAV9Wt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844643859FF
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187561; cv=none; b=kobu2TdFr+Q+i75UqIxDIpyGe6mhzNByK+bFM0n9rZYip4Yd8VvHVGV788FUabCjzBibjhec8xFBqQyqw/YOFsaHLU6YB2LWPzQ6kM4g9MS2TxaKxNEoCF3I7ZhBR1wU/9gnwwJUVu4vJVNO48wGc8SXW4zxR0RgzPXMKFRsPN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187561; c=relaxed/simple;
	bh=IdONEzeO/kcku0TNPRScc8YoDp0OPcTwD4lfoMWDGls=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MEipBX7c+Dp6CmLv3ksprlIf8g/xZH3osYZC0kP/HhWPAhKTq9zqs0qYGt1qrH9jl4ychyX5pEqe25kJCwxtJXoiTYu09g8ghE+cCMuWYdFzUtuNs8f+rULToWrOz1o2jG3lelcmJh4VQiHA8qpoksqAqSGPVgML3Lo5jW3pgJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MonAV9Wt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee07570deso53799865e9.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 22:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770187560; x=1770792360; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IdONEzeO/kcku0TNPRScc8YoDp0OPcTwD4lfoMWDGls=;
        b=MonAV9WtdyE7UMKkwNZh6mmFeiqnI7HjPePX1UpVAEJa/uIbRessX3pQTShd1OxggQ
         wf3O4s29UibTQ6tdFC+rqh+YThiEUz715lmKSkCHWd5usJBpbq7L1PYrSsUEPgz478QU
         U4HMVw+2YuO7p/tkvZvrTOGRxiTeJhWWR1VsIfoN0MOjhSjyoH8RN2ONnCScBGK245WB
         lzrVu6gpPF3syjHUf4FO+95cHMZo0N56o1EKOBJ81CiJsMS71jERgHSAHMKM1qLWEL9L
         LESXIxXOMKnuYmx8Gkb6iih5wlvAxAoSK/dd8ahoYIXcKii2BbMAaKQfNXn/JltkS8QF
         MM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770187560; x=1770792360;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdONEzeO/kcku0TNPRScc8YoDp0OPcTwD4lfoMWDGls=;
        b=oxQKEjyFI/0IhQjHw2GQaxKm49TtkBECJb2Ie9TUKU/ooC6xUrp+WlgPhIrDxu3gR8
         UktJO/mxdPTonOzbdhDRAV9Dq/ZciVakHflz1RSEcsJj1tIsA6BXpFDy01//6llVuROT
         E7h2wZWmS5aAVX/PqGmeVDRnIMrH6XPzOYcst1hoH644zFuFGMAg6X6go0gtVAtf7E21
         nXokAreN3h/tlavNZQjBfXWU3jmM/kBu8DqSeKqJ20OuRCRbFZSPDJ2x1R3I5Tg5CzQ7
         k34kv+bKtrNbpZev1dXU34hK/LrX6/ZcAJXfqVg7dNtHwrNvGKxOrV0O3fvArVYKmyZz
         bESA==
X-Forwarded-Encrypted: i=1; AJvYcCWugztZjvTS/mZcdym1FLnJXEZGdGKJ9D+nCaJubQMFrOXZI+fN4RMUwSEFP+LUokoqj3AApCM1ryI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyE5978KhkYBLpMNc3e8TXLdbqOY6k5GRCklHPE1JfxD/SEAVg
	FLioy8Bf1CSslpFPgxRSmH3TPQlOv4NAi5p8iMe9ZYlwJb+dJwdlHIw2D45Ti9JWccc=
X-Gm-Gg: AZuq6aI4E78gDLeiwrZEFqEM0EOWrdme7C9Tdb/XLWkXD2+G4q8rlAQqMUKlSwTv9Az
	qpgkosCwxrOCr03phIEDJUmVVHxtRfKJ5VmagEbGqCOJaHpldw6iM2yo2ix7M8kO8e7+OJm93p5
	jb7IwBKKU7uXtxuAZ1+fdpIftzWMWsK2t60p9vcbaPGmIGZLrsIna4UO3JiddjxnV1BOfSsGTIZ
	FxXOhQeslB/fBsSLohex0KXnwl7y47jiNH1O5kwMRsXZ5fQXWjcCz0UK0QDjYmWjybh7WRE+72v
	KBbNTYrqAwAOsnrj8iN4UzMXCz3IXF9ymVdzPFSQkQrHt5LrT1nK7c2ZQh2DwIh5pjWfKF0X2xk
	TAwUyXOkw/56rc8r0Jk3cVyJPEz8/GlSslKwrXnlI4keCvh4iIVhGzf8+h48Rp5B6Vpvwjk+Vd6
	vgG2QJIqJh6Fpw2gxyWQ==
X-Received: by 2002:a05:600c:4fc4:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-4830e95d692mr25283575e9.16.1770187559933;
        Tue, 03 Feb 2026 22:45:59 -0800 (PST)
Received: from draszik.lan ([212.129.76.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831088d318sm36527855e9.10.2026.02.03.22.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 22:45:59 -0800 (PST)
Message-ID: <977c081395c664a110389255e0cfa7eaafac912a.camel@linaro.org>
Subject: Re: [PATCH v5 3/5] mfd: max77759: add register bitmasks and modify
 irq configs for charger
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Wed, 04 Feb 2026 06:46:16 +0000
In-Reply-To: <20260203-max77759-charger-v5-3-b50395376a5f@google.com>
References: <20260203-max77759-charger-v5-0-b50395376a5f@google.com>
	 <20260203-max77759-charger-v5-3-b50395376a5f@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33083-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 279ACE269F
X-Rspamd-Action: no action

On Tue, 2026-02-03 at 22:50 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add register bitmasks for charger function.
> In addition split the charger IRQs further such that each bit represents
> an IRQ downstream of charger regmap irq chip. In addition populate the
> ack_base to offload irq ack to the regmap irq chip framework.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
91 +++++++++++++++++--
> =C2=A0include/linux/mfd/max77759.h | 204 ++++++++++++++++++++++++++++++++=
+++++------
> =C2=A02 files changed, 258 insertions(+), 37 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

