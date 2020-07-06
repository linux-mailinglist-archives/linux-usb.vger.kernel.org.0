Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981A321516B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 06:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgGFEDN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 00:03:13 -0400
Received: from mail-eopbgr80073.outbound.protection.outlook.com ([40.107.8.73]:2950
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725837AbgGFEDN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 00:03:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX8jRoiPubCVaC3kxhVIuVOi+B39RN0JZo5VpLCYWc3Aybjhi44YLI8UnuDykJDHZ7CbrtEB0XVtHtNUI8sa5O2DzWh3qWTha4+anLJRKihRE6nfOmX8Ui1X5Xu7kF805qZqqafR69Ua051WYwP1AqScuOEWmByHFlVbeKpz5giMPlZiP1Vkw5EKmwSlFP9Ye7IXb1uHRCmSz1MK1e5TPXeu2QRIC4k1Nh5wDsWY0LlJiNnOiTbgICWPd//+01jioOZ2qQJNKuCNl4dhGt12m3qlCu3/30xo1EXrXpVFco9Vlr8cP1BCumLZsQHNxWmNxtVkW5j1wjtiZX/JkLkDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTvkbsUQ0Y/F29oRhlnP1GciGLGAXBn5nq9Cksr4wRE=;
 b=StaHNBRDYoWMsnk7CJssRIwzk9+lQ7fW33jpv7MeMDR8evWD3Pw+ij4Mo2PZh00cZICsel+B9mRUJbTKvacd2jJy1dw1vePqlYVNt/aniFzR1/fn68A4k2SYLLvxu60rNNkAJBQc8NRX1K0an3LL0tFamkaZFyd+B9fo4GkQA62bE0koUqHKUBZjUO7cqxbjSoXeOfwUvH6FatbHxqblz5P3daeLr9jOg+iNOo371aHSr1LV+fJYLRvFXrXmNRMNauRXnGJINi9CyR1tXt5LiW0vWI6PRnZZCINTA+KEmkFWYKAm40VAQ1R3I+HANTeBusUsspZSr1QDXXHbFabWxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTvkbsUQ0Y/F29oRhlnP1GciGLGAXBn5nq9Cksr4wRE=;
 b=szEPRhhoxOjerqjvVGJ1+LgBzk6Ska96irObrKD0hrgvzElorqJ0VRHFxBJnN7sABAautnFJ0DwO/lnOOuoPC2svX3Xzj7eHuWGtiI/9aQHh9jWPKsuXgpfIdGwM/pfiSFs4s0Zt6zrQnlG7y40773sbhphFx52i3YR00/yQO+A=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6152.eurprd04.prod.outlook.com (2603:10a6:20b:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Mon, 6 Jul
 2020 04:03:08 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 04:03:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Topic: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Index: AQHWUQLEv7puXBnz7kavmyMm4fC5l6j159KAgAE/joCAAFrnAIAAv0sAgADOc4CAANPw0A==
Date:   Mon, 6 Jul 2020 04:03:08 +0000
Message-ID: <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200703062532.29076-1-peter.chen@nxp.com>
 <20200703062532.29076-2-peter.chen@nxp.com>
 <20200703141911.GA623139@rowland.harvard.edu>
 <20200704092255.GA5695@b29397-desktop>
 <20200704144816.GA650205@rowland.harvard.edu>
 <20200705021256.GA29527@b29397-desktop>
 <20200705143151.GA672371@rowland.harvard.edu>
In-Reply-To: <20200705143151.GA672371@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 30c40d62-7505-466e-d354-08d821617e4f
x-ms-traffictypediagnostic: AM6PR04MB6152:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB615227F303855DADDECE395D8B690@AM6PR04MB6152.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J0ZSWS/h0Kz7tSjOYdFVyckFGyk+dQFZb5JLeDzwll48XO/jIcrm8oVfqUbz4lVhwilLN3JO4NycDpUXNrBJYhOTCbO64AKkt7FDKtC9IavKYxA30gfQ+WzlauJ7W3vObzkXJpZ7eODYwiov5A4BfBHXJ0ki49RULvbgDYSIJRCapwf4eY2Et8u8Jf+uTRQIaa48d8dSk5zYKzr9VPpNCe+PhmjPhoUXx5g0AhZbR/X4bXCRIOpeURV9uzdtEV1ygrpEsa/GbHFZL4mx8cF4pNuSCOM7iwZz70ZCFQ9kads+g1en17IRiEImE/FSs0I4TQCqgmIUsJzUPRcVcVT4Cw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(7696005)(55016002)(9686003)(6506007)(83380400001)(186003)(2906002)(26005)(54906003)(8676002)(4326008)(8936002)(6916009)(478600001)(316002)(5660300002)(76116006)(66946007)(66556008)(66476007)(64756008)(66446008)(86362001)(44832011)(52536014)(71200400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: yvakH4wBL96Ba45tKnJmt9PjMZbT2hVA1ZcO+oYsTI+2DgvAnhma6gF+Rpcamew+BM69jElOF4M7tnkGz26pajcodcSmljhCLp5sJTn+yD3oi3Y4DRtCxiQ7qWjO+C6EeHy6rGoPpRQUyt3OnGIYjvFNkZFtpfpyUvVWh4K5BzMvMOo1xovTswEq8b3g4JzYQmqWhZkPtrZOYuin4Tqu+GDw4Mg0Q3k3asMTkJnLUr2st6eBHSDaIUtpK4KJemZba/lVRZIa12bdVPAI0RrvQCxWTkli2uxCDyudbJeXexdKUKsMG5nB1j0MyA4numd2euX05XrRYL8f1Gbk0h3fyuSgB39/q15BeE7iKEH8BNwWcrA1ZOUChsJCxNrLDGnJPoltd+bhWjdMEjVinrjySMkGHbU/7i1fyaEIYI8M/wu79XnyrffAlpWEA+MvVJ/Wd9hLwsgcg7ytKguKq39j6w0QY70ns85Hy1r9uCpw63s=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c40d62-7505-466e-d354-08d821617e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 04:03:08.6813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E62Ow1cjkdlAJjUW/52P85ymua+ijo7YHaB2vH2kHtgvAOiXylDo4MMgVz24f+h+wxcr1SebDHjZO4MhcybDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6152
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > > > > > ---
> > > > > >  drivers/usb/host/xhci-plat.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/host/xhci-plat.c
> > > > > > b/drivers/usb/host/xhci-plat.c index
> > > > > > cebe24ec80a5..bb5d73f0a796 100644
> > > > > > --- a/drivers/usb/host/xhci-plat.c
> > > > > > +++ b/drivers/usb/host/xhci-plat.c
> > > > > > @@ -287,7 +287,7 @@ static int xhci_plat_probe(struct platform_=
device
> *pdev)
> > > > > >  		*priv =3D *priv_match;
> > > > > >  	}
> > > > > >
> > > > > > -	device_wakeup_enable(hcd->self.controller);
> > > > > > +	device_set_wakeup_capable(hcd->self.controller, true);
> > > > >
> > > > >
> > > > > In fact both this patch and the original code are wrong.  It
> > > > > really should
> > > > > be:
> > > > >
> > > > > 	device_init_wakeup(hcd->self.controller, true);
> > > > >
> > > > > This will add the wakeup entry in sysfs and set it to Enabled.
> > > > > This is the appropriate behavior, as explained in the kerneldoc
> > > > > for device_init_wakeup().  The reason is because the controller
> > > > > device doesn't create any wakeup events on its own; it merely
> > > > > relays wakeup requests from descendant devices (root hubs or USB
> devices).
> > > >
> > > > Hi Alan,
> > > >
> > > > At xhci-plat.c's system suspend API xhci_plat_suspend, it depends
> > > > on power/wakeup value to determine whether the controller should
> > > > enable port wakeup capabilities, and from the system level,
> > > > whether the system supports USB wakeup or not is better to be
> > > > determined by user, and is disabled by default.
> > > >
> > > > Yes, you are right. The wakeup events are from controller's
> > > > descendant devices, and it is better to use roothub's wakeup
> > > > capability to control portsc's wakeup setting. At controller
> > > > driver, the meaning for wakeup setting is enabling wakeup
> > > > interrupt for hardware signal events (dp/dm for USB2, and
> > > > RX-detect for USB3), this hardware logic is the glue layer and
> > > > designed by each vendors, without this logic, the USB controller
> > > > can't be woken up due to the USBCMD.RS bit is cleared, and there
> > > > is no standard EHCI or xHCI interrupt. The controller's wakeup sett=
ing is
> better to be disabled by default, and decided by user too.
> > > >
> > > > For me, either this patch or use roothub's wakeup capability to
> > > > control portsc wakeup setting, both are OK. Mathias, what's your
> > > > opinion?
> > >
> > > Mathias is starting a long vacation, so he might not reply for a whil=
e.
> > >
> > > Note that hcd-pci.c, ohci-platform.c, and ehci-platform.c all call
> > > device_wakeup_enable().  This indicates that xhci-plat.c should do
> > > the same -- presumably device_set_wakeup_capable() is already called
> > > somewhere in the platform-specific code.
> > >
> >
> > Thanks for the information, Alan.
> >
> > I could not understand why device_wakeup_enable is used in these
> > device drivers? At Documentation/driver-api/pm/devices.rst, L189, it al=
so says:
> >
> > 	during a system sleep transition.  Device drivers, however, are
> >        	not expected to call :c:func:`device_set_wakeup_enable()` direc=
tly
> >        	in any case.
>=20
> It also says:
>=20
> 	It should also default to "enabled" for devices that don't
> 	generate wakeup requests on their own but merely forward wakeup
> 	requests from one bus to another (like PCI Express ports).
>=20
> The controller device falls into this category.  It doesn't generate wake=
up requests
> on its own; it merely forwards wakeup requests from the root hub or USB d=
evices.  I
> think the intention was that drivers for these devices would call device_=
init_wakeup()
> instead of calling both
> device_set_wakeup_capable() and device_wakeup_enable().
>=20
> In any case, the rule about setting the default value is more important t=
han the rule
> about not calling device_set_wakeup_enable() directly.
>=20
> If you're concerned about connect-detect or disconnect-detect wakeup sign=
als,
> these are supposed to be enabled or disabled by the root hub's wakeup set=
ting.
> The idea is that root hubs should behave the same as external hubs -- and=
 whether
> or not an external hub generates a wakeup request when a connect or disco=
nnect
> event occurs is controlled by the hub's wakeup setting.
>=20

So, you suggest:
At hcd-pci.c, ohci-platform.c, ehci-platform.c, and xhci-plat.c:
change device_wakeup_enable to device_init_wakeup(dev, true).

For xhci_suspend, use both controller's wakeup setting and roothub wakeup s=
etting to
judge if connect or disconnect wakeup needs to enable or not, like function=
 ehci_adjust_port_wakeup_flags.

> If the controller's wakeup setting defaulted to "disabled", then anybody =
who wanted
> to get USB wakeup requests would have to enable them on both the USB devi=
ce
> and the controller.  This would confuse users and cause problems.
>=20

I think if controller's wakeup setting is only used for ehci or xhci common=
 code, that's ok. If
it is also used for glue layer's power control and wakeup setting; it may n=
eed to set "disabled"
for default value.

I am curious how PCI USB at PC determine whether it responds USB wakeup eve=
nts or not?
At Linux kernel or BIOS? It has two places for enabling USB wakeup, one for=
 USB devices
(including roothub), another is for PCI device?

Peter
