Return-Path: <linux-usb+bounces-30895-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFF9C8448E
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 10:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 902593A29D2
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 09:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592F62EA168;
	Tue, 25 Nov 2025 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LqrvS/2+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE12D5932
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063857; cv=none; b=ugoJX4LGC2H9VClaDxyZdczCSbFSeJJwz0SFDABXGCHnGtjAZVxEYGEe5gyQnJIcDhrR0gd0et+QWHx5jGmx9TMxRhg4ctfwdsiV3fnhdyKK4liWmwnsb5QpCvVjHIdclU70AlRPcSlkKi3g+SbMeSIG3sK5rKirseKGSkFjOcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063857; c=relaxed/simple;
	bh=XykNi7AkimVsQL3oSrSRLTECJM5J/+iH3pNKaTW3NM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uw15UO4YfpFoK3gUyjscCwqe5xuxf1ROXXY8KMCGcQDzQ5aZHavRTPgiIFszU6U0QC34SkJqyG9I3UkB5kJlwdNibAFvkRaqcInp7ylwB4iE+CMB0X2cGpQJdALAp0u2DLYRzb5lDeKce5reh7peSoRpZpfIbJuGki/6TF+YX3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LqrvS/2+; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7c75b829eb6so3446839a34.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764063855; x=1764668655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1gLNd1gcOPtAKiI4l05uwoi1wIxZg6EoUB0+lqBskw=;
        b=LqrvS/2+DPu9iPTNkC5hHX6wY14AzLycrzmSl2ijumDZGrqUYvAjPSfE5KUkmH+GBM
         OoPmpgAX7+dkIBiF5nkXmdBrW06fhZx/rldIrmL7usQaAX5XuBh3/stVHAD3CMMNY6Ui
         KRPpKHPInBTya5HEM1gOo5v6XDpQN6JFTVOUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764063855; x=1764668655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1gLNd1gcOPtAKiI4l05uwoi1wIxZg6EoUB0+lqBskw=;
        b=kcDkWW2XNSAGPAZyKCugoVbjqkxigTuiNtMratghngVzKcWSZEI1ykPFSTVXI6N7ha
         Jz0hEMjQjWaGUzuwlcM+xDGlWtFC/tJ/AHK5emr2ComkhGKj/8zeEMT3E9HDICZ5wS46
         4RGPYTz4f+lq79fvbLq/Q5SLFXhiugEEm1kj3wInfMR+nYlWZ9F7xIDYe9Z+CmlKMKOE
         xopim1q7odADaO7wKm2BVdvYk77aehXD+T8UsWTyudn7x8leNQIEu4ZYwgK1DTKy5RXd
         lfxDwKuzp2TnSN1dacmqP4H2trDvqS/Kr9nUQctLLXV+huBda/ltt9NbPVpyXdGLFOAI
         0f1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXl9GtvcOfkAjJ7ZMKL/a9tr4kWuqLh7p2gkIcDMO0nSz8WyycOy72nzvEgSWuR98borsXiIhDPV7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdiOEjAqO6oparhEMn6oN3UUVwkIJ5yubnibZJLZVfq3yPf2J
	gXokcHRVfRmHEvJU4ahI/+pEke/CRy5BkvxcLA9gQVQcqvrMcTi/x4MTTfzCTyP0JXk6wrLBCEu
	x9fypn7NwK/XjAHP+XXH5Bj3h8EvGbddLcAsUq7cz
X-Gm-Gg: ASbGncs8LiGMRGpIi5h8sXSlVvRvKWWAEsWjQbLLtetUVrmySkPZuOwee2dGofP51g6
	KPhxmw1xIjHL2DihJPSKFNAoZmaUxFQ6L1uPz3SXSoMB/lpPxoYAeaAaT3rZXol4E+1ePKye1Oh
	yfclPrRgZ1bjA0NbHvtZbf2NHioAptPHFEyQhl0vdXB5zE28uUFKJaPmu3hggOYE4xMG5/XW62z
	wsY+RWVy2hokIugf+apGMmhrS6QPeqvmSSkc42jKYDxioIMvGAYKpJ42wUsYK4WMiMq8I36z0M9
	t5Mr1L/cqn4oS5NT8Yv48Mgy
X-Google-Smtp-Source: AGHT+IEkGwJp+putbQQTiHpx0n9ntPJgXGLT1mwvqKXZgr2sXCDl/TuaQt9xb5qMZ/UpcXm6wWh1no2pfEs7bMRGmGA=
X-Received: by 2002:a05:6830:3488:b0:771:5ae2:fcde with SMTP id
 46e09a7af769-7c798f7ba96mr7499840a34.2.1764063855221; Tue, 25 Nov 2025
 01:44:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122112539.4130712-1-jerry.xzq@gmail.com> <CAD48c-UjbPK4GewGpVVdEY30fhnhdAGQqrXQ3r0RgHc6suMo7Q@mail.gmail.com>
 <2025112237-brush-unseemly-7a95@gregkh> <CAEXTbpeKUMJKz-PV-ft5WCg5TYo22knBaMX2WwCWn=ix4OgX+g@mail.gmail.com>
 <2025112426-seventeen-duvet-d9c4@gregkh>
In-Reply-To: <2025112426-seventeen-duvet-d9c4@gregkh>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 25 Nov 2025 17:44:04 +0800
X-Gm-Features: AWmQ_bmbxKb1IG8n6cNB2y0E8-FDDeUCN9VGYC2eutlJJJPtvhvTZUEw6zXmRkQ
Message-ID: <CAEXTbpeN0Mk+Y-UeV79JzE547UCa_Fhh7T75L+2mhoSq3ark8g@mail.gmail.com>
Subject: Re: [PATCH] USB: of: filter disabled device node
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jerry xzq <jerry.xzq@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, Nov 24, 2025 at 11:51=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Nov 24, 2025 at 10:22:18PM +0800, Pin-yen Lin wrote:
> > Hi Greg,
> >
> > On Mon, Nov 24, 2025 at 10:01=E2=80=AFPM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > >
> > > On Sat, Nov 22, 2025 at 07:31:47PM +0800, jerry xzq wrote:
> > > > On Sat, Nov 22, 2025 at 7:26=E2=80=AFPM Zhengqiao Xia <jerry.xzq@gm=
ail.com> wrote:
> > > >
> > > > > We should not point the of_node of a USB device to a disabled dev=
icetree
> > > > > node. Otherwise, the interface under this USB device will not be =
able
> > > > > to register.
> > > > >
> > > > > Signed-off-by: Zhengqiao Xia <jerry.xzq@gmail.com>
> > > > > ---
> > > > >  drivers/usb/core/of.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
> > > > > index 763e4122ed5b3..6bb577e711811 100644
> > > > > --- a/drivers/usb/core/of.c
> > > > > +++ b/drivers/usb/core/of.c
> > > > > @@ -31,6 +31,9 @@ struct device_node *usb_of_get_device_node(stru=
ct
> > > > > usb_device *hub, int port1)
> > > > >                 if (of_property_read_u32(node, "reg", &reg))
> > > > >                         continue;
> > > > >
> > > > > +               if (!of_device_is_available(node))
> > > > > +                       continue;
> > > > > +
> > > > >                 if (reg =3D=3D port1)
> > > > >                         return node;
> > > > >         }
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >  Supplementing questions from the previous email:
> > > >
> > > > > What changed to require this?  What commit id does this fix?
> > > > > And what devices have a disabled devicetree node?
> > > >
> > > > fixes: 01fdf179f4b064d4c9d30(usb: core: skip interfaces disabled in
> > > > devicetree )
> > > >
> > > > Connect a USB device directly to the USB port, for me, LTE RW101.
> > >
> > > Why?  Why not just us the normal USB device topology?  Why is this in=
 DT
> > > at all?
> >
> > In our use case, the USB hub and the USB devices (e.g., modem card,
> > USB camera) are fixed on the board, and describing them allows us to:
> > (1) Describe the extra resources for the USB devices, like the usages
> > in drivers/misc/onboard_usb_dev.c. They are mostly USB hubs that
> > require extra power or reset pin, but there are also USB device
> > usages.
>
> The USB devices should NOT be in DT at all, only for hub controls that
> you need the extra pin controls please.

I assumed we should describe USB devices because [1] introduced
bindings for downstream USB ports for on-board hubs. Or should we only
describe USB connectors but not USB devices?

[1]: https://lore.kernel.org/all/20240223005823.3074029-2-swboyd@chromium.o=
rg/
>
> > (2) Let the userspace know which devices are fixed on the board, which
> > makes it trustable.
>
> There is different ways to do this, NOT in dt.
>
> > > > However, a disabled node is attached to the DTS node of this port.
> > >
> > > Why?
> >
> > This is the usage from a downstream DTS that hasn't been upstreamed.
>
> There's nothing we can do about that.  Please work to get it upstream.
>
> > The USB hub and devices are defined in a DTSI file, and another DTS
> > inherits it but wants to disable those USB devices. We expected that
> > disabling them should be the same as removing them.
>
> No, just disable them from userspace properly.

I mean, it is disabled because of some DTS inheritance, and I believe
we usually disable the nodes instead of removing them. How do we
disable them from userspace in this case?
>
> > > > &xhci3 {
> > > >         status =3D "okay";
> > > >
> > > >         /* 2.x hub on port 1 */
> > > >         usb_hub_2_x: hub@1 {
> > > >                 compatible =3D "usbbda,5411";
> > > >                 reg =3D <1>;
> > > >                 vdd-supply =3D <&pp3300_s3>;
> > > >                 peer-hub =3D <&usb_hub_3_x>;
> > > >                 status =3D "disabled";
> > > >
> > > >                 ports {
> > > >                         #address-cells =3D <1>;
> > > >                         #size-cells =3D <0>;
> > > >                         port@1 {
> > > >                                 reg =3D <1>;
> > > >                                 usb_hub_dsp1_hs: endpoint { };
> > > >                         };
> > > >                         port@2 {
> > > >                                 reg =3D <2>;
> > > >                                 usb_hub_dsp2_hs: endpoint { };
> > > >                         };
> > > >                         port@3 {
> > > >                                 reg =3D <3>;
> > > >                                 usb_hub_dsp3_hs: endpoint { };
> > > >                         };
> > > >                         port@4 {
> > > >                                 reg =3D <4>;
> > > >
> > > >                                 /* On-board WWAN card */
> > > >                                 usb_hub_dsp4_hs: endpoint { };
> > >
> > > That's the thing I don't want to see, why is that WWAN card described
> > > here?  Why can't the normal USB device discovery find it and use it
> > > properly?
> > >
> > > >                         };
> > > >                 };
> > > >         };
> > > >
> > > > Based on the current code, the of_node of this directly connected L=
TE
> > > > device is hub.
> > >
> > > But why is that needed?
> > >
> > > > If there is only one LTE interface, then the of_node of this interf=
ace
> > > > is also the hub.
> > >
> > > Again, why?
> >
> > We haven't had a driver for the LTE card on the linux mainline.
>
> Why is it not merged upstream?  That should be a very simple thing to
> get accepted.

We would love to, but those work was deprioritized internally.
>
> > But,
> > it is using M.2 USB interface and requires reset and enable pins, so I
> > believe we want to describe it as a USB device in DT, and implement
> > the resource control in onboard_usb_dev.c.
>
> No, that is not how USB devices work, they should control themselves.

I see "RTL8188ETV 2.4GHz WiFi" is included in the onboard_usb_hub.c
driver, and it also seems to be a USB device that requires extra
resources. Shouldn't we describe them describe them in DT and include
it in onboard_usb_dev.c if there are hardwares designed like this?
>
> thanks,
>
> greg k-h

Regards,
Pin-yen

