Return-Path: <linux-usb+bounces-28339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B11BB8AAA6
	for <lists+linux-usb@lfdr.de>; Fri, 19 Sep 2025 18:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4A49179793
	for <lists+linux-usb@lfdr.de>; Fri, 19 Sep 2025 16:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C80D321260;
	Fri, 19 Sep 2025 16:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FZISoM7u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B07258ED6
	for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301102; cv=none; b=V9Bl0Uubu0Zjjsg3IY5EV8GWJldqYATSP7plXjtQoDck+vXi8YhelWRpjK6/PaBE116bznzOnEAUB4JuUQZDKCx3xEIJyWla8Z1EXL6hGa3uHgvQ+tCPovwspkG0p3YJax5YgrCcv7QUD/dsDytwxbPseweW2UZLjbP6iPycFDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301102; c=relaxed/simple;
	bh=vwPs42kf8g2pCVsnD1ZDpG2I0ww3zMPGMcvtxc0/JDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEZJN64Whkd00IFEJI95AzP6BATc54rmUpl31ZlmZ5Vj4kJcmZX55vqyrUgeDmT7yNAdiofJLjBBTkr7qFzW/1gnBkyB0KSl8O9bNavphIkQpgd5+kMtCw0ubWYNkWPzT1PzvoZ+mynmeyt2dL3YzotHxwOSDdyav2GMJmpLRwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FZISoM7u; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-72ce9790ab3so18178727b3.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758301100; x=1758905900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwPs42kf8g2pCVsnD1ZDpG2I0ww3zMPGMcvtxc0/JDE=;
        b=FZISoM7uNS56FpzgPX+IBw86nFSix2CVfF07XGXYq0QuLhIloRCQ3f4OTroV1Z1n4W
         pv6uSI/zsxVx3w5TKc/s59ATzGEeYw0noM4Tj/885uYHY4sikQmkNdi/KAnZUw/XVB0A
         nwrJhUQkvoE+eMR5Hy0markDpX3+O807EV77o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758301100; x=1758905900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwPs42kf8g2pCVsnD1ZDpG2I0ww3zMPGMcvtxc0/JDE=;
        b=oCZEIuGULYBSoHn1BvKOP0Jubk036/DPI8bVf0MDxgB0y/0+DkQ5DllLWR8++FRxet
         SvnA5W+2kAjVWPixDLnlo8CQj0mfhnd8RshGK1QtFQwQA4kXRUtMZnzf39kIwuKtwt2J
         NnjZDCFYuCjV+wzrSdDhOWy10Rau944iRKy1CXmIi4g05SydTMUue1UaRhJhfVZsvgB6
         cDfFeR112AiqpebVBln6ML0gg8XPqf9J2k83yU+ec7EDpcYfWKKjgxC44kkYFX4zAdh/
         9cb3vJxZ2msjTH0IYqR4/LFDQJc4+wG2HcNt70f2Z/v7C0V/g28QdS/vgBeEL+p01aWa
         jBcg==
X-Forwarded-Encrypted: i=1; AJvYcCWr+LNgpUU9j4TzeJEbQcz1KsXWCWUXmoUc5YCP1fB4C1h/HpzJJQC5qu4xsVX+V2NUDx5gKQr4QJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRh5TM1rU+7wNaQ1ESSfOlIAmaBBezMKcMslTwrhXpZ7c7KpqD
	niYF26QfWk9UskRHKJ8QEvrojhyuOzg4BIX2t5OunF6AILB8qbeXUkDDEKQ4jrkKzJ8cKyjwxSn
	/7RnXJLkImwQAl4r7Y4dX9x+IyRKEzR+EUImJYtlB
X-Gm-Gg: ASbGncsF7J87BqTw6wVXQs2fc90IZnI+BlGCN400RSfllxGbbxpVRiuMorwNnPbBF7S
	YZilteeyV9uYk8i6Gb2wbD0FH8vQ+A8JMHsKoUFsD4niP2rakgQAgoKqwgGZGE7jZksQJ0BmQYZ
	m3ss+ZMEppfL1Zd6QYegCH8CpN4Cl9LlixgspBZ6+2JqpeF/9xVH3jXBTul1afLaApAGfmJuQXE
	t6ZSjc=
X-Google-Smtp-Source: AGHT+IH5CLNTqdnY5u1hL0wkGAKr07Ad6aD0TIQLESSabxq0lt3rrTBbtShCtrtTQ6VSqbE220X6ZJw2JK0cT7g70lY=
X-Received: by 2002:a05:690c:4b0e:b0:733:8609:d9e6 with SMTP id
 00721157ae682-73d3237f3d8mr38788377b3.11.1758301099806; Fri, 19 Sep 2025
 09:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909123028.2127449-1-akuchynski@chromium.org>
 <aMliLCWFKy5Esl0-@kuha.fi.intel.com> <CANFp7mXvpNXr=01nQR54d+Z+vSiiwiDLB+3B+1eR6Ks7b37gtg@mail.gmail.com>
 <aMqpe68m3rhDYsCt@kuha.fi.intel.com> <CANFp7mWk_TuA6Gxbtc8OmB7eq_vT8wUg=xkPJsxLCBTrQwOd6A@mail.gmail.com>
 <aM1DmJQz2PnEA6G_@kuha.fi.intel.com>
In-Reply-To: <aM1DmJQz2PnEA6G_@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 19 Sep 2025 09:58:05 -0700
X-Gm-Features: AS18NWC-1pC_IRBqdpH5kjLCyCle93KXt_Xal4jsqNO_s2Q50R8iEAsW5sMteJU
Message-ID: <CANFp7mUDVPLja2QANYhJ2t6W9yPE7-qV8E2HTPHcJEYgOb8s2Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] USB Type-C alternate mode selection
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 4:50=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Sep 17, 2025 at 10:51:11AM -0700, Abhishek Pandit-Subedi wrote:
> > On Wed, Sep 17, 2025 at 5:28=E2=80=AFAM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > On Tue, Sep 16, 2025 at 09:47:44AM -0700, Abhishek Pandit-Subedi wrot=
e:
> > > > On Tue, Sep 16, 2025 at 6:12=E2=80=AFAM Heikki Krogerus
> > > > <heikki.krogerus@linux.intel.com> wrote:
> > > > >
> > > > > On Tue, Sep 09, 2025 at 12:30:23PM +0000, Andrei Kuchynski wrote:
> > > > > > This patch series introduces a flexible mechanism for USB Type-=
C mode
> > > > > > selection, enabling into USB4 mode, Thunderbolt alternate mode,=
 or
> > > > > > DisplayPort alternate mode.
> > > > > >
> > > > > > New sysfs `mode_selection` attribute is exposed to provide user=
 control
> > > > > > over mode selection. It triggers an alternate mode negotiation.
> > > > > > The mode selection logic attempts to enter prioritized modes se=
quentially.
> > > > > > A mode is considered successfully negotiated only when its alte=
rnate mode
> > > > > > driver explicitly reports a positive status. Alternate mode dri=
vers are
> > > > > > required to report their mode entry status (either successful o=
r failed).
> > > > > > If the driver does not report its status within a defined timeo=
ut period,
> > > > > > the system automatically proceeds to attempt entry into the nex=
t preferred
> > > > > > mode.
> > > > >
> > > > > I'm still struggling to understand what is the benefit from this =
- why
> > > > > would you want the user space to explicitly start the entry proce=
ss
> > > > > like this? Instead why would you not just take full control over =
the
> > > > > alt modes in user space by enabling the them one by one in what e=
ver
> > > > > order you want?
> > > >
> > > > I think after the many patch iterations we went through upstreaming=
,
> > > > we may have lost the point a little bit wrt/ the mode selection tas=
k.
> > > > We talked about this on the very first iteration of this patchset
> > > > here: https://lore.kernel.org/linux-usb/CANFp7mVWo4GhiYqfLcD_wFV34W=
MkmXncMTOnmMfnKH4vm2X8Hg@mail.gmail.com/
> > > >
> > > > The motivation behind it was to allow the kernel driver to own mode
> > > > selection entirely and not need user space intervention. The curren=
t
> > > > alt-mode drivers attempt to own the mode entry process and this fai=
ls
> > > > when you have two or more altmode drivers loaded (i.e. displayport,
> > > > thunderbolt). The original goal of the mode selection task was to m=
ove
> > > > the mode entry decision away from the alt-mode driver and to the po=
rt
> > > > driver instead.
> > > >
> > > > What's missing in the current patch series to show this is probably
> > > > actually calling mode_selection once all partner modes are added :)
> > > > Andrei should be adding that to this patch series in the next patch
> > > > version.
> > > >
> > > > Adding the mode_selection sysfs trigger is for another reason: to
> > > > re-run mode selection after priorities have been changed in userspa=
ce
> > > > and there is no partner hotplug. We specifically have some security
> > > > policies around PCI tunnels that result in the following need:
> > > > * When we enable pci tunneling, we PREFER tbt over dp and would lik=
e
> > > > to select the preferred mode. When we disable it, we PREFER dp over
> > > > TBT and would like to select the preferred mode.
> > > > * When users are logged out, we always prefer DP over TBT.
> > > > * When the system is locked, we prefer DP over TBT for new connecti=
ons
> > > > (but existing connections can be left as TBT). When we unlock, we w=
ant
> > > > to enter the most preferred mode (TBT > DP).
> > > >
> > > > While this is do-able with the alt-mode active sysfs field, we woul=
d
> > > > basically be re-creating the priority selection done in the kernel =
in
> > > > user space again. Hence why we want to expose the mode selection
> > > > trigger as done here.
> > >
> > > But this would be a step backwards. You want to keep the kernel in
> > > control of the mode selection, which is fine, but then you have these
> > > special cases where you have to give some of the control to the user
> > > space. So instead of taking complete control of the mode selection in
> > > user space, you want to create this partial control method of
> > > supporting your special cases while still leaving "most" of the
> > > control to kernel.
> > >
> > > I don't believe this will work in all cases. I'm fine with the
> > > priority as a way to tell the kernel the preferred entry order, but i=
f
> > > the user space needs to take control of the actual mode selection, it
> > > has to take full control of it instead of like this, partially. This
> > > just looks incredibly fragile.
> > >
> > > So I'm still not convinced that there is any use for this. Either the
> > > user space takes over the mode selection completely with the active
> > > attribute files, or just leaves the selection completely to the kerne=
l.
> > >
> >
> > That's a fair stance to take. We CAN do our special cases via the
> > "active" sysfs node. I've had a bit more time to think about the
> > problem we are solving and I'd like to elaborate a little.
> >
> > When we designed this mode selection task, there were two motivating fa=
ctors:
> > * The existing typec_displayport and typec_thunderbolt modules will
> > both automatically try to enter a mode when probing and that does not
> > work well. You want a deterministic entry order.
> > * There is no generic typec daemon for userspace on Linux and there
> > isn't always a need for one (i.e. UCSI systems). The kernel has the
> > most information about what any given system needs and should be able
> > to handle mode entry timing better.
> >
> > For those motivating factors, I think an in-kernel mode selection as
> > designed in this series still makes sense. Let the kernel do the mode
> > selection, inform userspace when it is completed and userspace can
> > simply set priorities + report success/failure/errors.
> > One other change we will probably want to make is to turn the partner
> > altmode Kconfig options to boolean and roll it into the typec module.
> > Alt-mode module loading breaks mode selection ordering because you
> > can't be guaranteed the partner altmodes are loaded on the system when
> > you do partner altmode enumeration.
> >
> > Heikki, can you confirm we are on the same page up till this point at
> > least? The net effect here is we are moving partner altmodes
> > individually entering modes to centralizing mode entry in the typec
> > class itself.
>
> I think we are on the same page, but I don't think you can incorporate
> the entry of the modes into the class itself (you should not do that).
> You can't even make it a problem for the altmodes - I don't believe we
> can make it work in the long term.

It probably needs to be a port driver decision. UCSI based systems
will mostly expect that a mode has already been entered after a
partner connects (and reports the SUPPORTED_CAM_CHANGED bit in
Connector Status Change) but with UCSI 3.0, some systems could
potentially make this decision in kernel (via sending SET_NEW_CAM
<connector> 0xff 0 which would prevent the PPM/LPM from entering any
modes automatically). Even with cros_ec_typec, only devices supporting
TBT/USB4 will need a mode selection decision in the port driver (since
others just auto-enter DP).

>
> Here multiple modes need to be handled as a set, so the set itself
> needs to have an object that represents it. The altmodes will be part
> of these "sets", but they remain independent of any particular set.
> So the "set" defines the order in which the modes are entered instead
> of the class, or any individual altmode.
>
> I don't think there is any other way to make sure that the altmodes
> continue to work as well independently as part of these "sets".
>
> If you guys think that this makes sense, let me know. There are a
> number of ways we could implement this.

The idea you've described here of sets sounds like what this patch
series hopes to implement. The set is just all the partner altmodes
which the port supports and the ordering is the port priority for
those altmodes.

>
> > Also, with respect to dropping the mode_selection sysfs node and
> > simply using the `active` fields to override:
> > * How can we ensure that user space does not race with the kernel mode =
entry?
> > * Should we delay exposing "number_of_alternate_modes" until after
> > mode selection is done? Should we keep the mode_selection sysfs (or a
> > similarly named file) as a read-only indicator of current status?
>
> Races are definitely a concern. But I don't think that is a problem if
> we go ahead with the above idea of separating the mode relationships
> and entry into those "mode sets".

Is the idea to give userspace the ability to create a set and try to
enter atomically? Who decides what constitutes a set?

>
> Br,
>
> --
> heikki

