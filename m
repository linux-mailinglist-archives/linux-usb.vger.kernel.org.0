Return-Path: <linux-usb+bounces-11841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A1924DFF
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 04:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA7921C24458
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 02:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDE3524C;
	Wed,  3 Jul 2024 02:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aB6Rdp7F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3C17464
	for <linux-usb@vger.kernel.org>; Wed,  3 Jul 2024 02:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719975171; cv=none; b=VGUfYgSZAymy1dNHvkGjF3QpM23LklqGZfTlRzbL8B8gSHgmtxABCsgUgdK0WakbFIHzaM1Po2jfwnEvCe92vTwyisqxM4v2hedSb+aRn5tGv6/RHMAECr4RrGaCLh7qlgdASUS8yJF+/qrvNaQPM14j47VTo+oTq2g7I4r/1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719975171; c=relaxed/simple;
	bh=hzgjlAi96djalX9uYom2HTw2xyyN27+8QyER7t+SXM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glkA089E429offrNIOn3sjjfqMTJyqASkZjZh2wemC4U2IO4NSd58PmVtLfq3UyV3m5zV582qatMXM76eK5PivYL8BtkYhiPiAPSwFB7kyeGG1S+fvcOP2+gRQ7B8pA8sgajpLqeDcI9TzgJ24jbXRetMWKC5xC1OKrSRm3FzZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aB6Rdp7F; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70670188420so3396077b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2024 19:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719975169; x=1720579969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzYaP/tL4QmMmgSUAwUoWBmfocH8Uidd9GfrXYzRJ1I=;
        b=aB6Rdp7FMm/w25mj+8xgfGnSNrnAJeWb1jVtaKAGgoucOL9kCE7U41gVwnB1zOVY0P
         YnVzlvX9pcz3EalhIo2jEHyoZKf4dJ/7r7c8IdNs5CAsTJGia3NIEOMetpBIGJyVIhF/
         ElirYRCzLItMGizsJQE10KV0WkHN0uFprxopX6cgxe5ML2Csbt8UI34VabyMoH7DKI03
         mPJOJJBQczl2HQ/sTDORCronpdTXYXllYXaLaUjAndHvALKgj/IJPjtZJjRrpacHvje+
         S50IIXqOpRmmWk5j+u8tYfPOgNLC3DbQoTKfZdPzZTMU0hi6NvzYnR6nMfIngySpxOEB
         NVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719975169; x=1720579969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzYaP/tL4QmMmgSUAwUoWBmfocH8Uidd9GfrXYzRJ1I=;
        b=vXDj/6I/QsGt5SM+oNWRD8uewOGPB8TtdGGrA6ZVKLWYiqXryVaegSqie7VgLehkzz
         5hmY0vD1DFBBafH6N2Bd6uzrOF/6WcYpjgslzCIk7ZR/JPSMjRjcx93tpGapzh3IWliu
         AMn+/+RA0yZ36Y8gBF2yP8JXsO3HnCWoczAFyawOBppuxcIl500l0ksJ4Z6yqTLKAhv6
         U6h8tT9MUNdmYc7SEzXSzPMHXdlTC5okTAUWMqL3veIRDkFUMnGTUsI2kCnN7H0dSGCV
         P2aJLJ2Ac3RyP3Mprs4npeistoTVqZK9CUt5t3/6f2wv5D39LNDynL6W9+1f4D8T8gzj
         qzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuPPVwtBkx3Fqpbsxy1gZO2kMszApPSgqUU0UFOu4L6tHjhlD28v6W3qJGD2MLsXd5rThMmk+0yje5PEwHBlnPRdx5TsfH0UCg
X-Gm-Message-State: AOJu0YwR9/njpOpOkcsxQPc8Fhqm1UzyhG537hSWlIS4n7DHC9PfRSbh
	ufQbRYrkmrnyDt0u7+HUWX8ZxxI6IEgKmE5/EUih9Kr2qDKekZdnxzMB0tzhlClCBjOvMSMMsW1
	prdGw5psD58F9sVO/LkK+0sn5L+g=
X-Google-Smtp-Source: AGHT+IFsnV1vjlTQLyA97Viro/YwTazF+Vozz6iKTafuxuvxvGGG/Ez00+DDBFQxgSkvO8qG8m/G3wDhvVm91VzRwik=
X-Received: by 2002:a05:6a00:4614:b0:705:a450:a993 with SMTP id
 d2e1a72fcca58-70aaad51cccmr10411222b3a.17.1719975169456; Tue, 02 Jul 2024
 19:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
 <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
 <20240628211140.va5ghcr65dl6g323@synopsys.com> <4539c3c5-61bf-4b4d-9391-a041a2a08b57@rowland.harvard.edu>
 <CAE=33HWobLgdhx3nWrQGqcsVxPBK5zDxO4pL8YAOaPW1wTs09A@mail.gmail.com>
 <21f8608d-8df7-47eb-8400-9a5a2165f57e@rowland.harvard.edu>
 <CAE=33HWsS02CVmasLjOiNjXOv_jnrxkkjUuhGLqD+iinohrY9w@mail.gmail.com>
 <dcc10e02-ab6d-47e7-ba82-9a740b9d110b@rowland.harvard.edu> <CA+fCnZeuE0OohDK9Mm_oUWabaYZYUzA55drk3rqGa82P-v0z_g@mail.gmail.com>
In-Reply-To: <CA+fCnZeuE0OohDK9Mm_oUWabaYZYUzA55drk3rqGa82P-v0z_g@mail.gmail.com>
From: Darrion Ramos <darrionramos@gmail.com>
Date: Tue, 2 Jul 2024 22:52:36 -0400
Message-ID: <CAE=33HWumr8RnKA_XXh1RqiTZ61O-aceQgFuAW_S6WB8YdM3rg@mail.gmail.com>
Subject: Re: Remote wake up in gadget drivers
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, USB list <linux-usb@vger.kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Andrey for the suggestion. I was looking at the ROCK Pi, but
the beaglebone sounds like a better option with more documentation. I
will let you know how it works out.

On Tue, Jul 2, 2024 at 9:50=E2=80=AFAM Andrey Konovalov <andreyknvl@gmail.c=
om> wrote:
>
> On Tue, Jul 2, 2024 at 3:59=E2=80=AFAM Alan Stern <stern@rowland.harvard.=
edu> wrote:
> >
> > Oh, sorry, I got confused.  For some reason I thought you were using a
> > device with DWC3 hardware.
> >
> > Yes, the dwc2 UDC driver does not implement a wakeup routine.  So eithe=
r
> > you'll need to find someone to implement it for you or else you'll need
> > to switch to a different kind of UDC controller.  Do any later versions
> > of the Raspberry Pi use DWC3?
>
> There are some mentions of DWC3 on Raspberry Pi 5, but the official
> documentation only mentions dwc2.
>
> I believe some of the ROCK Pi boards use DWC3. However, I failed to
> find any clear documentation for this.
>
> You can try using a musb-based device instead, e.g. BeagleBone Black.
> musb appears to support remote wake up.



--=20
-Thanks, Darrion

