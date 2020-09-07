Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A31625F449
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 09:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgIGHsi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 03:48:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:56794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726443AbgIGHsh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 03:48:37 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99103208C7;
        Mon,  7 Sep 2020 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599464915;
        bh=QgiexCAFjbTLszT07oIc+oq0uldLDOJjsJ6jI5uAlpQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=yTpG3Fffmv5iQz5nXfjYI36a4TEh9+roBetuSRo8eBSqjUU9r3Gt1WHtT6phHZyQA
         0YwhStheIU9YbNwpjt3phKKzj9mFi6Hai+vCQIl8nZeAFNdiaXl+J/jJErtPLjWDgf
         lRqHjmhhMBYhBeV3B3Do0ZarvR2lmrvUI3P1t35A=
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
In-Reply-To: <20200731141632.GB1717752@kroah.com>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com>
 <20200731140553.GA8013@b29397-desktop>
 <20200731141632.GB1717752@kroah.com>
Date:   Mon, 07 Sep 2020 10:48:29 +0300
Message-ID: <877dt610z6.fsf@kernel.org>
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

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

Hi,

> On Fri, Jul 31, 2020 at 02:06:20PM +0000, Peter Chen wrote:
>> > And this no-op function is horrid.  There used to be documentation in
>> > the kernel where I could rant about this, but instead, I'll just say,
>> > "why are people trying to work around warnings we put in the core kern=
el
>> > to fix common problems?  Do they think we did that just because we
>> > wanted to be mean???"
>> >=20
>>=20
>> So, like kernel doc for device_initialize said, a proper fix for dwc3
>> should be zeroed gadget device memory at its own driver before the=20
>> gadget device register to driver core, right?
>
> It should get a totally different, dynamically allocated structure.
> NEVER recycle them.

then we break usage of container_of(). That's okay, but we have to add
some sort of private_data to the gadget structure so UDC drivers can get
their own pointers back.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9V5c0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZiIA//d5zOythk6wrhikWbl3RgLJNIrKX+hL+P
vOxYjjoOUrBS1h/2XZ+fxG29rNhOKYYRXegPutk++dmZzhu2spfC8O45Medrr9gl
8nnshybvZVAvD2aJlRy3TZRiJciLncNDX2zUhQn30dkXl50e+g//ZBruvJ58USrJ
zNBEJvu1S5KXB9U6OozaCdOX63QpQgMEBwWVHEytoGWOCwsKOIRyLxK0+czgv2+5
Yo8KWF8VNdKjJHJi95/tO80vwmDt88quuOCMWx9lVjyWGwL5yd0g0Ml81MkvU55q
SDcaeQjFh4wNu5I7aEmP9ylqJF7qsbteF1QcPAPj1O9NlvOJOHG8uSc+5G323SVV
YNI8PCb0VrAXKe492gtd29PAKYWhnohNCkuSu8d1zMK+TjGmq65lrB8vKFuzn0eG
SWS23NbJNee9qe6/1grm0ceuy0+p+7C2YQuXRfFAK4B6Bcg7JeDQc1WbdxtvXOUg
3ogQp6u1+NwhqU4GNLdqm2huvNw76CATgEhewcLMspz+XxAG1sl0sJ0DGBuTCjrq
h6jn9niwTRDVi+umcgg1JuOsRGFVjBIHQ8cIYZkl4/I0Ke0bm0BH8l5f/MTF3AQm
rObFFhkDmouBNrO5h4XjxH8h5vDw3qRofc2CGSNrNcUXgTwfuxGUaxreR6TZV7yz
Geu5kr45RK4=
=+iJf
-----END PGP SIGNATURE-----
--=-=-=--
