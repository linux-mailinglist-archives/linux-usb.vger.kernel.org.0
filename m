Return-Path: <linux-usb+bounces-15248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED197CD6F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 20:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 315B91C2220B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 18:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050B31B27D;
	Thu, 19 Sep 2024 18:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PaFPmDFX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31BB79D2
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726769032; cv=none; b=N6TrGeVU6h+537N7hlFs8oadotCb7QVQqAq8KxJjJ+PGHX/SbiTrucomjF86NuosFJTQLaYChsocf1DNx+FAiQZhqMuXpHEPipPh+sgoebj8p0OViaKT05KvMBHFEnxqIGVM4Zh59xmaHiTu+EYhKkHWqrB7D4GCy5kF8wQFP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726769032; c=relaxed/simple;
	bh=Q+WUh7HOz489PHwGkH+G04XUdi/ognfyKOKhgp2Paxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FN2WwZnrSMmXX+qcQCXRwnV0G7Sm5W7VFiqhyV2033JnfDFd48QDi7NOcaHmc4fjdKpk+c9PLSpIw6my8aA+oeFGL84HHQxCAW/67JPlm8Ej6witSway5qZZThs075g+P9g4osqVdGtFjee0fPueyop85NAGkMg9ziTbsBrcqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PaFPmDFX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365a9574b6so1928681e87.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726769029; x=1727373829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+WUh7HOz489PHwGkH+G04XUdi/ognfyKOKhgp2Paxo=;
        b=PaFPmDFXSMmblw9xoLAb4Nw4LKHeaOZ3Lb4fu06xFUkxUcyV1oonw99ao3kQg/zR1f
         xUf/v/YcvYcWkbDRVvVBzKLhZ6QkmLXrBaHHG1J/2UJ2zjaVfAF3SX79t1gDm2doBFs1
         k6wquPrcD7Xx9Wra57a2u5FLHL7TmJto2D23Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726769029; x=1727373829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+WUh7HOz489PHwGkH+G04XUdi/ognfyKOKhgp2Paxo=;
        b=JCgEQSdxMiJvHSMif1N35/V8D05QHrzM+vOs6tBB92mm7W34TQzfM40nWHA/TGXc/U
         /8GoyKDSJnEUbeAnQDxhqecAqA+wYttE4Hjju4lnwZVnuJUh0frk/QH3sOi/BDzbPAsf
         JwxjdEcC/BRqqQMcJUL65yx7NiuFL9iBtkTGDQ3ZDl54RzLecZnhM4j6GfVezVSbSr3e
         h1tRdr60uCh3AjzbQqX3lQdGseC7dQ7m82eV0tyrthhGZHi5ki6Oy4EObPk4H/fTNyS3
         FQYJO8CJbPSSM8YIxzewX5WsuN8RBsgzJOCY6LHMNJnnAuO8GF6MEDJRXysk5P6XeyWB
         kMNg==
X-Forwarded-Encrypted: i=1; AJvYcCWKzFO3LcFn1lOujP1oucYgtWUH7adhuU+4r4ktiylKV5bzv6FBZ0ecTqNZDZToSwt4zYooTC9Z9k0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxz3i5lgsRjtXnjNYqS6ZdT80ZAVq5CClD1j0eHAZeYRYZa/WT
	bW8AwRRUyjKpGU/ozbRmggmqozq7pLf7r2kECvj0CF+0KeqLl5/rb9WlU1GXpBpfsJ02/RKTS67
	RUKQvCIkqXPJwKByfK04W+vFDPpPvKfSQi7hV+vnit10wtr/P
X-Google-Smtp-Source: AGHT+IEynQGkNP4WbeFQP6jpDWrH9yOKb6T8S/4juXfQlmxAEKATqQezRqfjbwE27+/f/DlyTlM6/xaGwqhTrbpg+a8=
X-Received: by 2002:a05:6512:3ca6:b0:530:ab68:25c5 with SMTP id
 2adb3069b0e04-536ac2d6aa1mr173978e87.2.1726769028765; Thu, 19 Sep 2024
 11:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-7-ukaszb@chromium.org>
 <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com> <CALwA+Nb6zWe-WOgcu8-ni5OCx9XxerVhi76fZze2KP_kmFVonA@mail.gmail.com>
 <ZuvxAQmMsnIYZMTP@kuha.fi.intel.com>
In-Reply-To: <ZuvxAQmMsnIYZMTP@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Thu, 19 Sep 2024 20:03:37 +0200
Message-ID: <CALwA+NYmKm0sVT=NPfJU7Ena__P5ec451nhViXFhK9BYu87jxg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 11:38=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Sun, Sep 15, 2024 at 12:08:45AM +0200, =C5=81ukasz Bartosik wrote:
> > On Wed, Sep 11, 2024 at 4:09=E2=80=AFPM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Sep 10, 2024 at 10:15:25AM +0000, =C5=81ukasz Bartosik wrote:
> > > > Add netlink to ChromeOS UCSI driver to allow forwarding
> > > > of UCSI messages to userspace for debugging and testing
> > > > purposes.
> > >
> > > Why does this need to be cros_ec specific?
> > >
> >
> > You're right. Netlink does not have to be cros_ec_ucsi specific.
> > Would you like to have netlink in typec_ucsi ?
>
> Does it need to be netlink? We would then have tracepoints, the
> custom debugfs interface, and this netlink interface.
>
> I think this information could be exposed via trancepoints (unless I'm
> missing something).
>

Hi Heikki,

I agree that there is a common area which is covered by both trace
events and netlink.
However netlink also has advantages which IMHO trace events lack. One
of our cases is that
from userspace it is easy to forward the UCSI messages to a Wireshark
with a plugin
which can decode it. Another case is to use UCSI forwarded messages
through netlink
for testing and validation of chromebooks.

How about leaving netlink specific to cros_ec_ucsi driver ? Would you
consent to that ?

Thanks,
Lukasz

> Br,

>
> --
> heikki

