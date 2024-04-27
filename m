Return-Path: <linux-usb+bounces-9861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B18B47E1
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 22:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5381F217BB
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 20:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8980323A6;
	Sat, 27 Apr 2024 20:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y4n6669J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7832E852
	for <linux-usb@vger.kernel.org>; Sat, 27 Apr 2024 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714249973; cv=none; b=DJA6BCJNOwgrloJlgNxA6PGZhWLwDGOLjEm0St3uPn1vT+rozx0rFFPf0H4C5eNIWBqT6yZF7xmBdxNFX4L0mQGD30P9KNGzyfxC6bk4DP89sou9jptNhOwTj1Q1hzJurEQ1TOKDFHHtBmjH6mNI49zNGqy+GPDnpCejkIBaA+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714249973; c=relaxed/simple;
	bh=KGgqkmnD2wjWyjCm//R47uVR9FNYf7gectdDDsGPGEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgMFut+WESmY87U0JE3Qv9Lr5z+473W6q7csTIxNhNcxq5aixG6rMRhXTalxgANuEn2zGK7UNoliB+N2Z8mj1Gpe0HZSAYqhIXBCUjWcjfpD82/iVJsAlUwcvWW5w+qauy03S8AMgPHNSNSWuVfIYoM52Jjf6aZoyilOrwn8I6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y4n6669J; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e65a1370b7so30627765ad.3
        for <linux-usb@vger.kernel.org>; Sat, 27 Apr 2024 13:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714249971; x=1714854771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DvKgeDrDwAqJ4wtw0FIZw4vVsv/4dvMfq+61b4reGQ=;
        b=y4n6669Jpr3UN508cnWHtedC9KWJeiQhSMbJgtQc2NHxA4FRzafI1u2nV/1LIdrLzL
         ubOrDdA53J28RGIoEgba2lPAlEzTI/9+vFR6ja4NMpQHhMNfGCOqJR3WwSdO0sse66Vs
         MtbDAJtvmbeGA3nPNn/jos8qvZLpDUiOz/IbYqtIXYKr9QdxWj03WSlw4R/k2EAJ+jVj
         2ehGGZQdxdGMXO8fJ3QvCTdQY5/xWqeSRAobGV88jHJOPRYYWp9PZp2O3G9+g1SfAl3D
         8PjxYElVtjmh5LTu1QPgMK9E6AIaQAcjpiBV4Xo5f4igrWCs2GXd8aJPLJqQsm3w8VEC
         Svlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714249971; x=1714854771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DvKgeDrDwAqJ4wtw0FIZw4vVsv/4dvMfq+61b4reGQ=;
        b=RyZQ/QLaycKBFD4jRLjWsRlAkFSVSHIl+jkKeqVDxZdEYZiGCqDRgsK4sqAyi11q0F
         +X+Dw4VazTVSz/kMf5XLYisggsPIImBuPlSe7z/BSyC04yB4VpMFAZ7M7AGq/R2fZBpH
         eoAG2Jwo6xOoc80Guy94MLWDcscZpTGH1BDz5DxzSk3/9uqSitwNuTL5b8AzjrOnYpVH
         vP/JIcAQyGChSIalMFMgWyT+ZUgXvVf6AVZQUgTYbEuQWGpZt8PjdFGbu1A6AzAFOTyq
         V2enNMzun6UEoTVsZlkas5MsRRPtpSkvvS0tkFpF64NiBBmTwL4CfmIWtPYhYPbXoX8D
         aagg==
X-Forwarded-Encrypted: i=1; AJvYcCXeMIizmdrWiB+qvygvarNLtaw57ZVyVmYcMZvxq3vIu5j0qE+BofW6Au7OYUTBZ8QOK7F2HrmPx+fVYA5cYYeIjCKR3ZX2pe1t
X-Gm-Message-State: AOJu0YwBt2c8Oypfci9bowQ7ZXhXHOd9OJpRPr2/FnibYb5l3QS90VsT
	35oW+E6pVUtEtCuyauyKZJ0RMytNyMDSLSMmMy64utC9BMFNO1W0VejOEtXBHyzLD2+6DLSQVS4
	jnwo0+iEaOfcenAGNI1G9ItmcJkDXgjUKgEHJ
X-Google-Smtp-Source: AGHT+IGyneE40eEQiVLgA9cPbKtqXTPLWQlrZZHZkiN7TKnv2aAh1MBYjo9WhrOabZ89pSe/i2/4u/9rjDz7bZ0WIZM=
X-Received: by 2002:a17:903:41ca:b0:1eb:1240:1aea with SMTP id
 u10-20020a17090341ca00b001eb12401aeamr7794687ple.20.1714249970767; Sat, 27
 Apr 2024 13:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240427201828.3432713-1-badhri@google.com>
In-Reply-To: <20240427201828.3432713-1-badhri@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Sat, 27 Apr 2024 13:32:13 -0700
Message-ID: <CAPTae5+gh20n1Em90o970cTobFUnFqmpE6aHs6+DNOyoav=MXQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: Check for port partner validity
 before consuming it
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdbabiera@google.com, amitsd@google.com, 
	stable@vger.kernel.org, frank.wang@rock-chips.com, broonie@kernel.org, 
	dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2024 at 1:18=E2=80=AFPM Badhri Jagan Sridharan
<badhri@google.com> wrote:
>
> typec_register_partner() does not guarantee partner registration
> to always succeed. In the event of failure, port->partner is set
> to the error value or NULL. Given that port->partner validity is
> not checked, this results in the following crash:
>
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
000000003c0
>  pc : run_state_machine+0x1bc8/0x1c08
>  lr : run_state_machine+0x1b90/0x1c08
> ..
>  Call trace:
>    run_state_machine+0x1bc8/0x1c08
>    tcpm_state_machine_work+0x94/0xe4
>    kthread_worker_fn+0x118/0x328
>    kthread+0x1d0/0x23c
>    ret_from_fork+0x10/0x20
>
> To prevent the crash, check for port->partner validity before
> derefencing it in all the call sites.
>
> Cc: stable@vger.kernel.org
> Fixes: c97cd0b4b54e ("usb: typec: tcpm: set initial svdm version based on=
 pd revision")
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index ab6ed6111ed0..454165776797 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4,7 +4,6 @@
>   *
>   * USB Power Delivery protocol stack.
>   */
> -
Unintentionally removed a blank line. Please ignore this version - v2.
Sent v3. Apologies !

>  #include <linux/completion.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
> @@ -1580,7 +1579,8 @@ static void svdm_consume_identity(struct tcpm_port =
*port, const u32 *p, int cnt)
>         port->partner_ident.cert_stat =3D p[VDO_INDEX_CSTAT];
>         port->partner_ident.product =3D product;
>
> -       typec_partner_set_identity(port->partner);
> +       if (port->partner)
> +               typec_partner_set_identity(port->partner);
>
>         tcpm_log(port, "Identity: %04x:%04x.%04x",
>                  PD_IDH_VID(vdo),
> @@ -1742,6 +1742,9 @@ static void tcpm_register_partner_altmodes(struct t=
cpm_port *port)
>         struct typec_altmode *altmode;
>         int i;
>
> +       if (!port->partner)
> +               return;
> +
>         for (i =3D 0; i < modep->altmodes; i++) {
>                 altmode =3D typec_partner_register_altmode(port->partner,
>                                                 &modep->altmode_desc[i]);
> @@ -4231,7 +4234,10 @@ static int tcpm_init_vconn(struct tcpm_port *port)
>
>  static void tcpm_typec_connect(struct tcpm_port *port)
>  {
> +       struct typec_partner *partner;
> +
>         if (!port->connected) {
> +               port->connected =3D true;
>                 /* Make sure we don't report stale identity information *=
/
>                 memset(&port->partner_ident, 0, sizeof(port->partner_iden=
t));
>                 port->partner_desc.usb_pd =3D port->pd_capable;
> @@ -4241,9 +4247,13 @@ static void tcpm_typec_connect(struct tcpm_port *p=
ort)
>                         port->partner_desc.accessory =3D TYPEC_ACCESSORY_=
AUDIO;
>                 else
>                         port->partner_desc.accessory =3D TYPEC_ACCESSORY_=
NONE;
> -               port->partner =3D typec_register_partner(port->typec_port=
,
> -                                                      &port->partner_des=
c);
> -               port->connected =3D true;
> +               partner =3D typec_register_partner(port->typec_port, &por=
t->partner_desc);
> +               if (IS_ERR(partner)) {
> +                       dev_err(port->dev, "Failed to register partner (%=
ld)\n", PTR_ERR(partner));
> +                       return;
> +               }
> +
> +               port->partner =3D partner;
>                 typec_partner_set_usb_power_delivery(port->partner, port-=
>partner_pd);
>         }
>  }
> @@ -4323,9 +4333,11 @@ static void tcpm_typec_disconnect(struct tcpm_port=
 *port)
>         port->plug_prime =3D NULL;
>         port->cable =3D NULL;
>         if (port->connected) {
> -               typec_partner_set_usb_power_delivery(port->partner, NULL)=
;
> -               typec_unregister_partner(port->partner);
> -               port->partner =3D NULL;
> +               if (port->partner) {
> +                       typec_partner_set_usb_power_delivery(port->partne=
r, NULL);
> +                       typec_unregister_partner(port->partner);
> +                       port->partner =3D NULL;
> +               }
>                 port->connected =3D false;
>         }
>  }
> @@ -4549,6 +4561,9 @@ static enum typec_cc_status tcpm_pwr_opmode_to_rp(e=
num typec_pwr_opmode opmode)
>
>  static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
>  {
> +       if (!port->partner)
> +               return;
> +
>         switch (port->negotiated_rev) {
>         case PD_REV30:
>                 break;
>
> base-commit: 3f12222a4bebeb13ce06ddecc1610ad32fa835dd
> --
> 2.44.0.769.g3c40516874-goog
>

