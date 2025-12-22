Return-Path: <linux-usb+bounces-31686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD96CD7058
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 20:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F59B3016BBB
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 19:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB5B33C535;
	Mon, 22 Dec 2025 19:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="pFZJUB+P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A566331239
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766433449; cv=none; b=XIMhgVVG3vpWp21vy49EkOSbbU/WNhX6WyV8y27mcAmV1s/Ir/ee80d1LcDvWx3kM5vig0IVr+vzPnDxgXmEWFTN6QFpcUTw4U4KsuDUGtxIgYjRaF8GK+PaD5wQ2WhQnqGLZv/onRrIuvYCKjQjC6J/rEpDYviYkO1693Upmpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766433449; c=relaxed/simple;
	bh=gqq7zNg4tUJJ0SmUCTR/rfb6bSKF7C5JMh5yMLNWhsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgWLhntH6sCY8LXX+wXWJTMHmtO81WWMQHDuxmd8s7TQXio+TfhbLAaCakIbRs9HKvHpTruQmiT1bL/YoYmx5AL6IwTDUPWD2Q8J8XM+kygYe8qTJ+zoZrNePUJVGzi25VrQ9epHJpIpVelyK0Ltg4xOZfjpmYZ3LBrkZs4OQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=pFZJUB+P; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso516078366b.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 11:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766433445; x=1767038245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1Ffz7SUjA9uiSla9hHoS8dAeCi7tewQV/vP2Eehn8A=;
        b=pFZJUB+PHZWLjPcQpowiytkshEGhxGj5eXPYicVBekCOyv5edtd/D/8QBRD4WducvS
         rVpLJLuIAiUIWS2Km205Ah9T/sgmRQOZ9OER7gw0sEWH7OPUrzpo5AnmT6KDq00vmhqT
         rBAs+UNDSUzDVSyWeqrZ7/t88wbpQXA7+rjHwGcjOD8V5mBeydw3VSesk/wA0KPiQC2/
         tjj+RokSHTTJfyDwGuAWCGrrUkqM8ridBPmhsAs205vnT73lATgHhsCYpiusiPmgDrnx
         3SiCZo4Noj8qZLChLZyEKiDBavbPc5IJU72tnwwaSUuh+9kbmKY3J/twONeia8BofiN+
         Y9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766433445; x=1767038245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h1Ffz7SUjA9uiSla9hHoS8dAeCi7tewQV/vP2Eehn8A=;
        b=LXLt/shRP1JSj9giIKYKVtX1PQiXuLl/R7s6XknYFo6wvDbLYJ4lF4sTQHV1G39BlA
         8bOJ04vvJr0SD2OEZmBp7Q8gwfBGlC5k8e/MPYEEqehDbwoJ1R+gBaMlbMTgyIl3Go5R
         7M31mAcnGbVt1xDNkWczx4z/LJUql12ENK3bSXAK+Ft5PR+Uxf/4/lHUaY8SGfpZCC5p
         aalgBA+CF8EHUM09VCCLh+K+5KzdFuFeQgGTMeG2O3N2xmRq0bgT7yfTIrHvUf6DjMYu
         PHOfPSC2oEs7qECXKAdgJ7M2Rv9Zom+XwVGeoy+phQz8QDLAR6JcruvSxOC1AFohj5ye
         d3YA==
X-Forwarded-Encrypted: i=1; AJvYcCVFeIjtGgHpVGFse16px2zzuhIjzt1/z0fQhIurGtY+eKwqpP5moPXumZj54VmgGLw1HoczzKzLYwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeghzsvjLoZHC5wnHwf/5yEFSMy0ftX8UdqxXruQ2cXX1PK41t
	Q3DaTcECuHsLEFYyIH/qvjN0xp60WnRCnQBXAQ9lt4yvAdo1fwrTPXOd0jsoE3FksJBmTjfD9pd
	nkxN3y22iz7BtzK2mp1ff6VjvBPRpgFM7FidH6COZew==
X-Gm-Gg: AY/fxX7lPlleIdu0zpUlx3jjwcz3Rs1BRV7FN9XgZiq5iv6ON2Mh4uv7pwB7l7Oj3mu
	HnjdIwc68QoOA0GYybZBdYTy+QVxdYVh0RiecWX2EqgA4sOIInaiEMoSt9KBO0xgk96CdDvqnUd
	CtCVjUB1rTphg1ICW0UBybiVeaS9LIaNCUFqidcUqO2Sg/cfwv71wlD+tn8//YE64Rubh2rvqr7
	UK2EwdR/dajFTsfdt9AS6HTSpMO6ymst0HjWkmYFS1qm0eza/fwa+HtAVsVAcGlKiXEWg5KtVJ5
	vMqbHNhtJhQYLyZ4MscaVP6FtsazOWquJ8CpRbYzc5srnXA4tA==
X-Google-Smtp-Source: AGHT+IEdtGGJL6owR7mmmwSv2zTvtla84ek3MFk4eZNiNP2lYiWN2sfcs6M8h0fxDoYpaxxvqE+4ieXBeUSoFs/4WBA=
X-Received: by 2002:a17:907:3ccb:b0:b73:8cea:62bb with SMTP id
 a640c23a62f3a-b80371a3d87mr1355933366b.31.1766433444769; Mon, 22 Dec 2025
 11:57:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-16-robert.marko@sartura.hr> <20251216-payback-ceremony-cfb7adad8ef1@spud>
In-Reply-To: <20251216-payback-ceremony-cfb7adad8ef1@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 22 Dec 2025 20:57:14 +0100
X-Gm-Features: AQt7F2rDm7ZgyJ9ixNo09GJcdYbsF1DFNHNC0FIPR01SjncTPp1tTulCOrRyRyg
Message-ID: <CA+HBbNESUZ6KB0BbpZUMfh1rjZTZMgY1SwmFQbx+CRP+a_1x9g@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
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

On Tue, Dec 16, 2025 at 6:34=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Dec 15, 2025 at 05:35:33PM +0100, Robert Marko wrote:
> > Document LAN969x compatibles for SGPIO.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5=
-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sg=
pio.yaml
> > index fa47732d7cef..9fbbafcdc063 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.=
yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.=
yaml
> > @@ -21,10 +21,15 @@ properties:
> >      pattern: '^gpio@[0-9a-f]+$'
> >
> >    compatible:
> > -    enum:
> > -      - microchip,sparx5-sgpio
> > -      - mscc,ocelot-sgpio
> > -      - mscc,luton-sgpio
> > +    oneOf:
> > +      - enum:
> > +          - microchip,sparx5-sgpio
> > +          - mscc,ocelot-sgpio
> > +          - mscc,luton-sgpio
> > +      - items:
> > +          - enum:
> > +              - microchip,lan9691-sgpio
> > +          - const: microchip,sparx5-sgpio
> >
> >    '#address-cells':
> >      const: 1
> > @@ -80,7 +85,12 @@ patternProperties:
> >      type: object
> >      properties:
> >        compatible:
> > -        const: microchip,sparx5-sgpio-bank
>
> This should just be able to become "compatible: contains: const: microchi=
p,sparx5-sgpio-bank.
> pw-bot: changes-requested

Hi Conor,
I have tried using contains, but it would fail to match with the
following error:
arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb:
/axi/gpio@e2010230/gpio@0: failed to match any schema with compatible:
['microchip,lan9691-sgpio-bank', 'microchip,sparx5-sgpio-bank']
arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb:
/axi/gpio@e2010230/gpio@1: failed to match any schema with compatible:
['microchip,lan9691-sgpio-bank', 'microchip,sparx5-sgpio-bank']

Regards,
Robert
>
> > +        oneOf:
> > +          - items:
> > +              - enum:
> > +                  - microchip,lan9691-sgpio-bank
> > +              - const: microchip,sparx5-sgpio-bank
> > +          - const: microchip,sparx5-sgpio-bank
> >
> >        reg:
> >          description: |
> > --
> > 2.52.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

