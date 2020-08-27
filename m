Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D80F2545CD
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 15:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgH0NUo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 09:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:52502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727977AbgH0NUd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 09:20:33 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BA2C2177B;
        Thu, 27 Aug 2020 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598534422;
        bh=3UUv5GZXs5OPc6NZSgfQgryXBZh3vLgUdbHtldSBIqY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=cObzv+HE6f/RtXak9qv0Txv8BiWCBx8D3x3KxpTSyXwDZozPkJEsa8ktg8V/8BHoL
         c1nGGMG09zY0nPMNzCCvoqUfV8gB+XTtp2pUSskwBOf1Dde3Y8yUIimWXbfld9ca2G
         5JaLTy37hjTDsCFtkrBbzhMpj06fPb/F/+iO3Ph8=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v7 3/3] usb: cdns3: imx: add glue layer runtime pm
 implementation
In-Reply-To: <20200825021120.4926-4-peter.chen@nxp.com>
References: <20200825021120.4926-1-peter.chen@nxp.com>
 <20200825021120.4926-4-peter.chen@nxp.com>
Date:   Thu, 27 Aug 2020 16:20:15 +0300
Message-ID: <87eensi5tc.fsf@kernel.org>
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
> Reviewed-by: Pawel Laszczak <pawell@cadence.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/cdns3-imx.c | 203 ++++++++++++++++++++++++++++++++--
>  1 file changed, 192 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> index aba988e71958..a413df26e948 100644
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
> @@ -32,7 +34,7 @@
>  /* Register bits definition */
>=20=20
>  /* USB3_CORE_CTRL1 */
> -#define SW_RESET_MASK	(0x3f << 26)
> +#define SW_RESET_MASK	GENMASK(31, 26)

why is this part of adding imx runtime pm?

> @@ -44,17 +46,17 @@
>  #define OC_DISABLE	BIT(9)
>  #define MDCTRL_CLK_SEL	BIT(7)
>  #define MODE_STRAP_MASK	(0x7)
> -#define DEV_MODE	(1 << 2)
> -#define HOST_MODE	(1 << 1)
> -#define OTG_MODE	(1 << 0)
> +#define DEV_MODE	BIT(2)
> +#define HOST_MODE	BIT(1)
> +#define OTG_MODE	BIT(0)

and these?

>=20=20
>  /* USB3_INT_REG */
>  #define CLK_125_REQ	BIT(29)
>  #define LPM_CLK_REQ	BIT(28)
>  #define DEVU3_WAEKUP_EN	BIT(14)
>  #define OTG_WAKEUP_EN	BIT(12)
> -#define DEV_INT_EN (3 << 8) /* DEV INT b9:8 */
> -#define HOST_INT1_EN (1 << 0) /* HOST INT b7:0 */
> +#define DEV_INT_EN	GENMASK(9, 8) /* DEV INT b9:8 */
> +#define HOST_INT1_EN	BIT(0) /* HOST INT b7:0 */

what about these?

> @@ -62,15 +64,34 @@
>  #define HOST_POWER_ON_READY	BIT(12)
>=20=20
>  /* USB3_SSPHY_STATUS */
> -#define CLK_VALID_MASK		(0x3f << 26)
> -#define CLK_VALID_COMPARE_BITS	(0xf << 28)
> -#define PHY_REFCLK_REQ		(1 << 0)
> +#define CLK_VALID_MASK		GENMASK(31, 26)
> +#define CLK_VALID_COMPARE_BITS	GENMASK(31, 28)
> +#define PHY_REFCLK_REQ		BIT(0)

these?

> +/* OTG registers definition */
> +#define OTGSTS		0x4
> +/* OTGSTS */
> +#define OTG_NRDY	BIT(11)
> +
> +/* xHCI registers definition  */
> +#define XECP_PM_PMCSR		0x8018
> +#define XECP_AUX_CTRL_REG1	0x8120
> +
> +/* Register bits definition */
> +/* XECP_AUX_CTRL_REG1 */
> +#define CFG_RXDET_P3_EN		BIT(15)
> +
> +/* XECP_PM_PMCSR */
> +#define PS_MASK			GENMASK(1, 0)
> +#define PS_D0			0
> +#define PS_D1			1

I think only these are part of $subject

>  struct cdns_imx {
>  	struct device *dev;
>  	void __iomem *noncore;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> +	struct platform_device *cdns3_pdev;
>  };
>=20=20
>  static inline u32 cdns_imx_readl(struct cdns_imx *data, u32 offset)
> @@ -126,6 +147,20 @@ static int cdns_imx_noncore_init(struct cdns_imx *da=
ta)
>  	return ret;
>  }
>=20=20
> +static int cdns_imx_platform_suspend(struct device *dev,
> +	bool suspend, bool wakeup);
> +static struct cdns3_platform_data cdns_imx_pdata =3D {

make it const?

> +	.platform_suspend =3D cdns_imx_platform_suspend,
> +};
> +
> +static struct of_dev_auxdata cdns_imx_auxdata[] =3D {

const?

> +	{
> +	.compatible =3D "cdns,usb3",
> +	.platform_data =3D &cdns_imx_pdata,
> +	},

bad indentation

> @@ -194,6 +233,147 @@ static int cdns_imx_remove(struct platform_device *=
pdev)
>  	return 0;
>  }
>=20=20
> +#ifdef CONFIG_PM
> +static void cdns3_set_wakeup(struct cdns_imx *data, bool enable)
> +{
> +	u32 value;
> +
> +	value =3D cdns_imx_readl(data, USB3_INT_REG);
> +	if (enable)
> +		value |=3D OTG_WAKEUP_EN | DEVU3_WAEKUP_EN;
> +	else
> +		value &=3D ~(OTG_WAKEUP_EN | DEVU3_WAEKUP_EN);
> +
> +	cdns_imx_writel(data, USB3_INT_REG, value);
> +}
> +
> +static int cdns_imx_platform_suspend(struct device *dev,
> +		bool suspend, bool wakeup)
> +{
> +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> +	struct device *parent =3D dev->parent;
> +	struct cdns_imx *data =3D dev_get_drvdata(parent);
> +	void __iomem *otg_regs =3D (void __iomem *)(cdns->otg_regs);

why the cast?

> +	void __iomem *xhci_regs =3D cdns->xhci_regs;
> +	u32 value;
> +	int ret =3D 0;
> +
> +	if (cdns->role !=3D USB_ROLE_HOST)
> +		return 0;
> +
> +	if (suspend) {
> +		/* SW request low power when all usb ports allow to it ??? */
> +		value =3D readl(xhci_regs + XECP_PM_PMCSR);
> +		value &=3D ~PS_MASK;
> +		value |=3D PS_D1;
> +		writel(value, xhci_regs + XECP_PM_PMCSR);
> +
> +		/* mdctrl_clk_sel */
> +		value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
> +		value |=3D MDCTRL_CLK_SEL;
> +		cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> +
> +		/* wait for mdctrl_clk_status */
> +		value =3D cdns_imx_readl(data, USB3_CORE_STATUS);
> +		ret =3D readl_poll_timeout(data->noncore + USB3_CORE_STATUS, value,
> +			(value & MDCTRL_CLK_STATUS) =3D=3D MDCTRL_CLK_STATUS,
> +			10, 100000);
> +		if (ret)
> +			dev_warn(parent, "wait mdctrl_clk_status timeout\n");
> +
> +		/* wait lpm_clk_req to be 0 */
> +		value =3D cdns_imx_readl(data, USB3_INT_REG);
> +		ret =3D readl_poll_timeout(data->noncore + USB3_INT_REG, value,
> +			(value & LPM_CLK_REQ) !=3D LPM_CLK_REQ,
> +			10, 100000);
> +		if (ret)
> +			dev_warn(parent, "wait lpm_clk_req timeout\n");
> +
> +		/* wait phy_refclk_req to be 0 */
> +		value =3D cdns_imx_readl(data, USB3_SSPHY_STATUS);
> +		ret =3D readl_poll_timeout(data->noncore + USB3_SSPHY_STATUS, value,
> +			(value & PHY_REFCLK_REQ) !=3D PHY_REFCLK_REQ,
> +			10, 100000);
> +		if (ret)
> +			dev_warn(parent, "wait phy_refclk_req timeout\n");
> +
> +		cdns3_set_wakeup(data, wakeup);
> +	} else {
> +		cdns3_set_wakeup(data, false);
> +
> +		/* SW request D0 */
> +		value =3D readl(xhci_regs + XECP_PM_PMCSR);
> +		value &=3D ~PS_MASK;
> +		value |=3D PS_D0;
> +		writel(value, xhci_regs + XECP_PM_PMCSR);
> +
> +		/* clr CFG_RXDET_P3_EN */
> +		value =3D readl(xhci_regs + XECP_AUX_CTRL_REG1);
> +		value &=3D ~CFG_RXDET_P3_EN;
> +		writel(value, xhci_regs + XECP_AUX_CTRL_REG1);
> +
> +		/* clear mdctrl_clk_sel */
> +		value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
> +		value &=3D ~MDCTRL_CLK_SEL;
> +		cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> +
> +		/* wait CLK_125_REQ to be 1 */
> +		value =3D cdns_imx_readl(data, USB3_INT_REG);
> +		ret =3D readl_poll_timeout(data->noncore + USB3_INT_REG, value,
> +			(value & CLK_125_REQ) =3D=3D CLK_125_REQ,
> +			10, 100000);
> +		if (ret)
> +			dev_warn(parent, "wait CLK_125_REQ timeout\n");
> +
> +		/* wait for mdctrl_clk_status is cleared */
> +		value =3D cdns_imx_readl(data, USB3_CORE_STATUS);
> +		ret =3D readl_poll_timeout(data->noncore + USB3_CORE_STATUS, value,
> +			(value & MDCTRL_CLK_STATUS) !=3D MDCTRL_CLK_STATUS,
> +			10, 100000);
> +		if (ret)
> +			dev_warn(parent, "wait mdctrl_clk_status cleared timeout\n");
> +
> +		/* Wait until OTG_NRDY is 0 */
> +		value =3D readl(otg_regs + OTGSTS);
> +		ret =3D readl_poll_timeout(otg_regs + OTGSTS, value,
> +			(value & OTG_NRDY) !=3D OTG_NRDY,
> +			10, 100000);
> +		if (ret)
> +			dev_warn(parent, "wait OTG ready timeout\n");
> +	}
> +
> +	return ret;
> +
> +}
> +
> +static int cdns_imx_resume(struct device *dev)
> +{
> +	struct cdns_imx *data =3D dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(data->num_clks, data->clks);

do you need to prepare and unprepare for every suspend/resume? Isn't
enable/disable enough?

> +static const struct dev_pm_ops cdns_imx_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)

could the same be used for system sleep?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9Hsw8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYhJA//SSKJauKLtLTYaJFqek25jBQAd+/X9KLk
iBbPmIKmV6w7xLy2qTdqbjfQCuwrp1cYQxRE8gXkvyhmirhj8EI1hBz1M7pfUgGm
YhXfHQyag3qE3Z0r8fgU1wIJKk9scRHIrGtATT0iSux3EAFoqgtuuPxMDiJMXdNK
xSd4zAUz9/ZA+niGpLCECA396yo3Ohyr2fkIDkW1HA5hvY7XSPcYHgnZsPR648Wq
fFn4OM6ba4kpuWZNBzZa4DzEvxJ9NpweYU59iKT/z+0+QlqtJ0ljDTlOezquPrM4
Ktq/+Re4N+rylkiU1EgiYQUIgCCG7U3dYpHBQE56h+Pl0tXFgXCVkBTqUCYNBpb/
h7FKoxGMKR+ofUk00wSoOpdh0GT0bDxcyYHpLqTaJBuH7zcg5n+xflQbVoD++kS5
1BGnuErSFrhB2I4nKRYI+85UBd7L9nAv9zAv3yINLNZ4UwcjSzcO1UNLGuQPEW6v
cLkgj9Ix+lTubz0/lB/yxM9cS2Ku4DWXP9qLftaGmWMQyVxDixZayQuwp3uTCxeD
RvT5NpFyEfYaYb9tJZdJOP8NfzGvNBURtjLbKUBGUxyw2rbowalbiCbpUn8mr4EX
Yj9HF56tr+uW5P/NX7LQieHwNS5kfbvf59NatU0ZsxstK0Mulwn5yatP9UBzzTPu
v1KwlNLSfMU=
=iJlq
-----END PGP SIGNATURE-----
--=-=-=--
