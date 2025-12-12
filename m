Return-Path: <linux-usb+bounces-31401-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D93ECB8932
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 11:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44CE730184C9
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 10:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BB72E0901;
	Fri, 12 Dec 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Zy5C2mH3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203612DFA3A
	for <linux-usb@vger.kernel.org>; Fri, 12 Dec 2025 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534156; cv=none; b=fHxtZKEPIPZJcVRkOgI+hL8S1gjiEDYHF/SWA02tXRem2KV2OLVLJkQgkIFZ7SYxPbi0wrBe6AoE0DSysAEJr3NsmTFB/BM8SFEi3qEqUKT3nRVAH89OBvjFqviDimjPiudpX5cfcfDn7dBiwQVnGHNNvQyvgYVLjTZ/uhq+lRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534156; c=relaxed/simple;
	bh=+CgqYVH9orNZOCijPAUqc+h3PhteR2BDiAlkPl93y2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEoInPe5xRXjzQ0q+CtRTgreLlohB8vKspUjrgw9V/03W0n5QVP+eciBTSeYuS0GB65WqNhoV0JAwAH2tEXpz0UBqz2dhgI95pL5H4NbHn7zeLfMzWmZgLHMhzGlUp+SjedEB4lvb0dAcEWYX1tMTRo9PIQ9nmuCrEh15Reox2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Zy5C2mH3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so1876494a12.1
        for <linux-usb@vger.kernel.org>; Fri, 12 Dec 2025 02:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765534153; x=1766138953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piKeicldVFohFnPgSVyUwsQHuUt89125myGk5tf25V8=;
        b=Zy5C2mH3YV3kmR8lWvRj8ihyBacWLyf8HZzakMAOQgEjFKxqUOQMQLlRSmB8qVh1R0
         W2M9hL6vEtna1D83xuWy5rYzO9keo72jTylMimmImti0eu6FonAXHdCIlGm76sYGZEw0
         /UKwjUsaUGcvqx17waTIfbZDmDlfhilMEraLQChb5RzE2/6hVEhJdpsr1BrNTz6+QEp1
         sGYGKWrwh0XaTtvs1nw3ZILQWbcmRUxOqkY942oB0YsTRQ67W/DIdAg4vOF5tbsDXhE6
         oghjsaETf666NTM5iqFHV7DDklMqNaD9uqQRn9XTTrZCjIe1y9xVVOX0JaTG00j4RH44
         cXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765534153; x=1766138953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=piKeicldVFohFnPgSVyUwsQHuUt89125myGk5tf25V8=;
        b=IsiSCdDm+bmGBguw2n31BYvvLkT8dN/67bEYfIJNM5JTPD1DmJR4N1viWyo627ovbw
         H8N07lFd0yDhjVIZNekGZv6JEOQ9isvW/qyMqg0IS2JaqObYPjDMFc2MQjJC69A2myRI
         BQM0MYN2qeYCsW9V8mAO1qoEfErIie5z9Nq423NkoXpN/oIrHyMhfI6+FVLYZvriFkEX
         7fEz062NkDy6bsUHD83ccZ6K7/DGE2vTkL9o7J5K+zTnc0EyAFbC7HfsbMUyHv7euwv8
         1301xlfLSs2qQO2xAgykb3O2jlr+OuuJNiQWEix/aaQK/4KTz+CHDZCeuoEixSabNbp3
         gqBw==
X-Forwarded-Encrypted: i=1; AJvYcCVq17oquONJruT29VMAAaRCbL5z34RFplwyJwUnOhiG7X8pUZ2qacPTczQV286bmzWIdZo1yIecyMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKwMuIJupWGLEJvNTDNJVNHyPzfFZQOyO+fFWBinIUpTE6u+Fl
	JLDRIZkqlAqVEFAfVlTnDXzsG4WuPdN95NJbgeJk1ipR506DlNHfcCCXtsuV6OpmA2YWtQppRcL
	LsAvCbl7aUUbCG2wWUTP9mqUwyZuqTaTz/mNcWeDGvQ==
X-Gm-Gg: AY/fxX7NMRmwR1TvyKNf2BOsqKj3hzuBJ1ikwtv9pxbm9Gv9gvqMKXPrb6NEe5huGbn
	Ta7QQ+ydGj55hMRAkV+rXfRzZf12aOFupvHWamtVWV2TQIG0bo9BpEgurTOPCuywLh4R8uJ8CR7
	3+sf7jTNf+r7WmA0JqVoSZWqy7OYJaAV39EzZBRosaxW0DQhX2vSKdEeHLrgyHU+xkpSsPfrgyI
	biOT4LmI6lIbJkXWgdv+gsRvWCWOo+Vd/gasDBzTULy89DBAvrey3doGpGu5mdvHzmwnlY=
X-Google-Smtp-Source: AGHT+IGu9UDsKSPu1wQCEy9ZSntpZSOo/9V+U0kQrHcNkQAxG5oPTpTaMv6wXo2k7lZ0/X2pNnXrjg4sARyaZrNmc5Q=
X-Received: by 2002:a17:906:f5a9:b0:b76:8077:4eaa with SMTP id
 a640c23a62f3a-b7d23618a6dmr134378366b.6.1765534153256; Fri, 12 Dec 2025
 02:09:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr> <20251203-duly-leotard-86b83bd840c6@spud>
 <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com> <20251208-absolute-diploma-6575729ab43f@spud>
In-Reply-To: <20251208-absolute-diploma-6575729ab43f@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 12 Dec 2025 11:09:01 +0100
X-Gm-Features: AQt7F2qi9N_ckMGJFgowBcvF34rbB96zRSF2oUqF51CXmoKh0Qd3rJ2sqP-K-eQ
Message-ID: <CA+HBbNHuYCq9oV4ZjWGjwnJM=oz-O85p_tqB+UnTBmivzDoowg@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 6:10=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Dec 08, 2025 at 11:30:28AM +0100, Robert Marko wrote:
> > On Wed, Dec 3, 2025 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> > > > Microchip LAN969x is a series of multi-port, multi-gigabit switches=
 based
> > > > on ARMv8 Cortex-A53 CPU.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > >  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++=
++++
> > >
> > > This should not be in a unique file, put it in with the other microch=
ip
> > > arm devices please. Also, the wildcard in the compatible is not
> > > permitted, only way it'd make sense is if these are different binning=
s
> > > of the same silicon. If that's the case, you need to explain why,
> > > because compatibles are meant to be soc-specific.
> >
> > Hi Conor,
> > The issue is that there is no unique place for Microchip SoC-s,
> > LAN966x series is in the AT91 bindings
> > while SparX-5 has its own bindings file.
> >
> > What would you suggest in this case?
>
> Ideally, arm/atmel-at91.yaml and arm/microchip,sparx5.yaml would just
> become arm/microchip.yaml. The axi@600000000 thing in the sparx5 file
> looks pointless and can be deleted IMO.

Ok, I merged them all in one generic microchip.yaml binding, but I noticed =
that
arm/atmel-at91.yaml is licensed under GPL-2.0 while arm/microchip,sparx5.ya=
ml
is dual-licensed as its preferred for bindings.

Is that going to be an issue?

Regards,
Robert
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

