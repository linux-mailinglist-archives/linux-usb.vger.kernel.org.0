Return-Path: <linux-usb+bounces-5266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D483289D
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 12:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFC18B21ECE
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 11:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A07F4CB4F;
	Fri, 19 Jan 2024 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="THG6f0AU"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857674C637
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705662809; cv=fail; b=bbme+vSr7MNKWGcbPWXV9k5kRatCjpCrI2nj1ZmUjq2aqUiBTk/7ut4GL0Xy2vTbub6v76aek3gf9ND/WbT8WwU0o8ijejorPBuI3b9OwJGfbr82VwyrSaYvIwNJvIuJjj1XcxAYuhSvUIm5JoUjvdNaorvDhqnxuLNi4B38NTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705662809; c=relaxed/simple;
	bh=OHr7lV2Jl80LzNxoWHFiVeyggTuF/lmQ/IIiQW7tO9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ni3UtxvL4MmZO/ds4g8qWauwxryAIMalpUDO8tB4NZZUgMlX3HoF9N1Dj3/3kGU/uErK/xHaVRfigDyvyVEt6c9ZowIl0Q2dKWx8c040/6FhDOLSH+eeymH2Ls790WhBjRXLayUYPkExFXvNLxs1n9eV+GurjJRldDiId1iczPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=THG6f0AU; arc=fail smtp.client-ip=40.107.20.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gxetu8F9aVgz6ELR+d02TuAX5bPgDrnj2t4evjxN6ybPlWCfaUke89per5jBHrhrJIVw/D4Tau5DO0z3wyNKSljfcFm4gz8tm77JJFPX8P4k9nIoLKOcSevCv2BWmpEcwEOizsCTNyeihKZiLC/qv3/YkpgW+cw1rt3Jqc48WggiycOAX5Q/vcZFl1sq5iqNqePLKQGRCbwYdHJXehbYXjvEkc5wz6x+OYbSiOXDyiLcL+XvwY7lQgHSCKif1v5cgEHumSPc/l4t+oixx/zsho8BBPYdHg3vw8eEuKlq8TyIO3GkmhHfZvyvdFffazsSGbMgg0tF0uZBPKND/6KP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EC1dsKRhFHvQH8zHQHfxEP7PZEDXy9shpv4E85myLs4=;
 b=ZHG5YcqOafKsM9EKE2w4UQLWVEeSjdtK9abSlIJwHIk1gB+eFhjDnPQWYuhN0TI0PaKrMaLCDOYmfrCalEj4bxk5DdIPKOfiFTehm7OYyV9F+jCKCgkpjXg+l0Ns0kYTLPTMHq1/3gmQ6tV8hJ/8k3UXPfRpVewyNOrDfNQ5ycMBG2iODZ3WsFUhSpg/lmZEbUdkqDwUDVAUqibIyXOfoeXWND3JW5b53Zsa58WP6/DMeI3vav8F39S8r06s+EDBNbiwLuTNe+qoEjS5OVDP4g7sGXmoMM3VNqhYNGM/hmT/QDUyOLdGVV/OsMiCeL/f8dtoeGa26/iEa25aD1sGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EC1dsKRhFHvQH8zHQHfxEP7PZEDXy9shpv4E85myLs4=;
 b=THG6f0AUCva4583vNlBaDnoOlpTWeO1hMTBvyipV5TcFSLCr+zBLXQPJ4FWWxea4D6LSHdqyjPOHXAhxkvb7BAJz3/PiY2+sTTBTLJhukAOs4MaOXO8ZvpRGdidKSFNz1IGedunlG6OrnnfgfcylxLmXDFqXNfMF6v6a9sMJ+n0=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB7759.eurprd04.prod.outlook.com (2603:10a6:102:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 11:13:23 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 11:13:23 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>
CC: Alan Stern <stern@rowland.harvard.edu>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Thread-Topic: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant
 modules
Thread-Index:
 AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQIAATzkAgAPzOkCAAPAvgIAAx6/QgADCqYCAAOYvsIABzm0AgAAIywCAAC42AIAAJc0AgAE+Q5A=
Date: Fri, 19 Jan 2024 11:13:23 +0000
Message-ID:
 <DU2PR04MB88227057A70E1ED4A6F1CAB88C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
References:
 <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <2024011214-disbelief-sincere-805e@gregkh>
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
In-Reply-To: <2024011842-harpist-password-b965@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|PA4PR04MB7759:EE_
x-ms-office365-filtering-correlation-id: debee447-2853-453d-0ffd-08dc18dfa6a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g+pHliq87Sg9a9st4TKJCtPShnwWMateZvF0Lt72S2qwvdAdNJip0v9OgIf8mujMZm/vZ7Zaa54bTEXnSTyVMc55xriW9EjuPi6EbcR9EUbMOKwBSmsh63lHclSEZcbE/hzVnuS4wMarwYdjicIEnVT1TttNP7ez7vzX7LRvuMAdZj1U2ctJNgTdSRRdQywsx4+07qz53oTCkhqwTp9L4SlRJeKAGE9Zx47LfumPVRD2NwooscuEyRHtC18w7/wica/Q86Z8XOKGw0zxwtBb6b4DQ/2yzoU3/ZpgIYthN6pURTgC/pw7jQDnC0OO9XlOXceVA5zi4mkxJ84LPZlj33WBEuiDocA1EF9pq64rCiVSGpEzRWAgOrwah2vDr92NfwikAMiEnRX53NperietLqmn+jXnae2LxKnZRns1+bVPxnB1MUC3Fsd0qgj4Ie6PxkfM23GLpgnTjXTnA0Py+JXt3q8cMMnOVm1uTPS/4iQvlI/4mEivyi8PH1EE1nmmiqCXXx+/UmsDu1PlC2AQn1SGYQCV9So028X2d6Mb7EUXCk1emRqMIB9WsTC65Qs4pFwWUp+IQPjZKeZZxXA0T/Sdo0mr+T6DfozJRKQiTzvpwPwe7r99zsG4BKIZOGWL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(366004)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38070700009)(55016003)(52536014)(6506007)(7696005)(83380400001)(478600001)(9686003)(64756008)(66556008)(71200400001)(316002)(110136005)(8936002)(54906003)(66476007)(66446008)(4326008)(26005)(8676002)(66946007)(33656002)(38100700002)(76116006)(122000001)(2906002)(86362001)(5660300002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y/uXQkNltXM+EtBihJ6Dk1FBLjgK/N2tgEAf5BmSJDlOjGHU0M7gsW37Vzql?=
 =?us-ascii?Q?iHBr+GVG4BXnABzdAv+SfsUQELkokzJtukUboGv/DrGu2I2qrBlejmtWlKDd?=
 =?us-ascii?Q?8qRomyWctS89i3R5uYIw+lfJYL4/1MFr9gdasFUXYQV5zT9MpnEeFIcdgNmR?=
 =?us-ascii?Q?WMgJZZvkmCw2GHJ6EkSprnHiMOnZR6GesoHzE92pUbHmKq/VUKZmg2FIasbX?=
 =?us-ascii?Q?888EdfYihP3NX19YGfYB3ZxpaPGPK+D5UonPOfU/sTVf+1ntyO+FOlCtOKDt?=
 =?us-ascii?Q?MpPmeHjIjTxTpA7MoJyv3bQM0Tstx6GICGMIvirxCfuAKeRnlrfFCFJ/IZ+f?=
 =?us-ascii?Q?mFbokYOVX20LpMg3UY32ZzyPaCbrOsvWUokYIUS8Y0ia8YhA6XOSZtBxJJmD?=
 =?us-ascii?Q?15hswgC96+9w7M91TwduS47o0AwltKjtqyKnY72S9kKoc8Fw7Q+F4wKEQwki?=
 =?us-ascii?Q?ki3bL341d3MW/ztp91vpBcSbE7Eq/BF6CT8mOqCRoC2GUGM1A8IhfU99CxDq?=
 =?us-ascii?Q?yecx3ceL9nYRACVBXfgzj6itvB/D8LLpnuJ68eEJlvZkPt6kAkKN/MDrnGmk?=
 =?us-ascii?Q?p1g+17ysLWKJvsvzQdvRr/6oe42aYwCgdwnWLK81aktMKWmymiZWcLyu7EKj?=
 =?us-ascii?Q?AB7WSvoTmNRz5lkCaRXjEBHGRfXyPs1z60s3x1P1b8HfBRql6tgkNyJ8UCzk?=
 =?us-ascii?Q?P5PbXA0yS5citgM9ADfJnM//xohwxpLXhKDDfuTrc+S8O3dWjve8tQkDHQFF?=
 =?us-ascii?Q?0UCeF64IAGNoGRXe/tUFq5c7Go9xp6orEg9OnTCBrhy11VhzJnkbnEAprYKg?=
 =?us-ascii?Q?oTW3jGxGOmQeDfkJCqbMnaZ4HtPnZ1+7PREaJip47Jw9wnbwCMcfJ5n99PDA?=
 =?us-ascii?Q?aZ7r/+369ivTiTWzaSIMEYq5jkqs0DifH6iYKDIbbwh9KDkMa72JbUtNF+Ij?=
 =?us-ascii?Q?ZwsE7oz2rBCaCaclOI5fQSasHPNeMuyTtsCcqWmY7g87/cw+KPao08ZFX1Pj?=
 =?us-ascii?Q?+zYXRGmQg0vwTKoSKsHh01o7tnJiYz3eGg8mWBoc+1xGPw8/X6u0rmT9i3HI?=
 =?us-ascii?Q?AKvhTXknYO8cNfJ2jYNvHYEWCwSIhWcY9RYPzKqQu96aWnFnaQzDMTgjqrSs?=
 =?us-ascii?Q?YRvPPd+56D79Vl7tin6ASI4PJY6S6AZa460yM+fXyQin9Yep7H57BxIczvBv?=
 =?us-ascii?Q?jgfutxTvBatWX6n8ClzYXPKrHAKmYxVexxiw0/nDMhVuuRM83dcn3+jf5Gnq?=
 =?us-ascii?Q?Rw0krTPamvgh3pFI56v32/Lo9Ak6S/oyRigxVbmgwu73JQB/8+04PywXYa/T?=
 =?us-ascii?Q?sYtuFzwT3bpD7vUtPIuNq2Kp3YdklNwmOsbBcUjhr3wJH+Wef+NEsx97K6H9?=
 =?us-ascii?Q?3gulCaO9YCa+iLUJhC66uA19MadyBPDhR0zUz4d4LXHOhPo2jIXVu1f+EoQI?=
 =?us-ascii?Q?6kyy2XY20la0keZ0zgYsrXk15MqzoHHyB61zSknNNb7A6C22Tp1JuoF0YBhg?=
 =?us-ascii?Q?HhAE+qr6H5CxRHS90iRh6aT/pIbykzQm4SDcdrzElWwWZ6QKRlQKBFoJ/ou9?=
 =?us-ascii?Q?td67k+qk/+FrirTFw/M=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: debee447-2853-453d-0ffd-08dc18dfa6a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 11:13:23.1548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kI+PVgzZu49HZn/j7NOPRjyzFmYj4LlqKuVKZUbF+94KtNg+N98qKhSsBH+20pGbLyh1OJYO/C86gXO+W6vF2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7759

Hi Greg,

>=20
> > > Why?  What defines "being used"?
> >
> > It is "being used" when something (user) acquires reference to the
> > role switch that it provides. The "user" is in most cases USB Type-C
> > port driver - what ever knows the role the port needs to be in.
> >
> > USB role switch is meant to act as a "resource" like any other. So
> > when you acquire for example a GPIO, the gpiodev driver is pinned down
> > by calling module_get() just like this driver is doing to the switch
> > provider.
>=20
> So again, if the hardware is present in the system, the module reference
> count will always be increased and can never be removed no matter what a
> user does?  That feels wrong if so.
>=20
> > > Any module should be able to be removed any time, unless there is a
> > > "code" requirement of it being present.  The driver model structures
> > > should make this possible if used properly.  Trying to much around in
> > > various parent devices and the drivers bound to parents should NEVER =
be
> > > done as happens here, sorry I missed that in the review process.
> >
> > If this is not something that this kind of device class should be
> > doing, then let's remove the whole thing. But if that is the case,
> > then shouldn't we remove that from all the other bus and device class
> > drivers as well?
>=20
> I started to remove it many years ago, but then something prevented that
> as there was actually some valid uses, but I can't remember at the
> moment.  Try taking it out and see what happens!  :)

I've a simple test based on below changes too. This will remove
module_get/put() parts and add a flag to indicate the current status
of usb-role-switch device. It works too.

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index ae41578bd014..313f378d1a74 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -22,6 +22,7 @@ struct usb_role_switch {
 	struct device dev;
 	struct mutex lock; /* device lock*/
 	enum usb_role role;
+	bool registered;
=20
 	/* From descriptor */
 	struct device *usb2_port;
@@ -48,6 +49,9 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, =
enum usb_role role)
 	if (IS_ERR_OR_NULL(sw))
 		return 0;
=20
+	if (!sw->registered)
+		return 0;
+
 	mutex_lock(&sw->lock);
=20
 	ret =3D sw->set(sw, role);
@@ -76,6 +80,9 @@ enum usb_role usb_role_switch_get_role(struct usb_role_sw=
itch *sw)
 	if (IS_ERR_OR_NULL(sw))
 		return USB_ROLE_NONE;
=20
+	if (!sw->registered)
+		return USB_ROLE_NONE;
+
 	mutex_lock(&sw->lock);
=20
 	if (sw->get)
@@ -134,9 +141,6 @@ struct usb_role_switch *usb_role_switch_get(struct devi=
ce *dev)
 		sw =3D device_connection_find_match(dev, "usb-role-switch", NULL,
 						  usb_role_switch_match);
=20
-	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
-
 	return sw;
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_get);
@@ -156,9 +160,6 @@ struct usb_role_switch *fwnode_usb_role_switch_get(stru=
ct fwnode_handle *fwnode)
 	if (!sw)
 		sw =3D fwnode_connection_find_match(fwnode, "usb-role-switch",
 						  NULL, usb_role_switch_match);
-	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
-
 	return sw;
 }
 EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
@@ -172,7 +173,6 @@ EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
 void usb_role_switch_put(struct usb_role_switch *sw)
 {
 	if (!IS_ERR_OR_NULL(sw)) {
-		module_put(sw->dev.parent->driver->owner);
 		put_device(&sw->dev);
 	}
 }
@@ -194,9 +194,6 @@ usb_role_switch_find_by_fwnode(const struct fwnode_hand=
le *fwnode)
 		return NULL;
=20
 	dev =3D class_find_device_by_fwnode(&role_class, fwnode);
-	if (dev)
-		WARN_ON(!try_module_get(dev->parent->driver->owner));
-
 	return dev ? to_role_switch(dev) : NULL;
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_find_by_fwnode);
@@ -352,6 +349,8 @@ usb_role_switch_register(struct device *parent,
 		return ERR_PTR(ret);
 	}
=20
+	sw->registered =3D true;
+
 	/* TODO: Symlinks for the host port and the device controller. */
=20
 	return sw;
@@ -366,8 +365,10 @@ EXPORT_SYMBOL_GPL(usb_role_switch_register);
  */
 void usb_role_switch_unregister(struct usb_role_switch *sw)
 {
-	if (!IS_ERR_OR_NULL(sw))
+	if (!IS_ERR_OR_NULL(sw)) {
+		sw->registered =3D false;
 		device_unregister(&sw->dev);
+	}
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_unregister);

Thanks,
Xu Yang


