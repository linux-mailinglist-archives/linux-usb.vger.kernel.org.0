Return-Path: <linux-usb+bounces-5524-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21EA83D2EB
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 04:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A950728CDF0
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 03:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16512A944;
	Fri, 26 Jan 2024 03:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="jA682AF1"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2089.outbound.protection.outlook.com [40.107.105.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B78831
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 03:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706239389; cv=fail; b=iYbuUGo2b+gcYU8MaRKi4N/oUgiamXTbAQhKElfWmrTC3BgXgyCnVc2DkzOOB4i8X8Gss+JyPgHzEBJiHJxbx+RbcCKlX4+JOs8jbqyEya80njPO3TFxtQyYFjrajiBMsR91jGLP5mkn7JQRfoe4zz5CLdg1dv0nKuvhUyNRCgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706239389; c=relaxed/simple;
	bh=k+Tr02hKK/Ost/Gcq7xgPIetmd8EigpX8AurXRgXWlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iPSoHIW+3Xvc0LeTHRvksQgKZ3V+yt5LlLedkA3GCsF+FIe6VQ+MqiBqxymAqbQPNTecgdjJNTVbpElomqJs7f71k97BWz/E2vmeXVbg73F1hx0KeCNH4phWh8x3P42OPFutXVny/612E/jqeE42YLS6AUVyTov/IZpKH/NyA7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=jA682AF1; arc=fail smtp.client-ip=40.107.105.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpWbo/69EZKt9kfdxwMljRF69GaVLPyA+OO6wp8n4g6LXvr7CRLpAOWz2ZdG2SO539mrZlL1FxhcbOg81oT83uiCoKNRSQqtFiIcF8r/OiXQ3heuW4J8DW9nTY2/11NSw7X7icSHjxqnafkNG1V0yTvHT6TVmJMfPluW/ysBeGtUhzFnoBFUISvSJ0wfgz6dQkre7ivwPttSlYYfOqy01C4qV8BEGjeoo7wAWRBvIc8HmGptqt8E9wutwtAvPR86pUQH1XFCTjp1mLQunHgBgel7EihD4dSa8VUAnUd3tf+EhBAzH8CRg83nKPhhT16XoifSNX+Iz/DWEUAwsxtWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIeYn8VusQw8HOK6q9n+I+BiPb218uk5v1xgdFpb6zc=;
 b=i+vNpvBHXyA86BsfCMe4ykr/y0vAAkMJeFPjA9oWlt1BHdd8+7jF/KDZfJopE8mOy0HJJoyyp25K2ZqmvbHl8tAKVoj0gTg8jos19TgYAGkij45IHI2XK15vd48vjug0xQvdwU+oxwSplsL/M/FiQo/YyZnH/2kcLV3Xrw9bO/XhoSSdliklnypv3F2iRTokZGlkEPgp7XZqEcLATbQZA/pNjCa+dyo9Yfr4gcYLf4VUkKLtmRrwxx/qbeiJ3a1vAVv4T6Sf6PZ4BX4FSaXv8moYzo9m6gbUKK9wgDb89E3ntoUVhXC6/ZXkqc/Df2sRzSp/H9JkL/+3V+1HBVjbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIeYn8VusQw8HOK6q9n+I+BiPb218uk5v1xgdFpb6zc=;
 b=jA682AF1uvJJMeMlo6Pb7y8bp9j3i0+dytUTRKIcSf0lOldeeQcY9zZCiZQf0BpymHZCoxl1eJw8No1pmsa3flkmEl2BgYugGLwiICP2erFOrBPqIZuws0+95yAQ12O8uAAOY/fVooM0Dk3M/6udzzIOJqUv+jnzs2mcdlR8Wlw=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS5PR04MB9828.eurprd04.prod.outlook.com (2603:10a6:20b:678::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 03:23:03 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 03:23:03 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "ivan.orlov0322@gmail.com"
	<ivan.orlov0322@gmail.com>, "heikki.krogerus@linux.intel.com"
	<heikki.krogerus@linux.intel.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Jun Li
	<jun.li@nxp.com>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: RE: [EXT] Re: [PATCH v2 2/2] usb: roles: don't get/set_role() when
 usb_role_switch is unregistered
Thread-Topic: [EXT] Re: [PATCH v2 2/2] usb: roles: don't get/set_role() when
 usb_role_switch is unregistered
Thread-Index: AQHaTpAaiJf9VtcwHES+n0m/bMBudLDo52WAgAJ9YtA=
Date: Fri, 26 Jan 2024 03:23:03 +0000
Message-ID:
 <DU2PR04MB882283EB45C4329A021D5C148C792@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240124064554.1263339-1-xu.yang_2@nxp.com>
 <20240124064554.1263339-2-xu.yang_2@nxp.com>
 <2024012442-delivery-knee-503a@gregkh>
In-Reply-To: <2024012442-delivery-knee-503a@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AS5PR04MB9828:EE_
x-ms-office365-filtering-correlation-id: a8e5eb14-87ac-4523-ec8a-08dc1e1e1b74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Uro3tVHVpHed2mYfbavCfGTNVHS5ldcATJw7CDf+0Qa3lYHQupt0NSR0BebUrLglr+0GZVQPKlrTTHLNJkn80WhyanOKEV0lCodKqTfrqbmCBcUxYn6bqPMvHqVT49elKLc+WUkqF8ow7mbrOmtNIBspCTpW07aSNaYrrZsCkc9PYAUlCTIltZ0uK58azKYwvEzdlP3Hd+rg2BBkFnIG8O9fpjTyRYsuuyqQgkdBBaXMvLBPG4Lecl3Y6eIFeRC817hvR0nsHF20BU8JtNG5Afgv85RVh0AHApTBCRaPqW8wmOOZq/7B+EPDf+i9jSBSuiMJQAwyy2FZy/tisMgzWJeuJxg7mZszAztmeOL6iuJxM9gY1wPwaaMlXz7ZKtOKUQlZwv1W0WOJy+P5cUbR4o4DtEocXn3qmCSGpKQ/TLk/KW4YM77lP10nVAaqagfScTjoDyXTbQ2bXEcfCTdcKyP5up5ZfCZ/bpOOndZ5Ny/QUnKNUKp8OQFkvMKBnjns+9eYKrar2AKM9vq7oxDN+1KZKcQYnfITxOlv4fvY1zYfOnVcgfyzumdZ7FWX5MxxFLQALjTVVo8VhAVfGzQgf3cirFo7ePL+m3YqZLd/8x9HoM4gTwnwnaKL/4VYKvkN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(33656002)(83380400001)(2906002)(5660300002)(52536014)(122000001)(4326008)(38070700009)(41300700001)(38100700002)(478600001)(71200400001)(26005)(55016003)(86362001)(54906003)(66946007)(76116006)(66476007)(6916009)(64756008)(316002)(66446008)(8936002)(8676002)(9686003)(66556008)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4jpxJOaWemjKUWJILB6g5S9M9UBkqyR696DbiYwmlKxMInME+g0Tgfr6XIcU?=
 =?us-ascii?Q?RwX19LhtKNPFyUBmIPki5qBig9QGHBJdovqRfEpluhGBEylpoWmbDxhE/bIh?=
 =?us-ascii?Q?b2SzDCXyTNutFUmJVYwWpe9iDyzO7WIyCsfdw1fFQ9BigiazmUeoo4uamB1n?=
 =?us-ascii?Q?BQBrwoFOgXQAKrtPGLfEXgkyfCVIEpW8ZFPk3SIwIjs0Nmi3WA7mlUdAokjg?=
 =?us-ascii?Q?RbPfN9aCAV5hID5t9yhGStnhzn3LbmKHyLJ6uGW2a8PROkLJ/6MsL2fz3eGl?=
 =?us-ascii?Q?OVmjlLaMiUI12KaO8+SimZZNbfLO2QkMebhW0/YXvxhCd21q0NRXhqAJ8n+g?=
 =?us-ascii?Q?ry80zc5nwD+yA6Lu6AgfcAXPkcBJA5ZBrjTTInVWLP2s6HMv+5v36RMQbVeW?=
 =?us-ascii?Q?EayNMWYTdY9AsdGuY4Js+n5LzIAVVr04tuFXUaqFFlVwNNXVOyAYPGFhUh6h?=
 =?us-ascii?Q?gvE677gMBrXm4UXMgKwxwDopFBsdybijyBZdu4yBdiVr20f63ax0lq3tcj+U?=
 =?us-ascii?Q?/Zx/cG5mW0XnlYIIpih3L0r6L1SyptyFCNEqJgKrFFZfCZY5GpMiIKvvdlDi?=
 =?us-ascii?Q?/iW33pMUW6dY3MWfhj15zuV2exGSsDEBBZsCS/l+9LuH9dKRyuOJwYj8bcLW?=
 =?us-ascii?Q?Cd0+Q19g6p7XnYqAmsDwH0eF0qfB92aDDxg7XEY/eaM6UkQGhpaofGC0tDRW?=
 =?us-ascii?Q?NNS6qFKet5TrXdUiW2609UqaiR69Fw+U/uvl11B+RvTxuOBwn7AZzqzymvam?=
 =?us-ascii?Q?keBT5smzb5YG7SZg3Q0MB7aseWyHi4J6gzDNTPUQenZoI9bvEPwUdnLjwHAU?=
 =?us-ascii?Q?izB47/5cAArkki0PoCtw7rA9ZfCd5kjRfnkzoZgNb0o7V1JntNUt7cre18SM?=
 =?us-ascii?Q?9xMg3OebvGiL9ZSt09x8adQbFCKoB16BRnB5vHpDTXVJ/cDvPwC1hhgeeVVC?=
 =?us-ascii?Q?iUscJhIGrRLd6k8Y9ZdF2P7RGoZhEnMMKVk192vjPm38afrjxKfcCg0vIaSv?=
 =?us-ascii?Q?cunydDCxpgbLECfm9Eqxi00hCRBqzDwoCV0mKxd30Spf6jfh7sgCkOTq1KJv?=
 =?us-ascii?Q?x6s+gnfaR/3kkETZlHS29T+kd09bF7fkclH3iF+kGjSp43N3bCM85Epuc5/I?=
 =?us-ascii?Q?fXO0CyqJLMssh8tObBbfMaBecaIJ7iEOwpa98fbKtdaArU/0AYtI9fM0y59r?=
 =?us-ascii?Q?QWgFdySdNrw3U8QSIs2eNCHqyXd/zMSRwhor4wogLCi8j6h3k1wjpoYl4zjC?=
 =?us-ascii?Q?MGyML82TgJqn+oag9HjjXEpsZtb25djw/WtU5UB3DiXEkKEP8KhCXxuZAfEE?=
 =?us-ascii?Q?hYcIaNIHvwSlekirt+rSHsrJ9Tu6f8pQEpPaB2WsSkRRpupS4X8ACo3xlQMK?=
 =?us-ascii?Q?EeSxjqXcy1wgWVrEHAhHG/L464fuFPmTIMcroO5JkWXiJzIKdR+ACWZ8DD6e?=
 =?us-ascii?Q?X1o3McvxFr66JsAYrSyyX69J24si6Gb9kVqQZ8dcardHK3/69qLtBBLUJrI/?=
 =?us-ascii?Q?mL4ZYT4KL/DkbhsWbPoz+oPY7BzdzXNABKCN+v2Bnbzg+jCQsgzcGuYN8gSm?=
 =?us-ascii?Q?Bbf7DpMQJABnZKJJuDc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e5eb14-87ac-4523-ec8a-08dc1e1e1b74
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 03:23:03.8032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NKAwNjTFzPYdihVBkgSHUu+ymITQgUGgpKyvUEasiB9Trroxl7AyLcIzwXiScGCTEGz54PMibhGEFpoa+wELw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9828

Hi Greg,

>=20
> On Wed, Jan 24, 2024 at 02:45:54PM +0800, Xu Yang wrote:
> > There is a possibility that usb_role_switch device is unregistered befo=
re
> > the user put usb_role_switch. In this case, the user may still want to
> > get/set_role() since the user can't sense the changes of usb_role_switc=
h.
> >
> > This will add a flag to show if usb_role_switch is already registered a=
nd
> > avoid unwanted behaviors.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v2:
> >  - new patch during test patch 1
> >  - add registered flag
> > ---
> >  drivers/usb/roles/class.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index 2bad038fb9ad..70165dd86b5d 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -23,6 +23,7 @@ struct usb_role_switch {
> >       struct mutex lock; /* device lock*/
> >       struct module *module; /* the module this device depends on */
> >       enum usb_role role;
> > +     bool registered;
> >
> >       /* From descriptor */
> >       struct device *usb2_port;
> > @@ -49,6 +50,9 @@ int usb_role_switch_set_role(struct usb_role_switch *=
sw, enum usb_role role)
> >       if (IS_ERR_OR_NULL(sw))
> >               return 0;
> >
> > +     if (!sw->registered)
> > +             return -EOPNOTSUPP;
>=20
> What's to prevent this from changing right after you check it?

Usually , the usb_role_switch device is unregistered after usb controller
device is removed.=20

Such as dwc3 platform, if the usb controller is in device mode at first,
dwc3_gadget_exit() will be called when removing dwc3 controller device
by unbind the device. If typec port changes to DFP, tcpm will set usb role
to host mode and usb_role_switch_set_role() is called. Then dwc3 controller
driver will call dwc3_gadget_exit() again to switch from gadget to host mod=
e.
But this time kernel will dump NULL pointer issue since gadget resource is
already released.

[   46.065015] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000008
[   46.074030] Mem abort info:
[   46.076915]   ESR =3D 0x0000000096000045
[   46.080742]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   46.086155]   SET =3D 0, FnV =3D 0
...
[   46.272542] Call trace:
[   46.274986]  usb_del_gadget+0x44/0xac
[   46.278651]  dwc3_gadget_exit+0x20/0x7c
[   46.282490]  __dwc3_set_mode+0x280/0x3ec
[   46.286408]  process_one_work+0x138/0x248
[   46.290421]  worker_thread+0x320/0x438
[   46.294173]  kthread+0x110/0x114
[   46.297406]  ret_from_fork+0x10/0x20
[   46.300992] Code: f94186a4 d2802002 f9418aa3 f2fbd5a2 (f9000483)
[   46.307079] ---[ end trace 0000000000000000 ]---

In chipidea platform, I also get below kernel dump.

[   78.499672] Unable to handle kernel paging request at virtual address ff=
ff8000822a51a4
[   78.507588] Mem abort info:
[   78.510366]   ESR =3D 0x0000000096000007
[   78.514102]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   78.519397]   SET =3D 0, FnV =3D 0
...
[   78.705713] Call trace:
[   78.708149]  hw_read_otgsc+0x8/0xf4
[   78.711632]  ci_usb_role_switch_set+0x94/0x2c4
[   78.716069]  usb_role_switch_set_role+0x44/0x98
[   78.720593]  tcpm_mux_set+0x5c/0x80
[   78.724069]  tcpm_set_roles+0x64/0xd4
[   78.727717]  tcpm_state_machine_work+0x2350/0x2ff4
[   78.732502]  kthread_worker_fn+0xc4/0x174
[   78.736506]  kthread+0x110/0x114
[   78.739721]  ret_from_fork+0x10/0x20
[   78.743295] Code: 88dffc21 88dffc00 f9405c02 aa0003e3 (b9400042)
[   78.749377] ---[ end trace 0000000000000000 ]---

Maybe these platforms lack some checks about the resources. But, first of a=
ll,
 ->set_role() should not be called at all when usb_role_switch device is
Unregistered.

>=20
> And why is this patch not cc: stable and have a fixes tag if it resolves
> a real issue for people?

Sorry, I forget that. Will add it in next version.

Thanks,
Xu Yang



