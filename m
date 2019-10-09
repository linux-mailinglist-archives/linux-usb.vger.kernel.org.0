Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6793D096D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 10:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbfJIISG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 04:18:06 -0400
Received: from mail-eopbgr60058.outbound.protection.outlook.com ([40.107.6.58]:50586
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725848AbfJIISG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 04:18:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+wgOBTYRDkrBvkhtJzCfE2o3p65Cw9x6ZA5TfYpeHgFDCNMjYtn4wcSO9b+6PukJzB+vJIizRXWnwMO93NYVvz/2cp7sbOPhNyXUI3xoqECbU0fqsy1XYJ8chzmi+CzZ+Xe5gEnwEU/meKsZZ7oeCeymducKQYkTTBQQlhVhQg2zq7lH2FAPtU2C9ekwDVxvkgB3At2c0uUdN3XPZnpPRA8PmD1brEdzid0UWvsVU77i6LVz8+/duVGgIQ98rPvJeqMQMYj+UXk4XPHXUQ5TC8BAneSgSZntZn3CfWQXWt/oLaTuptREDdGPHsG7aGFxzgLeynvMzb/66D50RFgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKTQtPaWg+HEKar2sxCRlpGVOw1P0rlPVi2Ota5UdtA=;
 b=DlP5qHgYhDs2gCt1S89AmNPyyVb6/YxYrzJ5Ob5vouP4dIQrC6+X9nl9XSsVDv9EjS4bFb9U6qCX6Yrdtsw1xYNyetYZ5Dgvq0YSbPI9FBCQvqeXkWsPsT4ae23ymyoR7vBlOG/qGEHhru7c/xr+c434rQ+/VXpWL0kDxpygbjfTw+uuXdu8v+Vt/ywnVlZ1LbxgbLREL/iUUusWSmHK2Z5q7c8bCH9hZSO7OdGID1JySzqSsh+P7FUD3A+BN7AVm+LCbveXrD0aYRd7LHqc8XDZFgLxcrq2qcUCyYoYuiP/OcZBPqH65ua1Pw6RGbut510Bg/Z0EMIfiKVZNirfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKTQtPaWg+HEKar2sxCRlpGVOw1P0rlPVi2Ota5UdtA=;
 b=XlW+hIoGeExiWUvQsXk6s0lZxNxZb8ygWIv5xeVkNrh6xVf2hHUHQLw0IIXn8BeJ47vg7LSQk401dQMZeUY8q9nnVVrmwnL+G3mdrWdXPjwfKLEJUexnx5806U8A6Br/PEV48D0/b2fzDMBGl3XemQYTx/S4+Gnb2UCPtSJ6lOc=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB7150.eurprd04.prod.outlook.com (10.186.158.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 08:18:03 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0%3]) with mapi id 15.20.2327.026; Wed, 9 Oct 2019
 08:18:03 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Peter Geis <pgwipeout@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: tegra: clean up tegra_udc flag code
Thread-Topic: [PATCH] usb: chipidea: tegra: clean up tegra_udc flag code
Thread-Index: AQHVeSQP1D/XE99MVUu5nA9N6vW0xadSAdoA
Date:   Wed, 9 Oct 2019 08:18:03 +0000
Message-ID: <20191009081802.GB4774@b29397-desktop>
References: <20191002131933.6206-1-pgwipeout@gmail.com>
In-Reply-To: <20191002131933.6206-1-pgwipeout@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61a64fa0-e90d-48b2-9288-08d74c9134c4
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB7150:
x-microsoft-antispam-prvs: <VI1PR04MB71506E06214BDF53A543C56F8B950@VI1PR04MB7150.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(4326008)(6246003)(478600001)(256004)(99286004)(14454004)(33656002)(71200400001)(71190400001)(66066001)(8936002)(33716001)(6506007)(5660300002)(6436002)(25786009)(6916009)(53546011)(8676002)(316002)(229853002)(81166006)(76176011)(81156014)(7736002)(44832011)(86362001)(1411001)(446003)(76116006)(54906003)(2906002)(11346002)(66476007)(26005)(64756008)(66446008)(66556008)(102836004)(6486002)(305945005)(1076003)(186003)(3846002)(91956017)(6116002)(6512007)(66946007)(476003)(9686003)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7150;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jve9yqexgLcndfKiPQOJWMbiylXICFgYj8Tx8HlWblx7GuLIHp+OZSQzhwpUgCRqRDioZDXFwGKYyKJm6bH4OqZO3cVRRgKYPHawBX6gBSb73RlYfxlA5stZDSIQBUgXe5uOK4g8QwWa2LkSxDEOooJXFlTYjLqIlevJPgyRaG6Wm3O4Lldg3r3vE22I+/2Odgbx3/bm+TxdvEUCNRX6Z3aFaOnwcTMxmWqIZGWsnsqQGaUd6JWjGKtkA3uCv3tlvP4DQlVFqUZ7EnxxFBoI3ve6WXfG41AG7/N7c4Xcfp0rTQ4hbcVlPR7RFLkkWvuIwxzMfXG6/u93O9pIjKVjOll4Fp1EDGrVuHph0be8grgWYhDHSQhDu3979fzKVsYX/gHTSHuoXwzmDVeQAP1sUfPIHaNaqKHx7UDmsFwnhrY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FAB6DE4B62721F458D8AE9F7162913F6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a64fa0-e90d-48b2-9288-08d74c9134c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 08:18:03.3992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QaCwpFF8WkgzEqy34DRhT2ISh1Hlnpa8Dab9f9Av6qcemBI1MvqFURmGktPKTebfOYqGeP58PUg7ffOnaf2V/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-10-02 09:19:33, Peter Geis wrote:
> All Tegra devices handled by tegra-udc use the same flags.
> Consolidate all the entries under one roof.
>=20
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>=20
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 12025358bb3c..0c9911d44ee5 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -24,35 +24,23 @@ struct tegra_udc_soc_info {
>  	unsigned long flags;
>  };
> =20
> -static const struct tegra_udc_soc_info tegra20_udc_soc_info =3D {
> -	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
> -};
> -
> -static const struct tegra_udc_soc_info tegra30_udc_soc_info =3D {
> -	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
> -};
> -
> -static const struct tegra_udc_soc_info tegra114_udc_soc_info =3D {
> -	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
> -};
> -
> -static const struct tegra_udc_soc_info tegra124_udc_soc_info =3D {
> +static const struct tegra_udc_soc_info tegra_udc_soc_info =3D {
>  	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
>  };
> =20
>  static const struct of_device_id tegra_udc_of_match[] =3D {
>  	{
>  		.compatible =3D "nvidia,tegra20-udc",
> -		.data =3D &tegra20_udc_soc_info,
> +		.data =3D &tegra_udc_soc_info,
>  	}, {
>  		.compatible =3D "nvidia,tegra30-udc",
> -		.data =3D &tegra30_udc_soc_info,
> +		.data =3D &tegra_udc_soc_info,
>  	}, {
>  		.compatible =3D "nvidia,tegra114-udc",
> -		.data =3D &tegra114_udc_soc_info,
> +		.data =3D &tegra_udc_soc_info,
>  	}, {
>  		.compatible =3D "nvidia,tegra124-udc",
> -		.data =3D &tegra124_udc_soc_info,
> +		.data =3D &tegra_udc_soc_info,
>  	}, {
>  		/* sentinel */
>  	}
> --=20
> 2.17.1
>=20

Applied, thanks.

--=20

Thanks,
Peter Chen=
