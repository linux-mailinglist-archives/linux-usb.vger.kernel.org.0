Return-Path: <linux-usb+bounces-2891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6C27EBD5A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 08:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF99CB20BEF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 07:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FA13D9F;
	Wed, 15 Nov 2023 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWFchHxO"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2F52E84B
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 07:08:17 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F09F3
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 23:08:14 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so9998a12.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 23:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700032092; x=1700636892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjgDYCiVZoQHvB83kALIeM9OtG/SOdaCJiN+nH0BdL0=;
        b=PWFchHxOLnIDxyxQOW7xkwrUL4GrQYkU7STtHNvjjtK24qbbpOBVd6RqWcdQeOXWmk
         b/XrC2McPwJpyuC2lH0eDdK/NSd2Tx5lpY51GgWlNwZDIevaZADJp7saj2I3noNTkE/N
         bEczc7939AoxqKnpzqTF4wyrVrBX8z5OJ8wQZMYzc/ZyV75tX1WIdZ0f1URKw3v4XyF1
         73MZaarDAWBW2PWioeAB7lWGNSxB0r6d2rWvJKZZRBe/RbWk0h6RBbKPEv35qFPTccoR
         RM4HhthEvGjHhwnebUjwuSAuoOGAJNqOkRkaKkOK5HV7IZdlLtfuAoGg/dLexRdgIWMP
         11iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032092; x=1700636892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjgDYCiVZoQHvB83kALIeM9OtG/SOdaCJiN+nH0BdL0=;
        b=j3dQ2Bd5nyyPuBJjqv4AZj97UihtFqhmV5toKfGtE5803moUgCF3pvH9ZE/iOCAZ8m
         l6PBWyO09h57lvpmSgkDQSOofUmXO5tU/oaJirVaKsiFFEXSX0HYIzxPLRTJ0pe20V1O
         d0GQZxJEcW+7Kz8MEXQRTCNVF97AV6nm0LEogTXunUCCCj5aponE8/KKNkbQG4wXO3QW
         9jgBuAqnGMOGjMIy0A1TpBlzdA5zbTqETvBjxooJrPLnvbfR0GADt0V6MaGrRpT4RbkC
         GqhR+7SAIukSHiZMa0KNeuJbie2ji3aNRj0Lf3Uj0V/VlsgpuS7lBFxlwbxg0pPCX2eW
         L7PA==
X-Gm-Message-State: AOJu0YzzP34BhH0M5lwgmT0YNNGZFAk4FX6l2icTOpcmfsrnGHqiqk8G
	vJOCuPUavVVcxj1JaP1ZIeDcb0IZG/a11Y728NaM1QJIoNoc2TzLgaGXoGG2
X-Google-Smtp-Source: AGHT+IEe/GNSXejvYayQJoBdKOorcpj9IYPMyfVBFxUm3h3zM4PXIN9nobRvzoCrHFQpIYokeDhIZ64IC16bT6CHdfw=
X-Received: by 2002:a05:6402:1948:b0:546:d479:9c90 with SMTP id
 f8-20020a056402194800b00546d4799c90mr69953edz.5.1700032092427; Tue, 14 Nov
 2023 23:08:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031093921.755204-1-guanyulin@google.com> <f75d6cd2-fa9f-4820-969f-2a8839d78c9e@rowland.harvard.edu>
 <CAOuDEK0NcijUKAL3fGtO=Ks+Y38TRhJcVx+ff-QUyUA0LcQ1Bw@mail.gmail.com> <3fe5414a-570f-4bfa-aa2f-909d7799551b@rowland.harvard.edu>
In-Reply-To: <3fe5414a-570f-4bfa-aa2f-909d7799551b@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 15 Nov 2023 15:08:01 +0800
Message-ID: <CAOuDEK3UuVGgP63NG9HtuJ0D2ERZsFGBwF5+GNynk=P7zSVUhg@mail.gmail.com>
Subject: Re: [PATCH] rpm: pm: enable PM_RPM_EXCEPTION config flag
To: Alan Stern <stern@rowland.harvard.edu>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org, len.brown@intel.com, 
	pavel@ucw.cz, heikki.krogerus@linux.intel.com, mkl@pengutronix.de, 
	hadess@hadess.net, mailhol.vincent@wanadoo.fr, ivan.orlov0322@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, pumahsu@google.com, raychi@google.com, 
	albertccwang@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2023 at 11:56=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Wed, Nov 08, 2023 at 04:45:43PM +0800, Guan-Yu Lin wrote:
> > Thanks for the questions. Let me first introduce my motivation for
> > proposing this feature. We can discuss the implementation details later=
.
> >
> > Motivation:
> > Currently, system PM operations always override runtime PM operations.
> > As runtime PM reflects the power status of devices, there is a
> > possibility that runtime PM states that a device is in use, but system
> > PM decides to suspend it. Up to now, we have assumed that a device can'=
t
> > function without resources from the system, so the device should acquir=
e
> > a wakelock to prevent this from happening. However, what if the device
>
> [From the fact that you mention wakelocks, I assume that you're trying
> to implement something for Android systems rather than Linux systems
> in general.]
>
> > does not need the system's support to function? Or only needs limited
> > resources (e.g., only limited power source or clock) to function? In th=
is
> > situation, we would like to keep the device on but allow the system to
> > suspend. This is an example where we would like devices to follow runti=
me
> > PM rather than system PM.
>
> To put it more simply, you want a way to leave some devices in an active
> state while the rest of the system is suspended.  It's not clear why you
> have dragged runtime PM into the discussion (apart from the obvious fact
> that you won't want to keep a device active if it isn't active already).
>

The determination of which device should remain active when the system
suspends can be based on various factors. One straightforward approach
is to consider the device's runtime pm state. Alternatively, we could
explore more elaborate techniques that consider additional criteria.

> This sounds like a major change, not something to be done with a simple
> override.  You should discuss it with Rafael Wysocki and the linux-pm
> mailing list before trying to implement anything.
>
> > Feature Supported:
> > 1. Devices could control the priority of system PM and runtime PM durin=
g
> >    runtime.
>
> This seems like a totally unnecessary side issue.  Forget about runtime
> PM for the time being and concentrate instead on which devices you want
> to keep active.
>
> > 2. The control should be at the device level, meaning that different
> >    devices should control their own priorities.
> >
> > Goal of This Patch:
> > 1. Design a framework to support features above.
> > 2. Apply it into usb for demonstration.
>
> You may find that it is easier (and less work in the long run) to design
> the general framework and get it working than to concentrate on one
> particular subsystem.
>
> Alan Stern

The big picture is "a way to leave some devices in an active state
while the rest of the system is suspended", I think it could be
separated into:
(1) Each system should be able to choose which device(s) is included
    in this feature.
(2) For devices chosen in (1), each of them should have the flexibility
    to determine when it will not suspend with the system, not just
    always being active when the system suspends.

Regards,
Guan-Yu

