Return-Path: <linux-usb+bounces-31701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A0BCD8D78
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 11:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5D823049B31
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 10:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D440F34DB71;
	Tue, 23 Dec 2025 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="GF2uS7wi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ADF2C11CA
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486111; cv=none; b=U28/fbpP0gepu0ZrHL4ZkvXiCEh17KdACMprPnu9hv1Q6jfDzuxFhb3UM1d9wiZEnj6taXtrD69N8s02yoe8KfjXjGPYMoVe7qKocbPWCBJ5UXMs8yuBUWm2XqBIuT9fSADezH8m9xoOegmObLymjjOPhI//pRGVsEjD+stCX50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486111; c=relaxed/simple;
	bh=nhnhn/ujbA1yivMUlMSXRd1v6Sz4LmmXkvWUytEJhUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsJvGZqlUtJQykykutN1RnSknM6124wxRNxIYPcQFth8cuUxO9uB4QjjIJMRHqBFOec0kKoxlZODKzPuLDj9iiaQuhbZxg9TrosZkRh+1pCRoWKNx9IBj4NhdQJa8chI6sqvlx8J2pFN6XCrMGbu3J5rWjRIhNCH/Q6wCFG06l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=GF2uS7wi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso1013743766b.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 02:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766486106; x=1767090906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWwHgDUayFaSdSqe2T6d6UFJFmjd2ZLae5KHc+yXH7I=;
        b=GF2uS7wiRyhBmf1kLR0gIF3Rip3N0z7rurwMgvhBqXkpElhZHM//c4ztfkOfl34VXQ
         1X14GkorXLzezj84xr2Y/dQLW+EfbQhQVOVhtnuM3M454FOIn2PNXJXS36N8bH/whQBV
         zY0fHit1GfAmUbUyKlPfmB88R6AoVgxYJryPviR3Xhc9pr/mmX1utNgHaFZ5HiT/+TFT
         EPfJeiatuCcTI+Wko2Rrfq/cDBpi0ycNUhFAp5hGmFIf/u3Ol72pdr/MxF3qgwek5A2i
         SlQTW3sCFS0UxINftvR9ief03PbV1fiyjZferC+QgdFvMpknr46FIg9k8YC+cFlkaq8w
         fJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486106; x=1767090906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SWwHgDUayFaSdSqe2T6d6UFJFmjd2ZLae5KHc+yXH7I=;
        b=Fny6GE2zfm6gxNc/qYTHI3Hv0C4QnuF7el6vj0nzrLM2WgmhjANRotXa9v/lt3r+QM
         iZg4YrVk73p/n1H1aPJLxgz2Yojio1YuIsIvSBCnCxFo1/CE5sVyJ42HaTDRJ8PPCuaz
         ShZ0ivt8VZF6h4hXfwujQvdbAu+cX+3jRAwEXxHE423zrnW4PhEGCNsRBRLjryas4NdY
         5BExCXEqRs/6zRasv44tnVktejxNIUIFG9WnQnm/tyM4IK1GyuDlvMo9DlsLwJxAR7Ge
         kfZQxIRD9W2EkRRiOCLJQrlJAxFlFhk6UqhhjyL6rvmVDc0WMmwZnUxyI9FGFb4td+Qt
         8F4w==
X-Forwarded-Encrypted: i=1; AJvYcCXAAdD2qaj7Zm61TLPnVn+l6sDpVaNRkffpYhR81tuscXDQT8rOJ1reSDs3eXn3odCt47BQ5JFFdMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcNinXJ/YG6w8pclbtxgc3yvLpgPCOC6XX2N2YUtb14Xj4Z8tg
	t4nYN8TOfbzoQjwn7PYWb6Vs6v3YkHCu0YrBoLYlBmHFoOwmH4X+LLQYyEJUICUWutp26kbE3js
	TNpsY+Q7OCYJT3TYcu3WuKP0Y/Wa8lkqGvbGacw6CqQ==
X-Gm-Gg: AY/fxX5pS+vmfIC8+ZPk07rzBBdtOK9gJOhB0MgDy7zDgTkftcIsdltVIwmK+boqE1n
	JcjV++N+dirCTRuY+CGAW3Awa/FFVCvQapXhtsvkmDn5QjsMFF/Tw9FTXBX4Mkv/ZUlIg9D4tsB
	479KO6TiW3MY5ngH5Z+4oHvoeR9l57EDh0UubgOLFTQy4yMIb1tR0IwgzvN86AgJOa3r7W6+Bg2
	e6jc+L+qNsKwdkil8u/AYeo3jFOKOhXoubMQ1jP0UV3hS4OzzBwvtmHj+JGP65h1smQJxcVWf5H
	KJ/7RkMcB8UzqslKbEJtcS2dB5AHZfslAP3SsaSmF8NkgT+E9w==
X-Google-Smtp-Source: AGHT+IEJHssgBNa10sdxlMZ0RfBcXjnBKXrp4KRUpqNBX0cKMLRNtJZXOvlDmXwgBRgg1wr13xel6K2BxjWOkHuOL+E=
X-Received: by 2002:a17:907:a45:b0:b81:ec7c:31fd with SMTP id
 a640c23a62f3a-b81ec7c321bmr332573366b.13.1766486105902; Tue, 23 Dec 2025
 02:35:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-18-robert.marko@sartura.hr> <20251216-endorse-password-ae692dda5a9c@spud>
In-Reply-To: <20251216-endorse-password-ae692dda5a9c@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 23 Dec 2025 11:34:55 +0100
X-Gm-Features: AQt7F2rp1ybXWw2BWzfekoJJeczrMeV1nO2lvHuguNeXKU1awsBcuKjFcFE-_B8
Message-ID: <CA+HBbNF-=W7A3Joftsqn+A6s170sqOZ77jpS105s5HPqkskQzA@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] dt-bindings: arm: microchip: document EV23X71A board
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
	kavyasree.kotagiri@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, mwalle@kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 6:32=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Dec 15, 2025 at 05:35:35PM +0100, Robert Marko wrote:
> > Microchip EV23X71A board is an LAN9696 based evaluation board.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  Documentation/devicetree/bindings/arm/microchip.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/microchip.yaml b/Doc=
umentation/devicetree/bindings/arm/microchip.yaml
> > index 910ecc11d5d7..b20441edaac7 100644
> > --- a/Documentation/devicetree/bindings/arm/microchip.yaml
> > +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> > @@ -239,6 +239,14 @@ properties:
> >            - const: microchip,lan9668
> >            - const: microchip,lan966
> >
> > +      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
> > +          Ethernet development system board.
> > +      - items:
> > +          - enum:
> > +              - microchip,ev23x71a
> > +              - microchip,lan9696
>
> This looks wrong, unless "microchip,lan9696" is a board (which I suspect
> it isn't).

Hi,
No, LAN9696 is the exact SoC SKU used on the board.
I will drop it in v3.

Regards
Robert
>
> > +          - const: microchip,lan9691
> > +
> >        - description: The Sparx5 pcb125 board is a modular board,
> >            which has both spi-nor and eMMC storage. The modular design
> >            allows for connection of different network ports.
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

