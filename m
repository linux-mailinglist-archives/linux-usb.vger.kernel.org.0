Return-Path: <linux-usb+bounces-11481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A7910541
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 15:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 299EC2883EB
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 13:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D261ACE73;
	Thu, 20 Jun 2024 12:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8eYOnT0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271C91ACE86
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718888269; cv=none; b=AX4mTc9ZrEKGb9kGt5ssOkHQfcjRp9gwtRxNlGJIIJIEjXka29ADBUnkF7raEYzElr86h2FCZ6jVD3p169y0ykG3JyoJH8wYI5PzmGvvraajVT3kbHriQSzPYH2X5zDfcOn04zSWjCPljIHr0ob4KB+dUtIcehxa4uisxElvakE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718888269; c=relaxed/simple;
	bh=CFCmNu4uZBtNgWT0kvptoQSsCVC5fZv0QtDX978p+T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihPQqyryme+p6GhPdbzvIM8j0Jjyq4zwJObA9Z0ir6h/8VIto1qA5dW9CB3nOPMm1DKifklchE24Mw8c+ZmgxwEaivzNVcMV5y77OeUzkKdYXWe9q/NIKiwnyh0+YOZUanltmHmeJxxyLRMSmzttHabkx4GIE+OAbflmzOfCe3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8eYOnT0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-36336aa7ca1so684194f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 05:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718888266; x=1719493066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfTXR9y+SFuLuLxEUFUjpi/opQ29fER0P6g81P0y5TI=;
        b=j8eYOnT0VW/JgMIIOu8gr1W93axVD6tmrf0c8ERKOabafzQlfFSLeYl+MV7q05NX47
         eVNnZLHupZm3jSIPsS66wX6WNsWbGSyzLpL3OvZHagGiZafQTEz7cQcxv6E/Ky3D693x
         pj/TDYrHmEtKKj79DOy+wl/E58yRAfLvFRXufJuOy2Wp15jyDxflFOvu0myCMddyESo3
         w7bvvKwp2V5zV6rLPWoslnrDE9d71H5XPnFwxp6JTkh3isqIMvYzh1+RIMoJZE/O6Ndt
         XcQ+aj9gU+Sn6t6a47yUR7Wy2O8WCjP3U7HTWDjJk7FrGHe+fDHhYUNU9YCpXLb4oZ96
         Uo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718888266; x=1719493066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfTXR9y+SFuLuLxEUFUjpi/opQ29fER0P6g81P0y5TI=;
        b=ZAA/RxbD34MFLRV2EAvz89gt1awcfHIpmGiBy+i8v0t4J9sRazGmMMJnPA/B10KWg/
         g9jHTvUv6GLDgQ3JmFLTit++4pKUNdQzKiAZGDa9fwuhDPo4BfQAXSp6KzB7aK5nc0xY
         iNdAETHN2+5ysc/uGg9otCcHlmXMC1B1a8+zwJsxFBNQpRXtibj0bDKw/DtLTJxYm3kq
         lmG0/Ah5yaG2ohsMGD5plPT6FHN/mA5pqGzoYXGJU+jMFp+ZS13XTOcWpV1KoEXBpW/r
         jonVidzxOHWeTcG331vkdWLW0n2JFx8Prd602dUHIMB8Mw0iYq8Z1GqjwOKlr+yQuNRT
         5pvA==
X-Forwarded-Encrypted: i=1; AJvYcCV83Gk50MKIDRbjDUYel8vcuwZdNm31UeNstBN7iOzPV4vIakkKa6fKzfgz2OeYzDs3uvEOQY/uq3BPqWUPYyLAZWPt4HR1jZ4L
X-Gm-Message-State: AOJu0YxT/Ej5oT7OXmpQ0gIonRLJ5H0T9/5qt9puLe45mpSu27Jhf5tl
	4/91PTM1SmWdogbExe01bU437+JOS1Z0yQ65pgk2eM8JERzAMJd4r57r6Jspq+iw5uwokCNgufh
	HdxvoE3xJ48TQojRCuQXK/k8rmsqKJw==
X-Google-Smtp-Source: AGHT+IEzxBYx+sLYq6S3fXoh+BNsKdujyYdDL1ib6CIatx4VD2cM6pMw9FWRkUFz/BdNFs8/7C/bFmJFTN5wamg837Y=
X-Received: by 2002:adf:eac1:0:b0:364:aef1:da77 with SMTP id
 ffacd0b85a97d-364aef1db66mr1431573f8f.62.1718888266161; Thu, 20 Jun 2024
 05:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
 <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>
 <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu> <ZnI376uuUb34I1go@pyrite.rasen.tech>
In-Reply-To: <ZnI376uuUb34I1go@pyrite.rasen.tech>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 20 Jun 2024 14:57:34 +0200
Message-ID: <CA+fCnZc6CbnT18MJGNUfWuFfcqOhYKGZeU+rpnaZ7rim56Vnag@mail.gmail.com>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 3:44=E2=80=AFAM Paul Elder <paul.elder@ideasonboard=
.com> wrote:
>
> > > This series below is the one you're referring to, right?
> > >
> > > https://lore.kernel.org/linux-kernel/20190124030228.19840-1-paul.elde=
r@ideasonboard.com/
> >
> > Yes, that's it.  I'm impressed that you were able to find it; I had los=
t
> > track of it.
> >
> > > Do you know why it wasn't merged? (CC Paul). There are no comments on
> > > the latest version I managed to find.
> >
> > I guess Felipe Balbi (the USB Gadget maintainer at the time) just wasn'=
t
> > very interested in fixing the problem.
>
> So that's why we never continued with merging it...
>
> Is it time to dust it off and try to upstream it again? :)

Thank would be awesome! :)

If you get around to it, I can add Raw Gadget integration on top and test i=
t.

Do you know, what would be the better board to get with an MUSB UDC
for testing? Ideally, something that supports the mainline kernel.

Thanks!

