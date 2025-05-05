Return-Path: <linux-usb+bounces-23736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7DAA9D46
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 22:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021801A80B16
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 20:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3021627054C;
	Mon,  5 May 2025 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="COOpByAv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFB41DEFC5
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477275; cv=none; b=KDi0qFhee9efYXxfEUIpW3aOeOFS66fnBtQEHSBeV67NgT63rG71ROOBunrA+PdTcp4RVglO+vssNTE+3UsMWHwgrGcnocLhDrMiQaJMG0ObkWcFE6OAEz78L3MSpmPHAsU6APNvsa/b0H7D97drs3CS5dAYzXP47zKMFNR4mXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477275; c=relaxed/simple;
	bh=eXsbeYaStEdVkB/9iiuPPvCcb0GJ33j+Y7Lm4GpCn+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifRKKrsPU4sBtCB9PQjlJNYnRy0YVOzZDoLP+xjU+5uwD7KSagHL/szhe/Zkuss9jVnYh0mI72RW2DeeZHUc6Tdgi2D67Eq4ezLhGjUl7z+zWtTfKOtFKbYYl3ZojArV5IzLtTT7B2tdJ3BiN6xK+d4LOabbJOjCxloTF/jHXLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=COOpByAv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54e816aeca6so6221685e87.2
        for <linux-usb@vger.kernel.org>; Mon, 05 May 2025 13:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746477272; x=1747082072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aad+O7LlnePo9Jud5k6L+0x2zxiP/d5GA/t21nuBedc=;
        b=COOpByAv0LfDVqP8oj7pO3PZx6y7+sxjV85DLkW65znPUdJNTktz47RUTlfBdPwZFk
         NyiNZrfJ7tqN3UdpTa6MElLncalkaE/vvNG/0TMpetH2v9t4X1lP1q2/vXpEudNiP/te
         Tp0PUtiP6WgmLnm8/b7jWIf6MHGfuM6JnCbCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746477272; x=1747082072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aad+O7LlnePo9Jud5k6L+0x2zxiP/d5GA/t21nuBedc=;
        b=GNkUrPEGYetGZttpIVHloS2VJ7BT6cZzX+eMKDJ9nxMb3wq7+HyZv1yVlbL5pHNcD8
         jWSQaXNMYOtHsyAlry6k4mKA94TvLJZQCPpIQuLMQHP9GPesDxt/S6n3H39po6GEwkEb
         jP4X9qtKgI10NS/IKBkT3Veh9BIlCbTO0lhzb+v3NyEIv2vDWjpJ0+UqPMiDFSXNxC3G
         dwcePudCFwkBu3RlgRAsONio/A84FkqHXFrZs2IVIOeqbiZiCBpJpcsVhnIV5hnQH+Wi
         DBLw3U3QyxxP6SBUe6XXLmSddX2ptHzlbSWYBn9y8dUvAY3mAZ0ACg6lmrtlbcHbrESV
         tquw==
X-Forwarded-Encrypted: i=1; AJvYcCVj8+bBjO8u8s3tRxerNHZTp2IjVat6JtxGhUMxpZfBL4Cd0iZ6A5UggI8LB8C3eTa04imyx4LWYyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfd/TqYCp1Xv8R85rAOkWHTSkDuNdaOsWwtOGSNuNsnLVHXyWI
	jPiZygT7+gVoSUxvf2h1BQnnlERHoxehE5B/GKR5sUq2HuUBQwmjz9SYWrEz66eWnWGBULSrz/0
	=
X-Gm-Gg: ASbGncs3Gs+VTfhDQ329U9MPN0dWhbQykhU/Gq7c+BNuR0deR6a16lfSN8LY4tCaUZA
	xlJiEF5U/q/BrfGTVptp66MwPQcCj5xbtx5CHgk15kM20MPmzw+AHE7XDaoiywn3JcJjMzuIp0+
	Sf/qST8nW5ROOnALXM17VDtzuNc5Icd3Zz1k28Cv0D3kykx43kJaUCef07l3aHx5dBACI+8aMHM
	uDCS1aTWBBWqUKwPRf1pNAJ+BERX1G9XUyz1TVuiPwVY68Q1sw6TUQgaqPQ2mKX8AAVSzbKBmIe
	n5AffAwx/8GiU8lsfPqo4tBhuMY559uWm0Dzs/iAGJ0nfSno7nG+JZ/sNcaLeG3KJiHGM/B5iNQ
	KHby910k=
X-Google-Smtp-Source: AGHT+IH1pyJ8gWLSroJlwqUeQnJ0EF0Oo0iDbzF4Fmn6G1kMcC25n1v2g8doqCzBpcm342raiDdZ9Q==
X-Received: by 2002:a05:6512:3f21:b0:54e:8222:7311 with SMTP id 2adb3069b0e04-54fb4a97772mr131919e87.39.1746477271636;
        Mon, 05 May 2025 13:34:31 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f21a8sm1803694e87.197.2025.05.05.13.34.28
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 13:34:30 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30de488cf81so50136041fa.1
        for <linux-usb@vger.kernel.org>; Mon, 05 May 2025 13:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGhHZrwd8SLcWhC1Bzah8I9ztPytzHixnQ6XszkSCUleq41ABkF0a12IgsIrTUnRmYq2XTmXCtezk=@vger.kernel.org
X-Received: by 2002:a05:651c:b2a:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-3266b59789emr751721fa.10.1746477268328; Mon, 05 May 2025
 13:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org> <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
 <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
 <dd471b51-333b-4537-ac58-29ad2a10f1e2@redhat.com> <aAdkU65ruBfyRjss@valkosipuli.retiisi.eu>
In-Reply-To: <aAdkU65ruBfyRjss@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 May 2025 22:34:16 +0200
X-Gmail-Original-Message-ID: <CANiDSCt5_HwfwXDWNGWvzkSAW2ZB4PJwS00=i0EizY_3A-OSgw@mail.gmail.com>
X-Gm-Features: ATxdqUEg2rUAsN7TYo98ElSvRXDzyBQACXaWg80nr6xGofF6c5WfqBKJm9vPYRM
Message-ID: <CANiDSCt5_HwfwXDWNGWvzkSAW2ZB4PJwS00=i0EizY_3A-OSgw@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

On Tue, 22 Apr 2025 at 11:41, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Hans, Ricardo,
>
> On Tue, Apr 22, 2025 at 10:44:41AM +0200, Hans de Goede wrote:
> > Hi Ricardo,
> >
> > On 22-Apr-25 2:23 AM, Ricardo Ribalda wrote:
> > > Hi Sakari
> > >
> > > On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrot=
e:
> > >>
> > >> Hi Ricardo,
> > >>
> > >> Thanks for the patch.
> > >>
> > >> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
> > >>> This patch modifies v4l2_fwnode_device_parse() to support ACPI devi=
ces.
> > >>>
> > >>> We initially add support only for orientation via the ACPI _PLD met=
hod.
> > >>>
> > >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>> ---
> > >>>  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++=
++++++++----
> > >>>  1 file changed, 52 insertions(+), 6 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/=
v4l2-core/v4l2-fwnode.c
> > >>> index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1=
c96f2a5ede3fa9d64dab3 100644
> > >>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > >>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > >>> @@ -15,6 +15,7 @@
> > >>>   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > >>>   */
> > >>>  #include <linux/acpi.h>
> > >>> +#include <acpi/acpi_bus.h>
> > >>>  #include <linux/kernel.h>
> > >>>  #include <linux/mm.h>
> > >>>  #include <linux/module.h>
> > >>> @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwn=
ode_handle *fwnode,
> > >>>  }
> > >>>  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> > >>>
> > >>> -int v4l2_fwnode_device_parse(struct device *dev,
> > >>> -                          struct v4l2_fwnode_device_properties *pr=
ops)
> > >>> +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > >>> +                                      struct v4l2_fwnode_device_pr=
operties *props)
> > >>> +{
> > >>> +     struct acpi_pld_info *pld;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld=
)) {
> > >>> +             dev_dbg(dev, "acpi _PLD call failed\n");
> > >>> +             return 0;
> > >>> +     }
> > >>
> > >> You could have software nodes in an ACPI system as well as DT-aligne=
d
> > >> properties. They're not the primary means to convey this information=
 still.
> > >>
> > >> How about returning e.g. -ENODATA here if _PLD doesn't exist for the=
 device
> > >> and then proceeding to parse properties as in DT?
> > >
> > > Do you mean that there can be devices with ACPI handles that can also
> > > have DT properties?
> >
> > Yes it is possible to embed DT properties in ACPI, but I don't
> > think that is really applicable here.
>
> This is determined by
> Documentation/firmware-guide/acpi/DSD-properties-rules.rst . So rotation
> and orientation shouldn't come from _DSD properties on ACPI systems.

Doesn't this contradict what DisCo does?


if (!fwnode_property_present(adev_fwnode, "rotation")) {
struct acpi_pld_info *pld;

if (acpi_get_physical_device_location(handle, &pld)) {
swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_ROTATION)] =3D
PROPERTY_ENTRY_U32("rotation",
   pld->rotation * 45U);
kfree(pld);
}
}

It seems to first check for the rotation property, and then check _DSD.

If I send a v2, shall I also replace DisCo even if that means
reverting its logic?


>
> >
> > But we also have secondary software-fwnodes which are used
> > extensively on x86 to set device-properties on devices by
> > platform code to deal with ACPI tables sometimes having
> > incomplete information.
> >
> > For example atm _PLD is already being parsed in:
> >
> > drivers/media/pci/intel/ipu-bridge.c and that is then used to add
> > a standard "orientation" device-property on the sensor device.
> >
> > This is actually something which I guess we can drop once your
> > patches are in, since those should then do the same in a more
> > generic manner.
>
> DisCo for Imaging support currently also digs this information from _PDL
> (see init_crs_csi2_swnodes() in drivers/acpi/mipi-disco-img.c), but this
> is only done if a _CRS CSI-2 descriptor is present. It could also be done
> for devices with the IPU Windows specific ACPI objects and it would be a
> natural location for handing quirks -- there are some
> unrelated Dell DSDT quirks already.
>
> >
> > > What shall we do if _PLD contradicts the DT property? What takes prec=
edence?
> >
> > As for priorities, at east for rotation it seems that we are going
> > to need some quirks, I already have a few Dell laptops where it seems
> > that the sensor is upside down and parsing the rotation field in
> > the IPU6 specific SSDB ACPI package does not yield a 180=C2=B0 rotation=
,
> > so we are going to need some quirks.
> >
> > I expect these quirks to live in the bridge code, while your helper
> > will be called from sensor drivers, so in order to allow quirks to
> > override things, I think that first the "orientation" device-property
> > should be checked (which the ACPI glue code we have can set before
> > the sensor driver binds) and only then should _PLD be checked.
> >
> > IOW _PLD should be seen as the fallback, because ACPI tables are
> > often a copy and paste job so it can very well contain wrong info
> > copy-pasted from some example ACPI code or from another hw model.
>
> Unfortunately that does happen. :-(
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

