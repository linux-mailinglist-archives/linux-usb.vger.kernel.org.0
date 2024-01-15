Return-Path: <linux-usb+bounces-5041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D554982D337
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 04:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E3EA2815AD
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 03:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C6D17F6;
	Mon, 15 Jan 2024 03:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="h2G73QQw"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7C51841
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyVtZiYsZRCXc4wHCgnnamvWlnVfBB4aelo8fpY5OPA0Ytj/dK7Juig/kIDAaSL2UONfCNP8i1dwJp6CADhbF/NoIXXT+iYTTOb7Su+3E/Vm62qcVE1KJPoMz6NJGjhe002Cgf5ipbzPawWniOQ7tPQt0evDTDileNAvbBEXqCdm8qmMs+jK/i/vjrjr40HOe6FNOgnrk4VqutUHd2lJyH93sZVDx9Qt6LugmBqU2ZZeL4i1h1n39xUa+yuzl3ddizyBM+nWHxWwryA39TlDEgAxpwangyuIo4xKN8Rfe2SPiuTuEPvMzIHoh2WUdipQPs6MaX06Z8aDKuuBXAUwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWEDvtpWYsbEQHkl0MpldgmhvTa8nJ2jLGDCKFeEoJs=;
 b=OopRJul2rszMJ3aDbkRn7s62nl9oAlutdE2IidqpVQtsAhN26Mu2thSLeOZmksVOrunGY8ErSWVvCcPo1ybxvyx712X55qy7ugWL0IwGQB45/a/lnzEjn5CqDQ+wrq/nsjNHSyxhp2dFGSUKuzyPxgYJ4mQD3N6EMwu/gc3aAandWoYRgy9DuthzqbnfiJKk4C3rJnBq5yt+YYj2aAP11K1pJLoGOBvEjjSd5KUpFZ2tTG7oEqX8yBGEslSiyvJjwKEqxTPHSPdunVJx0VDH1auJTY26oUJn3Ysfz8zW5z+kBUgz7TfGmKsfuqOt5R/UXUiyqCav8TCGHkPAgEs39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWEDvtpWYsbEQHkl0MpldgmhvTa8nJ2jLGDCKFeEoJs=;
 b=h2G73QQwXC/mUwNGhqZIYRtCCJC0KeSzD9naTaEODsXFphyTb0LKz3oq8c5/hkKyyg3+LxAipRRZgI+siZpMiwSBSjjXRzOjAF2Cypi4g970GGLxQEydobyzLcdSe3AZHPE4h4J8B64M8aeLAZdfVuV8wlhJ1njS2hiKdwgnpaw=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8367.eurprd04.prod.outlook.com (2603:10a6:102:1c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 03:02:06 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 03:02:06 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "ivan.orlov0322@gmail.com"
	<ivan.orlov0322@gmail.com>, "heikki.krogerus@linux.intel.com"
	<heikki.krogerus@linux.intel.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Jun Li
	<jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Thread-Topic: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant
 modules
Thread-Index: AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQIAATzkAgAPzOkA=
Date: Mon, 15 Jan 2024 03:02:06 +0000
Message-ID:
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
 <2024011213-situated-augmented-64a4@gregkh>
 <2024011220-asleep-dragster-1e39@gregkh>
 <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <2024011214-disbelief-sincere-805e@gregkh>
In-Reply-To: <2024011214-disbelief-sincere-805e@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|PAXPR04MB8367:EE_
x-ms-office365-filtering-correlation-id: 2bd59fc5-aa71-4dc9-cd9b-08dc15765b7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UbnDrSHkCG0p6mYeEtqg3aWVJZq5Jvsgy/4FVsI0D35AiZ+xCXoBWoO2oJvAkGHmCogSsjORhw4iW9sWj1sXsnB2C/LHNLnOqOG2Ge2c9uO13QeRlzz8bq1leeWLWhvYqXW78i7Uj/ILzFml3c2n/xKQ47JBqDt4VQWaUyEhFErBH6NFGNzstHpfb2Y2eeKIXOPInn/5LNbsYjaPdN8yWo/NTYeV/C4CNml1WMORRUUQRHcms8phprNmcStRbxmYua2CyGO/Ogfxt+MwpBRdNI0cQhIrClOZQrCfXyRMs4BbXpvS+E2aZZpSaPLqbXz/KIuI/ZifQfM1tNycRldiF09MIcJkuDMvSFoWa67J2bWjsfnWMrFSIxgk/1YQytcN8xZ/7BrUD6ES/gHcxFIPVJgr0Ppge2A/Xw5V1Sfm3sN1sr51mow52nT3Br4cwDfzQuot9W2fR3QGO+7N32DWSQAQC11CejnniTtMxmdjVyELVoZi8nGscEGsG50v9Mc4wTvpbvv+1eXUnYfIUS5phNGDYftzC1UUbvy76p8N9JkidFtjYfIy8fQzTjkVPBuJitQHjMt5IT+pt5Esc3g3PrM/QxomsW2yYo6iEsJpkh8Oct95uwRdK1BVVROktGdP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(55016003)(33656002)(86362001)(38070700009)(7696005)(8936002)(4326008)(5660300002)(52536014)(122000001)(71200400001)(9686003)(26005)(38100700002)(8676002)(66946007)(316002)(66446008)(6916009)(66556008)(64756008)(54906003)(76116006)(2906002)(66476007)(41300700001)(6506007)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?l1/HLqIAZ21d44uJV+X7rnKzVgFKdtsBdCkA4cgZn3b/eRU8VZs90u0EmV5g?=
 =?us-ascii?Q?uKYEPHBwoFa8sSioECiSf+oQdj5/ro79GPtg3pAP5cMbbbOSvSmCvZTLHRDT?=
 =?us-ascii?Q?FI0E1LV71JRf1lawx0MavpExPrINiqn8twMQPXNZbdGTx0Kt13Su/LxClLY2?=
 =?us-ascii?Q?9AUxvJsS7ng97Z3vs2a5fCLGHJH9O2Wqs6/ckgbGXu7FYAK6RNc5Fgrvt/5R?=
 =?us-ascii?Q?G7Ai4WTWK2KNm5Z+9zX4ugufSiD+DkiO3pfjSTEs010AZnZuw6FT19In3EOU?=
 =?us-ascii?Q?qd0x79vxYhEVwWNYKPaQpRhA2Wb4+nGobYeJx4xWZudcn62Qt7SgsdlWAdga?=
 =?us-ascii?Q?3RnuteGYO44ZvlUhP0BpNVg47jd2vB3QitcvPf8ujNZfg3A/zB1ETWuJyoGK?=
 =?us-ascii?Q?VbEWLOh8IGshYE3pI6AKLEJEsqFeEoNaaYMPVwLangxfsYfOKEVsYpr7slJl?=
 =?us-ascii?Q?yQVjyguaQj0tyCnRUyaPgzoZqq+X3qZv4sTTDAoyo99xsTS2JwqqJmWrfoFu?=
 =?us-ascii?Q?9eF4mWVo/bt7X+BFJaH/GR0YKFSDibVbqhzQXiHUc4Z2YXYqxbFfyEyCyeSx?=
 =?us-ascii?Q?9ReGImziQdOfsK0ZdfmTCj+sQDk7za3Q+6b1fiA0LZr87UdBvHkaKa9WihBJ?=
 =?us-ascii?Q?G4qDiJ6rO7+dAQXFB7ZTlpAgopKS8unfnWflHNDWVqsdfOajfLNgmY8gi9Je?=
 =?us-ascii?Q?0a3tWO0b0Bpw2a/CsHFcw5cQvvg88AXOcDbuOvJIsXqyBDrz5acN/2Qnul6P?=
 =?us-ascii?Q?d6t4dOe5HOkPUIhD8Jxgk8DqlO9Q8wm5zkC2i93wm3s0tmCKnqVVfC2XNbDv?=
 =?us-ascii?Q?M26w+0h0DJsfPBxXSSt++TUVHez5SOF0gas6EAYg3Vu2bhs4XzBnHrZlCzTl?=
 =?us-ascii?Q?P64lxJCw/luC85pGS5iRYHQuH9otNX4SmDuJ5DLr8S/T6NP6eCW164jAj7ek?=
 =?us-ascii?Q?IxPsmgkkS1Gwns4HxRFfwp0UTNBlIwBxOB3duP6HoA1sTT7QkHqgoFDXslIv?=
 =?us-ascii?Q?jGt0rUs4HsvQ1rJtWc8S0cg3+itjqRvcsUtDh8LN+K0Pd64/sCh3hlD0Enlm?=
 =?us-ascii?Q?1lhZqnL8QzpEFruPD3g9Q+upSoTVa+iUE++4gwq0miaaYhT+wFBRzbim+wNv?=
 =?us-ascii?Q?vG4C9u46jM8gPJMGYLWYqU3iSvR0lJJTD76TxzEAPVu0z4ZNHyWVJpS8OME8?=
 =?us-ascii?Q?MyNhWbN0sjcmm9/svlU2NQDvZovd3ypo/Gblh5iSdbNi044KUsE8blV0B5yv?=
 =?us-ascii?Q?E2QN3TPqyG3QSshlP4C3dKRyGNR7tFmy712B42wWjWRU8DA9GWDsu49HoJSU?=
 =?us-ascii?Q?rM0e8WWf0yezcJ3I4QQPDDnUWa/e2dq/r/gQwxnunQj06IEwRkZU8KjMkhfP?=
 =?us-ascii?Q?vSFJXVka4iiTCryEN4boYVgIqkbSJ3OQtmk0KiTP076HjD/cnp8SW9ZVW3Wo?=
 =?us-ascii?Q?Dj0AkQvE4tqrhOeVl8vv1C7prsCLBPngAgUjN+qV0LiXZMdo/sNCvRfwe3rO?=
 =?us-ascii?Q?zblZuNP/xSYNay5ghkkI5mldKnmKQ+KuzlsT4BujGwH7MVr9YLw4NLoFp7FS?=
 =?us-ascii?Q?XvkmnoZq+czwMaV0f9A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd59fc5-aa71-4dc9-cd9b-08dc15765b7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 03:02:06.4620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: siI2DsE4sf0B4UU9/nRuBe5bARREyjn/kVqnxC60pEDrtqX07N7t7OX3hQTktpd9jwa/fyfCfNqUKsWWCqMMTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8367

Hi Greg,

>=20
> On Fri, Jan 12, 2024 at 09:28:04AM +0000, Xu Yang wrote:
> > Hi Greg,
> >
> > >
> > > On Fri, Jan 12, 2024 at 09:24:11AM +0100, Greg KH wrote:
> > > > On Fri, Jan 12, 2024 at 04:01:08PM +0800, Xu Yang wrote:
> > > > > +void usb_role_switch_get_modules(struct device *dev)
> > > > > +{
> > > > > +   while (dev) {
> > > > > +           if (dev->driver)
> > > > > +                   WARN_ON(!try_module_get(dev->driver->owner));
> > > >
> > > > You just crashed all systems that have panic-on-warn enabled, which=
 is
> > > > by far (i.e. in the billions) the huge majority of Linux systems in=
 the
> > > > world.
> > > >
> > > > If this is something that can fail, then properly handle the issue,
> > > > don't just give up and say "let's fill the kernel log with a mess a=
nd
> > > > reboot the box!".
> > >
> > > Ah, I see now you are just moving the code, but please, let's fix thi=
s
> > > properly, don't persist in the wrong code here.
> >
> > This is a true module dependency issue and it only occurs when
> > load/unload modules. The dependency of usb controller glue driver,
> > usb controller driver and the user driver (such as tcpm) of usb role
> > switch is not correctly established.
>=20
> Then the driver model is not being used properly, as no module
> references should be needed here.

Taking below diagram as example:

     ci_hdrc.0        register   usb    get     tcpm_port
  (driver: ci_hdrc)  --------->  role  <----  (driver: tcpm)
         ^  ^                    switch           |   ^
         |  |                                     |   |
       +1|  |           +1                        |   |+1
         |  +-------------------------------------+   |
         |                                            |
     4c200000.usb                                   1-0050
(driver: ci_hdrc_imx)                            (driver: tcpci)

1. Driver ci_hdrc_imx and tcpci are built as module at least.
2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.0 device
   and try to get ci_hdrc module's reference. ci_hdrc will register
   usb-role-switch device.
3. When module tcpci is loaded, it will register tcpm port device and try
   to get tcpm module's reference. The tcpm module will get usb-role-switch
   which is registered by ci_hdrc. In current design, tcpm will also try to
   get ci_hdrc module's reference after get usb-role-switch.

>=20
> > This patch is used to adjust dependency of them, without it, two issues
> > may happen:
> > 1. "NULL pointer dereference" kernel dump will be shown
>=20
> For when?

4. Due to no modules depend on ci_hdrc_imx, ci_hdrc_imx can be manually
   unloaded. Then device ci_hdrc.0 will be removed by ci_hdrc_imx and
   device usb-role-switch is also unregistered.
5. Then, if I try to unload module tcpci, "NULL pointer dereference"
   will be shown due to below code:
  =20
   module_put(sw->dev.parent->driver->owner);
  =20
   parent->driver is NULL at this time.

>=20
> > 2.  The reference count of usb controller module may never decrease to =
0
>=20
> The reference shouldn't have been increased as you want to be able to
> unload the driver if a device is still present in the system.
>=20
> So I think there's a larger issue here, module references shouldn't be
> incremented just if a driver binds to a device, right?  Only if other
> code is using the module, which is different.

6. If ci_hdrc is also built as module, the module reference will keep at
   value 1 at least due to it failed to subtract 1 at step 5.

This issue is observed on chipidea and dwc3, the usb glue driver shouldn't
be unloaded befer tcpci module.

Thanks,
Xu Yang

>=20
> thanks,
>=20
> greg k-h

