Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C435246702
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 15:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgHQNJg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 09:09:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:37406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728284AbgHQNJd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 09:09:33 -0400
Received: from saruman (unknown [194.34.132.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6AADD2072E;
        Mon, 17 Aug 2020 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597669773;
        bh=TJL05xJ3asKJiaGuEPM6Ds3UueXivktSdATtscplyxI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=PEvQeDaFZwgdSeVoNd+sRn7EISYHI6muRj8LtqiPvkSeDhDQ4AN/TudSJmVBUS0/0
         TsbbMGDxHX7zC4b06nrAkfejNz+tehRXCJzNH4z17mlv+J7BopQFpFUwDtvyw9y4Ur
         W/afoR59Rbzemdy7NYW8oGhGTWl9mf34kkXc6JSI=
From:   Felipe Balbi <balbi@kernel.org>
To:     Raymond Tan <raymond.tan@intel.com>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Raymond Tan <raymond.tan@intel.com>
Subject: Re: [PATCH 2/2] usb: dwc3: pci: Allow Elkhart Lake to utilize DSM
 method for PM functionality
In-Reply-To: <1596478284-69661-3-git-send-email-raymond.tan@intel.com>
References: <1596478284-69661-1-git-send-email-raymond.tan@intel.com>
 <1596478284-69661-3-git-send-email-raymond.tan@intel.com>
Date:   Mon, 17 Aug 2020 16:09:26 +0300
Message-ID: <87a6ytzaex.fsf@kernel.org>
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

Raymond Tan <raymond.tan@intel.com> writes:

> Similar to some other IA platforms, Elkhart Lake too depends on the PMU
> register write to request transition of Dx power state.
>
> Thus, we add the PCI_DEVICE_ID_INTEL_EHL to the list of devices that shall
> execute the ACPI _DSM method during D0/D3 sequence.
>
> Signed-off-by: Raymond Tan <raymond.tan@intel.com>
> ---
>  drivers/usb/dwc3/dwc3-pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
> index 4f436b3..4d50187 100644
> --- a/drivers/usb/dwc3/dwc3-pci.c
> +++ b/drivers/usb/dwc3/dwc3-pci.c
> @@ -149,7 +149,8 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc)
>=20=20
>  	if (pdev->vendor =3D=3D PCI_VENDOR_ID_INTEL) {
>  		if (pdev->device =3D=3D PCI_DEVICE_ID_INTEL_BXT ||
> -				pdev->device =3D=3D PCI_DEVICE_ID_INTEL_BXT_M) {
> +		    pdev->device =3D=3D PCI_DEVICE_ID_INTEL_BXT_M ||
> +		    pdev->device =3D=3D PCI_DEVICE_ID_INTEL_EHL) {

this looks like a bug fix which could be added during -rc cycle. As
such, it should be patch 1 in this series. Renaming the macro is less
critical. Can you update your series so I can take patch 1 during -rc
and patch 2 for next merge window? Please, don't forget to add the
Fixes: tag ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl86gYYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbBmg/9HxBCRm0/XomweB9pWyIRbuTLZ0Ri1TwK
vixTC6rsLCHesYrO6cgT/b7TlSHIGbJb/l8YuWDJmODRWKJH3w4laTlXttuKGsj/
4ByDq5cIIUU1LlMTPVE+0ULKTLBSKvzQZ+ouUEp32TEIOQ7mlUapx73LJpGysLHi
uX1y8ePABB1OrCi8S+3IjEozSM7KDPlr0Q/fkcj7hWg1onGP954SgSLqZP1BpymZ
tKGkGS0TRvO/akYPVEGslFemMZuQxQGdHgjmQNnSpRYVwRSukNLv8U30CBDwvYTQ
fPhaUq2B7tuMthqHLlkPCbebG3ariiGodRQrIt8XlnSp0IMSdR0zz0C/Atrw5rkS
X3SHBGRPILhaPWh5gSmODpM5JdU1o7rzzKnXSETs+v+8lz7g+6phlyCPv37nzDS/
JtlkM/pvJHvLw6YNrpapelZw3+hbx6IJvyiLIoU2Glew87c4a8FiPt2Ux282MMwQ
GrPKwSIhr/MmOH8Nr0rjH5P6ZT+prRel+InRYHl0893j2p3Rbu4Bha8bSypmlh9t
1JxB+5Z1JLW3Lxu+7wS7zlNcQul7MLBpTeOws2HC9Nicyn7fv3z/JblPVM+dw3Wd
P446X+blBZnS5SFiMvC4HBr6+enBE86rxFLsYbog/+cZEWiO9Wp8eUKsAkpOlzTi
8L2mQr3o77g=
=FJ2T
-----END PGP SIGNATURE-----
--=-=-=--
