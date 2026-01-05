Return-Path: <linux-usb+bounces-31932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E5CF4B7A
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 17:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 420883009D53
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 16:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1821E33E34C;
	Mon,  5 Jan 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kzkj8ilV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738633D6D4
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630881; cv=none; b=oyJI6vCVZBN1b4NyFGjMmxb6gDhHYX+U10D/FGTmM8kLI5cmxgihnQv6VOnDlPCzaysvS4KhgHxuVb8lOkJumGNI8NbphQiLK9CDFvlehJaLbk21KRwBzzMxXJDYWnb/4F94aHvgkhep5UMpAs49JG9oV/yQDn2srLgzhrfdxTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630881; c=relaxed/simple;
	bh=fonikX7z7K1ohHQZl6vZ41UkDK6dK2RBIq07hZiimXM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PyDo2JMAwGMxxgfCuLDkNjcIVVekPYZp706MaSqJ0uI1g6dsPrHymS2N3vD+OTLSDJeufeMadiwgojTmh2o2OEilE+CXkhPW4I498lmYT+zcBkkSJxUSSbbEEiVm1bqEMwxwh8UyauJ//AqSfOI8xIgWNnp8kgr4fR0q2hZ8Cm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kzkj8ilV; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so134226a12.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 08:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767630876; x=1768235676; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fonikX7z7K1ohHQZl6vZ41UkDK6dK2RBIq07hZiimXM=;
        b=Kzkj8ilVNzMJFRW1nbm2QkX1jFeSKl5WkENFpQPkTe6EfrRyB4/2A5M3hGGHB8uyNm
         RVnxTbxgCEXDZthOXFVd/ohUQ8eH/gvIbNkjERHjJgVCBoEoLZrfj8SH4U9/2OuUBiHG
         lycvPdYAIjkB4nBjVEUMDHuD/wQMijclKtxYmSHkIbWPYRKGichS5cMGSmeCGMiHA4jS
         GyDuZXVdd6ZzjRVHA4VqYbib0xmmABB3FDdbgKEG24kM3ewUXFg+Ui+LC3XhztVQsjOy
         fY5YNig0nJEtLyuFN24S0aFYzIM2sCIccS1E1qxCtCL4iy+OYMI53Y9nB6h3K83FLqUM
         t6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630876; x=1768235676;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fonikX7z7K1ohHQZl6vZ41UkDK6dK2RBIq07hZiimXM=;
        b=geanlx6MjX50ujrNcn6vu7M15zaBdsHAbzqA3VnA7rAnjrXLI3m2AH7m/Zaf0i2Y64
         sIIFrPDiQG77jAPu+ZEq7pfsV7zvaIXDwSmBtBXERg1p5UaO/s6ZEsA1ghcVei5kwJe7
         zr14BrGYFYf/TevlUyfYbGa2goO5aYqSAI14RHks6q/4LLCdexQFGi4jpStvKzuMpQT4
         u6W0+zQhfRTK88KkyFcr9UBb5jzLm+YktyNwxBA4SIVEJQGoM9+rQXes37DqzSQaEcpn
         RTgMo023nJHaaqIwTAFS8yNa2MCJgepwFaUbqYkhMg9XpefP86nItU86RUXV7mYkHf+m
         tcFg==
X-Forwarded-Encrypted: i=1; AJvYcCWO3s93yKvcqpg2y2oEpJ7njsPeIzJWYNGofaLHBKLvHuucnGJ4ypbZeYRO2LyRs5Q+SYd/b45sZBg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2vsvAw0/eAYyM2TxAjhebspb7y3rFze9nZyHiLNER/WwLyDq/
	qekkcdBFEMqnobrv+MXkeEcaPA0yhmbEsE1D6LYlsHiBZbxNQBz6fQ2Ep5EdgbLB3sA=
X-Gm-Gg: AY/fxX6LGCLQdBx7Y1GuaCYCGHH8AF9X4uiurEU+Fh6md9rbxxtcqvzWhBWdwtlJAFG
	YR2d2Ku5ZKVbZdiEmhv/dtgw7y6yq1joASjxFGwn6FIUS8Q8rPo4RVSHge+QKsOg5XKgyt7yIv6
	aCZLoTzAOk5BNzjgWiZKEbeN1WwaaR2WbhKM/0sG2FA37KVl4LWRjB/EUs1mwoK+uKSWoheJ1+5
	yaAWMiM2rj2DMHhKC9b3qyG1YP/8PSSBJTgpPfIytknMK1mEE+mIobUvpRjYcltpYhgK2Qh1oy3
	9OaajdSGryRycQb7M5NKFxlPa5t1nt0P/qj35WNR91LpWccAfz2pa6K12QUjGjpza3zc9rVEMd7
	nVqaW9VBKwwgYOcM+yl8D0AWwNnFBCeBiJvMneYyh9J8HuVQ5+5ozf0V41dKV6jgiRDrlf3foep
	STJbWibFVu5Xl4mcIPPg==
X-Google-Smtp-Source: AGHT+IHIyW6EL5Qeds3ppqsne/ep5l8vVI6WL/+6EbkwC3Ri0haHzlrCKUwNVD3J8FuYeN4YtG8RdA==
X-Received: by 2002:a17:907:a43:b0:b76:74b6:dbf8 with SMTP id a640c23a62f3a-b8426a67855mr36978666b.14.1767630875838;
        Mon, 05 Jan 2026 08:34:35 -0800 (PST)
Received: from draszik.lan ([212.129.74.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84265ac3ecsm40253166b.11.2026.01.05.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:34:35 -0800 (PST)
Message-ID: <6eb57ad14908ae894f090ce83c756e4cbc834aba.camel@linaro.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: mfd: maxim,max77759: reference
 power-supply schema and add regulator property
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
Date: Mon, 05 Jan 2026 16:35:09 +0000
In-Reply-To: <20251227-max77759-charger-v3-1-54e664f5ca92@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
	 <20251227-max77759-charger-v3-1-54e664f5ca92@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Extend the max77759 binding to reference power-supply schema, so that
> PMIC node can reference its supplier. Also, add regulator property to
> control CHGIN (OTG) voltage.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0.../devicetree/bindings/mfd/maxim,max77759.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++++++++++++++-
> =C2=A01 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

