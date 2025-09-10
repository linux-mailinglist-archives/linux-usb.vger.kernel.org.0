Return-Path: <linux-usb+bounces-27896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC55B52128
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 21:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75DB34877AE
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 19:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291E02D77ED;
	Wed, 10 Sep 2025 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nZMt4LIT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2927E10E3
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757532890; cv=none; b=WU31cW2vMiUG0Xi4HnVSYndlKVkvJtlAoUI1cohI6ytGsU8A6kvV1ttp78ynWFb7hbvpN3GuTx1TqiDgC6FAi/In315nsV49HuAf9EGAbvtI2CVBQaN7bFGOGPm8/DA2Eyf8oQAXfoaCzf0Trp3SZDakNvMHA1XmVp8tYzX+vAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757532890; c=relaxed/simple;
	bh=TlFZ876ym1zPhLDfhX7aHxJ50xGVPk5BB2YMzIfIBGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUzJR0sMJYVywROXw2Yde9wYKu+wXAP7PBA3ls60qVIfUZHBkW1snnwnoXF3IrbwWptdRIpo8dFEiegC3puC6y3OtGYDhOzOy6mfQ8xvkDmphBqA0RyrLX/9G0ybyjVwE5UdOoHzazEPQ2sPo1PKqhQ+W69qv/jXJ1fjXnaT1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nZMt4LIT; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso6613a12.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757532888; x=1758137688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7nv+RpfQptx2Dl6xXJ4qT+jcDztk0WNklxglJQoI+8=;
        b=nZMt4LITvt9xzu2JA8K6zTT/bOZybYFNnYK5vEWgzNDAziGl9aTXWbCx4Prc6o74Yq
         ilEE72aRFZ5VSMCVDFCiMxYPYxtKJXFVbR+IEocRAJyyTJJA5i+k1v+UMYI1+V23gOVM
         5Oc0S1iwdHnbJAyIJvBJSqGItcxJaKXHvPwMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757532888; x=1758137688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7nv+RpfQptx2Dl6xXJ4qT+jcDztk0WNklxglJQoI+8=;
        b=kuh6hZa5eg7PrQxz3lYzjiHeQXepLPrQiK87Re5a9414Y9Mub4fgAJDT8uw6G79D11
         4aQ9IEw8rmnA9xXECnAgZaEwv6QiCGLq8ESOMyttc2gFsxTPvvcDV7lAMUABn1z02LVc
         dPFjqL6/cZA/19wu2iiI5GX+wDclD7TxUOAzowiq1EQzOmKITUwDT18QzUBBLFb3ksAz
         Czh/GRYd3QxwvJyJS8TvMbXYxJUlalo4b+tSrxvt8TefM/yXOoUDzEA8xMyWMgKIXwqO
         m/st5sX9mHxC7NsMT/moJwAf6juiwV8UIxGLPZ+byP7W3k62YjW/2Ak10g5LItz4T8Pv
         KPTA==
X-Forwarded-Encrypted: i=1; AJvYcCUuTk9nkhO2OlOcsDQFOWt0RDr+8kPzyeAUaYe32hmMAjk0zMXh3gBQQZTHUslrnOgRldn6gzzRjw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/kSd4h/OMTxxjlsLZSwpVpVEBZ1IJy1LXYr99GYmloppZ/64b
	QPfI/EzhQ7ScCpph977wNno/QFn7rAYbC2CIl6deQnYhryWgPUb7jEyBcixqnmO/T46Bt4Cr8/5
	q/8uXBOhn6uLePB7U03TGppuRICO0cMcc/QY7z4OU
X-Gm-Gg: ASbGncsYemdVZzo75Y97IengCIHuGEu8+Yq/j0DsqrvNwrnR21UL6oDS/w3iYQZVoUU
	O4yH4qbhSZctkZo4cql2Ad50WVzUWvEFuODjCVu43aRKv95tEm9DVxspbNdLpEY2LrqkmiRmN9n
	gw2vUs5SJNS6NsSxiolFqhXKsh+gp/9OHLZDtCGGl14NNf+s07mV+ZsRJv6AFNIls3BOy+BYRpW
	Mqj5GVyvDmk339/k3GsJ+mtKtJHeUPm5zY=
X-Google-Smtp-Source: AGHT+IE/at+K4KcGofhNw+REQdpZKQ8VO1T6F/D0h+7ljw7nkukWyHLVVN9Bi1RQy5b2/QZoegCU8M/V8D5zD+/sXjk=
X-Received: by 2002:a17:903:4b4e:b0:24a:a724:717f with SMTP id
 d9443c01a7336-25173301d16mr220825655ad.47.1757532888514; Wed, 10 Sep 2025
 12:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-6-akuchynski@chromium.org> <2025091028-darkish-washcloth-3d02@gregkh>
In-Reply-To: <2025091028-darkish-washcloth-3d02@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 10 Sep 2025 19:34:35 +0000
X-Gm-Features: Ac12FXxPC50d353IUIsG2_cG43UVWgmx2EKjnyX-DHWSloYkCCDiVnxHD9i8OX4
Message-ID: <CAMMMRMcqVMeyHnGHPsr6XH+npY2foCXae6psOhCLz1C6+bGPYA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] usb: typec: Expose alternate mode priority via sysfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 1:28=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 05, 2025 at 02:22:06PM +0000, Andrei Kuchynski wrote:
> > This patch introduces a priority sysfs attribute to the USB Type-C
> > alternate mode port interface. This new attribute allows user-space to
> > configure the numeric priority of alternate modes managing their prefer=
red
> > order of operation.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++++++
> >  drivers/usb/typec/class.c                   | 32 ++++++++++++++++++++-
> >  2 files changed, 42 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index 38e101c17a00..dab3e4e727b6 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,17 @@ Description:     Lists the supported USB Modes. Th=
e default USB mode that is used
> >               - usb3 (USB 3.2)
> >               - usb4 (USB4)
> >
> > +             What:           /sys/class/typec/<port>/<alt-mode>/priori=
ty
> > +Date:                July 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description:
> > +             Displays and allows setting the priority for a specific a=
lt-mode.
> > +             When read, it shows the current integer priority value. L=
ower numerical
> > +             values indicate higher priority (0 is the highest priorit=
y).
> > +             If the new value is already in use by another mode, the p=
riority of the
> > +             conflicting mode and any subsequent modes will be increme=
nted until they
> > +             are all unique.
>
> What is the units here?  0 is highest, what is the lowest?  What is the
> range here?  I can't determine this from the text, sorry.
>

Hi Greg,

You are right, the lowest range is not specified; the only note is that
the value should be an integer of 0 or higher.
The mode selection algorithm does not impose a maximum value. It
operates with any priority values returned by kstrtouint(). Any MAX
value would require an explanation as to why that specific value is
the maximum, and I do not have such an explanation. The only
restriction is that it must fit within an unsigned int variable, which
is checked by kstrtouint() against UINT_MAX.

> > +
> >  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> >
> >  What:                /sys/class/typec/<port>-partner/accessory_mode
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 9f86605ce125..aaab2e1e98b4 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -19,6 +19,7 @@
> >  #include "bus.h"
> >  #include "class.h"
> >  #include "pd.h"
> > +#include "mode_selection.h"
> >
> >  static DEFINE_IDA(typec_index_ida);
> >
> > @@ -445,11 +446,34 @@ svid_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
> >  }
> >  static DEVICE_ATTR_RO(svid);
> >
> > +static ssize_t priority_store(struct device *dev,
> > +                            struct device_attribute *attr,
> > +                            const char *buf, size_t size)
> > +{
> > +     unsigned int val;
> > +     int err =3D kstrtouint(buf, 10, &val);
> > +
> > +     if (!err) {
> > +             typec_mode_set_priority(to_typec_altmode(dev), val);
> > +             return size;
> > +     }
> > +
> > +     return err;
> > +}
> > +
> > +static ssize_t priority_show(struct device *dev,
> > +                           struct device_attribute *attr, char *buf)
> > +{
> > +     return sprintf(buf, "%u\n", to_typec_altmode(dev)->priority);
>
> For new sysfs files, please use sysfs_emit(), otherwise someone will
> come along with a janitorial patch to fix it up after it lands in the
> tree :)
>
> thanks,
>
> greg k-h

I will change it, sysfs_emit instead of sprintf.
Thanks!


Andrei

