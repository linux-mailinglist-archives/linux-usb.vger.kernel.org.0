Return-Path: <linux-usb+bounces-30867-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B1C80FB8
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 15:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 330CD345AA0
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 14:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CF530F81C;
	Mon, 24 Nov 2025 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kcDA25W6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C6530F7E4
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994154; cv=none; b=R06IxNs/J3FdOLrgmLIFJCIPeM99+d5afrvIFfXOa68nPyiSwFI3whIOtBIJ6ZVbptO8JmchU7MmIhvRwnASaWSyhi05Yv/D//RmcUJFDWWz3MX5/BrEpaOLPs/WYROTLhWNSuFlido7uCb5rSa9scdJSld4IiT8JVFfs0250lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994154; c=relaxed/simple;
	bh=KEvaQ3xqFXBsNxNIk76yfZGOJnhTmsX3c3+Dnb4riQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1bRgKSPJBBPJ7r1abi3Bbuug/qp7nLO5eQAWs2slsCct4dYPEvECS0TKkCjqtlCAXn4++Ync+1UiqvUQUJux9CAuV5iGyd5/T0s4Gf70IoEUDSvQwOu1k2N+jQ1VzjvaxjzE35gaXAxziJFdZxVB0+gRt1lgogx9xoAJ1Ns9Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kcDA25W6; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c6d13986f8so2708589a34.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 06:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763994150; x=1764598950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HrcXWLVrP9rhCi27v1Tl3LovR0EPeETaQDm004Rdcs=;
        b=kcDA25W6F41FATFVKWwEl9nJlSbh7nZsn5YqkLqim8RGivjDMARm+P0avn0JptbM/0
         ukh4UHdSjnh7yUud7h6pTHZeW3vOuXJoSP02+YpqnRHdlL3/EJYSqJIkbecB/HAbdvLX
         4woPhth89vCvR0aDO6Qtq5nUSOxMAyznk4bhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994150; x=1764598950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2HrcXWLVrP9rhCi27v1Tl3LovR0EPeETaQDm004Rdcs=;
        b=dHNDeUf1OjLOd3Lw9y/gQLSMC5lpCGVzqiCqFCq8WvAJNfAHe5Q2yzkpiMbGm6D7Un
         i9BE7a1+klxtMY6WRVbdpQT/fa1FNKz8nsGOAkVR/q4lNWX+98dkLk6Xq8zmfn6XXeIj
         +Gs6A4nLs663i9kW1zBH5wfCx5ETTHYfZijQxFtrkk1Shvfr2YyVBmL5FdHxnp33hOhq
         qDPo9vDylQjVnB7S7FRxC2WlyxdK+PsY0lr8g2Gy++ofmOKlYTPtQ55AH9oiA7p03iv7
         TFXoEgyXFJeZzBqoBQEcRHpc6zDOCQZ9Lc6R6c9s1yG3YcRO72hOO6KK3/tcsjpe9lUi
         bXWg==
X-Forwarded-Encrypted: i=1; AJvYcCWfHxCV+u+zGB3QAO0nk5D3NFEhvUrHF2CRKqRmqRV5MV+hEZzqbsY6ptrN5deBX/P55DBU7Umenks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy42Uk1/jUmoriHIFSpkwBu84ebdNEIX4R6Y5f9/ITBQbzFXwpz
	VVhtVfkCFSacUHFv771PV+rq/IHrjH3lNHQpk+Vl6ugQgee4g+8vso4xCWFklBRc7DC6aYmNNi9
	vUsHsYAvGQXfVgs+Ti1TwuXKiGkxoWkim5R9BSIUW
X-Gm-Gg: ASbGncvKks4qr9fPhrxgzJgoaC9YP6IofQe5MFdqx9D55xBAitKAr3+prWu4zVuSejO
	R6J230RL69F57zU2JXbdO490zv5gm/ZbwsYA5GdRQ01GFkArU5Nto4Rv7wh2VXsaGjLGZEipeQJ
	LN3kidHgcCM0ziJgokldcMtt9s9Y68DS54DM9nNHfedrnwIpWKt27URBzIZ/qfGRqwi1Oe+3PiJ
	KSHn5JH4kM6r+zHONqWUVW38AbBft5o5xOqFkvTRvhjVh5yUDK2YehTk93Nka45otil5Mhwv9co
	YIzlShvs1wzsx6T5m0PTDJLrWQ==
X-Google-Smtp-Source: AGHT+IFquz7QAmEPz+Yj2zrHe4S1CtARTmIL9ZejnBIpRGjHGAoCnIRdK6s3B3CXzgEoZ3b5WhDu0JqGPIja0a563Jc=
X-Received: by 2002:a05:6830:4108:b0:7c7:68d8:f70f with SMTP id
 46e09a7af769-7c7989f089fmr6900274a34.3.1763994150438; Mon, 24 Nov 2025
 06:22:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122112539.4130712-1-jerry.xzq@gmail.com> <CAD48c-UjbPK4GewGpVVdEY30fhnhdAGQqrXQ3r0RgHc6suMo7Q@mail.gmail.com>
 <2025112237-brush-unseemly-7a95@gregkh>
In-Reply-To: <2025112237-brush-unseemly-7a95@gregkh>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 24 Nov 2025 22:22:18 +0800
X-Gm-Features: AWmQ_bmPyn51bMfB-dgdYNiCBo6YkC7iUhgIm1No5iqEc-PHmFc_DcyI40JC3Wk
Message-ID: <CAEXTbpeKUMJKz-PV-ft5WCg5TYo22knBaMX2WwCWn=ix4OgX+g@mail.gmail.com>
Subject: Re: [PATCH] USB: of: filter disabled device node
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jerry xzq <jerry.xzq@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, Nov 24, 2025 at 10:01=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
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

In our use case, the USB hub and the USB devices (e.g., modem card,
USB camera) are fixed on the board, and describing them allows us to:
(1) Describe the extra resources for the USB devices, like the usages
in drivers/misc/onboard_usb_dev.c. They are mostly USB hubs that
require extra power or reset pin, but there are also USB device
usages.
(2) Let the userspace know which devices are fixed on the board, which
makes it trustable.
>
> > However, a disabled node is attached to the DTS node of this port.
>
> Why?

This is the usage from a downstream DTS that hasn't been upstreamed.

The USB hub and devices are defined in a DTSI file, and another DTS
inherits it but wants to disable those USB devices. We expected that
disabling them should be the same as removing them.
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
>
> >                         };
> >                 };
> >         };
> >
> > Based on the current code, the of_node of this directly connected LTE
> > device is hub.
>
> But why is that needed?
>
> > If there is only one LTE interface, then the of_node of this interface
> > is also the hub.
>
> Again, why?

We haven't had a driver for the LTE card on the linux mainline. But,
it is using M.2 USB interface and requires reset and enable pins, so I
believe we want to describe it as a USB device in DT, and implement
the resource control in onboard_usb_dev.c.
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

Hope the above reply answers your questions.
>
> thanks,
>
> greg k-h

Thanks and regards,
Pin-yen

