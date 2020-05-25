Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5581E04FD
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 04:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388471AbgEYC70 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 22:59:26 -0400
Received: from mail-eopbgr150047.outbound.protection.outlook.com ([40.107.15.47]:27622
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388422AbgEYC7Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 May 2020 22:59:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irA5QZEvXJLcCqMnA1tao/MwdJBF5WzT7QOoScARsnHZjTpi0tBK+8S2n+jPerShEIae41+YuKkCGbRexy8ZkEBLbVGI7ev9RnqUXdqy37bW0/rMjOgiioO5RPZbytKDUWVTXHh9aTAT+I07C87bsoDnc5belmFxq36ZakvHaFaQisX7Ov8zAtYcpHLlwoD7BvWmIK6D7eUuayrk5Vk5JwjFwUgDeyVFQkij5EMxxMVV1ZoK4wypMKt9VzGwtYnGi21PhQUbYpdM5h0Id9T0OZVICwEK/zL26q9Zur14QBlezG+p1wjLa+4enA+ZdR/lvYp8rnIvq32SsXOo+h5znA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ZGYbrQQ3/DFi8L6z4FDaE0zX7RzrSfl8GSCuIpFHk=;
 b=P/PlF8tsSB41x4Pzz/QSpSaBbV48thESRVE8FFIpk/RU0Eipib2bELyvs1a7OgYYmb33RXTYARr3h1x5dc4UgJCSxAOjaEzGZ674w0qqVu5iFC3exVumL+bkrH0BNtYN7hOpbwcA16ziMzDvweYznrRFZC7iUHcOXCgX9sZJJY5KzQMjeYOs0x1fL3dGXPelRbWBJ67dcA5kcJwpQK5AcMiBrsli9BaEP4iXt459ntapFxl211wNBr93Dyi0azscOSxfIxoGAK7XyGf6UBH7+5kRXiCFUs8n/mSiwSWNdNQvorqUn2WeCpBnqPx7IFYBXzzElmcW8UcvY9TrNXTeUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ZGYbrQQ3/DFi8L6z4FDaE0zX7RzrSfl8GSCuIpFHk=;
 b=k2NdNgA1Nj4dmiFqpQmaimEPOvBlVjCIAw8w4SnGPhw8ay/djbHpkrsnt9wJAiFX+FC0UWMq68E1BdG1uLBTWHBAFzY5DsNsgHpiP4SH/m0HwOQiEyppluKDXturUgdAst2AyRwd2Okgg/SQNbxHSEtjVXl5Jcr0QpOV7IcuWLA=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7128.eurprd04.prod.outlook.com (2603:10a6:20b:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Mon, 25 May
 2020 02:59:21 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 02:59:21 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/9] usb: cdns3: imx: add glue layer runtime pm
 implementation
Thread-Topic: [PATCH v2 3/9] usb: cdns3: imx: add glue layer runtime pm
 implementation
Thread-Index: AQHWMVkZPJsugzXIl0C8lG44yOlDs6i2zcwAgAFQmQA=
Date:   Mon, 25 May 2020 02:59:21 +0000
Message-ID: <20200525025946.GB16948@b29397-desktop>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-4-peter.chen@nxp.com>
 <VE1PR04MB6528DBBB500AC2796B97881D89B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528DBBB500AC2796B97881D89B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1ceded77-f570-401d-a0c1-08d800579fe8
x-ms-traffictypediagnostic: AM7PR04MB7128:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7128E8AE74373BE55F810D828BB30@AM7PR04MB7128.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C6f4oLITwIperorptVu2RavZTrOAZmMoZXdznzhqagEgqNixbUZj4mKYOpdrhx+b+XsbYClQAZvXgRkhNf1ClGu8T5wS8aid3qauDxcmXUGhMm8bfCV0MaL48GpkjgaiXjHso4thC60VkgvoYrsxLfBKNL6Z5TgMoNvMPmTjBfk+oGIzzlMHsj8/auMUSgI52qkAGjDlkq5DH/M0hCuyPlCrCaCUahtPRNOHQb23axdr2ck5qkpUr3XndQnEbs6T+1N6qOUABNVEvx9vXZz0nh6Ko8HS5UmWuSq0t2T4Gcquj9LBEYyeAXVQLn4VaeduWQjt+OxB13EBWgod3KTeRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(136003)(376002)(366004)(346002)(39860400002)(396003)(6862004)(26005)(4326008)(316002)(6506007)(53546011)(6512007)(9686003)(186003)(8936002)(86362001)(66446008)(64756008)(66476007)(66556008)(76116006)(66946007)(8676002)(1076003)(5660300002)(44832011)(54906003)(71200400001)(6486002)(6636002)(33656002)(2906002)(91956017)(33716001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 5DmSuw2ekCxrVJLc0HDHmVD9E9v8n8HJ+hKCaJy87L41F60Q0JSWb/R8fk8ZLXzEIINR+B0uzXP7fXp1UlzSXh8lr5IVsTuH89cjxDpJ8zCiBWN0S0gT4vg6dLdtQ5r9Am2pzVswWfy0kqAMma3mTw0QbRlhH2/dT8iVsMr5Rv3d9Akc70ED247kCgor56k023aHu7kNodNznpw+idc32xN2Nxee9qh17EsgYmpVBMZSnc98CtFfMigVaXteZCiQGFuPucLinqNAJl2qfOI+hMASRTBw3hMndvhwzXMH+05kCZFROPVm02VI2LnR+WxhteIq3fsEwwqYB46Ija4o7RKTyc/vke/L5rfkZIdguDIwgeBApMvWzKTBze1z2ehhEXoMM+hTSIztoN0R52EIAuDv4pDoCSzoZehX6QcibvcFoebnZZJuNRRE1TVGstR0pimp3FH0b4q64BGMCK2Xhc8sjijg/NC97/MrN1xHqhE=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3844A7C8B1602E4798802A2A02834FE0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ceded77-f570-401d-a0c1-08d800579fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:59:21.6648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0beK+Sg8A2hcgxkp2gvL4ENCYLo+B3OAC7fL/+9XPQTXgwDslJ3OkFk97A/KGHio9r8Mc9JmHQr+Nyu5+ed1lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7128
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-24 06:55:02, Jun Li wrote:
> >=20
> >  #define USB3_CORE_CTRL1    0x00
> >  #define USB3_CORE_CTRL2    0x04
> > @@ -66,11 +68,30 @@
> >  #define CLK_VALID_COMPARE_BITS	(0xf << 28)
>=20
> GENMASK(31, 28)
>=20
> >  #define PHY_REFCLK_REQ		(1 << 0)
>=20
> BIT(0), also for others

Will change for all.

>=20
> >=20
> > +/* OTG registers definition */
> > +#define OTGSTS		0x4
> > +/* OTGSTS */
> > +#define OTG_NRDY	(1 << 11)
> > +
> > +/* xHCI registers definition  */
> > +#define XECP_PM_PMCSR		0x8018
> > +#define XECP_AUX_CTRL_REG1	0x8120
> > +
> > +/* Register bits definition */
> > +/* XECP_AUX_CTRL_REG1 */
> > +#define CFG_RXDET_P3_EN		(1 << 15)
> > +
> > +/* XECP_PM_PMCSR */
> > +#define PS_MASK			(3 << 0)
> > +#define PS_D0			0
> > +#define PS_D1			(1 << 0)
> > +
> > +		/* wait for mdctrl_clk_status is cleared */
> > +		value =3D cdns_imx_readl(data, USB3_CORE_STATUS);
> > +		ret =3D readl_poll_timeout_atomic(data->noncore + USB3_CORE_STATUS, =
value,
> > +			(value & MDCTRL_CLK_STATUS) !=3D MDCTRL_CLK_STATUS,
> > +			10, 100000);
> > +		if (ret)
> > +			dev_warn(parent, "wait mdctrl_clk_status cleared timeout\n");
> > +
> > +		/* Wait until OTG_NRDY is 0 */
> > +		value =3D readl(otg_regs + OTGSTS);
> > +		ret =3D readl_poll_timeout_atomic(otg_regs + OTGSTS, value,
> > +			(value & OTG_NRDY) !=3D OTG_NRDY,
> > +			10, 100000);
> > +		if (ret)
> > +			dev_warn(parent, "wait OTG ready timeout\n");
>=20
> Make sense to move forward if any of above timeout happens?

I will return -ETIMEOUT for all timeout case, thanks.

Peter
>=20
> Li Jun
>=20
> > +	}
> > +
> > +	return ret;
> > +
> > +}
> > +
> > +static int cdns_imx_resume(struct device *dev) {
> > +	struct cdns_imx *data =3D dev_get_drvdata(dev);
> > +
> > +	return clk_bulk_prepare_enable(data->num_clks, data->clks); }
> > +
> > +static int cdns_imx_suspend(struct device *dev) {
> > +	struct cdns_imx *data =3D dev_get_drvdata(dev);
> > +
> > +	clk_bulk_disable_unprepare(data->num_clks, data->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +#endif /* CONFIG_PM */
> > +
> > +static const struct dev_pm_ops cdns_imx_pm_ops =3D {
> > +	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL) };
> > +
> >  static const struct of_device_id cdns_imx_of_match[] =3D {
> >  	{ .compatible =3D "fsl,imx8qm-usb3", },
> >  	{},
> > @@ -206,6 +380,7 @@ static struct platform_driver cdns_imx_driver =3D {
> >  	.driver		=3D {
> >  		.name	=3D "cdns3-imx",
> >  		.of_match_table	=3D cdns_imx_of_match,
> > +		.pm	=3D &cdns_imx_pm_ops,
> >  	},
> >  };
> >  module_platform_driver(cdns_imx_driver);
> > --
> > 2.17.1
>=20

--=20

Thanks,
Peter Chen=
