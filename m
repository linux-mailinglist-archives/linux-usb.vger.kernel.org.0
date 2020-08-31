Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0880F257862
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 13:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgHaL2t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 07:28:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:56812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgHaL1S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 07:27:18 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28B5620707;
        Mon, 31 Aug 2020 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598873237;
        bh=PsPzZUXkCARyw1/Bpgavuwu8siY52OCiseD9eawSFlg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=dFX5/hDGqWOwkIkJBsHbPOjGrZnUHR2sxKvyBOG8dH1ppjwuyo3R8u3Gg/m1RcUBZ
         dbnLVzTq4diPnPOYhEESj2enl+9ZognOl3YbBvRVPoDTFZ9srOBKxerbVu15wjjskW
         ZFTW2vklKEvl6Lwb6SAx0dOYBQwqfUpC0N9q/tUM=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/8] usb: cdns3: add runtime PM support
In-Reply-To: <AM7PR04MB71572A2B1EDC6D379B1CBDA88B510@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
 <20200522103256.16322-2-peter.chen@nxp.com> <87sgc39ls8.fsf@kernel.org>
 <AM7PR04MB71572A2B1EDC6D379B1CBDA88B510@AM7PR04MB7157.eurprd04.prod.outlook.com>
Date:   Mon, 31 Aug 2020 14:27:04 +0300
Message-ID: <87wo1f9htj.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:
>> Peter Chen <peter.chen@nxp.com> writes:
>> > Introduce runtime PM and wakeup interrupt handler for cdns3, the
>> > runtime PM is default off since other cdns3 has not implemented glue
>> > layer support for runtime PM.
>>=20
>> it should be left disabled by default even after every glue implements i=
t.
>> Enabling runtime PM is a policy decision better left to userspace, IMO.
>>=20
>> > When the controller is in low power mode, the lpm flag will be set.
>> > The interrupt triggered later than lpm flag is set considers as wakeup
>> > interrupt and handled at cdns_drd_irq. Once the wakeup
>>=20
>> This sentence doesn't parse very well. Do you want to rephrase it?
>>=20
>> > occurs, it first disables interrupt to avoid later interrupt
>> > occurrence since the controller is in low power mode at that time, and
>> > access registers may be invalid at that time. At wakeup handler, it
>> > will call pm_runtime_get to wakeup controller, and at runtime resume
>> > handler, it will enable interrupt again.
>>=20
>> Then what? Are you going to, somehow, process pending interrupts? At what
>> point?
>>=20
>> > The API platform_suspend is introduced for glue layer to implement
>> > platform specific PM sequence.
>>=20
>> I really think that's unnecessary. Why can't we rely on parent->child
>> relationship for this?
>>=20
>=20=20
> Hi Felipe,
>
> This is the old version patch; I replied your questions at your reply for=
 new
> version at last Friday, thanks.

yeah sorry, I'm getting caught up on my inbox from oldest to
newest. This slip through the cracks ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9M3ogRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbrzxAAo7QDSy8DV7n8zY6PKNB9PUV/YsmKNXMY
5GZn4s9lNDGShqeqlc9LW8WM5xfMxyTZ3gw1N1f38jXgKlmPKr6CgLcQ0T4QBW8A
vs02Rg8wQbLQDZmFG8P9f6PdHUBckZr9f2ItuWNs6lcGsxbDZ0iuFHtS9fyptoJr
hIzlDgLnIbelFDOTVkvq0bVtHCswsqgTB3MWq5kz0+RIer29wmbT4lXzyDSCSu+b
Nw8ODX5rgfstJfXQodgU7+q7/wy1S3J7+tJIA3VBWBi1QxR1OwQ2duxeQb9S5les
GO5zu/3OXdvjduRmajQ9qeRMfr9djBgtqKWODFfIddnjD3NL2qN0hfUfkBcfrDK6
7W/1fKSngXKmacet6AHb4E5pvr9tGOTxJLqWAFBU2UO0TNAcJ7DCNf+d7YgrWh6O
sgTaSUkzxoJ3mvmo4/1ZYb8/TIZFDrC9m+z14pPaxmEdUEHlVd7GdvH+1VAKJU7L
gtgpR2tfPEvfVX+oEO2oO8hn3MQ19Wqg4W7KdYgG/HI/IZH9Bgbajjvx6gAbJ8dV
WSf4SNzsiSFOUGKebFEUaPpZGcW1+h66xU96Jj3dYE2leeqL276VLAdIAb8W6eAx
bL82TbhQlbYfnRehBHVJp2dDl+lLLxM8yPnKHQI6T3m+KkeairBdH7b+wK7oJcJE
IklffyKTDwA=
=spSR
-----END PGP SIGNATURE-----
--=-=-=--
