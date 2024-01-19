Return-Path: <linux-usb+bounces-5291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72EE832C42
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 16:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 079C91C238CD
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 15:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FD254BC7;
	Fri, 19 Jan 2024 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="A29rKMj3"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5F854F85
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705677836; cv=fail; b=nfcPifDIKgVI2QvBZJW676ngADnQ/pAF6AjXJzhq2k1LIH5YdnsIaOuxqgMcoOwWGtFarBIudG308rD0GNJ4beVtZkCgKasLPBBljQ/BTG/l843ZPKCYyYUhFp6YLMgj6lrmaA3RVPdUTMAxl+Jm4UBe19ida3P1HZCMJG1OQm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705677836; c=relaxed/simple;
	bh=2E7EB26pb+1DrwoxHNIozM2lMo7ML29AA6CmvgbmhOc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m4TqAxEyDTl81fFxp0+PKLE6Xgtjhsn/bUKOi2gSwZBs6MrOKhWxKkoJFB11GF3gOYa3nNY7hF6i1HOnyfLFTaZvHQVJl2r7EXdopWMI4oH6e5K1jmbIvvUMoxfVppwVMspAh0xR5P2IclaKx3TllNDvnt4VBNRMPK21rmKe1rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=A29rKMj3; arc=fail smtp.client-ip=40.107.7.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph4lT7Qzi1b/RIHN+RmTBa8H/kqneUaUU1J6+EE2et8GkHpansub4WJc1v2nzkq0z1+26faqldE07fLRvJwsM0PlG0B9lRfHNtZ9EdqjELQlio9m+KEo/kVtK2PpbEgPL0H6Bk5337q0aHUVDzNYkJfYGpBiBVpHuAWLRW7uy6Bqp3/vD0sl5WE28JZEtiVHSN22jVrYHnD0LSY3NP2QcnlsDNrpZHcyTkuKgn8SVj4i/MHKyX61Bv9TIko1hSkuN4Kx700s/RlJz4mjuzYJXItGC2uBQVMuMUnGRLKmS0yv7GAvrB28gZcZ5crwTz6TYNkfI2v3O+RVRUts7NvFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mCpOSx1lT8uwL8du2xxXKG+p6jZ/5fxf2CV5Pn/P9Q=;
 b=g9shuSO8PYLB7yPR21F+4ZyEIGd3Adgwl+afqUVWEg3N5W7R1mPcVhxj1hIuDtxZ2l8XZub8R9h2jWnn0XcQCrxy4Igkt80ywf0teTTTsqEMuJzl8lFfq1iObMDXaKFlS+14R3200lQ1rMucNMqJKbF07IWqaHt8EBlbWB+gwPPU5uxVw2FRBYT9+zRI2OJq7fKPu7QZ5ztlA8wFk9JIEWFhCmo115MAQrSVPWVieuD0FrPMgp4me/UopMnkurn3VirT6w2Q2gn3bq7xSImGx4TXlDCxNwK70ybpyOgq1syNfuWGcQ9hd3Lsy+Byc8A3hwHlp6ck7i0mvmsruV3dVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mCpOSx1lT8uwL8du2xxXKG+p6jZ/5fxf2CV5Pn/P9Q=;
 b=A29rKMj3xTrAiC/UHxWkkBn4xYPLEIujoRLtraAxWhp0LepkFDJ+A0gVluiRd0Xpz2g72Cksv+PJC3zSjjs+DGVIVRV/p2SN4W6pg/Ex1Hxol1si9ixUCeEhXLtc5IY5ZSHJLXNgXPqx8BLa2UEhyDPS8eseNwCtp5el67GkTUg=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7687.eurprd04.prod.outlook.com (2603:10a6:20b:291::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 15:23:51 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:23:50 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg KH <gregkh@linuxfoundation.org>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Thread-Topic: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant
 modules
Thread-Index:
 AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQIAATzkAgAPzOkCAAPAvgIAAx6/QgADCqYCAAOYvsIABzm0AgAAIywCAAC42AIAAJc0AgAE+Q5CAAFXugIAABFVg
Date: Fri, 19 Jan 2024 15:23:50 +0000
Message-ID:
 <DU2PR04MB8822D855BD8CA7C4FF41F7538C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
References:
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
 <DU2PR04MB88227057A70E1ED4A6F1CAB88C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <5a16bd56-52f7-4ea0-a2bb-f83fe0e710a7@rowland.harvard.edu>
In-Reply-To: <5a16bd56-52f7-4ea0-a2bb-f83fe0e710a7@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AS8PR04MB7687:EE_
x-ms-office365-filtering-correlation-id: 15b2e287-05b9-49cf-ada4-08dc1902a3cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8WHIrjBYX/90K2Vf4rhiNcIyDIzXBdfQQT/278Fqp9gwsi8RtGa/bafPRSMvFr7Ueeu4qyEBh/mriOT7CYehQCMURrmqhm2W8CgoPNQr2uoqVZro+LjDm88g/WjmtDncFzeXtSdfvhJzea8QhtjdRnb03wzlimfPuQH/mLHOZSwhVy9lW3yMaSWKuvHU0emZnb18Lg9UIwBzZerU/92V7rnVxmcToY0LrcbzyYr99n3AQon89EJWZfg4yTr0HJHDLBwQLMXYxuTvu7ao0pqISaCnNt5jP/LXok4+VY+n2b5RNZGaMCMFe2fVJiAwKOQ4s1cxsZmDZqhnC4PxrQSRqlYGA8MW7uiwT0TpojaHQy6j9x42KrcxLR0pqdMFipUwKfHtboPD8csUbYRcSgIjWqs1WNMxq0E+2YhGh1wqrqGgCV4y8Hi9egG5l/kYAR30majSdMzDjTCaeQqwqBgq+7aNW9UK5clHw15EJ+CCx5T1fRslcLCy3OFvWGNXuwJc4u2g8lJmKjgLxbgMLVEq7kX5a7ftt21RFax30KMfBCn7E4a7Pu9yvWbPNbPpx6OS1Et4efAKnkh8Gg3pXOAjPJFCJzOtKMIKoXLTXVYU4PKVj7McrH/VAbMrADS+gihd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(55016003)(7696005)(6506007)(71200400001)(9686003)(26005)(122000001)(38100700002)(86362001)(33656002)(38070700009)(41300700001)(52536014)(83380400001)(5660300002)(2906002)(4326008)(8676002)(66556008)(66476007)(66446008)(8936002)(478600001)(66946007)(64756008)(76116006)(316002)(54906003)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XHPNNW3je+9X5jJK9QqrlK49yELa4GOCsJPH9N9TpN623YwPXnpOSCR0nSqp?=
 =?us-ascii?Q?/WE1xPGVIQ81tvWpxZiE2cbo3EVGfrY7DmfsJ6VtZ1QZ5GUB13tkSSRUCx5/?=
 =?us-ascii?Q?yFqX9JlJpiYkYcW2bL9rwZ8QqRmO8Djb0jDEq81vygvz2L4GF/tIHwY/n3jW?=
 =?us-ascii?Q?IdJtgie9PokxCL+1lVMepOhTg/0wwoGZuvS6c9r37furTJLP70LlewZIy56I?=
 =?us-ascii?Q?Vz8JLCfoKLNVbYFbw+sjYYFowMBoc0fa9MlNX+tW7N5cTQzWHmu4WNx6Qzj7?=
 =?us-ascii?Q?4ESH9DtY9jTJhIf1m+6Ole0dHmhlkAsvjz7XgV/42d4CUTJkBks/GPpiWgoF?=
 =?us-ascii?Q?5q2u7sSflOJMu/NBeySbjLHBZn3l/MmFyNYG7koRCoOTFntGuc9yediSJrlD?=
 =?us-ascii?Q?zCNX2Op42NBr4Hyd5wAHVFdmutMZyP87U4xJtDfdg9xWF4V2yIGq9ZQ8Gi3Y?=
 =?us-ascii?Q?3gLTx6u9M2SbtTLalSaaR68u/2sre+hcEE5dBlmnzYFBdA3zGDumSF6Iio5g?=
 =?us-ascii?Q?gPVq/6GhhO/PRnIephu4fII1Vny8Etv3v8NIBzewfP56BgGnEbq5Agy/d90h?=
 =?us-ascii?Q?dmCmdTu4qzDFGvseI6P18XfupmEi0w+E07rzuEH8Evmi+H+Vg7v6KyBB9O+J?=
 =?us-ascii?Q?zgKGHxYR9qE3Wl6sJLsgF8/P+yzvoZjrUf3jblomFVMYDqNZI40eqaDuQtVc?=
 =?us-ascii?Q?7WHLKlR4HHcDIZw9Y4J8EQkIdXhFonz0fLOjPloVD0QBQFRhKKZw39oDHF7B?=
 =?us-ascii?Q?kKILJ1c+ToeLUjFJQOVpnrf8vOGCnBaJzeBNB2wmx6myF9RdsOMeR1m/nmst?=
 =?us-ascii?Q?uAi9Yju41/0S7UG1RAIzEcafK8n0rqTWr4A6m8Wng0rfH5QOctjggcNj3d0C?=
 =?us-ascii?Q?yYfrSFQjOgvBsl2GGTld+bX4PHwhKIX/4inU01DHrkOh/gcqETaSJQXygPOz?=
 =?us-ascii?Q?6e3lvVf3nxVBGwjMIsH/fBlA4GTO0J4CeWeN5L9QlWInjGIarvg4dFOre3iE?=
 =?us-ascii?Q?fXjV4fn6Wg8qSgu6UUWPF9D5Ql1VwdoYJL6n3O0IhVoghVmYIFUUTOfI2Smj?=
 =?us-ascii?Q?9ymEpD9gaAhC7URs+ZFoL8VrUBma5MJKHLOutvgnr3DexfbbIuuSEJ7qKqMR?=
 =?us-ascii?Q?NSOgD7Inyn74uMLxM9LRKxtkr6BNbGFvKscOGLwaqEc5QAvDR9Mb+ASzLhzO?=
 =?us-ascii?Q?JQ9eE4OIVrT1RaTwkDcLgGB3O4Y7PpU2UA/hyt4t3Z9j6V+SaC8DP0BYAkWZ?=
 =?us-ascii?Q?s3J+9DotV9eUomUEmLllciCNt2BI1neyUw/ECHCoBEBlHMjlpjXZWAveDDX0?=
 =?us-ascii?Q?vMckZ0lj+7rsPflKclPgY1Jm7njPtOr373WWAbB4fv8XbS1/WQsvWbwyzqaI?=
 =?us-ascii?Q?/j8L3sAG4+yxugbbmjohAtZ0qQWSbm8PRvNXaqeXHFKa7FeyA1xeMe49CyMJ?=
 =?us-ascii?Q?uENmIKbGfiysXlw/u3md7ux/zRm1fBLvR0Y+GqltlURfwIApZhpYhhnN9IQY?=
 =?us-ascii?Q?sbnRdvTcwTDmttd+SHvylYBX3JsS11P06COsUEqe3CCD4sE+MToXlLLopgW5?=
 =?us-ascii?Q?s2qG8tMz0jmBuCWNOHY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b2e287-05b9-49cf-ada4-08dc1902a3cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 15:23:50.8000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTb568H7IvL0vaHBjwCE194V+bQ6byajMciYpd8+c6wEcoc/9bPYjUdvUizOEsra3jSw8M6LI2kf6k5kGxShnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7687

Hi Alan,

>=20
> On Fri, Jan 19, 2024 at 11:13:23AM +0000, Xu Yang wrote:
> > I've a simple test based on below changes too. This will remove
> > module_get/put() parts and add a flag to indicate the current status
> > of usb-role-switch device. It works too.
> >
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index ae41578bd014..313f378d1a74 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -22,6 +22,7 @@ struct usb_role_switch {
> >       struct device dev;
> >       struct mutex lock; /* device lock*/
> >       enum usb_role role;
> > +     bool registered;
> >
> >       /* From descriptor */
> >       struct device *usb2_port;
> > @@ -48,6 +49,9 @@ int usb_role_switch_set_role(struct usb_role_switch *=
sw, enum usb_role role)
> >       if (IS_ERR_OR_NULL(sw))
> >               return 0;
> >
> > +     if (!sw->registered)
> > +             return 0;
> > +
> >       mutex_lock(&sw->lock);
> >
> >       ret =3D sw->set(sw, role);
> > @@ -76,6 +80,9 @@ enum usb_role usb_role_switch_get_role(struct usb_rol=
e_switch *sw)
> >       if (IS_ERR_OR_NULL(sw))
> >               return USB_ROLE_NONE;
> >
> > +     if (!sw->registered)
> > +             return USB_ROLE_NONE;
> > +
> >       mutex_lock(&sw->lock);
> >
> >       if (sw->get)
> > @@ -134,9 +141,6 @@ struct usb_role_switch *usb_role_switch_get(struct =
device *dev)
> >               sw =3D device_connection_find_match(dev, "usb-role-switch=
", NULL,
> >                                                 usb_role_switch_match);
> >
> > -     if (!IS_ERR_OR_NULL(sw))
> > -             WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> > -
> >       return sw;
> >  }
> >  EXPORT_SYMBOL_GPL(usb_role_switch_get);
> > @@ -156,9 +160,6 @@ struct usb_role_switch *fwnode_usb_role_switch_get(=
struct fwnode_handle *fwnode)
> >       if (!sw)
> >               sw =3D fwnode_connection_find_match(fwnode, "usb-role-swi=
tch",
> >                                                 NULL, usb_role_switch_m=
atch);
> > -     if (!IS_ERR_OR_NULL(sw))
> > -             WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> > -
> >       return sw;
> >  }
> >  EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
> > @@ -172,7 +173,6 @@ EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
> >  void usb_role_switch_put(struct usb_role_switch *sw)
> >  {
> >       if (!IS_ERR_OR_NULL(sw)) {
> > -             module_put(sw->dev.parent->driver->owner);
> >               put_device(&sw->dev);
> >       }
> >  }
> > @@ -194,9 +194,6 @@ usb_role_switch_find_by_fwnode(const struct fwnode_=
handle *fwnode)
> >               return NULL;
> >
> >       dev =3D class_find_device_by_fwnode(&role_class, fwnode);
> > -     if (dev)
> > -             WARN_ON(!try_module_get(dev->parent->driver->owner));
> > -
> >       return dev ? to_role_switch(dev) : NULL;
> >  }
> >  EXPORT_SYMBOL_GPL(usb_role_switch_find_by_fwnode);
> > @@ -352,6 +349,8 @@ usb_role_switch_register(struct device *parent,
> >               return ERR_PTR(ret);
> >       }
> >
> > +     sw->registered =3D true;
> > +
> >       /* TODO: Symlinks for the host port and the device controller. */
> >
> >       return sw;
> > @@ -366,8 +365,10 @@ EXPORT_SYMBOL_GPL(usb_role_switch_register);
> >   */
> >  void usb_role_switch_unregister(struct usb_role_switch *sw)
> >  {
> > -     if (!IS_ERR_OR_NULL(sw))
> > +     if (!IS_ERR_OR_NULL(sw)) {
> > +             sw->registered =3D false;
> >               device_unregister(&sw->dev);
> > +     }
> >  }
> >  EXPORT_SYMBOL_GPL(usb_role_switch_unregister);
>=20
> What happens if the provider module is unloaded but then
> usb_role_switch_put() is called after usb_role_switch_unregister()?
> Won't there be a NULL pointer dereference inside the put_device() call?

The get_device() will be called after the user successfully get usb_role_sw=
itch
device. So the resource of sw will continue to exist until usb_role_switch_=
put()
is called.

Thanks,
Xu Yang

