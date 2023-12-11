Return-Path: <linux-usb+bounces-3972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3042680CFAF
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 16:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDF391F21A24
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 15:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2D64BA98;
	Mon, 11 Dec 2023 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QivN0fxI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662D8113
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 07:35:12 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bdec453c8so5408942e87.3
        for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 07:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702308908; x=1702913708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD+slHvHquFxJLd6D5SBrC9H4ySn5gVhp3h2f4/9JhE=;
        b=QivN0fxIfMmcU+BoqF58/7FeqZer1GBmQ09GT3rOwN2j6MYu+s4GXGXQD1QeSoReFU
         AAXeHxgxNlRlTMReERBbfYeW4k+cEL0pT6PocqZGXWqaSaMwCDRbxBj1lgyQ8/UvsScY
         WhLuZzfPdTDzwLAnhUOzs6xK30K3KAgvAKp0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308908; x=1702913708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SD+slHvHquFxJLd6D5SBrC9H4ySn5gVhp3h2f4/9JhE=;
        b=eW39z38xLugzWGT/rCk+H8OxWYuupHXngs0O4D4qPTVBkeEVcFO6akPj9sYAC9/lIi
         VXJqtj5EzB0AykPvboKbwKlAdr+EqIXtwAb5E548WCdv3XKUuI+IC/MwZTN4XcpN2oPX
         i3dNGGPj/EaRuhD/hwWWzA4a3mqMVRArzU5eBLX7mBViLGzi/Ee1FbYc1YrhH1+VGpL8
         3/7qHD7ykCSQ45OhBKnXurNpdba9MqNu68p1r6+eGHmZO8RW+tSaiiSQBA9MBnw0l73g
         0vSn3NyWUQ9AO0fgQZl/P7PhPlDdacjgtFhrNfqVev/Gb4VRJ7KpwNi6UpHQ3fuKNGoS
         quBw==
X-Gm-Message-State: AOJu0YycdJnxTfgMi+ezCzI8fr5fQip32/Os3vXQVLvoVwPqSH7/bG93
	AqbYOPAUTmCNqeQWctCLgW9IaykbxoQomWfZE2eIOw==
X-Google-Smtp-Source: AGHT+IFqj97EGAg9g0ZcTX+bopuhS7xtxTvjh4NglgiVpsfn5gEvti6i5gw4S9NNNa0QlORg/TuD6w==
X-Received: by 2002:a05:6512:1329:b0:50d:f93b:97a9 with SMTP id x41-20020a056512132900b0050df93b97a9mr1453970lfu.1.1702308908475;
        Mon, 11 Dec 2023 07:35:08 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id o29-20020a509b1d000000b0054ca1d90410sm3983843edi.85.2023.12.11.07.35.07
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 07:35:08 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c38e520e2so115835e9.0
        for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 07:35:07 -0800 (PST)
X-Received: by 2002:a05:600c:3b20:b0:40c:1e46:508e with SMTP id
 m32-20020a05600c3b2000b0040c1e46508emr225387wms.0.1702308907352; Mon, 11 Dec
 2023 07:35:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211070808.v2.1.If27eb3bf7812f91ab83810f232292f032f4203e0@changeid>
 <1ec52764-7fd9-484f-bcdc-bbf97194deef@rowland.harvard.edu>
In-Reply-To: <1ec52764-7fd9-484f-bcdc-bbf97194deef@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Dec 2023 07:34:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V3=Lnk-8E9GmpYtXXJBDLkPZgXWt+5MVof3Wn_JYS9rg@mail.gmail.com>
Message-ID: <CAD=FV=V3=Lnk-8E9GmpYtXXJBDLkPZgXWt+5MVof3Wn_JYS9rg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: core: Fix crash w/ usb_choose_configuration() if
 no driver
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	netdev@vger.kernel.org, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Eric Dumazet <edumazet@google.com>, Hayes Wang <hayeswang@realtek.com>, 
	Brian Geffon <bgeffon@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Grant Grundler <grundler@chromium.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 11, 2023 at 7:27=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, Dec 11, 2023 at 07:08:14AM -0800, Douglas Anderson wrote:
> > It's possible that usb_choose_configuration() can get called when a
> > USB device has no driver. In this case the recent commit a87b8e3be926
> > ("usb: core: Allow subclassed USB drivers to override
> > usb_choose_configuration()") can cause a crash since it dereferenced
> > the driver structure without checking for NULL. Let's add a check.
> >
> > A USB device with no driver is an anomaly, so make
> > usb_choose_configuration() return immediately if there is no driver.
> >
> > This was seen in the real world when usbguard got ahold of a r8152
> > device at the wrong time. It can also be simulated via this on a
> > computer with one r8152-based USB Ethernet adapter:
> >   cd /sys/bus/usb/drivers/r8152-cfgselector
> >   to_unbind=3D"$(ls -d *-*)"
> >   real_dir=3D"$(readlink -f "${to_unbind}")"
> >   echo "${to_unbind}" > unbind
> >   cd "${real_dir}"
> >   echo 0 > authorized
> >   echo 1 > authorized
> >
> > Fixes: a87b8e3be926 ("usb: core: Allow subclassed USB drivers to overri=
de usb_choose_configuration()")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Return immediately if no driver, as per Alan.
> >
> >  drivers/usb/core/generic.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> > index dcb897158228..2be1e8901e2f 100644
> > --- a/drivers/usb/core/generic.c
> > +++ b/drivers/usb/core/generic.c
> > @@ -59,7 +59,11 @@ int usb_choose_configuration(struct usb_device *udev=
)
> >       int num_configs;
> >       int insufficient_power =3D 0;
> >       struct usb_host_config *c, *best;
> > -     struct usb_device_driver *udriver =3D to_usb_device_driver(udev->=
dev.driver);
> > +     struct usb_device_driver *udriver;
> > +
> > +     if (!udev->dev.driver)
> > +             return -1;
>
> This is a rather unusual condition.  It would be good to put a comment
> just before the test, explaining that if a USB device (not an interface)
> doesn't have a driver then the kernel has no business trying to select
> or install a configuration for it.
>
> Along with the comment, feel free to add:
>
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Thanks for the quick reply. I've added your comment almost verbatim to
the code and sent out a quick v3 with your tag:

https://lore.kernel.org/r/20231211073237.v3.1.If27eb3bf7812f91ab83810f23229=
2f032f4203e0@changeid

