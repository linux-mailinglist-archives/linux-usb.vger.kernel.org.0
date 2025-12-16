Return-Path: <linux-usb+bounces-31494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9C3CC47B9
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 17:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7CA030343ED
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 16:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F8532571F;
	Tue, 16 Dec 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Bci519GM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1063246EE
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904197; cv=none; b=lgAgv+T+BK8jx2WObOea92+P5Mob7Yu/ytEL8MW2IGxN/bRqpspD6LmuGvKB48DqQ1RwuxUHifbe7dkwaiO04l4rnDLXYAeIwaPRkeVaNLDqi2hJLLjniTkKiE3AvnBfJIJ4ZFQmgUd0bXFpJHIE35MUk4NejP65DbufSalr7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904197; c=relaxed/simple;
	bh=Q8UWsSe4myl6JsHqQXZQYvioe1R/IQ7hZDIpoW4Rb/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhvmHwDO37p1R883yL0PiF0p9PK1lG1vDKsEdnbcRgiAoB+9sBoZQcpsOPfXx34zzRFsb6mrkmwtwvfhKOyTsA9ljEN2Bt02mIKEgufXSvQdEzjL4lPWy2BoWiIXb+NGkz4ri/99ZeV+2M2t3cD6b+4QKWi4pOJPMcveqHpmSnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Bci519GM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so6860633a12.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 08:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904193; x=1766508993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Do5MSIsK8H3vJghWudLeWsp2L3mzUT53/Ta2p6+bLc=;
        b=Bci519GMSOtC6TeCoUDyOlRLAMpK1+Q2VT7ZhSiNkVq/sylIitjnbfNXgSikndxl/A
         cd7NgVtjDoigrZ2hgv+nG6NUMdj4xZwAP7+aJX3C9nC+hC33rShtz/CMMALFyJaKN4gP
         47aeAH66w7rPn+An+lPnjgC8UK1y82k7RjHk0Laz0mRiKds6qMvdk1ypUkRe4iMFyIa2
         nURMkz/iL08EItn8+Gi9lzHxP24ZMohsictJ6bIc5meWCnwuCZiRYclWZ+JfO0qLN2T8
         mz84elWoDZq4kj7Opb6xh5i7WKc8WHHSRMg2pmXihuWhxphd7yhSNHxGPZ2wqxioow8E
         hjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904193; x=1766508993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Do5MSIsK8H3vJghWudLeWsp2L3mzUT53/Ta2p6+bLc=;
        b=DyulpTrkITjmMYyJEfMo1imidz28nRnSkMd5bH3WV4CuIB+hO7vcNCyoaYbcteKK9A
         Fqmj0wfBxh9mkBLsKf/DEGM7dyj9iptpI36ZSEEcFcQxIAix08oIDPC2bNIOmqInOXkY
         dwpRjLgJjXpXTPnNXL24P8B2PjejB13m1hhVPERV5xcZMNUSma66e8AfXDyIeV95/enj
         xHxbaLY5tERlYBo2p3noXXAW0wRA6IGsXdLo7vrUVE6xPeqaZbwNkbt3nW6isU8DhE9Y
         LdCYze59pVuF0DDzP6cQ9cHzq8oKDAIlC/132DK3hdUpHZj1J31EojR+wYYcNo6eUFPf
         iUBw==
X-Forwarded-Encrypted: i=1; AJvYcCVPC+bSSyBjAqKDkUl60h7dgrPETu9rkHwRTaHZy0jILALP0CAUHVp8oWJFz9pwtOVyscBo+NWXbcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS+Q1vemg0vQ72pj9J9RsLAoueBiEOwM7iTtBCTHb/BJLCqEeh
	aKx2IEpesXFdBmW8kejX6LrdQdgBsg/XB5R8zYug33exxRRLdZGvs2aJ8Xnv7uGdTvKGmOi6zCd
	qv9taNiVQWqlhyE+e6Unlt8Mmc/iPwnv7Dx1PnZjrMQ==
X-Gm-Gg: AY/fxX5YUDqBR5pYJRQqByZsr9lBWv6A52fGjQtoRckNkIw4usj94vGnHvDKxwyaDpb
	CG7LGwNxbm5fL3b/yD80PVL/jiW0+HXWjCVrlvIWSYbwKrKShjwtlgYP+q37MWep9RO7JdsXS0D
	EySazbYQKPmws2F8cF98iHe0gFW7u05zET0SdixC3JxXsoaxw2BSao7617h/d8cJreAbz/FE+KQ
	1F6MoymG6vGwX+V4DUI50/RCYLhctMCnJ/wD9EOqXzvIc/yC5MMdZ9gDkxI2MlVBBfChHp/
X-Google-Smtp-Source: AGHT+IEe8IRzlnpv6us5Kh+xr3yaMQ8uOrd9bT9YETlEwP5WNPrUGdjkFlMhzeEA5DOez3HUYl6RwAjZzXtLufIttIA=
X-Received: by 2002:a17:907:2d28:b0:b72:9961:dc04 with SMTP id
 a640c23a62f3a-b7d236ff5fbmr1632649866b.28.1765904192972; Tue, 16 Dec 2025
 08:56:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr> <202512161628415e9896d1@mail.local>
In-Reply-To: <202512161628415e9896d1@mail.local>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 17:56:20 +0100
X-Gm-Features: AQt7F2rO9yn5Ak9EU9SF12LWH7YDPd4rf09lvsuy-j2tIJy7_yg0e1grszJzZqk
Message-ID: <CA+HBbNFG+xNokn5VY5G6Cgh41NZ=KteRi0D9c0B15xb77mzv8w@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic Microchip binding
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, vkoul@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, mwalle@kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 5:29=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 15/12/2025 17:35:21+0100, Robert Marko wrote:
> > Create a new binding file named microchip.yaml, to which all Microchip
> > based devices will be moved to.
> >
> > Start by moving AT91, next will be SparX-5.
>
> Both lines of SoCs are designed by different business units and are
> wildly different and while both business units are currently owned by
> the same company, there are no guarantees this will stay this way so I
> would simply avoid merging both.

Hi Alexandre,

The merge was requested by Conor instead of adding a new binding for LAN969=
x [1]

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-2-robert.marko@sartura.hr/

Regards,
Robert

>
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/arm/{atmel-at91.yaml =3D> microchip.yaml}       | 7 ++---=
--
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >  rename Documentation/devicetree/bindings/arm/{atmel-at91.yaml =3D> mic=
rochip.yaml} (98%)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Do=
cumentation/devicetree/bindings/arm/microchip.yaml
> > similarity index 98%
> > rename from Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > rename to Documentation/devicetree/bindings/arm/microchip.yaml
> > index 88edca9b84d2..3c76f5b585fc 100644
> > --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> > @@ -1,19 +1,16 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
> > +$id: http://devicetree.org/schemas/arm/microchip.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Atmel AT91.
> > +title: Microchip platforms
> >
> >  maintainers:
> >    - Alexandre Belloni <alexandre.belloni@bootlin.com>
> >    - Claudiu Beznea <claudiu.beznea@microchip.com>
> >    - Nicolas Ferre <nicolas.ferre@microchip.com>
> >
> > -description: |
> > -  Boards with a SoC of the Atmel AT91 or SMART family shall have the f=
ollowing
> > -
> >  properties:
> >    $nodename:
> >      const: '/'
> > --
> > 2.52.0
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

