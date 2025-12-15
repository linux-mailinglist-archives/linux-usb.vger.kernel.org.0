Return-Path: <linux-usb+bounces-31446-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFEBCBE1DA
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 14:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 125053037CDD
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 13:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3EC2E8B9B;
	Mon, 15 Dec 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="DDc3dK1J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13561D95A3
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805477; cv=none; b=F82nLzpSWUkAZ3Uu9vck6UAGfYMwDB8SEVAkrXlvO4xeYei5I2uHUaTFZp3/c6xiaf+ID0EfGr6Vu4n9Wev+GfR2mXLlkNVB/g44m1P+gsggdmCU3ToJfSUwnCio252a2cTr17ShdQYrQfF2mEO6nu5AdTpV/IrzrSvwsTei4X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805477; c=relaxed/simple;
	bh=4IqfV+21sXkT4rpB7ZnZy6NpjdC+V8bm8PwvIB2EC48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoJZ907bbd5hFObZVLq1MEbs6RdcxO/q1seWQ9F77c15jUr0A3i1Yvx7TrPbVSUEj118j0Kpw2mNz69MA1OS/1oOdZR/69sl+QMjHq371grmE8HAHkI9BPaZBHjWqmDg8mLj4ycpN9QkuuJJToTD2fHuQX3njX+UPzZHTUnxmOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=DDc3dK1J; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so6983106a12.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 05:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765805473; x=1766410273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw+VWiqd/R4wFDIFdR2X28ZvT94yjzl0km0pBRnN7OY=;
        b=DDc3dK1JEMys5rx3jlagp4hyDgT2wdeH3AuguuaL1lwpP3RSnZaB0xLasscVY5r655
         NoU75j94IxqSRKfmFoB8DKDcGYpRFRds4QwciNrUqJ83gbZ+20nTtgExzWuXDZ/aM899
         WVCt+m1pS6PRKov5t91SolcAmZzM+Vy0t+OkPxc2Pzk+PirWOZhHgG8L2RYQaZiNPrlS
         HAa6KtTrxEeowAwLLv/OyrkghYzyTfi3+LbklsvlrRRzFtT1TE6sm+Phsrv7n59n9luQ
         0HvQEEEAQDPn5cZhaXm4p31cIw+dza2sRvw/6oAJwKHJW5F7CmUMKSPwyECKzL0U0ev8
         Gezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765805473; x=1766410273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw+VWiqd/R4wFDIFdR2X28ZvT94yjzl0km0pBRnN7OY=;
        b=ok9DlLG1N6cIa+hUOZmm6hRJpOa9cHG3QKkh9tY1tJQLpH+htHQMHDVns3ZwR5D4qM
         7sZfu3/KJbqFm0GVSr28lkWL/dHot+qaT5yPUK1Uy0je5Rm4knxs8MYPpZ0jFSJQxdZX
         4FnmZLC/3TikKjy/V3GHvIqxw8CmcOxOCfJ6XWJZ0kZ74wQZ7y+zZUJ3UUFjHuxQLL6F
         gMDNqdapQRpJE/GzCmVV+fXZ1ssd8TfHdJLwMB1sNeFHmIWdt1FWIMhH4pETZuG1tJMD
         toN0n4Df+K4I+//dJawCXo8suo9yyRU247g315cYhPJ0oy5ZUG53TidV3qEptJxYgB2L
         kfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdZGBlmC7aq1YzUz34h58EyQSJKbX0BcU4vgvk0m0q4mLkFhmdtuQPs3vo5ZEnxWDdBCFjYQrz3gI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBmEOD06ZM6q57N3ENN46AvXJ2M0k0Mu/kg5xkhn/217z/NBo3
	LtWGvbBlDPS+6Rg5PrSQxzwKQo2yD48n0CtweSVA48BIpxw3DY0afT2m+qF3uxXg5jh9h6g/mo4
	f7pY7xiPZ0pir6zbMAUZzfTHnIJ/YGGcerLiz362r3A==
X-Gm-Gg: AY/fxX56vvkWJ57fDy3PFfyHOC8VmWKOk7bL4euRPHU2IOdTc5Zc+WrRvCdbuUFQjzQ
	2/EXlKx2VABfcTe7r64IAYJu5oEv7bdgoATvza3AFtuwPp3zR08xrGfhHC61Tyzqx0sksTlEyx6
	+2A7TGhmqQonHB9TY0pxigHkupfG8u6uhMSKUWxGJXF6JDRXqkGOlN8fAbfytkeu62UEtkd8d7t
	hTn+myxQ34w4QEGwSTFRXPAPLwS7QgrUbCf9Lk8ONxpQeIlb2IJCyxg2C6vTqDmJequmD69
X-Google-Smtp-Source: AGHT+IH0jOC7I2V4n9q5hO9cE+4qZGL5l0QgmCHa+z37icAIbpE4GF3fcjaXDt2pkrHPiEtG7N6pGTFx3A7hEnLj0+M=
X-Received: by 2002:a17:907:9496:b0:b7a:1bde:a01b with SMTP id
 a640c23a62f3a-b7d23d13da0mr931934966b.63.1765805473126; Mon, 15 Dec 2025
 05:31:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr> <20251203-splendor-cubbyhole-eda2d6982b46@spud>
 <CA+HBbNGdd-u=4PtXZtirqRkFBhKwraa5gV-32QChDDjfVARPRg@mail.gmail.com> <173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com>
In-Reply-To: <173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 15 Dec 2025 14:31:00 +0100
X-Gm-Features: AQt7F2riRZ6DJPf2Vnc_Dn8R65r6BvztUnfjR9AMbbKZbxLcNxf74LNl1xmAB1k
Message-ID: <CA+HBbNFzETiySdw-VuzMJx6vdhPU_3d_aU2v9eJ4-_OBaTn2mA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, claudiu.beznea@tuxon.dev, 
	mturquette@baylibre.com, sboyd@kernel.org, richardcochran@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 1:32=E2=80=AFPM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
>
> Robert,
>
> On 15/12/2025 at 12:36, Robert Marko wrote:
> > On Wed, Dec 3, 2025 at 8:21=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >>
> >> On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
> >>> Add support for Microchip LAN969x switch SoC, including the EV23X71A
> >>> EVB board.
> >>>
> >>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >>> ---
> >>>   arch/arm64/boot/dts/microchip/Makefile        |   2 +
> >>>   .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 +++++++++++++++=
+++
> >>
> >>>   arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
> >>
> >> The majority of devices in this file are missing soc-specific
> >> compatibles.
> >
> > Hi,
> > I missed this before.
> >
> > The majority of the devices are simply reused from the AT91 series, so
> > I thought it was not required to
> > update all of the bindings to add the LAN9691 compatible.
> >
> > If that is required, I will do so in v2.
> Well, history told us it was better (in addition to be required by DT
> best practices). Indeed, even if the same IP block is used, sometimes
> integration subtleties pay game with us and a dedicated compatible
> string saves us.

Ok, I will then update the required bindings and include them in the
series in v2.

Regards,
Robert
>
> Regards,
>    Nicolas



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

