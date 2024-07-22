Return-Path: <linux-usb+bounces-12320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD3D938AA0
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 10:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFD521C20ECB
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 08:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C421607BF;
	Mon, 22 Jul 2024 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lcutFeZx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9362F17C6C
	for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721635322; cv=none; b=RfcejVjyIvVB/gnqmouc3vR9SfMsc2A960+RlIV4Mz5yRoDgZm6qMJiUqSAqPJeG83bycMO0GKt3FDV4qxC9Dhj+mee+r8voKIu8iAYdhLru3XyVHCSW14W77CLnsR2rUDu99a/EZE9xcgD0krfuy97woxjAvcRYToeFteb3HxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721635322; c=relaxed/simple;
	bh=0BirbRm+kgTZ/6PSUV3ulLz8ivD6qWRaU/XrHJu0rnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdcioxVZ2Bn/NnfQ5YLhPe2Py6x9YSjUW8/UX7h3zCWS7L1D6XwtJmACyLoCcGoZxyMUYCyzD33teuOcYcC1wzd+G677kAs8l3BIa0g8uWVrqem5n+LS5sDcta+IJxRdm5VERnIpMCrwEzIsGCNzOxvcBc6cCXdahS42vzg9CXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lcutFeZx; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso3261676a12.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721635319; x=1722240119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6b/8hE5ThHqalqFhzwrKVICTF1CGDaYIS8tWzxne3NU=;
        b=lcutFeZxYEd4dguTz0HwjpqkaHnejazo+8ZxlY6mgmsVwsiNvEUKBcwnLPGh9TDtOX
         GI+ScVA39cnrfTw40mtftShc55CBKidzUT4eGpNf12/tEwnikJZIIN6EOhCwGYtgAqjw
         i5LdPWqFBGvaUhyg4n44ajzK6MB85Cl7bNiYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721635319; x=1722240119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6b/8hE5ThHqalqFhzwrKVICTF1CGDaYIS8tWzxne3NU=;
        b=S3k7k8D0Z89mwLKtOwVDKO6+Um5wTxWCP20CUFUemXF8AEWUTZ3Dbg8KbS+dV9U7qu
         qQQCi1yb502dOuVuxLxmSzvv7YLMEUagWMC1ZS98yQmNQdHc+VgjWTqLjInXLWwhBqah
         6MQsL5ukQ+TCfWXSGYnCGVrPVxSUwONKV5Fa4QQrb7xN9JjO1kZ5Q1ZN4J6F1LXgqsh1
         gO2lU1z24RO07wJQsjD64zTTiEl+DTcYfZoZ7w9xGKCIU7XumYylD/aNda7lf0350drB
         F3OnhLKdrysUMx18DM8SDP8cYwaUTN3DE/m5n402XuC+42UGmYMx45Q/y6lceh2yyRSo
         8ivw==
X-Forwarded-Encrypted: i=1; AJvYcCVdmf5mVMp+BaxfIenRAwHs2/yhhy4OVLqeMw626A7RgeE8s6hAveJmxyP+Nru7QQc1Ztk4YlvtA63DZE1saeT5eJY0xQXFRApP
X-Gm-Message-State: AOJu0Yy6jkOcZjDFxLaWmaXIEtkXJ5wvgMTTDgF8Wt6dsUEUK3LlFNFb
	/BvbdClehbYyUMSZMGsPX7UQs7LqcThJkcIMHbBo5vcIEDms9O75SbDn/npCWBjAJEKwT1cy3JI
	Q1w==
X-Google-Smtp-Source: AGHT+IE/dKRTpX6JWmLX5rPA35Dlh6cjRrwqgZ4BI51/Kvr7znsCClK4L2DGBQIEMVHxylnGtl57Nw==
X-Received: by 2002:a50:cd13:0:b0:5a1:a36a:58ba with SMTP id 4fb4d7f45d1cf-5a479b6dcc3mr3967684a12.20.1721635318886;
        Mon, 22 Jul 2024 01:01:58 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f88ecsm5664851a12.63.2024.07.22.01.01.57
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 01:01:58 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso2301156a12.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 01:01:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcO16sj3/tuIl1QMr3P3e9ImkpI5Yw9An8jf/JmeKrZ0oRIugos8PiuXlxEU0sq4uxwsc2H/aN5Y5WasShtoriFcICwPINr8QQ
X-Received: by 2002:a17:906:7315:b0:a6f:586b:6c2 with SMTP id
 a640c23a62f3a-a7a4c44efb5mr426001366b.60.1721635316929; Mon, 22 Jul 2024
 01:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <af462e20-d158-4c5c-8dae-ce48f4192087@molgen.mpg.de>
 <2024071939-wrought-repackage-f3c5@gregkh> <20240719093819.GE12656@pendragon.ideasonboard.com>
 <2a2cac3c-f9cd-4b20-ae53-9e6963c7889f@molgen.mpg.de> <518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de>
In-Reply-To: <518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Jul 2024 10:01:42 +0200
X-Gmail-Original-Message-ID: <CANiDSCuPR8LryVVhodJKFoYh6xGLGo47_XJ3Oqt9+nz84JfpYg@mail.gmail.com>
Message-ID: <CANiDSCuPR8LryVVhodJKFoYh6xGLGo47_XJ3Oqt9+nz84JfpYg@mail.gmail.com>
Subject: Re: Linux logs error `Failed to query (GET_CUR) UVC control X on unit
 Y: -75 (exp. 1).` (75 == EOVERFLOW?)
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul



On Fri, 19 Jul 2024 at 14:31, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> #regzbot ^introduced: b2b5fcb1c5b645d5177ef3e3f41c7a706fc2688d
>
> Dear Laurent, dear Greg, dear Ricardo,
>
>
> Am 19.07.24 um 13:33 schrieb Paul Menzel:
>
>
> > Am 19.07.24 um 11:38 schrieb Laurent Pinchart:
> >> (CC'ing Ricardo)
> >>
> >> On Fri, Jul 19, 2024 at 08:05:35AM +0200, Greg KH wrote:
> >>> On Fri, Jul 19, 2024 at 07:22:54AM +0200, Paul Menzel wrote:
> >
> >>>> Today, starting the Intel Kaby Lake laptop Dell XPS 13 9360/0596KF,
> >>>> BIOS
> >>>> 2.21.0 06/02/2022 with
> >>>>
> >>>>      Bus 001 Device 004: ID 0c45:670c Microdia Integrated Webcam HD
> >>>>
> >>>> Linux =E2=80=9C6.11-rc0=E2=80=9D (v6.10-8070-gcb273eb7c839) logged U=
VC errors:
> >>>
> >>> Does 6.10-final have the same issue?
> >
> > No, it does not. Linux 6.10-04829-ge2f710f97f35 (Merge tag 'ata-6.11-rc=
1' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux) does also
> > not show this, and 6.10-rc3-00148-g8676a5e796fa (media: uvcvideo: Fix
> > integer overflow calculating timestamp) neither.
> >
> >>> If not, can you use 'git bisect' to track down the offending commit?
> >
> > I am on it. I tried to pass the USB device through to a VM and try to
> > reproduce there. Thank you for the comment, that reloading the module i=
s
> > (of course) also possible. That avoids rebooting the system.
>
> The hard way found commit:

Thanks a lot for bisecting the error.

BTW, besided the error messages, the camera was working fine correct?

Could you check if this fixes your issue?

https://lore.kernel.org/linux-media/20240722-fix-filter-mapping-v1-1-07cc9c=
6bf4e3@chromium.org/T/#u

Thanks!

