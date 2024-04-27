Return-Path: <linux-usb+bounces-9860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583F8B47DE
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 22:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297021C20B9A
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 20:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1371448DC;
	Sat, 27 Apr 2024 20:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="144EioUz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FBF8C1F
	for <linux-usb@vger.kernel.org>; Sat, 27 Apr 2024 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714249890; cv=none; b=NypoERSkKLldA3sY1g0GV2kccP4qI7YTd5CSB1OUdM4fcs0GBoD0WoaD5B8k2n0JU+lwA01sn0aZ6PYunixWWhvyRt3qE2me6deoUXcE3/gkDUrjKIhazmAmhjt78rGmLSgKwD3KvkzQdILEYp+Qq09CxPTGKLw8UOxaVkAxvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714249890; c=relaxed/simple;
	bh=Ht8ptS+1JfIa/YTsOX4sJtqLs2M9VXNz8l+2KOqDG+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5z7RxsvFHQeaj3teDLcLgtxzB3BI8FiQs6pqAWlxn6YEPhURzP5h4ItWEdts5djXWcN7200P7RtlJPYn5kcYLUWyUHviDsegem7d1B+VXFrcv02M0ATaGuCW8nxsRHvfqJ2T1F/oGFe+qjBMJB/IPatF0q3fRFKMKi1mTQJBhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=144EioUz; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ab1ddfded1so2924789a91.1
        for <linux-usb@vger.kernel.org>; Sat, 27 Apr 2024 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714249888; x=1714854688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axnvJiGgbLky4Ny0ls72ealOOmZYKX2k/GadnIaENkA=;
        b=144EioUzSHzN+QV/3Po3A7+bLTcznH93afWLce9HxNceD2XOGIL5A8/FYZQRFTbMAp
         xeo2QL5DxEQsYRBbHpEZsC8kGl6TWflW+N9WXsqZTo4hSZwLtZoRMJvaAaMhSKD+7IkP
         vWmFJ0DBwWJwgwoylRypuZcIpS3augmSMEFO4/1McE5mEjsjrOpBoxxoq6zO6pKFkuyz
         H73yAT98zApqChgkNRYJprxFrvyWIyfh9XdPvtOuh3vr05t1Sl6wZtOgtKSHM/3JSVbN
         umkmhg/CKU4XcksRgI00MHzod71xI+Mh9sQFEaC4fImGkPxM1rFHkihCr1BYR165yB2t
         4Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714249888; x=1714854688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axnvJiGgbLky4Ny0ls72ealOOmZYKX2k/GadnIaENkA=;
        b=mq7k7fktTm4WIGa22hOSIsUnHAYa/WElLU2vJfDislN3E6S3AuzSksuFaIUgX80zGY
         y6TXp801fMWBldatCNHHAUluwm3CYy8hODFTZUfqNg6wcbTpYGPJWROgyxvyIBxL+bya
         021jCMu0nkJNCAqaV+WSvNyFN0QaNbOXoy0Kh+1D7bjxUVK5kVPJBTKjNGNXYLj2HGUN
         soXLzYH4GePfoiAcIR5OYdtPpjTrb95mOoIzy9YfEZ16AuebBlu0iHtGTQ7Ap6YIXTe2
         Z3LtWin/BRMTht/ZXCLec/5zKcTFQlgt0nwKs/LB0q6g5SUjmd5z5IT4Zcvd8omg13ig
         Dwhg==
X-Forwarded-Encrypted: i=1; AJvYcCX4JnqD7RATPQr6sHnrmRFX3qKSyvTmtj8L8BiNfae5238rmx+KIpAqGUPzUf7l78qjgUMTVSRnZTCy8i0eBcs1WnEouacbgLqC
X-Gm-Message-State: AOJu0YyNSaFvLBew3mzb42zaDtI7VBTwipx68ib1qbXd3Fmj1Z/rxJNo
	GhgRMsSCEmj4xkn02XKhD9g01J6FDKuQFIBtUwS6zz6weqJxbbGwzSjT1jTu7vrPgV8Q/qi5RsV
	gGSvhQwbR20r6F4qfc0wamKVA4EoHUoBoroVO
X-Google-Smtp-Source: AGHT+IGfgU+iDZnZbnUiTKiUqmJJPFd+LOceVSpk9K4PVBksllm0eU77kRI3GaByPOVsxV8G2ddTMuSlcpXdxSfHpNI=
X-Received: by 2002:a17:90a:6046:b0:2b0:7f15:9155 with SMTP id
 h6-20020a17090a604600b002b07f159155mr5139781pjm.31.1714249887990; Sat, 27 Apr
 2024 13:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240427175010.3367154-1-badhri@google.com> <ktl5xjnb7njuoyobnekivyjw6uf6ozn7shd2wubl5styzmmoc6@buzgfwr5wive>
In-Reply-To: <ktl5xjnb7njuoyobnekivyjw6uf6ozn7shd2wubl5styzmmoc6@buzgfwr5wive>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Sat, 27 Apr 2024 13:30:51 -0700
Message-ID: <CAPTae5+gkdBmjO7Gm-tZ+5CKXAzmGOsNzEJ_ZQVb0rsaLsCU7A@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: Check for port partner validity
 before consuming it
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com, kyletso@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, rdbabiera@google.com, 
	amitsd@google.com, stable@vger.kernel.org, frank.wang@rock-chips.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2024 at 12:23=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, Apr 27, 2024 at 05:50:10PM +0000, Badhri Jagan Sridharan wrote:
> > typec_register_partner() does not guarantee partner registration
> > to always succeed. In the event of failure, port->partner is set
> > to the error value or NULL. Given that port->partner validity is
> > not checked, this results in the following crash:
> >
> > [17514.377076][  T275] Unable to handle kernel NULL pointer dereference=
 at virtual address 00000000000003c0
> > [17514.378270][  T275] pc : run_state_machine+0x1bc8/0x1c08
> > [17514.378286][  T275] lr : run_state_machine+0x1b90/0x1c08
> > ..
> > [17514.378377][  T275] Call trace:
> > [17514.378381][  T275]  run_state_machine+0x1bc8/0x1c08
> > [17514.378388][  T275]  tcpm_state_machine_work+0x94/0xe4
> > [17514.378396][  T275]  kthread_worker_fn+0x118/0x328
> > [17514.378406][  T275]  kthread+0x1d0/0x23c
> > [17514.378412][  T275]  ret_from_fork+0x10/0x20
>
> Nit: thre is little use in the timestamps and the T275 tag. In future
> patches you can safely ommit such data.
>
> >
> > To prevent the crash, check for port->partner validity before
> > derefencing it in all the call sites.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: c97cd0b4b54e ("usb: typec: tcpm: set initial svdm version based =
on pd revision")
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index ab6ed6111ed0..8a4fa8d875c6 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -4,7 +4,6 @@
> >   *
> >   * USB Power Delivery protocol stack.
> >   */
> > -
> >  #include <linux/completion.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/device.h>
> > @@ -1580,7 +1579,8 @@ static void svdm_consume_identity(struct tcpm_por=
t *port, const u32 *p, int cnt)
> >       port->partner_ident.cert_stat =3D p[VDO_INDEX_CSTAT];
> >       port->partner_ident.product =3D product;
> >
> > -     typec_partner_set_identity(port->partner);
> > +     if (!IS_ERR_OR_NULL(port->partner))
>
> I think that it might be better to check typec_register_partner() result
> in tcpm_typec_connect() and skip setting port->partner in case it
> returned an error (an error message would be also beneficial).
> See for example, how this is handled in ucsi_register_partner().
>
> Then these checks can be turned into simple `if (port->partner)`.


Sounds good ! However, I was wondering whether the error message is
redundant as typec_register_partner() also prints one. I have anyways
added that in V3.

Thanks,
Badhri

>
> > +             typec_partner_set_identity(port->partner);
> >
> >       tcpm_log(port, "Identity: %04x:%04x.%04x",
> >                PD_IDH_VID(vdo),
> > @@ -1742,6 +1742,9 @@ static void tcpm_register_partner_altmodes(struct=
 tcpm_port *port)
> >       struct typec_altmode *altmode;
> >       int i;
> >
> > +     if (IS_ERR_OR_NULL(port->partner))
> > +             return;
> > +
> >       for (i =3D 0; i < modep->altmodes; i++) {
> >               altmode =3D typec_partner_register_altmode(port->partner,
> >                                               &modep->altmode_desc[i]);
> > @@ -4244,7 +4247,8 @@ static void tcpm_typec_connect(struct tcpm_port *=
port)
> >               port->partner =3D typec_register_partner(port->typec_port=
,
> >                                                      &port->partner_des=
c);
> >               port->connected =3D true;
> > -             typec_partner_set_usb_power_delivery(port->partner, port-=
>partner_pd);
> > +             if (!IS_ERR_OR_NULL(port->partner))
> > +                     typec_partner_set_usb_power_delivery(port->partne=
r, port->partner_pd);
> >       }
> >  }
> >
> > @@ -4323,8 +4327,10 @@ static void tcpm_typec_disconnect(struct tcpm_po=
rt *port)
> >       port->plug_prime =3D NULL;
> >       port->cable =3D NULL;
> >       if (port->connected) {
> > -             typec_partner_set_usb_power_delivery(port->partner, NULL)=
;
> > -             typec_unregister_partner(port->partner);
> > +             if (!IS_ERR_OR_NULL(port->partner)) {
> > +                     typec_partner_set_usb_power_delivery(port->partne=
r, NULL);
> > +                     typec_unregister_partner(port->partner);
> > +             }
> >               port->partner =3D NULL;
> >               port->connected =3D false;
> >       }
> > @@ -4549,6 +4555,9 @@ static enum typec_cc_status tcpm_pwr_opmode_to_rp=
(enum typec_pwr_opmode opmode)
> >
> >  static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
> >  {
> > +     if (IS_ERR_OR_NULL(port->partner))
> > +             return;
> > +
> >       switch (port->negotiated_rev) {
> >       case PD_REV30:
> >               break;
> >
> > base-commit: 3f12222a4bebeb13ce06ddecc1610ad32fa835dd
> > --
> > 2.44.0.769.g3c40516874-goog
> >
>
> --
> With best wishes
> Dmitry

