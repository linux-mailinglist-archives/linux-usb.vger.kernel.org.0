Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057371E04FC
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 04:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388505AbgEYC5M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 22:57:12 -0400
Received: from mail-eopbgr80082.outbound.protection.outlook.com ([40.107.8.82]:3586
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388398AbgEYC5M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 May 2020 22:57:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etjCwaAeWYD00RimT/oDk3DhK64/m0ZY0QGAXY7SAw+j5g3epIo1hi7qOlQygF4qngiElfcJINN+obQ3tew2TEZb8seKWNxbMwR0vaIRGHL8Uj72vdn9c/3PRgiBHIXe1g5udT8l2dpUhUSTPzkl1zQeN/B6s16Az5muagB4Vp2eglH78cQM21OeFi3e+uXFRpeihj5JPpGInplZ0vFWSHv9CEbThYS8IBLIs+Bx5KLUbapL8dFxW/j8In/6ryWz9spSWoijifU3Fdij+65VnzAYCFGYQNL0Fc9pmrHCvXqq0Kdk8X0Oh64RBuKIjNAOTKnMyvtdmL8QF1Wc+Wa5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkeMODVMeO6XSgC/syYB8ZZoiKQgWrvipFbH7hd8alA=;
 b=Lpv++kv6GoO6p91v9sMJ5ZwxcLZeebJva7uqtNQgIe8pEplNV79+tyo0dakAyyxZ/X4aIbcEZ15Gj/Ws3oP4vysFcAZ/p8w8UnroZ0WX0MLrXrs8fmY9xw3R+XGtjq9HzjdZyYJxKB8QgGhUesewv1dyICG0LRBB/zFZsE2478dBJPb6+1e9hL+TDL+x5S+leswPv7uZFEUWhcnS4rhzczIhs5H566xiY33sc9fPXdyCwCcBR7+rmncu/nqpC9hQ4EuzpMg3xGIsEv/LQkbSjGY4BxvbVXLbgk4VhokQdZDgDeaXpHl+KBpkaCtGGqV7sQ97yREyhBCmJ1zEq9BujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkeMODVMeO6XSgC/syYB8ZZoiKQgWrvipFbH7hd8alA=;
 b=XmOD9nEuzGECdaoNAanXr1horZuC3RQzbhH7YtpT08ooGgyKWtisLoziFgjZxhuQT0Gvs4LOos39YFbiJAnCfdtGqO44mrR/b68pnX2yFSAPmOCwSK0/m9Q4OQTNcqv7s3IhKZTUo885ER6kpU6qVLcnQlfmiOY8pqdzcbMKJRw=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7128.eurprd04.prod.outlook.com (2603:10a6:20b:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Mon, 25 May
 2020 02:57:07 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 02:57:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/9] usb: cdns3: add runtime PM support
Thread-Topic: [PATCH v2 2/9] usb: cdns3: add runtime PM support
Thread-Index: AQHWMVkYPq6RZ5FAi0i84/sZydlQQqi2vdSAgAFf8IA=
Date:   Mon, 25 May 2020 02:57:07 +0000
Message-ID: <20200525025731.GA16948@b29397-desktop>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-3-peter.chen@nxp.com>
 <VE1PR04MB652836D56801C440F3E3928689B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB652836D56801C440F3E3928689B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 86f8ee22-020a-4980-ef29-08d800574fef
x-ms-traffictypediagnostic: AM7PR04MB7128:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB712844EF5E883FB1D19EB71E8BB30@AM7PR04MB7128.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jxktg+bh/63Avd4CREacVdntT+PfwL+nQBK//DB6uq1sJmYQ6QhVyTwAHz3S/99zkjBifM9LT9kxEtN6L/Ey3ecRb1JvZcqp4V5/6RBaXjAnrs2PYww+DLootf+wa/1dpF4x3s9hnb3370UP8pzpHkOPIukb28Hir3PjK7WXo3gBtsBqT1r1ocW6khuABmVv7wZ5LgrF0crNxeomzyzR7t8ZA6bVepGKqhtHH0OetlnBog7KSRFy4njSIdcFr/HkD1KmwKaRxXAoqXN++vEPf6/8fb9wIXrj70b22RixZE0l5XLtRDogtQJZ/ThIScUiTrGzVmuwtzx02g3hDtbTwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(136003)(376002)(366004)(346002)(39860400002)(396003)(6862004)(26005)(4326008)(316002)(6506007)(53546011)(6512007)(9686003)(186003)(8936002)(86362001)(66446008)(64756008)(66476007)(66556008)(76116006)(66946007)(8676002)(1076003)(5660300002)(44832011)(54906003)(71200400001)(6486002)(6636002)(33656002)(2906002)(91956017)(33716001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oLUIfbsYLyr/Ptbk7J1reXbTbS1UFILZsb6Jf0kDNBQSl4UsdJAU1w6OQ9Je40+uTyNN/qkAqKqC2n2j4us4mlPMwnKAY+k23O0Dzweq7QvdjJl+LndDNY+gWkF5YcNYxN86mo2odEWO7oC8ykR6IqX5gALwIBawxhfOc+3DrGBA5ltbp/yAxraocpllC5AlsZ++19QrMpg3n2ZFwajuPACq/VM8IaxvJKsTCtC7iVuouyUZSEOFYK98KjsL0ro58GlITwx1EsZoKF5bAl90KTXxcZmzESAADQ5dN8ZwzXbttOGYNXRS3t8ZzyfnaO5xiXTem0EBg1al8clX/GKaL9ccSzeJZK4xnvziJl9DPFgaQFM08u70/ivr0sLggEoZNuTJfbXfwhVIoWF+K/b4/g2Br1BoDKL105GG3y1bPgr7HdkW2peoguVu/KrLCK5rXTwPxY0LgbiBtkJhoqArwQDURJfxBOA376ByvwpuF9s=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5C07F1E17B62964CBA82E0505E732FDD@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f8ee22-020a-4980-ef29-08d800574fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:57:07.5158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z634HHxUMtHDG32EC1f/b45numvVArkSEaHRzih8LAUuEjqK9xd7T9z1nvfsPy5KtYUUEt6GQ52exF2K9wTE1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7128
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-24 05:57:53, Jun Li wrote:
> >=20
> > -#ifdef CONFIG_PM_SLEEP
> > +#ifdef CONFIG_PM
>=20
> __maybe_unused

Since there are several functions will be used in PM routine,
it needs to add '__maybe_unused' for every functions, So, I choose
to use MACRO directly.

>=20
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
> > +		wakeup =3D false;
>=20
> wakeup =3D device_may_wakeup(dev)?

No, it is for wakeup indicator for both runtime and system. At runtime,
the USB wakeup needs to be enabled all time, not depends on
/sys/.../power/wakeup.

>=20
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
> > +		if (cdns->role =3D=3D USB_ROLE_HOST) {
> > +			/* Trigger xhci-plat.c runtime runtime */
> > +			pm_runtime_get(&cdns->host_dev->dev);
> > +			pm_runtime_mark_last_busy(&cdns->host_dev->dev);
> > +			pm_runtime_put_autosuspend(&cdns->host_dev->dev);
> > +			/* balence the pm_runtime_get at cdns3_drd_irq */
>=20
> %s/balence/balance

Ok

>=20
> > +			pm_runtime_mark_last_busy(cdns->dev);
> > +			pm_runtime_put_autosuspend(cdns->dev);
>=20
> A simple
> if (cdns->role =3D=3D USB_ROLE_HOST)
>       pm_runtime_resume(&cdns->host_dev->dev);
> in low power event handler can't work?

I tried, the pm_runtime_resume is sync pm request, it will cause
rpm_resume nested because the cdns->dev runtime_status is resuming
(it is during the runtime resume stage).

Using pm_request_resume could work since it is async pm, but below
are still needed to balance pm_runtime_get at wakeup interrupt handler.

+			pm_runtime_mark_last_busy(cdns->dev);
+			pm_runtime_put_autosuspend(cdns->dev);

>=20
> > +		}
> > +
> > +		enable_irq(cdns->otg_irq);
> > +	}
> > +
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
>=20
> Seems this hasn't been used, I did not find the implementation.
> this role->suspend() is only to be used in system suspend but not in runt=
ime suspend?

I don't change it in this series, it is used for system PM.

> >  int cdns3_hw_role_switch(struct cdns3 *cdns); diff --git
> > a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c index
> > 58089841ed52..292ea248c0ec 100644
> > --- a/drivers/usb/cdns3/drd.c
> > +++ b/drivers/usb/cdns3/drd.c
> > @@ -278,6 +278,13 @@ static irqreturn_t cdns3_drd_irq(int irq, void *da=
ta)
> >  	struct cdns3 *cdns =3D data;
> >  	u32 reg;
> >=20
> > +	if (cdns->in_lpm) {
> > +		disable_irq_nosync(irq);
> > +		cdns->wakeup_int =3D true;
> > +		pm_runtime_get(cdns->dev);
> > +		return IRQ_HANDLED;
> > +	}
>=20
> All low power events go through otg irq?

drd.c is built into core, so no matter, peripheral(host)-only or=20
drd configuration, this drd interrupt handler are all called firstly.

One thing needs to change at next revision is I only consider
the interrupt number are the same for all three modules
(peripheral/host/otg), I will cover the different interrupt
number use case.

Peter

--=20

Thanks,
Peter Chen=
