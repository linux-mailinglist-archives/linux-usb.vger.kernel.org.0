Return-Path: <linux-usb+bounces-30960-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD940C892A8
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 11:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6372C3AF484
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5E52FB997;
	Wed, 26 Nov 2025 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QJpKfKht"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE8C2DECA1
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151349; cv=none; b=umU+un7Drn8wFuZOM4GMmvgdPVMlqYjuAsn9BkmfTXN8bYuoa+WrTafA7p5vhRpOWx7mm+iKhXKyHvP40Cuy43BNbnzcfejbFNfSMT5fgE1K+2/OaMOs0rjjC8Zn0Zu5+TlaN0015LCW06mHAKGPrBkMmdCdiDprSQuqQb/vofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151349; c=relaxed/simple;
	bh=5V41g01zJycQSUu80kmdGLw86NoG90p7WYJp8lQrWGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBPJuFb4ux/eBO61QRGh0kFCINMFMvaDBaKUXYq3PHDvXWTpmr04wgBErTl6oDSWvPjXyAr2EfsTuj6Kyoh6TamgUbDV3A+BvHQgN6EOK1VOvhTdibBh/ezsllCRYL5OUgrC/Q2QaWzyO9Ta5Opn7ZMNXtQ0E15jK4U72czLcfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QJpKfKht; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7c6cc366884so1769214a34.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 02:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764151346; x=1764756146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4ROs8/wmV2jOuLQ/GwPBUdwgOMDciU7xtGessL4ugc=;
        b=QJpKfKhtAkyJZ2eFoLIYfAr9SDWGD7LsK/VpHJQ36wv2hHrL29VfE97Xmcqz/uWph/
         hns27/vByt25JgdovQZ3RqskOP+7q6M9Zyyfor3pQVlvoaVETtBbtfSRLF8/TyIlC1jI
         GKcg5rmeYhRJ4SQvsILhmRuLtaJMVi4zYBvxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151346; x=1764756146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d4ROs8/wmV2jOuLQ/GwPBUdwgOMDciU7xtGessL4ugc=;
        b=tkxM+xCqx+fiplD72b9i3KVp+ZA35gfMvuOC/qC/JTMaoxtGWxeFWvtDt4qs73bOjO
         2Z3RzozQ3G0KIEeWnCgGZc532uEI+Qyy4XPAUaZJBFxnR6wH3CIgtgwRatB6hrLXt6ND
         1VWd8RkRWVqyK5bOPyYm2pv5f7uTPlpmBXv+pQc2U68nXtoJQftRA2yemkyeC/ecvfJc
         2U9k1JRL2yRnqrZQKqL/uqeWzg5PmzkEpdpB3PBXAXw03RoOa+5kYCpXp7Vi56J3/bDh
         Op/CQRvx0sBEcD9FVWZa8dW4UpTh3iDcPe3CBkVUi1/Xvwa3DTxSRRsmZZ0twvluNuZL
         3DsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8tBkUXsOQUQPCA/Mt5NGWJgoUe9HkBj5Z+YYKQexVwt5s0Fx8xTZYtdEz7RlR5tkzFwKBmIIIZHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/3wYQIVna06P0iUOYUxSez3Es2bkKEUwcwWONjFaka6c9ayk
	q5MNSlJ7dgKz8O8r4ddCIr40xwk1zKlRKCyomXfvjKwR722JEFBScDuMgkbiRW7ix4skk5ZWXkN
	3qJwB+hf8HNXL+jVlG1/2jrvc1/YZXuGdtY5lRVSWlT56jvE5KpFfaA==
X-Gm-Gg: ASbGncssGrtzkDEY6Z1vGaoe0/kOZCBXoAce5CTNpbV32DnWKAG9u7Zez12L3t60GK4
	woMZ9cy15lypjyVVBmpDICh30uo+AuBV/RK23BmvvAq/XKUsbhYpKnVa6PWQlEWAR30DW1a9Mc/
	DguUYZBGbtzeDeGVS9KWRY7PJqaEBFZXiLo/L2DGeQPLh8mnS2avknNvO3nvXTa89BuouRJ6vhk
	PijXALJ5IbclXS42PmHz8u7CCJkCO4ZQ3rnA4yd89HWw/Z/PlbJj7gP+yhjbRrCjYLczOyelIl9
	41/8aUoVyHPxaVvLx6QKjjjF4g==
X-Google-Smtp-Source: AGHT+IEePn5+jGP5S/jsTe1q0SLWDo5zx8EQebIoOGPFTa1NriS6IIgRkTj8lfXPp+SmJ9cJSx+I+AoEsH91y0IpyC8=
X-Received: by 2002:a05:6830:440c:b0:79f:19f:7f2 with SMTP id
 46e09a7af769-7c798e1b962mr8301723a34.0.1764151346466; Wed, 26 Nov 2025
 02:02:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122112539.4130712-1-jerry.xzq@gmail.com> <CAD48c-UjbPK4GewGpVVdEY30fhnhdAGQqrXQ3r0RgHc6suMo7Q@mail.gmail.com>
 <2025112237-brush-unseemly-7a95@gregkh> <CAEXTbpeKUMJKz-PV-ft5WCg5TYo22knBaMX2WwCWn=ix4OgX+g@mail.gmail.com>
 <2025112426-seventeen-duvet-d9c4@gregkh> <CAEXTbpeN0Mk+Y-UeV79JzE547UCa_Fhh7T75L+2mhoSq3ark8g@mail.gmail.com>
 <2025112548-angling-labored-b841@gregkh>
In-Reply-To: <2025112548-angling-labored-b841@gregkh>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 26 Nov 2025 18:02:15 +0800
X-Gm-Features: AWmQ_bnFECu83Fak1Fcl8zXFln_EpQqKOaQj-aUqgjUWDwX07mH4ZY3ZlfhkuD8
Message-ID: <CAEXTbpcdS-Bc8T82Osay1EWjTRxj4-mk66CByzcW3Sgiro1AWA@mail.gmail.com>
Subject: Re: [PATCH] USB: of: filter disabled device node
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jerry xzq <jerry.xzq@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, Nov 25, 2025 at 7:53=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Nov 25, 2025 at 05:44:04PM +0800, Pin-yen Lin wrote:
> > > > In our use case, the USB hub and the USB devices (e.g., modem card,
> > > > USB camera) are fixed on the board, and describing them allows us t=
o:
> > > > (1) Describe the extra resources for the USB devices, like the usag=
es
> > > > in drivers/misc/onboard_usb_dev.c. They are mostly USB hubs that
> > > > require extra power or reset pin, but there are also USB device
> > > > usages.
> > >
> > > The USB devices should NOT be in DT at all, only for hub controls tha=
t
> > > you need the extra pin controls please.
> >
> > I assumed we should describe USB devices because [1] introduced
> > bindings for downstream USB ports for on-board hubs. Or should we only
> > describe USB connectors but not USB devices?
>
> Describe the USB connectors please, not USB devices.  USB devices
> already properly describe themselves.

Okay. But in our case, we can reproduce the crash even if we only
describe the on-board USB hub and the USB connectors and set the
status as "disabled".
>
> > > > This is the usage from a downstream DTS that hasn't been upstreamed=
.
> > >
> > > There's nothing we can do about that.  Please work to get it upstream=
.
> > >
> > > > The USB hub and devices are defined in a DTSI file, and another DTS
> > > > inherits it but wants to disable those USB devices. We expected tha=
t
> > > > disabling them should be the same as removing them.
> > >
> > > No, just disable them from userspace properly.
> >
> > I mean, it is disabled because of some DTS inheritance, and I believe
> > we usually disable the nodes instead of removing them. How do we
> > disable them from userspace in this case?
>
> You can disable USB devices in userspace through sysfs.

I think you misunderstood our use case. We have device A that has an
on-board USB hub, so we describe it in the DTS. Then, another device B
is similar to device A but does not have the USB hub. So, we inherit
device A's DTS and disable the hub nodes, and we observed a NULL
pointer dereference after boot.
>
> > > > We haven't had a driver for the LTE card on the linux mainline.
> > >
> > > Why is it not merged upstream?  That should be a very simple thing to
> > > get accepted.
> >
> > We would love to, but those work was deprioritized internally.
>
> As you know, we can't do anything about external drivers, so there's
> nothing we can do.  Please revisit that decision, it's one that is
> already costing you time and money :(
>
> > > > But,
> > > > it is using M.2 USB interface and requires reset and enable pins, s=
o I
> > > > believe we want to describe it as a USB device in DT, and implement
> > > > the resource control in onboard_usb_dev.c.
> > >
> > > No, that is not how USB devices work, they should control themselves.
> >
> > I see "RTL8188ETV 2.4GHz WiFi" is included in the onboard_usb_hub.c
> > driver, and it also seems to be a USB device that requires extra
> > resources. Shouldn't we describe them describe them in DT and include
> > it in onboard_usb_dev.c if there are hardwares designed like this?
>
> The driver for the USB device itself should handle this, but really, DT
> should never be used for this as that goes against what USB is supposed
> to be (i.e. your devices are not passing the USB standard by relying on
> external DT information.)

Maybe those devices violated the USB standard, but we do see WWAN
cards that use M.2 socket 2 and work on USB with additional reset
pins.

Though this is off-topic because we can reproduce even without
describing the WWAN card in our devicetree.
>
> thanks,
>
> greg k-h

Regards,
Pin-yen

