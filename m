Return-Path: <linux-usb+bounces-29053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBF5BC6A8B
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 23:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C4D374EB2C5
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 21:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4B82C0279;
	Wed,  8 Oct 2025 21:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RVfqF/Nh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A22BFC60
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 21:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958084; cv=none; b=McnFxGtXNlDYf+TgojLyCqQujW+Eu/4ErMIaIFi8/+merfbjoCBUfhjoYCtzbqOajrDnQoZgMVH5sXij0OHw/QwxNxS8XLeKgZcTEg6lotIwJtCYYp9L3RRrXzIzwyxUBJM7Zi+/Fzr07+8oHdHCjroghL5ggpLXkkvuIsA78dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958084; c=relaxed/simple;
	bh=695UFzPvhnhIXQFbMXUaI7aPH4xRdVyKoN5JWsEUYX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHtFYQSIa6yDnbIxVkSYU0+3mtW+o0dSr0b/kY5xMhILMYsKEG304kxoDhT3FNULeRCKxOb0NUWt/jYwoZXSpnVE4Ocyup7DfdkQ/8vTIwj6gfu7DAcTGrtpXvb4nZvPcByNIKi9cO6JyN7ShZekV+8uzRk3yU2GRWPjbr2Z+9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RVfqF/Nh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57e03279bfeso489849e87.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759958080; x=1760562880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHHBgBC7TtZb8PdXfXQUua1rH7Gx4NDZfQ9BITkQ9mM=;
        b=RVfqF/NhpM1JcCdLqKvpPN4rpHqgb+46I8NYDYqsmQ4t2RJmmo4TJtfjfRdiOkyE6U
         VGlc4fmF9gKAOh2Xh9mQBNY9cgpwybXOWJS2NlaCTcNKdR9wuW9Jo4Ape7mgT0IUBoFJ
         hhLTBpRtm3tHj6SIe0GC0UwvbgThUad37JW1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759958080; x=1760562880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHHBgBC7TtZb8PdXfXQUua1rH7Gx4NDZfQ9BITkQ9mM=;
        b=bcloXT6qH4iXUV/phR/L2zpSQiNHbTwbPTohhetcu347JV0P3L+AP9vNj2PfN5rqeR
         lxRC4Nd9VSObbQaQFfuHUzrLwLXPFh5zMNp1rs8ICscoViQMnmLJrrSg/9z+dobs9ke/
         u7zY55ibwzZ1Ldzl7ZoZFlMeYUS6fPUMUFM3530S8O3fAGoMNKYcXY9jjU/evFX95yCt
         Jk218sG0blYGWoRzlgVCDdUM05UhLBArObvymLim+Eko0lvqynHLazp1g3NeW3yNvNVG
         ybJpAh1wWK/s6brCk/Y/jsifzNBjGoU2ZrKLnUig08u84ijUoVLycJiq48j9/VOWh/R6
         WkTw==
X-Forwarded-Encrypted: i=1; AJvYcCXR1Hhx/zOFA93Cg6RTUxX7UZpu9bsWFA+mlWHptY7Zwqw61dDitEMuHjJ9IITYLXFHRqDJHD+gtEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1uSTR3MBSdTfEfP0HvRW4JN5TN+PHavqVDkN46HVnnqJLkK9G
	vQaf8ZU8EfprCLPDxdo+UaS4YpfUZq8Qrlg/XkRv5M/AZ8PiSC7aXTIEHOP8laUVrcD7QbyPYPa
	PkQ/SUA9abT6F0PV91DAq4JypK62mVCGqk3KkM4XquNHHlLHzNCO+Vq2YZg==
X-Gm-Gg: ASbGnctbf5Y7Aw6AI0savvjr8kC29lr5wn9f1hRnfdMkRHaL5pHnq/9VOAVdem9m2Ed
	iCgAYhEAhNfOCBP938ZoObYh0ecLXuiA+rHyBnuH+p3o8kIqX6HkICNvmLEAYenuCGPRoLct2rl
	2H8BRPTOzQ58wlcBz6f/H86IXkH4SfrQyzSKIzfgVjrKDV5lqdVzw24ZXzF11O7Kw21BMQmIn25
	nYYi9J7xYBAacnPzV2aNVhCgBgbSw==
X-Google-Smtp-Source: AGHT+IF5odAB1QjwdQJkkkMEN5c9X3lVwAl4FZyjqaJqPX0oSg+mzWZ4GANlBb9BZ679JBq96HZsccYNFVceFRq7bGk=
X-Received: by 2002:a05:6512:e85:b0:577:a108:93ca with SMTP id
 2adb3069b0e04-5905e3a0d18mr2291422e87.28.1759958080253; Wed, 08 Oct 2025
 14:14:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007213902.2231670-1-ukaszb@google.com> <20251007213902.2231670-3-ukaszb@google.com>
 <2025100821-turtle-breeder-302e@gregkh>
In-Reply-To: <2025100821-turtle-breeder-302e@gregkh>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 8 Oct 2025 23:14:28 +0200
X-Gm-Features: AS18NWBUU0yarXqlMQwKGLouBENpcwECcyFX14x8Nv4tTpsKJsA3A-Shw1Wiv1Q
Message-ID: <CALwA+Na9yNKh5Qh0sdUCZY+RgK9Bs6r8GgjFb8OBjcdm5SrV-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] xhci: dbc: allow to set serial number through sysfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 1:20=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 07, 2025 at 09:39:00PM +0000, =C5=81ukasz Bartosik wrote:
> > From: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >
> > Add code which allows to set serial number of a DbC
> > device through sysfs.
> >
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 13 +++++++
> >  drivers/usb/host/xhci-dbgcap.c                | 36 +++++++++++++++++++
> >  2 files changed, 49 insertions(+)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b=
/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> > index fc82aa4e54b0..071688dbd969 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> > +++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> > @@ -85,3 +85,16 @@ Description:
> >               up to 5000. The default value is 64 ms.
> >               This polling interval is used while DbC is enabled but ha=
s no
> >               active data transfers.
> > +
> > +What:          /sys/bus/pci/drivers/xhci_hcd/.../dbc_iSerial
> > +Date:          October 2025
> > +Contact:       =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > +Description:
> > +               The dbc_iSerial attribute allows to change the iSerial =
field
> > +               presented in the USB device descriptor by xhci debug de=
vice.
> > +               Value can only be changed while debug capability (DbC) =
is in
> > +               disabled state to prevent USB device descriptor change =
while
> > +               connected to a USB host.
> > +               The default value is "0001".
> > +               The field length can be from 1 to 63 characters.
> > +
> > diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbg=
cap.c
> > index c2fecaffd6f3..7ad83548ba4d 100644
> > --- a/drivers/usb/host/xhci-dbgcap.c
> > +++ b/drivers/usb/host/xhci-dbgcap.c
> > @@ -1200,6 +1200,40 @@ static ssize_t dbc_bcdDevice_store(struct device=
 *dev,
> >       return size;
> >  }
> >
> > +static ssize_t dbc_iSerial_show(struct device *dev,
> > +                         struct device_attribute *attr,
> > +                         char *buf)
> > +{
> > +     struct xhci_hcd *xhci =3D hcd_to_xhci(dev_get_drvdata(dev));
> > +     struct xhci_dbc *dbc =3D xhci->dbc;
> > +
> > +     return sysfs_emit(buf, "%s\n", dbc->str.serial);
> > +}
> > +
> > +static ssize_t dbc_iSerial_store(struct device *dev,
> > +                          struct device_attribute *attr,
> > +                          const char *buf, size_t size)
> > +{
> > +     struct xhci_hcd *xhci =3D hcd_to_xhci(dev_get_drvdata(dev));
> > +     struct xhci_dbc *dbc =3D xhci->dbc;
> > +     size_t len;
> > +
> > +     if (dbc->state !=3D DS_DISABLED)
> > +             return -EBUSY;
> > +
> > +     len =3D strcspn(buf, "\n");
>
> So you are requiring the \n to be there?  Why?  What tool will write it?

I'm not requiring \n to be present. The purpose of this line is to
exclude \n from
being copied.  These new fields accessible through sysfs (serial,
manufacturer, product) will be written by ChromeOS software stack.

> You don't document this in up in the documentation :)
>

I added the description of dbc_iSerial, dbc_iProduct and dbc_iManufacturer
to the sysfs-bus-pci-drivers-xhci_hcd.
What else would you like to see added there ?

> > +     if (!len)
> > +             return -EINVAL;
> > +
> > +     if (len > USB_MAX_STRING_LEN/2)
> > +             return -E2BIG;
> > +
> > +     memcpy(dbc->str.serial, buf, len);
> > +     dbc->str.serial[len] =3D '\0';
>
> As you know that buf is zero terminated, you can do a strcpy instead of
> this two-step process.  Ah, but that \n character, why not just zap it
> out if it is present?
>

I could use strcpy however I want to get rid of \n if it is present.

Thanks,
=C5=81ukasz

> thanks,
>
> greg k-h

