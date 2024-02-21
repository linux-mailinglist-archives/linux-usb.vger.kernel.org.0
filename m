Return-Path: <linux-usb+bounces-6849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D485D362
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 10:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4162DB24272
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0173D0DF;
	Wed, 21 Feb 2024 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o4VwYngi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F853CF79
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507385; cv=none; b=KhECv0dKVk9JtWS3/Qj1xOZJhqP7xXP+ySP/e/75ajMG/7ewvb7VjLNySsqoIzSFh5Rv4gDutDgsLj9NcSGJgU9wchXV8YgvLQYXB1YRO9VIDLLaMSbED80HI1d1JhHjy2BKFha9s/DZ84QkbX5uAjiUsvz13wJUCCHuNZFbjkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507385; c=relaxed/simple;
	bh=K+gCIizEIOhF3THCA2HhsJVEYG4bJvjGS9rZ4eiaFR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/7tJfq9HiciGJgbifRBXuvu2Sjyvg4DVhqeMEk8tGqTnrJ6Fs1/zIaOzyXrGQ55CKC6UaEbp4tN1wJvKO2e4/28bnpzmPAOiXubBFoPW+0n3AFOMC8Hb2yLf+YVZ0B69y9gRh0/Nc7taJGapSEcx+aoAeSZ8uS+q4uoXhfJzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o4VwYngi; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5650c27e352so1668a12.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 01:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708507382; x=1709112182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8Iw+ecnsAvxKiT4ujJzI0in5wASuEUFoB3j6AJ1Ekw=;
        b=o4VwYngi+VEtdgvjFZw90hyG3NDQnRtUUxGoDJ77v95hA/IE7CFRa3xGt/0GcEaYXw
         mU7ynDtnpQSawYUB+WECzesZE7u5rzp3OITErpJ2nld0dVY5+8dMlVhkeYrqPfiAMwKm
         H8Hh3Y/3nE5H1qXnealBgI2Uk59GUXC/iKQnBlJhAPYQWUywzm6wl4otTDm/B0ty33OJ
         AW7Ti+4vmqyzAOAtBqxX1VoGoPLh4+Pid+WBX/z/zFsebT9S8XZVTpif6ywVIHLdu5t+
         EuQ9Hn/9+OkpvtokhF/qWROB20GNq6fqnckG0SkDmFvqzRSRbt5fQGe9K+UhemeThnYU
         u+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507382; x=1709112182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8Iw+ecnsAvxKiT4ujJzI0in5wASuEUFoB3j6AJ1Ekw=;
        b=MvALzdxEng/5VG/Bal+Lz0NoHLWBa7Ed9T/Pt8RV5F/08VayP9ohFjM6/knpWLKAlK
         cg7OOBf/2CcWjm1wwdzBfE5YK3+gW0HqE0W6Iekvsy7ZgeNyqQnYz20ZtpSvDx8Pb3Bz
         MfY46skobO8kJpHnMgDFK95kSUYLgrMEzhbwMIjsbw6EAzqlEZC6uZWc8wxbfyurvH9a
         Pkz1Hac38352+ZXHdWUqxsb8hqJARaWqnDo35fZAatVTD9ikRp75bsTnploG4YLYADim
         g53e9kVO1jFWz2GZlCQ74oyptgEW7oRPDt5RX+DU0w/YwcuID3z8FEW/1vn4hLfxVdBD
         AjQA==
X-Forwarded-Encrypted: i=1; AJvYcCUN6KC+pDOblOfPxJRvIlXsEHh+bBe8nwN2noxDTq8LMik3W4bZpnl0t1JRzyaIGzrdINOUonAW7Qq8feMztg+7ZbIJvHkq0u8F
X-Gm-Message-State: AOJu0YzekTVg94oujRT0sx2t6aPjrd0v9HWzfYDX0j0kYYUAYGv5iTvi
	+H5brvR11qkPXYMh5nJ+kcge5CNVq3CUlvXL1SJ+q8fumm+Y8ktm8IveqUbOrp9D6vZYnLJzh79
	Nosq+LYHLAGPxHyvCYLA/hKOjzy0qYphf/oUI
X-Google-Smtp-Source: AGHT+IEy6kNcDvH8qV/VRy8uplqs4byx2iWbcUCj2utl/wZ7ZtNrmbmJN8hiP8u5MtxV1VFQ7vtdsIPdMmY5qpXruRs=
X-Received: by 2002:a50:bae7:0:b0:563:fc50:37f9 with SMTP id
 x94-20020a50bae7000000b00563fc5037f9mr84099ede.3.1708507381744; Wed, 21 Feb
 2024 01:23:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219061008.1761102-1-pumahsu@google.com> <20240219061008.1761102-3-pumahsu@google.com>
 <2024021906-celestial-tuesday-bd24@gregkh>
In-Reply-To: <2024021906-celestial-tuesday-bd24@gregkh>
From: Puma Hsu <pumahsu@google.com>
Date: Wed, 21 Feb 2024 17:22:24 +0800
Message-ID: <CAGCq0LYYkg0NR2pVS0sTn0vrW3oWXoSg6DgJN0v8ADY_poykag@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: xhci: Add support for Google XHCI controller
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, Thinh.Nguyen@synopsys.com, badhri@google.com, 
	royluo@google.com, howardyen@google.com, albertccwang@google.com, 
	raychi@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 2:30=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Feb 19, 2024 at 02:10:07PM +0800, Puma Hsu wrote:
> > diff --git a/drivers/usb/host/xhci-goog.c b/drivers/usb/host/xhci-goog.=
c
> > new file mode 100644
> > index 000000000000..db027a5866db
> > --- /dev/null
> > +++ b/drivers/usb/host/xhci-goog.c
> > @@ -0,0 +1,154 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * xhci-goog.c - xHCI host controller driver platform Bus Glue.
> > + *
> > + * Copyright (c) 2024 Google LLC
>
> This code is older than 2024, right?  :)

Yes, this actually started from 2023, will fix it.

>
> > +     if (WARN_ON(!sysdev->dma_mask)) {
>
> If this triggers, you just rebooted your device (as you run with
> panic-on-warn enabled), so please, if this is something that can
> actually happen, handle it properly and move on, don't reboot a device.

Thank you for advising. Will review and handle it properly.

>
> > +MODULE_ALIAS("platform:xhci-hcd-goog");
>
> Why is this alias needed?  I thought that was only for older-style
> platform devices

I will change to module_platform_driver(). Thank you for advising.

>
> > +static int __init xhci_goog_init(void)
> > +{
> > +     return platform_driver_register(&usb_goog_xhci_driver);
> > +}
> > +module_init(xhci_goog_init);
> > +
> > +static void __exit xhci_goog_exit(void)
> > +{
> > +     platform_driver_unregister(&usb_goog_xhci_driver);
> > +}
> > +module_exit(xhci_goog_exit);
>
> module_platform_driver()?
>
> thanks,
>
> greg k-h

