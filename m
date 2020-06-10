Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7F81F4DE6
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jun 2020 08:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgFJGK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Jun 2020 02:10:27 -0400
Received: from mail-eopbgr10041.outbound.protection.outlook.com ([40.107.1.41]:47268
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725988AbgFJGKZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Jun 2020 02:10:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkF60e5jq4q8efmWKFei+62beLi0UhphbGrFKrjla7/ydpwDcgbsPT4UBP6IBPJ2mjAh/Bv+pbjSZZWKq5V0pe1MNeeMLxAaY22AHAygOqGHTDrLSZC4d4mTXJ9cKDqVb5n3dnfWd6DCQ7fR6dvWugd/AqNMn7Lf68oHEjn+Yz10CCucOeDrfEWI3qSOyF84YLQ7i9uaSY65o1hobXwl4I6IsSjKdzs+P5Sr8DKhCCveJPU0R6hG9E0ku2acnp/6rCYZCaqD2teJoiMN2DI6mi/H4MYHX6RPZ6PlsOz4HYJiJpfPCVwLV2HMC0W9s6wE2d0Id1/l7BiHEweSnOoBsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSB/tw7eSTDREw4hEIqp7vzhX1jKxwtOwV48ecKtd74=;
 b=npm1m/jJThi+VK4UIjwWOdu+AcgVYjtoyTwrMvs/MG/GaIbsUXWBueQs/v0nIkZpt7IpEJRFp/HayOfpw1cPDFF8nWcuw3v6fy6MX+Bqd0bJP9JGmyATN3y0/P2QziLr6fDEp/z363KP55unqRQVWlR5WrKv4IOTsiHEJ9znvZ4KowL/8luGotnfyb0+zMwdBuWN8i8UyQF42VLMZuWxv6/jNqQReBGgsw5wKB/B4rGJMrANJYi00BCs2SqBrhi8COih78zHrXqlY2P9TNIa+9WCHo4t91ih0Bzj11r99UMx/uvWv7BVSXnM5aupxZGJudEvNuhB6gr/T0JpPKMQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSB/tw7eSTDREw4hEIqp7vzhX1jKxwtOwV48ecKtd74=;
 b=tByoRq5KfJBGqIygenIvoe4hQDf+Bhj3ZRDOL/+dhY0kvjS+4Y5p+LG8EQFG70p+YB7y3vOZWG8On7BmYNjPPpDxGGsQCNXLe0WDg/Jl/dy93EPd+jB3deqSCH3dXFeiajtigssFYbjxaoY6ndmeeqtAl0MWN/D3gREGSP3yHVk=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6639.eurprd04.prod.outlook.com (2603:10a6:803:129::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Wed, 10 Jun
 2020 06:10:15 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 06:10:15 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v3 2/9] usb: cdns3: add runtime PM support
Thread-Topic: [PATCH v3 2/9] usb: cdns3: add runtime PM support
Thread-Index: AQHWPWPu+gYu2FOIY0SrqQVOA1uRDajRWCdA
Date:   Wed, 10 Jun 2020 06:10:15 +0000
Message-ID: <VE1PR04MB65285C5FBA48EC54BE7DE61189830@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20200608071052.8929-1-peter.chen@nxp.com>
 <20200608071052.8929-3-peter.chen@nxp.com>
In-Reply-To: <20200608071052.8929-3-peter.chen@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dca37fed-e098-4603-1717-08d80d04f190
x-ms-traffictypediagnostic: VE1PR04MB6639:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6639A2BF6AC78E323294BA7489830@VE1PR04MB6639.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0430FA5CB7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jJKGb92sRZCLRVHaMmLQ3RUcEvcMDf6kuZ3FGinQqVUpy5MATXhMoIwdDl3H5GaHmE3iVtBSZfm/ZVbXzf48RM9K369YvkyUk5N93oTbgov3vzorXk30ZlU5zz57z+dSI4Vd2WTGOXQr1vevz1OEPZzJ4Cjtu1fIIbAYz3T5kRUgSUXC0ea3DBCDIYYPcxTTB/Esgfv/M8opgsb6kwXCE0XtUTQPF4unhNZgtxI6+ZrQPNEEDOX9Q/AkDRVi8adnpkmGg1FaWJlcNzSofLBpDrHCBl1wiX2Rnkd/0H0NANODVet8UPHFKrBjXnL9NYlL29F+4t/fiDSFFTZVa038FQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(26005)(186003)(4326008)(83380400001)(52536014)(8676002)(86362001)(8936002)(478600001)(66556008)(6506007)(66446008)(71200400001)(9686003)(5660300002)(76116006)(316002)(110136005)(66476007)(2906002)(55016002)(7696005)(54906003)(33656002)(44832011)(30864003)(66946007)(53546011)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: kdGHSLEXNlQNgeWZmx5aAO03zPS+9rajf8VWC0T0B8+qz/BMotI7YSGlN5t8VBXpqb/+as5m57glwZQbbTZHrUa7R7dCHKzOpT40TsaVxENTE9VMAmCELwfggkA85tTCLH2SPcVYI2DY8H4oLMBMb4TIeBDIlGL8Vg6aMb3zBGoqU5tsSOITDDI94Nv1lXiTn6ZfPtGEb8CxGaxLga2lP2kdYNjluNws5aANwf7iPFHs1CnFurGgaNpt46G2siZslfTUWcmQCpjmiOgamVc/z+/gV9+/d02C4lUuEXlv8dOkNgO0HJNEW9oUSzA+/Fca3gelqYY3FUg8PKRd3TkNscicR0++NRHm+dilBVsvaQpZC4hdTKQHsraxIK0HtM45Jzj/jV5pN9c+lsodGAz7NiC7J0kuts7GQv3YQdi/mFtQ0f+6nU3l092hfU6hTXDdDwNF3ejutLoo2LK3xuih+89nNQ3rmRiR9OoYLILH8ACfrMEWjeWa1JlI6vCoCqdk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca37fed-e098-4603-1717-08d80d04f190
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 06:10:15.5418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVS6+5ClZlhQpnMmGsEdi9el/DtburmZTi9zVfgIn2yPX1vIDKzLx3MM0nFYeoAr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6639
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Peter Chen <peter.chen@nxp.com>
> Sent: Monday, June 8, 2020 3:11 PM
> To: balbi@kernel.org; mathias.nyman@intel.com
> Cc: linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> pawell@cadence.com; rogerq@ti.com; gregkh@linuxfoundation.org; Jun Li
> <jun.li@nxp.com>; Peter Chen <peter.chen@nxp.com>
> Subject: [PATCH v3 2/9] usb: cdns3: add runtime PM support
>=20
> Introduce runtime PM and wakeup interrupt handler for cdns3, the runtime =
PM is default
> off since other cdns3 may not implement glue layer support for runtime PM=
.
>=20
> One typical wakeup event use case is xHCI runtime suspend will clear USBC=
MD.RS bit,
> after that the xHCI will not trigger any interrupts, so its parent (cdns =
core device)
> needs to resume xHCI device when any (wakeup) events occurs at host port.
>=20
> When the controller is in low power mode, the lpm flag will be set.
> The interrupt triggered later than lpm flag is set considers as wakeup in=
terrupt
> and handled at cdns_wakeup_irq. Once the wakeup occurs, it first disables=
 interrupt
> to avoid later interrupt occurrence since the controller is in low power =
mode at
> that time, and access registers may be invalid at that time. At wakeup ha=
ndler,
> it will call pm_request_resume to wakeup xHCI device, and at runtime resu=
me handler,
> it will enable interrupt again.
>=20
> The API platform_suspend is introduced for glue layer to implement platfo=
rm specific
> PM sequence.
>=20
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/core.c   | 155 +++++++++++++++++++++++++++++++++----
>  drivers/usb/cdns3/core.h   |  16 ++++
>  drivers/usb/cdns3/drd.c    |   3 +
>  drivers/usb/cdns3/gadget.c |   4 +
>  drivers/usb/cdns3/host.c   |   7 ++
>  5 files changed, 168 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c index
> bfd09aa98c12..97fb082ed3b4 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -406,6 +406,30 @@ static int cdns3_set_phy_power(struct cdns3 *cdns, b=
ool on)
>  	return 0;
>  }
>=20
> +/**
> + * cdns3_wakeup_irq - interrupt handler for wakeup events
> + *
> + * @irq: irq number for cdns3 core device
> + * @data: structure of cdns3
> + *
> + * Returns IRQ_HANDLED or IRQ_NONE
> + */
> +static irqreturn_t cdns3_wakeup_irq(int irq, void *data) {
> +	struct cdns3 *cdns =3D data;
> +
> +	if (cdns->in_lpm) {
> +		disable_irq_nosync(irq);
> +		cdns->wakeup_int =3D true;
> +		if ((cdns->role =3D=3D USB_ROLE_HOST) && cdns->host_dev)
> +			pm_request_resume(&cdns->host_dev->dev);
> +
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
>  /**
>   * cdns3_probe - probe for cdns3 core device
>   * @pdev: Pointer to cdns3 core platform device @@ -432,6 +456,7 @@ stat=
ic int
> cdns3_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>=20
>  	cdns->dev =3D dev;
> +	cdns->pdata =3D dev_get_platdata(dev);
>=20
>  	platform_set_drvdata(pdev, cdns);
>=20
> @@ -481,6 +506,15 @@ static int cdns3_probe(struct platform_device *pdev)
>=20
>  	cdns->otg_res =3D *res;
>=20
> +	cdns->wakeup_irq =3D platform_get_irq_byname(pdev, "wakeup");

platform_get_irq_byname_optional

> +	if (cdns->wakeup_irq =3D=3D -EPROBE_DEFER)
> +		return cdns->wakeup_irq;
> +
> +	if (cdns->wakeup_irq < 0) {
> +		dev_dbg(dev, "couldn't get wakeup irq\n");
> +		cdns->wakeup_irq =3D 0x0;
> +	}
> +
>  	mutex_init(&cdns->mutex);
>=20
>  	cdns->usb2_phy =3D devm_phy_optional_get(dev, "cdns3,usb2-phy"); @@ -51=
7,6
> +551,19 @@ static int cdns3_probe(struct platform_device *pdev)
>  		goto err3;
>  	}
>=20
> +	if (cdns->wakeup_irq) {
> +		ret =3D devm_request_threaded_irq(cdns->dev, cdns->wakeup_irq,
> +						cdns3_wakeup_irq,
> +						NULL,
> +						IRQF_SHARED,
> +						dev_name(cdns->dev), cdns);
> +
> +		if (ret) {
> +			dev_err(cdns->dev, "couldn't register wakeup irq handler\n");
> +			goto err3;
> +		}
> +	}
> +
>  	ret =3D cdns3_drd_init(cdns);
>  	if (ret)
>  		goto err4;
> @@ -525,9 +572,11 @@ static int cdns3_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err4;
>=20
> +	spin_lock_init(&cdns->lock);
>  	device_set_wakeup_capable(dev, true);
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
> +	pm_runtime_forbid(dev);
>=20
>  	/*
>  	 * The controller needs less time between bus and controller suspend, @=
@ -574,52
> +623,124 @@ static int cdns3_remove(struct platform_device *pdev)
>  	return 0;
>  }
>=20
> -#ifdef CONFIG_PM_SLEEP
> +#ifdef CONFIG_PM
>=20
> -static int cdns3_suspend(struct device *dev)
> +static int cdns3_set_platform_suspend(struct device *dev,
> +		bool suspend, bool wakeup)
> +{
> +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&cdns->lock, flags);

This really need a big spinlock for all platforms specific
suspend operations? I see you have a 100us polling in your
platform_suspend implementation, and also the spinlock
seems can be inside your implementation to protect really
needed part.

> +	if (cdns->pdata && cdns->pdata->platform_suspend)
> +		ret =3D cdns->pdata->platform_suspend(dev, suspend, wakeup);
> +
> +	spin_unlock_irqrestore(&cdns->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int cdns3_controller_suspend(struct device *dev, pm_message_t
> +msg)
>  {
>  	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> +	bool wakeup;
>  	unsigned long flags;
>=20
> -	if (cdns->role =3D=3D USB_ROLE_HOST)
> +	if (cdns->in_lpm)
>  		return 0;
>=20
> -	if (pm_runtime_status_suspended(dev))
> -		pm_runtime_resume(dev);
> +	if (PMSG_IS_AUTO(msg))
> +		wakeup =3D true;
> +	else
> +		wakeup =3D device_may_wakeup(dev);
>=20
> -	if (cdns->roles[cdns->role]->suspend) {
> -		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
> -		cdns->roles[cdns->role]->suspend(cdns, false);
> -		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
> -	}
> +	cdns3_set_platform_suspend(cdns->dev, true, wakeup);
> +	cdns3_set_phy_power(cdns, false);
> +	spin_lock_irqsave(&cdns->lock, flags);
> +	cdns->in_lpm =3D true;
> +	spin_unlock_irqrestore(&cdns->lock, flags);
>=20
>  	return 0;
>  }
>=20
> -static int cdns3_resume(struct device *dev)
> +static int cdns3_controller_resume(struct device *dev, pm_message_t
> +msg)
>  {
>  	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> +	int ret;
>  	unsigned long flags;
>=20
> -	if (cdns->role =3D=3D USB_ROLE_HOST)
> +	if (!cdns->in_lpm)
>  		return 0;
>=20
> -	if (cdns->roles[cdns->role]->resume) {
> -		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
> +	ret =3D cdns3_set_phy_power(cdns, true);
> +	if (ret)
> +		return ret;
> +
> +	cdns3_set_platform_suspend(cdns->dev, false, false);
> +
> +	spin_lock_irqsave(&cdns->lock, flags);
> +	if (cdns->roles[cdns->role]->resume && !PMSG_IS_AUTO(msg))
>  		cdns->roles[cdns->role]->resume(cdns, false);
> -		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
> +
> +	cdns->in_lpm =3D false;
> +	spin_unlock_irqrestore(&cdns->lock, flags);
> +	if (cdns->wakeup_int) {
> +		cdns->wakeup_int =3D false;
> +		enable_irq(cdns->otg_irq);

enable_irq(cdns->wakeup_irq)

>  	}
>=20
> +	return ret;
> +}
> +
> +static int cdns3_runtime_suspend(struct device *dev) {
> +	return cdns3_controller_suspend(dev, PMSG_AUTO_SUSPEND); }
> +
> +static int cdns3_runtime_resume(struct device *dev) {
> +	return cdns3_controller_resume(dev, PMSG_AUTO_RESUME); } #ifdef
> +CONFIG_PM_SLEEP
> +
> +static int cdns3_suspend(struct device *dev) {
> +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	if (pm_runtime_status_suspended(dev))
> +		pm_runtime_resume(dev);
> +
> +	if (cdns->roles[cdns->role]->suspend) {
> +		spin_lock_irqsave(&cdns->lock, flags);
> +		cdns->roles[cdns->role]->suspend(cdns, false);
> +		spin_unlock_irqrestore(&cdns->lock, flags);
> +	}
> +
> +	return cdns3_controller_suspend(dev, PMSG_SUSPEND); }
> +
> +static int cdns3_resume(struct device *dev) {
> +	int ret;
> +
> +	ret =3D cdns3_controller_resume(dev, PMSG_RESUME);
> +	if (ret)
> +		return ret;
> +
>  	pm_runtime_disable(dev);
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>=20
> -	return 0;
> +	return ret;
>  }
> -#endif
> +#endif /* CONFIG_PM_SLEEP */
> +#endif /* CONFIG_PM */
>=20
>  static const struct dev_pm_ops cdns3_pm_ops =3D {
>  	SET_SYSTEM_SLEEP_PM_OPS(cdns3_suspend, cdns3_resume)
> +	SET_RUNTIME_PM_OPS(cdns3_runtime_suspend, cdns3_runtime_resume, NULL)
>  };
>=20
>  #ifdef CONFIG_OF
> diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h index
> 1ad1f1fe61e9..fdbcf557a61f 100644
> --- a/drivers/usb/cdns3/core.h
> +++ b/drivers/usb/cdns3/core.h
> @@ -38,6 +38,12 @@ struct cdns3_role_driver {  };
>=20
>  #define CDNS3_XHCI_RESOURCES_NUM	2
> +
> +struct cdns3_platform_data {
> +	int (*platform_suspend)(struct device *dev,
> +			bool suspend, bool wakeup);
> +};
> +
>  /**
>   * struct cdns3 - Representation of Cadence USB3 DRD controller.
>   * @dev: pointer to Cadence device struct @@ -50,6 +56,7 @@ struct cdns3=
_role_driver
> {
>   * @otg_regs: pointer to base of otg registers
>   * @otg_irq: irq number for otg controller
>   * @dev_irq: irq number for device controller
> + * @dev_irq: irq number for wakeup event

@wakeup_irq

>   * @roles: array of supported roles for this controller
>   * @role: current role
>   * @host_dev: the child host device pointer for cdns3 core @@ -62,6 +69,=
10 @@ struct
> cdns3_role_driver {
>   *           This field based on firmware setting, kernel configuration
>   *           and hardware configuration.
>   * @role_sw: pointer to role switch object.
> + * @in_lpm: indicate the controller is in low power mode
> + * @wakeup_int: wakeup interrupt occurs
> + * @pdata: platform data from glue layer
> + * @lock: spinlock structure
>   */
>  struct cdns3 {
>  	struct device			*dev;
> @@ -79,6 +90,7 @@ struct cdns3 {
>=20
>  	int				otg_irq;
>  	int				dev_irq;
> +	int				wakeup_irq;
>  	struct cdns3_role_driver	*roles[USB_ROLE_DEVICE + 1];
>  	enum usb_role			role;
>  	struct platform_device		*host_dev;
> @@ -89,6 +101,10 @@ struct cdns3 {
>  	struct mutex			mutex;
>  	enum usb_dr_mode		dr_mode;
>  	struct usb_role_switch		*role_sw;
> +	bool				in_lpm;
> +	bool				wakeup_int;

Too close to wakeup_irq, maybe wakeup_pending?

Li Jun
> +	struct cdns3_platform_data	*pdata;
> +	spinlock_t			lock;
>  };
>=20
>  int cdns3_hw_role_switch(struct cdns3 *cdns); diff --git
> a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c index
> 58089841ed52..ac90a484e63c 100644
> --- a/drivers/usb/cdns3/drd.c
> +++ b/drivers/usb/cdns3/drd.c
> @@ -281,6 +281,9 @@ static irqreturn_t cdns3_drd_irq(int irq, void *data)
>  	if (cdns->dr_mode !=3D USB_DR_MODE_OTG)
>  		return ret;
>=20
> +	if (cdns->in_lpm)
> +		return ret;
> +
>  	reg =3D readl(&cdns->otg_regs->ivect);
>=20
>  	if (!reg)
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c inde=
x
> 7babba9dd916..eac01b1a4958 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -1765,9 +1765,13 @@ static void cdns3_check_usb_interrupt_proceed(stru=
ct
> cdns3_device *priv_dev,  static irqreturn_t cdns3_device_irq_handler(int =
irq, void
> *data)  {
>  	struct cdns3_device *priv_dev =3D data;
> +	struct cdns3 *cdns =3D dev_get_drvdata(priv_dev->dev);
>  	irqreturn_t ret =3D IRQ_NONE;
>  	u32 reg;
>=20
> +	if (cdns->in_lpm)
> +		return ret;
> +
>  	/* check USB device interrupt */
>  	reg =3D readl(&priv_dev->regs->usb_ists);
>  	if (reg) {
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c index
> ad788bf3fe4f..b579ef15f4e0 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -13,11 +13,13 @@
>  #include "core.h"
>  #include "drd.h"
>  #include "host-export.h"
> +#include <linux/usb/hcd.h>
>=20
>  static int __cdns3_host_init(struct cdns3 *cdns)  {
>  	struct platform_device *xhci;
>  	int ret;
> +	struct usb_hcd *hcd;
>=20
>  	cdns3_drd_switch_host(cdns, 1);
>=20
> @@ -43,6 +45,11 @@ static int __cdns3_host_init(struct cdns3 *cdns)
>  		goto err1;
>  	}
>=20
> +	/* Glue needs to access xHCI region register for Power management */
> +	hcd =3D platform_get_drvdata(xhci);
> +	if (hcd)
> +		cdns->xhci_regs =3D hcd->regs;
> +
>  	return 0;
>  err1:
>  	platform_device_put(xhci);
> --
> 2.17.1

