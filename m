Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0200211C6BF
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 08:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbfLLH5t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 02:57:49 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46451 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfLLH5t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 02:57:49 -0500
Received: by mail-lj1-f196.google.com with SMTP id z17so1135284ljk.13
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 23:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=PQhNofnag2d4VIgcryiDoUFAj/b20yNC9+HGvXikpQk=;
        b=PSbtbPnVk2rucvxn3GK8J6j2nAF+cNet94vjM7Ude2suGr2wsOAao009JMQgmVsPzM
         TZK9Q56lf4Lgxqlvd0eyMVlwiG3REjXi8bzAuM5qi91O58XC5cFsW40BWLx0i6vGQUk/
         F0jsJLG1lNt9YAJVwHbC86ZGrRQ2TUHWEjW8nEaSIaM3PLazt3Si26VB5kYwv9geSDsV
         Je6k+iWApXO9pcv92JqX+Sr+25GSvUQ9XcXfU5Qy1twlUw43v/nuLanvNbydDT4es3D8
         Y/mBr3uyEpRLZgb0hIBqJ2XgXQDcOKi6eneFf+K+0IEEbBiZS6CMm2PXIqgfQVzUYocj
         9Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=PQhNofnag2d4VIgcryiDoUFAj/b20yNC9+HGvXikpQk=;
        b=DljJ6KFg77iMfOXCZTtdC3BA690f13Xj4j+Xv//dw571iclgS2UD0MxGY3jf8B9oN7
         hxal+2hQg0ApjYSwpyXUipZiz/xxevkuZPEdKxIm3TqFwKWEBXDNUkKTE0Sk02Of/WIC
         X2t+KkuMbnN3neMb+FCdvrJuIR/RyTbQhV3aAVrGKRvd6bRocs/6HaZSsYs8bqurt+6S
         TvRUdalFDa/0sGoyA8PDagecSe5+7NLOMGi/mnyChvW2YaI47p1ZvbMlYsO+GnO9OPTk
         t+FxlrVU9QkAHjPqeJY/BZCsQ6V2lD+FzZvny6xP+9oMJwOeFht/hFmnFNyzwKmIHqmc
         LP/w==
X-Gm-Message-State: APjAAAVjI0iaLqHAZS7fh0wh7xzDSRqL+eLjXKLepH8jYPP/MLmg/iQx
        pxVDJJ4DLVVGB8ZyblKmOyI=
X-Google-Smtp-Source: APXvYqynM+BBs+31xj19OYFuKEZZVXs4YEzFTVnRSGmzxuzXnlc4CUH+3dxS1+RV5pnupn7gnJedew==
X-Received: by 2002:a2e:9157:: with SMTP id q23mr5058880ljg.196.1576137466290;
        Wed, 11 Dec 2019 23:57:46 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id g14sm2511537ljj.37.2019.12.11.23.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 23:57:45 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Roger Quadros <rogerq@ti.com>, zhengbin <zhengbin13@huawei.com>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 02/14] usb: gadget: Add callback to set lane and transfer rate
In-Reply-To: <25394a433bb79ddf36d0ec52bc998b164e373bf4.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com> <25394a433bb79ddf36d0ec52bc998b164e373bf4.1576118671.git.thinhn@synopsys.com>
Date:   Thu, 12 Dec 2019 09:58:30 +0200
Message-ID: <874ky6x9eh.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Introduce gadget opts udc_set_sublink_speed callback to set the lane
> count and transfer rate (in lane speed mantissa of Gbps) for SuperSpeed
> Plus capable gadgets. In the same way udc_set_speed, this function can
> control the gadget's sublink attributes for SuperSpeed Plus.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  drivers/usb/gadget/composite.c           |  2 ++
>  drivers/usb/gadget/legacy/mass_storage.c |  2 ++

I would rather not add new features to the legacy gadgets and focus on
our configfs interface for anything new. Moreover, using the feature
you introduced could, arguably, be done as a separate patch.

> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composit=
e.c
> index 3b4f67000315..a4de5a8c0f19 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -2353,6 +2353,8 @@ int usb_composite_probe(struct usb_composite_driver=
 *driver)
>  	gadget_driver->function =3D  (char *) driver->name;
>  	gadget_driver->driver.name =3D driver->name;
>  	gadget_driver->max_speed =3D driver->max_speed;
> +	gadget_driver->max_lane_count =3D driver->max_lane_count;
> +	gadget_driver->max_lsm =3D driver->max_lsm;
>=20=20
>  	return usb_gadget_probe_driver(gadget_driver);
>  }
> diff --git a/drivers/usb/gadget/legacy/mass_storage.c b/drivers/usb/gadge=
t/legacy/mass_storage.c
> index f18f77584fc2..a0912c5afffc 100644
> --- a/drivers/usb/gadget/legacy/mass_storage.c
> +++ b/drivers/usb/gadget/legacy/mass_storage.c
> @@ -223,6 +223,8 @@ static struct usb_composite_driver msg_driver =3D {
>  	.name		=3D "g_mass_storage",
>  	.dev		=3D &msg_device_desc,
>  	.max_speed	=3D USB_SPEED_SUPER_PLUS,
> +	.max_lane_count	=3D 2,
> +	.max_lsm	=3D 10,

Right, as mentioned, I'd prefer not touch the legacy gadgets. But in any
case, why is it so that the gadget is telling you about max lane count
and lsm? That should be abstracted away from the gadget driver. Gadget
driver shouldn't have knowledge of number of lanes because, at the end
of the day, that doesn't really change anything in practice. Unlike HS
vs SS which changes a bunch of things.

>  	.needs_serial	=3D 1,
>  	.strings	=3D dev_strings,
>  	.bind		=3D msg_bind,
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 51fa614b4079..a3b106a22a6e 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1120,6 +1120,35 @@ static inline void usb_gadget_udc_set_speed(struct=
 usb_udc *udc,
>  	}
>  }
>=20=20
> +/**
> + * usb_gadget_udc_set_sublink_attr - tells usb device controller the sub=
link
> + *    attributes supported by the current driver
> + * @udc: The device we want to set maximum speed
> + * @lane_count: The maximum number of lanes to connect
> + * @lsm: The maximum lane speed mantissa in Gbps to run
> + *
> + * In the same way as usb_gadget_udc_set_speed(), this function can set =
the
> + * gadget's sublink attributes for SuperSpeed Plus.
> + *
> + * This call is issued by the UDC Class driver before calling
> + * usb_gadget_udc_start() in order to make sure that we don't try to
> + * connect on speeds the gadget driver doesn't support.
> + */
> +static inline void usb_gadget_udc_set_sublink_attr(struct usb_udc *udc,
> +						   unsigned int lane_count,
> +						   unsigned int lsm)

do we envision a possibility of future USB spec releases adding more
data here? How about introducing a struct usb_sublink_attr to be passed
around? Could be used by both host and gadget stacks.

> +{
> +	if (udc->gadget->ops->udc_set_sublink_attr) {
> +		unsigned int rate;
> +		unsigned int lanes;
> +
> +		rate =3D min(lsm, udc->gadget->max_lsm);
> +		lanes =3D min(lane_count, udc->gadget->max_lane_count);

considering that lsm and lane_count are from 0 to their respective max
values, do you need a min() here? Might be better to WARN() when either
in over their max values.

> +		udc->gadget->ops->udc_set_sublink_attr(udc->gadget,
> +						       lanes, rate);

indentation using spaces? (same above, please fix)

> @@ -1353,7 +1382,14 @@ static int udc_bind_to_driver(struct usb_udc *udc,=
 struct usb_gadget_driver *dri
>  	udc->dev.driver =3D &driver->driver;
>  	udc->gadget->dev.driver =3D &driver->driver;
>=20=20
> -	usb_gadget_udc_set_speed(udc, driver->max_speed);
> +	if (udc->gadget->ops->udc_set_sublink_attr &&
> +	    udc->gadget->max_speed =3D=3D USB_SPEED_SUPER_PLUS &&
> +	    driver->max_lsm && driver->max_lane_count &&
> +	    driver->max_speed =3D=3D USB_SPEED_SUPER_PLUS)

So if driver doesn't provide max_lsm and max_speed you don't set sublink
attr? Won't this cause problems? Also, the sublink_attr is still,
conceptually, setting the max speed for the bus, right? So you may want
to call usb_gadget_udc_set_sublink_attr() from inside
usb_gadget_udc_set_speed(), then we don't need to modify all the callers.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3x8yYACgkQzL64meEa
mQYZ7g/9H4shX8lwb4VyHhvBZu19pPUeaMg/LzBZugAAh/Z9lu0KpwqKap2N1n82
ZTWzzmCjou3uZDffzocxRsPi5SNVBx6aMM1jLwcv5XWvZemcxJDmKixDVZl7bsHj
6BIKGRQcHFj1B41Lhp74UvH2IAkMt0olo6gr3N3H+6lp08RS1hs2hqVc63lBozJE
UWCO0fY2sA5erlfXlO1LKRLRHn3YbVtacxYCx+PhcFeR4q+2WiXNriB6ELImZ9gL
1Y4ozcJaaqwEmmTlm+pqLzyBxEYSz5a1fC33I0PSCo4/E8lZ6KfWGOqR6RH+g+La
loSSLhKjbId+oYCLkwWFhBAN5F8aX0eWoo5l4l5dBbRm0k+bKljr+2SfJ058dhAo
aULrFMsGdjZ2vc9hn0Co6brzs7Tm4xI0D4r9PmqgrI34SrxzPaj7mmZHcnwuatRI
FS4zTnugIhtEMvQ0dy8DoQsryGXW1ES43b3gPbrZDIhSQjbqd99zKhc4Bj0Tn7bv
9JbttZ7hWgorJQ3we2puF3CZx3AL7AHezI39hUMTE30uuKew9A3Bc0vDxcTK5UDX
lvyLfk8v+Cnjb5QeevrbPrJ9NLQKhCyPN7KYrNSOHVnayApXaa9tOGht6TgOPdXt
rr9Arp61Od7KTzVSqYXL7naREBrAITuct2/+taI1Kx2aaFdyifA=
=To+p
-----END PGP SIGNATURE-----
--=-=-=--
