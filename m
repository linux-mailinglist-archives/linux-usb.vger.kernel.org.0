Return-Path: <linux-usb+bounces-32163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BDAD0FA6C
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 20:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A850F301D311
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 19:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB9B346AEE;
	Sun, 11 Jan 2026 19:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUxc0bx2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F9434D381
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 19:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768159878; cv=none; b=iWyQdNnJcv+FJjMZ1Zqj75fZFELWgjhj6PTcVE/w0OhXtUdrcW3awxHWmxkFQhowB/RVkBrxcCnsuoOEf2F/dtk9PrBm5bJDL8IH7ZTjH4JAiwouk3epKC0uvbvvEui2y77IQcwkxcTUovVuxwEh8nchOmkFsKuxwPxNFHY9TUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768159878; c=relaxed/simple;
	bh=H5bpHf/uDAF+wHP8m2BgsItDGPnVxIELrvfw9y/8JvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGoKC4Sdz0kT7x6hoqcs6L3tx4haatnokGdUilOT/PQw0x3ZJ514YQoZXsPCJGcOHQmCXkpUZSNqfJ7D3enT4qK2BiuyBzEaiqb25D1ArinMh9hHdJm1DvveNGkHTlJSx/yw+MIGjYzajgu7bW8Gw1GWVMOfQhdrjw1+szeSetY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUxc0bx2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8708930695so104974466b.3
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 11:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768159875; x=1768764675; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6qkrUF2RLZLAfR72blD0obsNP0e+yMnfnNhdR4To/xk=;
        b=DUxc0bx2eZI86bgrcBglMUcOFNryL2OQYN8GmS258bOyL/3mgbjMfyYOXJNpH6bxsj
         Rq4Zm0cGsVxXF5m0J+6Q4PH6WNsoyd2LyJd2xkTYDHQMZwwxbiqU/BZWmsY3Jl+F6JIg
         XzyV4lFlW8R26Q4gbcpoEYnGdn4vX8W9k4rucGqjeMLo2OxXUaRYhprWyGDXb94tS1ZI
         8lmFDLMHEZ/B3Yg16TvBz5E089uK9ODpbC+87r38k3ua+mUuG26k9/o1iLMrmRh94HcT
         YHJd15k1tLF83vYd403CYWuWLqTQNVLtWDJTWRYQ4Lw52P5JznyubPBlqskrOQo+Ih97
         y2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768159875; x=1768764675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qkrUF2RLZLAfR72blD0obsNP0e+yMnfnNhdR4To/xk=;
        b=PYBp0poSzWpKq+tvS/G4aHU7c8mwrLnpwkvKTkUnHs5zM0t/x3ZFTqTyxEBRa0LZLM
         4ZvPWC62JNSJQm6kctjEu8QCqcWzLTydi8xDhgn321lS4Jp2IfS/tUQq//ocrZzhfK7u
         qKYlKqlV5nGNzl1ta8S+6EWLef98KVIjs1tGBbeOcS5W9AHqMJYbP2B7QpUxJqBvYswC
         Y+Ok42CIkxWe+bUR+T583enSa5wh0M8ofld7CFchSpKvOdwooA6B9+CBmP0AcEKGg9Dn
         34ont+I3jmOvyYe/VEsz2O6PvDFpqXr1fzPzOtgZeHwwzv+mziV3fk6G8zArWGJeaBbI
         jgUw==
X-Forwarded-Encrypted: i=1; AJvYcCUONVGZ6+qMIv89CAii49h7hkaUKDQTHstFIEnnjavH8DktL4CBm0WusaOU2XGGmgmXYFFaE56dbC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAg+PVAefHn3ZNIZ3nshPm5Y2yLkKW/EWCdBv7iZ24Ng1S44IL
	pW0wIklCTotgx99lCek1RjQN2RPZ/K6H6XgESRYfm8YCFGWA3KMlbw/JArXkr+isayngYDW+xJ0
	8f8ON7xCG4o3XmV7Gzb4reSf3pJ5kMU8=
X-Gm-Gg: AY/fxX5mjvQaVeH7SJ/a5Rdl/Y/8VeUHd+AYvPyVkT3OCASWzZm+McRFFEZDMQHlFIZ
	3dZ7OrTUUd6OtYGAqu7yJyY4R29N+4BhjlzOBCQD9iJZPoXcdRDlTpPoUKLk4xVayvpYfB8Hhly
	+5prRqsBXhgcj8MgoknVVB50Yf3Kj9siHjKqubr7QkQUecTD63tlczaHnwaZow/ZX/vDOWEG3dJ
	mJMmWWweYptriSyBbq7rcVRLChqgo6hyga6vbKiiYBvtRN772G+cM2FJkhQ6DWbTdE=
X-Google-Smtp-Source: AGHT+IFWHn5dbPTd753DAc8rct7bCxMeL1qXuxz+hBvBFK6fMM9k25uVZu5YNTzZOJAyMEZFBK+guOsxRA7rnfdhq2c=
X-Received: by 2002:a17:907:97c1:b0:b87:1c20:7c68 with SMTP id
 a640c23a62f3a-b871c2089c4mr94188166b.16.1768159874510; Sun, 11 Jan 2026
 11:31:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-3-linux.amoon@gmail.com>
 <aVkfNBUDUumzV0-X@venus> <CANAwSgTmAbswY6scsxj40B7Y6QbnkqWPuCqyevRjdtHNemq0aQ@mail.gmail.com>
 <aWGLE-zcPUvQj3Q0@venus>
In-Reply-To: <aWGLE-zcPUvQj3Q0@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 12 Jan 2026 01:00:57 +0530
X-Gm-Features: AZwV_Qg69Yw4dYa-ixw5oGHgx-Nm67dcEorw3Ehevd0t63RHaOwAygX9fHLU11Y
Message-ID: <CANAwSgRi+STUapakKV4XrGVD8B6LSetGC8Ya+Ubiki7dOQyGUg@mail.gmail.com>
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

I am having difficulty articulating my thoughts clearly right now;
please bear with me as I try to explain.

On Sat, 10 Jan 2026 at 05:03, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Jan 08, 2026 at 12:25:12PM +0530, Anand Moon wrote:
> > Thanks for your review comments.
> > On Sat, 3 Jan 2026 at 19:35, Sebastian Reichel wrote:
> > > On Sat, Jan 03, 2026 at 02:01:18PM +0530, Anand Moon wrote:
> > > > The USB host USB2 and USB3 on the Rock 5B, 5BP, and 5T is powered by the
> > > > USB_HOST_PWREN_H gpio pin which is used to enable vcc5v0_host host
> > > > regulator which ensures proper power sequencing and management for onboard
> > > > Double-USB-HOST.
> > > >
> > > > Update the u2phy2_host node to reference the correct phy-supply.
> > > >
> > > > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > >
> > > u2phy2_host is connected to an onboard USB hub chip, which is
> > > powered by &vcc5v0_sys as the comment says.
> > >
> > > You can see this on page 9 of the v1.45 ROCK 5B schematics (page
> > > name USB2HUB). The usb hub chip uses VCC5V0_SYS + VCC_3V3_S0 and is
> > > connected to USB20_HOST0_DP, USB20_HOST0_DM. The related USB
> > > controller for that in the upstream DT is &usb_host0_ehci, which
> > > in turn is using &u2phy2_host. Thus at least for the ROCK 5B the
> > > existing DT is correct. Properly describing the downstream port
> > > VBUS regulator would require something like the following series:
> > >
> > > https://lore.kernel.org/all/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de/
> > >
> > Actually, the Radxa Rock 5 B doesn't have an onboard USB hub chip.
>
> Seriously? I provided the exact page for the hub chip in the
> schematics and it's easily visisble in lsusb too.
>
My apologies for the confusion. To clarify, this board lacks a USB hub
chip that matches the
detected USB IDs and is capable of powering both USB 2.0 and USB 3.0 interfaces.

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/microchip%2Cusb2514.yaml

This is the reason we have a separate power regulator for USB 2.0 and
USB 3.0 ports
and Type-C controllers.

There is a USB2HUB -> U90078 FE1.1s_QFN chip (page 27) in the schematics,
It's probably connected to the PCIE M.2 NGFF for Bluetooth

[2] https://www.snapeda.com/parts/FE1.1s-BQFN24B/Terminus-Tech/datasheet/

$ lsusb -tv
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=ehci-platform/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 1a40:0101 Terminus Technology Inc. Hub
        |__ Port 003: Dev 003, If 0, Class=Wireless, Driver=btusb, 12M
            ID 8087:0a2b Intel Corp. Bluetooth wireless interface
        |__ Port 003: Dev 003, If 1, Class=Wireless, Driver=btusb, 12M
            ID 8087:0a2b Intel Corp. Bluetooth wireless interface
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=ohci-platform/1p, 12M
    ID 1d6b:0001 Linux Foundation 1.1 root hub
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-platform/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=ohci-platform/1p, 12M
    ID 1d6b:0001 Linux Foundation 1.1 root hub
/:  Bus 005.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 006.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 007.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 008.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub

> I don't want to waste my time and expect a certain level of quality
> and this is certainly way below it...

Please accept my apologies for the miscommunication.

Could you check the enable status of the USB_HOST_PWREN_H pin in the schematics?

USB_HOST_PWREN_H -> VCC5V0_USB20_HOST0 / VCC5V0_USB20_HOST2
USB_HOST_PWREN_H -> VCC5V0_USB30_HOST0 / VCC5V0_USB30_HOST1

My current patch is trying to address this issue.

>
> -- Sebastian

Thanks
-Anand

