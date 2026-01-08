Return-Path: <linux-usb+bounces-32034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBCD0154E
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 08:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD18C309F700
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 06:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627F733D4F9;
	Thu,  8 Jan 2026 06:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmnRPP05"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1DF33B6FD
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 06:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767855510; cv=none; b=fHhcOa42+mnRXu5atOJTNFHAdwj8SlV8roZbqOYWgn9q6iBK61bijFBWZmqOGlIK6k1QHKxYPu8BrckAKUA3lqJg/dkJXDGA8q6j/huT9RjgMJ5wb+pB1Wu/RfxCwYmFACurzooOJGf57EHqnqsskYK9HY4RvICkqGTkBM1hwVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767855510; c=relaxed/simple;
	bh=p3DKIzmoteI4oHMcW4nueSz11+AijwSraXIR01Sv/Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WG/lDyS8+8GR7EIRA1RwltF2z1g0XBDql7aIiTfd/UowsOqgQlonh7NKTbTPhE6objVfJ0Pp1NFNKalqseGDo5eJMJQgQGB9uRcRnf7Zd2+I/cpi2fomnBImrC905slyu94iZ3Ju1dmQZQy3RpsrFUOrtmayhuImmyq46ATa7PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmnRPP05; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b72b495aa81so546787766b.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 22:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855507; x=1768460307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYeFfJDOtbvDKy6cB1/fU/DI+WOGrumUUZyn+Dpeblk=;
        b=BmnRPP05c8SK3HeLTNwvk0GOMZ6jOCxdGDXTsawbh1yDgpZDh7Qv4H25GWq/lXuEHH
         MyyJULIn57Suv/hs0PoBURXxjAVl23tyJmoVEx3NsYs9n83g42/WD3APapdI8uuTRJ7N
         uiJPygPyvrU2XsxS4t6HIpTLe779tE58d2aUezy4cNnWtqbUH6D2oL1QkGMBIg8JasNh
         Sk9kMVAY9o37Hw0MHmgUufUglBCA32Q0ZOLNZatN/ym/IeYqx0AmIiQWxVOedVDTtdhy
         3S8F8+4kBn6/1gq32+y/9tQ5O1hDg+twSQ/fxuuvx6BTX/YOfRJuYtaJRoyk5HsKL6N2
         kNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855507; x=1768460307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYeFfJDOtbvDKy6cB1/fU/DI+WOGrumUUZyn+Dpeblk=;
        b=W6ig7DAvTyeuTCQD7CM0XPa4HbreS4ZHzAuvOfvTWiQICsdHGt1c/ImndIfkI6uHc2
         joKbzXptCg64vcGIyx9Sr/vxt3hpGlr+12+MLhwUxZHxTmZvNvjV5AoYibpRsXOuogZY
         bNFglzIg0zmDZKkJJ4fKH+dcG89VzFdjV4RhMxryxvdAKINStp/terYwZ4XvGNXzwDuW
         e/Z05ghqbG9yc5jvGRQy6fewxMtkxNz8JsAJpHDdpT0xSgfjCQVvEn9BBIoEKHNzcN5h
         JkNPxF/aAZnKZNIbhz5AzNUYERGW5SnZ9kXwtJEjVH/AxdLsMoQTsahjVDaZ9ENxsgpT
         4MfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEfWo2VhMNwMtWAGptzUAANiru3R7TO9r40S59KMEVGcAbMWuXrDffhfOA3l8m2/TmytRd2JUymd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+mjCOrXxZywiXP46GNLVdFgknwU4AQBBrzkAYdjyaM5iOd6c
	pAI2qCpSuZXDKjlJPY+vbT2KixplO16/5JaM7Rn21s/Jen35KXVaWhEPgY0Bo/KKxW2Fm39e6HM
	gi5IsKca+az/t4BJWqPzJr+zhv7hlU8o=
X-Gm-Gg: AY/fxX7rs8EmgNYYNjZpmR2f81P5WbyNxmtqDspEiyMnZNmazCCnPNJKvYhNt0Gy4/u
	cdpM/eaqMO/pobdzaDylrI8nNwUEr9xpvKd0sx+ShUEcSyTyiCZp0+6meiR0f5BpwmvrJVj7k7q
	YYb5bYtUEhCjMyUtRKkb6WJI7LovwIEAmlRFX/dzpG4PP/Hj8fxuQlPbGLGm+pUEEoaNCmtWuX9
	RdM1nEGxn29J4Xs13/yqfA8F6oqQ7h6NMHXSgjSmTXnZQYLQ+FmWvg1/sy+718ztbdNF/Rl8M8V
	pg==
X-Google-Smtp-Source: AGHT+IGIv8je1lwIFxUAxVKr8gjmi2iZWFwhU08dBg/NL+MZXVQZ+Lx4oYIn2q3AFG6kac8NGhSiSqj5lIo7m6W/X7g=
X-Received: by 2002:a17:907:3c91:b0:b77:2269:8de6 with SMTP id
 a640c23a62f3a-b84452334a8mr466404066b.19.1767855507070; Wed, 07 Jan 2026
 22:58:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-4-linux.amoon@gmail.com>
 <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org> <CACpCAL0GLMV-2p1tKAXe6R+N2c4YadH9vpEG3GdPoHTNTQSuow@mail.gmail.com>
 <080d9ed6-18f9-437e-89d4-aba8f69120fb@kernel.org>
In-Reply-To: <080d9ed6-18f9-437e-89d4-aba8f69120fb@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:28:09 +0530
X-Gm-Features: AQt7F2rN9qCMZO0iKuorur3QruVtd3JYaKO-CAyPTZyFV9EDijrAUUQ7GfBMQ5U
Message-ID: <CANAwSgRqpAopSGcZ=isLxALFcuPW0E4DBZzMhQvwRBhHMK0thg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt handler
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?B?5byg5rC45rOi?= <giraffesnn123@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, 7 Jan 2026 at 16:22, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 7-Jan-26 10:52, =E5=BC=A0=E6=B0=B8=E6=B3=A2 wrote:
> >> Still ideally we would solve this in another way then
> >> switching to a threaded IRQ handler.
> >>
> >> As the commit message of the mei-vsc fix mentions
> >> the root cause of these errors is typically an interrupt
> >> chip driver which uses IRQF_NO_THREAD disabling the auto
> >> threading of all interrupt handlers in RT mode.
> >>
> >> So the first question here would be to see if that flag is
> >> used in the interrupt chip and if yes, is that flag really
> >> necessary ?
> > This is very similar to the issue addressed in commit 24b176d8827d
> > ("drm/msm/dsi: Remove spurious IRQF_ONESHOT flag").
> > The IRQF_ONESHOT flag is preventing forced threading here.
> >
> > In irq_setup_forced_threading(), the conversion to threaded interrupts
> > is explicitly skipped if any of the IRQF_NO_THREAD, IRQF_PERCPU,
> > or IRQF_ONESHOT flags are present. In this case, IRQF_ONESHOT
> > appears to be the reason.
>
> Ah, well the code effectively does its own IRQF_ONESHOT handling,
> since it needs to do its own threaded-irq like handling for
> suspend/resume reasons. It disables the IRQ when it fires and
> then only re-enables it once the work has done processing the IRQ.
>
> So it should be perfectly safe to drop the IRQF_ONESHOT flag.
>
Yes, the warning disappears
> If that also works to resolve the lockdep issue that would be
> the preferred way of fixing this IMHO.
>
After applying these changes, the device initially triggered a hard reset;
And the board reboots. I need to find another way to fix this warning.

However, after several reboots, it returned to a normal boot sequence.

[   40.404525][ T5974] rockchip-dw-pcie a41000000.pcie: LTSSM_STATUS: 0x130=
011
[   40.404936][ T4957] r8169 0004:41:00.0: enabling Mem-Wr-Inval
[   40.406591][   T56] dwmmc_rockchip fe2d0000.mmc: IDMAC supports
32-bit address mode.
[   40.407370][   T56] dwmmc_rockchip fe2d0000.mmc: Using internal DMA
controller.
[   40.408013][   T56] dwmmc_rockchip fe2d0000.mmc: Version ID is 270a
[   40.408610][   T56] dwmmc_rockchip fe2d0000.mmc: DW MMC controller
at irq 104,32 bit host data width,256 deep fifo
[   40.413373][   T56] mmc_host mmc2: card is non-removable.
[   40.431072][   T56] mmc_host mmc2: Bus speed (slot 0) =3D 400000Hz
(slot req 400000Hz, actual 400000HZ div =3D 0)
[   40.468235][   T67] mmc_host mmc2: Bus speed (slot 0) =3D 300000Hz
(slot req 300000Hz, actual 300000HZ div =3D 0)
[   40.492229][ T4957] r8169 0004:41:00.0 eth0: RTL8125B,
00:e0:4c:68:00:35, XID 641, IRQ 153
[   40.492993][ T4957] r8169 0004:41:00.0 eth0: jumbo features
[frames: 16362 bytes, tx checksumming: ko]
[   40.493873][ T4957] r8169 0004:41:00.0: vgaarb: pci_notify
[   40.507133][ T5974] rockchip-dw-pcie a41000000.pcie: Received Link
up event. Starting enumeration!
[   40.508219][ T5974] pci_bus 0004:40: scanning bus
[   40.517387][ T5974] pcieport 0004:40:00.0: scanning [bus 41-41]
behind bridge, pass 0
[   40.517867][   T67] mmc_host mmc2: Bus speed (slot 0) =3D 200000Hz
(slot req 200000Hz, actual 200000HZ div =3D 0)
[   40.518336][ T5974] pci_bus 0004:41: scanning bus
[   40.519531][ T5974] pci_bus 0004:41: bus scan returning with max=3D41
[   40.520294][ T5974] pcieport 0004:40:00.0: scanning [bus 41-41]
behind bridge, pass 1
[   40.521273][ T5974] pci_bus 0004:40: bus scan returning with max=3D41
DDR ff1a08bde6 typ 25/03/13-15:39:39,fwver: v1.19
ch0 ttot10
ch1 ttot10
ch2 ttot10
ch3 ttot10
ch0 ttot16
LPDDR4X, 2112MHz
channel[0] BW=3D16 Col=3D10 Bk=3D8 CS0 Row=3D16 CS1 Row=3D16 CS=3D2 Die BW=
=3D16 Size=3D2048MB
ch1 ttot16
channel[1] BW=3D16 Col=3D10 Bk=3D8 CS0 Row=3D16 CS1 Row=3D16 CS=3D2 Die BW=
=3D16 Size=3D2048MB
ch2 ttot16
channel[2] BW=3D16 Col=3D10 Bk=3D8 CS0 Row=3D16 CS1 Row=3D16 CS=3D2 Die BW=
=3D16 Size=3D2048MB
ch3 ttot16
channel[3] BW=3D16 Col=3D10 Bk=3D8 CS0 Row=3D16 CS1 Row=3D16 CS=3D2 Die BW=
=3D16 Size=3D2048MB
Manufacturer ID:0x6
> Regards,
>
> Hans
>

Thanks
-Anand

