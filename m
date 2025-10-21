Return-Path: <linux-usb+bounces-29499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E88BF90B5
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 00:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E733D4EED33
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 22:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF141299AAC;
	Tue, 21 Oct 2025 22:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYmwI9Hi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A143A25D527
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 22:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761085607; cv=none; b=Ao8lyuvk0Pan63bo5rqfQg77LdSmqC3pJc5TGdvoU0/No5XePvbd4LcQ8I0XBRQiROPnEjIcLUUkc5RyTSTQ6DbW2JeaezUVKGjgB4PJx4sYZVBg5W/RJxjgXSS75Ltb189tvmWBoSR5M+Vh86BJTyYV4RRfJcfW2L9eg1IHZyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761085607; c=relaxed/simple;
	bh=mwRp7aXDMeuqw9lPShCQa7Qn0mcGgCkUVUwaPDlvSCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PABLkYww026pw3VrPznsg9NWCAMLMmCx3vsLsZugxwnTNOggDDAJNqN84yYMgELIQpiey4YnJSWdU0kt0xwZOL0I42jYHMzpI4ymbPlej9tivixhZmtKZvYuX+QgF3q8OZfHd5MHv05K0ZmmJv41k/QOps9tAuG/K3F0o/tVWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYmwI9Hi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-471066cfc2aso14895225e9.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 15:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761085604; x=1761690404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yk5EdGXRJO7qKp/sEruSVRBX2qsBvNyyYKbMfRHxLXk=;
        b=VYmwI9HiVbeWpkMwpgji4Ov2hrnphV8zjiboWWKIi+7zT8p03h5EGbECtvBT73wgv4
         XJ+d+wC6SS2gMU6srf1pmk6JaVgU8FMbMsbleyJVKJzClwZs6lpqsmtX5fTLxEkvTaXP
         TqNzZPhEd05kMOpHdkFWX4ahksFgKSPJjcLQLT215j/XW5Ntcq0O4538HAheAtiX8y4g
         ju8Bjc88sZNHF74nrdB0SBv7ve31OfpIOEiT4PNEF1bOSP6HpwO4AGOKejJXMC/0Zs7w
         STgph5a6+x5dS255kIp6HNPt9l6tPtQ7SsizSpUd3hAEOLedJQOB3ivz07CTBOawhyiH
         tegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761085604; x=1761690404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yk5EdGXRJO7qKp/sEruSVRBX2qsBvNyyYKbMfRHxLXk=;
        b=LNjpO1XnxzgSmbxH1gT8Pbzl67ZonYvzKHJeDZHfL1hQLAn2QciMXDA79owwUiWEEr
         Wd0IPgDXuPk6fSPthc9U+Wveuo2CuJa6pFpR7tKrBxsbTEE5bgHxd/1d+g+i2TjuXgUY
         L4pcrRKJWq2A0bmQATheCl7B51YcOSFtp8vBghQRoT2lFYJHMr9HcJQqIGLIjmBeizgx
         oo0vNCBllE/lkx7+onO17UMU2OGIPE+g+eiPMc/BnpeCVV8q3O+/LBpKHoyX7OEVzmR0
         mfWpA5WNfhvOQlq8rm5crp7rMnJn1xJ6tuw612QEYfF8OU71A78LKDaCVk6lQZOshYvS
         bVXg==
X-Forwarded-Encrypted: i=1; AJvYcCXUBUHaX60jJu6YnJuiyQ1vHR4U0oXQxSr3nZoMLH5PZZTYzHa14zeruVA5nBMTTqKy/V/gzY4fBzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW7dz7z5IfcZFAiu1Q9PuPtrOi1VDYfr77wLSG7wf3O2yTA1An
	g5xrIqXuanjQsBZ91ATUzkNBiOGoMs1lF3C4ftA4yKSywG/jyMOMdDQaqlwH9BzZmSHwmcxlSe5
	J4yM6l+pQ4+HEC7/BN0t3d0j3Mik2bu4iow==
X-Gm-Gg: ASbGncsLD/IhikFhLLopFeOUq7BpicGtKMyrCmO5mg/x80S/NP7iWGubbQru9qQp0h6
	mEQfZbp1xQTYEnG28VDoENfibfRaRGbH0Pzdq9T1CV0iqmOw8Pf5f9Z6c19a+Tv4x4saS1185Bx
	bmldsRUQoy5JmELawTnz/oam6/JkqKgbuxplJ4uDg1jxMdZeDehXR0OiblQYGYHK7sS8r0lXhuL
	EhsoSxfcy24Lrwscfk0hA9RnXQwQ1uHLK2bK4oJSC57Rh/XhvJdSKqmih6W/3n81aH7khENIQrj
	x0frHhgDnymej62OD5M=
X-Google-Smtp-Source: AGHT+IGYoeRkbinjZq4rfb3IpCbKu1sZPsyNIP34D3eTPladuTEWTWB5CAhB0AiDCHZrF11k6gXwYJbfXqyVdDGYlGQ=
X-Received: by 2002:a05:600c:4fd4:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-4711791391emr159678545e9.30.1761085603795; Tue, 21 Oct 2025
 15:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6024e8eab679043e9b8a5defdb41c4bda62f02b.1757016152.git.andreyknvl@gmail.com>
 <CA+fCnZdG+X48_W_bSKYpziKohjp1QVgDzUzfYK_KOk42j58_ZA@mail.gmail.com>
 <CA+fCnZdHJtHgZuD9tiDGD8svXTEdP=GK8HSo71y_UfKgZcaUxg@mail.gmail.com> <2025102151-footpath-entomb-76da@gregkh>
In-Reply-To: <2025102151-footpath-entomb-76da@gregkh>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 22 Oct 2025 00:26:33 +0200
X-Gm-Features: AS18NWCf_UXS44wj9g_pn-uEAnNcwzugyYPMuelk7EE5VgyExzuwoWDIV5U5S9g
Message-ID: <CA+fCnZea_CXGFD5cgwamM_0VtkjcPR=tcOUqzEN+eNY+EtR2+Q@mail.gmail.com>
Subject: Re: [PATCH] usb: raw-gadget: do not limit transfer length
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	andrey.konovalov@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 6:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 21, 2025 at 04:19:13PM +0200, Andrey Konovalov wrote:
> > On Tue, Oct 21, 2025 at 4:18=E2=80=AFPM Andrey Konovalov <andreyknvl@gm=
ail.com> wrote:
> > >
> > > On Thu, Sep 4, 2025 at 10:08=E2=80=AFPM <andrey.konovalov@linux.dev> =
wrote:
> > > >
> > > > From: Andrey Konovalov <andreyknvl@gmail.com>
> > > >
> > > > Drop the check on the maximum transfer length in Raw Gadget for bot=
h
> > > > control and non-control transfers.
> > > >
> > > > Limiting the transfer length causes a problem with emulating USB de=
vices
> > > > whose full configuration descriptor exceeds PAGE_SIZE in length.
> > > >
> > > > Overall, there does not appear to be any reason to enforce any kind=
 of
> > > > transfer length limit on the Raw Gadget side for either control or
> > > > non-control transfers, so let's just drop the related check.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> > > > Signed-off-by: Andrey Konovalov <andreyknvl@gmail.com>
> > > > ---
> > > >  drivers/usb/gadget/legacy/raw_gadget.c | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/g=
adget/legacy/raw_gadget.c
> > > > index 20165e1582d9..b71680c58de6 100644
> > > > --- a/drivers/usb/gadget/legacy/raw_gadget.c
> > > > +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> > > > @@ -667,8 +667,6 @@ static void *raw_alloc_io_data(struct usb_raw_e=
p_io *io, void __user *ptr,
> > > >                 return ERR_PTR(-EINVAL);
> > > >         if (!usb_raw_io_flags_valid(io->flags))
> > > >                 return ERR_PTR(-EINVAL);
> > > > -       if (io->length > PAGE_SIZE)
> > > > -               return ERR_PTR(-EINVAL);
> > > >         if (get_from_user)
> > > >                 data =3D memdup_user(ptr + sizeof(*io), io->length)=
;
> > > >         else {
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > Hi Greg,
> > >
> > > Could you pick up this patch?
> > >
> > > Thank you!
> >
> > (Greg to To:)
>
> Can you send it to the proper list again?  I didn't see it on the
> linux-usb list as it was never sent there :(

Sure, done!

