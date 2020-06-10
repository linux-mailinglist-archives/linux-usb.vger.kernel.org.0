Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E1D1F4BA2
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jun 2020 04:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgFJC7h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 22:59:37 -0400
Received: from mail-eopbgr10045.outbound.protection.outlook.com ([40.107.1.45]:30141
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725927AbgFJC7g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 22:59:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITQ9HmL/WUlmwEcN5jN2eE/M5BbjoOKuA8I+rYydrLQhwyo9vUmu7XsKjjZMgtJz0jiXxOY30/mkfVpuc6cGnaAhs2JM1VWGlcZH1NF0kDTWqECclxvcQmvrbSSP0tnxqP1tVQqLqebTn5RtbTuPxTFJXTYI8TLZqlAadoLz1b+kyU0gsaEzcLqafl8xSPGHymPERasVZcXR2Ot1nb8Ap8mpn5iww3t3wuHcS6Hu9JSga153qp03IM/EyZv7bO1IXNprXmmzkUMC9okrRgsep8DfgI7r8zdOkcf6OrUwIaRFvDdHvi24jPP9LlQ/pnKJ6dWDR6V/8YVbrs2I8wHgyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0iZ0R7tBRKHSK5pQ+npJ5CP1PnUyhV2s4MDM2cOhtw=;
 b=Y/HcK46nMjoW5apgOfgYSRku4anPQ7AAtvTgdN8ALfbiHrvv2UAU8eFt6DrxBjqIH62qUosTWg8k4EXXCuo+XQ3LRm4qbBxTA+Cd89vDOGU2Js1xa/oMA67NxkciEPGKSI0cJnMRsCYbQ7r3a5rW15PwPTlC7ICMnFVUIWm8JTPUqNumMnVvsbXq0gwDvbSI7mmPrz9YiiR9G1a3sVMh61oz0ZqV/ay3aygXzc8ySWH6zMZGF+krQHqozJzvFSaNaBj4SzJ+VJRgRHPa3BIw7+ndJRqNDqw8akAjYedNVS0oczpv59DiU+95R3kgxAF5RFiyqizxx8b06uZgCLuqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0iZ0R7tBRKHSK5pQ+npJ5CP1PnUyhV2s4MDM2cOhtw=;
 b=fEMOqmhZ4CMqbARgPI/8AraS8QYGFSZDBLIDoKSSFqZEyk2lCfs3FsUZuXzkehsXgSkoT/ng4V+5kU/te7tB0lpCpZi7WOnN+/Do9WN2wpFIQkPrdpzLSTXtTQoZyeUN15e5oljprBdh6nhnq5G8NPZA6mIdjY6OFG332OjQSdM=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 02:59:31 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 02:59:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/6] usb: dwc3: add imx8mp dwc3 glue layer driver
Thread-Topic: [PATCH 3/6] usb: dwc3: add imx8mp dwc3 glue layer driver
Thread-Index: AQHWPlBwDlZnp5FCu0C2CdxzSYo1bajRKc6A
Date:   Wed, 10 Jun 2020 02:59:31 +0000
Message-ID: <20200610025955.GB18494@b29397-desktop>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
 <1591701165-12872-4-git-send-email-jun.li@nxp.com>
In-Reply-To: <1591701165-12872-4-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f93c21f7-3464-4284-93fc-08d80cea4c38
x-ms-traffictypediagnostic: AM7PR04MB6902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB690208BF612DA4753CE672D28B830@AM7PR04MB6902.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:293;
x-forefront-prvs: 0430FA5CB7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ocf5WJUOaUtb0J9lLJQaepo81GDcXAMIUNUvZ4SR7bnf9NEsfzgu/q3p5Teq8Bko7hbPdES4i0/3mfky/sy6+MrIkCDMyn7Q+aPYlfv6JX4MjQY6b7s1ZfSce+4dgcgH9QqYv04SEUpABn2IcDW43sEbNT5vZufXfVw+L4x9kr2UvXJZ3xKyZc//+vNEHxuJY8AXaYtXUJZORfa0nseoU7k2VFzw+4OhkXWeRkZLha4/JliEZMQU/TXm5Ph9Sf3dVyc6wkz07zzLbKIVDwmzfTwuL2Yhbq5cRmdce6oFHfx5QGkFf7nOxwnUeFtZYwBwzCh85pj8GkgE3f8pv/yWBnmzX0f/okcIIWNbE0NBj2mA5A2e8LJYNX6vXokRUk9x
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(39860400002)(346002)(136003)(376002)(396003)(366004)(53546011)(66446008)(83380400001)(6506007)(8676002)(478600001)(86362001)(5660300002)(6862004)(71200400001)(186003)(33716001)(4326008)(26005)(2906002)(8936002)(91956017)(316002)(66556008)(66476007)(44832011)(33656002)(54906003)(76116006)(64756008)(6636002)(1076003)(6486002)(9686003)(66946007)(6512007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Dal9GyaALls8TBlBEtg7EuVxyz/xduoh4q2eG1XNi6+6i+LQxQC4tHMlsGmJDoakyVIzjnxN0gJKDmqJaX3QOEe1hqVA1Mm3cDK3JEBXLH8uyJVT2MrGsVPa3/EmYoK8SrFBX4R+58Ef8F3jMdp74mu5RdG9/3lL+H5XkrXsfu3RFjvCNJfcfOwGUAspY5Wx5PYmM4XcWlN42G6ZLDfDCe9Ac/5dFkWFZIzzKDD2jc2W/3X6jQ9qT0Nfu7K9xN1LfUvV2dDn9vjvOYzQ3p665QnJXq6frT3P62eGdxm/9LThHhX5HHh7vif/UHXXAZ+FHD5KCEUPXS93Cvg+sRUVdrklXWh6rto/fGLH9jx/c/hRp+HTypNnxENK880ragy+F5Yuq6lJK1U445/gcuaEj7AebF0vXFT+1Dq0Xws68xOKfkj3VyWkiT9QoHw9qduquCYitgzDW9zA+C8sVLDcDeOKE+8GbWgV8H3Ef1zH3+Dq4W0Lc3rOCrbOjjXRFBMy
Content-Type: text/plain; charset="us-ascii"
Content-ID: <04DD6A9A3F4FE24EB270BB05863C0D6B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93c21f7-3464-4284-93fc-08d80cea4c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 02:59:31.2407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2CpMX4vUmOOwN5xE44dsGoNGR5qNLd63YejJUE8F9b1h2ToXkCVingcXtXVD2USdC31xfG8NAWJil/x2yrfPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-06-09 19:12:42, Li Jun wrote:
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	err =3D pm_runtime_get_sync(dev);
> +	if (err < 0)
> +		goto disable_rpm;
> +
> +	dwc3_np =3D of_get_child_by_name(node, "dwc3");
> +	if (!dwc3_np) {
> +		dev_err(dev, "failed to find dwc3 core child\n");
> +		goto disable_rpm;
> +	}

You may call of_node_put() for dwc3_np after using.

> +
> +	err =3D of_platform_populate(node, NULL, NULL, dev);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to create dwc3 core\n");
> +		goto disable_rpm;
> +	}
> +
> +	dwc3_imx->dwc3 =3D of_find_device_by_node(dwc3_np);
> +	if (!dwc3_imx->dwc3) {
> +		dev_err(dev, "failed to get dwc3 platform device\n");
> +		err =3D -ENODEV;
> +		goto depopulate;
> +	}
> +
> +	device_set_wakeup_capable(dev, true);
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +
> +depopulate:
> +	of_platform_depopulate(dev);
> +disable_rpm:
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
> +disable_clks:
> +	clk_disable_unprepare(dwc3_imx->clks[dwc3_imx->num_clks-1].clk);
> +disable_bulk_clk:
> +	clk_bulk_disable_unprepare(dwc3_imx->num_clks, dwc3_imx->clks);
> +
> +	return err;
> +}
> +
> +static int dwc3_imx8mp_remove(struct platform_device *pdev)
> +{
> +	struct dwc3_imx8mp *dwc3_imx =3D platform_get_drvdata(pdev);
> +	struct device *dev =3D &pdev->dev;
> +
> +	pm_runtime_get_sync(dev);
> +	of_platform_depopulate(dev);
> +
> +	clk_bulk_disable_unprepare(dwc3_imx->num_clks, dwc3_imx->clks);
> +	clk_disable_unprepare(dwc3_imx->clks[dwc3_imx->num_clks-1].clk);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +static int dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx, pm_message_=
t msg)
> +{
> +	if (dwc3_imx->pm_suspended)
> +		return 0;
> +
> +	/* Wakeup enable */
> +	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc3_imx->dev))
> +		dwc3_imx8mp_wakeup_enable(dwc3_imx);
> +
> +	clk_bulk_disable_unprepare(dwc3_imx->num_clks, dwc3_imx->clks);
> +	dwc3_imx->pm_suspended =3D true;
> +
> +	return 0;
> +}
> +
> +static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t=
 msg)
> +{
> +	struct dwc3	*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
> +	int ret =3D 0;
> +
> +	if (!dwc3_imx->pm_suspended)
> +		return 0;
> +
> +	ret =3D clk_bulk_prepare_enable(dwc3_imx->num_clks, dwc3_imx->clks);
> +	if (ret)
> +		return ret;
> +
> +	/* Wakeup disable */
> +	dwc3_imx8mp_wakeup_disable(dwc3_imx);
> +	dwc3_imx->pm_suspended =3D false;
> +
> +	if (dwc3_imx->wakeup_pending) {
> +		dwc3_imx->wakeup_pending =3D false;
> +		if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE) {
> +			pm_runtime_mark_last_busy(dwc->dev);
> +			pm_runtime_put_autosuspend(dwc->dev);
> +		} else {
> +			/*
> +			 * Add wait for xhci switch from suspend
> +			 * clock to normal clock to detect connection.
> +			 */
> +			usleep_range(9000, 10000);
> +		}
> +		enable_irq(dwc3_imx->irq);
> +	}
> +
> +	return ret;
> +}
> +

You may need to add __maybe_unused for above two functions.

Peter

> +static int __maybe_unused dwc3_imx8mp_pm_suspend(struct device *dev)
> +{
> +	struct dwc3_imx8mp *dwc3_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D dwc3_imx8mp_suspend(dwc3_imx, PMSG_SUSPEND);
> +
> +	if (device_may_wakeup(dwc3_imx->dev))
> +		enable_irq_wake(dwc3_imx->irq);
> +
> +	dev_dbg(dev, "dwc3 imx8mp pm suspend.\n");
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused dwc3_imx8mp_pm_resume(struct device *dev)
> +{
> +	struct dwc3_imx8mp *dwc3_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (device_may_wakeup(dwc3_imx->dev))
> +		disable_irq_wake(dwc3_imx->irq);
> +
> +	ret =3D dwc3_imx8mp_resume(dwc3_imx, PMSG_RESUME);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	dev_dbg(dev, "dwc3 imx8mp pm resume.\n");
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused dwc3_imx8mp_runtime_suspend(struct device *dev=
)
> +{
> +	struct dwc3_imx8mp *dwc3_imx =3D dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "dwc3 imx8mp runtime suspend.\n");
> +
> +	return dwc3_imx8mp_suspend(dwc3_imx, PMSG_AUTO_SUSPEND);
> +}
> +
> +static int __maybe_unused dwc3_imx8mp_runtime_resume(struct device *dev)
> +{
> +	struct dwc3_imx8mp *dwc3_imx =3D dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "dwc3 imx8mp runtime resume.\n");
> +
> +	return dwc3_imx8mp_resume(dwc3_imx, PMSG_AUTO_RESUME);
> +}
> +
> +static const struct dev_pm_ops dwc3_imx8mp_dev_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_imx8mp_pm_suspend, dwc3_imx8mp_pm_resume)
> +	SET_RUNTIME_PM_OPS(dwc3_imx8mp_runtime_suspend,
> +			   dwc3_imx8mp_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id dwc3_imx8mp_of_match[] =3D {
> +	{ .compatible =3D "fsl,imx8mp-dwc3", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_imx8mp_of_match);
> +
> +static struct platform_driver dwc3_imx8mp_driver =3D {
> +	.probe		=3D dwc3_imx8mp_probe,
> +	.remove		=3D dwc3_imx8mp_remove,
> +	.driver		=3D {
> +		.name	=3D "imx8mp-dwc3",
> +		.pm	=3D &dwc3_imx8mp_dev_pm_ops,
> +		.of_match_table	=3D dwc3_imx8mp_of_match,
> +	},
> +};
> +
> +module_platform_driver(dwc3_imx8mp_driver);
> +
> +MODULE_ALIAS("platform:imx8mp-dwc3");
> +MODULE_AUTHOR("jun.li@nxp.com");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("DesignWare USB3 imx8mp Glue Layer");
> --=20
> 2.7.4
>=20

--=20

Thanks,
Peter Chen=
