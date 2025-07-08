Return-Path: <linux-usb+bounces-25591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B1AFCE5F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 16:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DAE6426A6F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 14:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A992E0B49;
	Tue,  8 Jul 2025 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T+q0A+tc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248542DC35C
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751986723; cv=none; b=J1nlNZnbEDIW90M9C+hmps+nsg+2a5BXO+9/3tZBXhQYoPuTRngUFS93bZd3Ko6oCUvZI2LsabcV4MrFYmwMltwWJRKoNdarfO3o4NZ/2sEx7UykUL42XaIoicbQD/M0MQ9MJCToa9yHeWEZtmvvzFzOPfCjRSP3XgY+JKDtZP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751986723; c=relaxed/simple;
	bh=HGTpVxEEJn+4Z8F/2vfMSUr1vMJyUPWvL7WDo/xrVN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbvbmE4px4f3hu/XgaPqmw6sb/iKGNpz8FWoMRVdQpyXhuvuVRTQHEA8XNpVY7nC19kiuqabVDYk7+L73FLqS/2f+/OU6JmBzAOXKn4R8D6lR0YJaTq6UEu1N9uA8npGE+oDs5gOgXk6jnzdeFHxtshu1w2fi8Hh2MU4E25T5fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T+q0A+tc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55502821bd2so4852661e87.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751986719; x=1752591519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsjEc9LmeMOTlM1N3xvojXwrwvOBpBec3I1iTp5IlDk=;
        b=T+q0A+tcLVdKzFU+yOQ0k6BaEoc5AWhk6k1MsMu1cITFtwXThAqJb3RmygaNIGf31N
         /szqbHwyxB3ZDe52XXbLvE7d0L4NhKQeysd22oYr2EbvjSnkNB7jbV82mixUCasB11aC
         TXWBvIuoqia2FREsX6TsRxkhQefcmr9IWrw38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986719; x=1752591519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsjEc9LmeMOTlM1N3xvojXwrwvOBpBec3I1iTp5IlDk=;
        b=KbGZCIgwlTrvT7Thc31DssQTiyWiKRhNE3VglaTtZZ/TBwRk2oQlRHjN94EVXAhLQZ
         bQVqaE860RwVbR7nE7Cv7rYIjMr+1Reje2RKncHeDrgWxwI461AyoqdHysBd7n3qNZll
         MpOXIWW372TNzXYOnX3GoFlqOTCvkCtWgUDDLtNrsE0xRuzTGYMU2Xyp2Yc5eS9g9b0x
         qgDyCa9Bot+FcRzs4ELfJonYSSaihKfzUbY65jtB3fNcwPJEdKnjYZrqmfd7Lb46V271
         u8WMSJzqB/P8tC6HhGzzaAwf2r9zAmBIHfpnOvBmLB2WJ/RnNIYpUQK31QWpRKWad440
         DCoA==
X-Forwarded-Encrypted: i=1; AJvYcCWxWW5Tk6gncmBWgKS2NLZrao4RPPkc4bvOhia9cGwCfXFWVljdKt3b02NievL/3a5FGUKMJxvIMGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZTM28ydme0LRLg3j6jWpsHFmkzsoRyoRrui+IVwl0pIxDTTFy
	rQ3BxJHm/9kOHx3aRWdaZ9doxvEt3OI80PTBqj3afnDOOCKap++w5hRKAmv6I6IDtpVTXu++PDG
	XeBtAw2sz
X-Gm-Gg: ASbGnctzoRqPJxJZjK5Szgg83W/Py4seCH1FIPUOjG0TASihBOOUl+dIpcsbLJaQSqB
	NqtRKrrm8DmOWiFOccFIzzRT9fDhnE4qoltTYdYGLdZIIhEsJUV4wa13r7qsVuAlHL4ss3mBvv2
	7dG74ZYmFvYLXOdVA2vTtBjdhJIZkybeTMGmfGp+uueJp6IyhVKwSgVpSnCJarmDe/cbIiMW+A4
	eNOMcaYt5UyDcgSjManl0tAysdpD+t3MpMgTeL0a9bOFVy1zgjOh3fvF49ZT8M16G/ZhDoC9tDc
	IWvW1lyI2LTDnBWsSWtCpU/SBVU9fp9zx6Gm4LE3VJSGsbrKFUiV8reuS8b8NTnL1NpbkBpcuH+
	JuGBfePfDWZUnblBTLtNdCmZsA3gVzUgsfY0=
X-Google-Smtp-Source: AGHT+IFJSvL9NAORAgvczJFPv0Lk/erFxoK+lJzkhLx57nkIDnMYHbnvg4vT83weLEIAe0P0ApKF0w==
X-Received: by 2002:a05:6512:2344:b0:553:2868:6361 with SMTP id 2adb3069b0e04-556dbe8d00bmr5144371e87.18.1751986719083;
        Tue, 08 Jul 2025 07:58:39 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494ec3sm1670920e87.119.2025.07.08.07.58.38
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:58:39 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b6a349ccso5464627e87.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 07:58:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvFjwjmhYjacF+KRC48rAsCN1weRHv9XaKUoGJyYBvA+KFjQyG/o2TWAgGoDW5WEVEKFnDZpXAIAw=@vger.kernel.org
X-Received: by 2002:a05:6512:ac8:b0:553:3028:75ae with SMTP id
 2adb3069b0e04-556de076273mr5727105e87.46.1751986718368; Tue, 08 Jul 2025
 07:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-5-5710f9d030aa@chromium.org> <aGw_1T_Edm8--gXW@kekkonen.localdomain>
 <CANiDSCup2iRx+0RcaijSmbn04nBY4Ui9=esCPFsQzOKe=up9Gg@mail.gmail.com>
 <aGzjTRSco39mKJcf@kekkonen.localdomain> <CANiDSCsqEHTnbvzLMoe_yxi8JRzp+2PQe3ksXhD=Y3+AqC_9hw@mail.gmail.com>
 <aG0NI2V0Tfh2HZ6O@kekkonen.localdomain>
In-Reply-To: <aG0NI2V0Tfh2HZ6O@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 16:58:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCu=wU_Oi7CLPcYTC3Xf_pGbDroaVitPAiAj7ND5pXy-6g@mail.gmail.com>
X-Gm-Features: Ac12FXx3zIz7eqEIVhgOFhdr-yyA-k97hK_sQ1bucetsK4DfnOnoX-8awEd9Sp8
Message-ID: <CANiDSCu=wU_Oi7CLPcYTC3Xf_pGbDroaVitPAiAj7ND5pXy-6g@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] media: ipu-bridge: Use v4l2_fwnode for unknown rotations
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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

On Tue, 8 Jul 2025 at 14:21, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> Hi Ricardo,
>
> On Tue, Jul 08, 2025 at 02:09:28PM +0200, Ricardo Ribalda wrote:
> > On Tue, 8 Jul 2025 at 11:22, Sakari Ailus <sakari.ailus@linux.intel.com=
> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Tue, Jul 08, 2025 at 11:16:25AM +0200, Ricardo Ribalda wrote:
> > > > Hi Sakari
> > > >
> > > > Thanks for your review
> > > >
> > > > On Mon, 7 Jul 2025 at 23:45, Sakari Ailus <sakari.ailus@linux.intel=
.com> wrote:
> > > > >
> > > > > Hi Ricardo,
> > > > >
> > > > > On Thu, Jun 05, 2025 at 05:52:58PM +0000, Ricardo Ribalda wrote:
> > > > > > The v4l2_fwnode_device_properties contains information about th=
e
> > > > > > rotation. Use it if the ssdb data is inconclusive.
> > > > >
> > > > > As SSDB and _PLD provide the same information, are they always al=
igned? Do
> > > > > you have any experience on how is this actually in firmware?
> > > >
> > > > Not really, in ChromeOS we are pretty lucky to control the firmware=
.
> > > >
> > > > @HdG Do you have some experience/opinion here?
> > > >
> > > > >
> > > > > _PLD is standardised so it would seem reasonable to stick to that=
 -- if it
> > > > > exists. Another approach could be to pick the one that doesn't tr=
anslate to
> > > > > a sane default (0=C2=B0).
> > > >
> > > > I'd rather stick to the current prioritization unless there is a
> > > > strong argument against it. Otherwise there is a chance that we wil=
l
> > > > have regressions (outside CrOS)
> > >
> > > My point was rather there are no such rules currently for rotation: o=
nly
> > > SSDB was being used by the IPU bridge to obtain the rotation value,
> > > similarly only _PLD is consulted when it comes to orientation.
> >
> > So something like this:?
> >
> > static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
> >                                      struct ipu_sensor_ssdb *ssdb,
> >                                      struct
> > v4l2_fwnode_device_properties *props)
> > {
> >         if (props->rotation !=3D V4L2_FWNODE_PROPERTY_UNSET)
> >                 return props->rotation;
> >
> >         switch (ssdb->degree) {
> >         case IPU_SENSOR_ROTATION_NORMAL:
> >                 return 0;
> >         case IPU_SENSOR_ROTATION_INVERTED:
> >                 return 180;
> >         }
> >
> >         dev_warn(ADEV_DEV(adev),
> >                  "Unknown rotation %d. Assume 0 degree rotation\n",
> >                  ssdb->degree);
>
> Maybe:
>
>         acpi_handle_warn(acpi_device_handle(adev), ...);
>
> ?
>
> >         return 0;
> > }
>
> Looks good to me. Maybe something similar for orientation?

Do you mean using ssdb also for orientation or using acpi_handle_warn?


I cannot find anything related to orientation for SSDB
https://github.com/coreboot/coreboot/blob/main/src/drivers/intel/mipi_camer=
a/chip.h#L150

Am I looking in the right place?

Regards!
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

