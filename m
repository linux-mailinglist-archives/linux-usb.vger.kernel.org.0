Return-Path: <linux-usb+bounces-19125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16874A055CF
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 09:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE223A6ADD
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 08:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9BF1F0E33;
	Wed,  8 Jan 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EAvvXVtY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E8C1E3DF2
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736326313; cv=none; b=JuZ4NKdAitHJTQQd+W6neeIYFeUUCEkVwy0XvpNb9wBROT0+uQxn92QTk9xVSldlpybCUtkp3tTsPHvUVY9UNaUNPxgkrSFeGyXqXiqWz+rta/0W+kXjcKgZGXKpgUG/6gPCBlWFXOCY5s2d9edhOt1xLxOgYcu7w0XUo2NYhIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736326313; c=relaxed/simple;
	bh=fJq7ros3YcEqXnW8lhic7CNgUrTijyQuFS6oBYRXqyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owalLB27Yg14DmiEpIMYPMwghtvnCinpFY2Q7gUiwmMZWTvF3I++i1uR/8nr8dUxK9ahnw1o1QN0NY8tZr8t9O6b3lpUXftAELsSlF9C03DOk7PjUkr0+zusvSIpAXQmwzfjAZGfMRzxyGtcyFO4hIYNzQr92ikB/9cu9oVjLlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EAvvXVtY; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540215984f0so17006468e87.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 00:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736326309; x=1736931109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbZVTJDWZ7xlQNj3S58PwFTZA9cCGUupjUxBClEpIns=;
        b=EAvvXVtYLg52czkbUTKtD++4PMlyt+f98gZ1u/rCt1MVjwo4s2SZn35sNKcPKDR1+G
         41Yk4gJ2C49CWwEvsaakUI2YGHFhr7NQz32SjRsVJ36d7LESO9a1VJZFQv/K24D/29AX
         i5m5aMUM5AscpkVlz58eym9/ISthqugGD8Vj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736326309; x=1736931109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbZVTJDWZ7xlQNj3S58PwFTZA9cCGUupjUxBClEpIns=;
        b=QBvXd5D9uTCbVkE1j3uUIII6prq4HO0a5Eui7KIfQ3NxTiWfkHe4nRx+uOlVdEY5wL
         2iLgxH/mfktYYHulVXYxLK9L064Sm32h7uZvm7JwqUgfxVYDZtjZd38s+lboNzHOeyH8
         O+IuCGb3pdQC+IALk23QyjVRjpfkwt9oT3UdLbRXwvC2obP+03eJHPSMGZDNJwgDHE2J
         +rP5iEyrAa/ppE+MOzoaqCAmzylFOLX2Gw2eLdiJFLkR9k47ywCCbDGq7ksKDv033ffm
         IwklZj4DDv+vs+z/LZPISn+k72h70E6Vwn7ddMzo/w8Gc55CDTe7GH/NzFdrD8dKfL0W
         0M3A==
X-Forwarded-Encrypted: i=1; AJvYcCV73tvMV+9POIRNY2J/aS7SS5V3Of0F4hNFaKoWWP/jSK7ajiBepAFL7ByG8ekSk/lFfEuvhyfRmWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkwRigK900CUDEAJmiouRTWmGBW37239AvABvTGqW/QgCVPcDc
	Gcfk0fQ8orVSduQ7mLmufKzWfUqSdR3tfKI8YLOnekwEawXox8Vh0WF6jXLtIqQcC55xNutL/x8
	6sQ==
X-Gm-Gg: ASbGncucDCpx4ozy7WRLxaS0HyHSqdaA115tXPk12b+uWdKe6AYRfUxwh3TEO0l7e1k
	YBwYQlf4VQsTHy5GnJb6bS9wfBfLUEI01avaa70/rm4KzYempKaAEFemQIOwvqZk76aEyoLK/pq
	ZGYhezhqnNuIdm5TtX9XkRNSWuV/y0UsXdTbMpLRR4zp9MSQ9jG69l2IQnfmZSqbEdtj1EhC0ky
	Bn3aDk1889Xk6m7W8B+vC0ozoo5hIMj29oKUB85J56xV8QhDouqxeAEd7ymzw6QZ4EahYzShtHm
	UDgIqoN/Xz/Fb3KscQ4=
X-Google-Smtp-Source: AGHT+IGXnz+KbcW2YlT3JM+DURMSmQmfpnzmYa4Bk5LW+kpNiBV5RcSkplEc74d4oqKizz0OwRelOA==
X-Received: by 2002:a05:6512:1382:b0:542:2388:3f0d with SMTP id 2adb3069b0e04-54284815c9emr424860e87.45.1736326309246;
        Wed, 08 Jan 2025 00:51:49 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54244e19cdbsm3527182e87.132.2025.01.08.00.51.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 00:51:47 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540215984f0so17006414e87.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 00:51:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/ubUn36WP9jmJ9/gNyMpj5c6s9MWQZdO/VF1AWu8A1eoLq+wAH47/X3xzcIJX4nL8GajhUmUexrM=@vger.kernel.org
X-Received: by 2002:a05:6512:1392:b0:542:24c8:e062 with SMTP id
 2adb3069b0e04-54284815bc4mr514545e87.44.1736326306832; Wed, 08 Jan 2025
 00:51:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org> <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org> <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
 <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
 <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com> <Z347NA00DMiyl1VN@kekkonen.localdomain>
In-Reply-To: <Z347NA00DMiyl1VN@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 8 Jan 2025 09:51:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCs37N79MnFZxvBJn2Jw3062EdLRuVP4EkJVfJcfMMuPAg@mail.gmail.com>
X-Gm-Features: AbW1kvan1zyHFQY9XbZwCJKxWjOop6P67-eXGqvGZTUi5VkdEAJc4fptoroNTdc
Message-ID: <CANiDSCs37N79MnFZxvBJn2Jw3062EdLRuVP4EkJVfJcfMMuPAg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jan 2025 at 09:45, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> Hi Ricardo,
>
> On Tue, Jan 07, 2025 at 11:37:18AM +0100, Ricardo Ribalda wrote:
> > On Fri, 20 Dec 2024 at 23:00, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Dec 19, 2024 at 6:42=E2=80=AFAM Ricardo Ribalda <ribalda@chro=
mium.org> wrote:
> > > >
> > > > On Thu, 19 Dec 2024 at 13:24, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> > > > > > Hi Rob
> > > > > >
> > > > > > On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wro=
te:
> > > > > > >
> > > > > > > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wro=
te:
> > > > > > > > For some devices like cameras the system needs to know wher=
e they are
> > > > > > > > mounted.
> > > > > > >
> > > > > > > Why do you need this and why only this property and not the d=
ozens
> > > > > > > others ACPI has?
> > > > > >
> > > > > > Userspace needs that information to correctly show it in the UI=
. Eg;
> > > > > >
> > > > > > - User facing camera needs to be mirrored during preview.
> > > > > > - The user facing camera is selected by default during videocon=
ferences
> > > > > > - The world facing camera is selected by default when taking a =
photo
> > > > > > - User facing camera have different parameter defaults than wor=
ld facing.
> > > > >
> > > > > We already have "orientation" defined for this purpose.
> > > >
> > > > Do you mean orientation from
> > > > bindings/media/video-interface-devices.yaml ?
> > > >
> > > > I see a couple of issues:
> > > > - Orientation has a very specific meaning for USB typeC. I'd prefer=
 if
> > > > we could avoid using that word.
> > >
> > > Yes, but this is tied to the class of the device, not the bus. I find
> > > defining the position for USB devices confusing.
> > >
> > > > - For other applications different than cameras it might be useful =
to
> > > > know the positions top, bottom, left, right, which are not availabl=
e
> > > > in video-interface-devices
> > >
> > > Other devices may need some of the 20 other properties in the ACPI
> > > table as well.
> > >
> > > > - The value "external" does not makes too much sense for listed usb=
 devices
> > >
> > > Then don't use it.
> > >
> > > > - It makes our lives easier if dt and acpi have the same meaning (l=
ess
> > > > conversion)
> > >
> > > We have little to no input into what ACPI does. If we're just going t=
o
> > > copy ACPI, then just use ACPI instead.
> > >
> > > > All that said, for my specific usecase, reusing orientation from
> > > > bindings/media/video-interface-devices.yaml works... So if that is
> > > > what you all prefer I can send a v2 with that.
> > > > Let me know what you think
> > >
> > > We already have something for cameras. Use it.
> >
> > So you are proposing a change like this?
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > index da890ee60ce6..5322772a4470 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > @@ -37,6 +37,10 @@ properties:
> >        but a device adhering to this binding may leave out all except
> >        for "usbVID,PID".
> >
> > +  orientation:
> > +    description: If present, specifies the orientation of the usb devi=
ce.
> > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orie=
ntation
>
> Do you need this for a camera or for other kinds of USB devices, too?
>
> What about e.g. the rotation property?

I need it for cameras. I do not have a usecase for rotation now, but I
might have in the future.

>
> > +
> >
> >
> >    reg:
> >      description: the number of the USB hub port or the USB host-contro=
ller
> >        port to which this device is attached. The range is 1-255.
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

