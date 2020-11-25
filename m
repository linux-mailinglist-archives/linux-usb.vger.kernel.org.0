Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23A12C3621
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 02:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgKYBPU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 20:15:20 -0500
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:43582
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725320AbgKYBPT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 20:15:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsp7SXEPSm3NaLOdpVUFx58KR6SCYe3aU8Sn4OYzU6qlzp1mX+6gcvjkZc8XVJyO8mdAzvkQsnfgSVefDKYYWEXEXqCLUdVp4TwypjHhVMBgYvIkrJDgJDkADU6klvWGZwJByR7ERU0+FpRwZuakFxqO9BT7YBP411Pyrg/07rMXauHJgbCqfCTK521/muaQV9+BBY6jRPmGeVHSNN8a0NHho8P4U3tO6u4I20teKq7zIRrBAjpYHgEHA59T6dV8nenESeYEfxXRkvI16fM/gK2ez0PZhfRb+HJn13g08gwDfFaqmEzi+qMVqymhc5AJbk9DJs0fAGKbzvozLVw68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ddXK8b05ohXXZ22/egugf1BXX1wL8/bjYcZRXEAbDU=;
 b=BD9q7A0VXilIkbVf2CFBSLZhZ9emGFiAnTkkMxA8LNvGsCxjijzjLfWbtLJ3kkq41bjitUeDGXbD0KQzY5HdE2sPdKIO3AeMWFJfIPGT80k6F0H+UqKiypoNrCZ7lofY7MlZeb55OwdxowhHS+mAc2Xfbwlitc1gxlAJv3TAQnhkbGf5mYF0vA78ipv3s/LCyIYP2rN1KFJYoHw4IL/SEYjfgGU5hr4MzcllczL4s7Fh33DXxrI815u7QyAuHMwK2CHGYsCRfwOI+hdmhYOjBDau2RlB1ga25MX3rrBS8ybWSWS/YLiqSf2bkje7eezhGczfnKLtl1ZcC9DowMitbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ddXK8b05ohXXZ22/egugf1BXX1wL8/bjYcZRXEAbDU=;
 b=aghlWuW8Z3yOABMNIwSqiHctPsMs86iuQisOPSQyzl2c9NIUqekBFfl8S18kP+cbFT/XLD8V8cZZX1qvEqQQ7XgOveThQIb1gXRKW3uyMShkvry5dEABi8uufPbLLTMw8JxO5+fg/zEvTtqnY+pzbKf7EH76oddqVHVAqCaSmLE=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 25 Nov
 2020 01:15:16 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 01:15:16 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/3] usb: phy: phy-mxs-usb: Use of_device_get_match_data()
Thread-Topic: [PATCH 1/3] usb: phy: phy-mxs-usb: Use
 of_device_get_match_data()
Thread-Index: AQHWwoBjdKkP4Uur+ECB1vaKYiRwUanYC7mA
Date:   Wed, 25 Nov 2020 01:15:16 +0000
Message-ID: <20201125011447.GD9929@b29397-desktop>
References: <20201124163912.12074-1-festevam@gmail.com>
In-Reply-To: <20201124163912.12074-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 10737af3-2c9a-48d7-c700-08d890df918e
x-ms-traffictypediagnostic: DB8PR04MB7179:
x-microsoft-antispam-prvs: <DB8PR04MB7179D601E3C651AACDFA169E8BFA0@DB8PR04MB7179.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LiLv9p6EQk50EZ5m/eoRMxmH9xwB2n/y8JKCBhcR2ovPQQ7WKbxj6XfIX4buw8bsW9VAFx+QL4KpH5lRuhsoOY+3cLNME0onS6B/QADVlc6Fu9bUzoyNsR6x3WWhhwVgeMZJx3xj6qxquEwRfXXuCecgGLq6wbyDJcKd1PsSOP/R8tkTuyEwse9bQKcF5oD9/tiVY0I+ClL75q2GDMuzJSdzv9OGGimJC4nXoLJw0m73G+dCI6QgVjcXI4571053eu7PCON8Jgp5JOudEE1eA5ov/ssf28ebRt3OPrfa4rAebS9+8F/Ez0QmSKChLy5m/pklphEQ9qzT6Ax4L12zjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(71200400001)(1076003)(316002)(6512007)(5660300002)(4326008)(9686003)(54906003)(86362001)(8936002)(2906002)(83380400001)(8676002)(186003)(26005)(53546011)(33716001)(91956017)(6486002)(6506007)(66476007)(66556008)(66446008)(66946007)(76116006)(64756008)(33656002)(478600001)(6916009)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: aWOeMDBgwsI/CbAE6M2JCY6BZOdm/W4G8vIU7/mchtujj09qSSY0hMNsHHXjrkKgfaFLg6/2J6gI8dSYsRyrrTZ91EeLXUomM30BkJ+LaW7PUajjpTbaYj+Kwp/U/SZUR7o3Adg0bzSPAd5UtkA0c3m6hzhSqIsZ5pPvZDSdscbKHng01W6GNkY75EdEB4vGLmDYHmsR6D06PqFwehVbJqCuUSS+2TJnru3PTaCzRAz1vV6VCZDJ8cTvaLqWKWKx3h+BBvIdGErOcPNRAAjzE8iW+bkP3JHeqNk21dG5+XkRA9s5bhMIuhLNo6jACJCPREUL5s3PsWJDvy9dP5Q7XZVLmzJ5xoInbM6+nJUcj9FQbb5GhYGNqyokDu/7LpNjPZg+IiP022NpkiEn8c9ZRLLWwLcDj3ifTKVfgCsiuYrBP+tJmYdBAUnX96JulV1rcfCJknMK+Xg3HVMphv8VBCVJENSPI7rGfm+nwoJZNj+kwrlNV1pckPAHP42OqYP0Xu9Du/BCiOrv9Wx+1BV2FT7N7nXadMw9V8GzAIF/miaB+ynIYQSM4zloYDdplbdgFPlZWl1vW8qSfvFD3dYE3MQ7O4emhzqJ0we+7z1phR+95ehqNOVjcJMTJxptUqABd8SvgrGaUGDDIHApee5hvRiYiemA8qiwWDkNWWDszt+BkOg0JjU/jmEqldRcHhKV+GDvqWcxcok/9XC4HClVXB8F8stSdJsZB/zy4Bj9NpMInC0rDTZeJ+n96cavQZLzOLROpGFRKHwU69IeWmGN2+BfhPB9EAAp4N4/xAL4nSCBKbw68kqgPrIK63vKRI2MjBxbleVYibEXk7AVxNl5713inxoC2+7ZO1Zw6tmSKKmWjYQcyb629vaIO/jQNEoUui6XtpNk6aVcPafcyy3Qcg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D5E111FF8907847B6A37AAA25B59D3E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10737af3-2c9a-48d7-c700-08d890df918e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 01:15:16.5661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FDGSw1tFY3HTX3wufsS7hDCHZdCY1GsIG4djKERGUcUPm8ZuuRLkEr8O3akqkQ8ddn3gT0AwfPt1aABu7e3Vng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-24 13:39:10, Fabio Estevam wrote:
> The retrieval of driver data via of_device_get_match_data() can make
> the code simpler.
>=20
> Use of_device_get_match_data() to simplify the code.=20
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.=
c
> index 67b39dc62b37..8a262c5a0408 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -714,14 +714,9 @@ static int mxs_phy_probe(struct platform_device *pde=
v)
>  	struct clk *clk;
>  	struct mxs_phy *mxs_phy;
>  	int ret;
> -	const struct of_device_id *of_id;
>  	struct device_node *np =3D pdev->dev.of_node;
>  	u32 val;
> =20
> -	of_id =3D of_match_device(mxs_phy_dt_ids, &pdev->dev);
> -	if (!of_id)
> -		return -ENODEV;
> -
>  	base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> @@ -797,7 +792,7 @@ static int mxs_phy_probe(struct platform_device *pdev=
)
>  	mxs_phy->phy.charger_detect	=3D mxs_phy_charger_detect;
> =20
>  	mxs_phy->clk =3D clk;
> -	mxs_phy->data =3D of_id->data;
> +	mxs_phy->data =3D of_device_get_match_data(&pdev->dev);

You may forget the error handling for it, eg, -ENODEV.

Peter
> =20
>  	platform_set_drvdata(pdev, mxs_phy);
> =20
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
