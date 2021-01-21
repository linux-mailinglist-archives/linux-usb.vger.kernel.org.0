Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA632FE6F5
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 11:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbhAUKAq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 05:00:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:40206 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727571AbhAUKAO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Jan 2021 05:00:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C88EBAAAE;
        Thu, 21 Jan 2021 09:59:29 +0000 (UTC)
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
To:     =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        dri-devel@lists.freedesktop.org
Cc:     hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
        linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
        pontus.fuchs@gmail.com, peter@stuge.se
References: <20210120170033.38468-1-noralf@tronnes.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ebda4ea3-3352-f35f-883e-6db751d6ca8b@suse.de>
Date:   Thu, 21 Jan 2021 10:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120170033.38468-1-noralf@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lUNQonN5NA07LdUGgcg7oitsIXx7eBawH"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lUNQonN5NA07LdUGgcg7oitsIXx7eBawH
Content-Type: multipart/mixed; boundary="HupWfajQ111yK9FIVJPR8itMN7An8SOEb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, peter@stuge.se
Message-ID: <ebda4ea3-3352-f35f-883e-6db751d6ca8b@suse.de>
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
References: <20210120170033.38468-1-noralf@tronnes.org>
In-Reply-To: <20210120170033.38468-1-noralf@tronnes.org>

--HupWfajQ111yK9FIVJPR8itMN7An8SOEb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.01.21 um 18:00 schrieb Noralf Tr=C3=B8nnes:
> Hi,
>=20
> A while back I had the idea to turn a Raspberry Pi Zero into a $5
> USB to HDMI/SDTV/DSI/DPI display adapter.
>=20
> The reason for calling it 'Generic' is so anyone can make a USB
> display/adapter against this driver, all that's needed is to add a USB
> vid:pid.

Well, I'd strongly ask to not call it "generic", because it isn't. We=20
have other USB drivers and anyone can make a USB display with these=20
protocols as well. That doesn't make them generic. A USB-standardized=20
protocol would be generic. Maybe call it custom, or home-made.

Best regards
Thomas

>=20
> Unfortunately I've had some compounding health problems that have
> severally limited the time I can spend in front of a computer. For this=

> reason I've decided to keep the gadget driver out-of-tree and focus on
> getting the host driver merged first.
>=20
> See the wiki[1] for more information and images for the Raspberry Pi
> Zero/4.
>=20
> One big change this time is that I've followed Peter Stuge's advice to
> not let DRM stuff leak into the USB protocol. This has made the protoco=
l
> easier to understand just from reading the header file.
>=20
> Noralf.
>=20
> [1] https://github.com/notro/gud/wiki
>=20
>=20
> Noralf Tr=C3=B8nnes (3):
>    drm/uapi: Add USB connector type
>    drm/probe-helper: Check epoch counter in output_poll_execute()
>    drm: Add Generic USB Display driver
>=20
>   MAINTAINERS                         |   8 +
>   drivers/gpu/drm/Kconfig             |   2 +
>   drivers/gpu/drm/Makefile            |   1 +
>   drivers/gpu/drm/drm_probe_helper.c  |   7 +-
>   drivers/gpu/drm/gud/Kconfig         |  14 +
>   drivers/gpu/drm/gud/Makefile        |   4 +
>   drivers/gpu/drm/gud/gud_connector.c | 722 +++++++++++++++++++++++++++=
+
>   drivers/gpu/drm/gud/gud_drv.c       | 620 ++++++++++++++++++++++++
>   drivers/gpu/drm/gud/gud_internal.h  | 148 ++++++
>   drivers/gpu/drm/gud/gud_pipe.c      | 472 ++++++++++++++++++
>   include/drm/gud.h                   | 356 ++++++++++++++
>   include/uapi/drm/drm_mode.h         |   1 +
>   12 files changed, 2354 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/gud/Kconfig
>   create mode 100644 drivers/gpu/drm/gud/Makefile
>   create mode 100644 drivers/gpu/drm/gud/gud_connector.c
>   create mode 100644 drivers/gpu/drm/gud/gud_drv.c
>   create mode 100644 drivers/gpu/drm/gud/gud_internal.h
>   create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
>   create mode 100644 include/drm/gud.h
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--HupWfajQ111yK9FIVJPR8itMN7An8SOEb--

--lUNQonN5NA07LdUGgcg7oitsIXx7eBawH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAJUIAFAwAAAAAACgkQlh/E3EQov+DU
ARAAud5ve7N/VKHzcPhmkV2X80u7a7UENx16SNXUCKiH97G+aKpaWrKym9JwjgG7plf+ORoLhljb
gO6fmiMassuTQvaD4Ct5GdDH2AyLG/PHjLGnJHEQ5M1Ad35XDsCIA4O+7r1d5/XtyS8o2bxGunt+
2PeAwIDbmX/AifaNMtlqpgDEt65Zq6Wd/ttQ+LgIl+phsmhuSwll1eX9bZiERZSIUnycEa5SCMU1
igzvFHsmNu8Gni+/m941vobipElEJ0zhAFwb8qvds9P1a10jiMc+Z18DgZl/wZhALJhH1Z6aOR/F
g+v+o43M0jGZ5ARYd8vQ1pfq4c1YwSx4LfutB9kAxyCtUD/KMvXVyPYUMjet6o1xlC+XlIU7RHq9
fL7+Njd4w35LYn5DSzcGLlKuiknDvypjzv+qs49vbKyg0HbQ9zIJnLgD6/iFN6PWe5bpA69YhIO9
X0xy9ka0Fbmc0x8X9O4Db3UItX+bc4aG5KieWnzVgCHb/f/97uA/O4aPKatLTF+uDVSCACqeRwRh
dqSR5vhgk0djBk6Ye+L4TrqjEQfTA+WOtUzJuq09L4loajDBJsRoO6NX34SXEkM/ksGclOagtUfw
P8De18RPKPuA+MfGJTWu0KWayhP4/0tw/FHc70xTxGgyf6blXDCkOYEtGGX1PkSqMVaOQh1wEPL6
rwI=
=C4bq
-----END PGP SIGNATURE-----

--lUNQonN5NA07LdUGgcg7oitsIXx7eBawH--
