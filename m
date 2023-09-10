Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F794799D82
	for <lists+linux-usb@lfdr.de>; Sun, 10 Sep 2023 11:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346567AbjIJJdI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Sep 2023 05:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239000AbjIJJdH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Sep 2023 05:33:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34553CC9;
        Sun, 10 Sep 2023 02:33:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65615C433C8;
        Sun, 10 Sep 2023 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694338382;
        bh=INyp7erg05PaQReunCCwZQ7+EknRDWYSfGflzB8IEPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D5bnHk1QcwkozSHdj5dHsmGIP2L+cu3ibtSsJ6Y4qwA1cMVf/Z5AIMxzf6WjDTM86
         fyuIEHmmJd0zogRbNHdukT0Gpo+rbu/Y7R+6nwSow7cycvGx+uYtBBcbzASP/Ld/AT
         zRIS6zOE7GUED8btKXq+f306haDrioxzBZIweFFyeVse+EKL3AjJTrvS1diO6rcG4J
         92FSXG3z/JdRSrWwy6sUzQRMupin44EYtyYHWFYnTAi8w70big0v67htTyLhuoXGNO
         FxnPUr+KcHeC8EqqjRgDuG7zsHI7pPrdo+RtGxTlPmRduK6EecG781geEQbExUJlQU
         ulNrIrQMGpyjA==
Date:   Sun, 10 Sep 2023 10:32:58 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     shawnguo@kernel.org, andersson@kernel.org,
        linux-usb@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-imx@nxp.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 CBDTU02043
Message-ID: <20230910-unzip-rentable-c0325938234a@spud>
References: <20230909202957.1120153-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DnlgxkEUNw0e2egD"
Content-Disposition: inline
In-Reply-To: <20230909202957.1120153-1-festevam@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--DnlgxkEUNw0e2egD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 09, 2023 at 05:29:55PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> Add a compatible entry for the NXP CBDTU02043 GPIO-based mux hardware
> used for connecting, disconnecting and switching orientation of
> the SBU lines in USB Type-C applications.
>=20
> CBTU02043 datasheet: https://www.nxp.com/docs/en/data-sheet/CBTU02043.pdf
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Do=
cumentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> index f196beb826d8..b61dcf8b4aad 100644
> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - nxp,cbdtu02043
>            - onnn,fsusb43l10x
>            - pericom,pi3usb102
>        - const: gpio-sbu-mux

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--DnlgxkEUNw0e2egD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP2NSgAKCRB4tDGHoIJi
0pPhAQCX/QPV2aemvxTI8BkDDKEFHSYXSFPegcLcN6pXJfr2TgEA8JsWaqTkfS0W
xCluem/0CdBjhLLir4/d7Ve7XfqOQQ0=
=FT1j
-----END PGP SIGNATURE-----

--DnlgxkEUNw0e2egD--
