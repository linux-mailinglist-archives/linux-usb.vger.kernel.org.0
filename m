Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DCE1F5F94
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jun 2020 03:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgFKBmT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Jun 2020 21:42:19 -0400
Received: from mail-eopbgr40057.outbound.protection.outlook.com ([40.107.4.57]:21219
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726417AbgFKBmR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Jun 2020 21:42:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMpMpYtsYtIuGAABFpckPyr1K1gPrDQcGVdBKRxhFErl3T5ElFPBkbMsGrPoBSifgxgKR3ZtFQQgX7AZo5Lx4cWIKgqnBNXn1Y1m7Z3FZYUF/IuUtbDRf8jz2ZJkizCMFgwm0V0t/4DWDq6dT3aPhDV7N+ePEZiwfDLM0A5RsJGEmKA0HrzKnE4TrD4RdRoKsj1+gsYoobUtnaN3MxSr+MPedm/Hsg2mnyLswRAfEd21aCyTCy6rjptUdMqhx6tv5c2IF1vYIfdEPDuvr1lBzbiFWync3VMlfRa3h9sgQ77mzcJviPK/l1DcFdn+UQKRyz7GfdDIgyyeE27QgOAlQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxeIz5nAQT65bIC/Gh4AtMYED8H94y01kpz/FAZchZg=;
 b=I7Hezzu8Wsq+h2FNHdgvm4KzsTWPDXz/D+KccpH7Z+1Cq1syHKJNTcF62xy0/t592DYQcRv91FIuvXkleZnLJ2jUS/Y0VDFI6G7cybTMC7J1DjDQ2nkYym4qe5pwvko48Xaj3HTiF2iUiSZ5TPMypFcGgZh+w6z6heyrBi47flapBl3hykOdH2LnhbCyoaKAmW7a3JY8HwO5gF/BO03eZdqKA7KIpIHO0QoiVW4Q0JyAckO2ulkd5HxDZcaIRhyueesIiNfuMQp2+0TFbs5m3ivsvJatut+UqZOG3MS6NsovclFp4Z70OfPQWz3yCNsFc0cfcmAa6gAAKtw3EBzMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxeIz5nAQT65bIC/Gh4AtMYED8H94y01kpz/FAZchZg=;
 b=VRX/8FsFEqYB1/HCEJBu7Czy/mbPfGxLjXVFC0+sgSNCxoa2bq2g97cymcsZ1U+udxMfy2DQlDvz8KoZQ8u1H1v+xn8PTovWy5qt5iYPMyNktJBiRnTTgvWJMsgcl0RcCPqqVZgqRCTBajnBWo2dGTTsIa4dywWsGQTw78sP9KI=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 01:42:14 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 01:42:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 2/9] usb: cdns3: add runtime PM support
Thread-Topic: [PATCH v3 2/9] usb: cdns3: add runtime PM support
Thread-Index: AQHWPWPufWYd0g4yEE6C+mMMFGZKmqjRYNWAgAFHjwA=
Date:   Thu, 11 Jun 2020 01:42:14 +0000
Message-ID: <20200611014238.GA8276@b29397-desktop>
References: <20200608071052.8929-1-peter.chen@nxp.com>
 <20200608071052.8929-3-peter.chen@nxp.com>
 <VE1PR04MB65285C5FBA48EC54BE7DE61189830@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB65285C5FBA48EC54BE7DE61189830@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1553ff0f-a8b9-4dcc-b015-08d80da8aaf4
x-ms-traffictypediagnostic: AM7PR04MB7191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7191E5653483E6ACD746D5258B800@AM7PR04MB7191.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f0rDqeD33iv/TvOqFBdtXW46rXJVprrlVhT+X8Zxc/XolL/FXGtfdRO0q+WYF6MIMFHkSgP1jBA/pbX6WG+OhJsxWYylqeR40uUxxOXPtfOc92n7eGjJILzq20/hydole2oaNOV5CRwN46hY9bw5sub13c8geJhmneV1aw4Wd9WzuFU6/uRAt9zuqmD9wTlgOxIF4CnCDQzvExF2NXWiLqqMEyhTJhsTVT7BGHIgh9gMB9gc5a0HgwxhXnE0hXYxK03zERVuQSPkEUKXtvJYdi5ME08xs5Huj6wMvInMESSc1NYsLVS0Z6hirkou2Ee/MozkajPkQJwnF7syxQ46ZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(366004)(396003)(136003)(39860400002)(376002)(346002)(44832011)(9686003)(5660300002)(8936002)(33716001)(86362001)(4326008)(26005)(6512007)(316002)(6862004)(54906003)(186003)(53546011)(33656002)(478600001)(66446008)(8676002)(6636002)(2906002)(66476007)(83380400001)(6506007)(76116006)(64756008)(66556008)(6486002)(91956017)(1076003)(71200400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: xPNfxh4vMlhjAYdB7ic9OLXYQpjwBiCc155nG4epwpMhYxC0YrU7cw2pmtEfPghyaurlmvCrKHOjzUGbcD7qBUkISCYv1oODhxqskKZiIaq04klrhv9dWhz+gqiBE5a70Qmv9bGEB+jWtfaO+WmAq5BLzYLCaRhoMU8medpMHjEMlmb4pjIlXcm9JZKjEXgcaDYjSq+XhF0hBxkXf2DitCIFyadpftWb4JP4B5N3Uf1lagBWWgvGVWhK4gWm9TnVf0HNmGiEexX9kOOawEyihepQ3SnDTwDDiCJndJy1RNU74HEWi0/TNx5i02EPE0MD2by02Al/Zh4+ogKbs0uwnBx7XSSA9LhX0Cs8UcRGGSYZ6rWUREMcL3UErHTj/9D7xDO8qZcF00UCm0pftkOk+MKGh6hI9CumjOLJUegUDZaeD3B7bZ8u9aXaybBcMDU3n1vkdtYgdsfx/52kgliWCfQ2sCJ7CqA54wzqP3bmfBnGZjXKtcHCo4LRifqsUiNH
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0BC33508B0F8FC48B81AC049B20E6853@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1553ff0f-a8b9-4dcc-b015-08d80da8aaf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 01:42:14.5808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rWGoqZGxyhRxMSVPkMzrZRUCJ20Sp9hoxtmwAzq6h44JietqWJb7FWch3BcZx8JSP8pyrqFnWLI+hs9PGlK/rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-06-10 06:10:15, Jun Li wrote:
> >  /**
> >   * cdns3_probe - probe for cdns3 core device
> >   * @pdev: Pointer to cdns3 core platform device @@ -432,6 +456,7 @@ st=
atic int
> > cdns3_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >=20
> >  	cdns->dev =3D dev;
> > +	cdns->pdata =3D dev_get_platdata(dev);
> >=20
> >  	platform_set_drvdata(pdev, cdns);
> >=20
> > @@ -481,6 +506,15 @@ static int cdns3_probe(struct platform_device *pde=
v)
> >=20
> >  	cdns->otg_res =3D *res;
> >=20
> > +	cdns->wakeup_irq =3D platform_get_irq_byname(pdev, "wakeup");
>=20
> platform_get_irq_byname_optional

Ok
>=20
> > +	if (cdns->wakeup_irq =3D=3D -EPROBE_DEFER)
> > +		return cdns->wakeup_irq;
> > +
> > +	if (cdns->wakeup_irq < 0) {
> > +		dev_dbg(dev, "couldn't get wakeup irq\n");
> > +		cdns->wakeup_irq =3D 0x0;
> > +	}
> > +
> >  	mutex_init(&cdns->mutex);
> >=20
> >  	cdns->usb2_phy =3D devm_phy_optional_get(dev, "cdns3,usb2-phy"); @@ -=
517,6
> > +551,19 @@ static int cdns3_probe(struct platform_device *pdev)
> >  		goto err3;
> >  	}
> >=20
> > +	if (cdns->wakeup_irq) {
> > +		ret =3D devm_request_threaded_irq(cdns->dev, cdns->wakeup_irq,
> > +						cdns3_wakeup_irq,
> > +						NULL,
> > +						IRQF_SHARED,
> > +						dev_name(cdns->dev), cdns);
> > +
> > +		if (ret) {
> > +			dev_err(cdns->dev, "couldn't register wakeup irq handler\n");
> > +			goto err3;
> > +		}
> > +	}
> > +
> >  	ret =3D cdns3_drd_init(cdns);
> >  	if (ret)
> >  		goto err4;
> > @@ -525,9 +572,11 @@ static int cdns3_probe(struct platform_device *pde=
v)
> >  	if (ret)
> >  		goto err4;
> >=20
> > +	spin_lock_init(&cdns->lock);
> >  	device_set_wakeup_capable(dev, true);
> >  	pm_runtime_set_active(dev);
> >  	pm_runtime_enable(dev);
> > +	pm_runtime_forbid(dev);
> >=20
> >  	/*
> >  	 * The controller needs less time between bus and controller suspend,=
 @@ -574,52
> > +623,124 @@ static int cdns3_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >=20
> > -#ifdef CONFIG_PM_SLEEP
> > +#ifdef CONFIG_PM
> >=20
> > -static int cdns3_suspend(struct device *dev)
> > +static int cdns3_set_platform_suspend(struct device *dev,
> > +		bool suspend, bool wakeup)
> > +{
> > +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> > +	int ret =3D 0;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&cdns->lock, flags);
>=20
> This really need a big spinlock for all platforms specific
> suspend operations? I see you have a 100us polling in your
> platform_suspend implementation, and also the spinlock
> seems can be inside your implementation to protect really
> needed part.

It will remove this spinlock, some other platforms may could
sleep at its glue layer.

>=20
> > +	if (cdns->pdata && cdns->pdata->platform_suspend)
> > +		ret =3D cdns->pdata->platform_suspend(dev, suspend, wakeup);
> > +
> > +	spin_unlock_irqrestore(&cdns->lock, flags);
> > +
> > +	return ret;
> > +}
> > +
> > +static int cdns3_controller_suspend(struct device *dev, pm_message_t
> > +msg)
> >  {
> >  	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> > +	bool wakeup;
> >  	unsigned long flags;
> >=20
> > -	if (cdns->role =3D=3D USB_ROLE_HOST)
> > +	if (cdns->in_lpm)
> >  		return 0;
> >=20
> > -	if (pm_runtime_status_suspended(dev))
> > -		pm_runtime_resume(dev);
> > +	if (PMSG_IS_AUTO(msg))
> > +		wakeup =3D true;
> > +	else
> > +		wakeup =3D device_may_wakeup(dev);
> >=20
> > -	if (cdns->roles[cdns->role]->suspend) {
> > -		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
> > -		cdns->roles[cdns->role]->suspend(cdns, false);
> > -		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
> > -	}
> > +	cdns3_set_platform_suspend(cdns->dev, true, wakeup);
> > +	cdns3_set_phy_power(cdns, false);
> > +	spin_lock_irqsave(&cdns->lock, flags);
> > +	cdns->in_lpm =3D true;
> > +	spin_unlock_irqrestore(&cdns->lock, flags);
> >=20
> >  	return 0;
> >  }
> >=20
> > -static int cdns3_resume(struct device *dev)
> > +static int cdns3_controller_resume(struct device *dev, pm_message_t
> > +msg)
> >  {
> >  	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> > +	int ret;
> >  	unsigned long flags;
> >=20
> > -	if (cdns->role =3D=3D USB_ROLE_HOST)
> > +	if (!cdns->in_lpm)
> >  		return 0;
> >=20
> > -	if (cdns->roles[cdns->role]->resume) {
> > -		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
> > +	ret =3D cdns3_set_phy_power(cdns, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	cdns3_set_platform_suspend(cdns->dev, false, false);
> > +
> > +	spin_lock_irqsave(&cdns->lock, flags);
> > +	if (cdns->roles[cdns->role]->resume && !PMSG_IS_AUTO(msg))
> >  		cdns->roles[cdns->role]->resume(cdns, false);
> > -		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
> > +
> > +	cdns->in_lpm =3D false;
> > +	spin_unlock_irqrestore(&cdns->lock, flags);
> > +	if (cdns->wakeup_int) {
> > +		cdns->wakeup_int =3D false;
> > +		enable_irq(cdns->otg_irq);
>=20
> enable_irq(cdns->wakeup_irq)

OK

>=20
> >  	}
> >=20
> > +	return ret;
> > +}
> > +
> > +static int cdns3_runtime_suspend(struct device *dev) {
> > +	return cdns3_controller_suspend(dev, PMSG_AUTO_SUSPEND); }
> > +
> > +static int cdns3_runtime_resume(struct device *dev) {
> > +	return cdns3_controller_resume(dev, PMSG_AUTO_RESUME); } #ifdef
> > +CONFIG_PM_SLEEP
> > +
> > +static int cdns3_suspend(struct device *dev) {
> > +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> > +	unsigned long flags;
> > +
> > +	if (pm_runtime_status_suspended(dev))
> > +		pm_runtime_resume(dev);
> > +
> > +	if (cdns->roles[cdns->role]->suspend) {
> > +		spin_lock_irqsave(&cdns->lock, flags);
> > +		cdns->roles[cdns->role]->suspend(cdns, false);
> > +		spin_unlock_irqrestore(&cdns->lock, flags);
> > +	}
> > +
> > +	return cdns3_controller_suspend(dev, PMSG_SUSPEND); }
> > +
> > +static int cdns3_resume(struct device *dev) {
> > +	int ret;
> > +
> > +	ret =3D cdns3_controller_resume(dev, PMSG_RESUME);
> > +	if (ret)
> > +		return ret;
> > +
> >  	pm_runtime_disable(dev);
> >  	pm_runtime_set_active(dev);
> >  	pm_runtime_enable(dev);
> >=20
> > -	return 0;
> > +	return ret;
> >  }
> > -#endif
> > +#endif /* CONFIG_PM_SLEEP */
> > +#endif /* CONFIG_PM */
> >=20
> >  static const struct dev_pm_ops cdns3_pm_ops =3D {
> >  	SET_SYSTEM_SLEEP_PM_OPS(cdns3_suspend, cdns3_resume)
> > +	SET_RUNTIME_PM_OPS(cdns3_runtime_suspend, cdns3_runtime_resume, NULL)
> >  };
> >=20
> >  #ifdef CONFIG_OF
> > diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h index
> > 1ad1f1fe61e9..fdbcf557a61f 100644
> > --- a/drivers/usb/cdns3/core.h
> > +++ b/drivers/usb/cdns3/core.h
> > @@ -38,6 +38,12 @@ struct cdns3_role_driver {  };
> >=20
> >  #define CDNS3_XHCI_RESOURCES_NUM	2
> > +
> > +struct cdns3_platform_data {
> > +	int (*platform_suspend)(struct device *dev,
> > +			bool suspend, bool wakeup);
> > +};
> > +
> >  /**
> >   * struct cdns3 - Representation of Cadence USB3 DRD controller.
> >   * @dev: pointer to Cadence device struct @@ -50,6 +56,7 @@ struct cdn=
s3_role_driver
> > {
> >   * @otg_regs: pointer to base of otg registers
> >   * @otg_irq: irq number for otg controller
> >   * @dev_irq: irq number for device controller
> > + * @dev_irq: irq number for wakeup event
>=20
> @wakeup_irq

Ok

>=20
> >   * @roles: array of supported roles for this controller
> >   * @role: current role
> >   * @host_dev: the child host device pointer for cdns3 core @@ -62,6 +6=
9,10 @@ struct
> > cdns3_role_driver {
> >   *           This field based on firmware setting, kernel configuratio=
n
> >   *           and hardware configuration.
> >   * @role_sw: pointer to role switch object.
> > + * @in_lpm: indicate the controller is in low power mode
> > + * @wakeup_int: wakeup interrupt occurs
> > + * @pdata: platform data from glue layer
> > + * @lock: spinlock structure
> >   */
> >  struct cdns3 {
> >  	struct device			*dev;
> > @@ -79,6 +90,7 @@ struct cdns3 {
> >=20
> >  	int				otg_irq;
> >  	int				dev_irq;
> > +	int				wakeup_irq;
> >  	struct cdns3_role_driver	*roles[USB_ROLE_DEVICE + 1];
> >  	enum usb_role			role;
> >  	struct platform_device		*host_dev;
> > @@ -89,6 +101,10 @@ struct cdns3 {
> >  	struct mutex			mutex;
> >  	enum usb_dr_mode		dr_mode;
> >  	struct usb_role_switch		*role_sw;
> > +	bool				in_lpm;
> > +	bool				wakeup_int;
>=20
> Too close to wakeup_irq, maybe wakeup_pending?

OK

Peter
>=20
> Li Jun
> > +	struct cdns3_platform_data	*pdata;
> > +	spinlock_t			lock;
> >  };
> >=20
> >  int cdns3_hw_role_switch(struct cdns3 *cdns); diff --git
> > a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c index
> > 58089841ed52..ac90a484e63c 100644
> > --- a/drivers/usb/cdns3/drd.c
> > +++ b/drivers/usb/cdns3/drd.c
> > @@ -281,6 +281,9 @@ static irqreturn_t cdns3_drd_irq(int irq, void *dat=
a)
> >  	if (cdns->dr_mode !=3D USB_DR_MODE_OTG)
> >  		return ret;
> >=20
> > +	if (cdns->in_lpm)
> > +		return ret;
> > +
> >  	reg =3D readl(&cdns->otg_regs->ivect);
> >=20
> >  	if (!reg)
> > diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c in=
dex
> > 7babba9dd916..eac01b1a4958 100644
> > --- a/drivers/usb/cdns3/gadget.c
> > +++ b/drivers/usb/cdns3/gadget.c
> > @@ -1765,9 +1765,13 @@ static void cdns3_check_usb_interrupt_proceed(st=
ruct
> > cdns3_device *priv_dev,  static irqreturn_t cdns3_device_irq_handler(in=
t irq, void
> > *data)  {
> >  	struct cdns3_device *priv_dev =3D data;
> > +	struct cdns3 *cdns =3D dev_get_drvdata(priv_dev->dev);
> >  	irqreturn_t ret =3D IRQ_NONE;
> >  	u32 reg;
> >=20
> > +	if (cdns->in_lpm)
> > +		return ret;
> > +
> >  	/* check USB device interrupt */
> >  	reg =3D readl(&priv_dev->regs->usb_ists);
> >  	if (reg) {
> > diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c index
> > ad788bf3fe4f..b579ef15f4e0 100644
> > --- a/drivers/usb/cdns3/host.c
> > +++ b/drivers/usb/cdns3/host.c
> > @@ -13,11 +13,13 @@
> >  #include "core.h"
> >  #include "drd.h"
> >  #include "host-export.h"
> > +#include <linux/usb/hcd.h>
> >=20
> >  static int __cdns3_host_init(struct cdns3 *cdns)  {
> >  	struct platform_device *xhci;
> >  	int ret;
> > +	struct usb_hcd *hcd;
> >=20
> >  	cdns3_drd_switch_host(cdns, 1);
> >=20
> > @@ -43,6 +45,11 @@ static int __cdns3_host_init(struct cdns3 *cdns)
> >  		goto err1;
> >  	}
> >=20
> > +	/* Glue needs to access xHCI region register for Power management */
> > +	hcd =3D platform_get_drvdata(xhci);
> > +	if (hcd)
> > +		cdns->xhci_regs =3D hcd->regs;
> > +
> >  	return 0;
> >  err1:
> >  	platform_device_put(xhci);
> > --
> > 2.17.1
>=20

--=20

Thanks,
Peter Chen=
