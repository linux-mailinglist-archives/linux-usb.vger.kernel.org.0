Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAD121070F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 11:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgGAJAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 05:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbgGAJAU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 05:00:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5037C03E97A
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 02:00:19 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqYbJ-0006Zx-Ka; Wed, 01 Jul 2020 11:00:17 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqYbG-0004jo-7U; Wed, 01 Jul 2020 11:00:14 +0200
Date:   Wed, 1 Jul 2020 11:00:14 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Peter Chen <hzpeterchen@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Message-ID: <20200701090014.GN21325@pengutronix.de>
References: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
 <20200629132206.3914-2-m.grzeschik@pengutronix.de>
 <20d3ff88-b4df-91e7-aaa6-ec05917c32ab@synopsys.com>
 <20200630071337.GJ21325@pengutronix.de>
 <CAL411-p19PX+utRb=x-pfBqXPjpHz54BO5OzdZVAuLQKjKxH5A@mail.gmail.com>
 <20200701062040.GM21325@pengutronix.de>
 <AM7PR04MB71571C8D0C89FB998AB431928B6C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gkQsIeIyLzf1kMz9"
Content-Disposition: inline
In-Reply-To: <AM7PR04MB71571C8D0C89FB998AB431928B6C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:56:55 up 132 days, 16:27, 121 users,  load average: 0.25, 0.19,
 0.12
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--gkQsIeIyLzf1kMz9
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2020 at 08:45:19AM +0000, Peter Chen wrote:
>
>> >> drivers/usb/chipidea/udc.c
>> >> 1634:   ret =3D hw_read(ci, OP_FRINDEX, 0x3fff);
>> >
>> >Hi Michael,
>> >
>> >I can't find the above code for chipidea, where did you get?
>>
>> I was greping my usb-wip stack where I have an extra Patch for the get_f=
rame
>> callback implementation of the chipidea/udc.c. I think I will have to po=
st it.
>>
>
>Welcome to that.
>
>> >The frame index value register is a standard EHCI register, but for
>> >UDC, it is not a common register. UDC design is varied for vendors.
>>
>> Good to know. Is there any measure to find out if it is there? I would a=
dd that
>> limitation to the above mentioned patch.
>>
>
>Sorry, I can't get your point. My point was 0x3fff is the mask for Frame I=
ndex Register
>for standard EHCI controller, but this value may not the same meaning
>for other controllers.  So, I suggest only defining for dwc3 in your patch.

Yes I got that now, I somehow missread it for being also not common in
chipidea udc versions. Now that it is clear, I can post the patch.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--gkQsIeIyLzf1kMz9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAl78UJUACgkQC+njFXoe
LGQKdQ//QivJWhZGCYEh8ALJ2Hfdl2iTM27vx8Eu9ed8WzJJ9/WQOpTF+/9X1QvW
eB/k5xClwM8YWVTec/xROnHuT6l1pej9rM9bQNAlkX+VVj21LHIAswxWXgdvhAWu
Z4PZVvzAScT+DyNQrWtKuoDlsfwHp4Qp4C/zKfkXXYa1SvOT7ueyFXPydH6ecXcB
Y7pIgsQ0mGJOLkt0HYZU5KyO5bSFmiwnNKkJbVI/o4QUHwdrSJbrCPPgDcSeSvQc
ZYjVV4PzR7K3J5tFYxgOUzuDQ2FXN3CTaDnRB2ZYlsHVjU9SWuNuW9u9rftL3Vpt
nrnlGXfWVIazbWe1cTMhZLkV0dZEmldorlsIjdNKYnClUdKY7zXKI4bm9/2qbl5B
BMpXT9rxtYlQ9WwQFeu76AsGDslGEfuwWBXSNXcX5It+570om90AO4uSK4Ewbhk7
GeJefCy5s8BmbIY3z71gc9/DSU8GtrKJPhkwLnu/G9ptHDDa3ciRlAtUdtu3rvib
MfRymPl0sfZKL6fEtQ2W5AqVj1hncrJFQ2XC/0wDSSgpt2A59B3kWW8QlZEqNF3C
yw+qCSSB3y/7NbLggJkRhZBOSUodTybP/KzaK6t8ENNe+kEIU/v6NMQQOzZEWMzS
IjUb7RQ0U+u3wNaMURzsFBZd1NSTWE/gRiQ/EIB6m4BipAjRNWw=
=9COM
-----END PGP SIGNATURE-----

--gkQsIeIyLzf1kMz9--
