Return-Path: <linux-usb+bounces-24848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F76ADE146
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 04:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1437E16EC18
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 02:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B541B4223;
	Wed, 18 Jun 2025 02:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nc3tcV6Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1309418A6A5
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 02:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750214854; cv=none; b=k2TlDod7Resgw4wazg3aw/+qegW/KMATyLTYF8A6LJyffWFQGg4KQE3JBTMkaLQBi8gy9z2cxgvuG1ZSOksVcFWCxlWNnAt0FHsJA6nkDGwqUWld3JhNZJHn3GLhTbzeytpZNqa6mcN9mA4FS/UNjmyt/rJ3SNdvDUhAZFUH7D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750214854; c=relaxed/simple;
	bh=jCZ/BUww0rKENDBnn51d/Uu6YAnR1LQ5TqwAeYr+dKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8RJ3JtC5oe++VAo1yb2hrhDEcQGM3QunEBabMeCFcfp0ZPa0Jo0wqW0P5BqQcn0L3TKn7bCXFbC32fN+lprInDpe/yowm29R171uYsGkncyssWEEvokLXXNfY1Aj5iMRex5NAtVCCIMHtVka1ma5kSm2VxLEewx+uH5ukiehQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nc3tcV6Y; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70f862dbeaeso65229447b3.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 19:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750214851; x=1750819651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92ZdJDVkCT0H76bbfryowkjJ/EF/rp1FL4eApFHkX/8=;
        b=nc3tcV6YAEsUnXmt8P03KZL1+A6rf+3mPRPphy21J+eNcYuPTK9aVqpg7mbY5m+Yfq
         HcfsVhV6GQ6YLn36W+BcprliDDINi22OB9ubf7WCf6vfVXGVlPu8iWKIXRRcu6RTpBus
         Hqhdz1kQXviDgj0x7vawND25hHw3aDt7wI0rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750214851; x=1750819651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92ZdJDVkCT0H76bbfryowkjJ/EF/rp1FL4eApFHkX/8=;
        b=RRpfGR9QdFw4o1Cl6RcTX6q1wN03HhA2qkHLMsJjB9C2otGT3PDKd2DazJcjoLANYN
         rUL2byE32BEL9IU+6P+1ojW0VHCaH9Drjg18PZIFtJX3DJZOB+jmsJBeJuaMrO+do02K
         F1Df0pGzSWpPIShVka06MCbtvpU9iF0VzfGjV9/fab+JYzKf42ByvtifEj5YHHnsVJsi
         mIG1jQtgDe8qbhecVkF96gD2SJyQ0FhSj9a4I4jX2jbvEbgOOXuU2KZXQZyN7NibaZcm
         8ynF6q+T21YSmMRmHHjz8334/Ztu53oiDwqINel3pF1l3UFDJQF4iodRY+pR+iv7Xdbq
         J09A==
X-Forwarded-Encrypted: i=1; AJvYcCUJeatvGLDp7z0Wvdt58XdcQg4acJIn8Fc8BQEUf7EQMfLiRvCOlg4ucP+Qn3O/rsn7Fehksn407Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzULO79tmbEovq9EuK9e1dXKtLr9BBlAMCadPJu8XdJdfjg1tMq
	+jwgxE019ZpzCjecehHcwL/7XuFYNIhuoMs3CAH76+3WKRf3yRc7duIrPF9MWUn1QF7bMzRLGid
	Fp7xWHa4ew4cOyjEHiCwa/amv5VoEf/gqny+YVXVI
X-Gm-Gg: ASbGnctoYTWWKtdM7Teokv6ou1Uz0RncGzETTpaDYC2gexFzQwlQ0VLLbi6++TdU7GD
	KEhBJg8FXrXoaQFGVaJBt0oZUNh3b6lUYI4D0BadThUSNmBns8EduBp6NLjpdY7qhMHw7MnM55W
	/X/v2g9JNx/KLFpoess1hjgYWA1HHIsM4Nz/KQT12pdXo=
X-Google-Smtp-Source: AGHT+IFJrp4GvzEGvutTnULgQhYHJ1qRoCAlXG+/cMpR+wgU3Pio2fs+vfORraWjOd4sfv2ZJRUUZV11zt1wZw0WIhg=
X-Received: by 2002:a05:690c:88d:b0:702:52af:7168 with SMTP id
 00721157ae682-7117536cfb0mr241558337b3.2.1750214850949; Tue, 17 Jun 2025
 19:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-5-akuchynski@chromium.org> <aFE6dnxet4_sm8b1@kuha.fi.intel.com>
 <CAMMMRMdwUyxdMy42tA_ccYo77nf=6C+KgokDLHBLEYDa5aOHQw@mail.gmail.com> <2025061727-crinkle-drew-4a0d@gregkh>
In-Reply-To: <2025061727-crinkle-drew-4a0d@gregkh>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 17 Jun 2025 19:47:18 -0700
X-Gm-Features: Ac12FXxyVwEZPHJ1mDXjUJj8ue8p4FyMxmQ-V9m2YaISFg8MRc0tx6hp0ZoKfo0
Message-ID: <CANFp7mVWo4GhiYqfLcD_wFV34WMkmXncMTOnmMfnKH4vm2X8Hg@mail.gmail.com>
Subject: Re: [PATCH 04/10] usb: typec: Expose alternate mode priorities via sysfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrei Kuchynski <akuchynski@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Pooja Katiyar <pooja.katiyar@intel.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 6:28=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 17, 2025 at 02:38:04PM +0200, Andrei Kuchynski wrote:
> > On Tue, Jun 17, 2025 at 11:50=E2=80=AFAM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > On Mon, Jun 16, 2025 at 01:31:41PM +0000, Andrei Kuchynski wrote:
> > > > This sysfs attribute specifies the preferred order for enabling
> > > > DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mode.
> > > >
> > > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > > ---
> > > >  Documentation/ABI/testing/sysfs-class-typec | 17 ++++
> > > >  drivers/usb/typec/Makefile                  |  2 +-
> > > >  drivers/usb/typec/class.c                   | 26 ++++++
> > > >  drivers/usb/typec/class.h                   |  2 +
> > > >  drivers/usb/typec/mode_selection.c          | 93 +++++++++++++++++=
++++
> > > >  drivers/usb/typec/mode_selection.h          |  5 ++
> > > >  include/linux/usb/typec_altmode.h           |  7 ++
> > > >  7 files changed, 151 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/usb/typec/mode_selection.c
> > > >  create mode 100644 drivers/usb/typec/mode_selection.h
> > > >
> > > > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Document=
ation/ABI/testing/sysfs-class-typec
> > > > index 38e101c17a00..46eee82042ab 100644
> > > > --- a/Documentation/ABI/testing/sysfs-class-typec
> > > > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > > > @@ -162,6 +162,23 @@ Description:     Lists the supported USB Modes=
. The default USB mode that is used
> > > >               - usb3 (USB 3.2)
> > > >               - usb4 (USB4)
> > > >
> > > > +What:                /sys/class/typec/<port>/altmode_priorities
> > > > +Date:                June 2025
> > > > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > > > +Description: Lists the alternate modes supported by the port and t=
heir
> > > > +             priorities. The priority setting determines the order=
 in which
> > > > +             Displayport alt-mode, Thunderbolt alt-mode and USB4 m=
ode will be
> > > > +             activated, indicating the preferred selection sequenc=
e. A value of -1
> > > > +             disables automatic entry into a specific mode, while =
lower numbers
> > > > +             indicate higher priority. The default priorities can =
be modified by
> > > > +             assigning new values. Modes without explicitly set va=
lues default to -1,
> > > > +             effectively disabling them.
> > > > +
> > > > +             Example values:
> > > > +             - "USB4=3D0 TBT=3D1 DP=3D2"
> > > > +             - "USB4=3D-1 TBT=3D0"
> > > > +             - "DP=3D-1 USB4=3D-1 TBT=3D-1"
> > >
> > > No. If you want to disable entry to a mode by default, then you
> > > deactivate that mode, so -1 is not needed. USB4 is also not an alt
> > > mode, so this at the very least should be named differently.

USB4 should be called an alt-mode though based on its behavior and I
think the spec makes a mistake not doing so. It's mutually exclusive
with alternate modes, it modifies the functionality of the data lanes
and it's not a new data mode (just a tunneling protocol). But that's
an aside for this patch...

> > >
> > > But I'm not sure this is the correct way to handle the modes in
> > > general. Can you please explain what exactly is the use case you are
> > > thinking?
> >
> > Hi Heikki,
> >
> > This implements the mode selection logic within the kernel, replacing
> > its userspace counterpart. Implementing this in the kernel offers
> > advantages, making the process both more robust and far easier to
> > manage.
> > This eliminates the need for user space to verify port, partner, or
> > cable capabilities, and to control the mode entry process. User space
> > doesn't even need to know if USB4 mode is supported by the port or
> > partner; unsupported modes are automatically skipped.
>
> But that's all things that userspace can do, so it should be doing it.
> You need to justify why userspace can NOT do something in order to move
> that logic into the kernel.

Userspace "can" do it but it is not doing it today. There is no
userspace alt-mode manager (that I'm aware of) that's writing to
/sys/class/typec (typecd in ChromeOS only reads and does mode
entry/exit via a sideband mechanism) and boltd (userspace thunderbolt
manager; https://github.com/gicmo/bolt) only deals with tunnels and
not mode entry directly.

I think the inclusion of TBT and USB4 in the kernel makes this change
necessary and the existing way of doing it is not widely used yet.

>
> > User space's role is now limited to high-level tasks like security,
> > with the kernel managing technical implementation. Mode selection and
> > activation can occur without user space intervention at all if no
> > special rules apply and the default policy (USB4 -> TBT -> DP) is
> > acceptable.
>
> What is wrong with "userspace intervention"?  Is the current api broken
> somehow?

There were some previous discussions on this:
https://lore.kernel.org/linux-usb/ZyjW0CMXgGIt-usC@kuha.fi.intel.com/
https://lore.kernel.org/chrome-platform/CAA8EJpqiF_0bgYT8boFa4UPJWcxgw89mmf=
bdMVKeAP-xnFOP4g@mail.gmail.com/

Some background:
* The Type-C port driver will add a partner alt-mode to the altmode bus.
* An altmode driver will probe and attach if available on the system.
    * Currently, the probe function of these altmode drivers always
enter the given mode. The expectation is that if a system allows mode
override, it should always be done by the alt mode driver. This
doesn't scale beyond one alt-mode driver =E2=80=93 between DP and TBT, whic=
h
altmode driver should win entry? Prior to TBT driver being added in
December and USB4 support circa similar time frame, DP was always the
default choice if override was supported.
    * Userspace could make this decision but then what about USB4? The
current APIs don't expose USB4 information in the same way and the
auto-enter behavior is different (it doesn't enter).

In a lot of existing designs, mode entry is entirely handled by the
firmware and no mode selection is possible from the kernel. This is
covered by patch 3 of this series (alt_mode_override) flag. Windows
designs usually fall into this category as they use PD controllers
implementing UCSI (and usually a very old UCSI version 1.2).

A few designs allow overriding the current mode:
* Chromebooks with cros_ec_ucsi which support Thunderbolt will allow
override of the alternate mode (via UCSI set_new_cam) and USB mode
(via UCSI Set_USB). They will enter DPAM instead of TBT by default if
possible.
* Chromebooks with the cros_ec_typec driver which support Thunderbolt
will require the OS to make the mode entry decision (no mode entry by
default on attach).
* Pixel phone TCPM currently requires mode entry from the kernel as
there's no userspace mode selection component.
* Potentially some Windows designs that implement AltMode override via
UCSI (ucsi_acpi). These should behave similarly to cros_ec_ucsi but
will likely automatically enter TBT mode.

In these cases, the kernel is a better place to make alternate mode decisio=
ns:
* Quicker than having a userspace implementation (and more consistent
during boot).
* Works consistently across drivers and accounts for both overridable
and non-overridable systems.

The main thing userspace should really be doing with mode entry is
setting policy around what modes they want to enter instead of doing
low level checking of compatibility and sequencing of mode entry
operations. And the main policy we're trying to enforce on ChromeOS is
to not enter TBT by default (based on our security posture described
at https://www.chromium.org/chromium-os/developer-library/reference/securit=
y/usb4/).

Given that Thunderbolt altmode driver support and USB4 support was
only added around December of last year, I don't imagine there are
many userspace usages yet and we should fix these API issues before
they become too widely used. I think mode sequencing belongs in the
kernel and not userspace.


>
> > > If you just need to prevent for example USB4 entry by default, then
> > > you write usb3 (or usb2) to the usb_capability. The alt modes you can
> > > deactivate by default, no?
> > >
> > > I can appreciate the convenience that you get from a single file like
> > > that, but it does not really give much room to move if for example th=
e
> > > user space needs to behave differently in case of failures to enter a
> > > specific mode compared to successful entries.
> > >
> >
> > You are right, this patch series is proposed for its convenience. It
> > offers a more convenient method for users to enable or activate any
> > mode, without altering existing methods. Users can decide whether they
> > prioritize more control or an easier mode selection method.
>
> So now you are going to maintain 2 different ways to do this for the
> next 40+ years?  How are you going to test this over time to make sure
> nothing breaks/changes?

While the current sysfs apis for altmode + usb are useful for testing,
they aren't as useful for normal user use-cases. Deprecating or moving
this control to debugfs and only exposing the
mode_selection/mode_priority fields would be my choice going forward.
The mode selection work currently does go through the same typec APIs
as the sysfs entries so we gain test coverage of driver behavior using
either API. If we need to retain the old APIs, I think we'll need to
add some Kunit tests to make sure behavior is consistent across the
two ways of doing things.

>
> thanks,
>
> greg k-h

