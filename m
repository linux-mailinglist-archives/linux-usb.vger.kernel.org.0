Return-Path: <linux-usb+bounces-26775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF57FB23A16
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 22:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B102A1A5E
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 20:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D752D46AB;
	Tue, 12 Aug 2025 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c1b5xWn4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFCB2D0630
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755030853; cv=none; b=bBqNL1lukyc0m6/wkkDlZZeD4AsFrRO125LL0Etp9/fKZ26cSaZTnGp0W3zV7Oh3NYniYubEd70u3x7KOgWs7Bw9/ytRjQGjJG3B4iz7HFqfhtOKQCSMXT5ogWxoNbBaSnwEaA20z3A0T6iJnSioXs63fj3Qe1oG3hD2Bmgf3BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755030853; c=relaxed/simple;
	bh=sc5Szj9DaKl32962dz6jW5WEWwuoiEYfcZH2OgxoK/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ic9AD1t8vN41LK1ZyVnceHY/SsSN4R2w425GWtRD8p95ueJV9Q8skkWcQulQgIhlu5zejnTXJW2tvH+4H4nu9pQuTd2Jm/qqB1dT9XV4pGKoWoFZbHGUJSIUiEu2T1qLcgEs9ukc5Ttk9J2TFPe1FY9a0T2j8cS26+saNrsnIms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c1b5xWn4; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71bd9e38af7so55554867b3.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755030850; x=1755635650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CesmGPtKuDUWY4MQccWH2mnWQ8QDSsrtS7Gzevtd68w=;
        b=c1b5xWn4aq1Kf+VgiLz+FkRPuQzE9TX/oheSON72XlP/t0DIUJZxGxeeqVJRrS+8fp
         W8pkpvh/WAlwVf6tnlOC8bTa+BLipkBqjWcghoH/2vml2+eMrRsl+yJ8FZqCck5wpvJI
         XCpU7poiYcsXILBUMiXD5G/aYpVBWk+a9oaiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755030850; x=1755635650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CesmGPtKuDUWY4MQccWH2mnWQ8QDSsrtS7Gzevtd68w=;
        b=oyF4zDdpZGHeXK8S/b3ZFru5xO+ahLasuYUwE+4wiTBEBeSbcAr/kL0EpHTjUwo1DN
         hHdo9bYQWNE0AlXX0tIPnUijLtT/RdO75tgqFF5gWolQBA/7JLOAovo4aZeBplzT4T7O
         2/4eiMqTgYOX/fOcyvwPUTYGuvVEv76XcpHmNTuwYVXMVwwIGvPexpg/U7myP7QaySjp
         9y0vL/Rq9WY0+pB5kKc8bh7mMpbT4UMoEN4siZeing5lr8chJaFxM5IjOF99GkzSA9EW
         TMu+YouYt/J8DLAZy+Qxc0PMp+grwVCOHXlcaNQUYvkLEZUxWfvHJ7PXePFtbeJM42N8
         z5ew==
X-Forwarded-Encrypted: i=1; AJvYcCU+Pom/vlMBBz6ZX7LGMum8KYvD/F+NnuESPlfECEURHOW3BPQSR0SG9Oh4BD4UDQXPuW3XKXpqqok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWa9FfMgjbsQWVz9K8DIr73TzmpwaxajPr9LGTh5CdOucnhtso
	HK5nYPRdJe0VP/BgDLInl3p4vwa5GdK8r6ffT+0L+MBj9cX8AVr41EsiO8RD7klAymUrkkjLCdq
	++DpK1aTnKdCMckmLzPz/z1gj/06gDLvbB1WuHFIC
X-Gm-Gg: ASbGnctsIR8Jquo3RH/M5WNU4qM+oASec9WYGOXmva2c0IkxuJaD234G9UOtBgCnV6X
	oSa0Sd6NmiadVjYiSgrUyJIi+5gOxrlCA6soT5OADjXwpTFP6wzJU9YKOJgD9vuz5tGaAleqbLW
	tdBoZIt+7gHd95cqKPxJtpBc9MUi9tXcRp5/Oc65unrhJfWsqQg53q9olKul8Zbd61R7QukUlN/
	XtCWow=
X-Google-Smtp-Source: AGHT+IEerpIXF67J3Ps9rtYB7F6lok4NcCvujccjf6KzzrBDAggAVaGU8Y6kayvIYrX4gW3PQuZjQojWFbC0ahif9Zo=
X-Received: by 2002:a05:690c:688c:b0:71c:1d31:e693 with SMTP id
 00721157ae682-71d4e52955cmr7726027b3.24.1755030850150; Tue, 12 Aug 2025
 13:34:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804090340.3062182-1-akuchynski@chromium.org>
 <20250804090340.3062182-5-akuchynski@chromium.org> <aJn9ZSy3w4zW4Xvq@kuha.fi.intel.com>
 <CANFp7mVUFZyF8z0dN-Mo7ntPOXh06ZD0RH5GyvJJymOXrhSD1g@mail.gmail.com> <aJsoS3EXgoLP-f-E@kuha.fi.intel.com>
In-Reply-To: <aJsoS3EXgoLP-f-E@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 12 Aug 2025 13:33:58 -0700
X-Gm-Features: Ac12FXzX_w_wK4vvlBMCy61zeWwZCbfhZWbGwyjBDcHuxh7vMIEodeZCUXnKDwU
Message-ID: <CANFp7mW92PgjSWyJq7Bz6ZLJ8ZgnsCRw2kAYAjKX3yymKW9hBA@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] usb: typec: Expose mode priorities via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 4:41=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Abhishek,
>
> On Mon, Aug 11, 2025 at 11:22:38AM -0700, Abhishek Pandit-Subedi wrote:
> > On Mon, Aug 11, 2025 at 7:25=E2=80=AFAM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > Hi Andrei,
> > >
> > > On Mon, Aug 04, 2025 at 09:03:33AM +0000, Andrei Kuchynski wrote:
> > > > This patch introduces new sysfs attributes to allow users to config=
ure
> > > > and view Type-C mode priorities.
> > > >
> > > > `priority`, `usb4_priority` attributes allow users to assign a nume=
ric
> > > > priority to DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mo=
de.
> > > >
> > > > `mode_priorities` - read-only attribute that displays an ordered li=
st
> > > > of all modes based on their configured priorities.
> > > >
> > > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > > ---
> > > >  Documentation/ABI/testing/sysfs-class-typec |  33 +++++
> > > >  drivers/usb/typec/Makefile                  |   2 +-
> > > >  drivers/usb/typec/class.c                   | 103 +++++++++++++++-
> > > >  drivers/usb/typec/class.h                   |   1 +
> > > >  drivers/usb/typec/mode_selection.c          | 130 ++++++++++++++++=
++++
> > > >  drivers/usb/typec/mode_selection.h          |  23 ++++
> > > >  include/linux/usb/typec_altmode.h           |   7 ++
> > > >  7 files changed, 295 insertions(+), 4 deletions(-)
> > > >  create mode 100644 drivers/usb/typec/mode_selection.c
> > > >  create mode 100644 drivers/usb/typec/mode_selection.h
> > > >
> > > > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Document=
ation/ABI/testing/sysfs-class-typec
> > > > index 38e101c17a00..575dd94f33ab 100644
> > > > --- a/Documentation/ABI/testing/sysfs-class-typec
> > > > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > > > @@ -162,6 +162,39 @@ Description:     Lists the supported USB Modes=
. The default USB mode that is used
> > > >               - usb3 (USB 3.2)
> > > >               - usb4 (USB4)
> > > >
> > > > +             What:           /sys/class/typec/<port>/<alt-mode>/pr=
iority
> > > > +Date:                July 2025
> > > > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > > > +Description:
> > > > +             Displays and allows setting the priority for a specif=
ic alt-mode.
> > > > +             When read, it shows the current integer priority valu=
e. Lower numerical
> > > > +             values indicate higher priority (0 is the highest pri=
ority).
> > > > +             If the new value is already in use by another mode, t=
he priority of the
> > > > +             conflicting mode and any subsequent modes will be inc=
remented until they
> > > > +             are all unique.
> > > > +             This attribute is visible only if the kernel supports=
 mode selection.
> > > > +
> > > > +             What:           /sys/class/typec/<port>/usb4_priority
> > > > +Date:                July 2025
> > > > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > > > +Description:
> > > > +             Displays and allows setting the priority for USB4 mod=
e. Its behavior and
> > > > +             priority numbering scheme are identical to the genera=
l alt-mode
> > > > +             "priority" attributes.
> > >
> > > I'm not sure those above two file make any sense.
> > >
> > > > +What:                /sys/class/typec/<port>/mode_priorities
> > > > +Date:                July 2025
> > > > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > > > +Description: This read-only file lists the modes supported by the =
port,
> > > > +             ordered by their activation priority. It reflects the=
 preferred sequence
> > > > +             the kernel will attempt to activate modes (DisplayPor=
t alt-mode,
> > > > +             Thunderbolt alt-mode, USB4 mode).
> > > > +             This attribute is visible only if the kernel supports=
 mode selection.
> > > > +
> > > > +             Example values:
> > > > +             - "USB4 Thunderbolt3 DisplayPort"
> > > > +             - "DisplayPort": the port only supports Displayport a=
lt-mode
> > >
> > > Why not just use this one instead so that you write the highest
> > > priority mode to it?
> >
> > Feedback from Greg on
> > https://lore.kernel.org/linux-usb/2025070159-judgingly-baggage-042a@gre=
gkh/:
> >
> > "quote":
> > Multiple value sysfs files are generally frowned apon.  sysfs files tha=
t
> > also have to be manually parsed in the kernel are also frowned apon.
> > Are you _SURE_ there is no other way that you could possibly do this?
> >
> > The reason we originally suggested a single "mode priorities" was
> > because we weren't sure what to do about USB4. Otherwise, it makes
> > sense to push a priority field to each alt_mode sysfs group and keep
> > it internally ordered. This is where I really wish we just treated
> > USB4 as an alternate mode :)
>
> I'm probable forgetting something, but I'm pretty sure I already told
> you guys that I agree, it should be an alt mode. So why not just
> register a special alt mode for it?

We interpreted this a bit differently (as just rename it):
https://patchwork.kernel.org/project/linux-usb/patch/20250616133147.1835939=
-5-akuchynski@chromium.org/#26431992

Thanks for the clarification here. In that case, we'll get rid of
`usb_priorities` and `usb_results` and just add a new alternate mode
for USB4. The vendor ids list on usb.org
(https://www.usb.org/sites/default/files/vendor_ids072325_1.pdf) shows
0xff00 for USB4 so that's what we'll use. So the attributes should be:
.active (similar to other modes), .mode =3D 1 (unused really), .svid =3D
0xff00, .vdo =3D <usb eudo> (if supported).

>
> Sorry if I missed something.
>
> > As such, our current API recommendation looks like the following:
> >
> > * On each port, we lay out priorities for all supported alternate modes=
 + USB4.
>
> This first part I understand.
>
> > * We expose a file to trigger the mode selection task. Reading from it
> > gives you the current status of mode selection (single value).
> > * Detailed results from mode entry are pushed to the mode sysfs group
> > (via entry_results). Converting these to UEVENT is fine but a more
> > persistent value in debugfs would be useful for debugging.
>
> This second part I would really like to handle separately, after we
> have a solution for the first part.

Ack. We'll reduce the series so it's easier to review for mode_priorities f=
irst.

>
> thanks,
>
> --
> heikki

