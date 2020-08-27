Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7372545C3
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 15:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgH0NQx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 09:16:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:51190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727047AbgH0NQK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 09:16:10 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D63B82177B;
        Thu, 27 Aug 2020 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598534170;
        bh=btNz1HD4NrJk5fL/juIMyC+zAwWcBamqjXeiNXU1zyI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KbcdNx+heMIo3uBUtR1pk1H6nNsjhEsKLD+jo/sos6OdKEyN480PsQkBCVH/ewFTu
         rLjwAB6zXzFYmBMo3Wr1BYq9q6oFD5hIVQtQxpAc+T+jHM16lMNIMf9sSYsJKjx8wn
         piQfwWTj5Y7mJ7BDtREDBLF4lfdRzbP2lmBj1WgI=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v7 2/3] usb: cdns3: add runtime PM support
In-Reply-To: <20200825021120.4926-3-peter.chen@nxp.com>
References: <20200825021120.4926-1-peter.chen@nxp.com>
 <20200825021120.4926-3-peter.chen@nxp.com>
Date:   Thu, 27 Aug 2020 16:16:03 +0300
Message-ID: <87h7soi60c.fsf@kernel.org>
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
> Introduce runtime PM and wakeup interrupt handler for cdns3,
> the runtime PM is default off since other cdns3 may not
> implement glue layer support for runtime PM.
>
> One typical wakeup event use case is xHCI runtime suspend will clear
> USBCMD.RS bit, after that the xHCI will not trigger any interrupts,
> so its parent (cdns core device) needs to resume xHCI device when
> any (wakeup) events occurs at host port.
>
> When the controller is in low power mode, the lpm flag will be set.
> The interrupt triggered later than lpm flag is set considers as
> wakeup interrupt and handled at cdns_wakeup_irq. Once the wakeup
> occurs, it first disables interrupt to avoid later interrupt
> occurrence since the controller is in low power mode at that
> time, and access registers may be invalid at that time. At wakeup
> handler, it will call pm_request_resume to wakeup xHCI device, and
> at runtime resume handler, it will enable interrupt again.
>
> The API platform_suspend is introduced for glue layer to implement
> platform specific PM sequence.

can't you rely on parent->child relationship here?

> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index e56dbb6a898c..faee5ec5fc20 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -392,6 +392,29 @@ static void set_phy_power_off(struct cdns3 *cdns)
>  	phy_power_off(cdns->usb2_phy);
>  }
>=20=20
> +/**
> + * cdns3_wakeup_irq - interrupt handler for wakeup events
> + * @irq: irq number for cdns3 core device
> + * @data: structure of cdns3
> + *
> + * Returns IRQ_HANDLED or IRQ_NONE
> + */
> +static irqreturn_t cdns3_wakeup_irq(int irq, void *data)
> +{
> +	struct cdns3 *cdns =3D data;
> +
> +	if (cdns->in_lpm) {
> +		disable_irq_nosync(irq);

why do you need to call disable_irq_nosync()? interrupts are already
disabled.

> +		cdns->wakeup_pending =3D true;
> +		if ((cdns->role =3D=3D USB_ROLE_HOST) && cdns->host_dev)
> +			pm_request_resume(&cdns->host_dev->dev);

nothing for peripheral mode?

> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
>  /**
>   * cdns3_probe - probe for cdns3 core device
>   * @pdev: Pointer to cdns3 core platform device
> @@ -418,6 +441,7 @@ static int cdns3_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>=20=20
>  	cdns->dev =3D dev;
> +	cdns->pdata =3D dev_get_platdata(dev);
>=20=20
>  	platform_set_drvdata(pdev, cdns);
>=20=20
> @@ -466,6 +490,15 @@ static int cdns3_probe(struct platform_device *pdev)
>=20=20
>  	cdns->otg_res =3D *res;
>=20=20
> +	cdns->wakeup_irq =3D platform_get_irq_byname_optional(pdev, "wakeup");
> +	if (cdns->wakeup_irq =3D=3D -EPROBE_DEFER)
> +		return cdns->wakeup_irq;
> +
> +	if (cdns->wakeup_irq < 0) {

should be <=3D 0, no?

> @@ -502,6 +535,19 @@ static int cdns3_probe(struct platform_device *pdev)
>  		goto err3;
>  	}
>=20=20
> +	if (cdns->wakeup_irq) {
> +		ret =3D devm_request_threaded_irq(cdns->dev, cdns->wakeup_irq,
> +						cdns3_wakeup_irq,
> +						NULL,

if the thread handler is NULL, why don't you use devm_request_irq()?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9HshMRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQauFRAAxrkbnFqeDO1v9X000xa0tZvaXNjfWUEn
D2tVGOJ84sqlHuy8cnluOXLEK/esBS3zYigSI0n1x7I+Q2q/jykL6tcU/V4ksxDm
yq5RAaiU8OZ0ktTwFqVILFcenLyRKFcnBzlRy7ycKUatJHHLoBF4h0886qDlvdl5
qFBPEfsPiZAPjkYeCLXr2hc/dlLsDphIQRGcwWV6Qmdm39sINv23aU+FSyYmvBaZ
Rg2gAAxAzfQ1l+MOmazEiSoq/129hLcg/xyYe4J95eIpN5BUjttM3boL5kViDg2k
mvD8lFBAbK7HgErNszh92aDUMc19zS+CEde/NOMYuOKLaK/6PIvxXg5DzNTSmR/a
js8ACfYaerkgBlsXd9MJ8WIdRz778d6JlDFxB7LKBih5Ls4taTjQH0Fl4DfPNB8M
FEEdXCX+QBR2j0sKyhfAl/q+9gUb2VxPlmjjIZbKK/2tVqGgTYy6+/dtZlaBS8Ck
LTzCxCqJYu2Aad5TSmDaOdZOt1gPQTsp0Z7oihqp2QvGB4Kih8q24rD+qXYqN0wY
0VeDCqwTJcblXy/V5xfpkiYN6nE/dyYykwHdaAFHwSkZb50AEJg4zJLmDqLrAo+3
SPIB0AECT/tYpU75z4sY8FGjkNvoQ9jmF74bKga1KRW8fq4m1S1vVPXCrCLiImkF
xKJXKx4pVHo=
=3pP5
-----END PGP SIGNATURE-----
--=-=-=--
