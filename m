Return-Path: <linux-usb+bounces-2982-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B1C7EFEDF
	for <lists+linux-usb@lfdr.de>; Sat, 18 Nov 2023 11:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2B1281012
	for <lists+linux-usb@lfdr.de>; Sat, 18 Nov 2023 10:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D2910966;
	Sat, 18 Nov 2023 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="13kYD18p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC8DD4F
	for <linux-usb@vger.kernel.org>; Sat, 18 Nov 2023 02:19:55 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-357d0d15b29so47255ab.1
        for <linux-usb@vger.kernel.org>; Sat, 18 Nov 2023 02:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700302794; x=1700907594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxblnkQg074qRnXIllEP3rVSdxYfm+CIeaGy3+CxEd4=;
        b=13kYD18pCotFCymY5ciNlJrfR2NnsoQRCzSfT0qa8hXdMt61nKdJlMBEsG9cJ3aUqc
         F3S+Ye7Spo0SnkDzxI2VSXQ2rNYG/AC0ncMBA7AkrIjcRt5N1XJX6Pf7i0kYIzm41OCk
         9NVpeeIxK9I9jYw5Udjq1hnXfmik31b7376GpCndiB52Rgqlul7/zDcwLyoQ3VwNzSdm
         +xeEab9eCeQxnJPrTFyG3ltPlA1FL4TDtti8IgcECA5Gz5xNcTFBXoEmQjcjByJRJE4j
         pR8mN7PDrHVrOBMIDdPCa0myiOHA//j1o7nSgKet8yx4tMOqHO+w3OJZAmKfPgXKYqNO
         K81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700302794; x=1700907594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxblnkQg074qRnXIllEP3rVSdxYfm+CIeaGy3+CxEd4=;
        b=K74O683xb6dG1Gs+QYqI6oGSNeFHnH7WXcdkVJ5JV5dgACxjvcXbuJO72gTVSCodyK
         pvpY/qAnlS1k05g0nDRRyG0lPEk3FLGZZRe21mEbewRBigMyU+qhrapHe9X58+2aqFNA
         EnBvsR63eDk7ZNGUtMeYxLf1VHXJuBKvs/zWO3T6/Pu7i5l7yQRifSjVZRdq+fZtLrsJ
         u7Ks54N96iUkDj4MjkaTHDJs5G0Ohd4NDByla3C5HnMlwwhXpILFANpyeg1l0y8pl/or
         V9gOt5U2WMWdbrV3wSP9qB1x57zy582br+SFzDN03H2IP2t5AVjWUuxbobMEK6wb2A5x
         hvjg==
X-Gm-Message-State: AOJu0YyfOeXCzP05anXGIlqDNHraukN3+0UWSztbXMLQyQhR8c7rNZjE
	VnaAYq/VJaAT3XNYyfs/iNi18mDQ1Yh59oRPZNVw1Q==
X-Google-Smtp-Source: AGHT+IH+CWzXykJbLLYBrLvbwyLv4S+qvTrGOJzfTbuj0Hr2e5ztbyburZcmhE+DhP4EPnAPH+m5iTbn44vC6gV/Nkg=
X-Received: by 2002:a05:6e02:160f:b0:34f:7cd2:b6fd with SMTP id
 t15-20020a056e02160f00b0034f7cd2b6fdmr403464ilu.3.1700302794198; Sat, 18 Nov
 2023 02:19:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117072131.2886406-1-khtsai@google.com> <a4a129a3-e271-acbb-949c-534a8e1627ee@linux.intel.com>
In-Reply-To: <a4a129a3-e271-acbb-949c-534a8e1627ee@linux.intel.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Sat, 18 Nov 2023 18:19:27 +0800
Message-ID: <CAKzKK0rnx+tSFAj6N-U_vcAZ_5P=Hx_Kb97NFkdPMHs8dR3Ukw@mail.gmail.com>
Subject: Re: [PATCH] xhci: fix null pointer deref for xhci_urb_enqueue
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathias

>>       if (usb_endpoint_xfer_isoc(&urb->ep->desc))
>> @@ -1552,8 +1561,10 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, =
struct urb *urb, gfp_t mem_flag
>>               num_tds =3D 1;
>>
>>       urb_priv =3D kzalloc(struct_size(urb_priv, td, num_tds), mem_flags=
);
> kzalloc with spinlock held, should preferably be moved outside lock, othe=
rwise should use GFP_ATOMIC

Thanks for pointing this out. I realize this patch is incorrect and it
is non-ideal to include many codes unrelated to xhci->devs[slot_id]
within the lock.

> xhci_check_maxpacket() called here can't be called with spinlock held

It appears that xhci_check_maxpacket() might potentially lead to a
deadlock later if a spinlock is held. Is this the concern you were
referring to? If not, please let me know if there are any other
potential issues that I may have missed, thanks!


On Fri, Nov 17, 2023 at 9:31=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 17.11.2023 9.21, Kuen-Han Tsai wrote:
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
> Thanks, nice catch
>
> This patch does however need some additional tuning
>
> >
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> >   drivers/usb/host/xhci.c | 38 ++++++++++++++++++++++++--------------
> >   1 file changed, 24 insertions(+), 14 deletions(-)
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
> > +     }
> >
> >       if (xhci->devs[slot_id]->flags & VDEV_PORT_ERROR) {
> >               xhci_dbg(xhci, "Can't queue urb, port error, link inactiv=
e\n");
> > -             return -ENODEV;
> > +             ret =3D -ENODEV;
> > +             goto done;
> >       }
> >
> >       if (usb_endpoint_xfer_isoc(&urb->ep->desc))
> > @@ -1552,8 +1561,10 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd,=
 struct urb *urb, gfp_t mem_flag
> >               num_tds =3D 1;
> >
> >       urb_priv =3D kzalloc(struct_size(urb_priv, td, num_tds), mem_flag=
s);
>
> kzalloc with spinlock held, should preferably be moved outside lock, othe=
rwise should use GFP_ATOMIC
>
> > -     if (!urb_priv)
> > -             return -ENOMEM;
> > +     if (!urb_priv) {
> > +             ret =3D -ENOMEM;
> > +             goto done;
> > +     }
> >
> >       urb_priv->num_tds =3D num_tds;
> >       urb_priv->num_tds_done =3D 0;
> > @@ -1571,13 +1582,11 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd=
, struct urb *urb, gfp_t mem_flag
>
> xhci_check_maxpacket() called here can't be called with spinlock held
>
> >                       if (ret < 0) {
> >                               xhci_urb_free_priv(urb_priv);
> >                               urb->hcpriv =3D NULL;
> > -                             return ret;
> > +                             goto done;
>
> Thanks
> Mathias

