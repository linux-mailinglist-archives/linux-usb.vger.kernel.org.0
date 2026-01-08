Return-Path: <linux-usb+bounces-32032-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4E6D014FF
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 07:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDCCE302E30E
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 06:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967013271EB;
	Thu,  8 Jan 2026 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpOHVh90"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F76633B6D2
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767855336; cv=none; b=u7ocmsIw2m3J8zFVEtLMH5OMuGnSgAHWYgBWRNFcy3PQbkTX4dAXZtpq/2morlnJ5q0R2STUXI3pBUaSc1TYP870JSkPZM8zlUSB190lYt/ng6x0fS22etwH4N/gPQJyP5zZZfodqp3A01mHWogxmGWR8yRvXi04DUSUIydFauk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767855336; c=relaxed/simple;
	bh=x0oYpxGS7yS/ub4qA7RGQKP/jwnFykZn2neoyiEzTXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogPPrjqXJsHbLM4J2ex7TIQeXdemVMwzG/4ldhJJtB/mNSr4G3CrSdBIHfjKVafS+8S6rTCP53+MMg/JjF6p9UJIRCdhw81xvn6lGAHQM9nZA/U78L9ftCTyjSB+OIk7+72wbPtWhGYPmDVhrxBoraPxawA+tGv8jozXgyfgfT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpOHVh90; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso4373723a12.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855331; x=1768460131; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z95RpMEmgNwl7YB+bCq/7uMHk15Sjdmwjz/1QwjCtwY=;
        b=lpOHVh90+FWC3EHPigX+7FYcGHZ0V2pYULEVhTNNXUxU+bHcNjUcXC9Kh8QEgsGj+5
         1wcXbHydCzbC9ASlIROHjY2lF1Q3oGAOkGqqXC8HgONvXhkBSrDrkedmK/XwgmIh8DLn
         vGjfkzBzqpP1Vclvhoo/Y7nL6IvLF33Rh6Rgu7kBxrawr5hJH2jwZxsbi/FAO2TKKC8V
         iMDoRtvhdjPi+SHi9kzEis51Cymp79/kbCn80TMM27NjPaH7xCuHFVapXhkCTZIJwynv
         4qa1fquY/MaGWNEUT22LsbC9mk81urY849C/TU9e410+ao07TGeXJnxIXsbhFaBYYCH8
         2ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855331; x=1768460131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z95RpMEmgNwl7YB+bCq/7uMHk15Sjdmwjz/1QwjCtwY=;
        b=is6vuf4CwDb8SLbAJS/Kawges4zfrXTkBZZOPifF4uoVZ9GDKCIiSUEgNEsjzgT1Mk
         geS6crP3MONlJ8jNTuQMW8OFpre9f1m7/3XjHNlmIDTLZGjZDTMSmnK/SNFr3ZWZgqpV
         iOBet1VsFJjgcqTOTrrpis2mCG0y56JeEfEEd7Iqel6hADKG4GgEm+SgVw9VrnIOTPyh
         mqlxtatmi0xXFXNHxMpsTRGN95pv9h04XLLP3o1mxOthT+CGZ6Gt0qOYagMQVezzaRi5
         6cYQ5YX0vScX7U+oAvr8AMOGe3zztuKXfWB/ZOKS3cXtoXXDmZ/6YY2lxWOUoIJzwAaZ
         hkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqrhOWaqpzzRE0HXtkIijY2o6nefunR9IE7JQchh6e3o50/3nJ7x4XbjhrimhdG7EX5CHTm+laPsw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn2vAUwL2INR1pNHlBVrzlc69Lwb9rkoV4p3GDSaJXlFvT7nZt
	18WCUv4ZyJsF08RUfo37840cN0Dsy4gZN5bKUYdqm6MbyJjB1suvE67VIQ+QUqONQ9F6Fwp5WXd
	V2fs4pwl+lJ5/6EhZPwaALQV35xnLpU8=
X-Gm-Gg: AY/fxX4lEUfsGRciEjOzvFVtEuycBvPqE7phwC4n486o45cXQbdEBlrgMCCCLekQTVU
	K6BEOpIdWkN4w7I9Onv6+bWGrGbtCvLZQuL0Xssc+WAPp0HyEzeCTNU9L8SozDUPqXORfX7Ko6E
	oLfVIdGaHXebTJE1W2mjClqt8EPcwFbobQxrnyglG73PGXgeSh1/Ce4fSDdc8P+uhthy4sANz+N
	R0EK+KDlhn2rl1s3imVI5U8eXsOodr1+8it9TEMtulhpmwtOkhKsbuEcs1PfVzdk4rg7pKSr40f
	/g==
X-Google-Smtp-Source: AGHT+IG4U6kWECKctcFw6T4T3/RU4yz9c56j1F9uY6dHVa5DSvL+D+02G9vCcItZfsXHq6Ag8SriCCmYiwhyppBRQFI=
X-Received: by 2002:a05:6402:358f:b0:649:2347:e15f with SMTP id
 4fb4d7f45d1cf-65097e6e3cemr4114953a12.31.1767855331317; Wed, 07 Jan 2026
 22:55:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-3-linux.amoon@gmail.com>
 <aVkfNBUDUumzV0-X@venus>
In-Reply-To: <aVkfNBUDUumzV0-X@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:25:12 +0530
X-Gm-Features: AQt7F2qUzy3nVOhqisJzP2xjjJX_kUrGnrajstWtAcg0dioD3CSqLPjSWSgZj2Y
Message-ID: <CANAwSgTmAbswY6scsxj40B7Y6QbnkqWPuCqyevRjdtHNemq0aQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix
 USB host phy-supply on Rock 5b-5bp-5t SbC
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian,

Thanks for your review comments.
On Sat, 3 Jan 2026 at 19:35, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Sat, Jan 03, 2026 at 02:01:18PM +0530, Anand Moon wrote:
> > The USB host USB2 and USB3 on the Rock 5B, 5BP, and 5T is powered by the
> > USB_HOST_PWREN_H gpio pin which is used to enable vcc5v0_host host
> > regulator which ensures proper power sequencing and management for onboard
> > Double-USB-HOST.
> >
> > Update the u2phy2_host node to reference the correct phy-supply.
> >
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
>
> u2phy2_host is connected to an onboard USB hub chip, which is
> powered by &vcc5v0_sys as the comment says.
>
> You can see this on page 9 of the v1.45 ROCK 5B schematics (page
> name USB2HUB). The usb hub chip uses VCC5V0_SYS + VCC_3V3_S0 and is
> connected to USB20_HOST0_DP, USB20_HOST0_DM. The related USB
> controller for that in the upstream DT is &usb_host0_ehci, which
> in turn is using &u2phy2_host. Thus at least for the ROCK 5B the
> existing DT is correct. Properly describing the downstream port
> VBUS regulator would require something like the following series:
>
> https://lore.kernel.org/all/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de/
>
Actually, the Radxa Rock 5 B doesn't have an onboard USB hub chip.

The USB_HOST_PWREN_H GPIO pin acts as the enable signal for both
5V_USB1 and 5V_USB2 regulators.

Data signals from the USB 2.0 Host 1 interface (USB20_HOST1_DM/DP)
are routed through the CON20B chip to the Type-C controller's
TYPEC1_OTG_DM/DP pins.
Additionally, the schematic indicates that the Type-C controller's
power delivery is managed
by the USB2 host (5V_USB2) rail.

From the schematic, I could see that the Type-C controller is controlled
by USB1 host (5V_USB1) and USB2 host (5V_USB2) for power delivery.

[1]  https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_schematic.pdf
(page 27)

> Greetings,
>
> -- Sebastian
>
Thanks
-Anand

