Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89B51E1941
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 04:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388434AbgEZCDW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 22:03:22 -0400
Received: from mail-eopbgr60083.outbound.protection.outlook.com ([40.107.6.83]:31554
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388351AbgEZCDV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 22:03:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9+OwpvUbfl15oVtG8a2XZX0IEGcH5g528dYIMmYk/8Pcgua2a13AJlq0GSrO3GRHiY31XDyp2tXNltOCd51LYQVsAjBoR3PZJnyKN7jIhhNyMDiHf4RHO2YdiyWLTzcpqfnOqhlVKOXWdgV1bYIftajoGUG2o4zCFb1OCPQ3j7aOFaZTOE6h5FebhBZ3Fx2roC87c/LVD5upMKLb/GzsLDsk2Rfk7qpLHOgS1frGBEHZKP+ouTiwnGKmA0nJLzMMzp+ATpKQKSxw1dPA1NqdxXp5E89Za4G+Qf23+7LXS43SZAzClJ4iFOYDh5NHoW59YuuggGi0BKg2U1M9fpOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1jA8sxjbGHkOlXFXGJFmt0PCv/eQ9e+FNBSB4qQJ4A=;
 b=fgJ3uX0TfheIHQsMj/4jfgdVypjNYAvK9Uc+C43jaLrXlY8svxEXSP7phkpbZyJwJ0J2+Fy32mLg5Ed3dAXniK/yRNEh+kbNgzHLeWBGrv8jrD2js65fKKhW3eGpDE44vYrEJroHj8Dw9SP0wd3TVUaTEvwJgaG7g/jvxZ7b4dOPhZFZV9o60prNz1r0GctmbBQT4wNqzGLAa9S05YLZbwkUhssirLU5ijUruGIcwduiLZJ6kY6Dl/nf6t1+29Bzu2Q+lEb8sPxzrPqqehlxDPvmxHW+cE6s6FW36K7VWO30ygRzyLhGi6OnIkdy/2eHQmkKtrP0xJlYtZJzcdtdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1jA8sxjbGHkOlXFXGJFmt0PCv/eQ9e+FNBSB4qQJ4A=;
 b=WokYbjZD4hjpECwwl8Zppx0EbbSe81MZhJAr9+bex+7Vwe5w0Ih2fiQRYvQeVBzFFhW5BdcFSOJI8POFdz1lzV1k0KBuHGwRyL8ZPNzTKR8PBlnL52AaTpJ+S6MzFvN9QH/caZaKw1b8HgnvYn4gIEZk11by2NVPLMMbhN6H0dM=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 02:03:17 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 02:03:17 +0000
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
Thread-Index: AQHWMVkYPq6RZ5FAi0i84/sZydlQQqi2vdSAgAFf8ICAAJ4qAIAA5SIA
Date:   Tue, 26 May 2020 02:03:17 +0000
Message-ID: <20200526020342.GB27933@b29397-desktop>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-3-peter.chen@nxp.com>
 <VE1PR04MB652836D56801C440F3E3928689B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <20200525025731.GA16948@b29397-desktop>
 <VE1PR04MB65288EA1FEE4E7742049712389B30@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB65288EA1FEE4E7742049712389B30@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a9f9a6b4-3ba9-483c-d70f-08d80118f538
x-ms-traffictypediagnostic: AM7PR04MB7077:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7077B708934562294DB5EB498BB00@AM7PR04MB7077.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uIUOQCdj8P9NU+xIO9JSXFJEb5V9Ufn50cVNUBxufo2wOZxcrSD5VN867Pe2ATpbbDsX+VFgxLNWs3lChNXYj8F4leaO3KO6yn3mhblKfjdKyaMHOuprmkv3WI/5H91spJewvaLKy0vGaGFNP1V5L2JRGw55lK5gJ65+u2c3FaTblRNkEJs2oj05X6LsTuwLPQNDCzdLZZZavparp7r0uMu3XFS4ERFKqTcFa5dyyiCkm46sY6zt+Ac9+P/OQQHcGSGFbH1bjcGNDLe2d2S7jKLyu1vsERLSWviAAPnCqn0SAf0qL4LkJ9aTZGV3q7f9eiNeT4BeQenGrub57F4EGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(5660300002)(44832011)(8676002)(26005)(1076003)(6506007)(91956017)(53546011)(66476007)(33656002)(64756008)(66446008)(66946007)(76116006)(66556008)(8936002)(6636002)(9686003)(2906002)(86362001)(33716001)(478600001)(4326008)(6862004)(6512007)(186003)(316002)(54906003)(6486002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: /qxJFS5Mar/gMwbGB+5qXD7FtUMQtgKmqTOrtkgCFL7HeyUEqijLcDgmxPbPr0xWMMbZuHfG4IY5BxsrpfONdkIN+Qpn92KYcyoY0Wc9tUaiLSJJSaOZzoiXCTop+QLESco0sSsdJsX45JowCYb/E1X9hm/RbWaD1Y85OsKddUFBCJkLM2RMaKRKPp4mw0zc25TMxRxMMAx3EfqFJG0ABuB6LjOxRL3hUD0zWrruT64V964i12gKfG1mjRsKrlfdDfGvWUkXx6tabKYiFW3B2k0m7Z4YF8gFsAkIfmqnHpvWUHH/VmWlUqIWBKVLYh7jnvGdyoVyXvs0ycT9rSvFitRbgzjOXsQtzIAvWBIjYFzr3mEppBucQQypTntMNh7M4yBS/FhgBVcdbpSLHITKriJOAllG32YQh4iNQMj4wYK//+d/LnT2sXAJRbOjpyGz5kzh/o2FNSZBnSmeeyxSg8ewc0Pd5Ryo4zp4u+SiDAk=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <534EFA5D2279984EB2C19A234FDE0577@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f9a6b4-3ba9-483c-d70f-08d80118f538
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 02:03:17.7034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rz7fRe0Okoh03KbvZAwtUfW3UbQyRBalQzGIhCBezPum1ChgblIvZMgax+N5oTVnVYTKUVcm9AVrmULFxz/tYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-25 12:23:36, Jun Li wrote:
> > > > +static int cdns3_controller_suspend(struct device *dev,
> > > > +pm_message_t
> > > > +msg)
> > > >  {
> > > >  	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> > > > +	bool wakeup;
> > > >  	unsigned long flags;
> > > >
> > > > -	if (cdns->role =3D=3D USB_ROLE_HOST)
> > > > +	if (cdns->in_lpm)
> > > >  		return 0;
> > > >
> > > > -	if (pm_runtime_status_suspended(dev))
> > > > -		pm_runtime_resume(dev);
> > > > +	if (PMSG_IS_AUTO(msg))
> > > > +		wakeup =3D true;
> > > > +	else
> > > > +		wakeup =3D false;
> > >
> > > wakeup =3D device_may_wakeup(dev)?
> >=20
> > No, it is for wakeup indicator for both runtime and system. At runtime,=
 the USB
> > wakeup needs to be enabled all time, not depends on /sys/.../power/wake=
up.
>=20
> I mean for system pm:
> if (PMSG_IS_AUTO(msg))
> 	wakeup =3D true;
> else
> 	wakeup =3D device_may_wakeup(dev);

Ok, I will change. In this patch series, it only supports
wakeup for runtime PM. For system PM wakeup support, I plan
to support later.

> > > > +	if (cdns->wakeup_int) {
> > > > +		cdns->wakeup_int =3D false;
> > > > +		if (cdns->role =3D=3D USB_ROLE_HOST) {
> > > > +			/* Trigger xhci-plat.c runtime runtime */
> > > > +			pm_runtime_get(&cdns->host_dev->dev);
> > > > +			pm_runtime_mark_last_busy(&cdns->host_dev->dev);
> > > > +			pm_runtime_put_autosuspend(&cdns->host_dev->dev);
> > > > +			/* balence the pm_runtime_get at cdns3_drd_irq */
> > >
> > > %s/balence/balance
> >=20
> > Ok
> >=20
> > >
> > > > +			pm_runtime_mark_last_busy(cdns->dev);
> > > > +			pm_runtime_put_autosuspend(cdns->dev);
> > >
> > > A simple
> > > if (cdns->role =3D=3D USB_ROLE_HOST)
> > >       pm_runtime_resume(&cdns->host_dev->dev);
> > > in low power event handler can't work?
> >=20
> > I tried, the pm_runtime_resume is sync pm request, it will cause rpm_re=
sume nested
> > because the cdns->dev runtime_status is resuming (it is during the runt=
ime resume
> > stage).
>=20
> if you only resume the cdns->host_dev->dev, I think there is no
> nested resume, the sequence is
> cdns-imx resume -> cdns->dev resume -> cdns->host_dev->dev resume.
>=20

I only resume the cdns->host_dev->dev like you suggested for testing,
There is one more rpm resume for cdns->dev, see below:

cdns-imx resume (1) -> cdns->dev resume(2) -> cdns->host_dev->dev
resume(3) -> cdns->dev resume (4)

Trace log and rpm status like below:

root@imx8qmmek:~# cat /sys/kernel/debug/tracing/trace | grep xhci-hcd.1.aut=
o
     kworker/0:0-5     [000] d..1   144.830873: rpm_resume: xhci-hcd.1.auto=
 flags-0 cnt-0  dep-0  auto-1 p-0 irq-0 chi
ld-0
root@imx8qmmek:~# cat /sys/kernel/debug/tracing/trace | grep 5b130000.cdns3=
=20
          <idle>-0     [000] d.h2   144.830155: rpm_resume: 5b130000.cdns3 =
flags-5 cnt-1  dep-0  auto-1 p-0 irq-0 chil
d-0
          <idle>-0     [000] dNh2   144.830166: rpm_return_int: rpm_resume+=
0x114/0x758:5b130000.cdns3 ret=3D0
     kworker/0:0-5     [000] d..1   144.830189: rpm_resume: 5b130000.cdns3 =
flags-2 cnt-1  dep-0  auto-1 p-0 irq-0 chil
d-0
     kworker/0:0-5     [000] d..1   144.830875: rpm_resume: 5b130000.cdns3 =
flags-0 cnt-2  dep-0  auto-1 p-0 irq-0 chil
d-0

imx8qmmek:~# cat /sys/bus/platform/devices/5b130000.cdns3/power/runtime_sta=
tus
resuming

If one device is resuming, the rpm_resume will be scheduled, and wait
the previous resume finish.

> > > > +static int cdns3_suspend(struct device *dev) {
> > > > +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> > > > +	unsigned long flags;
> > > > +
> > > > +	if (pm_runtime_status_suspended(dev))
> > > > +		pm_runtime_resume(dev);
> > > > +
> > > > +	if (cdns->roles[cdns->role]->suspend) {
> > > > +		spin_lock_irqsave(&cdns->lock, flags);
> > > > +		cdns->roles[cdns->role]->suspend(cdns, false);
> > >
> > > Seems this hasn't been used, I did not find the implementation.
> > > this role->suspend() is only to be used in system suspend but not in =
runtime suspend?
> >=20
> > I don't change it in this series, it is used for system PM.
>=20
> OK, understand this is the original code.
> For imx runtime PM of this patch set, do you still expect this?
> (i.e cdns3_gadget_suspend() will not be called for gadget runtime
> suspend).
>=20

This code may need to purify in future for current mainline code.
The main purpose of this code was to disconnect host and re-connect
host after resume during the system suspend/resume. At runtime,
we don't need such operation since the runtime suspend doesn't be
called if the connection is there.

>=20
> >=20
> > > >  int cdns3_hw_role_switch(struct cdns3 *cdns); diff --git
> > > > a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c index
> > > > 58089841ed52..292ea248c0ec 100644
> > > > --- a/drivers/usb/cdns3/drd.c
> > > > +++ b/drivers/usb/cdns3/drd.c
> > > > @@ -278,6 +278,13 @@ static irqreturn_t cdns3_drd_irq(int irq, void=
 *data)
> > > >  	struct cdns3 *cdns =3D data;
> > > >  	u32 reg;
> > > >
> > > > +	if (cdns->in_lpm) {
> > > > +		disable_irq_nosync(irq);
> > > > +		cdns->wakeup_int =3D true;
> > > > +		pm_runtime_get(cdns->dev);
> > > > +		return IRQ_HANDLED;
> > > > +	}
> > >
> > > All low power events go through otg irq?
> >=20
> > drd.c is built into core, so no matter, peripheral(host)-only or drd co=
nfiguration,
> > this drd interrupt handler are all called firstly.
> >=20
> > One thing needs to change at next revision is I only consider the inter=
rupt number
> > are the same for all three modules (peripheral/host/otg), I will cover =
the different
> > interrupt number use case.
>=20
> For shared irq with the same number, disable_irq_nosync(irq)
> can really disable the irq?
>=20

When the controller is in low power mode, the normal controller logic
(peripheral/host/otg) will not trigger interrupt. The
disable_irq_nosync here is mainly to disable interrupt for wakeup
interrupt, and wait async runtime resume to clear the status, then
re-enable the interrupt.

--=20

Thanks,
Peter Chen=
