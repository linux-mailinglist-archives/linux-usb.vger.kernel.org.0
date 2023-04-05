Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6EDB6D7F93
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 16:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238325AbjDEOde (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 10:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237895AbjDEOdc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 10:33:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F73F10E5
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 07:33:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 15429623CF
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 14:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86BCC433D2;
        Wed,  5 Apr 2023 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680705210;
        bh=c5aBY2DBhngN9K4Itw2DMcABZ4sGhUw7y0a1rjyGhCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g6nDCnoku17X5dklyNSz6xW16bkWkXmnbfpKD980MpDJ/g817cgLUNSgJZc+iANs0
         aK71hhEQCZwy5aus9xDA5W6Ytu5l7EA7knJTJxu+AfPFc3BCzyGljUyHYAk4vTMHHs
         eHZ16BNdGH9evLEYRQPhrAjA2eL9iAdGrxdoVolTnm7WMMyYFJ99ZJjPRAe78+HDGq
         yHYxqFLMcgnVqX8qZKMZ8HyiTChdbBfiUj9mlPyLXQLgafNzCFPBx9FMSwou8UCdjd
         TKnKqovUD0DWbgDIcMXlTJ2+3fMQeNI6mx5Ql0wH9UFnSzdA6whADbATKkJG3XKK1P
         5JM+QvUlbjOFg==
Date:   Wed, 5 Apr 2023 15:33:26 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 04/10] usb: musb: mpfs: Convert to platform remove
 callback returning void
Message-ID: <20230405-brought-sibling-3b0b62f953cd@spud>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
 <20230405141009.3400693-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wHA+4AMy4x1v1p8u"
Content-Disposition: inline
In-Reply-To: <20230405141009.3400693-5-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--wHA+4AMy4x1v1p8u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 04:10:03PM +0200, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  drivers/usb/musb/mpfs.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
> index cea2e8108867..24b98716f7fc 100644
> --- a/drivers/usb/musb/mpfs.c
> +++ b/drivers/usb/musb/mpfs.c
> @@ -235,15 +235,13 @@ static int mpfs_probe(struct platform_device *pdev)
>  	return ret;
>  }
> =20
> -static int mpfs_remove(struct platform_device *pdev)
> +static void mpfs_remove(struct platform_device *pdev)
>  {
>  	struct mpfs_glue *glue =3D platform_get_drvdata(pdev);
> =20
>  	clk_disable_unprepare(glue->clk);
>  	platform_device_unregister(glue->musb);
>  	usb_phy_generic_unregister(pdev);
> -
> -	return 0;
>  }
> =20
>  #ifdef CONFIG_OF
> @@ -256,7 +254,7 @@ MODULE_DEVICE_TABLE(of, mpfs_id_table);
> =20
>  static struct platform_driver mpfs_musb_driver =3D {
>  	.probe =3D mpfs_probe,
> -	.remove =3D mpfs_remove,
> +	.remove_new =3D mpfs_remove,
>  	.driver =3D {
>  		.name =3D "mpfs-musb",
>  		.of_match_table =3D of_match_ptr(mpfs_id_table)
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--wHA+4AMy4x1v1p8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC2GtgAKCRB4tDGHoIJi
0qXoAP42sUj8oS+7QkVJ0H2M2QO5Qv1Ap8ibkzIMfqjUD+r4vQD/fs5ADkb3MBuJ
hN5XmCJz0ovaCWKbBWeUiAc0qPV+rwY=
=yTWQ
-----END PGP SIGNATURE-----

--wHA+4AMy4x1v1p8u--
