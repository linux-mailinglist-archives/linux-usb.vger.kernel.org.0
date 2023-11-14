Return-Path: <linux-usb+bounces-2880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6367EB0EB
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 14:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAF79281238
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 13:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEF03FE5D;
	Tue, 14 Nov 2023 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935D3FE59
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 13:31:43 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAA11B9;
	Tue, 14 Nov 2023 05:31:42 -0800 (PST)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-58787a6583aso296215eaf.1;
        Tue, 14 Nov 2023 05:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699968701; x=1700573501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xq3TFIR4bve78mwQTQtnI30TuVk/gpeezuxu6f7CCOQ=;
        b=qVCpo4gXtdv9+ecCIu9VR0oYNzbHB18bzG4F3+gDbBWipTv/5b0B64SPiY8JZIuoeK
         6NsZDGJgnHXb5dcVglSxN9/8ZqZ7ke5GFIaXmnLFhOgkQSAOcJOQgVWxOXRJZQzjR8qU
         oQx+X1FH78NajPMvjozQ0YlxXGRf487el6oepkQHa273N2MrZB8lUN7coJ/9ErWWulrP
         ahk/FbQx2R3+ZJzL6QcXHaAfgOxP1UExgNOz9U9PKYKx998Sm0vluTELSuHNBdXG+9fM
         hHiGv2h02rNE9j0GAfMnllK5bfWhzRg9yv5Ek6NX7QemcZr7a+KIlGuxUKLV90UURLuA
         Ueuw==
X-Gm-Message-State: AOJu0YzZCaUAAUW5qIpEAzAZaNQPgGns49qLs8qE6YCtS0cWSHpoDYHV
	Z8SS8YRoogglwdvHcyK2UQ6t6XRxNOy/HEgPSQc=
X-Google-Smtp-Source: AGHT+IH3bNA+igZ7XBPjf6UixfeM2kn1LQ7Fj4EIFd5iBf2RjIehC5eUluJSN8ozSaoZl4za8DrHWP+rsxPoaMpQ2B4=
X-Received: by 2002:a05:6820:d84:b0:58a:145:fef2 with SMTP id
 ek4-20020a0568200d8400b0058a0145fef2mr2378957oob.0.1699968701394; Tue, 14 Nov
 2023 05:31:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031093921.755204-1-guanyulin@google.com> <f75d6cd2-fa9f-4820-969f-2a8839d78c9e@rowland.harvard.edu>
 <CAOuDEK0NcijUKAL3fGtO=Ks+Y38TRhJcVx+ff-QUyUA0LcQ1Bw@mail.gmail.com>
 <3fe5414a-570f-4bfa-aa2f-909d7799551b@rowland.harvard.edu> <CAOuDEK1935=DmToUky8eXA5KxZFu+-phMjGB=Wv7Ox+k5fDvbQ@mail.gmail.com>
In-Reply-To: <CAOuDEK1935=DmToUky8eXA5KxZFu+-phMjGB=Wv7Ox+k5fDvbQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 14 Nov 2023 14:31:30 +0100
Message-ID: <CAJZ5v0g_hg9pnnD1DXNPDM9v7kSoiEp-SKqAXcvEntXpxa5Nxw@mail.gmail.com>
Subject: Re: [PATCH] rpm: pm: enable PM_RPM_EXCEPTION config flag
To: Guan-Yu Lin <guanyulin@google.com>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org, 
	len.brown@intel.com, pavel@ucw.cz, heikki.krogerus@linux.intel.com, 
	mkl@pengutronix.de, hadess@hadess.net, mailhol.vincent@wanadoo.fr, 
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pumahsu@google.com, raychi@google.com, 
	albertccwang@google.com, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 10:08=E2=80=AFAM Guan-Yu Lin <guanyulin@google.com>=
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
>
> Apologies, I should use "wakeup source" here.
>
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
> Hi Rafael,
> We'd like to implement a feature to allow system suspend with several
> devices still active. Do you have any consideration on this?

I will have more time to think about this when I'm back from the
conference I'm participating in now.

In the meantime, I would recommend you to address Alan's comments.

