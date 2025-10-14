Return-Path: <linux-usb+bounces-29266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F86BD6D4D
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 02:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01E2940444C
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 00:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585F71DFFD;
	Tue, 14 Oct 2025 00:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HvKRBlXO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CEE8821
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 00:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760400447; cv=none; b=LPSeP+3Ai6Orv/8b2ZYnC/19UPQtJKoIMceLEJ0+dauPXyA2J6p6pyZVd2M1X+sPHxr9Ic506BLo0/jzsui2OepsBqHxmTvI+vRXbgCojJfsXrAVmTHCFqf77smk3XrVWJacTL7gFmyhtD9eSTO9IC5L092vBxcvxt4r5qv9l4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760400447; c=relaxed/simple;
	bh=sddReqsaz8eLzv5j+uCqjuSBZlVdS1F7COeMoD+e74U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCxOUYo2U1dBbCQ0ZvydDTKRW0lb6wAcn+XfYLjQepbwp66oqZp4hq3b44x+tKzwt0+G0Kl4XB55ox8dOy8RCS/z2VfNPEhtyi7ibpgoG5zbrIkrDuUG1IMTEB+5g+FnNv49N/bfsDmXQy1nwD7zPC0iaKNdNT8NYki+F7kj/4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HvKRBlXO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e2b7eee0dso136005e9.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 17:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760400444; x=1761005244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMm+3DwYc57Ap+tGlaHsprQ869OBpYwPHVEmSgDdMcs=;
        b=HvKRBlXOzv3CtAnwhi3XfzLUYZdpvcn0gulLNgjrPnUBAUhffZUEd+72G8GLXelWID
         7B09lESuTvNl3tci+v4Mc9xHcCSgddqYNhTNwovYilJt9hEZZthEMMyc4tCwUklCbEis
         8EBARVJgA8QlKbPql+gSdYsawmMnrgHvdnnE+IvuagO6qXZXwVeftT7Zr1Yu69VG/KEM
         S8kXyJv8HG5J+hRLqkgsykaHqsDaWN57m1/eQnx3CCxhG37tpTJWFGPZsOB2pWVoATOb
         m/yJsKCpa5GwU4HpYySFociwZj3MwURnADVhc4kVzkLNLP21FFgTl2hfvqM3A05YAAbW
         xgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760400444; x=1761005244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMm+3DwYc57Ap+tGlaHsprQ869OBpYwPHVEmSgDdMcs=;
        b=XFx9jyL6UMquSI85/ZyMC7l+sOEgJxEyylLc2ZKLUEB1QbG0e+6cNncTB1q5RTv8yf
         3Dvq81ocE5CNoQYUbcBZ3BuFqp5GQ4TgiQ8W7wdabvrCO7r/M9Il5VaJrMH/qE1qgOlT
         DzMXoo9yDkux4r9jUNqitOA5+hivO93PUfWMAXeTX+1/jiRAGCFlUZDw7rmnNOf3zGfJ
         MSRWRikgpWSVejbynhis3UsdIvXuCmj9JzDpiMpwzgPp4MQZcWkN6W5cHNbNnH111Uot
         HYlci2aLDHDADY1xdT976t83ofxkZ3HnoordgVBsEz/8kT0Y/ouNhOAJc2XF4XeU/pbQ
         Jz4A==
X-Forwarded-Encrypted: i=1; AJvYcCX7GbMAjKQ9iSLe5UYqyp3xB2mVgxQmctIY8FG6FPwNHebYCdk4aEZsNLOlVWC+O2I18oBDDX2MG58=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZJ8Fnw/3ldua/tCaYPxcfSsBDyRlNjp8cHKAX/hQhnwBPJNN9
	QzQfy8f4UaYHJE4WqkK53ZdyCT5xSPgQuPUn2tmNQaxW8OUJ1QqD9iyHtBh+bLRChv83PLY/cGc
	h1PFAgnRxYU/tl927rzddRBAN/coCM1kxIU7jqLzP
X-Gm-Gg: ASbGncvczIX7DYhq3z4hbPL9G4SNx/DT2dJ3ER1qbKKUGikuregWnu2DHR0428a1B4J
	Bhfoodrgt+Ws20+rH9+EzEuOiXd7mfLva1/6+fYGe29O1B4mZXBwPyP1QYVlocGsam0Quq9rLpJ
	K6sPflHgMmRfIsqdRshi+7v3YgYMbgKJAvlIyrAmst0DLVVRcxhrtcllkXnw3Qu9t/TkITXL8A4
	7ANwEqcD3GDd9EoN9W4gZbGn1u/hEssSXyHxTc6xc2pGPewOXxQ1rSH5TZJj2C0NlCO+6H8RQeQ
X-Google-Smtp-Source: AGHT+IEfUpm7jUZSRfnU0C0FFysE4UdCaRG1nCop1BnDe0FupZuPsPJRbm12NwMwO0cQ4O9JYCiPLSfXNWeTUgmSYMc=
X-Received: by 2002:a05:600c:258:b0:45f:2e6d:ca01 with SMTP id
 5b1f17b1804b1-46fa9b27c4dmr9968455e9.4.1760400444288; Mon, 13 Oct 2025
 17:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-usbcore-tracing-v1-0-b885a3121b09@google.com>
 <20251013-usbcore-tracing-v1-1-b885a3121b09@google.com> <24db7c90-16d6-4122-8bda-aee2a2c930bf@rowland.harvard.edu>
In-Reply-To: <24db7c90-16d6-4122-8bda-aee2a2c930bf@rowland.harvard.edu>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 14 Oct 2025 08:06:57 +0800
X-Gm-Features: AS18NWB0Kxa7h3QNdNpyTtcwVGiNqLivxymxe8yrp9JvNSNy-LBpInicvco97IM
Message-ID: <CAKzKK0o5vTe-nxE7nBOUqb=Y3dnT_F-KUtOThSe0vXs9-z6gdg@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: core: Centralize device state update logic
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Mon, Oct 13, 2025 at 9:16=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, Oct 13, 2025 at 10:01:22AM +0800, Kuen-Han Tsai wrote:
> > Introduce a new static inline function, update_usb_device_state(), to
> > centralize the process of changing a device's state, including the
> > management of active_duration during suspend/resume transitions.
> >
> > This change prepares for adding tracepoints, allowing tracing logic to
> > be added in a single, central location within the new helper function.
> >
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> >  drivers/usb/core/hub.c | 28 ++++++++++++++++------------
> >  1 file changed, 16 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 256fe8c86828d51c33442345acdb7f3fe80a98ce..ce3d94c960470e9be7979b1=
021551eab5fd03517 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -2147,6 +2147,20 @@ static void update_port_device_state(struct usb_=
device *udev)
> >       }
> >  }
> >
> > +static inline void update_usb_device_state(struct usb_device *udev,
> > +                                        enum usb_device_state new_stat=
e)
> > +{
> > +     if (udev->state =3D=3D USB_STATE_SUSPENDED &&
> > +         new_state !=3D USB_STATE_SUSPENDED)
> > +             udev->active_duration -=3D jiffies;
> > +     else if (new_state =3D=3D USB_STATE_SUSPENDED &&
> > +              udev->state !=3D USB_STATE_SUSPENDED)
> > +             udev->active_duration +=3D jiffies;
> > +
> > +     udev->state =3D new_state;
> > +     update_port_device_state(udev);
> > +}
>
> This seems complicated enough to be a standalone function, not inline.
>

Thanks for the suggestion. I will change it into a static void function.

Regards,
Kuen-Han

