Return-Path: <linux-usb+bounces-32457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEEFD3907F
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 20:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D497730092BC
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 19:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA402DA76B;
	Sat, 17 Jan 2026 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xqs9BNvQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD4C2DAFA2
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768677958; cv=pass; b=Ydck8yCaGOtSLvxvMvhLRI04t4isO0r46uadq3Shr6B7APwaDSmpJRGcxKIUyigauQkoy2m5aRstdPjTFP6VXTCCQR8m0qAkX7txRIev8EerGSHr77Ll2TJAOEZCCnkBvQLPzPds4XkHBe9uzFT6YOT3R7VG8ah4kY44rdkM6P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768677958; c=relaxed/simple;
	bh=0UZQyoykIJiZ7b4ClPwl/sKurHIXkd2YT1kBf1pKo6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmX1dHxM1qZcInhcH/ofqCy8fNUoThdiD/CFCVjRKhfrIKFzm+2EZeRwUox5Q0YarYMrB76Tf2rOXeE9Q4dB2sCsNbBr6voEGlb/3xedvKz2YSNrYc2gKK3WzPBAJRqnrkEalZLUqSD8LtuqEPcMjWTxuh50OAbOx7tZb8IMlFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xqs9BNvQ; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc0d7255434so1214692a12.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 11:25:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768677956; cv=none;
        d=google.com; s=arc-20240605;
        b=V8iiC8YQJtb0kab060nlyi7E4z8iHlYhC5SnBfnNY58vaNYOvkd565mnpCPLNu9uj1
         ToC6L/w5T9imYLdTiHneZ2H4lx5FGmLNU+TXxT9/FbMkVicHBicMD4E0izTJ3EWmL1/I
         14U8gmgA1RPHhp70pkjUlg3OOu6/p0s+1CeVfyhivbzh/Byz9DEqEjzeNKZLP5gptI6x
         6UbixhfEiR//R8a+XoRPJyIhh4cSliGDodF678XAnUGq8oEU/NvGcIjYqvthcwSzzpKO
         6+mAqW8pRGePRV7ulfAT4rpXgj6LC9FYiQmb/tmmhcfA9QvT0oG/BqyvWU2kP/wCwYk2
         Ymtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uXE9ck+/xO1bAjz7BogwfP+zPVi5FjXpQB7uUHVi0rA=;
        fh=gSzgSHd57XijMBgjMnVFYPwekHaKf1QNZHwrJTx5a4c=;
        b=Lv/mJk8xf1aU0qkQFjiL25e5Urk9SHHEjHeNxoywqmQpj4jaTdGPl2cZILyY9A9MXM
         m/FuK5CxmTBNktufszvNawj/ariZYpS7RJlaBwEJWsLhtFe9FcwqAN1rFDegzi/ru8mA
         gdEvzbZqSCGXfNVag4bRCOgmeqJqULXHIJzsiA0fRC2RWRtAGVJ+BqdBnymexVH6x2bB
         2hAbNE+XkQ8Dj44TLQvtUfq9q6L50kLH7n4h77T5g653FHHIusIc3HvLj5zQejmgKeKh
         CPC/KQnGUW1sb3MfM8tnk+EkYacWTV5yuqRPWb2i32euqgima40OzLjvQMpaqV4Fq7/G
         ajAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768677956; x=1769282756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXE9ck+/xO1bAjz7BogwfP+zPVi5FjXpQB7uUHVi0rA=;
        b=Xqs9BNvQOZi/GZF9/SFLbQhBt+pPXAGmhdjQSWFctrMh+eYxh9jURmbwVR1qNTKGtg
         VlHj331EwAgkrahpTe8zCLDbbcZhKAdWoda7ofoXtTvUCfiYfFC8KfjyTkfSyc2TyCTM
         Z6PMYIqQcnFDfllMXvbqmtNDM7m76f78poO8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768677956; x=1769282756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uXE9ck+/xO1bAjz7BogwfP+zPVi5FjXpQB7uUHVi0rA=;
        b=Q4iFtcNGvRI9s4S2PERbZYiJNmRRGG0TULqgHt/0sX4Tl9VWfL37XFGya8xYAMpFxT
         Pk/qZ7UhCcgVaPvcilG8kXO7EDo3n66VJHZQCY8mUzfUYbjZvkkj1iLnwMWdFnzKCTrZ
         uXFU/9e0EDryH+AR3awIj3HvnhXZvzjBnn6tFMbVdA3QLaqLV0gDr6PKv6TjWJrmauWe
         q7C/ymRywEkgTL+9mzjbvlkokGpywYpEcXFaj4fnl3T+RNj9WmmIGY3L0gp7glvpG76E
         OPV3gGXvi15hJI5y/Xk3E/STzcERbjJ0wrnmxFmjR51XVDoHNToEafnmQQ2bnL1DsDJW
         OQfw==
X-Forwarded-Encrypted: i=1; AJvYcCWbycsl5JL2mvFDD/RQROLrOmxBFch3C3SXHCqCZRc1Cb7B8LvX0vtugKWV0s0779+LjN443YosG3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8lV2jHSko3Ig1z1nXANgutQ4KkWSXdds+cF2lnZzdDgmjmkwD
	uuqAhk79R2F5mHu5T9wIpXdFqubvvP3Yd/WQxljAXRiYfFHhSZOusAtosN1v17dc9uU4eC2ZAuu
	4Tw6MzHX3E+M2TkAg545FnKOyQ2WfsAj5fb+yb1KT
X-Gm-Gg: AY/fxX5uPNPA6Q9W/HKLKOP2bVasxcp5if4mfJLQqxC/vYMcJStPya51b0xunxktIm/
	aWqvMIKsq0SmHyPkalgIeEKCXShuTq+A/LZgvpw7PqF18oDBT98Woajtzl/InesnB6HeH6FCoM8
	1Rj+pnt0+Jqm5WHhQ5S1eUXsNTRM3kgUSPbxSgQJvrMmkfTS4SljaYn7uWz6NF03AMXlnZVK5mb
	PON2mu+ONqG4lL1U8ZbsZCp4A1mZCzegiuqWV+J7wDpxm+sjbGU6SpMv/2ddw3Fa1mIbg==
X-Received: by 2002:a17:902:cccb:b0:298:1013:9d11 with SMTP id
 d9443c01a7336-2a7175c13d4mr64148535ad.43.1768677955859; Sat, 17 Jan 2026
 11:25:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-5-akuchynski@chromium.org> <aWj6vLt3iHXjuYjz@kuha>
In-Reply-To: <aWj6vLt3iHXjuYjz@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Sat, 17 Jan 2026 20:25:44 +0100
X-Gm-Features: AZwV_QhgbE2QsbeVVND6dJjvhFxBm4zfoPSb1JZWgMOyVpuLzYertv8DxJAioac
Message-ID: <CAMMMRMc2t=0CNR4VPURNuKu0YGRdXqWhXAppgR8jNLoJ_TCYVw@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] usb: typec: Expose alternate mode priority via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Johan Hovold <johan@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 3:34=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> Tue, Jan 13, 2026 at 01:05:32PM +0000, Andrei Kuchynski kirjoitti:
> > This patch introduces a priority sysfs attribute to the USB Type-C
> > alternate mode port interface. This new attribute allows user-space to
> > configure the numeric priority of alternate modes managing their prefer=
red
> > order of operation. If a new priority value conflicts with an existing
> > mode's priority, the priorities of the conflicting mode and all subsequ=
ent
> > modes are automatically incremented to ensure uniqueness.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > Reviewed-by: Benson Leung <bleung@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++
> >  drivers/usb/typec/class.c                   | 90 ++++++++++++++++++++-
> >  include/linux/usb/typec_altmode.h           |  1 +
> >  3 files changed, 101 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index 38e101c17a004..737b76828b509 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,17 @@ Description:     Lists the supported USB Modes. Th=
e default USB mode that is used
> >               - usb3 (USB 3.2)
> >               - usb4 (USB4)
> >
> > +What:                /sys/class/typec/<port>/<alt-mode>/priority
> > +Date:                July 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description:
> > +             Displays and allows setting the priority for a specific a=
lternate mode.
> > +             The priority is an integer in the range 0-255. A lower nu=
merical value
> > +             indicates a higher priority (0 is the highest).
> > +             If the new value is already in use by another mode, the p=
riority of the
> > +             conflicting mode and any subsequent modes will be increme=
nted until they
> > +             are all unique.
>
> Greg already told you to show the range somehow with this, so the
> total number of (so far known?) alternate modes. Maybe something like
> <index> / <total_num_altmodes> ?
>

Thank you for the review, Heikki.

Greg asked me to define a range and document it. The range is 0 to 255.
I'm not sure if this range needs to be shown.
In our current userspace application, we strictly read/write 0/1 here.

> >  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> >
> >  What:                /sys/class/typec/<port>-partner/accessory_mode
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 0f12d6120511b..1fb5450c0a2f2 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -445,11 +445,88 @@ svid_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
> >  }
> >  static DEVICE_ATTR_RO(svid);
> >
> > +static int increment_duplicated_priority(struct device *dev, void *dat=
a)
> > +{
> > +     if (is_typec_port_altmode(dev)) {
> > +             struct typec_altmode **alt_target =3D (struct typec_altmo=
de **)data;
> > +             struct typec_altmode *alt =3D to_typec_altmode(dev);
> > +
> > +             if (alt !=3D *alt_target && alt->priority =3D=3D (*alt_ta=
rget)->priority) {
> > +                     alt->priority++;
> > +                     *alt_target =3D alt;
> > +                     return 1;
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int find_duplicated_priority(struct device *dev, void *data)
> > +{
> > +     if (is_typec_port_altmode(dev)) {
> > +             struct typec_altmode **alt_target =3D (struct typec_altmo=
de **)data;
> > +             struct typec_altmode *alt =3D to_typec_altmode(dev);
> > +
> > +             if (alt !=3D *alt_target && alt->priority =3D=3D (*alt_ta=
rget)->priority)
> > +                     return 1;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int typec_mode_set_priority(struct typec_altmode *alt, const u8=
 priority)
> > +{
> > +     struct typec_port *port =3D to_typec_port(alt->dev.parent);
> > +     const u8 old_priority =3D alt->priority;
> > +     int res =3D 1;
> > +
> > +     alt->priority =3D priority;
> > +     while (res) {
> > +             res =3D device_for_each_child(&port->dev, &alt, find_dupl=
icated_priority);
> > +             if (res) {
> > +                     alt->priority++;
> > +                     if (alt->priority =3D=3D 0) {
> > +                             alt->priority =3D old_priority;
> > +                             return -EOVERFLOW;
> > +                     }
> > +             }
> > +     }
> > +
> > +     res =3D 1;
> > +     alt->priority =3D priority;
> > +     while (res)
> > +             res =3D device_for_each_child(&port->dev, &alt,
> > +                             increment_duplicated_priority);
>
> Please align the code properly.
>

I will. Thanks for mentioning that.

> > +     return 0;
> > +}
> > +
> > +static ssize_t priority_store(struct device *dev,
> > +                            struct device_attribute *attr,
> > +                            const char *buf, size_t size)
> > +{
> > +     u8 val;
> > +     int err =3D kstrtou8(buf, 10, &val);
> > +
> > +     if (!err)
> > +             err =3D typec_mode_set_priority(to_typec_altmode(dev), va=
l);
> > +
> > +     if (!err)
> > +             return size;
> > +     return err;
>
> I know not everybody likes the ternary operator, but I would just
>
>         return err ?: size;
>

I like the ternary operator. But I might keep the current implementation.

Thanks,
Andrei

