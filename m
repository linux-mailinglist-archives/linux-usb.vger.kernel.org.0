Return-Path: <linux-usb+bounces-15768-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD69918C4
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 19:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 997A31C21257
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 17:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C319E158D92;
	Sat,  5 Oct 2024 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UOZLebaV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D971547FF
	for <linux-usb@vger.kernel.org>; Sat,  5 Oct 2024 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728148573; cv=none; b=uTGLGjzm0H73S2tYWMenpJJ2ECt6HhH+9orE5CNQcxTch3AWUGGQ1sr+3hMitMTNJDRsmk1SeGk6a8Nybe/lytm4Z2a2zQRBlT1hOhi7Ed+9QlDl6/HFFpGN8e4P6dLS2Oobt5kVLDCnK9gIdFhSFnsRFj3brIfaz8FZ+V97GMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728148573; c=relaxed/simple;
	bh=t0aMM7iUk8iAMUcsao3hTbz5SBccIev+mpdMVdS/N/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfDDy2fMgYNP/i0YjQOJRyxTH6MVb7Hf10fiFFzUEcvti3SjFzbOI+GxU0paOThOzrK3RKRvFFLs2f7VAmVZUS8foX6+/h5RTg30Gg04zrffrqiAhAVfj8Is1biMTz1wmkJevSV9zFxYB82AnulIMvA5oW/nxeL9JgHoER/LaS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UOZLebaV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8a706236bfso210723466b.0
        for <linux-usb@vger.kernel.org>; Sat, 05 Oct 2024 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1728148569; x=1728753369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mc9Y5c6z/vhC/E+FrTf+pY7pOmVr/SfYK2wA67lDRs=;
        b=UOZLebaVdVHBrtiapSRs1vfJ+sdXv9ylxgtbeJyzqkCXMmwv9ZsylD6RD9jQ1fKfAz
         A/scFsjVgtxCy6bYN8/i+gYkq/OKaHgmAMq85u0Z8CW0ousfSaMqC9uwAsOabpX11ySq
         zTlLuDIxZYAmjxSxT1FOke/x7AgziAwNKe7Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728148569; x=1728753369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mc9Y5c6z/vhC/E+FrTf+pY7pOmVr/SfYK2wA67lDRs=;
        b=h27QYBwiFBPs0GsQeOvMji4uQHnY3n/hIkT5bb7AmL25Ls2uCNrtxj81vPPD9i2+wQ
         tv8+XFCPIFb2V4xWiwzXV2EnG8SQu2MtjgxF5PkGDi4zGdbR+uAATaCd+YxZGIFJMP0M
         6DNs9chzdZHdVsGeSzKtqw1eVFPxPL4pAxfVD+BY8pV8zNWweyvNR3wlFi8uvPI/Nf7P
         lklTmx8GcxcAOiRhe54knJejLFOoYpeX8frE+Qet9PdWfLhOanTNEkTEfmyFhnmnbbq6
         Rbl2por67JVg2HtyN9OnpHDrJ3/w4Tp7HI6oTtaO8myuVuC5vW8/OCrEKd2njz67O5hf
         3FGw==
X-Forwarded-Encrypted: i=1; AJvYcCUtAKtsbSVuEaOfhzETLQDqhkJq0gJh4tdQ3PSmPajgDyZTN863vY1dk6iVGljQW/LATHlZ81Ul9ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4UOi1Hwr5W6aIRzWiR1/ly6PnccnEDWbqPBvTeijLzuFwKiln
	QDy3pdLK0vj3k92aiPNuNrrqFJRIm3FIWp2ssuqcOgt3XG00iGteghmgRFG5qoS9WHrjWr/ZuiC
	7Eqaaw158AKF5p93PsH9IYpsrc7hPxdDSSozYswh7zrCMO4Y9bbHVBw==
X-Google-Smtp-Source: AGHT+IFFQM34n4GgoFq6YJSo4R7PLkurcgxkYI019FXV6pn/Wq4gXHuCsBbO3ddNXX2xNOmoUEbqqBCRZfk3HV9Dps0=
X-Received: by 2002:a05:6402:274a:b0:5c7:202f:ec9b with SMTP id
 4fb4d7f45d1cf-5c8d2e471a6mr8014893a12.16.1728148568686; Sat, 05 Oct 2024
 10:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYUPR06MB621763AB815989161F4033AFD2762@TYUPR06MB6217.apcprd06.prod.outlook.com>
In-Reply-To: <TYUPR06MB621763AB815989161F4033AFD2762@TYUPR06MB6217.apcprd06.prod.outlook.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 5 Oct 2024 19:15:57 +0200
Message-ID: <CAOf5uw=PUDHyHgMyPgZWKNsCHg8pNMvJrr1dhLjMF2ouK-QDRQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_serial: Disable ep before setting port to
 null to fix the crash caused by port being null
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"opensource.kernel" <opensource.kernel@vivo.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, Prashanth K <quic_prashk@quicinc.com>, 
	"quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =E8=83=A1=E8=BF=9E=E5=8B=A4

On Mon, Sep 30, 2024 at 3:48=E2=80=AFAM =E8=83=A1=E8=BF=9E=E5=8B=A4 <hulian=
qin@vivo.com> wrote:
>
> From: Lianqin Hu <hulianqin@vivo.com>
>
> Considering that in some extreme cases, when performing the
> unbinding operation, gserial_disconnect has cleared gser->ioport,
> which triggers gadget reconfiguration, and then calls gs_read_complete,
> resulting in access to a null pointer. Therefore, ep is disabled before
> gserial_disconnect sets port to null to prevent this from happening.
>
> Unable to handle kernel NULL pointer dereference at
> virtual address 00000000000001a8
> pc : gs_read_complete+0x58/0x240
> lr : usb_gadget_giveback_request+0x40/0x160
> sp : ffffffc00f1539c0
> x29: ffffffc00f1539c0 x28: ffffff8002a30000 x27: 0000000000000000
> x26: ffffff8002a30000 x25: 0000000000000000 x24: ffffff8002a30000
> x23: ffffff8002ff9a70 x22: ffffff898e7a7b00 x21: ffffff803c9af9d8
> x20: ffffff898e7a7b00 x19: 00000000000001a8 x18: ffffffc0099fd098
> x17: 0000000000001000 x16: 0000000080000000 x15: 0000000ac1200000
> x14: 0000000000000003 x13: 000000000000d5e8 x12: 0000000355c314ac
> x11: 0000000000000015 x10: 0000000000000012 x9 : 0000000000000008
> x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffffff887cd12000
> x5 : 0000000000000002 x4 : ffffffc00f9b07f0 x3 : ffffffc00f1538d0
> x2 : 0000000000000001 x1 : 0000000000000000 x0 : 00000000000001a8
> Call trace:
> gs_read_complete+0x58/0x240
> usb_gadget_giveback_request+0x40/0x160
> dwc3_remove_requests+0x170/0x484
> dwc3_ep0_out_start+0xb0/0x1d4
> __dwc3_gadget_start+0x25c/0x720
> kretprobe_trampoline.cfi_jt+0x0/0x8
> kretprobe_trampoline.cfi_jt+0x0/0x8
> udc_bind_to_driver+0x1d8/0x300
> usb_gadget_probe_driver+0xa8/0x1dc
> gadget_dev_desc_UDC_store+0x13c/0x188
> configfs_write_iter+0x160/0x1f4
> vfs_write+0x2d0/0x40c
> ksys_write+0x7c/0xf0
> __arm64_sys_write+0x20/0x30
> invoke_syscall+0x60/0x150
> el0_svc_common+0x8c/0xf8
> do_el0_svc+0x28/0xa0
> el0_svc+0x24/0x84
> el0t_64_sync_handler+0x88/0xec
> el0t_64_sync+0x1b4/0x1b8
> Code: aa1f03e1 aa1303e0 52800022 2a0103e8 (88e87e62)
> ---[ end trace 938847327a739172 ]---
> Kernel panic - not syncing: Oops: Fatal exception
>
> Fixes: c1dca562be8a ("usb gadget: split out serial core")
> Cc: stable@vger.kernel.org
>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> ---
>  drivers/usb/gadget/function/u_serial.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index b394105e55d6..1712e9cd08be 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -1395,6 +1395,10 @@ void gserial_disconnect(struct gserial *gser)
>         /* REVISIT as above: how best to track this? */
>         port->port_line_coding =3D gser->port_line_coding;
>
> +       /* disable endpoints, aborting down any active I/O */
> +       usb_ep_disable(gser->out);
> +       usb_ep_disable(gser->in);
> +

According to the review from here
https://lore.kernel.org/lkml/64ad7661-4551-7b00-604b-6e15da23a1c7@quicinc.c=
om/T/

Greg and I suggest to abort before but Prashanth K comment  "
Not sure about this case, I think generally we need stop IO before
disabling EP, otherwise TX/RX functions may queue requests while EP is
getting disabled, thats why i think port is removed before ep_disable.
Moreover these callbacks (complete/suspend/resume etc) comes from UDC
and can be async, so better to use locks to prevent these kind of races."

Michael

>         port->port_usb =3D NULL;
>         gser->ioport =3D NULL;
>         if (port->port.count > 0) {
> @@ -1406,10 +1410,6 @@ void gserial_disconnect(struct gserial *gser)
>         spin_unlock(&port->port_lock);
>         spin_unlock_irqrestore(&serial_port_lock, flags);
>
> -       /* disable endpoints, aborting down any active I/O */
> -       usb_ep_disable(gser->out);
> -       usb_ep_disable(gser->in);
> -
>         /* finally, free any unused/unusable I/O buffers */
>         spin_lock_irqsave(&port->port_lock, flags);
>         if (port->port.count =3D=3D 0)
> --
> 2.39.0
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

