Return-Path: <linux-usb+bounces-5256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC16832597
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 09:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB22B1F218A8
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 08:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157AFDDD2;
	Fri, 19 Jan 2024 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="KShUSP1N"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2075.outbound.protection.outlook.com [40.107.105.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956ED28E16
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652338; cv=fail; b=eq7KfvxF/xp00TPH0HuucGpVIhjGclyo4745Wh7YTaqmjB8Zg6aJn5NcCxNPkLYr6T7PtWL+EFOwJEoxoYIjiqxloJgRb5BhvNwasdFXGA8DmKhcP5rP4i960DBp/g1uERTVOP2mbPnEgWH3OrTQ20YkUD7OfbZGeCqxIL2kSF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652338; c=relaxed/simple;
	bh=8p+Ct/uSZOS+4fD3XrlZvEmM8+j/UVn3yR9u3Iq7lTg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aIhzXXP5FOanklXVfn945VCOvFf8FZGqXnV2EB11ccZEpMiSbGRiXf+9Q22F+S5CdL0Qfkz8T016oRNF6dbA5DiFk09VKxInCrXnDH4PdrZRUW1RElvn/QNqRrpbqRvTiAHnkcyX0ppahwDtTrV7xndJY2mrkK+dFxnESe7lack=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=KShUSP1N; arc=fail smtp.client-ip=40.107.105.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9rU8LPKsJf/hR+z0wkwx0zm4GKfIO9pVKKKL8Caq69fHMRudD0zyRmNWQOYUOq/8RT7XLiYwhpZ7/dcub3GPz7VsBQyOATC9Hm/5nf5IAnvMgyUJPIRCWlYbvk7UHK49/GPKLamuP4HcUQDAU5F8E2K2cj6Y4Ww7oBIipZ7dkHv+VHoY1Q43UU1rv6fMmS02Zm17Z1YFAQbAWeT1HCsX4VIO4QdNB8d81IBC6Ngn5QNfiS8+8Hk8oNv/L7epR0B6aJE6Of1RZzAC6vrkYF2iKZf/nCvHl3bHZrAC9VUYWIc7z4u5EbZD2ogsM7wCkPIhChFxR722i1eZB/wwvyWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDK/xteKAf7qlbhaRPvj6yf9vX80jAw1KNLMhBRgt6E=;
 b=ftNoW4t0n2v4kyDkBosg5BSgjz0ReoIUF6PGXrfmGSTCkgd1ZH9R3zPf4Exss9Iu66vrhGe16G/KCLwtZT9KQ9eK53AmjpG7ks30P/iEg4J2cAMBrwHTTBVfS+BWnza2gGDACzreQMnQZvtIPtu92UhxMOE+75KFqhBxJv2dPOgmTGkrE1tcjNtA9djC+tledmXhWHvspmXmYrRimDJDqxQSx/DJymnEdEUZ8/l9o0uh9uzjaP+rRPbAwMnFHFIhpa3OO4OQvsnc0TKxU7sY4dsT7N55v/nI0rG4z+TDe3Lx9sYuGOhGPAov4WLRmUNWYOzRpOWFbU7e9X1HO1dBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDK/xteKAf7qlbhaRPvj6yf9vX80jAw1KNLMhBRgt6E=;
 b=KShUSP1Nim1UGrb37x5ZPV+KJu3kbCZwGd2fb9ZRixvypqvq95WMMJcPEAMgTM2NyVhvDrba/7R/XaOq4p/lgPZM8eVUFJGE4mJ6jGRYFQvdtKtDTLsTMvEbHrDaT3UECsCp/NmYJ8TnEdw+7X+30xf62nID74NW5BvZcwXukOY=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB7824.eurprd04.prod.outlook.com (2603:10a6:102:cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 08:18:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 08:18:52 +0000
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
 AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQIAATzkAgAPzOkCAAPAvgIAAx6/QgADCqYCAAOYvsIABzm0AgAAIywCAAC42AIAAJc0AgAAJmgCAAANHsIAAPemAgADYVgA=
Date: Fri, 19 Jan 2024 08:18:51 +0000
Message-ID:
 <DU2PR04MB8822BB1DCFB37AA96D0C55158C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
 <0f386d9a-b375-472b-8054-beb142916faf@rowland.harvard.edu>
 <DU2PR04MB88220905301520363CD1566F8C712@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <e65ecd23-004a-45f3-aff4-ab2a51c34962@rowland.harvard.edu>
In-Reply-To: <e65ecd23-004a-45f3-aff4-ab2a51c34962@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|PA4PR04MB7824:EE_
x-ms-office365-filtering-correlation-id: 4188199d-95d6-4f76-77cd-08dc18c7454f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AIgREPwEq2CM9PSbs4HKHStcO9QIeBouaEiLVyUZtkw7M9jKlsmw6jyKcMsaUAaUoGp20RdLUDoRT4d94bzc3ZNCbbfGaUk6SvJ/jF5NWdR/44ZB70G02Tx/IhihuDlaoA8Iqm4Doot9LTdlBLR45dw1itrNupKhgvgTHlRAxXU+rXxbcD7NFItW5hLmGHLXcWa8YapRsyfYQUcKs9kMvcBnvadLSLNPWByLyTGGPVbzSfu37FPC401SFMuDQtFTWDfXcQwwIDTZjwzGQaJzvcf/FO/iMQVEyg0bYy7vZHYGFNCT6VC+CJyHQHbzuNNCi8fbXMcEHJWp0FSUvVZX5uW6GsXCxbEbsrECvd0/kbnTA6TFsvZPU2eu+YEj1IN6SChqiKvJQ85e215Gbknr/33Asd6+qsiqIhkXPQ9wW5ssJfA6UjyxaBrp6PhBhExlCGHA3kVAG9r2Qg5n4GpuCax8baQEax2NOl60PruLKsG3fvhU/vGDLR+417TyAaUac7PcZafoUINqqokiNCgwYHs35Xbddb7paVpta1BntIfyl+MMdZn+ZFYTEij9FRuqeDBBoyI78lDBPvwgdPel4Qcz7ySgRA4BKvOy5FUEENWXaKi1z9pEx/Nhtxlil9MN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6506007)(9686003)(7696005)(478600001)(71200400001)(83380400001)(4326008)(5660300002)(41300700001)(2906002)(52536014)(6916009)(8936002)(66476007)(64756008)(54906003)(316002)(76116006)(66556008)(66446008)(66946007)(8676002)(33656002)(86362001)(38100700002)(122000001)(38070700009)(26005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9RsbDcCAhGKDKQZbAFbnb2UJjfM5vqN2gn20W/la3fqgH4Ww2Sybl4bmZgS6?=
 =?us-ascii?Q?v56b3xFzowqloemn8A7uu43+UtYF3+T6BJVMqOegXdk73sMZrLzDnALOkhzh?=
 =?us-ascii?Q?6zHIugQ4rQ8/9UkeSiP05hiwSD+xfcBrsyTvKhBZpYru1OVmVTAGyNi8Dt0G?=
 =?us-ascii?Q?yBgxaqPKOlx18z3dMHp98KrJ8ir+opLLL1Lp+thTjx4JdfTYkPN3piW4ro7P?=
 =?us-ascii?Q?jBQM4CcxDRrbvQHAEQ6Jfxt95GQhYS9vxSHphR/y2mtqRykqXfnvvLvM2d9x?=
 =?us-ascii?Q?ddXCwE6kV7j80Mveak9Lwc+/0Tyf56GEZtQsANUOyHHlrGvJJc2WvHTvqqG9?=
 =?us-ascii?Q?UebU8WtlTq0dMak9JxihncC18BDpUI9f8Dnjz3LF1qF2/8luI3iG3yR3EG6Z?=
 =?us-ascii?Q?uwUWEC2pQLytb6hMy/VMSIJnIddxB4vfstfDTBMKJ2kPKDPxenHIL7Rv8W1K?=
 =?us-ascii?Q?fHeUfaR9ng/vTzG0+H1SXvqSvE3mqW7S5s4kPSmdViztoP4qve88xYj9B9dK?=
 =?us-ascii?Q?HLct80zt0Su9KVBEVjuvdUH+l1B1TucDTvypi9PRU5Zhowx95sMjJDxWGZi/?=
 =?us-ascii?Q?E4paOBBG3X/Skvrvoo+JHLnihRsfwlDWCmYX9M27DjP56/xC0vecMD1WCOpr?=
 =?us-ascii?Q?O4HyAEmSfoZ4swbkQm+3vJ55FWkOx0eokS/KdN3T0xCe4YC/8Uo9U8pHyHEU?=
 =?us-ascii?Q?h5al8MIW9u7S6MKkaIS+t57dC9blOiBlvGxZGSf64yC63tsS51Tf2uqCC2sT?=
 =?us-ascii?Q?egPSA9w0/z8+cQo6irwdOjqaD9YooTzb3qmgJrtII9Yl/JO4E3BiEYKZ/BkM?=
 =?us-ascii?Q?nZ5D8QiNy2qasHqJllzaCiL1C2R2PQP4YHgracpxXgeEDboHJK33NWxSjQJL?=
 =?us-ascii?Q?B1TnFl4fYyuwCS98z0RagR5Uw7Et1ZNYOEGahRiN3Ye7/zKT97z4N3QOzdVx?=
 =?us-ascii?Q?OBS+VszMVqlgIHhI8G6Y4iCrs+G2OYOizxV0Gn7aKNJqzBvTzoBsxuQyAT5L?=
 =?us-ascii?Q?qwbeCG4j4ZJWZqUV+1gPFRcNpxDMeBejjZ+qWqJsVPLqr+e+iW9Us3HyuISv?=
 =?us-ascii?Q?XxnCjwJc8ppJL1yad7OkwPdyJsyb7P4g/ET9hsuXbKL4pKdc2OeOTsHC1wa6?=
 =?us-ascii?Q?l1S9Xh/D8+5eb3g+eAT6731a5mNVTN7EEUnVBoaTmxXTSIrBWgDYhPOhmn10?=
 =?us-ascii?Q?r4UpTC+TCA6qmkUIB35pN6ZVgZywqivMIBlufaxQSyKxpFkA9Fx+2VGZVNWO?=
 =?us-ascii?Q?Sh9ImmrICr8yNnq/YpQ0hHdscdZ27p8XkXEIFo6OJYym8pnMW1yAjQELvVaB?=
 =?us-ascii?Q?k6QSnspaFIjgpy8blmltX9/sB/6aJtTW34nb9yjlwkO8TCmJzVjgMuBxTk4p?=
 =?us-ascii?Q?GCNeutZ8t9H0URjdGUh5MonpGas4fswjXZi6JSaBjEWFJwUALhCwoIdeXHX1?=
 =?us-ascii?Q?WZhiu3ZESZD94G9rZ4h4Ls2aX6ugv95nnBzuDsQ2OgZ1uFdRnX1VcNwTKeh4?=
 =?us-ascii?Q?LXGVEe9tVVFlrIRUZGZ3tr7N4YVeXT2mVZ6cNRKaXQD75oA/JeweACoJXcvw?=
 =?us-ascii?Q?7zF5zI6g9iFR8IiuvTQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4188199d-95d6-4f76-77cd-08dc18c7454f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 08:18:51.9808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: smnIgHQNZ04XGSkf2Vu6gb1V9Om7Rk+RibWzTgboqZoVSzK3mbFy263ZTya/PXauu3Pei6Tspzus4hPf3BorzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7824

Hi,

>=20
> On Thu, Jan 18, 2024 at 03:52:52PM +0000, Xu Yang wrote:
> > I've tried your suggestion and it appears to be working fine. Now I'm n=
ot sure if
> > the module get/put parts should be removed or to fix the NULL pointer i=
ssue. I'm
> > working on this issue, so I have time to fix it. I think if first way i=
s taken, the status
> > of usb_role_switch device should be updated when it's registered/unregi=
sterd. Or
> > other issues will occur since the user doesn't know the change of usb_r=
ole_switch
> > device.
>=20
> These really are questions for Heikki, not me.  Can you at least show us
> the patch you've been testing?

I have a simple test based on below changes:

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index ae41578bd014..d55a5d8d4fc4 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -20,6 +20,7 @@ static const struct class role_class =3D {
=20
 struct usb_role_switch {
 	struct device dev;
+	struct module *module;
 	struct mutex lock; /* device lock*/
 	enum usb_role role;
=20
@@ -135,7 +136,7 @@ struct usb_role_switch *usb_role_switch_get(struct devi=
ce *dev)
 						  usb_role_switch_match);
=20
 	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+		WARN_ON(!try_module_get(sw->module));
=20
 	return sw;
 }
@@ -157,7 +158,7 @@ struct usb_role_switch *fwnode_usb_role_switch_get(stru=
ct fwnode_handle *fwnode)
 		sw =3D fwnode_connection_find_match(fwnode, "usb-role-switch",
 						  NULL, usb_role_switch_match);
 	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+		WARN_ON(!try_module_get(sw->module));
=20
 	return sw;
 }
@@ -172,7 +173,7 @@ EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
 void usb_role_switch_put(struct usb_role_switch *sw)
 {
 	if (!IS_ERR_OR_NULL(sw)) {
-		module_put(sw->dev.parent->driver->owner);
+		module_put(sw->module);
 		put_device(&sw->dev);
 	}
 }
@@ -189,15 +190,18 @@ struct usb_role_switch *
 usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
 {
 	struct device *dev;
+	struct usb_role_switch *sw =3D NULL;
=20
 	if (!fwnode)
 		return NULL;
=20
 	dev =3D class_find_device_by_fwnode(&role_class, fwnode);
-	if (dev)
-		WARN_ON(!try_module_get(dev->parent->driver->owner));
+	if(dev) {
+		sw =3D to_role_switch(dev);
+		WARN_ON(!try_module_get(sw->module));
+	}
=20
-	return dev ? to_role_switch(dev) : NULL;
+	return sw;
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_find_by_fwnode);
=20
@@ -339,6 +343,7 @@ usb_role_switch_register(struct device *parent,
 	sw->get =3D desc->get;
=20
 	sw->dev.parent =3D parent;
+	sw->module =3D parent->driver->owner;
 	sw->dev.fwnode =3D desc->fwnode;
 	sw->dev.class =3D &role_class;
 	sw->dev.type =3D &usb_role_dev_type;

Thanks,
Xu Yang

