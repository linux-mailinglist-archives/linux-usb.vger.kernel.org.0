Return-Path: <linux-usb+bounces-25585-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C86EEAFCA2D
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 14:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45FDE5654D2
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 12:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7321F2DBF78;
	Tue,  8 Jul 2025 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c994YGTf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3037D2DBF48
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751976976; cv=none; b=DK/bkvtj35yAhqP9anSrwhcvYesz61qLnhwqYt8pOf/HDN2RdLs+Vf4kEqvroR7tayeBJl7SuAESdBFqlZ7RVrIH2BpJadFZzmqOH82AiZ/2Kn8Mf6gb5oEvegFBasXvjK6k6fHDw3jagip2ASB+i8GAEShYQnkpUpOUIofIJc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751976976; c=relaxed/simple;
	bh=dyXUujHTnYYHwk8qxqITJQ9BmoorGjnNWrcKqYxBG+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDfod4zm6+bJX3jDkSLE48hcYr0hElxH+o01aqxQ0emtbOftpC08vuBq+uGlvVn8CRCa34fUPGj9pzBJ83SzyNCiZXsIadHpDjvocq7ozh7qDI2zxd+ysaMeKBvUXzq2EWoBwHRqbi90eMqaJbra1XXFrDG4yOM2kdrNL1+2X9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c994YGTf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55622414cf4so3998782e87.3
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 05:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751976972; x=1752581772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMrJyzq+XGe4XZwQoy4OMfTD6mqi6tUL9Fg2sLgmdig=;
        b=c994YGTfk6XG0bMX7lmrA/UYZ3BGL7Jk6uDxJQbYPtSpVZsDBWJTdCc9vcYcMMy4wa
         fxAaK4kUWDqpKwe8wngf9JjOpucVfQ0/aJNg4lKlBykyrQ2a8l2sxF/l6acxPi7V5YTp
         GTObpByMq9JMh+L1KI0JX4L71Oglz3CWNIbss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751976972; x=1752581772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMrJyzq+XGe4XZwQoy4OMfTD6mqi6tUL9Fg2sLgmdig=;
        b=CWsR5vQbNUKfGJhjBcrtWkYyzNy+OAdp6OtxHjTRQOT+mNBOpVC5TNg8EfI+VYNX3b
         BFaWAdGH/7wh4eZ5NTNo8J0dkc5247O2DutFmaIXYXRPPmX/bJ+5PSVucaqk9Ps7QmNO
         LTQr+lml5G8FCuBtyW09YtM7z7HGnGdxSKGtSgRwHQ4QSY+wglYcVaG+HZNPRQY2+3Sm
         dlxQwB4wMdVJPZ8K6NKQZ+oAmFbYQq+vWFT4uVOl9WZgWsCqIe6KIfIpc5pa+O7f0pSG
         HeSwaL0XnQpaSI3LlKF7mIgBtTDjsN1J4jBMDw+aEq6SGl56CL6YqH4RoGB4+IA3a22h
         PWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVojAaXBns+3WN8GdWUt0DHX0l4757XzM8Zb4I8mMfk/9/0v7b6Bz9VT3rfKhkJiioizFSSgnztjDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqBGmd4PXVKP0SZLJcXG7WEBMNjksF4YXDMxk4jb/GNvBEsbw
	NtAAtlbz+m1WcYvfBRYbBEphoAawj2cJCz/f1yjgMGE+v+98lm/PbG7AwOqB1JMRL0VdlQU9NI7
	MbS3QsFDx
X-Gm-Gg: ASbGnctOzAOLexd4TQ141BKfQ8qi01s5NTeXLVDDVvYZDUSa1XpTzEHHFrgz87XmD0x
	t6CMr5Ae7sI4ykaJJ+5VWuOWY+JYuhKhhGgMjtAgoXTN17DKr93BUcbZP7BVNap/Z5i1NJhIr2A
	M22LaVMiAIWSXRMV7mUWX1IBukpPGi5h5N4zfQRrGOKRF5Dz93g0e0b+Cw0vCYFgXhuPe4+86pj
	fS4gQeawHNNYVo2aRQu+JPSw475et/Bi1tOhbo0icr8iGp7XtXSk7CooZJYjXBOmSZnNVk1UD0c
	rCWb06oZstmh9DTe6pLVtgBqdL3OWKCm/Y619hgimLJ3Axx1dknUD60RLaBIpe8SZcFro7MKNTE
	g/2tsbTcHTLpqArgE4K6EMBOzLciSXubgy4JpKmQ=
X-Google-Smtp-Source: AGHT+IERNjim3POuuxBTfZi/3HJn7/bmz6o2C1hoB+RFurYz3Y29XnsfNQleHI5TYjg1+t3BKpZHGQ==
X-Received: by 2002:a05:6512:334a:b0:553:d444:d4c4 with SMTP id 2adb3069b0e04-557f837e4e6mr957651e87.50.1751976972029;
        Tue, 08 Jul 2025 05:16:12 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494491sm1670245e87.128.2025.07.08.05.16.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 05:16:11 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b595891d2so32861401fa.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 05:16:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqFxupiysZyR3akVejdbdEmbRtinLSR0/GCBCa3JHxrId5axDcUYuKV7++5RnslLtJSN11o7OyYOI=@vger.kernel.org
X-Received: by 2002:a2e:8e3c:0:b0:32f:1c0f:fb74 with SMTP id
 38308e7fff4ca-32f39b2409amr8468421fa.22.1751976580861; Tue, 08 Jul 2025
 05:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-5-5710f9d030aa@chromium.org> <aGw_1T_Edm8--gXW@kekkonen.localdomain>
 <CANiDSCup2iRx+0RcaijSmbn04nBY4Ui9=esCPFsQzOKe=up9Gg@mail.gmail.com> <aGzjTRSco39mKJcf@kekkonen.localdomain>
In-Reply-To: <aGzjTRSco39mKJcf@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 14:09:28 +0200
X-Gmail-Original-Message-ID: <CANiDSCsqEHTnbvzLMoe_yxi8JRzp+2PQe3ksXhD=Y3+AqC_9hw@mail.gmail.com>
X-Gm-Features: Ac12FXyPY8jp6OO5y2rUkBGCgm071L0BZh3437cx12a8IP9Dnshn9sW-VSnuQ7c
Message-ID: <CANiDSCsqEHTnbvzLMoe_yxi8JRzp+2PQe3ksXhD=Y3+AqC_9hw@mail.gmail.com>
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

On Tue, 8 Jul 2025 at 11:22, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> Hi Ricardo,
>
> On Tue, Jul 08, 2025 at 11:16:25AM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > Thanks for your review
> >
> > On Mon, 7 Jul 2025 at 23:45, Sakari Ailus <sakari.ailus@linux.intel.com=
> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Thu, Jun 05, 2025 at 05:52:58PM +0000, Ricardo Ribalda wrote:
> > > > The v4l2_fwnode_device_properties contains information about the
> > > > rotation. Use it if the ssdb data is inconclusive.
> > >
> > > As SSDB and _PLD provide the same information, are they always aligne=
d? Do
> > > you have any experience on how is this actually in firmware?
> >
> > Not really, in ChromeOS we are pretty lucky to control the firmware.
> >
> > @HdG Do you have some experience/opinion here?
> >
> > >
> > > _PLD is standardised so it would seem reasonable to stick to that -- =
if it
> > > exists. Another approach could be to pick the one that doesn't transl=
ate to
> > > a sane default (0=C2=B0).
> >
> > I'd rather stick to the current prioritization unless there is a
> > strong argument against it. Otherwise there is a chance that we will
> > have regressions (outside CrOS)
>
> My point was rather there are no such rules currently for rotation: only
> SSDB was being used by the IPU bridge to obtain the rotation value,
> similarly only _PLD is consulted when it comes to orientation.

So something like this:?

static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
                                     struct ipu_sensor_ssdb *ssdb,
                                     struct
v4l2_fwnode_device_properties *props)
{
        if (props->rotation !=3D V4L2_FWNODE_PROPERTY_UNSET)
                return props->rotation;

        switch (ssdb->degree) {
        case IPU_SENSOR_ROTATION_NORMAL:
                return 0;
        case IPU_SENSOR_ROTATION_INVERTED:
                return 180;
        }

        dev_warn(ADEV_DEV(adev),
                 "Unknown rotation %d. Assume 0 degree rotation\n",
                 ssdb->degree);
        return 0;
}




>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

