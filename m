Return-Path: <linux-usb+bounces-405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC597A7395
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 09:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEBD928178B
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 07:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD1D749C;
	Wed, 20 Sep 2023 07:02:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D131953AA
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 07:02:29 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F8590;
	Wed, 20 Sep 2023 00:02:26 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 2DBDD1C0006; Wed, 20 Sep 2023 09:02:24 +0200 (CEST)
Date: Wed, 20 Sep 2023 09:02:23 +0200
From: Pavel Machek <pavel@denx.de>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org,
	gregkh@linuxfoundation.org, pavel@denx.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: Modify the return value of cdns_set_active
 () to void when CONFIG_PM_SLEEP is disabled
Message-ID: <ZQqY/+eoVtPJ+i0N@duo.ucw.cz>
References: <20230912064946.1405848-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xjpou7buZ022lZeG"
Content-Disposition: inline
In-Reply-To: <20230912064946.1405848-1-xiaolei.wang@windriver.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_NEUTRAL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--xjpou7buZ022lZeG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The return type of cdns_set_active () is inconsistent
> depending on whether CONFIG_PM_SLEEP is enabled, so the
> return value is modified to void type.
>=20

Reviewed-by: Pavel Machek <pavel@denx.de>

> Closes: https://lore.kernel.org/all/ZP7lIKUzD68XA91j@duo.ucw.cz/
> Fixes: 2319b9c87fe2 ("usb: cdns3: Put the cdns set active part outside th=
e spin lock")

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--xjpou7buZ022lZeG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZQqY/wAKCRAw5/Bqldv6
8mp0AKC8PaWORDidjoMqy+qLkVvGsgsaigCeOahafaKK79kITBtUCtrZ72JWjCI=
=pEC7
-----END PGP SIGNATURE-----

--xjpou7buZ022lZeG--

