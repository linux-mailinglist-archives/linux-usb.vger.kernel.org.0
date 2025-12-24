Return-Path: <linux-usb+bounces-31751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA6CDBFFD
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 11:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6076A301C3F3
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 10:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70AD2836A0;
	Wed, 24 Dec 2025 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="QkflirsL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B7E29E0E1
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766572229; cv=none; b=gmCM7HA3FEmfu/ShOK4seYnOYHOovwNumQ9S29R046HSmWjz8e/G61gIhS3El/KJMwQ1eXyZICYYKIdTtdbYimfFzN1+WYPKobdcJvRSVlVsKDIsrc3/thwkqV/RUt+1E3/JqmX6OEAMUIVfNvVp6l0kLnkKsUi8OHflWDRlbx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766572229; c=relaxed/simple;
	bh=KNz2TcJzJmqF7rsKjUpwytr/M43/Sc2TIAVK6pF3yUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LiNe+0sj+wagXpIromUCfahf04EST4bnMi8bFku7PAXgcbQwnIN5YdJjrO6tKhWM8JxcMRaQrQZG1qelC0XQ/E6u8w8aL7oNfNNxrVAVF/99LDH1IIBC8LfVa1n2IkBvZjDw9D8cCx849w1WfjY9mWFwCgMwG1KY18HXbgmm+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=QkflirsL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73a9592fb8so1096720566b.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 02:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766572226; x=1767177026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNz2TcJzJmqF7rsKjUpwytr/M43/Sc2TIAVK6pF3yUw=;
        b=QkflirsLWgw6/rIVLUiHc+xA6dek2yABjKGT4i+A+L5IppltKVDlUGSuOMevhCMgcK
         ckCLksZyu0cznkJw9n+xpMrIVsyQ3Vziem1/pZP0tLUIfK9BDzN3rwJgG/wSnpHiLBmn
         TbECIwlIAMkmtsBG4zMVFVhSwlOxuJaxJtFPNAujXepGgZdMwiScXo/ikP27cH5mMmK5
         QdxyunnKgaVS/qXTP0+3piJErhrQ7gDnG6FI1Dwa1lihHSqS/wyP5Uwz562Viur8V2EB
         fBVLF6esy6inerOy3NioZOYB5LpnIbIj1uwUN/K3fkNamRPUqXKSwot/bT8w1TYli6/g
         f0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766572226; x=1767177026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNz2TcJzJmqF7rsKjUpwytr/M43/Sc2TIAVK6pF3yUw=;
        b=IfdyTy2UTYmm9NrqTk5CJ5UQX8ezv5xdxL5LyFmPyoDg1ujPCBf5G6+f6dF/XvyU3K
         1r34fWRvPKHs8zKY9D8TBWy9ZXbTtEuiETql6hf5HA5oenRnKMakQBS66JeK3niU3edF
         gHzVQldSpvf6JIJFqMa1Lt8gFRafT+YlJQBmpgjvH53nR6PF1pxn3h1upOQ14lZIYcI/
         8WUl36uVP3tUQHjrnWwdYC1h2RaIERMbya+2CojX7ArequvttxDZw/eJGpWs/9KNEP2x
         5555Xbmsiq2TlQ6yrG5uPOTy/+kA9fVe6QM+Iuph2NZuY2tjSGsXO8/MRMTmbYv6jWsC
         l8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHN3zB6UJG/9z7VTz0Apawv2lVR8lgKpItm3Qpu/7uWJE0VP0Ui+Gv0IVK4H90D5+vHoHELezDcp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZVjQdyO9FxBjh6JiBwMGHhikfVnbjkkni/StUcC1i/CQ3/e/G
	kwrMuRgG0SMyvx46fYCwBKGDuGYwQp2LIGslR5PZlG4exTDn9bylFC8CIUuZCy4w0P2SA2+qIRJ
	ADrxrLyqTXa7d35focvQG7f1LD63GxIPrCDxQbW/MTA==
X-Gm-Gg: AY/fxX54P5ir5uAnDXxlxZvcBOes/owLKafmdvlsr1d+jyc5X93mKqGOBYzqh8LErOT
	98QGb5jRIBLRAGbKdV8l8giBPxtaM128gMWecSVwwLo8P3jiRktZgbomzrg6xy7V/LYQWi/dm/C
	LzQOZKcebd5Bb8kQkaXqDQVlIMvg/ucQCMG2BjFKRJ7ieM0ULbUTsZ1qnbMsU5sfllDAQGHpAYB
	5fyP//FfqoSaMX4UFnorc0HraaAGvfF6JSkbtcsHcXFbqMxI9n/tF3xqh5OhqsAEl254jTtoCSE
	cHAxJjER/4kmK8zVrDWhStghxKbMGIvtlwaKq+WDuoLa87UH+A3683YW+cIY
X-Google-Smtp-Source: AGHT+IFeflXA2mce6O+1rdmvPjP/12/Umt2Y99WbRQ8cM3OEzOcKAWgIne20UzsSB0V8xKjPoflCDtb5j1Pn52N5SuA=
X-Received: by 2002:a17:907:7f01:b0:b71:ea7c:e501 with SMTP id
 a640c23a62f3a-b80355b2523mr2261188266b.4.1766572225170; Wed, 24 Dec 2025
 02:30:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr> <20251224-berserk-mackerel-of-snow-4cae54@quoll>
In-Reply-To: <20251224-berserk-mackerel-of-snow-4cae54@quoll>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 24 Dec 2025 11:30:14 +0100
X-Gm-Features: AQt7F2rVNXRXeSbgmjkb2SKB7p5AiaNihNvuJMBrgMZ7XIKTnJcRJJO5brWpKNE
Message-ID: <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 11:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> > Add the required LAN969x clock bindings.
>
> I do not see clock bindings actually here. Where is the actual binding?
> Commit msg does not help me at all to understand why you are doing this
> without actual required bindings.

I guess it is a bit confusing, there is no schema here, these are the
clock indexes that
reside in dt-bindings and are used by the SoC DTSI.

I guess I should have titled this something like:
dt-bindings: clock: lan969x: add binding includes for LAN969x clock IDs

Regards,
Robert

>
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
> Bindings never have a "include" prefix.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>
> Best regards,
> Krzysztof
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

