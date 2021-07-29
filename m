Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7D23DA0DB
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 12:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235269AbhG2KL0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 06:11:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:55488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231488AbhG2KLZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Jul 2021 06:11:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBB7961040;
        Thu, 29 Jul 2021 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627553483;
        bh=Yhp3wol49d5RYKKEfTjVOP0LZ9awPGs1SEUvAJnqAXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UUAC00L+tE6WuE7nDWlv0DTDwzPDWPpz2PQueeI5j/4sorY+95Xk+m+Cw4GFobnpL
         1ml7uRB+vLa0kOdtv1eA2kd6iI51zINVw9LJzbeq5TW3ghX5VVkaG1mXgIWfOvCJsN
         H/Tw9cj6Jal1vPKf+keR2gHbJBwBynIIlHOUtViQmkB0/29i5f28Pm7u10UjO8pMGf
         H1eYKV9q19n19TRXKQu0CnX0WT8/IVm0+gVH172XFhNxYKa0P0JnzgRzTx4aIwa9jP
         VEtlZTlzcVFvmZi4MHB7zA6m2HrW/QgielQgxODTGILbkWbX42BB3rGU+pirCV+rKr
         nUDFoH2TP0u+Q==
Received: from johan by xi with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m9300-0002O2-Ld; Thu, 29 Jul 2021 12:10:44 +0200
Date:   Thu, 29 Jul 2021 12:10:44 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Chris <chris@cyber-anlage.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303 : unknown device type
Message-ID: <YQJ+pLPIGc4Qwrf8@hovoldconsulting.com>
References: <2560053.x2KRyp2eMa@cyber-bucket>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6lIz+6uUQ3bMUuXQ"
Content-Disposition: inline
In-Reply-To: <2560053.x2KRyp2eMa@cyber-bucket>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--6lIz+6uUQ3bMUuXQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 02:37:23PM +0200, Chris wrote:
> This problem was introduced with 5.13 and still persists in 5.13.5
> After downgrading to 5.12.x, everything works like expected. Tested on=20
> archlinux. The device is an "ICP-DAS I-7561"

Thanks for reporting this.

> lsusb -v
>=20
> Bus 002 Device 002: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial =
Port / Mobile Action MA-8910P
> Couldn't open device, some information will be missing
>=20
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               1.10
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x067b Prolific Technology, Inc.
>   idProduct          0x2303 PL2303 Serial Port / Mobile Action MA-8910P
>   bcdDevice           5d.ca

This is an unexpected device version (93.202) which may need to add a
special case for. The descriptors look just fine otherwise and matches
for example an HXD device I have here (with bcdDevice 4.00) but I guess
it could also be an HX or earlier.

Do you have any idea what kind of chip this is?=20

Johan

--6lIz+6uUQ3bMUuXQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYQJ+oAAKCRALxc3C7H1l
CHX+AQDhhWXMPnf22j53jdF6bjBh/K6m8GRx0WOzR9NES4rWNQD/QQE/Pt3K6REb
+id5rlAJtPbV0Bx1+LJOjcxTSRR0igY=
=JYXz
-----END PGP SIGNATURE-----

--6lIz+6uUQ3bMUuXQ--
