Return-Path: <linux-usb+bounces-16207-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23299DD13
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 06:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701A2283012
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 04:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B508B1714C9;
	Tue, 15 Oct 2024 04:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DCXNdYqz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF2215380A
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 04:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728965272; cv=none; b=XJ+1Vah/iXl57Q6+4MxevHbs6K7FbKp6SY9CBQPXDCVN8VACd4zVNGihebbAIxBvzkG34L/1Vh+VwCzedp4JUcej0p+DJ8aJewHcykBBxCcwxw4yMUE1l2mc7i0esb4Cc/vJIY8/euIv3YAJsKIpbO3hbXLcWM79oH5LwAEDe1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728965272; c=relaxed/simple;
	bh=MoJXsq8dEH4VBJh/CUe6Ed26awrVNV7yW+awr03B0PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krcCx/YbysCoLZWf325ErA/3mYjWI48JI/la+2JIElzo9JGWqdvC260zFeT2isNdKV3mjrZ0HhQMrJ1MrTpH3vbI2IcgZtxqO/IlqLABEPordmf99KVv9aXivkKDoqVHtU0f8Lge9u6y7eSbByGoVW3SiwVq5+VNqy7lzT6ztew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DCXNdYqz; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e35fb3792eso28421907b3.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 21:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728965269; x=1729570069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfzVaK5twKDRUDTf0TwZdd+BhU0CAT+vZIEQ2Yq6FjM=;
        b=DCXNdYqz8at0UF57KB15GwL+jazUM3z50+tOytVcwoJqUsrGOBW1ej6FJRuE6UH7Y7
         cwVLmxKPH/PaLb+GFx+VM00AZ8zrtZCYMJqNUehPwNA6NYZVcupfqO3pyrwzfRx2dwXL
         xQREt9Q4PenFANPlWbn5zMiqy0UdpwX+Ol3rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728965269; x=1729570069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfzVaK5twKDRUDTf0TwZdd+BhU0CAT+vZIEQ2Yq6FjM=;
        b=wbwyNU4fusjILf7RansrmtukS+nUiHxDVk8acEyhJFclKt5JlNKPFYvp1Gnvfk5nNB
         6ky1c3N6sj8yQ7WpUQCiMU0xkpHperuC2I5e3pOPauyjmuPK+vLdEPlXC3O8da15zmng
         wBPUVHUwEHBtJ4qCfdekQDqUIV+X46KxHFAXaWglaa115I44W90pjww6FxFeGy0PuflO
         SbEiCLK8l4fCJfwDqtc+s/NuelbYQGisaUiNkvimBa+viGogdvA6x8J7n4uEpBzpGQml
         pNzOCAhozTEvTW7ROh9VgltMHlEG7NIz8APflGk5YhpyIoBXx6gNJ4l1FBU/X5Cd0BWk
         lmXg==
X-Forwarded-Encrypted: i=1; AJvYcCV6sImb0WYEU/sqnswcVczGgIsznSMSF9UQQ/4lB8j5SqJOryN0f5MvtLsll1Wk/SFG/X1z134mo5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtqhW2WOFieU/g5q5D68wdcfML11naOJxoAYxEstFod92bKlEC
	YctVZVcr3GReUv3/Cm8jDjjXgSdxbuvOxYkzYu3eaeG+VWSPTaWDgLZBkJzNkqSCqL/bdCbtpNc
	mmmZm3SVEXon+8+ZNxMATZNhypoyE3lxC/GgwE78Gx97q0BQ=
X-Google-Smtp-Source: AGHT+IGRDb8LQN6fKpPjgq52Dz8udXlvY4+PRV1uFz10QuLbxJL23SC9QGqCLsSX1GqaVg5JRUoq6j/u06fj3UDm6l8=
X-Received: by 2002:a05:690c:4a91:b0:6e2:b263:105b with SMTP id
 00721157ae682-6e347c4e3c8mr71979777b3.41.1728965269465; Mon, 14 Oct 2024
 21:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-3-heikki.krogerus@linux.intel.com>
 <2024101149-body-urologist-6262@gregkh> <ZwkwXWCD0xval8Wu@kuha.fi.intel.com>
In-Reply-To: <ZwkwXWCD0xval8Wu@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Mon, 14 Oct 2024 21:07:38 -0700
Message-ID: <CANFp7mXLWhnX2KST-OkWXMQ32RP=eiFYrGfxdgZuvjbpkq4w7Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] usb: typec: Add attribute file showing the USB
 Modes of the partner
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 7:04=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Fri, Oct 11, 2024 at 03:09:57PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Oct 11, 2024 at 03:44:00PM +0300, Heikki Krogerus wrote:
> > > This attribute file shows the supported USB modes (USB 2.0,
> > > USB 3.0 and USB4) of the partner, and the currently active
> > > mode.
> > >
> > > The active mode is determined primarily by checking the
> > > speed of the enumerated USB device. When USB Power Delivery
> > > is supported, the active USB mode should be always the mode
> > > that was used with the Enter_USB Message, regardless of the
> > > result of the USB enumeration. The port drivers can
> > > separately assign the mode with a dedicated API.
> > >
> > > If USB Power Delivery Identity is supplied for the partner
> > > device, the supported modes are extracted from it.
> > >
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > ---
> > >  Documentation/ABI/testing/sysfs-class-typec |  14 +++
> > >  drivers/usb/typec/class.c                   | 123 ++++++++++++++++++=
+-
> > >  drivers/usb/typec/class.h                   |   2 +
> > >  include/linux/usb/typec.h                   |   5 +
> > >  4 files changed, 140 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentat=
ion/ABI/testing/sysfs-class-typec
> > > index 7c307f02d99e..a3afe04b2688 100644
> > > --- a/Documentation/ABI/testing/sysfs-class-typec
> > > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > > @@ -233,6 +233,20 @@ Description:
> > >             directory exists, it will have an attribute file for ever=
y VDO
> > >             in Discover Identity command result.
> > >
> > > +What:              /sys/class/typec/<port>-partner/usb_mode
> > > +Date:              February 2024
> >
> > It's later than this :)
>
> Indeed. I'm sorry.
>
> >
> > > +Contact:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > +Description:       The USB Modes that the partner device supports. T=
he active mode
> > > +           is displayed in brackets. The active USB mode can be chan=
ged by
> > > +           writing to this file when the port driver is able to send=
 Data
> > > +           Reset Message to the partner. That requires USB Power Del=
ivery
> > > +           contract between the partner and the port.
> > > +
> > > +           Valid values:
> > > +           - usb2 (USB 2.0)
> > > +           - usb3 (USB 3.2)
> > > +           - usb4 (USB4)
> >
> > We should probably add all of this info to 'lsusb' one of these days.
> > I'll add it to my todo list...
> >
> > > +
> > >  USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
> > >
> > >  Note: Electronically Marked Cables will have a device also for one c=
able plug
> > > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > > index ea9ee47bb246..a6fedafc9c86 100644
> > > --- a/drivers/usb/typec/class.c
> > > +++ b/drivers/usb/typec/class.c
> > > @@ -618,6 +618,74 @@ EXPORT_SYMBOL_GPL(typec_unregister_altmode);
> > >  /* -----------------------------------------------------------------=
-------- */
> > >  /* Type-C Partners */
> > >
> > > +/**
> > > + * typec_partner_set_usb_mode - Assign active USB Mode for the partn=
er
> > > + * @partner: USB Type-C partner
> > > + * @mode: USB Mode (USB2, USB3 or USB4)
> > > + *
> > > + * The port drivers can use this function to assign the active USB M=
ode to
> > > + * @partner. The USB Mode can change for example due to Data Reset.
> > > + */
> > > +void typec_partner_set_usb_mode(struct typec_partner *partner, enum =
usb_mode mode)
> > > +{
> > > +   if (!partner || partner->usb_mode =3D=3D mode)
> > > +           return;
> > > +
> > > +   partner->usb_capability |=3D BIT(mode - 1);
> > > +   partner->usb_mode =3D mode;
> > > +   sysfs_notify(&partner->dev.kobj, NULL, "usb_mode");
> >
> > Who is listening for this and what are they going to do with the
> > information?
>
> I'll drop it, unless Abhishek, you guys would have use for it. Let me
> know. I'll send v4 next week.

I think you are ok to remove this. We would care about this value when
registering the partner and when activating a specific USB mode. With
the latter, we can just depend on the synchronous nature of
usb_mode_store (i.e. we can check the result after writing to the
sysfs file).

>
> > > +}
> > > +EXPORT_SYMBOL_GPL(typec_partner_set_usb_mode);
> > > +
> > > +static ssize_t
> > > +usb_mode_show(struct device *dev, struct device_attribute *attr, cha=
r *buf)
> > > +{
> > > +   struct typec_partner *partner =3D to_typec_partner(dev);
> > > +   int len =3D 0;
> > > +   int i;
> > > +
> > > +   for (i =3D USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
> > > +           if (!(BIT(i - 1) & partner->usb_capability))
> > > +                   continue;
> > > +
> > > +           if (i =3D=3D partner->usb_mode)
> > > +                   len +=3D sysfs_emit_at(buf, len, "[%s] ", usb_mod=
es[i]);
> > > +           else
> > > +                   len +=3D sysfs_emit_at(buf, len, "%s ", usb_modes=
[i]);
> > > +   }
> > > +
> > > +   buf[len - 1] =3D '\n';
> >
> > Again, sysfs_emit_at()?
>
> Yes. These are going back to the internal review. Too many mistakes.
> Sorry.
>
> thanks,
>
> --
> heikki

