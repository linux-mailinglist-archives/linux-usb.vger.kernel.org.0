Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A6A769AF9
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 17:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbjGaPlz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 11:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbjGaPlv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 11:41:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF86171F;
        Mon, 31 Jul 2023 08:41:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29086611AE;
        Mon, 31 Jul 2023 15:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAC8C433C7;
        Mon, 31 Jul 2023 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690818101;
        bh=KllNGR98sEvszNQC342kBuVdbg8sIsVEWejV4tUcOWE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YkZDnVC0HjBlI8SKPlQg8EBjTdvS5mkBMMxB+Dp5g3ucIPSVQYEAVtZ8Ye54D4ngP
         JMDvKrUYIofB/PB2bUiXpHOu21N4ylwXFvVXbRac0vb6Iqr8M8JuedwUHMsOwJSXD9
         KYK0fHeKHQkNJFrAv1UI66SAkjw7vAieiVkP9v/OADZ99uhjIlMzfuCRMcMaOjsMVM
         5mkRLl+fqoNoQ+NzxGScJfo1+IC+8Hcov/fupaiYaegkfxagp81AwUVslV/SFA/R0o
         kmxVfG8CBGvo1iBUMFUKEVu0sLKfzAO7ILO/xoPUEjXmaIXHtdJElNOwdPgF4nAhpE
         rjCzzVufo/zTA==
Date:   Mon, 31 Jul 2023 16:41:37 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: usb: ci-hdrc-usb2: Add the
 "fsl,imx35-usb" entry
Message-ID: <20230731-surprise-unsheathe-620320d2ddc8@spud>
References: <20230731144422.1532498-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ivn/wKB8J6Yf2ywj"
Content-Disposition: inline
In-Reply-To: <20230731144422.1532498-1-festevam@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ivn/wKB8J6Yf2ywj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 11:44:21AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> The "fsl,imx35-usb" entry is missing in the supported compatible
> string list.
>=20
> Add it to the list.
>=20
> Signed-off-by: Fabio Estevam  <festevam@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Do=
cumentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 532d6464c8b3..85016dd2e187 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -34,6 +34,7 @@ properties:
>                - fsl,imx23-usb
>                - fsl,imx25-usb
>                - fsl,imx28-usb
> +              - fsl,imx35-usb
>                - fsl,imx50-usb
>                - fsl,imx51-usb
>                - fsl,imx53-usb
> --=20
> 2.34.1
>=20

--ivn/wKB8J6Yf2ywj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMfWMQAKCRB4tDGHoIJi
0jb3AQDaV5B2oNZHn2etKfj1JeSZgltiu/njBDkR7kEWvA+FCAEA8XAHE0N98arQ
R/XvE3VKCxJYhuZw4M9YiwQTSAa/3QI=
=7GD7
-----END PGP SIGNATURE-----

--ivn/wKB8J6Yf2ywj--
