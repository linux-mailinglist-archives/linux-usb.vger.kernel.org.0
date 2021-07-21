Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBAD3D0A64
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 10:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbhGUHdJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 03:33:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236349AbhGUHbI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Jul 2021 03:31:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24045611C1;
        Wed, 21 Jul 2021 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626855105;
        bh=gdkABHh1JSwaZNaaASN6K1Wk1G/mCau3lrYR2Ybvt2k=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kK2yeqIr0MUe0PAyaZQZrU4Dete7Bnzc6LiXR6X9Twh9zEz5grCax2ewASFigNGdz
         YAktQrwjph6/9+QLbkhwaMnyUbGGAGagqx6krPWE64OsuDGajk7UaJ2HtCvchkXRx6
         UH2biZlEB2nPkJ42nkZotbpF6vC6eOEMXCsi2m/oYAO22mHBa/kDm9oJg9+QxX0ltl
         sOtUcUIncNbygj7DuEyDVCdx0S60y56yPu0X2VCL+8D5bnutTViQiYMY0HaOGQv32t
         EjAh4PzxheOATDcHVbJp9m7suqcRkXUP25Y5T5zF9tqHX+gznWzZpa9WQdQzgVUGBR
         I1N3QPpXEzdZg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg KH <greg@kroah.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v3 1/5] usb: dwc3: gadget: set gadgets parent to the
 right controller
In-Reply-To: <YPfUTSOpXCSDnmyW@kroah.com>
References: <20210628155311.16762-1-m.grzeschik@pengutronix.de>
 <20210628155311.16762-2-m.grzeschik@pengutronix.de>
 <YPfUTSOpXCSDnmyW@kroah.com>
Date:   Wed, 21 Jul 2021 11:11:37 +0300
Message-ID: <87r1fsxf0m.fsf@kernel.org>
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

Greg KH <greg@kroah.com> writes:
> On Mon, Jun 28, 2021 at 05:53:07PM +0200, Michael Grzeschik wrote:
>> In case of dwc3 it is possible that the sysdev is the parent of the
>> controller. To ensure the right dev is set to the gadget's dev parent we
>> will hand over sysdev instead of dev, which will always point to the
>> controller.
>>=20
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>=20
>> ---
>>    -> v2: first version of patch
>>    -> v3: -
>> ---
>>  drivers/usb/dwc3/gadget.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index af6d7f157989d..8a1b1daff2e97 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -3990,7 +3990,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>>  	}
>>=20=20
>>=20=20
>> -	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
>> +	usb_initialize_gadget(dwc->sysdev, dwc->gadget, dwc_gadget_release);
>
> Does this change how the device shows up in sysfs?

it might, but not in all instances of dwc3

> Why does the parent not always work properly here?

This is a really old commit by Arnd from back in 2016 (d64ff406e51e)
where it was noticed that dwc3's dma ops weren't properly setup. Arnd
decided to pass a property to tell dwc3 core to use the parent device
for dma operations.

This is not required in all instances of dwc3, though.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmD31rkRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjGWAgArpkCwFcNQBBkkAZiWyKq5uz8qPO0j0gN
ztYAV17XDGn5/ULz/XqbnQCHkgSJNdc/NpE3L/4kI3Ng42fq+ABThgYZcPB/u35R
qGn2azeB9x7KGjlFCID1ApipLckBOqD8+SCG4OmJkE3QibAkWIp7Nw8cWB22BSgC
x1X8Sem5K1VyyKUK1MGGCvW4kM59kOSF9Z9d0ijBmYhrngIfZYLrty/vJxcMnpUa
vpXwXPZVwnhSa5kF8aJWx/duCC/Pyg3xSfAb7EKh9LPT5I0OmcAzyt53ptB8WPpy
RIQwvE9quypPuzmktfAMlYHPLXgq6QrelID9hJLEno3zq4oA0BPLMw==
=FaEX
-----END PGP SIGNATURE-----
--=-=-=--
