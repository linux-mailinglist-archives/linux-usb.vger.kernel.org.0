Return-Path: <linux-usb+bounces-28247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFBBB82590
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 02:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A4A53A9517
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 00:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C99035942;
	Thu, 18 Sep 2025 00:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oFvFjUMO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F96C1EA65
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 00:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758154200; cv=none; b=skpsKsQOd8u07C4QsZs+B4zb5a/EFddFrWlTJO5tIFlsTXI97vB+U1A6INnjb2cxELMQU9hwznlbfk5LXwYB6O1IRkH4B+2OnMk0oK1K9MSPa/3q/T0MRKmb2ZHoo0J1YOeDnSwaPqfYd/za12dL8/H0U4AtWQSl6LRe22Iw5t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758154200; c=relaxed/simple;
	bh=wXmVEes7R+HZhzrPevZN6QhmJWKaa1NAEkUnITk2JiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYL7aVLxq3mTZQ1dD0ks8OG5ii1b2j6FojokcEmIwVc/xseJvzErx5lFZyxjymfRRgrfZmznVaViaOw8Qw6+GFH3v6/T6oCrl/UShp2+tsCqDx6vTD2Cg0+0chRCnRr7UCfaV+DAjN0JWMulilHixoyFKig/tgWGkl9DWX7AJQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oFvFjUMO; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d603b60cbso4158147b3.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 17:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758154196; x=1758758996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugUY8fDSYAyjEj+60o61XHTDZs04gL4Ne5h3N5cFY+U=;
        b=oFvFjUMOJt7NtRS/h4z7j9mPP16BLq+idOOwi/q/la5jGtW1OHYJbkC4yh7G7ScbZ8
         XRGoaPpHPD/JEfsgD8t58QIyUe2ztJCRLp4vaKVohNZexeb8/DjXOWp6moE9CGAc4KCo
         zGpCqu8K/hOzwW9m07RHdS5/HqC9mM1I0ZyoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758154196; x=1758758996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugUY8fDSYAyjEj+60o61XHTDZs04gL4Ne5h3N5cFY+U=;
        b=S4In7SrVb045k/Say48+oEs7CXzJn8dnZgxG5CdU6Vfi84T1AQFdaGLTRtw60BHSrs
         ASD9lo0zFNq0rgGdSIgFypclQRy6bfnvrktnuDcxx1e7WY8NQ2MJj0Nn1J706PMfhxDo
         1REHvxpIW2kxk86mv+Hg7k3HwnJZ2Ymx0eSa7Pu59TL8kvduMPzHqxgtQlw2hxUKvEqy
         TEJL2cevESifI9SbY4ClpWfaszbpzGJIEIRlUaVewgTK1hyp9jPiCsEJR+4st45bENql
         zkSKvKY53uGvIcLtocjshquEmKhk/BlFC5H1yWTsdByo/2nJMtIcNa5GNtWua9AKQZsM
         ieOA==
X-Forwarded-Encrypted: i=1; AJvYcCX13FjFM1iWefWHFpyFEqk34jHqIc7OQGRwLk7Gw04l5B1FT3/dHu6dPGVEixLcAkcE5BBk5EnUbYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkDB9NX/FpC33NzJJlvTQY56jvQWVIVDr5uEcrEUZqqDKopLy
	xxT4OGto2hQmBfPqx2FERnWXrBcDnTupSIKTaMVZWTdYi+1YNs6Mz8hOTmCjtwAr8Ictq8EIqNM
	7j0GnqW+fFmWSWgmKAtp066yFHs4lGgsp2z0cg39q
X-Gm-Gg: ASbGncvvu1ZjXj4E9ryOo2y4464LHRYRFA5qwGbXndasKUgjhqPzmPdxfk608f4rSp+
	F92Dae2irp3cnYDzse2SLgJY0o+LgNqny8H2dh+OPSmkNM6rNTikLZDLt6w7VRr/vJKyR8dY86T
	KbVlfdd47N63V+05Mh6bYt9o01iUJhg+Dn9X00+vzAd2cAV0oCZpOAUJy/CjBuvuDbx+z/k1LsA
	qBUNN/uO2URuAU0eHQBY5o6Kg==
X-Google-Smtp-Source: AGHT+IF1frXLALk7WSuqMqYwezb5DgqWLAUYnU3Oeq3dZu2d6eJcwsvSihmi/zwq6RojmrVWrWrazn/idl/1oNGv5Fc=
X-Received: by 2002:a05:690c:6002:b0:72e:a82a:ab84 with SMTP id
 00721157ae682-7389265e5a8mr33044617b3.51.1758154196107; Wed, 17 Sep 2025
 17:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909123028.2127449-1-akuchynski@chromium.org>
 <aMliLCWFKy5Esl0-@kuha.fi.intel.com> <CANFp7mXvpNXr=01nQR54d+Z+vSiiwiDLB+3B+1eR6Ks7b37gtg@mail.gmail.com>
 <aMqpe68m3rhDYsCt@kuha.fi.intel.com> <CANFp7mWk_TuA6Gxbtc8OmB7eq_vT8wUg=xkPJsxLCBTrQwOd6A@mail.gmail.com>
In-Reply-To: <CANFp7mWk_TuA6Gxbtc8OmB7eq_vT8wUg=xkPJsxLCBTrQwOd6A@mail.gmail.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 17 Sep 2025 17:09:44 -0700
X-Gm-Features: AS18NWAyWH1DZmpewk_fLYk2Psq6ex0rOS5pigS50Ll2bt7BydEol9bZzR6p01Q
Message-ID: <CANFp7mVwZksBYBOgPLDDYiynjFDh3jJqY1PFvvBWxtFd8MMYjw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] USB Type-C alternate mode selection
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 10:51=E2=80=AFAM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
> On Wed, Sep 17, 2025 at 5:28=E2=80=AFAM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Tue, Sep 16, 2025 at 09:47:44AM -0700, Abhishek Pandit-Subedi wrote:
> > > On Tue, Sep 16, 2025 at 6:12=E2=80=AFAM Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > >
> > > > On Tue, Sep 09, 2025 at 12:30:23PM +0000, Andrei Kuchynski wrote:
> > > > > This patch series introduces a flexible mechanism for USB Type-C =
mode
> > > > > selection, enabling into USB4 mode, Thunderbolt alternate mode, o=
r
> > > > > DisplayPort alternate mode.
> > > > >
> > > > > New sysfs `mode_selection` attribute is exposed to provide user c=
ontrol
> > > > > over mode selection. It triggers an alternate mode negotiation.
> > > > > The mode selection logic attempts to enter prioritized modes sequ=
entially.
> > > > > A mode is considered successfully negotiated only when its altern=
ate mode
> > > > > driver explicitly reports a positive status. Alternate mode drive=
rs are
> > > > > required to report their mode entry status (either successful or =
failed).
> > > > > If the driver does not report its status within a defined timeout=
 period,
> > > > > the system automatically proceeds to attempt entry into the next =
preferred
> > > > > mode.
> > > >
> > > > I'm still struggling to understand what is the benefit from this - =
why
> > > > would you want the user space to explicitly start the entry process
> > > > like this? Instead why would you not just take full control over th=
e
> > > > alt modes in user space by enabling the them one by one in what eve=
r
> > > > order you want?
> > >
> > > I think after the many patch iterations we went through upstreaming,
> > > we may have lost the point a little bit wrt/ the mode selection task.
> > > We talked about this on the very first iteration of this patchset
> > > here: https://lore.kernel.org/linux-usb/CANFp7mVWo4GhiYqfLcD_wFV34WMk=
mXncMTOnmMfnKH4vm2X8Hg@mail.gmail.com/
> > >
> > > The motivation behind it was to allow the kernel driver to own mode
> > > selection entirely and not need user space intervention. The current
> > > alt-mode drivers attempt to own the mode entry process and this fails
> > > when you have two or more altmode drivers loaded (i.e. displayport,
> > > thunderbolt). The original goal of the mode selection task was to mov=
e
> > > the mode entry decision away from the alt-mode driver and to the port
> > > driver instead.
> > >
> > > What's missing in the current patch series to show this is probably
> > > actually calling mode_selection once all partner modes are added :)
> > > Andrei should be adding that to this patch series in the next patch
> > > version.
> > >
> > > Adding the mode_selection sysfs trigger is for another reason: to
> > > re-run mode selection after priorities have been changed in userspace
> > > and there is no partner hotplug. We specifically have some security
> > > policies around PCI tunnels that result in the following need:
> > > * When we enable pci tunneling, we PREFER tbt over dp and would like
> > > to select the preferred mode. When we disable it, we PREFER dp over
> > > TBT and would like to select the preferred mode.
> > > * When users are logged out, we always prefer DP over TBT.
> > > * When the system is locked, we prefer DP over TBT for new connection=
s
> > > (but existing connections can be left as TBT). When we unlock, we wan=
t
> > > to enter the most preferred mode (TBT > DP).
> > >
> > > While this is do-able with the alt-mode active sysfs field, we would
> > > basically be re-creating the priority selection done in the kernel in
> > > user space again. Hence why we want to expose the mode selection
> > > trigger as done here.
> >
> > But this would be a step backwards. You want to keep the kernel in
> > control of the mode selection, which is fine, but then you have these
> > special cases where you have to give some of the control to the user
> > space. So instead of taking complete control of the mode selection in
> > user space, you want to create this partial control method of
> > supporting your special cases while still leaving "most" of the
> > control to kernel.
> >
> > I don't believe this will work in all cases. I'm fine with the
> > priority as a way to tell the kernel the preferred entry order, but if
> > the user space needs to take control of the actual mode selection, it
> > has to take full control of it instead of like this, partially. This
> > just looks incredibly fragile.
> >
> > So I'm still not convinced that there is any use for this. Either the
> > user space takes over the mode selection completely with the active
> > attribute files, or just leaves the selection completely to the kernel.
> >
>
> That's a fair stance to take. We CAN do our special cases via the
> "active" sysfs node. I've had a bit more time to think about the
> problem we are solving and I'd like to elaborate a little.
>
> When we designed this mode selection task, there were two motivating fact=
ors:
> * The existing typec_displayport and typec_thunderbolt modules will
> both automatically try to enter a mode when probing and that does not
> work well. You want a deterministic entry order.
> * There is no generic typec daemon for userspace on Linux and there
> isn't always a need for one (i.e. UCSI systems). The kernel has the
> most information about what any given system needs and should be able
> to handle mode entry timing better.
>
> For those motivating factors, I think an in-kernel mode selection as
> designed in this series still makes sense. Let the kernel do the mode
> selection, inform userspace when it is completed and userspace can
> simply set priorities + report success/failure/errors.
> One other change we will probably want to make is to turn the partner
> altmode Kconfig options to boolean and roll it into the typec module.
> Alt-mode module loading breaks mode selection ordering because you
> can't be guaranteed the partner altmodes are loaded on the system when
> you do partner altmode enumeration.

After actually trying to do this today, I think a better approach
might be to just add a MODULE_SOFTDEP for all the typec altmodes. That
way, all the modules get loaded together and there's less of a chance
of waiting for the altmode driver to load when enumerating partners on
boot.

>
> Heikki, can you confirm we are on the same page up till this point at
> least? The net effect here is we are moving partner altmodes
> individually entering modes to centralizing mode entry in the typec
> class itself.
>
> Also, with respect to dropping the mode_selection sysfs node and
> simply using the `active` fields to override:
> * How can we ensure that user space does not race with the kernel mode en=
try?
> * Should we delay exposing "number_of_alternate_modes" until after
> mode selection is done? Should we keep the mode_selection sysfs (or a
> similarly named file) as a read-only indicator of current status?
>
> Thanks,
> Abhishek
>
> > Br,
> >
> > > > I don't believe you can make this approach scale much if and when i=
n
> > > > the future the use cases change. Right now I don't feel comfortable
> > > > with this at all.
> > > >
> > > > thanks,
> > > >
> > > > > This series was tested on an Android OS device with kernel 6.16.
> > > > > This series depends on the 'USB Type-C alternate mode priorities'=
 series:
> > > > > https://lore.kernel.org/all/20250905142206.4105351-1-akuchynski@c=
hromium.org/
> > > > >
> > > > > Andrei Kuchynski (5):
> > > > >   usb: typec: Implement mode selection
> > > > >   usb: typec: Expose mode_selection attribute via sysfs
> > > > >   usb: typec: Report altmode entry status via callback
> > > > >   usb: typec: ucsi: displayport: Propagate DP altmode entry resul=
t
> > > > >   platform/chrome: cros_ec_typec: Propagate altmode entry result
> > > > >
> > > > >  Documentation/ABI/testing/sysfs-class-typec  |  11 +
> > > > >  drivers/platform/chrome/cros_ec_typec.c      |   9 +
> > > > >  drivers/platform/chrome/cros_typec_altmode.c |  32 +-
> > > > >  drivers/platform/chrome/cros_typec_altmode.h |   6 +
> > > > >  drivers/usb/typec/altmodes/displayport.c     |  19 +-
> > > > >  drivers/usb/typec/altmodes/thunderbolt.c     |  10 +
> > > > >  drivers/usb/typec/class.c                    |  37 ++
> > > > >  drivers/usb/typec/class.h                    |   4 +
> > > > >  drivers/usb/typec/mode_selection.c           | 345 +++++++++++++=
++++++
> > > > >  drivers/usb/typec/mode_selection.h           |  25 ++
> > > > >  drivers/usb/typec/ucsi/displayport.c         |  10 +-
> > > > >  include/linux/usb/typec_altmode.h            |  11 +
> > > > >  include/linux/usb/typec_dp.h                 |   2 +
> > > > >  include/linux/usb/typec_tbt.h                |   3 +
> > > > >  14 files changed, 516 insertions(+), 8 deletions(-)
> > > > >
> > > > > --
> > > > > 2.51.0.384.g4c02a37b29-goog
> >
> > --
> > heikki

