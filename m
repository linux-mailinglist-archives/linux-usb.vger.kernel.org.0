Return-Path: <linux-usb+bounces-29254-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8044BD699A
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 00:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6A8BF350050
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEB32FB991;
	Mon, 13 Oct 2025 22:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G3NN90br"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE772FB968
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 22:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760393994; cv=none; b=IPDqT3yvmuzF9N5TapXu3iMNFLp2tVel7sg1QIrAliw/sgGBJ29Cos5XK/jrpmrLepr4dS1T3JmVhEqPvGoXXgw/zyPMkxHPgN8vfQrc2PgQgXPFotlZvoamoC41vJ64PK/3Qr4la2n5b3w+Pm/ICaVbHNuTP0ZhVhYwdmGaFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760393994; c=relaxed/simple;
	bh=mZuqMTKdHGlTL2V9Bb5aDB8rjNEV061y5CBIUnWPOVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujWBUDFQXJbVlC4yUuEyTH4mmc57i6vn+51B6y10MYDNMMUTQ0d2E4wbmbbu1wCBUQAaTJ0PYsI4tK7qzQay62rRxotfJIvunL9M6hBeBU+hd+s89oiCwg4VN4D5liInjEgpHXayFrXO2vaR1vvoqSRVvySDGyIauOC3mBjs+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G3NN90br; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso53933461fa.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 15:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760393990; x=1760998790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiF6W6Gs68QlMinf7qm0ii5UKA69FI9/hs8jKcNv8Zw=;
        b=G3NN90brcW6H+Bsj51Fkua0MEdqrbs+sVrC2J2bCBuz2yAQaUuTrWbLPluSmfHmgGY
         gL9C9DLwCqhErWV6XEa0D6/GzGC6Z6C3HdblIJ617Kgax8T6Ccuw88dY8CON8/Vv2Myw
         hvi+YfWOfNCx02I1qH9UtqIyjLTIOAbQTZ6ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760393990; x=1760998790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiF6W6Gs68QlMinf7qm0ii5UKA69FI9/hs8jKcNv8Zw=;
        b=xA1dSiTNyMd/mke9Yz5nf6HM2VJlzz5RJtzbXW+oYNSyawJVnctT3MtgoXFcIbK1WX
         9UnFgVYjrKAy7BtUQ0PxQ++nJR7VQfu3yxLsrmduX67DIpJCHMAUx4kpFDxo0ZUc7nUB
         84KvBd9TiKDhEVwmIKrFFmcIFRrWux5MIf7Xm4JbB5P1PSEy+WHCVzvnBolncHNjvYty
         tg8SB8wEtoO9+ZfwlXPYR2iLvxNNva31aS4gLQEbNqm7b/EUyXCL/EmRoMw/vSb3Ka4G
         ARtJI+SJ9H/z0DsBylQyBL/AD2Y5Y8qqxR8gQnhuF3fDaqSJdRt39u+t8thv4+HklSAp
         qNAg==
X-Forwarded-Encrypted: i=1; AJvYcCUxhwGo1vY9pL13u3cAr6dFYuO0kAJDP2a5BNOPyBDv2HxN1w2nJlDHX8Tf8t7P2uasQch9NQCFJ1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTy9Kghi8vaJfDnV9XS8GubIceZ9SFdvRRsPd3bIojpe9X+mo5
	eLGfSfO7KsRcUdtR67x3LKh2Ib30W2OMKAqxfBruM0n0AVaX+QhvEr8wRb1J9/6Kh60mrPHSsd8
	nhOgCwTlMNVHapwIo7/Sj2owIJM6iI5mqPDi/HEVWBh4l9J53PpCy
X-Gm-Gg: ASbGncuTVv8POEXuHmrpHU29NZDgUlxBG+JHW4nyGCgtnl/zH+3jO+wpG+c3TxBTH3x
	mQ8gKBNb0MD9vbEfzeQhUtDnwfovKSwnLsKNifmRDscbKqoLIPX2Je2Z6qP+4h8MHGk5e/Uknpz
	SqBGNy/l7Dt5bmvJfgL5NcQc+MvUaooxQYBB8ubUKMaUMfx9A9hBva0Wm0w2YVx9csYyc4AGRS8
	rs6jxpkk6LLNUXtejsSRnU=
X-Google-Smtp-Source: AGHT+IEBx/atucZwCamn/2QVINvn5tdC9ytJerHpW2k9oM0/z967rz2DdbWQqCJ834Qt3jzYs9oNZwN+qU3Cr6Usf/w=
X-Received: by 2002:a05:651c:50b:b0:336:8dcf:1742 with SMTP id
 38308e7fff4ca-375f524d9b7mr72141661fa.12.1760393989977; Mon, 13 Oct 2025
 15:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007213902.2231670-1-ukaszb@google.com> <20251007213902.2231670-4-ukaszb@google.com>
 <e73344be-0434-436b-be9b-e86f62d377a3@linux.intel.com>
In-Reply-To: <e73344be-0434-436b-be9b-e86f62d377a3@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 14 Oct 2025 00:19:38 +0200
X-Gm-Features: AS18NWCNlQn4HgdlDdEeTZC4uthTspsA6oxbqOWSAubJFQWDgwyxyweRABATYyw
Message-ID: <CALwA+NYqUtNMVH74z=ALSBw1HUNzH1_-7UC-8dqeRfVdFCP4Jw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] xhci: dbc: allow to set product name through sysfs
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 11:01=E2=80=AFAM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 10/8/25 00:39, =C5=81ukasz Bartosik wrote:
> > From: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >
> > Add code which allows to set product name of a DbC
> > device through sysfs.
> >
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >   .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 11 ++++++
> >   drivers/usb/host/xhci-dbgcap.c                | 36 ++++++++++++++++++=
+
> >   2 files changed, 47 insertions(+)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b=
/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> > index 071688dbd969..57ba37606f79 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> > +++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> > @@ -98,3 +98,14 @@ Description:
> >                  The default value is "0001".
> >                  The field length can be from 1 to 63 characters.
> >
> > +What:          /sys/bus/pci/drivers/xhci_hcd/.../dbc_iProduct
> > +Date:          October 2025
> > +Contact:       =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > +Description:
> > +               The dbc_iProduct attribute allows to change the iProduc=
t field
> > +               presented in the USB device descriptor by xhci debug de=
vice.
> > +               Value can only be changed while debug capability (DbC) =
is in
> > +               disabled state to prevent USB device descriptor change =
while
> > +               connected to a USB host.
> > +               The default value is "Linux USB Debug Target".
> > +               The field length can be from 1 to 63 characters.
> > diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbg=
cap.c
> > index 7ad83548ba4d..bc782f6b533e 100644
> > --- a/drivers/usb/host/xhci-dbgcap.c
> > +++ b/drivers/usb/host/xhci-dbgcap.c
> > @@ -1200,6 +1200,40 @@ static ssize_t dbc_bcdDevice_store(struct device=
 *dev,
> >       return size;
> >   }
> >
> > +static ssize_t dbc_iProduct_show(struct device *dev,
> > +                              struct device_attribute *attr,
> > +                              char *buf)
> > +{
> > +     struct xhci_hcd *xhci =3D hcd_to_xhci(dev_get_drvdata(dev));
> > +     struct xhci_dbc *dbc =3D xhci->dbc;
> > +
> > +     return sysfs_emit(buf, "%s\n", dbc->str.product);
> > +}
> > +
> > +static ssize_t dbc_iProduct_store(struct device *dev,
> > +                               struct device_attribute *attr,
> > +                               const char *buf, size_t size)
> > +{
> > +     struct xhci_hcd *xhci =3D hcd_to_xhci(dev_get_drvdata(dev));
> > +     struct xhci_dbc *dbc =3D xhci->dbc;
> > +     size_t len;
> > +
> > +     if (dbc->state !=3D DS_DISABLED)
> > +             return -EBUSY;
> > +
> > +     len =3D strcspn(buf, "\n");
> > +     if (!len)
> > +             return -EINVAL;
> > +
> > +     if (len > USB_MAX_STRING_LEN/2)
> > +             return -E2BIG;
> > +
> > +     memcpy(dbc->str.product, buf, len);
> > +     dbc->str.product[len] =3D '\0';
> > +
> > +     return size;
> > +}
> > +
> >   static ssize_t dbc_iSerial_show(struct device *dev,
> >                           struct device_attribute *attr,
> >                           char *buf)
> > @@ -1321,6 +1355,7 @@ static DEVICE_ATTR_RW(dbc);
> >   static DEVICE_ATTR_RW(dbc_idVendor);
> >   static DEVICE_ATTR_RW(dbc_idProduct);
> >   static DEVICE_ATTR_RW(dbc_bcdDevice);
> > +static DEVICE_ATTR_RW(dbc_iProduct);
> >   static DEVICE_ATTR_RW(dbc_iSerial);
> >   static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
> >   static DEVICE_ATTR_RW(dbc_poll_interval_ms);
> > @@ -1330,6 +1365,7 @@ static struct attribute *dbc_dev_attrs[] =3D {
> >       &dev_attr_dbc_idVendor.attr,
> >       &dev_attr_dbc_idProduct.attr,
> >       &dev_attr_dbc_bcdDevice.attr,
> > +     &dev_attr_dbc_iProduct.attr,
>
> Small naming thing again.
>
> "dbc_idProduct" and dbc_iProduct" are a bit too similar.
>
> Usb core uses "product" and "manufacturer" sysfs entries to show these st=
rings.
> I think dbc should use similar "dbc_product" and "dbc_manufacturer" namin=
g.
>

I will rename it in patchset v3.

> the "iProduct" is a byte in device descriptor telling the index of the pr=
oduct string
> descriptor.
>

The same applies to iSerial then. Should I rename it to "dbc_serial" as wel=
l ?

Thanks,
=C5=81ukasz

> Thanks
> Mathias
>

