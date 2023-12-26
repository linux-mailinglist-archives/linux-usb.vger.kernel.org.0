Return-Path: <linux-usb+bounces-4571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19681E593
	for <lists+linux-usb@lfdr.de>; Tue, 26 Dec 2023 08:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 184501F225CC
	for <lists+linux-usb@lfdr.de>; Tue, 26 Dec 2023 07:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B524C601;
	Tue, 26 Dec 2023 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a+et5cdg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31F64C3D0
	for <linux-usb@vger.kernel.org>; Tue, 26 Dec 2023 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3ea8d0f9dso359965ad.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Dec 2023 23:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703575141; x=1704179941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BqKiCCJczZL+gxOw2NyidScj0rEfopbjoqalm0LO44=;
        b=a+et5cdgz5ns37+lhlu3LCAPs8YWHRwreXOUFB22oQNK5uz/5AipNJi/cgTmXzSIKO
         PTlZ/L6uc1jNDnoZrj3WQ3+7GQs57BTq5sNOB5wkIn3L7fgRdbm3Wz3n+K2vWDwunbUW
         UZhKFup0sedaNaLZV01VCLaCShPLBih4epF4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703575141; x=1704179941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BqKiCCJczZL+gxOw2NyidScj0rEfopbjoqalm0LO44=;
        b=VCrB7CLyUj9szSdRpjdK1C0n9pHKfARzx/s9vNQP/maFVSOYh6kni54dg4wsZ5r6y8
         BmlBH8/4/06ss3JN9ORg4M0zJtp1PBULdoZeZOQrID8dFHByBmmZAhSYsZDaEoLKluhH
         YSi8tiU3+Kb+qK33tAqfvcciKUr9Lw5RT3O80T+CrHO3jB0zueJFVQDCz8GBrqE4sSNw
         MWqROcElBX/mpk0IJDSPqBqBqcjNMyn4hOikHZnsg3x5fwWcXjxP+BW1yFh1/jt8GkdD
         kLadwek9kQdTevmMGS8LRTIvQhtN6/LEY20VS4cSrtX3y9Lj5O4S4QRrHfgUGWjNHA5O
         H6nw==
X-Gm-Message-State: AOJu0Yz/Rpm1TUK15xNM/roG8WC+rwnusfvP412R0/p1HuDUJY5lp/pp
	WBIuoi1E0P5Zbt7MLIFYMBpCRxJMIgZub3JXVbi5lBP10wbA
X-Google-Smtp-Source: AGHT+IEu6NYYayr8UOC7asMhepBxKP/v5uIw5Yh2GV/X6zM/MGAD8x8GF6xuO9qNcPQ/gjH1RHLOZGUE0p4m7IlRkqQ=
X-Received: by 2002:a17:902:e5cb:b0:1d3:ce75:a696 with SMTP id
 u11-20020a170902e5cb00b001d3ce75a696mr352298plf.5.1703575140625; Mon, 25 Dec
 2023 23:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231223233523.4411-1-maxtram95@gmail.com> <20231223233523.4411-3-maxtram95@gmail.com>
In-Reply-To: <20231223233523.4411-3-maxtram95@gmail.com>
From: Grant Grundler <grundler@chromium.org>
Date: Mon, 25 Dec 2023 23:18:48 -0800
Message-ID: <CANEJEGuJFq3Wf8=DxTnrbENi586ccsi7Y+pgQWOSaqzvCp2aZg@mail.gmail.com>
Subject: Re: [PATCH net 2/2] r8152: Switch to using choose_configuration
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hayes Wang <hayeswang@realtek.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Douglas Anderson <dianders@chromium.org>, Grant Grundler <grundler@chromium.org>, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 23, 2023 at 3:36=E2=80=AFPM Maxim Mikityanskiy <maxtram95@gmail=
.com> wrote:
>
> With the introduction of r8152-cfgselector, the following regression
> appeared on machines that use usbguard: the netdev appears only when the
> USB device is inserted the first time (before the module is loaded), but
> on the second and next insertions no netdev is registered.
>
> It happens because the device is probed as unauthorized, and usbguard
> gives it an authorization a moment later. If the module is not loaded,
> it's normally loaded slower than the authorization is given, and
> everything works. If the module is already loaded, the cfgselector's
> probe function runs first, but then usb_authorize_device kicks in and
> changes the configuration to something chosen by the standard
> usb_choose_configuration. rtl8152_probe refuses to probe non-vendor
> configurations, and the user ends up without a netdev.
>
> The previous commit added possibility to override
> usb_choose_configuration. Use it to fix the bug and pick the right
> configuration on both probe and authorization.
>
> Fixes: ec51fbd1b8a2 ("r8152: add USB device driver for config selection")
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Maxim,
Does this solve the same problem that Doug Anderson posted patches for
a few weeks ago?

https://lore.kernel.org/all/20231201183113.343256-1-dianders@chromium.org/

Those went through the USB tree, so that probably explains why you
didn't see them in the net.git tree.

cheers,
grant

> ---
>  drivers/net/usb/r8152.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 9bf2140fd0a1..f0ac31a94f3c 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -10070,6 +10070,11 @@ static struct usb_driver rtl8152_driver =3D {
>  };
>
>  static int rtl8152_cfgselector_probe(struct usb_device *udev)
> +{
> +       return 0;
> +}
> +
> +static int rtl8152_cfgselector_choose_configuration(struct usb_device *u=
dev)
>  {
>         struct usb_host_config *c;
>         int i, num_configs;
> @@ -10078,7 +10083,7 @@ static int rtl8152_cfgselector_probe(struct usb_d=
evice *udev)
>          * driver supports it.
>          */
>         if (__rtl_get_hw_ver(udev) =3D=3D RTL_VER_UNKNOWN)
> -               return 0;
> +               return -EOPNOTSUPP;
>
>         /* The vendor mode is not always config #1, so to find it out. */
>         c =3D udev->config;
> @@ -10094,20 +10099,15 @@ static int rtl8152_cfgselector_probe(struct usb=
_device *udev)
>         }
>
>         if (i =3D=3D num_configs)
> -               return -ENODEV;
> -
> -       if (usb_set_configuration(udev, c->desc.bConfigurationValue)) {
> -               dev_err(&udev->dev, "Failed to set configuration %d\n",
> -                       c->desc.bConfigurationValue);
> -               return -ENODEV;
> -       }
> +               return -EOPNOTSUPP;
>
> -       return 0;
> +       return c->desc.bConfigurationValue;
>  }
>
>  static struct usb_device_driver rtl8152_cfgselector_driver =3D {
>         .name =3D         MODULENAME "-cfgselector",
>         .probe =3D        rtl8152_cfgselector_probe,
> +       .choose_configuration =3D rtl8152_cfgselector_choose_configuratio=
n,
>         .id_table =3D     rtl8152_table,
>         .generic_subclass =3D 1,
>         .supports_autosuspend =3D 1,
> --
> 2.43.0
>

