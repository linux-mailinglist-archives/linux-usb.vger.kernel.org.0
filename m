Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0D836B191
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 12:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhDZKW7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 06:22:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232194AbhDZKW6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 06:22:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FA83600D1;
        Mon, 26 Apr 2021 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619432537;
        bh=rBbbIYv3ycK9Tft+BTq3ju7PRrbk29CcghxbDzt3xKo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NaBxF14zlvsjXl7lO9tyTE2m7AB0vMzbWncUUFI5zcJ1bUJq7utrOYAqcGA/6lCEt
         MsHSVtTQ7cBgMUyQpylToXtqBKrnfbQDX/J2G5MuALHUHXe6cr2QELRzGL3dClb0o7
         +4pDhkrTb/bVyA43NwXq6wxRob7SC9a0fxK9+IgGBqc32drclBZsRlQ+EkxWNTkqAa
         yzv2L1rJfsekB1ZjasfRo2MnqVPVfTzICwzZqEFlO76vDdz1mnw+VmLgLcMnFg+0Ky
         wRMNMGbdHyTRqYZF2K5S2xHfxIDe5uk/shhe2m1COlY9hnRCN2UkMheISu5D4P3Xcl
         o+lQoLHtHRm7w==
From:   Felipe Balbi <balbi@kernel.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     gregkh@linuxfoundation.org, ruslan.bilovol@gmail.com,
        jbrunet@baylibre.com, linux-usb@vger.kernel.org,
        kurahul@cadence.com, peter.chen@kernel.org,
        Pawel Laszczak <pawell@cadence.com>
Subject: Re: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before
 enabling it.
In-Reply-To: <20210426044815.5393-1-pawell@gli-login.cadence.com>
References: <20210426044815.5393-1-pawell@gli-login.cadence.com>
Date:   Mon, 26 Apr 2021 13:22:10 +0300
Message-ID: <878s55l50t.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Pawel Laszczak <pawell@cadence.com> writes:
> From: Pawel Laszczak <pawell@cadence.com>
>
> Patch adds disabling endpoint before enabling it during changing
> alternate setting. Lack of this functionality causes that in some
> cases uac2 queue the same request multiple time.
> Such situation can occur when host send set interface with
> alternate setting 1 twice.

Which host is doing that?

> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>
> ---
> Changelog:
> v2:
> - moved disabling endpoint into u_audio_start_playback
>
>  drivers/usb/gadget/function/u_audio.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index 265c4d805f81..c4bbc9decaba 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -401,6 +401,10 @@ int u_audio_start_playback(struct g_audio *audio_dev)
>=20=20
>  	ep =3D audio_dev->in_ep;
>  	prm =3D &uac->p_prm;
> +
> +	if (prm->ep_enabled)
> +		u_audio_stop_capture(audio_dev);

this looks to be a bug in f_uac2.c::afunc_set_alt(), actually. Note how
e.g. f_obex.c::obex_set_alt() is implemented:

> } else if (intf =3D=3D obex->data_id) {
> 	if (alt > 1)
> 		goto fail;
>
> 	if (obex->port.in->enabled) {

if interface is already enabled...

> 		dev_dbg(&cdev->gadget->dev,
> 			"reset obex ttyGS%d\n", obex->port_num);
> 		gserial_disconnect(&obex->port);

...disable it first...

> 	}
>
> 	if (!obex->port.in->desc || !obex->port.out->desc) {
> 		dev_dbg(&cdev->gadget->dev,
> 			"init obex ttyGS%d\n", obex->port_num);
> 		if (config_ep_by_speed(cdev->gadget, f,
> 				       obex->port.in) ||
> 		    config_ep_by_speed(cdev->gadget, f,
> 				       obex->port.out)) {

...before configuring endpoints again

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCGlFIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZbJRAAgMm2a6E3zghjtzlhIxotcViHEaXRaU5A
EXRzblMDGOfnP/DZkkeIv7sPNtAoebc0934F2u69u1hpvJR4Ggt0Yjh4bEJAHTWd
MoZWUtF+nNNTT4vculD6eLwuOqKhWAHwOLJ4WWLRZmq/RC+N6xRDzO2iwgh75ol7
nKHj9+XI0eUPEPNH0uWviL/GLLOGdBysjpptrtcw9wQfhO+hZAE90cXKaWd7NQdt
7O6rL1tAm0Wrlj1hiM1EO/aTTexW9Yj7LO5hTF/9/VavwiIjShatLHeO2W99U07G
yvWZwGDmBHQgwfhFsw55j+9r9bYOxzNS9P6dqdLgzZjYQOzh9Kam1fh/scTjC2wg
znNUqyK79aHSfCQp805btqgeh35T5WL+issvSBfQIanfw9CzwPKoM5cPyvWnR+RS
uifJDj5MEnOME7j9HrbBJLRj+YrbNeRvxVrZ1tenSaEiLFxHlI99rXorv6gkDW49
l2FcnPo1iP3e1fUrKW5hna64M0UZdRK9+19TX8PiuW20/ZYB5L7nU/ZA1At4KKOW
IuJ+D3gvlHjfrvhoDbunsbRd5oIssDw6zp4SYj9wm5Z8j4mi8ilwcDtjn+8hxFb8
N88yg9ekNDQo7P3LeMV/u095WRh3OUF54gO4ztr2dZENgkKzsxQFa52r2v8KKe1c
6AR4cO79BBA=
=w2m3
-----END PGP SIGNATURE-----
--=-=-=--
