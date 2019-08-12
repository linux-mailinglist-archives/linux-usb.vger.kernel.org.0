Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D248987E
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 10:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbfHLIOB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 04:14:01 -0400
Received: from mga06.intel.com ([134.134.136.31]:46393 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbfHLIOB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Aug 2019 04:14:01 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 01:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,376,1559545200"; 
   d="asc'?scan'208";a="180779051"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga006.jf.intel.com with ESMTP; 12 Aug 2019 01:12:10 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Rick Tseng <rtseng@nvidia.com>, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Rick <rtseng@nvidia.com>
Subject: Re: [PATCH] xhci: wait CNR when doing xhci resume
In-Reply-To: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
References: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
Date:   Mon, 12 Aug 2019 11:12:01 +0300
Message-ID: <87mugeu7ji.fsf@gmail.com>
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

Rick Tseng <rtseng@nvidia.com> writes:
> +static int xhci_poll_cnr(struct usb_hcd *hcd)
> +{
> +	struct xhci_hcd *xhci =3D hcd_to_xhci(hcd);
> +	void __iomem *reg =3D &xhci->op_regs->status;
> +	u32 result;
> +	int ret;
> +
> +	ret =3D readl_poll_timeout_atomic(reg, result,
> +					(result & STS_CNR) =3D=3D 0,
> +					1, 100 * 1000);
> +	return ret;
> +}
> +

instead of defining your own function...

>  static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
>  {
>  	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
> @@ -508,6 +522,12 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool=
 hibernated)
>  	if (pdev->vendor =3D=3D PCI_VENDOR_ID_INTEL)
>  		usb_enable_intel_xhci_ports(pdev);
>=20=20
> +	if (pdev->vendor =3D=3D PCI_VENDOR_ID_NVIDIA) {
> +		retval =3D xhci_poll_cnr(hcd);

you could just use xhci_handshake() here, right?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1RH1MACgkQzL64meEa
mQazfRAAyLBBiIdUjcHlkl2QwN48f0IcJxmMMrOAlp3zTWzRxjjRRiTi1Cx1Hb1S
HMU4SgmPV8poI9H5VX1Yl2wHw3G2zGyQ8qmU2VuqOj4S3AC04Ds9iTfWp83xS2pz
B0MgUWIKLB+2xSYbZSBpmDYQknkHXOIyog7717K6Cr/OO+e2oTqRKtdBnjRKJdNq
bqBcvOVSXtHPpx9n5+8IXpCdAqleQtrSRbS6Xtf0CfhXE/FpK/iali8FhpQSplvE
S+RNeL2bCpoPlMuBX9sWt3qMpP+UUQatU2dXtUG0ZrtyCghkmAwH06JD3dXM7dj+
bIOiZsGh+WA/4ejzDQUvThov/dJGO1CmztOfz4798m+DOwF/98luI7X0Bvz/2+CC
6U0JSuMuqbv9ihptbRRdrgMX1nLqusVCVyTTgYkFOR4JYVBtvX4ERk3+00q1k8j/
U7dum2T4K3u5L3zpDFxNS1MH5j/Wdqd3o3xR5Y4rwOHVmTuePDCMX3lD1JbCIhC+
vEJUAUdNLG1NvepSKHrbfUN54MJ2cYI8dhs6DtNi6pTUA5FDrFOSzm25yVtxHijR
xS2SZZEaIweOTiyyXHDWl48ZznA7tuytVCAVCK+/0QrjFzK9zc3STiKMzP5XXra5
2v8MWHeyEokU8o7X/8N4nWIcCV1k1qbvXtXiBAVTuaIELw5uZRc=
=KA5n
-----END PGP SIGNATURE-----
--=-=-=--
