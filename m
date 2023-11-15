Return-Path: <linux-usb+bounces-2899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C66B7EC4D1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 15:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBFB61C20BDF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 14:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41414286B0;
	Wed, 15 Nov 2023 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF65250FA
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 14:10:51 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C280E7;
	Wed, 15 Nov 2023 06:10:50 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-58a7b55bef5so84495eaf.1;
        Wed, 15 Nov 2023 06:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700057450; x=1700662250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnQnsLiccnW9oWaH+nGhHyzzFKh12H3eFHXv5bXQ0dU=;
        b=OOWfjYohLco9I/81zq+J35erA9u9ICfFDGHDfbN0tZYNJoz4EglCB0iHBhSf+6IlVp
         4TfjYAKpltcn3L4SX4g9rWqGJ5Dz/4iD6ybiRFED4lCUTaJy4UTDUP9hK6UPwrIF0eer
         SeveTXHB/O9T+WVt378cCsleD5e8/i8VZibeNFMn44b89Dc1YLPJ/xuUX2nQP/m6WPAw
         CyizprGwZMkZP7R27jQdjbDkYoWf9+92H/5R1wsld9tBMvB2Rzl/1Wa+pZCZjAdXMEQl
         qpjGDvDXvyzgVlGqTZ6MV4RQ3+JnRhQ0PWFFdCzgLelTqFb0Sv6rkvTY4g2OOtrr/GHN
         QZ0A==
X-Gm-Message-State: AOJu0YxZVuJtOw71uZXCKgd8+x3xUmpXoLXKkmhdd56FA8rfQcX+VwrK
	whZbGHib+k7NEHEvNX6GwnlDSpwB6eghmmXDY/8=
X-Google-Smtp-Source: AGHT+IEV2hJUQ0Q0IMesFEjpBvRxNym9oMpYx9EjqaPy31RIcCLcmrO/3ZlltYyJ3UmJH5lRxfNvEe0xCG0hK8MXwKQ=
X-Received: by 2002:a05:6820:2783:b0:58a:7c36:9f7b with SMTP id
 dc3-20020a056820278300b0058a7c369f7bmr3705851oob.1.1700057449633; Wed, 15 Nov
 2023 06:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031093921.755204-1-guanyulin@google.com> <f75d6cd2-fa9f-4820-969f-2a8839d78c9e@rowland.harvard.edu>
 <CAOuDEK0NcijUKAL3fGtO=Ks+Y38TRhJcVx+ff-QUyUA0LcQ1Bw@mail.gmail.com>
 <3fe5414a-570f-4bfa-aa2f-909d7799551b@rowland.harvard.edu> <CAOuDEK3UuVGgP63NG9HtuJ0D2ERZsFGBwF5+GNynk=P7zSVUhg@mail.gmail.com>
In-Reply-To: <CAOuDEK3UuVGgP63NG9HtuJ0D2ERZsFGBwF5+GNynk=P7zSVUhg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 15 Nov 2023 15:10:38 +0100
Message-ID: <CAJZ5v0j-JdoGADG6rYNOEY1ePtDz0vsV4T1wX2TO1t+5kPyJ8Q@mail.gmail.com>
Subject: Re: [PATCH] rpm: pm: enable PM_RPM_EXCEPTION config flag
To: Guan-Yu Lin <guanyulin@google.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	gregkh@linuxfoundation.org, len.brown@intel.com, pavel@ucw.cz, 
	heikki.krogerus@linux.intel.com, mkl@pengutronix.de, hadess@hadess.net, 
	mailhol.vincent@wanadoo.fr, ivan.orlov0322@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, pumahsu@google.com, raychi@google.com, 
	albertccwang@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 8:08=E2=80=AFAM Guan-Yu Lin <guanyulin@google.com> =
wrote:
>
> On Wed, Nov 8, 2023 at 11:56=E2=80=AFPM Alan Stern <stern@rowland.harvard=
.edu> wrote:
> >
> > On Wed, Nov 08, 2023 at 04:45:43PM +0800, Guan-Yu Lin wrote:
> > > Thanks for the questions. Let me first introduce my motivation for
> > > proposing this feature. We can discuss the implementation details lat=
er.
> > >
> > > Motivation:
> > > Currently, system PM operations always override runtime PM operations=
.
> > > As runtime PM reflects the power status of devices, there is a
> > > possibility that runtime PM states that a device is in use, but syste=
m
> > > PM decides to suspend it. Up to now, we have assumed that a device ca=
n't
> > > function without resources from the system, so the device should acqu=
ire
> > > a wakelock to prevent this from happening. However, what if the devic=
e
> >
> > [From the fact that you mention wakelocks, I assume that you're trying
> > to implement something for Android systems rather than Linux systems
> > in general.]
> >
> > > does not need the system's support to function? Or only needs limited
> > > resources (e.g., only limited power source or clock) to function? In =
this
> > > situation, we would like to keep the device on but allow the system t=
o
> > > suspend. This is an example where we would like devices to follow run=
time
> > > PM rather than system PM.
> >
> > To put it more simply, you want a way to leave some devices in an activ=
e
> > state while the rest of the system is suspended.  It's not clear why yo=
u
> > have dragged runtime PM into the discussion (apart from the obvious fac=
t
> > that you won't want to keep a device active if it isn't active already)=
.
> >
>
> The determination of which device should remain active when the system
> suspends can be based on various factors. One straightforward approach
> is to consider the device's runtime pm state.

Not really.  The runtime PM status has no bearing on whether or not
the device should remain active over a system suspend/resume cycle.

> Alternatively, we could
> explore more elaborate techniques that consider additional criteria.

In fact, the device's driver decides what is going to happen to it
during the system suspend transition.  It very well may decide to
leave the device in the operational state, but it needs to take
dependencies between into account.

> > This sounds like a major change, not something to be done with a simple
> > override.  You should discuss it with Rafael Wysocki and the linux-pm
> > mailing list before trying to implement anything.
> >
> > > Feature Supported:
> > > 1. Devices could control the priority of system PM and runtime PM dur=
ing
> > >    runtime.
> >
> > This seems like a totally unnecessary side issue.  Forget about runtime
> > PM for the time being and concentrate instead on which devices you want
> > to keep active.
> >
> > > 2. The control should be at the device level, meaning that different
> > >    devices should control their own priorities.
> > >
> > > Goal of This Patch:
> > > 1. Design a framework to support features above.
> > > 2. Apply it into usb for demonstration.
> >
> > You may find that it is easier (and less work in the long run) to desig=
n
> > the general framework and get it working than to concentrate on one
> > particular subsystem.
> >
> > Alan Stern
>
> The big picture is "a way to leave some devices in an active state
> while the rest of the system is suspended", I think it could be
> separated into:
> (1) Each system should be able to choose which device(s) is included
>     in this feature.
> (2) For devices chosen in (1), each of them should have the flexibility
>     to determine when it will not suspend with the system, not just
>     always being active when the system suspends.

A specific use case, please.

