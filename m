Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085FF2BB0D9
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 17:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbgKTQos (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 11:44:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:56918 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729064AbgKTQos (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Nov 2020 11:44:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D050DAB3D;
        Fri, 20 Nov 2020 16:44:46 +0000 (UTC)
Message-ID: <ff83fd481f3de4bcfa453a837a9c516e50f93061.camel@suse.de>
Subject: Re: [PATCH] ARM: dts: bcm283x: increase dwc2's RX FIFO size
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Date:   Fri, 20 Nov 2020 17:44:45 +0100
In-Reply-To: <e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com>
References: <e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-bVeDmSruMXaCbHVyeWFr"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-bVeDmSruMXaCbHVyeWFr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-11-13 at 08:18 +0100, Pavel Hofman wrote:
> The previous version of the dwc2 overlay set the RX FIFO size to
> 256 4-byte words. This is not enough for 1024 bytes of the largest
> isochronous high speed packet allowed, because it doesn't take into
> account extra space needed by dwc2.
>=20
> RX FIFO's size is calculated based on the following (in 4byte words):
> - 13 locations for SETUP packets
>   5*n + 8 for Slave and Buffer DMA mode where n is number of control
>   endpoints which is 1 on the bcm283x core
>=20
> - 1 location for Global OUT NAK
>=20
> - 2 * 257 locations for status information and the received packet.
>   Typically two spaces are recommended so that when the previous packet
>   is being transferred to AHB, the USB can receive the subsequent
>   packet.
>=20
> - 10 * 1 location for transfer complete status for last packet of each
>   endpoint. The bcm283x core has 5 IN and 5 OUT EPs
>=20
> - 10 * 1 additional location for EPDisable status for each endpoint
>=20
> - 5 * 2 additional locations are recommended for each OUT endpoint
>=20
> Total is 558 locations.
>=20
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---

Applied for next. Thanks!

Regards,
Nicolas


--=-bVeDmSruMXaCbHVyeWFr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+38n0ACgkQlfZmHno8
x/7m0QgAj6RGNxc+o+OriwhIlWJ+7S6AZEL63zVoGGgNrcf68zD/SitKAwkE2cHa
o3rA6Op1egZkbT5V5hB5ku+yMb0dGjlT9ow4huKbnGTpRgXEzSEDAwSJYkIkTPdP
QT5BQQcogs5sgJkObI1I4HjbZa6WLLfpQaU4e22XlQanO8LpDQsXxwLBBd1KvK0y
tC2J61SWXUu14IdpE6rEsjX47qXRw+uBwR9LTiaaQJBsppzykYLsVqi56giAxwOS
1AUThWqS6l8I5nKEgfI/rnxk83zcEMcczaDaKN4NXgAHs75IUef1J5eCwTaHTnAx
XNadMer4PawzAZm1gl6wupg+43bk7Q==
=IHO6
-----END PGP SIGNATURE-----

--=-bVeDmSruMXaCbHVyeWFr--

