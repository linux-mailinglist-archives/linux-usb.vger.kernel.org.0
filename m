Return-Path: <linux-usb+bounces-25579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260BAFC6DF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 11:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA0B57AD4F7
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 09:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76014221FC9;
	Tue,  8 Jul 2025 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JCf+w27Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326673597A
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966207; cv=none; b=aDh121ueEQgcqYRPulNExI8q6BLSo5vyyJk9Y/Uxu+SY0ST9hY4VEjFtn7pB4vXGBAKgVgIE2Am9LxTf4gEwi83oOy6Oz1jH5YoZd63/0iU2OZhLf7FzxqGUggSPGPnrnBdUYCy5MbhtD3CIbwAuiVX3A6TDPz0W5w5LVLbR0ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966207; c=relaxed/simple;
	bh=oWA+jyYXTFUVOVpq0A1KhzsVCekTcqZUOlf72Qn1/FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRB3eVFgq03FTb6LIMvWlngajCo4MUOP549skfdC5UTS+v8HD10VWwgaXAxeCucpzSPRYowe0A82aNjb+Pz/8lWg/SVaIAPb9YTJRyg/7p/pldYWsM35hSDIDG0yI6LKaRgIeD6fRQUeFRiWVMjpsMJkotxtoXdt7QvHZmPkaJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JCf+w27Y; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b10594812so4998254e87.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751966203; x=1752571003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyLgLNqxZVEVrHG4u8oZzb76t/clebyyt0lejdbang0=;
        b=JCf+w27YiTmgDU/hFvLyCUoNC215NWJ9zkdJLgtdpjsmPRzR6Hr0ioHpPHm8zNT7Y6
         5sepe9IXJ0TiVjGUm0k+FpsUAiVG7FeRlmzXYKickaawWCe9S01jB9FDETxR8BvDxiez
         j4mVQ5Km1sA4L7IivaqLQ4gKm1hliP2X4Sr/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751966203; x=1752571003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyLgLNqxZVEVrHG4u8oZzb76t/clebyyt0lejdbang0=;
        b=sTuQ+v3yzOFErqjYoSBIdvAyAVkLGObc6v6s23tFxQf4i6ty33+xFU30rNH49kNSN1
         NBDfVXxPMnVE9M6kqJpWPbRlo1QTR0MYBxhho0Ppaiz4iYWaFSlf3hEEPV02Iu+i8IZh
         o8c5+tIfb4MCGY1/eAUF7oemOS8MR1KlIuWKZhvSly0sGZ8psk8ZxUQpcfhgOFqaPpDY
         yJt9tEcww0CIUxTyDU8BHMTKK3BTxmQzDgurfd1BkG95uIfAjH+ZrJ/GaMXyWoffz1Le
         HeE9cAuKXrqkdpPEgM1hMKj87nCf9rAsxd5+Ny7E+AjrUmfNfQBjhrcIrXpdw0fYalG7
         mBcA==
X-Forwarded-Encrypted: i=1; AJvYcCUidfyf/Fm0lIKSeJXDVta2B1QZcq2xyLyO7KRnIX0nt7N1Q8IPbZyPobjAPhPf1RCoTNWYxeCd3gI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTBZgTR81QmPCY66DYswnPTBi13TbnHdfGsp9p/LjP8PVL/tnB
	E8ZIuk6rC0q3GwQYAy+zkV5d4FwPrFnCAsaAZXvYXZZt0O+WXBv2jXngn+zoYjyYYvcMOlk3xnT
	mcZyPvA==
X-Gm-Gg: ASbGnctvyI8iOL2C587AnBXrjtMV2r/K6NAwwYEXZ1glQxaBT9ARJsS6T+esv+tvRhc
	Tz4QL9V+B/+zzus88rYJTHEYMQdw+O6PrmzUSEqEDorQ3qiKB0Tcu24kDTSDowuuzSS08TesNjS
	rbhMxgPd2xh1kbatEaGBaYSmT5LRsdxzkP1qXsnik7P4CCNiam+D4Ie+jbP8KYLW6+luQ6xgigT
	AlNaAbyftu9j5S9m+Ou+iW5entVQxVk8+joWH0szy9HJE1nZKsjn799xnaSo1KM4jqL4zIr+2E0
	xWfoKWe97jdP0pcsGHMeUsxYScVV1fZ9rOjshJ+bg1w/IbKBPdHR2V5xsljllzcenkMeSz9rsG9
	sDgfBtz68P90LULa7DaW/3Ed6
X-Google-Smtp-Source: AGHT+IEki5zFsxqGFXyJOHjVeHrvSfwMXubPozVilwfrL+DV4h//Z88ltXE8n9ArkHFZn0zUSZWjkw==
X-Received: by 2002:a05:6512:3d0e:b0:553:2355:1f26 with SMTP id 2adb3069b0e04-557ab01aff2mr4765754e87.50.1751966203100;
        Tue, 08 Jul 2025 02:16:43 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d333bsm1601604e87.64.2025.07.08.02.16.39
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 02:16:40 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b10594812so4998114e87.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 02:16:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWz5B85D/kyJ6KDk8Tcl02jdHXcDctsz83gnfzJIP1tbfnNdTDZbULx4RXt2K9U80SzSgU2/ITWp44=@vger.kernel.org
X-Received: by 2002:a05:6512:2386:b0:553:3407:eee0 with SMTP id
 2adb3069b0e04-557a132beb0mr6054641e87.4.1751966199327; Tue, 08 Jul 2025
 02:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-5-5710f9d030aa@chromium.org> <aGw_1T_Edm8--gXW@kekkonen.localdomain>
In-Reply-To: <aGw_1T_Edm8--gXW@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 11:16:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCup2iRx+0RcaijSmbn04nBY4Ui9=esCPFsQzOKe=up9Gg@mail.gmail.com>
X-Gm-Features: Ac12FXyzhfInZK890Wq_-YMIwMPEqs5CfSkqVHt4PZPUUwV21icplYQB7hfeIEM
Message-ID: <CANiDSCup2iRx+0RcaijSmbn04nBY4Ui9=esCPFsQzOKe=up9Gg@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] media: ipu-bridge: Use v4l2_fwnode for unknown rotations
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

Thanks for your review

On Mon, 7 Jul 2025 at 23:45, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> Hi Ricardo,
>
> On Thu, Jun 05, 2025 at 05:52:58PM +0000, Ricardo Ribalda wrote:
> > The v4l2_fwnode_device_properties contains information about the
> > rotation. Use it if the ssdb data is inconclusive.
>
> As SSDB and _PLD provide the same information, are they always aligned? D=
o
> you have any experience on how is this actually in firmware?

Not really, in ChromeOS we are pretty lucky to control the firmware.

@HdG Do you have some experience/opinion here?

>
> _PLD is standardised so it would seem reasonable to stick to that -- if i=
t
> exists. Another approach could be to pick the one that doesn't translate =
to
> a sane default (0=C2=B0).

I'd rather stick to the current prioritization unless there is a
strong argument against it. Otherwise there is a chance that we will
have regressions (outside CrOS)


>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/pci/intel/ipu-bridge.c | 30 +++++++++++++++++++---------=
--
> >  1 file changed, 19 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/i=
ntel/ipu-bridge.c
> > index 020aa52f590d66b6d333adc56ebfb9ab0561db51..6f436a8b4d23373af8a6668=
530333a827eca467a 100644
> > --- a/drivers/media/pci/intel/ipu-bridge.c
> > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > @@ -236,37 +236,41 @@ static int ipu_bridge_read_acpi_buffer(struct acp=
i_device *adev, char *id,
> >  }
> >
> >  static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
> > -                                  struct ipu_sensor_ssdb *ssdb)
> > +                                  struct ipu_sensor_ssdb *ssdb,
> > +                                  struct v4l2_fwnode_device_properties=
 *props)
> >  {
> >       switch (ssdb->degree) {
> >       case IPU_SENSOR_ROTATION_NORMAL:
> >               return 0;
> >       case IPU_SENSOR_ROTATION_INVERTED:
> >               return 180;
> > -     default:
> > +     }
> > +
> > +     if (props->rotation =3D=3D V4L2_FWNODE_PROPERTY_UNSET) {
> >               dev_warn(ADEV_DEV(adev),
> >                        "Unknown rotation %d. Assume 0 degree rotation\n=
",
> >                        ssdb->degree);
> >               return 0;
> >       }
> > +
> > +     return props->rotation;
> >  }
> >
> > -static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struc=
t acpi_device *adev)
> > +static enum v4l2_fwnode_orientation
> > +ipu_bridge_parse_orientation(struct acpi_device *adev,
> > +                          struct v4l2_fwnode_device_properties *props)
> >  {
> > -     struct v4l2_fwnode_device_properties props;
> > -     int ret;
> > -
> > -     ret =3D v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
> > -     if (!ret || props.rotation =3D=3D V4L2_FWNODE_PROPERTY_UNSET) {
> > +     if (props->orientation =3D=3D V4L2_FWNODE_PROPERTY_UNSET) {
> >               dev_warn(ADEV_DEV(adev), "Using default orientation\n");
> >               return V4L2_FWNODE_ORIENTATION_EXTERNAL;
> >       }
> >
> > -     return props.orientation;
> > +     return props->orientation;
> >  }
> >
> >  int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor =
*sensor)
> >  {
> > +     struct v4l2_fwnode_device_properties props;
> >       struct ipu_sensor_ssdb ssdb =3D {};
> >       int ret;
> >
> > @@ -274,6 +278,10 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev=
, struct ipu_sensor *sensor)
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (ssdb.vcmtype > ARRAY_SIZE(ipu_vcm_types)) {
> >               dev_warn(ADEV_DEV(adev), "Unknown VCM type %d\n", ssdb.vc=
mtype);
> >               ssdb.vcmtype =3D 0;
> > @@ -287,8 +295,8 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev,=
 struct ipu_sensor *sensor)
> >       sensor->link =3D ssdb.link;
> >       sensor->lanes =3D ssdb.lanes;
> >       sensor->mclkspeed =3D ssdb.mclkspeed;
> > -     sensor->rotation =3D ipu_bridge_parse_rotation(adev, &ssdb);
> > -     sensor->orientation =3D ipu_bridge_parse_orientation(adev);
> > +     sensor->rotation =3D ipu_bridge_parse_rotation(adev, &ssdb, &prop=
s);
> > +     sensor->orientation =3D ipu_bridge_parse_orientation(adev, &props=
);
> >
> >       if (ssdb.vcmtype)
> >               sensor->vcm_type =3D ipu_vcm_types[ssdb.vcmtype - 1];
> >
>
> --
> Regards,
>
> Sakari Ailus



--
Ricardo Ribalda

