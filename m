Return-Path: <linux-usb+bounces-5092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B78B82E93A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 06:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BCC5284264
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 05:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C828882E;
	Tue, 16 Jan 2024 05:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PLrUNtmN"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6288826
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvYbGJ09WQ8E4cpsrNidhYq5O8X0IsmZnppAZVT2byfMzIcOzFgjbY/3J9aSgHYY5Fp6R/haMyhTsfSB6O5Ij5k7ddazaq3leiDXstllrT/1/yDeASl4NL21cOUo2zFtCfhU0Pj6Ii61KECqPaxnVlyu9wGFW2yprdeyqYIP0IMxudqud1HBHVDjrDA3g9a+fMDXuUjRKq6ba/RoAMDXyIVthPP4HrVeGRm5gddcG/Fe2XnTLN2aYbNeG6P20zR9wNdJ9yL1HddAcsEYXjVkomKXe5BvWhmVE1auyB3yl1kp9veQ9bRhbYkgTtqSNzw7LN3hBzqks1GdwqQTc/Jegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXJo0G27VEl5TCQEbCNTDpaJW45VNvGK1DlTy7d/sOU=;
 b=TQcRnfWnc3iTmbTmanzYuD165LVe1mqBXrd5MChmK1jxamnB9ORO7WmaRTaJzg2SkdDVIO30ptIC0sL7GzqnXVkCXvIPMF2SaPwbkzp8gLzGv11VP0IUeOSx9c31FzSQ1zJfT7SQOIguviLAbfZ00WucMkAy941oyQJ592Uy8pMD3/ik7/twCAYvjEPLENF6+3VrofZmoySJsENIcJInEAzYLaAuwRyh+dbNkfafDcis8UEUcp6Xaye90Xrw64BGH3VFTVJWH0UiUiO6i8p9FUZYDKnHdUoslbTvLDEfC8L/ucuvjNPOrBfZGUelPpwTKbd05jH3FhUr2bmz73hzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXJo0G27VEl5TCQEbCNTDpaJW45VNvGK1DlTy7d/sOU=;
 b=PLrUNtmN7WvqO7SZWaM9wjKvE0OUym/6UySppO1mvXfLZ8RDD71eGJQtUhdYLepZdtynmEtiG4CnGCZKBf3TdzMgHW5hxFWTBUowjZrOf+cnYRiBZ9/Rqlh3GGk9Laiu3ADtfei/EibOLjQcNnpVW5n2VE+A7gmP31tBZ3QyTgg=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9909.eurprd04.prod.outlook.com (2603:10a6:102:385::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Tue, 16 Jan
 2024 05:44:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.029; Tue, 16 Jan 2024
 05:44:48 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>, "heikki.krogerus@linux.intel.com"
	<heikki.krogerus@linux.intel.com>
CC: Greg KH <gregkh@linuxfoundation.org>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Thread-Topic: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant
 modules
Thread-Index:
 AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQIAATzkAgAPzOkCAAPAvgIAAx6/Q
Date: Tue, 16 Jan 2024 05:44:47 +0000
Message-ID:
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
 <2024011213-situated-augmented-64a4@gregkh>
 <2024011220-asleep-dragster-1e39@gregkh>
 <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <2024011214-disbelief-sincere-805e@gregkh>
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
In-Reply-To: <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: heikki.krogerus@linux.intel.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|PAWPR04MB9909:EE_
x-ms-office365-filtering-correlation-id: 748ef1ec-7808-43bb-19bd-08dc1656402e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BxvzTKeQed35ZV+Sw614bA1aqt09EcG0iTgvn5rvm0W59jWogi0tTT7x5uDJJdkGA3y4oTxODArlj7uFPJGLfj0LmK4/xcb/SM2lLNGOL4QFws0HkSYivTF2D1Ei14v7W0wRSo3Tm+HrI4Dr/eRf1P6a8igIkVoeySlgqFX+rTsEg51uXfyP9dxfll38fx8RCHnAfwYSTBAT1BUGzAbW0GF9co2WkPI8Z6Y5nOVfePz92w946lu+ortLIbbfPDP1YE8/q6Rwp8L9Bd5AO8uJ15onhFydwWr6gVu7UC/6os1P/eW68jgW87iSSxFm0s5DytK1qizI8fB1ydrwaW/iYjaAb+xbeU8KYmpuRlQfUcYzgUux3WdWUIQG5WHRDsgR9oPp/eFqjsNfFEFF4iZC4gL8igXT5eFr6GhEm69pbS043JeuEzdTwwXVnHiTr7v7334q2gr0UvmHxyd2n46knwRQfwqi2miFF8yXVq52VCfA/AA/I2uva4JnXVUgXgCa4VDA/Y287irgM1A4TFT4opaSsVWBLLrtiDDp7TRhXHU3aYPMTDNOngTQlv4kUOPfVhB3DsbWXYi9uLd1Kd0VJXeg0PH6ScXL6viS9/LyBceesaZrbvxy2M4NdPv80F2v
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(366004)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(9686003)(6506007)(64756008)(8936002)(5660300002)(110136005)(54906003)(52536014)(4326008)(41300700001)(122000001)(71200400001)(478600001)(66556008)(76116006)(66446008)(316002)(8676002)(66946007)(2906002)(7696005)(66476007)(33656002)(86362001)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DCt8jm1CWhLCnwT0UvWQxRFX8ehyt3X8xHk3YyyKH8xbLpkX4KND7rJHPwAH?=
 =?us-ascii?Q?w06Xq3E+6YpIKrdV6vnW3t0O4rqgk+KhhtPUv8bMYTaDWh/0FytHOmkMsJQ9?=
 =?us-ascii?Q?Gc8HHPKIEexBjjdhK/Y4cl5SQF0VXelvwAyMFk3i/0fS1Pb7+Yv+N+xr0PpH?=
 =?us-ascii?Q?SZ5OmQhC4xwxnQJiut9TRwQ2KTPJaF/8qwPj+QrmsedNAsy+0yAc9AytJVRR?=
 =?us-ascii?Q?PtU0M++q6UGW4AoHSzFFp5KDILSkDc/1T+ZV3/TGxwjKwydLnt3LIjyJmrlo?=
 =?us-ascii?Q?HbccOPL4859teqKriGohrrY2qA8RHTXkC3I7glF+sSQSU+2g8K5mubCGEkKu?=
 =?us-ascii?Q?a5gAD4218LSDc59EV+VPBeERM110W6LHGJ4+oEeBVkOpXKxrKWqQiq55BENl?=
 =?us-ascii?Q?LFWXzUny+qTom12FMYQGlK/ZVKtXP8XC2s4qkZICKvHxClI7y/uuF8mBuQHs?=
 =?us-ascii?Q?vQQC+FhTEeRvv5AayZAYCS4j4Q0EHWqC2ZiaFg1RPGjff1JqNOjgvuvZx6gw?=
 =?us-ascii?Q?x1Fvb5dAa3zJLnnoj0/fStK3N6tvoGmlS7nx8gJh+W+Mh/RAIR3Ye3h7B5JH?=
 =?us-ascii?Q?FbJYg9M7YaZ44E+NnrOz0G0JRmf0Dd1pLc2+4XU8fc1KeoULkTlk5QBymxJJ?=
 =?us-ascii?Q?dIYpoIz7HvEnCLJfTJDDeazrgHTREzONan3DHUzmCUD/fpXcQzdquL+fgdo1?=
 =?us-ascii?Q?Y3D5YkCmKCPoKlleRSXFt51RCyLcYCEq+cdK9IH+xUM2kZimOBtZR9jbCiV3?=
 =?us-ascii?Q?+Q/B8WmPkiJEufxFs0/rEKHdKFwiADBs75N0QZorxrVwgFomdZyqOus+Yihn?=
 =?us-ascii?Q?b95Qodc0a5eKHeV6PpNTzuXVdi6hZPLHgMhj7zGQ6PDkG81SYJTmFkvkU8Bd?=
 =?us-ascii?Q?HXpdeeBxI1RT+qhYx8GvPfHkLdA+aGsOfgtvmytTezXgsGZgMVnp164ldUR8?=
 =?us-ascii?Q?LXrN0JBc4G0Vo/0jHd1mzXX5upl2FBYJGvR832WGAt+mmV35D0KQZZYCaxI/?=
 =?us-ascii?Q?F61sd9Yqrr4HUfKC8PA/XtWhuLafd5yDChpkjJpMUcYvjmtNobVoz3cD5h70?=
 =?us-ascii?Q?08vcamvndIRu8maR7SElK7quoM3blfXQVUrH+ZP0E0DTETBdE/NURIEFR8gl?=
 =?us-ascii?Q?GKZEa/S3utZ8dSLNQUk8XDHZfPorsXn5wzSh3usjPMBXDURnyOmbpX8pJ4Xx?=
 =?us-ascii?Q?cnqvE2QYuSyFB+63ZMCH4ZEy0AjV6fno7vqSHxCDbuqAb30zemt4kTddEFkM?=
 =?us-ascii?Q?nKpyOmg/zeQt1Uem2Xu7SkULFvO7j6W/P0bwEqCOGUoO3ZkO/6TSw/lVqZCh?=
 =?us-ascii?Q?PwLYPERc7Xr7UtrokQOaqTXn7zP2GNi6so7kKewU7VpS20A2TJhGrZW1W6ga?=
 =?us-ascii?Q?G93z/yZVQT3F+M1mPsuBuuPn367PudqMdTTSrQgGJ8UXx9mFPc/K74IsPK0k?=
 =?us-ascii?Q?Kz1cNhacwbFcyRM8/DNTbEfuj/lHAlWbbbu7Dl2UWX81/P4CvPqpRJlzJVrU?=
 =?us-ascii?Q?zTHsAE1LfhGh593pV5gSEyEbuLz46RX6JuOqTglz860uUXdSfg5N7pwQcQ?=
 =?us-ascii?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 748ef1ec-7808-43bb-19bd-08dc1656402e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 05:44:47.9080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zaeQ9Z8tTjViFXWr6hg74VKj/Td/hWuC8IGqFW2JpRUU7W1QcF1jedJ7mj+ojJso5UDYeyuRs1xZyTgPKXJPTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9909

Hi Alan,

>=20
> Those of us unfamiliar with this code need you to explain a lot more
> about what's going on.
>=20
> On Mon, Jan 15, 2024 at 03:02:06AM +0000, Xu Yang wrote:
> > Taking below diagram as example:
> >
> >      ci_hdrc.0        register   usb    get     tcpm_port
> >   (driver: ci_hdrc)  --------->  role  <----  (driver: tcpm)
> >          ^  ^                    switch           |   ^
> >          |  |                                     |   |
> >        +1|  |           +1                        |   |+1
> >          |  +-------------------------------------+   |
> >          |                                            |
> >      4c200000.usb                                   1-0050
> > (driver: ci_hdrc_imx)                            (driver: tcpci)
> >
> > 1. Driver ci_hdrc_imx and tcpci are built as module at least.
> > 2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.0 device
> >    and try to get ci_hdrc module's reference.
>=20
> This is very confusing.  Normally, a device is registered by the parent
> module and its driver belongs in the child module.  When the child
> module is loaded it automatically gets a reference to the parent module,
> because it calls functions that are defined in the parent.  I don't know
> of any cases where a parent module takes a reference to one of its
> children -- this would make it impossible to unload the child module!
>=20
> In your diagram I can't tell whether ci_hdrc is the parent module and
> ci_hdrc_imx is the child, or vice versa.  I'll guess that ci_hdrc_imx is
> the child, since it the one which gets a reference to the other.  But
> now we have the ci_hdrc.0 device being registered by the child module
> and its driver belonging to the parent module, which is backward!
>=20
> Very difficult to understand.  Please explain more fully.

I checked again and let me correct the words.

2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.0 device.
   At the same time, the reference of module ci_hdrc is added by 1
   automatically due to ci_hdrc_imx calls some functions in module ci_hdrc.
   ci_hdrc will register usb-role-switch device.

Therefore, module ci_hdrc_imx depends on module ci_hdrc. Device ci_hdrc.0
is a child of 4c200000.usb.

>=20
> >  ci_hdrc will register
> >    usb-role-switch device.
> > 3. When module tcpci is loaded, it will register tcpm port device and t=
ry
> >    to get tcpm module's reference. The tcpm module will get usb-role-sw=
itch
> >    which is registered by ci_hdrc.
>=20
> What do you mean by "will get"?  Do you mean that tcpm will become the
> driver for the usb_role_switch device?  Or do you mean that it simply
> calls get_device(&usb_role_switch)?
>=20
> If the latter is the case, how does the tcpm driver learn the address of
> usb_role_switch in the first place?

Via
port->role_sw =3D usb_role_switch_get(port->dev)=20
or
port->role_sw =3D fwnode_usb_role_switch_get(tcpc->fwnode).

The usb controller will register usb-role-swtich device to the global list
of usb_role class. The fwnode of usb-role-swtich device is also set to usb
controller's fwnode. Initially, a fwnode graph between usb controller of
node and tcpm connector node had already been established. These two
functions will find usb-role-swtich device based on this fwnode graph
and fwnode matching. After usb-role-switce device is found, these two
functions will call: try_module_get(sw->dev.parent->driver->owner).

Here sw->dev.parent is device ci_hdrc.0. sw->dev.parent->driver is ci_hdrc.

>=20
> >  In current design, tcpm will also try to
> >    get ci_hdrc module's reference after get usb-role-switch.
>=20
> This might be a bug.  There should not be any need for the tcpm driver
> to take a reference to the ci_hdrc module.  But there should be a way
> for the ci_hdrc driver to notify tcpm when the usb_role_switch device is
> about to be unregistered.  If tcpm is usb_role_switch's driver then this
> notification happens automatically, by means of the .remove() callback.

I'm not the designer of usb_role class driver. Not sure if this is needed t=
o get
module reference of its parent device's driver. Maybe need @heikki's input.

@heikki.krogerus, can you give some explanations?

>=20
> > 4. Due to no modules depend on ci_hdrc_imx, ci_hdrc_imx can be manually
> >    unloaded. Then device ci_hdrc.0 will be removed by ci_hdrc_imx and
> >    device usb-role-switch is also unregistered.
>=20
> At this point, tcpm should learn that it has to drop all its references
> to usb_role_swich.  Since the module which registered usb_role_switch
> isn't tcpm's ancestor, tcpm must not keep _any_ references to the device
> after it is unregistered.

Yes, I also think so.

>=20
> Well, strictly speaking that's not true.  By misusing the driver model,
> tcpm could keep a reference to the ci_hdrc module until it was finished
> using usb_role_switch.  Is that what you are trying to do?

No, I'm trying to get module reference of ci_hdrc_imx too. Then,=20
ci_hdrc_imx can't be unloaded before tcpci module unloaded.

>=20
> > 5. Then, if I try to unload module tcpci, "NULL pointer dereference"
> >    will be shown due to below code:
> >
> >    module_put(sw->dev.parent->driver->owner);
> >
> >    parent->driver is NULL at this time.
>=20
> What is dev at this point?  And what is dev.parent?  And what did
> dev.parent->driver used to be before it was set to NULL?

Here sw->dev is usb-role-switch device. sw->dev.parent is ci_hdrc.0 device.
sw->dev.parent->driver was ci_hdrc.

Thanks,
Xu Yang

>=20
> Alan Stern

