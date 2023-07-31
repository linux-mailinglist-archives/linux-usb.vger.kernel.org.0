Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9224769AFD
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 17:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbjGaPnE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 11:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjGaPnD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 11:43:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67601E0;
        Mon, 31 Jul 2023 08:43:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 042A0611A5;
        Mon, 31 Jul 2023 15:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBFDC433C7;
        Mon, 31 Jul 2023 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690818181;
        bh=/W2XVVZ70Suilz4XvS7nOUajHcrXgB3wWG6Dueczvec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G7a4tQ+VUMK3V3PwL5NEu/9uYkedTQ3kVuTjAYB3miHf3Y7eZ5vTngYi+6MQ7LVLX
         qGPG9FmZoWF3PVEN35T3Gn4D+q+D6p49dqaByDVjBaxFlAiuouikbN/SAmhflwJFuO
         tCbVVda20TQUHk0nsN9vOnIyKWqrrerK7ghpTzSn3YgsgZnKD/5WekLN8zwNNLClxc
         HiAbuVMCIa0ceP9b3j9L4qDHTvfpGvOCoiL10KyOUzVICTm7ESKMw+pTYdEUwCOv/X
         RX9qWAuJguSrFfE0rb3WTG/Zkpp7au75bKBX9fyB6Khbh0wg9poiBgumU1UEe8yKnx
         0TsODjJipaI0w==
Date:   Mon, 31 Jul 2023 16:42:57 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] dt-bindings: usb: ci-hdrc-usb2: Fix
 clocks/clock-names maxItems
Message-ID: <20230731-snide-unrented-45886c0317c7@spud>
References: <20230731144422.1532498-1-festevam@gmail.com>
 <20230731144422.1532498-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zYizTsKi2BEF7P6Z"
Content-Disposition: inline
In-Reply-To: <20230731144422.1532498-2-festevam@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--zYizTsKi2BEF7P6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 11:44:22AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam  <festevam@denx.de>
>=20
> imx35.dtsi has three USB clocks. Adjust the maxItems to fix the following
> schema warnings:
>=20
> imx35-eukrea-mbimxsd35-baseboard.dtb: usb@53ff4400: clock-names: ['ipg', =
'ahb', 'per'] is too long

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--zYizTsKi2BEF7P6Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMfWgQAKCRB4tDGHoIJi
0vLdAQDgMhOyofofEdKvAkLRXrSxJqb8QUtFomnfYQ2ja/DZXQEA2vtKKUOmTqIs
6ZCBGACUuAQlmXC6rdA2d2u0/RJpRQ0=
=MpVH
-----END PGP SIGNATURE-----

--zYizTsKi2BEF7P6Z--
