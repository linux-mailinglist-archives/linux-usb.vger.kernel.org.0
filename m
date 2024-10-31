Return-Path: <linux-usb+bounces-16924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89E9B8690
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 00:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CE07284313
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 23:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DAB1D04A6;
	Thu, 31 Oct 2024 23:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f+SIniql"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B81C9EBC
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 23:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730415761; cv=none; b=B7+qF1iGiE5mPWNoTXi0lwk2LX6prUiB500IBlMWMdjVokqOU51rcI7GlrAzcqxK0Y/YFT5RYxpxUj9A2EA1WX7k4dhjYhE0TywNyto3xYX7g+MfuFKIN5byFxeS6D2ThywFQ2NfYS1+lfc3YKiu5jPrRifEVtXL1WXYBjRbSZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730415761; c=relaxed/simple;
	bh=YJMoiuITKx4kZZN1MyOo8IM7Zsk4Dh12KYf4/TXSdCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RADWzJEufuXRS28L9BEetlPK7SteuEH3v9xeWpzspUNu05QMPggpzTmbiWtp81GME9KbKQxzzhBxF+IeSwTRfNAmKc6am0YFQa5jKgYaxYGlxJjTAlKlv1bnr7kHvmkFF9bVw2ac0SnRfe2aCK8mXglE+8Iy4ep3mN9x1lWjW+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f+SIniql; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e38ebcc0abso17012097b3.2
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 16:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730415755; x=1731020555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMYC7exWmTyJhpPm7xOmYaN+skzwwWUWdttUcxWnw/4=;
        b=f+SIniqlKIzpPiaRtTkegYSWVAIhQzDyGSpQfDAt4Or7+40API92+tr5hNRvLjNzpP
         X6JEnxa3FvPnLqQrqXXKgzH7DCJzkXEk1NQm0Uh6Y0jw5dTUXEqpqAuKO+INp94vjI17
         OwniUsVaf8cLhj8hS7GFGAtH3eTlwjo2MLW2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730415755; x=1731020555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMYC7exWmTyJhpPm7xOmYaN+skzwwWUWdttUcxWnw/4=;
        b=brRyXjVVMCAD6tUk1KiPefCv7tXNKPwFdGmZBuZvtcMwkb6fUIaXJ4KF+MkbMf5fCL
         0VIvtkfHW6Oh15ar/n34li2so84/gXcAlbTS9ZZKYe12pqtOOjCfk33Ll+QlDdEHcbq8
         n7Ji9UyKFMl29zi57lhNkyjQ3tNv1bH/XhT4shUXfxCa3n2LXDDDGpHbFW1D33GuPp7z
         yhg51/U95OjWg7yEnoVgEn7hzDh3pLbiS0aq9FFSYHwru6+ivPYFza0g9+DGojbi7NTm
         WT03unHk1XCGi593M4JBVJqnnhNC0YNbbQG8AGg3gW2gAgU8VTYr1fNJo6zeugBzLD2f
         kfbg==
X-Forwarded-Encrypted: i=1; AJvYcCVntoXJmGNh9GG6oqC8ygiBQpR2NbmyoYGuRDjLgBf1oJ1yLXABKtmxM4GnckoRXhKD2ZhhQkVV4qA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz8CJQbfhNzt+jdBY9yy9eca1ql6S0KvHC4kHHbFPTPI9kPiFd
	U1eFdEvcxAF6bhIS1AdDuvaGkxkc2vzblJQ7odtdkGWHMj3wXJVlhTbxsolaj7IpdXW0C/zg3Mx
	yTBvHc8sDjfHdq6oQozat6462+E2raJx0gz9U
X-Google-Smtp-Source: AGHT+IG4YM8LKOjO55nzQrrLjyMEG7REdzSOaLfCCy8MD7xqt0nU0GVr7mIlsQYiOsMxcXUO3Jcav2dA5hqHsKPIKSU=
X-Received: by 2002:a05:690c:6e01:b0:6e3:a7b:49b3 with SMTP id
 00721157ae682-6e9d8ad571bmr236603137b3.41.1730415754723; Thu, 31 Oct 2024
 16:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030212854.998318-1-abhishekpandit@chromium.org>
 <20241030142833.v2.1.I3080b036e8de0b9957c57c1c3059db7149c5e549@changeid> <ZyOQJmF-PcFHgmeq@kuha.fi.intel.com>
In-Reply-To: <ZyOQJmF-PcFHgmeq@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 31 Oct 2024 16:02:22 -0700
Message-ID: <CANFp7mXhwMMwyqbKqxe=SgCRPUyXVhKnsJwf0xgJ2LefOvrtjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] usb: typec: Add driver for Thunderbolt 3 Alternate Mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, dmitry.baryshkov@linaro.org, 
	jthies@google.com, akuchynski@google.com, pmalani@chromium.org, 
	Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 7:11=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Abhishek,
>
> On Wed, Oct 30, 2024 at 02:28:32PM -0700, Abhishek Pandit-Subedi wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >
> > Thunderbolt 3 Alternate Mode entry flow is described in
> > USB Type-C Specification Release 2.0.
> >
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> > Changes:
> > * Delay cable + plug checks so that the module doesn't fail to probe
> >   if cable + plug information isn't available by the time the partner
> >   altmode is registered.
> > * Remove unncessary brace after if (IS_ERR(plug))
> >
> > The rest of this patch should be the same as Heikki's original RFC.
> >
> >
> > Changes in v2:
> > - Use <linux/usb/typec_tbt.h> and add missing TBT_CABLE_ROUNDED
> > - Pass struct typec_thunderbolt_data to typec_altmode_notify
> > - Rename TYPEC_TBT_MODE to USB_TYPEC_TBT_MODE
> > - Use USB_TYPEC_TBT_SID and USB_TYPEC_TBT_MODE for device id
> > - Change module license to GPL due to checkpatch warning
> >
> >  drivers/platform/chrome/cros_ec_typec.c  |   2 +-
> >  drivers/usb/typec/altmodes/Kconfig       |   9 +
> >  drivers/usb/typec/altmodes/Makefile      |   2 +
> >  drivers/usb/typec/altmodes/thunderbolt.c | 308 +++++++++++++++++++++++
> >  include/linux/usb/typec_tbt.h            |   3 +-
> >  5 files changed, 322 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c
> >
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform=
/chrome/cros_ec_typec.c
> > index c7781aea0b88..53d93baa36a8 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -499,7 +499,7 @@ static int cros_typec_enable_tbt(struct cros_typec_=
data *typec,
> >       }
> >
> >       port->state.data =3D &data;
> > -     port->state.mode =3D TYPEC_TBT_MODE;
> > +     port->state.mode =3D USB_TYPEC_TBT_MODE;
> >
> >       return typec_mux_set(port->mux, &port->state);
> >  }
>
> The definition should be changed in a separate patch.

Ack -- will pull the rename out into its own patch.

>
> > +static const struct typec_device_id tbt_typec_id[] =3D {
> > +     { USB_TYPEC_TBT_SID, USB_TYPEC_TBT_MODE },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(typec, tbt_typec_id);
>
> Now the mode would be the same thing as connector state, which is not
> true. The connector state is supposed to reflect the pin assignment,
> and the mode is the mode index used with the actual VDMs. For example,
> DP alt mode has several different states, but only one mode.
>
> The TBT3 altmode driver will not work with this patch alone, it will
> never bind to the partner TBT3 alt mode because the mode does not
> match.
>
> Can you reorganise this series so that the patch 2/7 comes before this
> one? Then I think you can just use the SVID unless I'm mistaken:
>
>         static const struct typec_device_id tbt_typec_id[] =3D {
>                 { USB_TYPEC_TBT_SID },
>                 { }
>         };
>         MODULE_DEVICE_TABLE(typec, tbt_typec_id);
>
> Alternatively, just leave it to TYPEC_ANY_MODE for now.
>

Sure, I'll re-order the patches and get rid of the mode. I'm actually
a bit confused as to how mode is supposed to be used since typec_dp.h
defines USB_TYPEC_DP_MODE=3D1, typec_tbt.h defines
USB_TYPEC_TBT_MODE=3DTYPEC_STATE_MODAL and it looks like USB state also
starts from TYPEC_STATE_MODAL and continues.

Is this documented in the spec somewhere? How should this mode value
be used and shared between USB and various alt-modes? At least the DP
case seems clear because as you said it describes different pin
assignments. However, the term "mode" seems to be overloaded since
it's used in other areas.

> > +static struct typec_altmode_driver tbt_altmode_driver =3D {
> > +     .id_table =3D tbt_typec_id,
> > +     .probe =3D tbt_altmode_probe,
> > +     .remove =3D tbt_altmode_remove,
> > +     .driver =3D {
> > +             .name =3D "typec-thunderbolt",
> > +             .owner =3D THIS_MODULE,
> > +     }
> > +};
> > +module_typec_altmode_driver(tbt_altmode_driver);
> > +
> > +MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("Thunderbolt3 USB Type-C Alternate Mode");
> > diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tb=
t.h
> > index fa97d7e00f5c..3ff82641f6a0 100644
> > --- a/include/linux/usb/typec_tbt.h
> > +++ b/include/linux/usb/typec_tbt.h
> > @@ -10,7 +10,7 @@
> >  #define USB_TYPEC_TBT_SID            USB_TYPEC_VENDOR_INTEL
> >
> >  /* Connector state for Thunderbolt3 */
> > -#define TYPEC_TBT_MODE                       TYPEC_STATE_MODAL
> > +#define USB_TYPEC_TBT_MODE           TYPEC_STATE_MODAL
>
> I think USB_TYPEC_STATE_TBT would be better. But please change this in
> a separate patch in any case.

Same question as above about mode vs state :)

>
> thanks,
>
> --
> heikki

