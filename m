Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85EB36B388
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 14:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbhDZMyN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 08:54:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:34610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233448AbhDZMxq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 08:53:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6564661263;
        Mon, 26 Apr 2021 12:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619441574;
        bh=jCoyArzKxUa0uhCtl+IMH3GoqBrwNe4Vqk4MkYgAti8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=pUomm1cEcoFxkf8svbHK3zpfksyFGw9k0w0Z4aSAUYp09UquT99g6gpyCUip6yAUC
         StgKqyovN6lqp9RfZOOrL3+nClQSSh1HUQU0jfBufW7kgGWhBa/NLF3BC7ODM+2ZMJ
         kER2L2zWBTnlZXMILiQ01OC9ZTeRPt6z97M2+PiuuOSRMyrUTkul3e5OQO9mGZ/xtU
         siLy8GY+fgHCXW+w4MO2OJxbh/9GuuQHyEbun6Ly1wxL/wmnbcaMIwnB36rpY3QSkl
         eUjqS1VJ+fGWsdiu/4EVtaEksjIXuxHQDNLn5/Nyxrlewletl/vat9wqojA16Hdbvt
         UxuAxtq+nMW/g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "ruslan.bilovol@gmail.com" <ruslan.bilovol@gmail.com>,
        "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rahul Kumar <kurahul@cadence.com>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>
Subject: RE: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before
 enabling it.
In-Reply-To: <BYAPR07MB53814E672CF41548418248C1DD429@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20210426044815.5393-1-pawell@gli-login.cadence.com>
 <878s55l50t.fsf@kernel.org>
 <BYAPR07MB53814E672CF41548418248C1DD429@BYAPR07MB5381.namprd07.prod.outlook.com>
Date:   Mon, 26 Apr 2021 15:52:46 +0300
Message-ID: <8735vdky1t.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Pawel,

Pawel Laszczak <pawell@cadence.com> writes:
>>Pawel Laszczak <pawell@cadence.com> writes:
>>> From: Pawel Laszczak <pawell@cadence.com>
>>>
>>> Patch adds disabling endpoint before enabling it during changing
>>> alternate setting. Lack of this functionality causes that in some
>>> cases uac2 queue the same request multiple time.
>>> Such situation can occur when host send set interface with
>>> alternate setting 1 twice.
>>
>>Which host is doing that?
>
> I've found out this issue on different scenario, but we can imaging the c=
ase with double alternate setting.
>
> My case looks like:
>   - host send Set Alternate Interface (1)
>   - device controller doesn't send ACK for SETUP packet=20
>   - device delegates request to class and class starts processing it (ena=
ble endpoints, etc.)
>   - in the meantime  host re-send the same SETUP packet
>   - device controller driver detects this packet and try to finish previo=
us one (according to USB spec), but it  cannot disable enabled endpoints.=20
>   - device  delegate the new SETUP packet to uac2 class
>   - uac2 again enables endpoint and try to queues again queued requests=20
>   - system crash=20
>=20=20
> The similar solution exist in f_uvc.c:
> https://elixir.bootlin.com/linux/v5.12-rc8/source/drivers/usb/gadget/func=
tion/f_uvc.c#L290
>
> I didn't check the other drivers. Maybe such fix should be added somewher=
e else.
>
> Such issue can be very rare and very hard to debug.

yeah, this is a requirement by the spec, IIRC. A SetAlt to the same
interface/altSetting means the host wants to reset that altSetting. From
the peripheral point of view that means disabling the endpoints and
reenabling them.

I'm just not entirely sure if we should do this in u_audio or
f_uac[12].c. Arguably, composite.c could detect this and disable the
altSetting, but that would require a huge refactor on the framework.

My gut feeling is that for the minimal bug fix, we should patch
f_uac[12].c, but all audio function drivers have the same exact bug, so
I don't know.

If we follow the "standard" of patching the relevant set_alt functions
in the function drivers, the moment we decide to go for a refactoring,
it'll be easier to see common constructs.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCGt54RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQalHA//bf2fdv3Rr/8nm3Dbq7l7aTsC8mdey9L7
zAhtfkC+ul/MIQbRy3LKFr/m6JDP4wyzNKBaYA9Mq78ADBTV6PN1B2ZRL6RtSyyx
4PIREYCBlV5ch2SmhvN/vZXul6Ht2W5+5lTtzwYPIIXExdOgNlCUjWAqYIR1r0SC
o+uS3ZA1fhzOAX0QcLQKmXqn03X7Q5VUQh2lahg6QmhVzg2SC0zS6FY6lZqPwCQl
ur6xDZldxgo9KRm2ZfPYRTe0uN9gfn+j/wI/52NXS5CnGw2uzEiy+hMNhmDMH/Me
60gEmH3980FR5N9TQXarM4rGpJnN5JQu9SI4D1mBcZq3tnl5Q4Y/00GXh+E3ZqGg
9T/U6nOjGbdPst2mEf4q8gV/2+Xxc6XwlmFJWzdwefwnI8LH5sXKN0gS8Qsdlcv6
qEBWAuiBQ464Wgw2MqatIu08Pf4MuXbIOFzUsCVgJhVTUHcEIwub3k1M07LOrwAP
7WnU4UV9D9VK3pf4rlVL878ESBuNvSgCUkMgZL3cT60R3Xwe/ABAgxh75Rw+6Cu1
xFSDEsYupDJmYQ0ojPpH/qR21SpIShk9C5mcpqxrPWtT/LK35bgN8f35m+YZB1Zy
Q/yBx64HFXp/lwEx9pysI9Z4NFo3m3Zu5xbjI4hOMAi9MLQYmlhSvxwSGwr6hQ8Z
H3xZkmkLgGI=
=+2c+
-----END PGP SIGNATURE-----
--=-=-=--
