Return-Path: <linux-usb+bounces-11825-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EA191ECB1
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 03:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC8F01C21FE7
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 01:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F87F7462;
	Tue,  2 Jul 2024 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbFbKl5s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCB24C8B
	for <linux-usb@vger.kernel.org>; Tue,  2 Jul 2024 01:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719883935; cv=none; b=BKk8bij0B8BA4dgyQVAKzzgn4cdEdLw1jlKP3pKELcI37nmTB3BDRskbK6UjPawq0wyo6CFr3L0ilU6QuQzsFxb2oY4OHHOoD7uzf+CSe3hm5qKSKjamEUm1ilpWfZPbxgFXMhJZLYZlGPqFQaV+Wu6/Q0dm6bc+NE4kKEry+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719883935; c=relaxed/simple;
	bh=rlxNjjPLvY07nbiWOYIRVo34QwlizWn3Yej9EFd8Hak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gas/he8FwsocODIZ5R6liM+qGUPvltZesFnfLXkaQr2adytwx5beHuPfU6ZumQZfFOCLucXpsQJtTn3yhNhGSRbcF07MXRQkMnbnl0AdGhUsqBemQnNOFRFlRXECFbjxMkxnR3PCNP3fN5c9MYTjcK+VTaF+FbYukcemzIOkXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbFbKl5s; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c96187b3d1so9333a91.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Jul 2024 18:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719883933; x=1720488733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjNdSKW51pSujYewtSbmONnX/i8uZVdvhuSuuuWu1ww=;
        b=jbFbKl5shMnoN6wULjAMadGQgFDfJCSvaSUfsBzcstAEshb657rAyqf+96vMnwC0ZU
         h2/PXvm+2egg6CZ9XmAAL9xLRHpcYMYzO1r5vju9MD6LsWCvHYYDC0fgTuRMIXuoIEoj
         KWEVdeJgSIJZFiJgMbkavNmYfEGGhZ7Eo+hVUyc2RAQmMcR0yA/pcSDZ4IVdGuSnCte1
         eO1csTgq1RFkURbG1+q0E4+bf5NKrIjbUVnr/o6gD99JgFzRNbF1Ej+FDpJP5QyVfXic
         ePAlsfQZ9nux6/fy9tBkHtyHYXtRC+R00hK/sYc8ZAvLAYPgqATWerYBvR9340gBOCXQ
         y2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719883933; x=1720488733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjNdSKW51pSujYewtSbmONnX/i8uZVdvhuSuuuWu1ww=;
        b=GbfyjnTKw0UIFDDo6kFxibjodQ845rDrE0299pSQKTvlYvQs5oJLmtJCFAragLMlYb
         FJ690a4KQj9KTUtt0Kdf6wxgwqh77gYE+6eng2epTgVOsEMuzDtC+63HkfM+tXfzPkh6
         aTfhXpvQD9jljY+2lJKVfw9ZIkZQScgVT7PtP2jJ3GpbUaabn7UtHsI+RuIIIZBvqISU
         vA/4f/nBUGsJNiH+ifvUPV4+sdOXaqDCV4wq48shtrPz0QVpApxXWKyASrb0XX0dNdHT
         qXDndqE7QhL9KEc1Bs8qow6xu8kAeTIZ6sb6XehBbwt6AcwPg8mFu6b5vH2/IBc/cvbM
         vnVw==
X-Forwarded-Encrypted: i=1; AJvYcCVlbDyionu7EDDuYiRBaj+44pTdjk9teac01uyj/dE5npcTF9c3W4PhyzEFrnNUpqJM4kK7gmMhrNLwV+lokclmt8o2z4M/uUBz
X-Gm-Message-State: AOJu0Yz9D9iuBp/y9VA3lpKLsktGDxsQGcz0oaWej+UpGZxMqxxG8UEQ
	z9I8tgpHxmS4Yolet0kdeqd6Yr2SmzNIGdMQWxqi9492vn3r3y0NpabH6wi3WPJnoI1meHigWde
	KYS2hlfki/hMWX12vkhReiSmZgK0=
X-Google-Smtp-Source: AGHT+IH5nwK+VUzxu3fzDDhq4LxgxBOxdVXmRzzJ2cICKGta29J1tP6m+RYNVqaa7H/Le1K/Zad8mQrwWrR2yD19swk=
X-Received: by 2002:a17:90a:b893:b0:2c8:dc78:7889 with SMTP id
 98e67ed59e1d1-2c93d77b88emr3685680a91.46.1719883932935; Mon, 01 Jul 2024
 18:32:12 -0700 (PDT)
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
 <CAE=33HWobLgdhx3nWrQGqcsVxPBK5zDxO4pL8YAOaPW1wTs09A@mail.gmail.com> <21f8608d-8df7-47eb-8400-9a5a2165f57e@rowland.harvard.edu>
In-Reply-To: <21f8608d-8df7-47eb-8400-9a5a2165f57e@rowland.harvard.edu>
From: Darrion Ramos <darrionramos@gmail.com>
Date: Mon, 1 Jul 2024 21:31:59 -0400
Message-ID: <CAE=33HWsS02CVmasLjOiNjXOv_jnrxkkjUuhGLqD+iinohrY9w@mail.gmail.com>
Subject: Re: Remote wake up in gadget drivers
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan, I do not quite understand your second comment. But I realize
now I was not thinking of the big picture earlier. The UDC needs to
send the actual wakeup signal when prompted by the
usb_gadget_wakeup(). Since the raspberry pi I am using only supports
the dwc2 driver, and the dwc2's usb_gadget_ops does not have the
wakeup function it looks like I just need different hardware that uses
a dwc3 UDC. Unless you know of something else.

On Mon, Jul 1, 2024 at 2:05=E2=80=AFPM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> On Sun, Jun 30, 2024 at 11:22:12PM -0400, Darrion Ramos wrote:
> > (resending in plain text) Hello all, thank you for all your
> > information. It has been very helpful. I was able to implement the
> > usb_gadget_wakeup() call and set the USB_CONFIG_ATT_WAKEUP bit.
> > Setting the bit did create the  /sys/bus/usb/devices/.../power wakeup
> > files that I noticed were missing. Unfortunately usb_gadget_wakeup()
> > calls gadget->ops functions to send the signal and these need to be
> > implemented as well. From my understanding I need to translate the
> > __dwc3_gadget_wakeup() function in linux/drivers/usb/dwc3/gadget.c
> > into raw_gadget.c.
>
> No, that's not right.  All raw_gadget.c has to do is call
> usb_gadget_wakeup().
>
> The dwc3 gadget driver _does_ define a wakeup member of gadget->ops; it
> points to the dwc3_gadget_wakeup() routine, which definitely is
> implemented.
>
> >  I have not been able to properly look through the
> > __dwc3_gadget_wakeup() function yet, Andrey is it feasible to write
> > that function in the raw_gadget currently or is there something else I
> > am missing where I do not need that ops function in raw_gadget?
>
> You're missing something.  Think of it this way: If raw_gadget was
> running on some device other than a Raspberry Pi, with a UDC controller
> that wasn't DWC3, then it certainly would have no need to do anything
> connected with __dwc3_gadget_wakeup().  The same is true when it _is_
> running on a Raspberry Pi.
>
> Alan Stern



--=20
-Thanks, Darrion

