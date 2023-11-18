Return-Path: <linux-usb+bounces-2984-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A467EFF35
	for <lists+linux-usb@lfdr.de>; Sat, 18 Nov 2023 12:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326DA1C20850
	for <lists+linux-usb@lfdr.de>; Sat, 18 Nov 2023 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459BF10A25;
	Sat, 18 Nov 2023 11:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ibfoj5mI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EF1D6D
	for <linux-usb@vger.kernel.org>; Sat, 18 Nov 2023 03:19:30 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3594201d778so49535ab.1
        for <linux-usb@vger.kernel.org>; Sat, 18 Nov 2023 03:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700306370; x=1700911170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mXzei30XPfojsWoW6UyD1YAWlbEa6U1UF+CvYmj/CQ=;
        b=ibfoj5mIeTND+MC5MZ502LSUUMxEJ9udPGWnJSp8CyMguXbkandINcT6dQhudtieRC
         yl2X5I6hajmfkkjy1JmmhkyoyY1YzthsQ1DdyaZBk45D/jVtSsJJbi8HzEBnP8G6+UYU
         qq+QKiD3zyZNWmYAZdJDZ87M7ZYeJ/xlxeWB5G9alE2vSHc1PPa5LgwjG0T+4qB0Phhq
         /SVYIJXNibhBN3nS0nmHcDkA/YoX2XxoHztUmTl7l5rzWwHyUTjO51MqIEujEq97YwOA
         fSlGgMa5Cqx/pZJCyHSw46Oi5fmx5WjYe5Sg+UJlEiAERPDElLardk3s1s/XVW7gb+bf
         kXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700306370; x=1700911170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mXzei30XPfojsWoW6UyD1YAWlbEa6U1UF+CvYmj/CQ=;
        b=iAi9H1rX0u6cHMHtDkqugzj+8+uKLvZPo7itTanT0uIdzhpNFWtuoyL5Bk5uAmRhHw
         7Y7cT7RGTko5pymFGKfyKVOT3oBLRJ82B79sgmvOmfOvJlSsIJvTXT5SsVspVZ7LEGJs
         OHznWcx/apVaW0RZr9foBwPoHs0fkH1ORmPb3n7IbOUTHCAHya35/JzQuqEhbeLrKqRw
         7lac49EsQnObowBr8Q+KTFklnvRPnmYh3izAsFd22N5omrXP/j53C5jFQVCrKWQCQWRj
         coGLLrCVo5S3L35bNCdn0Q99GL7Ll2V/oj/ATznhM7yy2CpCWf1aeHpKPnA94LC6mvEI
         BPKw==
X-Gm-Message-State: AOJu0YzOLARGj76D0FxXNKA/etwDuuNiKSu0d8Ccfe4lypqbWjpD1SWj
	siCUWT0KU3tnAmejeKH7wg+Vf5NBZQNpqtyJ78zz5g==
X-Google-Smtp-Source: AGHT+IGOn/zzQ7G1UK58Zj6xuIf5lsPrUjWReoW3D9N+rmfxmKFTGNEa8xKW+VgR5ZRTJS+ZPW3gS7qZy29C5p7K97Y=
X-Received: by 2002:a05:6e02:1d0c:b0:35a:f9b0:10e3 with SMTP id
 i12-20020a056e021d0c00b0035af9b010e3mr14099ila.13.1700306369808; Sat, 18 Nov
 2023 03:19:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117072131.2886406-1-khtsai@google.com> <2023111705-showroom-consonant-7a7b@gregkh>
In-Reply-To: <2023111705-showroom-consonant-7a7b@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Sat, 18 Nov 2023 19:19:03 +0800
Message-ID: <CAKzKK0pB7V52krSzGL4f2C_dxwM8Au=8tgrcNUO0zvXz6Uwzcg@mail.gmail.com>
Subject: Re: [PATCH] xhci: fix null pointer deref for xhci_urb_enqueue
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Fri, Nov 17, 2023 at 9:53=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Nov 17, 2023 at 03:21:28PM +0800, Kuen-Han Tsai wrote:
> > The null pointer dereference happens when xhci_free_dev() frees the
> > xhci->devs[slot_id] virtual device while xhci_urb_enqueue() is
> > processing a urb and checking the max packet size.
> >
> > [106913.850735][ T2068] usb 2-1: USB disconnect, device number 2
> > [106913.856999][ T4618] Unable to handle kernel NULL pointer dereferenc=
e at virtual address 0000000000000010
> > [106913.857488][ T4618] Call trace:
> > [106913.857491][ T4618]  xhci_check_maxpacket+0x30/0x2dc
> > [106913.857494][ T4618]  xhci_urb_enqueue+0x24c/0x47c
> > [106913.857498][ T4618]  usb_hcd_submit_urb+0x1f4/0xf34
> > [106913.857501][ T4618]  usb_submit_urb+0x4b8/0x4fc
> > [106913.857503][ T4618]  usb_control_msg+0x144/0x238
> > [106913.857507][ T4618]  do_proc_control+0x1f0/0x5bc
> > [106913.857509][ T4618]  usbdev_ioctl+0xdd8/0x15a8
> >
> > This patch adds a spinlock to the xhci_urb_enqueue function to make sur=
e
> > xhci_free_dev() and xhci_urb_enqueue() do not race and cause null
> > pointer dereference.
>
> I thought we had a lock for this already, what changed to cause this to
> start triggering now, all these years later?

Right, there is a lock in place for xhci_urb_enqueue(), but it doesn't
protect all code segments that use xhci->devs[slot_id] within the
function. I couldn't identify any specific changes that might have
introduced this issue. It's likely a long-standing potential problem
that's difficult to trigger under normal situations.

This issue happens when the USB enumeration process is complete, and a
user space program submits a control request to the peripheral, but
then the device is rapidly disconnected. I was able to reproduce this
issue by introducing a 3-second delay within xhci_check_maxpacket()
and disconnecting the peripheral while observing that the control
request is being processed by xhci_check_maxpacket().

>
> >
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
>
> What commit id does this fix?

Should I include a "Fixes:" header even if this patch doesn't address
a bug from a specific commit?

>
>
> > ---
> >  drivers/usb/host/xhci.c | 38 ++++++++++++++++++++++++--------------
> >  1 file changed, 24 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index 884b0898d9c9..e0766ebeff0e 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -1522,23 +1522,32 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd=
, struct urb *urb, gfp_t mem_flag
> >       struct urb_priv *urb_priv;
> >       int num_tds;
> >
> > -     if (!urb)
> > -             return -EINVAL;
> > -     ret =3D xhci_check_args(hcd, urb->dev, urb->ep,
> > -                                     true, true, __func__);
> > -     if (ret <=3D 0)
> > -             return ret ? ret : -EINVAL;
> > +     spin_lock_irqsave(&xhci->lock, flags);
> > +
> > +     if (!urb) {
> > +             ret =3D -EINVAL;
> > +             goto done;
> > +     }
>
> Why does this have to be inside the lock?  The urb can't change here,
> can it?

You're right, no need to place those inside the lock. I will move them
out of the protection.

>
> > +
> > +     ret =3D xhci_check_args(hcd, urb->dev, urb->ep, true, true, __fun=
c__);
> > +     if (ret <=3D 0) {
> > +             ret =3D ret ? ret : -EINVAL;
> > +             goto done;
> > +     }
> >
> >       slot_id =3D urb->dev->slot_id;
> >       ep_index =3D xhci_get_endpoint_index(&urb->ep->desc);
> >       ep_state =3D &xhci->devs[slot_id]->eps[ep_index].ep_state;
> >
> > -     if (!HCD_HW_ACCESSIBLE(hcd))
> > -             return -ESHUTDOWN;
> > +     if (!HCD_HW_ACCESSIBLE(hcd)) {
> > +             ret =3D -ESHUTDOWN;
> > +             goto done;
>
> Note, we now have completions, so all of this "goto done" doesn't need
> to happen anymore.  Not a complaint, just a suggestion for future
> changes or this one, your choice.
>

I'm not familiar with the concept of 'completions'. Can you please
provide some links or explanations to help me understand it? I use a
'goto done' statement because I follow this pattern seen in many
previous commits. However, I'm willing to modify this approach if
there's a more suitable alternative.

Please forgive me if any of my questions seem overly basic. I'm still
in the process of learning how to contribute to the kernel community.

Thanks,
Kuen-Han

> thanks,
>
> greg k-h

