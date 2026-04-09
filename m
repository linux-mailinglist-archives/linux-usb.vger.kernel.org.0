Return-Path: <linux-usb+bounces-36092-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKn3JqNg12keNQgAu9opvQ
	(envelope-from <linux-usb+bounces-36092-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 10:17:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6F3C7A06
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 10:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 436BC305EE7C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 08:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D52F39DBEA;
	Thu,  9 Apr 2026 08:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="R8TpHwQH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA9D396B6F
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722406; cv=pass; b=RZTJEgZPPCGWlsa0kd1GpI8iMcloOqAswYvD1K+XQ3mx5ddL/SAwNjAYNR9dBVAbkOZoONBYmxd1QqGFJguOKq/FAQjTBJBsdWYWkAYW1NkXmuF/d15OghibiydEUaUWwoC7Jl9I0YgOzIjNOopJieMmsPQUIad8nlXED7tpaGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722406; c=relaxed/simple;
	bh=IJJYXkJSgLMENY1RzS7Emu2PbcjlpJ+pewoYr3PdWPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtEeCDIqpxM0AJUzsqXZetoLo2/KbC+Ijmdxq9hSe8U9MAxERsQxTvl7hYz92CMZA1A95yij40Gg0+DH8irQLvlztBV1hMngeFlV0F0ud6sUyCV1eNJI9RQ3m+LmNQrDSyYOR7ZsnnaHPO4R5NfYYx4b9hJjbqc9CP/gICNFTWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=R8TpHwQH; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6501547d7edso664928d50.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 01:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775722403; cv=none;
        d=google.com; s=arc-20240605;
        b=OELhOykYeLcbXn6S7DD7Xy4Nb837aIiCkIA2zNdIbcbME/6cSXuVkRue8Fciw8ktRI
         sbkuMr5Xg9m0caEpNgyIxRZ6SPy8J27wF/Z7jACe3WtGjuAwzrHvvRp/4330mDDVTfdi
         0AEEtQmHcYlXRw36JHOTgcNW4kCf/9hk5t63yoI+fS+94mA4o9wArPUsbXerfwu58uwQ
         fKlGcfrDh8TxUNAogNGSmaqpJd4tmaDILwmoZlKKqwngkXGAV41KC4VD+FonrugJeewu
         /Y/9kc3syKdVAUJC9X//x/24Y2+4XLgFrG6MdhviKe9G1rLBKyfBWzOg9bG0iDQY4sw9
         X05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m2T0HzcPHFjquEbAcpJZqmSt5vKZwxpwTJQgZ4CtwnQ=;
        fh=mvcPJ5Y90n/P0l96BY55schBjH+zeHHf+vyxvcpKOTw=;
        b=OnqhXqEUOdVL9/ywWD1Md1HIXbG7j55r2zh288zRMrhkHWUr/dqx8QheGxeFKMVyQk
         IfyCm+gP5jqJ1H/vap1KiBHzfFKSps+AghT/JU3jxim5pGacQOo+aPzI6T7gwBFY01qQ
         tkuQrj2D/LyYNlVl1Zax8BhGrfkPvLtmjGMzh8RmemUjwXxd7lERrZMGVba/EbdQB6os
         GGtQ5/8yw6i8ajQBX2eEmFEKszwm6qRHCpG8xArcU3IlB2Y9sbaQdN2FexwiIWHUHDcl
         mi7nJG+1dhJ9Kk+Zk5Mh7Aorqg6j9RE4lJS8MK28lsS00liDncZm9U6dsyB20Ykry/X0
         yyIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775722403; x=1776327203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2T0HzcPHFjquEbAcpJZqmSt5vKZwxpwTJQgZ4CtwnQ=;
        b=R8TpHwQHR0C5fE1XpMhj0YXU5pMD0j3cC++5/Pu6XlDxDV2Y5X6tcTcNCG5oIhEA3h
         8paBrzcelWNhdM4T3kDdc/6MacF5Mv6Mrxylv0g6liz3tTNpf3kn/M2VAhSV0uqP5s+Q
         inZYRrN8z35Adq9FAe2OUV+ITnuIecPUZBYJ2LzPICRwXuHy51XSLNKv0YJOI3WKOc2P
         1cvN0e/WJoIw9UEwC99X4eCJBYrkZ7YX4n+/5G0yQTzDAclzU5W5Hhvtrwb1lFMNyYTr
         HazAIMIbHoWxy5kwhWveSilaZRB9JxfhURTk0s0TE8s2WbIW+ztSg+/+B1PKBj9NkN34
         WrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722403; x=1776327203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2T0HzcPHFjquEbAcpJZqmSt5vKZwxpwTJQgZ4CtwnQ=;
        b=pO/N3ZvSGXPX2c3svUnI/z38t0/RXf0JhpF1eJjQUohjDkK4N4dpITaGn1bzafHT1B
         Mq7CLsTOMLUGRVdPvihLoT/ESQE0VqbYGrST9YSSYpxH6yokWyiDzLMrwmmowyuQjyRx
         KZ8+w1slC6pQk4PH5b2gx6Z3wT3QRcJHj4FN9FwbmLl1gYkLx9jp3ecCaRr0vuMqFDRm
         6FgM2qfNJeKmZsUlLuWLbcaX3Vh/Qu4AkiWLjyWMfmw1Lsvq0VLeLZXXc9C/8THtw/k3
         qugc2W3JV5EoVrzn6tWnlVYltuIAwpjfvF9OZgdgHf4+lyx4yniqqas39d4ZKb1+wWEE
         00Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWsrglOd5KRkt5eQ5DZMqL9SXlZpjM9MLZyRGQpa8bkCVRuBt5jzneQWLy2wVleRrWiMr0Ski19+mI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlOI2cpz8Xyo7X60ozaBTPugaa8ojZidMLBpJuSJe22r0GRdjM
	2lXhu41bextfO55J2eMaXbPhN8osZIsAE7GVRHgnfPA4sJnV1YaF4PJJPteNvNDIcw4qFzPQftc
	4kXZ84xnNHs2gjCeluvHFAKnff4isCg6YU2zyRThJ
X-Gm-Gg: AeBDieuhj+lIvjjLv/nAYAXfQ4nu6muO/ZQzscPoBHRuCiGbZPh6hHWB7u1/6ZmVIsj
	ZcBpB8QnpmShN46y3j9BC4OBrR1WILJnfghk3hnacL7LWwfkniWow2tP36u5ss3GbncMeH4aR0c
	OK1hRorn2faeFRzd5BePYloSU3sUXx69tdxR19zMmgT13rfVtOOL71Wm1dcYyZRcuukbL8JRkbz
	Oe+oeCu6mpDBwojGGzzDY7YdmZTeADNcC7EN04EtSDZ7ZIiUEAfFr/rCnh1rc8yXMhUxpArMbIz
	B6hR
X-Received: by 2002:a05:690e:190b:b0:650:4bc9:afce with SMTP id
 956f58d0204a3-6504bc9ca70mr21794740d50.63.1775722403434; Thu, 09 Apr 2026
 01:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260409074242.2115657-1-jp@jphein.com>
 <20260409074242.2115657-3-jp@jphein.com> <CANiDSCvNLVO7EEMO-FzSD1cteoMUTcftaXqvw5-AW-VqKLkNxA@mail.gmail.com>
In-Reply-To: <CANiDSCvNLVO7EEMO-FzSD1cteoMUTcftaXqvw5-AW-VqKLkNxA@mail.gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 01:13:12 -0700
X-Gm-Features: AQROBzD_A3xnAuqRKEGC2IfuxUge1mX9ZzVr0JIXFoo5GdzaKM2lsdH9M6XQj7U
Message-ID: <CAD5VvzBQEvRPQiyeaEEXBRQjmNRWN5L1_-RCmR3KNnOYBkUUYQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] media: uvcvideo: add Razer Kiyo Pro to device info table
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36092-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email]
X-Rspamd-Queue-Id: 03E6F3C7A06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Full lsusb -vv output included in the v7 commit message.

Thanks,
JP



On Thu, Apr 9, 2026 at 12:58=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi
>
> On Thu, 9 Apr 2026 at 09:44, JP Hein <jp@jphein.com> wrote:
> >
> > Add a device entry for the Razer Kiyo Pro (1532:0e05) with quirks to
> > work around firmware bugs that crash the xHCI host controller:
> >
> >   UVC_QUIRK_CTRL_THROTTLE   - rate-limit control transfers and skip
> >                                error-code queries after EPIPE
> >   UVC_QUIRK_DISABLE_AUTOSUSPEND - prevent runtime suspend
> >   UVC_QUIRK_NO_RESET_RESUME - skip post-reset reinitialization
> >
> > The firmware (v1.5.0.1) has two failure modes: it stalls endpoints
> > under rapid control transfers (~25 without delay), and it fails to
> > reinitialize properly after USB power state transitions. Both can
> > cascade into xHCI controller death, disconnecting all USB devices on
> > the bus.
> >
> > Bug reproduced on two separate Kiyo Pro units running simultaneously,
> > confirming the issue is not unit-specific.
> >
> > lsusb -v:
> >   Bus 002 Device 002: ID 1532:0e05 Razer USA, Ltd Razer Kiyo Pro
> >   Device Descriptor:
> >     bLength                18
> >     bDescriptorType         1
> >     bcdUSB               3.20
> >     bDeviceClass          239 Miscellaneous Device
> >     bDeviceSubClass         2 [unknown]
> >     bDeviceProtocol         1 Interface Association
> >     bMaxPacketSize0         9
> >     idVendor           0x1532 Razer USA, Ltd
> >     idProduct          0x0e05 Razer Kiyo Pro
> >     bcdDevice            8.21
> >     iManufacturer           1 Razer Inc
> >     iProduct                2 Razer Kiyo Pro
> >     iSerial                 0
> >
>
> Is this the whole output of lsusb?? Can you try with lsusb -vv?
>
> > Signed-off-by: JP Hein <jp@jphein.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index 775bede..9b6df8e 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2880,6 +2880,22 @@ static const struct usb_device_id uvc_ids[] =3D =
{
> >           .bInterfaceSubClass   =3D 1,
> >           .bInterfaceProtocol   =3D 0,
> >           .driver_info          =3D (kernel_ulong_t)&uvc_quirk_probe_mi=
nmax },
> > +
> > +       /*
> > +        * Razer Kiyo Pro -- firmware crashes under rapid control trans=
fers
> > +        * and on LPM/autosuspend resume, cascading into xHCI controlle=
r
> > +        * death that disconnects all USB devices on the bus.
> > +        */
> > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             =3D 0x1532,
> > +         .idProduct            =3D 0x0e05,
> > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   =3D 1,
> > +         .bInterfaceProtocol   =3D 0,
> > +         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROT=
TLE
> > +                                       | UVC_QUIRK_DISABLE_AUTOSUSPEND
> > +                                       | UVC_QUIRK_NO_RESET_RESUME) },
> >         /* Kurokesu C1 PRO */
> >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > --
> > 2.43.0
> >
>
>
> --
> Ricardo Ribalda

