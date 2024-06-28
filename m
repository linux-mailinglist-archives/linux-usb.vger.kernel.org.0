Return-Path: <linux-usb+bounces-11788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F286891C5A4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 20:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B490E286C17
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 18:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B661CD5CB;
	Fri, 28 Jun 2024 18:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLJOhzng"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F99E1CCCD7
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599137; cv=none; b=kaHzPIt5RZ4/hEYX3RuPTYpz+3hdB73POnrOxHisK5b2jT0HCQo6FpAS/gGhAiemq+aFc42rcNmrOKXQBTi9Rduq04oo7/pPNBhRyeIOTyObAig+JeWqdK+AlBvO3419ektlBBgKr8iTYa0+MF+1rN7MuM4mWwd/mOgZPFV19ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599137; c=relaxed/simple;
	bh=7eWQ7iLPN2uHDUNcVRLS/FtIdvsr/KMKOK6NzYtv7P8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6giSCFclrEvQtNP1I+WrSUcEuRqgJJ4kLm0Jo7fu2LBJqB4E1rEO1h+HOpn1Uv1sUtkXt8KQKv3zc6mEbZfpExDum2l0G3mdUTzGPniQ2eM2Ub0hEuI5edVmCvgz0X95XyLaj4/dvt0ggzAkIA+ZfxA6U+9gZXgX3+oxmIY4q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLJOhzng; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42562fde108so7481845e9.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719599134; x=1720203934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4o9Dc89fD0nIBNxl65yzzVkxTjpW3A0rm532mcEAFo=;
        b=WLJOhzngKshuwgw8XLGkNwIsJVUIDMxEVK+3Htv1X+Dv1hvgoZmAM+yP8bw2sCUQhr
         mnvLtOlXTjRA5glFdHZPWizPkE8PZ2uFQH6rF+724nm2RIOpMssb5eDUe03u41he4Kk/
         q2Ssw6BuLeDQ0a9e80FKIWeCqca57zt+T5l7oiOP2/voquHhAlN61qNZ//NB6wGKgx3W
         BpLiikxtinpFSZAwYFcCNGmUXLK3GRVJnzl0RuvIVagdsbbcdmiuOQfrK7eeXZs5Lkwy
         aBLb6U3ddQ2tbaIcN6kry/62xvTtIApeRPER5858TAPKC3IRp1zcA+Z0D+p3DlSS2Q9S
         UgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719599134; x=1720203934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4o9Dc89fD0nIBNxl65yzzVkxTjpW3A0rm532mcEAFo=;
        b=aQ0qcvCbmKZvUzC2qj5qk0owWIvhNn+jFw+3ElC48HSEUY0V5NFP06dNivEXNNJhDv
         VIbN80B8FAp1hIjyyQ7dGFBuqtsFlNV6+yswoa9EV2IoLxToGx6wWN7BQbp16C3R/ts5
         6G+KSfH4w8AXBucXQ1FlIVD7IFcVI8hRK8qVVqC64rGAPn6rKKMExMstoWsZIn2sz/7G
         483FrS6i/ME8HEt4uFnpYnd5vsVzk8mK+JkkrSJnCwId6/FWoM8iRlikytu6Pght4OPD
         aRX+gyCIrI293pCE/HwwuauePNaHsgaOOnxAOPKrSmlWuaGL96sM08J35e4QzRB5XmAq
         vd8Q==
X-Gm-Message-State: AOJu0YzqG6DcuwWEGyibaCGc4htEvpy37Os6fxLU5NNr6R1w7L+/a++P
	vrHVmWU+8m9fRCVA6abxGlkRzmXkzWasjASmCfq2sjr2bMC2t+3jAiO0fE6C2D4t6SD9DTbTmIH
	O87IqIwcN/rwqy3Vjm7qwaeHCoNY=
X-Google-Smtp-Source: AGHT+IG2tDqp//tisofcY15Wg8lSVYf/hQuHkfYGdgfkZxkPYJ/fSmkZdwLw3IQM9pwR0hbtNGB9CTh5FVT9bTSi7t0=
X-Received: by 2002:a05:6000:184d:b0:366:ebc4:2574 with SMTP id
 ffacd0b85a97d-366ebc425fdmr12874100f8f.33.1719599133812; Fri, 28 Jun 2024
 11:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com> <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
In-Reply-To: <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 28 Jun 2024 20:25:22 +0200
Message-ID: <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
Subject: Re: Remote wake up in gadget drivers
To: Alan Stern <stern@rowland.harvard.edu>, Darrion Ramos <darrionramos@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 6:27=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> > I assume that to take advantage of remote wake up, the device needs to
> > first of all set the USB_DEVICE_REMOTE_WAKEUP bit in bmAttributes.
>
> That bit gets set when the host tells the gadget to enable remote
> wakeup.  And generally the UDC driver handles this, not the gadget
> driver.

Right, sorry, I meant the USB_CONFIG_ATT_WAKEUP bit.

> > But then, is the wake up supposed to be initiated through the gadget
> > driver or through the UDC sysfs files as the ones that Darrion
> > mentioned?
>
> The wakeup request is initiated by the gadget driver calling
> usb_gadget_wakeup().
>
> > For the former case, I assume that adding a new ioctl to Raw Gadget
> > that calls usb_gadget_wakeup() would be a way to support this?
>
> Yes.
>
> > AFAICS, only the g_zero gadget driver calls usb_gadget_wakeup(). Do
> > the other gadget drivers just have no support for remote wake up?
>
> Grep shows that function/u_ether.c also calls usb_gadget_wakeup().  I
> don't know about most of the gadget drivers.  The f_mass_storage driver
> has no need for remote wakeup, for example, and the same is probably
> true for a lot of the others.  You'd think that the f_hid function would
> support remote wakeup, but maybe nobody ever implemented it.

Understood, thank you!

Darrion, you can try adding a new Raw Gadget ioctl that calls
usb_gadget_wakeup() and see if that works for you. This shouldn't be
hard: just add another handler to raw_ioctl().

And you probably also still need to set the USB_CONFIG_ATT_WAKEUP bit
in the USB config descriptor in the Raw Gadget keyboard example.

For a proper remote wake up support, I think we would also need
another two ioctls: one for checking whether the UDC supports remote
wake up and one for checking whether the device is suspended (the
former can be combined with reporting other UDC capabilities:
https://github.com/xairy/raw-gadget/issues/41).

