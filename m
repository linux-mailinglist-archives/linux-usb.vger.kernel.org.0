Return-Path: <linux-usb+bounces-362-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D537A5AB7
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 09:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DB831C20D01
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 07:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D5E79C7;
	Tue, 19 Sep 2023 07:19:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7A1FA9
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 07:19:00 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D20FFC;
	Tue, 19 Sep 2023 00:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
 t=1695107928; x=1695712728; i=j.neuschaefer@gmx.net;
 bh=cIwrf8PK+ocRFzcS25K23eodAtcQ1T8KqPnqzM86UEU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=FepJUQ2MwOMMckterzF8Wt3TXEgGRkydNOK/N81X2tQ9zLt3hBzWhVMF+x7p1k2N8oOHuDairb7
 WDSTFxYN5R1TfsQxV18lffTTW3cg+KMF1Gs8UdxKoDeIgO8Nwcu4WS5IMiLtX+3KUpBjhdKIC7LJN
 Dn/pqjpiVjdjVGJMINsTcmXPIC+oVUUmpdSXccIenFY9pGHDvztfG0z4Wb/NLlEFDLzKHTQMhpn8T
 iwb2OnMglMlUu82Eo2pEW0CXtG0Nz64R/eGD+KoUJU82PwlOwvqtPB71LwdDbs0rYjkg2tlGGURwf
 dkUJtvLeVxwuMUDSv4tbZo/ZGaqtT9BXFm0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.47.152]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY68T-1rBtpN0HoT-00YNST; Tue, 19
 Sep 2023 09:18:48 +0200
Date: Tue, 19 Sep 2023 09:17:49 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: chipidea: add CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS
 flag
Message-ID: <ZQlLHZhhOArxv86Y@probook>
References: <20230918161028.264650-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ASlWA0wcfuE6F4R"
Content-Disposition: inline
In-Reply-To: <20230918161028.264650-1-tmaimon77@gmail.com>
X-Provags-ID: V03:K1:CvtbL7DUzgKgkI4fOdWC/VsX8RNW3wGo7wfLveTxy7DaewyVMQQ
 QYC/prk3TgHv8LSKGoTBQ9FDfFy3CcyZAl8MdcHLi/PPw3zBAbjEk4ppC2r2QOcKf3yZ9NH
 7toLmtIk/9Rg1igQKGT2e7DeKE4NDkCdJjHVUSPzbycO19uY6KIfV7Hgehl1IOaiM9NlGDt
 eFRWjUvbXOGGsoDAlEdsQ==
UI-OutboundReport: notjunk:1;M01:P0:jjPDC3gWukI=;9fjL/uf06xoF1BziWt1P06ALEMX
 rH7jkgJPHdSv2qnqgXqUyhF5tZikgCNuN5rpTX9AHjDsXEO4OXVlPeBNzAOMxet0hXcy3mRq0
 di7Ew5uSP/g635RrB/PyWunRyuR8H33jzyRkEfA+bvPVHF6XH2CKweiv/LnoY+b09zfZ22cQP
 a5oddapPhKjKwhvO/Mh0RNxv9WBCyEBKpnMu9Cw9ErsZJw6203ZfKzOWZy3+wKj4wRUrrWVbm
 JgjWiY5JmdGryqhQdb49dl8MheOW1gveiaf5aESqUtD4qaOijaWs4+pL1neFOFRM/is0hhqHj
 kWJrrZCrUGRFTrRtCaI4IJZ/H5VAyjk7n1Uuk6p09NKUwDcEqAa6CqoqfjW7QmLp1q/nxdDif
 xcQ5ZMz/UgYtAD8R9N8a8bx6alfWnU90GwDHdU/tb91drmV1dzl0xN930nM8xCh4Z2TKt+JUb
 VnXYiCrXkgqTPfg1xWGzUFoZM8GOfFqO3KPJwa2SORYeLkUrcd3w7EnStHar1tEbmM/W8SqWu
 2S2Q+qyy09cIDTelJ6B32s/ZO0CohxbmzX9og3Ehtz9MmA6BY1wYF6d+UZEX5LP1q7fEkRc2G
 Nrds2LOuan3xlcDdaE561ekqAsyqsfBkD4jU5g8J8kLfg+nO1ANkmDBMV4wdUpamUckJ95Zv5
 fIW23D+o0GAHjYlwm+CvNXsbwM6hGlHQPV1vdE2K5iO+q0jbbqVyreTpK5menrUoweU2KOgae
 3EEOIfWyGdmbLzIHBusoB268y4y/GgRxm33AKrF0Bp9BfdgZGwuqAov91j9OeRRrIcJAtZ9eN
 xJ9dKXnRz8WTkJplOVC74KfXHOV9feVHrePvIFVyyg8kxysmm0g419UZeVrazvrEtQ3OMbDmH
 2sg6/EFxuc/EoUStEv5uFXpJh7JMNP9EeM9+cwGLcsVZg1Plc6IlYThYWoy4moEOM042p8+Ms
 Tp8sFuRXrKsLa+QZq2XYnb3JkuU=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--7ASlWA0wcfuE6F4R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 07:10:28PM +0300, Tomer Maimon wrote:
> Adding CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag to modify the vbus_active
> parameter to active in case the ChipIdea USB IP role is device-only and
> there is no otgsc register.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

I think it would make sense to include this patch as part of the
patchset that uses the functionality to enable NPCM support, so that
reviewers would immediately see the context in which it is used.

Jonathan

> ---
>  drivers/usb/chipidea/otg.c   | 5 ++++-
>  include/linux/usb/chipidea.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index f5490f2a5b6b..647e98f4e351 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -130,8 +130,11 @@ enum ci_role ci_otg_role(struct ci_hdrc *ci)
> =20
>  void ci_handle_vbus_change(struct ci_hdrc *ci)
>  {
> -	if (!ci->is_otg)
> +	if (!ci->is_otg) {
> +		if (ci->platdata->flags & CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS)
> +			usb_gadget_vbus_connect(&ci->gadget);
>  		return;
> +	}
> =20
>  	if (hw_read_otgsc(ci, OTGSC_BSV) && !ci->vbus_active)
>  		usb_gadget_vbus_connect(&ci->gadget);
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index 0b4f2d5faa08..5a7f96684ea2 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -64,6 +64,7 @@ struct ci_hdrc_platform_data {
>  #define CI_HDRC_PMQOS			BIT(15)
>  #define CI_HDRC_PHY_VBUS_CONTROL	BIT(16)
>  #define CI_HDRC_HAS_PORTSC_PEC_MISSED	BIT(17)
> +#define CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS	BIT(18)
>  	enum usb_dr_mode	dr_mode;
>  #define CI_HDRC_CONTROLLER_RESET_EVENT		0
>  #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
> --=20
> 2.33.0
>=20

--7ASlWA0wcfuE6F4R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmUJSw4ACgkQCDBEmo7z
X9uWGQ/+LoYXIX9PIaYqKaNoz/rCtUw5oNTD0PPK3Ffaj3zmncRCSIfZ6Wc9hG9P
XkP4kCT5Giq8d2Xh54e78wUf3qfA8NKU9Aq9CfNMRzlVrOEwYlYl2x+Ixv6o17aw
DWENVhk/AK69kSVqXGnsC2o9P5P6Q1iT/7i8XlyTgAPnOMkyGJIZQKlRLrA5xtjl
XxEm43xGUQBKuz5WWA4g9aiHBCFwj9x2r0c0B7NZHARGAd3NC0kVBZ2HXbLZkaSU
FXgyvvBjEZUdiTtR3H5AERf/xfOC86qzdERQrZ5GqBW+NcfO2bNRkiysKnZJ/W88
ptTGE5iUH5yI/nySrjOYEC2SWbJkHom1Wc8flb9k6ByX5Px25DxTjLoJroAgY0aM
A8qzj4crXU1XriQZHu+BS0FyZrhLWP+Zp5AEumVX0iRRB/6RR1MyJQd9irPoVIkA
awbaniEQkQktym5Q4GtWUycpYZpRIpvyGIqKmmYFfo6nhMAE5bwAGAidHVg9Xd8s
Znu6dmEZVX+jKA0ZS2m/EyQQF6+hi2j2oJQ0l6Ygpj4xS88YwaxgL3yGa1hSSDw0
ejRKC1Ir0LBsowMH31xJ717/9VRiG/t0TYoLPdbIz1l7ImIl5uW5zR/oP3V4MK8P
XVSI5UBuWfIdfvoNfJWbrVkN7wq7RYWjdV1mCcwOauR5vsKBlsY=
=VBfR
-----END PGP SIGNATURE-----

--7ASlWA0wcfuE6F4R--

