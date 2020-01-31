Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A45914E867
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 06:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgAaF1W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 00:27:22 -0500
Received: from mail-db8eur05on2044.outbound.protection.outlook.com ([40.107.20.44]:56545
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725263AbgAaF1W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jan 2020 00:27:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKSBpbT29guSnUYfNbPSoCBC4Fhpwd5oshmbMxykawD9CBnuWb5vB2ubBbPEgQOxPX40nW0PEaJsJJPY073SGqjQhoWuWLHw2nmBcUgjIDkrL0JOAgEcfI/eAqw16vIwVxNyGeHz9YvHMdzt263f6Pd5E80Q9a1FXeo+JrsS9t+18ZAH+m5AOKpSlPmhfv6xS8Xm0fBCUjl0RpssHq2iqOfrwvRTDR1uI0KB1zcxDlW7p1l7RRdIKGi/9kCVVbaGiy1q0J78zvhjpCQXHqVZoN2s7GAAFPZs3tWthbt5NFCuYdFjugUptMKdzfkO/s8VvWx88JpzQJvidOHS/BEYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHBHVZmBwf1qv876fP6APsnA0qSEzRxVxJYh7XQenwk=;
 b=KYmg2+CK2GFQdAhDsDMGwR6/dl3q8GvRZ1J33/sIBeK0Jw16CRxuuFqJ6Kw+ClXH61OWy7oBYupj9QfBhL16kqKNhpdjVA/mCThdUmb/k4Ae9Qg39c29K+AQmyONVqTkN/U8mUyvCPho9bAllq+kjUfR9MpPJv7MLpLLmvOiwhKD7BoR1GbOshyM4cfpa0aUnjNyukaKNYbgFxrWeA1xCXiTjOdR3IV5Q1oC4VFc4VaVUn5PkKZzRbmx5Wz4BOZf/DgBF4HD0keatF2M8Lry06kQKhCjvZAV0TDTDoEzmcYJCAg6QmsmcwHoe/RgGYoMOMlMKXx8p65UtWzjd1Z0lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHBHVZmBwf1qv876fP6APsnA0qSEzRxVxJYh7XQenwk=;
 b=EstWyzbTEIDBn69e03CNtQZs+KuchUnxySN9hFjocnvtptsw9ENBywivMLcq51fBgbvwJhWebBrfV1CZWfyMw3zU75bYsDzxARbLkMPWILX6tgpqo/ha+CfemHjkL+Gk9u++uLs7NnBh07dRGpx4rGIkRQlQD0okoqWgb6uCnMw=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5966.eurprd04.prod.outlook.com (20.178.123.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Fri, 31 Jan 2020 05:27:17 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2686.025; Fri, 31 Jan 2020
 05:27:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Peter Geis <pgwipeout@gmail.com>
CC:     Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Thread-Topic: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Thread-Index: AQHV1LqaVEQK+QBFlEajUWQRaUhLOagERL0A
Date:   Fri, 31 Jan 2020 05:27:17 +0000
Message-ID: <20200131052716.GA30672@b29397-desktop>
References: <20200127023548.27107-1-pgwipeout@gmail.com>
In-Reply-To: <20200127023548.27107-1-pgwipeout@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d9a9c80-44b0-4b85-52fc-08d7a60e3cbc
x-ms-traffictypediagnostic: VI1PR04MB5966:
x-microsoft-antispam-prvs: <VI1PR04MB59661D4AF05BF900ED3E6ED18B070@VI1PR04MB5966.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 029976C540
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(39860400002)(376002)(346002)(366004)(136003)(199004)(189003)(6916009)(6512007)(2906002)(9686003)(8676002)(478600001)(6486002)(71200400001)(53546011)(26005)(6506007)(186003)(4326008)(54906003)(76116006)(1076003)(44832011)(33656002)(8936002)(81156014)(5660300002)(33716001)(81166006)(66476007)(316002)(66446008)(66946007)(66556008)(91956017)(86362001)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5966;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D0wo1JlCLswtUgaXTe4rPolWzAgX2g3dMVHrY1E1IlyyNt82avdORl/JWMHzm3MZwl8MRHYrERwXnCHNSzqziXamvVYkvjuuqvYh+DDX8eqiKPWhwMZ3Xoy2SQ3X+6QlE+339bnbHr7u3MgJyCN4XazFXxC7XLRT+cMnH2E0w+hJ5pyvYgcyRq/sVI0Ev2mQZAj+j8JDuhUM10QbCR8IfaDaYOH7HLnqhj7Zl+GnIxu4Tdyx+aLNaLEHUoFVh0SO0rqWiLHfgv2gxtdU4sRgap/t1/QRrAmcOPVyBQiE8cxvaUVwoCHp1wLLD9PLYN+gKtI2TZVaN3Tji4wdCXqN0OredWRXyVmQZWWGbOrqMpRM/vCRfdsvPbHa79nyJYD2WadSeUAUKfmxtWcnKu6Jo/NOeO8tJnx0GZuzmW605bq+Lv1vQeSjDkLEF/rWxKKr
x-ms-exchange-antispam-messagedata: SRzPQJkYmx24OIFv1WmwsV52tfLIGdbMCPwS7/MwI213i2+cJFIfltcRqvHsnrQwrQ/8up5SFLcH4al3CGxM4Vn9U9pVPO4dmPB+WX++Lg4zwUjo3B9zq31yat+NHfUwMSQRSS56y/qe8H+ox9A/5g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6A4B4B302F48934DA0D49F700EDD2297@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9a9c80-44b0-4b85-52fc-08d7a60e3cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2020 05:27:17.4402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kFDbG99E5eEgOOWh3FhpkSFxEGCnACELGbRsyFs/7YCAwZ3Ry4EioiSvGZaYX7t9h+pdl7Ih4hnFcZVr3SlPUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5966
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-01-26 21:35:48, Peter Geis wrote:
> The ci_hdrc_tegra driver does not currently support dual role mode, but
> it does not explicitly prevent its use.
> Certain devices support dual role mode, but not automatic role switch.
> This can cause the device to lock up during initialization of the
> driver.

If the driver only supports peripheral mode, you could set dr_mode as
peripheral-only at glue layer, it would not be override by core.c.
See ci_get_platdata.

But one thing I could not understand, if the driver doesn't support
dual-role, how could you do manual role switch?

>=20
> Detect this state by checking for the extcon phandle when dual role mode
> is set to otg.
> If it doesn't exist request the driver to only enable manual role
> switching.
>=20
> Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 7455df0ede49..2f6f6ce3e8f5 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device *pde=
v)
>  	udc->data.usb_phy =3D udc->phy;
>  	udc->data.capoffset =3D DEF_CAPOFFSET;
> =20
> +	/* check the dual mode and warn about bad configurations */
> +	if (usb_get_dr_mode(&pdev->dev) =3D=3D USB_DR_MODE_OTG &&
> +	   !of_property_read_bool(pdev->dev.of_node, "extcon")) {
> +		dev_warn(&pdev->dev, "no extcon registered, otg unavailable");
> +		udc->data.flags |=3D CI_HDRC_DUAL_ROLE_NOT_OTG;
> +	}
> +

The CI_HDRC_DUAL_ROLE_NOT_OTG flag may not be suitable here, please see
comments for it.
=20
>  	udc->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
>  				      pdev->num_resources, &udc->data);
>  	if (IS_ERR(udc->dev)) {
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
