Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112D02C3844
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 05:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgKYEsj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 23:48:39 -0500
Received: from mail-am6eur05on2056.outbound.protection.outlook.com ([40.107.22.56]:61344
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725817AbgKYEsj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 23:48:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4aTxveFpW/ValFMhlaThQUBlQh6bE5jmsKYQdZorIChDnsmHqqx/LH5w3bsCOif2H3NhcwFwPjczKw5d+yjGPwrsLD/NzpQ7v5+gTZKSeeBxIiJIRnLDPcHnBDmo+QpVq+C4qI2iVd0URPr3ILZhpXruuuKS+xyNPyHTv+CzGONm0l7qo796WgG3jLStGdpcbUoK3GgeswlNpsANdpBFbNyGgkDvL1qLHfWDJV5NE1pa17hYiEOi53qu5yaXUtUttXYoZUK9jKSVINluAdBnyGLF+y90a5loz3mCldYb1cAa84PSdQ2s0YJrlG/+7ndfWW3Tlu39cZhUSwieW7CZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vDKM0N9sqT18+F168w7uH5AZm2DfWZcSyhO4vBmeR4=;
 b=XNdQ6yOeX+6TfOt1xcbi0ra3SMPaRqolO6zmUpmf5CI+CPQ+9oXXmvZKN878Ha02a/2xFD93tl75olMiCiDTOKwm+WVnW05G9OYuIy1m3f3MpRha1dLrSc5qad1l1BYLQ/gLpuKwDmYoxthyLKTeY4dxNxmLS8YC/hAIxDwyn7wXRYOJiDYJuhAYk/eR3hf4W7/3ruuqNI0Of4saOAjinxvZV8/qr6yUx6mVKgK+XUNQ5jQ4KzCMOVfz7qLB0WqCSkvfAXLmmdtCC5Sq+6LZjEhlYF9WZb6Sj0X307NjvRw1g5UBoyIz2GLnHSr2MU/6ZBZu4qfB7wAW9O6O0OnwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vDKM0N9sqT18+F168w7uH5AZm2DfWZcSyhO4vBmeR4=;
 b=QCSetHl3jGUukKZ0ZqZgIcF40slGy9zwCavcAKTNAoVtGEtvPlFx0+K+Jjggc5JLec9K3Zl7H9YwsrYz11HE1z+9k4M5edmaIdWBErM8QdJWKrvXiF+JUPCB2Vzsf7sz0OjnLFkHo67yRpNAGVxD6JgOwfzlYXlyUMrB8MWRqIE=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR0401MB2533.eurprd04.prod.outlook.com (2603:10a6:4:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 25 Nov
 2020 04:48:34 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 04:48:34 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 1/3] usb: phy: phy-mxs-usb: Use of_device_get_match_data()
Thread-Topic: [PATCH 1/3] usb: phy: phy-mxs-usb: Use
 of_device_get_match_data()
Thread-Index: AQHWwoBjdKkP4Uur+ECB1vaKYiRwUanYR1Cg
Date:   Wed, 25 Nov 2020 04:48:34 +0000
Message-ID: <DBBPR04MB79791491EB1F4EA6CB560BC48BFA0@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <20201124163912.12074-1-festevam@gmail.com>
In-Reply-To: <20201124163912.12074-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ae43221-d028-4cb3-92e9-08d890fd5dae
x-ms-traffictypediagnostic: DB6PR0401MB2533:
x-microsoft-antispam-prvs: <DB6PR0401MB253354477D7900F38DCB9BF58BFA0@DB6PR0401MB2533.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:136;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SPGaU1vjUrPg0TfeW+U5GKDHVJLB8hNpsRa+jL+3GJJENTmhO2SnfS+fRFBDKl7hvcCiXQcSP6FK6NLA5R3NYjEDIWQRgnkDpx2eSM5SBTcuosQwZjeXZZ6SCgvxjEblJ/m95WefmpLf2MfMqU62B8VDyjKzolyQqMig9jJ3e2cShd5HYaIAiytW1DdsvGvDoangG1KAIpK56z6No2vQ7dlvsrdGEVxJp+aQkeiMfpGj1PCuVQs0PyzvOnzKxlVeuvLHr3Qlh6B+JCqHz/t7oTb6f+FPY+CfiiEMhr39wq+5deJqaxD2Huu5Ya9H4+of8j45WdweiNZK/MGua9AOww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(5660300002)(8676002)(26005)(33656002)(86362001)(66946007)(64756008)(6506007)(52536014)(76116006)(7696005)(66476007)(8936002)(9686003)(2906002)(44832011)(478600001)(186003)(66446008)(55016002)(83380400001)(66556008)(6916009)(316002)(4326008)(54906003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: gk9qb3lv3q7lgp27kSSSwoVDtpuipLpS0HYU1dPxbjSukJiT7AmjeyPL3XQvYmhIdq9kF7bhjjqDyGFfJ+rcHQDlXgG79NXN4vofIVJTx4f0I92+IF+5PX8QXcoU9xoaBbCCKI9lzOPNdjykCX23rdbszJ/5DZgKc+83dRbOYSWP1L8mgrwncfFddxJr8f0+/XkDp2enaLQ5NTbOm/KQGT7Faphrxp9YBbZuGDy0KsffV4Vu522hdqDucF6KWVaQwuoD++BQJAqWnYZzm8E3kI34gIkgvVoeosmxDl+5yuzR847DXMcJpgxgotwh1quk+7J/Vl0IIJQa2cWH03IrGmowUXYSh9d99cBW3qDyGqtEmZ7775x7CKJfrRhS2MuBsSkdyII41aX8ah4I4C9hOE9Cno6ErvYrAz6Yt0thqCRMUPgK8cNquBnrVkBjskL5w9hzSVgmgLwQRLSvP9n6RruLWaNZzOwQ6RRs66PwqEzqUfX33fXFHgeTRJ4+2Lkxpe3KiC6T4oXekbfCtcIUct2+mV/t197NrFUnYQDxdq6DMdlBJRiB2zwUnudZcAzPEp+UCPz/h/tcPQVoLHSS6RlL+fjeJ9aVUu0ctr4ZpKvoJPE8o+Sbk24NVs/6H5tjIwySegKx2leJusOBMIrPqlbBGX5CxLbwUmc/8mRPJtFlqEIimccJmSBgixcOIuXHnAF0Yaqv2C+s9Y0nkQ3stu4rqfftTNHmL4ZNytUC4q8umlEIE/F5gKCGoAjVJGEBnLJ2NpwUvOvCgR8CWwhCw7heQytpzCdPuB4e7w4G2PCQCmWtafjGs5SzNJ1Kds9/JH+0gSg1cp08+VZWEo3ROMB05maxaYfpdAwkBlsGtd2S4E+pycT5J8kvB8+jCVIM46w2pek8+UBMoHIJvYWWrg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae43221-d028-4cb3-92e9-08d890fd5dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 04:48:34.4697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TeMVHn/MkKBq1opiIUrXiUZ76z1H52Ts2RygqGfD30KSJgVJKjvx18MawVrviia9j9kE1sDWXNYMCHs5/eAypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2533
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Peter Chen <peter.chen@nxp.com>

Peter
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.=
c
> index 67b39dc62b37..8a262c5a0408 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -714,14 +714,9 @@ static int mxs_phy_probe(struct platform_device
> *pdev)
>  	struct clk *clk;
>  	struct mxs_phy *mxs_phy;
>  	int ret;
> -	const struct of_device_id *of_id;
>  	struct device_node *np =3D pdev->dev.of_node;
>  	u32 val;
>=20
> -	of_id =3D of_match_device(mxs_phy_dt_ids, &pdev->dev);
> -	if (!of_id)
> -		return -ENODEV;
> -
>  	base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> @@ -797,7 +792,7 @@ static int mxs_phy_probe(struct platform_device
> *pdev)
>  	mxs_phy->phy.charger_detect	=3D mxs_phy_charger_detect;
>=20
>  	mxs_phy->clk =3D clk;
> -	mxs_phy->data =3D of_id->data;
> +	mxs_phy->data =3D of_device_get_match_data(&pdev->dev);
>=20
>  	platform_set_drvdata(pdev, mxs_phy);
>=20
> --
> 2.17.1

