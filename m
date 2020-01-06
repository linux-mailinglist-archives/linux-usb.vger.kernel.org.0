Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2B6130C32
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 03:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbgAFCpz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jan 2020 21:45:55 -0500
Received: from mail-eopbgr20069.outbound.protection.outlook.com ([40.107.2.69]:26974
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727307AbgAFCpy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Jan 2020 21:45:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g62caCJr8JKphIz0O4fbldp1tlnKAuZLphbwF6eAhi1b/1O1jITLembR3/rzGE99dthxLxyLG8I2LyPtIOp9L9li3jWb550Fl12Qa/d9TPsx2gM2jIZ7BWXICAFHNP4FJQ0aObSkDoWTpCfdQhRqhfgf+B3vWMRS7+8t2GoFZom5ylwxFQHHitAqCDoKqQnzw/MQyWtg5nulsKSdrSe8qyGgN2CslJfV4+2EvFNU2/zEgflE9M+ws7XbCzLPg3ilvAz60GAxwGKrJnkYnplFnTskCU1N/nOmY9HkB43OP5Cws6ga9gsCZ2ULHsZnFO6eYPEuhPwpERg9Wzcg/0IgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZlT6tCNLztBBJX2O5su770HtQQxN64rjG7TOighBBA=;
 b=d2R4CV68Or47lE9DkHcu3jdt5QLCbLrAfAJNGbVyOTLciU6L3JutZEFKKSqkZTIjhnRBD2N0A2MtmpncC/A/KIB/bziIbJY7fF/+TEzJOPR/pxsZppl5KTEwccoLmKamlRJpGtkDWxlJtT7XsWUk+yej72fG6HuzJs7i6e9uobxdtKpgLE9hry/lPEbuJZ8A772D4jzZJ6lOk+yoWLCiZbm8eeK2iI4ABB3GjuRw96VTfCZMSUQ/xWFUXSesrRcZgakTyaSYQjN0ue96exCHntEZk/tJb851XfDog6qI/2BCGuSkbZvT/Dq2El24z4A2kveWqd5MutiRPkiPVRteFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZlT6tCNLztBBJX2O5su770HtQQxN64rjG7TOighBBA=;
 b=MNeOu7Yo12LWqpOT9zb1NlnP87QUKiskBVLRnIHTpEMFvdCCirFtn1FRKIyQIKmUB2gF0fXhZy8a3tXo/KyMcDDGqrSGGjwUFa7NkQaH4oMKpClD/jf1jmCKT12uXt8t0BzM+rYw13251ZhbEBfaULPTlVUMBImf16qS6jrDhFo=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4304.eurprd04.prod.outlook.com (52.133.12.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Mon, 6 Jan 2020 02:45:48 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 02:45:48 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Roger Quadros <rogerq@ti.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Topic: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Index: AQHVvHs151j0fHhAcE+5mb4ylkF2s6fY/L0AgAQBFoA=
Date:   Mon, 6 Jan 2020 02:45:47 +0000
Message-ID: <20200106024545.GA27043@b29397-desktop>
References: <1577426348-31227-1-git-send-email-peter.chen@nxp.com>
 <5a5195b9-8a58-05e2-b3f8-0d713cded01b@ti.com>
In-Reply-To: <5a5195b9-8a58-05e2-b3f8-0d713cded01b@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 93a6f3e3-dd55-4152-af43-08d79252890c
x-ms-traffictypediagnostic: VI1PR04MB4304:|VI1PR04MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB43045FECFCA053A823A7EDCE8B3C0@VI1PR04MB4304.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(189003)(199004)(33656002)(66476007)(66946007)(66556008)(186003)(66446008)(4326008)(26005)(53546011)(6506007)(76116006)(5660300002)(64756008)(91956017)(44832011)(71200400001)(33716001)(6486002)(2906002)(1076003)(86362001)(81156014)(81166006)(478600001)(9686003)(316002)(54906003)(8936002)(6916009)(6512007)(8676002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4304;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8OiOB1f1uyHxPkxHKT7tafKqlMBTYgXiVtly/oz7odbTfZKCl6Q2PdTlpYJyRQQkCsTSOAoJ8QEwoGcjAxSZQ/sfZi7bTUKj2Yt7pcLxr1wXKUcY48Ed7VCS2Lhw4nvDAacxsncpNzK1HEf4vTHIbiX6i1FxGXel5fyvhx9rGocVPIP0QRdUwJrpLiEzteyqekKnIbjGnk3pcPujKH+meIXLrsm93GgG7U3mSjfmWxh4KIAV/ULCB9GqtBL+EmyBgsXBB4dnTRpHAGADJMNqA+CO7lwAF7MePi0avBGAiy1WPMl4a3ihje+MJx+119MgLcGs7tvTt6snBxia+gTm7gGekeVxAtsPDUa+WnbOUqrgBQbl1MuOypqgZurXtfZ/vz9m2glUIVD2BSRJfC+H7V8HZsY7MtmO5IQ/PbLX71XFXYgrdZzHL3phxi3jc9zX5xTwDJvZqLP4CNSmwU+yMRHzOWbE7mFKzraE7HPeUY4sB6D3rrsXJiLwS1tewNrj
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46A2F2892717F54691350C843F096FD7@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a6f3e3-dd55-4152-af43-08d79252890c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 02:45:47.9078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /6YY903+HmTjc94aAIX8fvhkvzB/6UqwAIWk1p6MviICc5NhVZfhUOKkjyTno0OifVrWbqCXqA7cV5oaByAdjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4304
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-01-03 15:36:50, Roger Quadros wrote:
> > +/* Register bits definition */
> > +
> > +/* USB3_CORE_CTRL1 */
> > +#define SW_RESET_MASK	(0x3f << 26)
> > +#define PWR_SW_RESET	(1 << 31)
>=20
> You could use BIT() macro here.

Ok.

>=20
> > +#define APB_SW_RESET	(1 << 30)
> > +#define AXI_SW_RESET	(1 << 29)
> > +#define RW_SW_RESET	(1 << 28)
> > +#define PHY_SW_RESET	(1 << 27)
> > +#define PHYAHB_SW_RESET	(1 << 26)
> > +#define ALL_SW_RESET	(PWR_SW_RESET | APB_SW_RESET | AXI_SW_RESET | \
> > +		RW_SW_RESET | PHY_SW_RESET | PHYAHB_SW_RESET)
> > +#define OC_DISABLE	(1 << 9)
> > +#define MDCTRL_CLK_SEL	(1 << 7)
> > +#define MODE_STRAP_MASK	(0x7)
> > +#define DEV_MODE	(1 << 2)
> > +#define HOST_MODE	(1 << 1)
> > +#define OTG_MODE	(1 << 0)
> > +
> > +/* USB3_INT_REG */
> > +#define CLK_125_REQ	(1 << 29)
> > +#define LPM_CLK_REQ	(1 << 28)
> > +#define DEVU3_WAEKUP_EN	(1 << 14)
> > +#define OTG_WAKEUP_EN	(1 << 12)
> > +#define DEV_INT_EN (3 << 8) /* DEV INT b9:8 */
> > +#define HOST_INT1_EN (1 << 0) /* HOST INT b7:0 */
> > +
> > +/* USB3_CORE_STATUS */
> > +#define MDCTRL_CLK_STATUS	(1 << 15)
> > +#define DEV_POWER_ON_READY	(1 << 13)
> > +#define HOST_POWER_ON_READY	(1 << 12)
> > +
> > +/* USB3_SSPHY_STATUS */
> > +#define CLK_VALID_MASK		(0x3f << 26)
> > +#define CLK_VALID_COMPARE_BITS	(0xf << 28)
> > +#define PHY_REFCLK_REQ		(1 << 0)
> > +
> > +struct cdns_imx {
> > +	struct device *dev;
> > +	void __iomem *noncore;
> > +	struct clk_bulk_data *clks;
> > +	int num_clks;
> > +};
> > +
> > +static inline u32 cdns_imx_readl(struct cdns_imx *data, u32 offset)
> > +{
> > +	return readl(data->noncore + offset);
> > +}
> > +
> > +static inline void cdns_imx_writel(struct cdns_imx *data, u32 offset, =
u32 value)
> > +{
> > +	writel(value, data->noncore + offset);
> > +}
> > +
> > +static const struct clk_bulk_data imx_cdns3_core_clks[] =3D {
> > +	{ .id =3D "usb3_lpm_clk" },
> > +	{ .id =3D "usb3_bus_clk" },
> > +	{ .id =3D "usb3_aclk" },
> > +	{ .id =3D "usb3_ipg_clk" },
> > +	{ .id =3D "usb3_core_pclk" },
> > +};
> > +
> > +static int cdns_imx_noncore_init(struct cdns_imx *data)
> > +{
> > +	u32 value;
> > +	int ret;
> > +	struct device *dev =3D data->dev;
> > +
> > +	cdns_imx_writel(data, USB3_SSPHY_STATUS, CLK_VALID_MASK);
> > +	udelay(1);
> > +	ret =3D readl_poll_timeout(data->noncore + USB3_SSPHY_STATUS, value,
> > +		(value & CLK_VALID_COMPARE_BITS) =3D=3D CLK_VALID_COMPARE_BITS,
> > +		10, 100000);
> > +	if (ret) {
> > +		dev_err(dev, "wait clkvld timeout\n");
> > +		return ret;
> > +	}
> > +
> > +	value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
> > +	value |=3D ALL_SW_RESET;
> > +	cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> > +	udelay(1);
> > +
> > +	value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
> > +	value =3D (value & ~MODE_STRAP_MASK) | OTG_MODE | OC_DISABLE;
> > +	cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> > +
> > +	value =3D cdns_imx_readl(data, USB3_INT_REG);
> > +	value |=3D HOST_INT1_EN | DEV_INT_EN;
> > +	cdns_imx_writel(data, USB3_INT_REG, value);
> > +
> > +	value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
> > +	value &=3D ~ALL_SW_RESET;
> > +	cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> > +	return ret;
> > +}
> > +
> > +static int cdns_imx_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *node =3D dev->of_node;
> > +	struct cdns_imx *data;
> > +	int ret;
> > +
> > +	if (!node)
> > +		return -ENODEV;
> > +
> > +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, data);
> > +	data->dev =3D dev;
> > +	data->noncore =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(data->noncore)) {
> > +		dev_err(dev, "can't map IOMEM resource\n");
> > +		return PTR_ERR(data->noncore);
> > +	}
> > +
> > +	data->num_clks =3D ARRAY_SIZE(imx_cdns3_core_clks);
> > +	data->clks =3D (struct clk_bulk_data *)imx_cdns3_core_clks;
> > +	ret =3D devm_clk_bulk_get(dev, data->num_clks, data->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D clk_bulk_prepare_enable(data->num_clks, data->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D cdns_imx_noncore_init(data);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D of_platform_populate(node, NULL, NULL, dev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to create children: %d\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	return ret;
> > +
> > +err:
> > +	clk_bulk_disable_unprepare(data->num_clks, data->clks);
> > +	return ret;
> > +}
> > +
> > +static int cdns_imx_remove_core(struct device *dev, void *data)
> > +{
> > +	struct platform_device *pdev =3D to_platform_device(dev);
> > +
> > +	platform_device_unregister(pdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int cdns_imx_remove(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +
> > +	device_for_each_child(dev, NULL, cdns_imx_remove_core);
> > +	pm_runtime_put_sync(dev);
>=20
> You didn't do a pm_runtime_get_sync() in probe().
> doesn't this complain on module remove?
>=20
> > +	pm_runtime_disable(dev);
> > +
>=20
> What about disabling the bulk clocks that were enabled in probe?

I will remove all runtime pm operations since it is not supported
well for current submitted version, and add clock disable operation
at .remove.

Thanks for reviewing, Roger.

Peter
>=20
> > +	platform_set_drvdata(pdev, NULL);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id cdns_imx_of_match[] =3D {
> > +	{ .compatible =3D "fsl,imx8qm-usb3", },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, cdns_imx_of_match);
> > +
> > +static struct platform_driver cdns_imx_driver =3D {
> > +	.probe		=3D cdns_imx_probe,
> > +	.remove		=3D cdns_imx_remove,
> > +	.driver		=3D {
> > +		.name	=3D "cdns3-imx",
> > +		.of_match_table	=3D cdns_imx_of_match,
> > +	},
> > +};
> > +module_platform_driver(cdns_imx_driver);
> > +
> > +MODULE_ALIAS("platform:cdns3-imx");
> > +MODULE_AUTHOR("Peter Chen <peter.chen@nxp.com>");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("Cadence USB3 i.MX Glue Layer");
> >=20
>=20
> --=20
> cheers,
> -roger
>=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--=20

Thanks,
Peter Chen=
