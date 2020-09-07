Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CA425F3F7
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 09:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgIGH3b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 03:29:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:46676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727773AbgIGH3Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 03:29:24 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E91E2075A;
        Mon,  7 Sep 2020 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599463764;
        bh=fiVMKaCpQNtSpZfOMqiF+Hy9B2MhSJwRupICGTlSJXA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bUUciCr7h10pGs/SZ0Uqxqco2mnTMFwGVmjbvqHUdSOjXA5rtF4dBKQnrmy2HUKeA
         ExXLg/kUdrkquRyCVkTUgUI8/2c8H6aV/dAkdubyb7tAi1v2x4Kw6bCSY4T4dfddzu
         opv/zKSqW2bvvYQpuaR4XaFsQEdHYn0KPenDCAs8=
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@nxp.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, pawell@cadence.com, rogerq@ti.com,
        jun.li@nxp.com
Subject: Re: [PATCH v4 1/9] usb: cdns3: introduce cdns3_set_phy_power API
In-Reply-To: <20200703070044.GB2220026@kroah.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
 <20200703062653.29159-2-peter.chen@nxp.com>
 <20200703070044.GB2220026@kroah.com>
Date:   Mon, 07 Sep 2020 10:29:16 +0300
Message-ID: <87ft7u11v7.fsf@kernel.org>
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

Greg KH <gregkh@linuxfoundation.org> writes:

> On Fri, Jul 03, 2020 at 02:26:45PM +0800, Peter Chen wrote:
>> Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
>> better we have a unity API to handle both USB2 and USB3's power, it
>> could simplify code for error handling and further power management
>> implementation.
>>=20
>> Reviewed-by: Jun Li <jun.li@nxp.com>
>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>> ---
>>  drivers/usb/cdns3/core.c | 44 ++++++++++++++++++++++++++--------------
>>  1 file changed, 29 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>> index 19bbb5b7e6b6..bfd09aa98c12 100644
>> --- a/drivers/usb/cdns3/core.c
>> +++ b/drivers/usb/cdns3/core.c
>> @@ -384,6 +384,28 @@ static int cdns3_role_set(struct usb_role_switch *s=
w, enum usb_role role)
>>  	return ret;
>>  }
>>=20=20
>> +static int cdns3_set_phy_power(struct cdns3 *cdns, bool on)
>
> Please just make function calls self-describing, instead of having to
> try to remember what a specific flag means.  This isn't as bad as some
> functions, but the general idea remains, this should be 2 functions:
> 	set_phy_power_off()
> 	set_phy_power_on()
>
> no need for the cdns3_ prefix, it's a static function.

the cdns3_ prefix helps when using function trace or function graph
trace. It's a lot easier to say "trace anything matching cdns3_*" than
it is to remember each function ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9V4UwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbQ9RAAv/NIrqNQdO2avQfX/VM5jpvGpOlcu5Kz
6qC3n2US1zXWutuCC8aaDLK5+nUuCYmYLDA9jqnyU8jDLHAv+mRsVtKNqqOz8Jf+
R2qUrRWnot4NPn2ikCWAwV0j9C//XzAnMDbe4Vx9EQ+gqixonwJYALiw6MgW3lS6
Ux5S+wEZbO9OTP8iimfk8eArAFo2vB4APDK5gthEoVx4Z20YsXtUVXuleHTqFrTb
SGunTeZvyqTc1Llxd4r+wiMh+bO2ODwPVkELWA1EGqc5KhF+S3xKquqCvKcCHjaU
NRzaygdZrlgHleskKFbUqcSy/dW6oXSiF4EAlNebmgaySsYhf3TPoP55S1Bp8fxv
WtRRDwFs2XQFRWyBcnx1+J9kYyzLK86lsDY9jaF8nKR8U3BiBbcNEHtxAfVoaf48
lkDe8APGdUdFTX3AYyKMbze/N9rIGRZ8WZoHh8a/ssDRvFFMkAC+X9aF8d1sN1kQ
kn0g06NQQmin0hup5EpnT6R5xAs0+CAhtcG1TN/2q9jpPs/CoL3JzsbtaRhGpH/F
odHF4Mc6ayeN88aylOqT6+wHZX9HUWEqM52eidhMGkDFj5brU8mM5/ipOTBeD2y4
1m7O9quORpYqQ/ImkYE7sqY5Z/XXJeyV+zLuMDzjn1wzp8QfY3l95rVv6wHLZka3
wiB7PSNTO4g=
=0Qfi
-----END PGP SIGNATURE-----
--=-=-=--
