Return-Path: <linux-usb+bounces-6350-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57690853390
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 15:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 100D128BE3D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 14:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4F758AC5;
	Tue, 13 Feb 2024 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b="XltMvdij"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5E95EE6A
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707835837; cv=none; b=F8Sf3ox3pYkDtZ64X4Ca2hpO19+pmOavhq5Mq+IatFK3Q6mhZydRjbHucw5c+biXDanhp0j+7rpHLZvfeo7S+MaC+DI3AhS6PWgUz8Fq/WZk2J9Uh0sFa8nQhAC9N1dNxVR2uizgJQHCxYKa6zGl5jHpaQsGtAvgSKytAGQsJnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707835837; c=relaxed/simple;
	bh=CZoN3i7XJzre4jd4qikn3fslxobuEEEJDNql/BAQ0/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAbeqZNGsPBi36Qy7aKl6rSsmhFjJENw9sZBDU3XG/qOH/QcmqGtj2AQ39V47/rttLE4HQizVtzgdvk3dZxtndoI5etOhDuA0Wf6Tlpi8oLm8zUmK4JLRAN5Tpig4fiflniynp6qyvWa+SZsEoAv9lxctJFup+gupuTZfQVx21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re; spf=pass smtp.mailfrom=mwa.re; dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b=XltMvdij; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mwa.re
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d10d2da73dso6812391fa.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mwa.re; s=google; t=1707835833; x=1708440633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIriFNrO5RwDl0i8OFgd8O5e6yhYA4cnaSts661zHg4=;
        b=XltMvdijGPwlIJbJKI9asq1MbMVkCeNT6bgaLoL9drYtnRSDorpL62fRPTcdXFMK1y
         ZcGbuaEjW/qqnhxKkWYmU6agO9KzyE14mcAYP8tXhaXytqzeHg1r/YTRAmP4zFd9w1Zf
         CD9gpTpQ2f72nqCWfoKpO7tQ7j4ly7KQDixtgCkPIdavEpTlaRKCJaYpS8dRs4J+o97B
         eFXpFVE9SBB7H1L7dp6peC6RpT/CIdfZUDJPu9fRpJqj54V7nPObg2COnUx/w4lbozs1
         OU2s9Pl2s+iMeVUA5uLIJE9iNqy0Gc2If3aERiSIyJ0biLuVQ72Ir/AODdmb47T29hJI
         vRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835833; x=1708440633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIriFNrO5RwDl0i8OFgd8O5e6yhYA4cnaSts661zHg4=;
        b=kJnuQK+Pl+WQJeLwYET1q11U0+XIT6cvmPE8B/PQJEiNNQMdEwpFJ8SgD0X56l0WPP
         CA1Sh+WayDuHfT0PoWpUaJ8j61fgxQilfwZYNZeGLOLdhzh1AV0IssK1zcx3xPSw/1VQ
         0vmhnc6GnJ52ZZ0n7DGBaSXVhNYZ/5MTOLt8M88UVUETEjvy6bq54pllD7btxLZtHcWP
         v16K4Ua+IUzDBJU4hrcyFpPaRwMJGIIB04aohlX9uDI/ggnk71Pgs2Lv2OU/wjV2gN/+
         1/Ni48WcrpyspMpffn4GOQO3bRHFec6+kj3H5a0FxtZ7VYgCRuPQyvbThZclMrjq+JXF
         Db3g==
X-Forwarded-Encrypted: i=1; AJvYcCXvpCydksctpKxNB/sHGMp+XhXVYi1B8LAwcWjwSiLF6pqzL3sWF3OqJjM7TytyLPZWQHhIMiFARwtsqApJqESLuaiqgkJXhmUH
X-Gm-Message-State: AOJu0Yxjcp+6IzD8bIruMAjjvvpeuVDfrW/XJqnkY8zdWN8Q9She0qCt
	d5UJMiIfQe6Oaj91mmtDSyXurajtzighqJgx6f3EpmU9DlXE54iKWSA95Bb/4Ol9vBDm03AGWKW
	ESB11qkL5jFej3f6WbsxZ74Y5rgpXJp2BObXDcg==
X-Google-Smtp-Source: AGHT+IHxYSwVhZhFR6FRJarX3HSiuN0jewWaPBZ+hlua2hMm5m6FSUCCwcoPApsKWpjN0PEEMuG0WfXqcLCGiOPO4pg=
X-Received: by 2002:ac2:41ca:0:b0:511:1ed7:61b8 with SMTP id
 d10-20020ac241ca000000b005111ed761b8mr6948902lfi.30.1707835833350; Tue, 13
 Feb 2024 06:50:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANi1PHh4W7KPagKkvZW6cNAQqgAeG3zxaaTJKkg3KiTbsFRMdg@mail.gmail.com>
 <1b2558f7-94ea-123e-dd3f-b43ecd85c2ef@linux.intel.com>
In-Reply-To: <1b2558f7-94ea-123e-dd3f-b43ecd85c2ef@linux.intel.com>
From: Jan Henrik Weinstock <jan@mwa.re>
Date: Tue, 13 Feb 2024 15:50:22 +0100
Message-ID: <CANi1PHhY67HZxivA9mCoNXfM4YUOjm=tCZsnhrrcu4E6dqDYUQ@mail.gmail.com>
Subject: Re: XHCI without USB2 ports
To: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas@mwa.re>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Di., 13. Feb. 2024 um 10:58 Uhr schrieb Mathias Nyman
<mathias.nyman@linux.intel.com>:
>
> On 12.2.2024 20.39, Jan Henrik Weinstock wrote:
> > Hi all,
> >
> > I am currently working on an XHCI platform device simulation model. I
> > noticed that the Linux driver (Linux 6.5.6 xhci-hcd) stops working
> > when I configure the model without any USB2 ports. During an interrupt
> > (TRB_PORT_STATUS), I only get "xhci-hcd 12100000.usb: ignore port
> > event for removed USB3 hcd."
> >
> > During xhci_irq, in handle_port_status, xhci->shared_hcd is NULL [1],
> > so the interrupt gets ignored. However, shared_hcd would only ever be
> > allocated during xhci_plat_probe [2], if the device has both USB2 and
> > USB3 ports, i.e. xhci_has_one_roothub returns false [3].
> >
> > Without any USB2 ports, a shared_hcd will never be allocated in the
> > first place, and handle_port_status will always exit early.
>
> This is true.
> That port handling code is from a time before xhci driver supported singl=
e
> roothub setups.
>
> I think all single roothub cases so far have been xHC hosts with only USB=
2
> ports. This is probably the first one with only USB3 ports.
>
> I have a vague memory that USB3 specification would require USB3 ports to
> be backwards compatible, and support USB2.
>
> But xhci driver could still support it, does this change help:
>
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index f0d8a607ff21..6ef081f5ef05 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1893,7 +1893,8 @@ static void handle_port_status(struct xhci_hcd *xhc=
i,
>          }
>
>          /* We might get interrupts after shared_hcd is removed */
> -       if (port->rhub =3D=3D &xhci->usb3_rhub && xhci->shared_hcd =3D=3D=
 NULL) {
> +       if (!xhci_has_one_roothub(xhci) && xhci->shared_hcd =3D=3D NULL &=
&
> +           port->rhub =3D=3D &xhci->usb3_rhub) {
>                  xhci_dbg(xhci, "ignore port event for removed USB3 hcd\n=
");
>                  bogus_port_status =3D true;
>                  goto cleanup;
>
> Thanks
> Mathias
>

Yes, this patch fixes the problem for me. Thanks!

Is it so unusual to have an XHCI that has only USB3 ports?

My understanding was that a port can either be USB3 or USB2 (assigned
via the Supported Protocol Capability).

This would mean that in order to work correctly with Linux, all XHCIs
right now would have to support at least one USB2 port in addition to
their USB3 ports.

Best regards
Jan

--=20
Dr.-Ing. Jan Henrik Weinstock
Managing Director

MachineWare GmbH | www.machineware.de
H=C3=BChnermarkt 19, 52062 Aachen, Germany
Amtsgericht Aachen HRB25734

Gesch=C3=A4ftsf=C3=BChrung
Lukas J=C3=BCnger
Dr.-Ing. Jan Henrik Weinstock

