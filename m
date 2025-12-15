Return-Path: <linux-usb+bounces-31439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A750CBD83F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 12:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03F9030198E3
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 11:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E88326D73;
	Mon, 15 Dec 2025 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="VwyGvywQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5412253B0
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765798599; cv=none; b=Vnl0akNvlMjtAHKvj21xqcnSsMGBhuhu2JNHFFKpJZxgg5CxtsreZnnezXAsJ7FUTQLKFUGnyWmMuAfwoN0g7RaSLTDZI5M5h4Ygk6VzUdDxqfOn8g6UMMClhN9BikzFqNiQfu2tnxIWu4SHKnsk23y9bCDRxloo98jn3u402oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765798599; c=relaxed/simple;
	bh=8K5CQGNJve1RW39NoSUfaSDkqaJ3UQVV/VleCfTk9x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myJAYAQApjkfF6fA4NASRsOrfE1BZMWYx47XMnp1xeENDBr4PMxL1ohYb2nBQg9WFlB/aqQIvZJBNzwIlPafquayX87aVwPZC1Y/dHfEVfP6thjoiZ/zcqFGLkbMMq8d73x9lEIK33jI40nTsnp6AEDY/4dJPItLuhn5FFmUIPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=VwyGvywQ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so709449466b.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 03:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765798596; x=1766403396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Our2tTrLeS9+cKoDnOgCot+9A7UItxQonDfN3Zuzcsc=;
        b=VwyGvywQGp1uMScnX1vlpHce6SV2NoXE/I2TmQo+qJiFufjCa7dCX02s0Z/MCDCNN+
         1rHF6lmg1nY84K6oQTjyMOuRi2AgLCv3V6O5RLCiI0PAFJQcGpxkFpWqLD9MI8Sc1GuV
         NrTBzTgGLqtuKFzlUYrIofbnmMOueyf/heQhGpBOTdpxyZTldQwuj/4bhB5FpXyVl4PJ
         KA4Ue24LdKM08COAAdoJJGxHzyHbuRswh1HSA1xkSun99A9lawP0mTi8QEzvP5zXEnyI
         8Mi3aZuAPYs9CViWk/U6/h7K2imxo/eKm5e35a+282FxjEper6auPCj4sBzfqlaREd+m
         JhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798596; x=1766403396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Our2tTrLeS9+cKoDnOgCot+9A7UItxQonDfN3Zuzcsc=;
        b=LPKnOomfqlsALpV8gMKKwUY0I7Vw4ny0BXw+XUwP+btARS24rEPLpc7YGGodOa/AFd
         MkgFdu0tpha5qjNEucXcBR0rdi/TV6OKWM8KjEqfUQRX3wNUwziG1JfdP4MXw9pY6aBg
         xcwCnsYZA3gWXqjOozXbcNtb9pGXXJZqOMVOoX2MQ0aPer3vcP+XvhcF7q00iaNPPZh5
         vlYV9ZgbtYqqFcqiwPYBV1OuBSFaLv6DoW0WpxY3321onrDW0y7YxmL3fs5yWMRdzDpx
         X0TmQ4SZxXYE1zo/O/+Y0FK0FHa7umSq8MHaiCfpz5UeYeGpNo6P8/XDSyG0GbiujCf6
         V+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWyHrJ3f7azRT6PJzKszccaK+aTiOrRpYk4MvmEhZ2pc/EVm4rm8nf7os6xX95kwKt8LnydpAxO1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YygLjyg+XCuYdVWlXigRqMZn8IktKV5W0lH6ascaXModgDWAetr
	BU/fqdVzEbOhhmXc/ZZURKwdZqKXPiSyPbGeyCvIOBMguvYdUdGq38HntN2Og4UW+GPeFTru7Oq
	nOuWlyC10iKFWPFtF8LS6y1V6cZpKoVq4KUYRRp6Dng==
X-Gm-Gg: AY/fxX5BI+xnFbwRErA8bABiB+WJIgKyA0+th1zl4n83ibEHVsVHTZFa4CDaoULNil0
	L2ULcTJAH3rUK7aPoKsIEohJ7GYl5Jrle8pIpR1idG5wcLjcDzp1bpFblr25xLhv+nA/rXVuLta
	mXbX7UmLogeQcmJrLZ4V6sXpmZGqPJnFDMyIFU7uLFh063fS6E1wZkcZoth48rnjcQddVANU3AC
	h1X3Rpa0ZqEU9MmdIDtIuMUBD2C6SIUmm664taTn2W7s09frhYnsd5NjVnGnhCvblWlzK7T
X-Google-Smtp-Source: AGHT+IFe8rw0qhWAiH0mQoOljUOiqcSqb5gRs5qS5m8hogOLlJs+w47H8LQqQzDIOFZ44fMZWWGRbbSWXqIYIq4YXXE=
X-Received: by 2002:a17:907:9628:b0:b73:8798:3be6 with SMTP id
 a640c23a62f3a-b7d23665c4fmr1116568866b.24.1765798596197; Mon, 15 Dec 2025
 03:36:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr> <20251203-splendor-cubbyhole-eda2d6982b46@spud>
In-Reply-To: <20251203-splendor-cubbyhole-eda2d6982b46@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 15 Dec 2025 12:36:25 +0100
X-Gm-Features: AQt7F2oZT8D46ks79tXEN44Gcwk4DCt-08YRdCse_jKqK0ZpniHWAPSwJLfDHCc
Message-ID: <CA+HBbNGdd-u=4PtXZtirqRkFBhKwraa5gV-32QChDDjfVARPRg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
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

On Wed, Dec 3, 2025 at 8:21=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
> > Add support for Microchip LAN969x switch SoC, including the EV23X71A
> > EVB board.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  arch/arm64/boot/dts/microchip/Makefile        |   2 +
> >  .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 ++++++++++++++++++
>
> >  arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
>
> The majority of devices in this file are missing soc-specific
> compatibles.

Hi,
I missed this before.

The majority of the devices are simply reused from the AT91 series, so
I thought it was not required to
update all of the bindings to add the LAN9691 compatible.

If that is required, I will do so in v2.

Regards,
Robert
--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

