Return-Path: <linux-usb+bounces-5900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA384A900
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 23:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001D31F2D313
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 22:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362DA48CCF;
	Mon,  5 Feb 2024 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qf8DHVmu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A2528DD8
	for <linux-usb@vger.kernel.org>; Mon,  5 Feb 2024 22:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707170753; cv=none; b=SYdLSXyH6W64Rr3f1U2dqRlq0KD6BXrXSM9OfQon5eu/8Fw+Tj2zTcdxTdJOmWplk7oVPv/ZZ1jNE0NtI6gfr3Qt2ijjOayrJxCzw4MJPW/TcPGEwOK3adPHL2E0wm2JVPf9pPStoN4y7l4AzZ1/Dyj8IzPI5yUXEvLJGGbvwMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707170753; c=relaxed/simple;
	bh=/yC6ukCR6M9OWDOAQofhpPWkpb0+7yFSlv5kx0Xd2yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qh94chqp1VPw/2uefwMCP+/TVh3GoxpCwQzcTzOeXyhAy7/iootZ4nCTqaajEazILEN9g7ddKrp0f9lhRE9Rnr2BgjL6ocx9ZbUfIFbzvhepDrjuoBXCrxpqVO8UzJKitmBBP/ZO99vIpP2TuZXmY2D2P2vjByZ0SweSHi50sHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qf8DHVmu; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso4628287276.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Feb 2024 14:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707170750; x=1707775550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uyM7Qy9ebYgtc0T1FfcjgiWLInu4H67aNLCBp8izTI=;
        b=Qf8DHVmufNeX4fR9YPGoVxlpcuXXutYOFLjXGtJze/yMGBmlAhiNw1fPPtwioEp1Ib
         msJPhNHGIzoVfcXNtI43JyTVOfkLRTXZsby/qN1C5Rh84evuFOpa/OzBKe4brYB90wxZ
         CJX8DSbRxVc1iWzjyw+0GrZN+OEBtq1nWRBoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707170750; x=1707775550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uyM7Qy9ebYgtc0T1FfcjgiWLInu4H67aNLCBp8izTI=;
        b=g9eqtewlX0DkFMg1IxyyitANCMkKpcKi2MiaKj3KpeT6tHFV251fEjW2ja/iQTRWpo
         X5jqB/0kQPUacRD4aZoaekpE1UrsVB73SXwD7uNQAFxgUFCCGRArzCiLZgKoRW0U43R6
         QkmdCAlFCbz5i3zqgpjb8M5zKRbpanBNEO1JIUBhUe8DT8NCrgdKM+4CKPMoE35vH2TO
         pEIfvuA3PrdZ+UbLGgYnsUExbype7iTMdKdEEM0XKOYAFwMoOycCP/wrbWYCaynfvMBQ
         7CeiMLoQJvq2YiwfYzf22dgq4jKX8aSWkcRHZWGNVfW6Vm63BiN9x6W9OLQ0WpY/zWbM
         6/LQ==
X-Gm-Message-State: AOJu0Ywl2UqeszD+Dxn5tVwaF+noQztuUQR0mXva/lQwoY3iSlO5+O1b
	7NwHWbbwQFoi80v3+ZZYzusWGUBofdfbSynUKZBKrooSl8x/xjcAA4HUohfpwobS4ZQkluE1C64
	mHYBWt/XShmj83ZlNKsHbTDYeXO/H+THgIzPZ/aKtwAIP7dM=
X-Google-Smtp-Source: AGHT+IE1dY0Dgu+RNNAwM80SRYg80MTyc6l94UjLiuC8rBB3isPt7AhJZ2B2k3REppaMwM/8wOjM5t6SUG0eRFTfdY4=
X-Received: by 2002:a25:ace1:0:b0:dc2:28b1:2e8b with SMTP id
 x33-20020a25ace1000000b00dc228b12e8bmr713829ybd.15.1707170749681; Mon, 05 Feb
 2024 14:05:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126183930.1170845-1-abhishekpandit@chromium.org>
 <20240126103859.v3.3.Idf7d373c3cbb54058403cb951d644f1f09973d15@changeid> <CACeCKaeVtU3ckmGU932d-pPn=eOnt6KjAavNY3rSOUgrJNriDg@mail.gmail.com>
In-Reply-To: <CACeCKaeVtU3ckmGU932d-pPn=eOnt6KjAavNY3rSOUgrJNriDg@mail.gmail.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Mon, 5 Feb 2024 14:05:38 -0800
Message-ID: <CANFp7mXOXc6TzLJ+EJ9VYxqGHcjW099oBhDctarUdM5eJGz5bg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] usb: typec: ucsi: Get PD revision for partner
To: Prashant Malani <pmalani@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	jthies@google.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rajaram Regupathy <rajaram.regupathy@intel.com>, 
	Saranya Gopal <saranya.gopal@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

Friendly ping to review this patch (I see you added Reviewed-by to the
other two in this series).

Thanks,
Abhishek

On Fri, Jan 26, 2024 at 12:25=E2=80=AFPM Prashant Malani <pmalani@chromium.=
org> wrote:
>
> Hi Abhishek,
>
> On Fri, Jan 26, 2024 at 10:39=E2=80=AFAM Abhishek Pandit-Subedi
> <abhishekpandit@chromium.org> wrote:
> >
> > PD major revision for the port partner is described in
> > GET_CONNECTOR_CAPABILITY and is only valid on UCSI 2.0 and newer. Updat=
e
> > the pd_revision on the partner if the UCSI version is 2.0 or newer.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> > $ cat /sys/class/typec/port2-partner/usb_power_delivery_revision
> > 3.0
> >
> > (no changes since v2)
> >
> > Changes in v2:
> >   - Formatting changes and update macro to use brackets.
> >   - Fix incorrect guard condition when checking connector capability.
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 23 +++++++++++++++++++++++
> >  drivers/usb/typec/ucsi/ucsi.h |  3 +++
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index a35056ee3e96..2b7983d2fdae 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -782,6 +782,7 @@ static int ucsi_register_partner(struct ucsi_connec=
tor *con)
> >         }
> >
> >         desc.usb_pd =3D pwr_opmode =3D=3D UCSI_CONSTAT_PWR_OPMODE_PD;
> > +       desc.pd_revision =3D UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_B=
CD(con->cap.flags);
> >
> >         partner =3D typec_register_partner(con->port, &desc);
> >         if (IS_ERR(partner)) {
> > @@ -856,6 +857,27 @@ static void ucsi_partner_change(struct ucsi_connec=
tor *con)
> >                         con->num, u_role);
> >  }
> >
> > +static int ucsi_check_connector_capability(struct ucsi_connector *con)
> > +{
> > +       u64 command;
> > +       int ret;
> > +
> > +       if (!con->partner || !IS_MIN_VERSION_2_0(con->ucsi))
>
> I'll reiterate my comment from a previous version, since this series
> has been revv-ed a few
> times since and it may have gotten lost; no need to respond to it if
> you don't want to,
> since I believe we left it to the maintainer(s) to decide [1]:
>
> This macro is unnecessary. Since the version is in BCD format and we
> already have the
> macros for versions, just a simple comparison is enough:
>          if (!con-partner || con->ucsi->version < UCSI_VERSION_2_0)
>                  return 0;
>
> I'll add that Patch 1 of this series [2] is also using the same style
> for comparing version numbers.
>
> > +               return 0;
> > +
> > +       command =3D UCSI_GET_CONNECTOR_CAPABILITY | UCSI_CONNECTOR_NUMB=
ER(con->num);
> > +       ret =3D ucsi_send_command(con->ucsi, command, &con->cap, sizeof=
(con->cap));
> > +       if (ret < 0) {
> > +               dev_err(con->ucsi->dev, "GET_CONNECTOR_CAPABILITY faile=
d (%d)\n", ret);
>
> nit: I know this is being done elsewhere in this file, but we should
> avoid putting error
> numbers in parentheses [3]. Perhaps something for a separate cleanup patc=
h.
>
> [1] https://lore.kernel.org/linux-usb/CANFp7mXP=3DaN8bQi4akKKcoMZE8RaCBuF=
nwTa5hbp0MZvZe0hYQ@mail.gmail.com/
> [2] https://lore.kernel.org/linux-usb/20240126103859.v3.1.Iacf5570a66b82b=
73ef03daa6557e2fc0db10266a@changeid/
> [3] https://www.kernel.org/doc/html/latest/process/coding-style.html#prin=
ting-kernel-messages

