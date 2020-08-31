Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9FE125771A
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 12:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgHaKEc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 06:04:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:45954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbgHaKEa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 06:04:30 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12C3E20693;
        Mon, 31 Aug 2020 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598868270;
        bh=tcn8J9bo+tnDpNIZBB0TXbY/AwHSY/C89s9urd9hlfw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QXJzbanjYrQBnt5RFNpoZP5nedQ4N5a4eioa+zZM+coEyT9rWYNM8GJ1JYxS7/sdU
         sTQpUP0D43W0j1OxIthfW7ra5jTnM4qmPgTkqCRD5OpXRbxLf9lEC0l+Mrby1JtB5R
         n1iQA1rfFwIrWyDWvAqqQZUA13rud00Ozkep8EIE=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 2/8] usb: cdns3: imx: add glue layer runtime pm
 implementation
In-Reply-To: <20200522103256.16322-3-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
 <20200522103256.16322-3-peter.chen@nxp.com>
Date:   Mon, 31 Aug 2020 13:04:22 +0300
Message-ID: <87pn779lnd.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:

> Add imx glue layer runtime pm implementation, and the runtime
> pm is default off.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/cdns3-imx.c | 179 +++++++++++++++++++++++++++++++++-
>  1 file changed, 177 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> index aba988e71958..9d247de8e7eb 100644
> --- a/drivers/usb/cdns3/cdns3-imx.c
> +++ b/drivers/usb/cdns3/cdns3-imx.c
> @@ -15,6 +15,8 @@
>  #include <linux/io.h>
>  #include <linux/of_platform.h>
>  #include <linux/iopoll.h>
> +#include <linux/pm_runtime.h>
> +#include "core.h"
>=20=20
>  #define USB3_CORE_CTRL1    0x00
>  #define USB3_CORE_CTRL2    0x04
> @@ -66,11 +68,30 @@
>  #define CLK_VALID_COMPARE_BITS	(0xf << 28)
>  #define PHY_REFCLK_REQ		(1 << 0)
>=20=20
> +/* OTG registers definition */
> +#define OTGSTS		0x4

looks like a blank line here would (mildly) aid readability.

> +/* OTGSTS */
> +#define OTG_NRDY	(1 << 11)
> +
> +/* xHCI registers definition  */
> +#define XECP_PM_PMCSR		0x8018
> +#define XECP_AUX_CTRL_REG1	0x8120
> +
> +/* Register bits definition */
> +/* XECP_AUX_CTRL_REG1 */
> +#define CFG_RXDET_P3_EN		(1 << 15)
> +
> +/* XECP_PM_PMCSR */
> +#define PS_MASK			(3 << 0)
> +#define PS_D0			0
> +#define PS_D1			(1 << 0)
> +
>  struct cdns_imx {
>  	struct device *dev;
>  	void __iomem *noncore;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> +	struct platform_device *cdns3_pdev;

do you really need the entire platform_device? Why don't you use
container_of to get the platform_device from the device pointer? We
already have a generic to_platform_device(), right?

Or are those referring to different devices?

Also, it seems like that pointer isn't used, at least not in $subject

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9MyyYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYfyw/+Pg1cvLChX/TLMcFlmoFjZmKj/6/GoGyn
Zv27xvkEtMA5z1/pXxUipHVk34ZXON0tCeTiEZhyYeHYDXWiecpPahZQiHNBIfCH
J61U+vQPB39ET2bAIDrQ9LWDtJcl9rr+TLefFC+wltAtB+MuK37RK1FoHn5JW9Y2
aI/1IrQpZ2lu67kW6CD3jnr6lwwxX7yr+iVXCsa566aneSGyu4KerHEsZ1Ga1Q8o
e3ubYaNr7b1StGo0tuW5P0QZRqm8dKRDqqwV7bKWL6/9wvk2lSMABzw5OrP+k/NY
p4+E/eYl4jLBipePFsreNKU0NDkhUOoK226BYSOatHGoygr8WZUvJDqDTYOLBImr
/YiCq+mTe1ApBydufznshot+u0f8RFE2Lqra89SzekPwRxb2aP8qFOCtEUSJBJUg
r281SZBT+r5b/n+R+Q12AOp7K7W0HDg7+ed265O0SombiMSYs+VwZlMZ11iblpe/
/tuEIuTZDN9LDd7qCL2ieD43BT4ekcii44n0YDs6NIjZyY5g+DP2maD5vX9+MVVd
iUAJJbmkvajMUwTzEaHw0FMZqi4iSwU9ykyoe9A6jxCITDCChATk6ziwNHaltoDS
QUYQ9mv450rVLtfTC4vmvISP8e3SFREPzu5QkIYTz2GobhcfbhYdTseD2jxGjHJW
VrX3uF/Oe+g=
=QZ/5
-----END PGP SIGNATURE-----
--=-=-=--
