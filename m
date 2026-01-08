Return-Path: <linux-usb+bounces-32030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E72D01529
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 07:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7AFF3083C58
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 06:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74F832A3CC;
	Thu,  8 Jan 2026 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBBizf9K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0C325714
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 06:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767855286; cv=none; b=g7FViioasCMgg/Zwl7R4++zzTjrkR9jDtDBVEh4eZ6fZT+7i4yxDv2ACX3Bb/GtPzYYRElsDoMVjQvizSnMdMMUmZf2B84o3tz6gUAVN/ddyTRq9ONG7u5CUHRMd3DwKzn0mJ5o8krETMoFfUs2xlWnB6eIMDkqaj95kSY1690I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767855286; c=relaxed/simple;
	bh=I0IAqekf4TGghfW5e2aKU55t9EkUQdopLZdt0j/GIUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qocKJd86YrFiA+AbDbhN42L9an6nrg3t0lgzzyCAMu3E/GWJCPTgRTWZacnt7jjPrVWHpHwGZLHdRYSIzgBAr4BkuaUldMF9s1aRh9dElpJHH5WS4Eg+K4XHqC1aGzCHUIPS7Q3GzWhW1Qr90bSuMRditjQ9W01fneTahmgHds0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBBizf9K; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79af62d36bso498602366b.3
        for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 22:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855281; x=1768460081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t4F2SB9f5d/mNn04/BKllqtDvhQr4G3ijObEiEkrROg=;
        b=NBBizf9K1w9x3Ir/L0X7eWSv96wQpiPD1dkZLWGfMHx+j1mXiUlz3mS7sZAGv8nIfL
         yTOYBSUP51vsqVwuuC2DtpVIe4Cz+kUsdQZrhrAcXlI3xHsf/7I4HOqU9KJs+tnSqQWC
         ofbxf6QAVcVrGm3BNJlXHZOjf1ez1EVhOzru6IrfWhRtb907hv2jJSH4mmEZdGK5IuIU
         gVnPn/XvP8sVgwb1bfX1mcX2+2qmUa9PuF+XwewHysyyd+YEIZnfIRoTfYlPpeFXqXDu
         lBqK/ULi8j2rAHnKZ1/g+vq3a+r+0C1awltQZjkBLFQwucfeOEa6aUktQa7g7U0J0Hgq
         aa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855281; x=1768460081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4F2SB9f5d/mNn04/BKllqtDvhQr4G3ijObEiEkrROg=;
        b=iq8L/FnRbIWRkSsuq2J7a7Gwuq9t8UP86aE/9M+OmFsm7exQDWvJsZ56sTnsWhyZi9
         nt/QQV8lHK0B6FDCpKTcU3aX72amjqySjrRUnnzL44jIapadd6ape5aSFkUKhVk0nQqg
         PYKZBvv5A8UJzgubH6sxEZmLhIZWeabhs9favyDtuhtJ8ZXOpa0SKR4cxdsQ6g0H1ZhL
         xFK6PTfiygSqqWXZhplp14Td786FA0r2KyX7J6KdEub72eXdj5ejpfjqoUx/CXK5OeFb
         WLAWlpC4OInjWTGStmN8Az4CCPXkHvQxExTQOSaGywZQNDxbvRBGR+rDPjRiGfEpNaNC
         3vdA==
X-Forwarded-Encrypted: i=1; AJvYcCXYiok9U6XTSQjUyp176F8/0yLzYiGSOW7EA6VRdJQUz9IBsRHwFUBl7MeqcvM5Xz7nGSYVa/r6HbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJ4d5OLLJBDXROkWOgIeCRwMnoPcdELVk1/FjFJUR5J+bql+9
	cSlBWHvzKaAlRgABgWj/FpnWKzh3gQlnSZS+HAXUyu6W8JGp/ONE12FzCN1JPAppddyv98nuRbY
	PYFtZpQxnMleNAA0Q1M25PUG8QCiSgkc=
X-Gm-Gg: AY/fxX7dycyY/Q0w1s365Lh/8fousfhKin08L/auVY9psNKVFbbqS2LBHYk4sDy897K
	Zs07rYJEOpUsC+3YAIRifp2OY7X5/PucOfJP8WMzYXZdfWQRmkUXL0bqd15rPJuT0kjTLxmZvF5
	lEIEajjwZh0epD2GJ8RkvMGPWaq2k7cSU1hsWAwOpW2WNl+vSzo7N/lcy3QMJ9S7aRdegwn291a
	NFh6KUvDbihyt9VCeiqkGBASMmiD8yfXuY/ZNBb8oukM6QhjKV6Jq3TW1sXKdUx4IQ=
X-Google-Smtp-Source: AGHT+IGASGpRE5geGPMFFoH+KZfseqKENFRmeBW4XZyTHbSYGX+MpMWOD4bcwRl1hOH7/QKo+S7o0hqO3wHruKhhRKs=
X-Received: by 2002:a17:907:1c82:b0:b83:95ca:589b with SMTP id
 a640c23a62f3a-b8444c4007dmr536411766b.10.1767855281293; Wed, 07 Jan 2026
 22:54:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <aVkinPvh_jxdh9wm@venus>
In-Reply-To: <aVkinPvh_jxdh9wm@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:24:23 +0530
X-Gm-Features: AQt7F2pq5ftUc3DeChtgdMDzbUbVtPyMHskj6HVuSaMN15yeS4QpeYTTmedIXIo
Message-ID: <CANAwSgS=u3CG_5R21SZ=euEQuqQ=edxZmFp5LhzZN5Lk5ozqXA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Typc fusb302 powerloss issue on Radxa Rock 5b
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian,

Thanks for sharing the details.

On Sat, 3 Jan 2026 at 19:54, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hello Anand,
>
> On Sat, Jan 03, 2026 at 02:01:16PM +0530, Anand Moon wrote:
> > On the Radxa Rock 5B, the system occasionally experiences intermittent
> > hard resets during the boot process. Initially, I suspected a power supply
> > issue, but further investigation points to the Type-C fusb302 module as
> > the cause.
> >
> > Specifically, probing or reloading the fusb302 module triggers a hard reset,
> > which can result in immediate power loss and a reboot.
> >
> > [root@rockpi-5b ~]# rmmod fusb302
> > [root@rockpi-5b ~]# lsmod | grep  fusb302
> > [root@rockpi-5b ~]# modprobe fusb302
> > [root@rockpi-5b ~]# [ 3389.031608][ T7143] typec_fusb302 4-0022: Initiating hard-reset, which might result in machine power-loss.
> > [ 3390.030444][ T7143] typec_fusb302 4-0022: Initiating hard-reset, which might result in machine power-loss.
>
> If you see this message the TypeC port manager (TCPM) state machine
> reached the hard reset error state. A USB-PD hard reset involves
> removing VBUS for a short time, which effectively removes the board
> power on ROCK 5B. Unfortunately the situation is quite complex :)
>
I completely understand this issue,
> > I attempted to trace the issue using ftrace but was unable to
> > pinpoint the root cause. The problem appears to originate either
> > from the I2C controller or the PMIC reset.
>
> I2C and PMIC are not at fault. This is all about USB-PD
> communication itself.
>
> > I have identified a potential workaround involving the I2C SCL debounce settings
> > for the RK3588 and submitted a patch here:
> >
> > [1] https://lore.kernel.org/all/20260103052506.6743-1-linux.amoon@gmail.com/
>
> This is most likely a red herring and just slightly changing timings
> in the USB PD communication.
Yes, but it's related I2C protocol.
>
> > Please note that the submitted changes address a minor aspect but do not fully
> > resolve the underlying issue.
>
> I don't expect any fix from this series regarding your problem. Also
> I suggest having a look at my talk at the Linux Plumbers Conference
> from last month where I discussed this issue :)
>
> slides: https://lpc.events/event/19/contributions/2156/attachments/1784/3861/improving-stability-for-TCPM-using-boards-that-are-not-self-powered.pdf
> video: https://www.youtube.com/watch?v=DmLsePJoH8I
>
It's a great talk. I understood the issue much better

I have understood the previous discussion regarding the reset failure.
In this specific case, the Type-C power is controlled by the USB 3.0 and USB 2.0
host controller power domains, I feel so.

> Something that might be sensible to do on your end is figure out
> *how* the state machine ended up in the error state and check if
> we can avoid it. The related code for that lives in
> drivers/usb/typec/tcpm/tcpm.c and quite complex. I use the
> following two patches to ease debugging:
>
>  * https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/6edc68e3c0ec4c209b5e96b848e17201059ce9ee
>  * https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/8ca8b1d6ee36e80f794bcf351a8b78d5a96daf06
>
> Combined with CONFIG_DYNAMIC_DEBUG=y and booting with the following
> kernel arguments: loglevel=8 tcpm.dyndbg="+p" fusb302.dyndbg="+p"
>
Yep, I have enabled this, but I could not find many details

> Greetings,
>
> -- Sebastian
>
Thanks
-Anand

