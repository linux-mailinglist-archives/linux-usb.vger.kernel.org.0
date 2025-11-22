Return-Path: <linux-usb+bounces-30831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 63417C7D15A
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 14:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3C88934E56B
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 13:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64C71946C8;
	Sat, 22 Nov 2025 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbeL8Irx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925F219E8
	for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817343; cv=none; b=lV7cIvReXeGNt3Ihx5DkYkGDaGneoBQaAdwSu1BCt0OGL7Mrf15aAE5f9vUfz9Ds9s2EPoiOf21eSUrwy4e/WyoyPFclkiPsCjRtBMwG/TPcn//owxpdPVI8XpkAwaNIc8ltK5M48P7RmHS2DYhGoLvNCoKHhmOJOybikx0Ho+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817343; c=relaxed/simple;
	bh=B6Y4/fZAZEYsJ2YKx0oiLuBkkeFVSiEZtPSOPesLf6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6IS+aKC2hOPQTgxksewOi/zqIb1yPkxGm5ed/sS9qwAc7HBSqmZ7/h70CXwOfKvvi+vMQ07OvddDiNkUwG18CB2nbmKG5lY8/oGEolW0/UeaeKQpRMM+oleqhbKBRYyNeR4kPlRVtALUIOBhulYHDpvGu6is5EIvhaeDH0lcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbeL8Irx; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-786a822e73aso29872187b3.3
        for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 05:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763817341; x=1764422141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1S+ja0RTWHQtphatY/G22uG586DuFYrpoM5yUgJ1qos=;
        b=KbeL8Irx6EzczWSCwmgJjcPRs+DKlA/0K+8mnm62RSHr7n1emgPM6GNSQVZ8uZuYR2
         lChZ1IsjOFVJlOuaJUdWJWTA6M4RSr7NV4Z2YhK55JLTKmUqp/qU3O1QbhvmPcXfQ1Is
         mV5QOK+uFot4l8LpxUH/YrHmjQOqeJVWS1ObUI+FppLsYH2zbYcom8HFx8pt7Dy1M+Nb
         arBLm2lbVdyh0HVRnos/zAko4P8xDExdlHtk418wpy73N38A6CWpVce+Fp4nnoLRn9mC
         hKH0DBt3BefBNPCI45L19qBir1ndbihlOf4Nsd8pVhxV5H/oKSE4vXe58Y8mz4HU3LJK
         VUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763817341; x=1764422141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1S+ja0RTWHQtphatY/G22uG586DuFYrpoM5yUgJ1qos=;
        b=ewki2JieSdWgWUtjSfWc4JPLbkCZG+32DHdWNto3X8ZcG9lrreIB1gk9Rt1S1g4tZl
         /U+QGgWzwBdVpMJDX4ohkJcMb09WmhRvEycZnCWF1HCJKUPlOKUE+xIFu/eNK5rhr6JW
         h7Wlt7mAvaONQmBETS7xd2zM2qKMwAxm+aFdep3Z+FIVm4BUTIFYZI/3HvY1/5MeOF0h
         WgPoSArMpFThaeccXnr5IrKodLgWdmoUGdtFDtgDbWkff2Rs99zE9kZQgZKxyAdnMUMH
         OPlKKD2u/0fd8fWvb0XpIxvzOvECfNCOIXs+VPkp5vr1YbjSdTrZE83PPH6nFb6MtLv3
         007A==
X-Gm-Message-State: AOJu0Yyd3Xq/X2k0fVY98BEie4lTZoxO1AqMzhIOafUlbpUO3E30KA0Y
	kikiVXVHhL8aGqd4mqX7+3H4UEHy4VBKVGhdOS/9vRexryuOHfnFOIuvEHVoUFKiX48xWwTqmM0
	ey9bXdEVxcYcZRZvHEKxLWU/iPxTuGkcgqerNxuO2+g==
X-Gm-Gg: ASbGnctDgl1bAJYxmrIHI8uzTeu+I30ibJljXrCJkjn2mRN+gxTrHjg2IHfcydiO0Jq
	did1x3+T/aqLr2qG1wvOsn5VHbHnEYYwQ2gzL2Lk2zcdh1Np92GNHhn/BgQW/qwI6poCKwvNCES
	WhGfB54/b87wrZZSl0vBvUYU0/Jt7nZ3De7Q+MveTf/jE0gVVG/HYNhyjblnMDxk0tDGYce8AWJ
	lJEerxhNJv8nHk9iTs1gSpwg4XolC0qUU7V5UD6dkAuAqhoO0LkfZK4Iz8utYBDIlU8Kbt2
X-Google-Smtp-Source: AGHT+IFKev2zbyQhanLLzlttHKwpq1D5mPVafgzZ7/eV7vybnWT8I/hGS93CBHlsOfllCbzlbT/l9wILSaKnJ8wLzwQ=
X-Received: by 2002:a05:690c:38d:b0:786:5fdc:1d41 with SMTP id
 00721157ae682-78a8b54c454mr49820137b3.54.1763817340616; Sat, 22 Nov 2025
 05:15:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122112539.4130712-1-jerry.xzq@gmail.com> <CAD48c-UjbPK4GewGpVVdEY30fhnhdAGQqrXQ3r0RgHc6suMo7Q@mail.gmail.com>
 <2025112237-brush-unseemly-7a95@gregkh>
In-Reply-To: <2025112237-brush-unseemly-7a95@gregkh>
From: jerry xzq <jerry.xzq@gmail.com>
Date: Sat, 22 Nov 2025 21:15:29 +0800
X-Gm-Features: AWmQ_bn1t_tLkq7raS2XMOoK4nlrHRdP-HSz8yOoJWPoWnFIM79nJnpg-69MQcQ
Message-ID: <CAD48c-UgjXdPuKswm9_KgPT2xkWR4Aie1fG5p9AGRgukFs-gOw@mail.gmail.com>
Subject: Re: [PATCH] USB: of: filter disabled device node
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 8:34=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Nov 22, 2025 at 07:31:47PM +0800, jerry xzq wrote:
> > On Sat, Nov 22, 2025 at 7:26=E2=80=AFPM Zhengqiao Xia <jerry.xzq@gmail.=
com> wrote:
> >
> > > We should not point the of_node of a USB device to a disabled devicet=
ree
> > > node. Otherwise, the interface under this USB device will not be able
> > > to register.
> > >
> > > Signed-off-by: Zhengqiao Xia <jerry.xzq@gmail.com>
> > > ---
> > >  drivers/usb/core/of.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
> > > index 763e4122ed5b3..6bb577e711811 100644
> > > --- a/drivers/usb/core/of.c
> > > +++ b/drivers/usb/core/of.c
> > > @@ -31,6 +31,9 @@ struct device_node *usb_of_get_device_node(struct
> > > usb_device *hub, int port1)
> > >                 if (of_property_read_u32(node, "reg", &reg))
> > >                         continue;
> > >
> > > +               if (!of_device_is_available(node))
> > > +                       continue;
> > > +
> > >                 if (reg =3D=3D port1)
> > >                         return node;
> > >         }
> > > --
> > > 2.34.1
> > >
> > >  Supplementing questions from the previous email:
> >
> > > What changed to require this?  What commit id does this fix?
> > > And what devices have a disabled devicetree node?
> >
> > fixes: 01fdf179f4b064d4c9d30(usb: core: skip interfaces disabled in
> > devicetree )
> >
> > Connect a USB device directly to the USB port, for me, LTE RW101.
>
> Why?  Why not just us the normal USB device topology?  Why is this in DT
> at all?
This is why I need to disable this USB hub node.  I didn't want this
node to work properly, so I disabled it.

>
> > However, a disabled node is attached to the DTS node of this port.
>
> Why?
please see:
https://github.com/torvalds/linux/blob/master/drivers/usb/core/usb.c#L731
https://github.com/torvalds/linux/blob/master/drivers/usb/core/of.c#L25

>
> > &xhci3 {
> >         status =3D "okay";
> >
> >         /* 2.x hub on port 1 */
> >         usb_hub_2_x: hub@1 {
> >                 compatible =3D "usbbda,5411";
> >                 reg =3D <1>;
> >                 vdd-supply =3D <&pp3300_s3>;
> >                 peer-hub =3D <&usb_hub_3_x>;
> >                 status =3D "disabled";
> >
> >                 ports {
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <0>;
> >                         port@1 {
> >                                 reg =3D <1>;
> >                                 usb_hub_dsp1_hs: endpoint { };
> >                         };
> >                         port@2 {
> >                                 reg =3D <2>;
> >                                 usb_hub_dsp2_hs: endpoint { };
> >                         };
> >                         port@3 {
> >                                 reg =3D <3>;
> >                                 usb_hub_dsp3_hs: endpoint { };
> >                         };
> >                         port@4 {
> >                                 reg =3D <4>;
> >
> >                                 /* On-board WWAN card */
> >                                 usb_hub_dsp4_hs: endpoint { };
>
> That's the thing I don't want to see, why is that WWAN card described
> here?  Why can't the normal USB device discovery find it and use it
> properly?

I want to disable the whole hub.

>
> >                         };
> >                 };
> >         };
> >
> > Based on the current code, the of_node of this directly connected LTE
> > device is hub.
>
> But why is that needed?
this is the behavior of code:
please see:
https://github.com/torvalds/linux/blob/master/drivers/usb/core/usb.c#L731
https://github.com/torvalds/linux/blob/master/drivers/usb/core/of.c#L25

>
> > If there is only one LTE interface, then the of_node of this interface
> > is also the hub.
>
> Again, why?
please see: https://github.com/torvalds/linux/blob/master/drivers/usb/core/=
of.c#L57
>
> > With the following code, the interface will be unable to create a devic=
e.
> >
> > if (intf->dev.of_node &&
> > !of_device_is_available(intf->dev.of_node)) {
> > dev_info(&dev->dev, "skipping disabled interface %d\n",
> > intf->cur_altsetting->desc.bInterfaceNumber);
> > continue;
> > }
> > Then this LTE will be unable to create a device.
> > this is not the result I wanted.
>
> Then try removing it from dt entirely, it should not be necessary to
> describe USB devices in dt.
>
> thanks,
>
> greg k-h

