Return-Path: <linux-usb+bounces-5232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37463831C90
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 16:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA20B2842CA
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 15:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8A524B5D;
	Thu, 18 Jan 2024 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RFhkhp8V"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2075.outbound.protection.outlook.com [40.107.14.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AC728DB4
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705591804; cv=fail; b=Hng/+0w+fo5YDAsN13eWqLoDfRpFOiDAusJusBnm10FgXp21BarI5x9Q26nmioyZMSmu8eZHBTwmhotVY9g/ed/XLN4thJ7dHD6ddRAOdqeYwZX1wCyuBNnFIgkEXNmrzBRx7BVWcY3oZnNHg5J0J2dnujo/aHbDeOnSammAO4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705591804; c=relaxed/simple;
	bh=/rvezxQOhmxa0u/TddvTbpoqydGSrIoiFrwh5BK+DnU=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=YTFNGSpgr/JfIAaGvKre9adVYUkWucsdr+hHSB+MzntpQfaOXty2Yh/DJ4B59ynEpmUFphIqTahow9zfUOxlJwGI0toZwkLqxilymSA7j2wM83quYywfKliV7+aPVLKkdDoKAgIFpyBLZMHhKesTtNtRUo/sFZ4bDjH3KkM8u+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=RFhkhp8V; arc=fail smtp.client-ip=40.107.14.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7tCU14Rv5qabt+XIskiKY03B0Qk0bq05HuYYToHo0XN/vyQIOGmvmMn7I6k5+y6v20q105bP6HlC7ga1Hj3P9RdKjznnI0RYLk06q0k821yW2HacCen+ywwJU5XQGyg76metLPNWWB3/5sU8BtR2df2AhPzvqs2QUOLlYGuAimi5gftM8o45/OUoxl5QTQ1YkTMgzMQrqqjouozp5WkcfxAnqXWTIgmb9NxClgrka6AyKbIqviux9w6XFUHBPm+CdX0urtDMwjNQGWE76p4w4SnkiwUxJTh+EWjIGw+vl7myOqaMZeRy5+rDGhHLPRL7Dge+sgghBo4w5dpQAo7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWFQwXS1KVw3/jaHWcO+vLxVtUIz/VJ66N34royPhic=;
 b=Xie360kpkd30ddzMB96UvaXwOGpe3YxCeIYrEARxhRl2N4vw9fpCgu8yyVwRzSHfNXptnJYUoWKbek1r1qnPM7Lpl1wn4IL6xjYVGbVrIqMccKvyH30PChBLdswKGLLvFhyfy2W63da1y2tLTEBIMECTxRuiC8s9vZOCHnvIePsPFVojxGefdzlIURtsHg+WAWQ6Af5EJdDHY8yT6vjHRev0gzHiRD2hVWy3Vno05kj1Hri42YrwkGysJ9zAIxf1rVioTRJKlIpFBmhm4LOZPXym8uLAEOKzlovM9Eaw/eP4oCsRKYTbhZEbUA/UFfjZ5jkkuJyC6V1HkpqSRXKwbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWFQwXS1KVw3/jaHWcO+vLxVtUIz/VJ66N34royPhic=;
 b=RFhkhp8VXLOq+WRA0Rt8J4VOaFHZJocip7CW0Ql1FR3BXE75bnqCuaitBBhvzZIQ9+2F8JibYvVYG8IoKFGExj2X5V2XB8t0c+zQH/W/qP/ncH51RBY/TwtVwbgnrciu1RIA8m3O+riLNwHX5ln9z0nhYwWSDoJgC9dYeJ1RxF0=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8757.eurprd04.prod.outlook.com (2603:10a6:10:2e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 18 Jan
 2024 15:29:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 15:29:58 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Alan Stern <stern@rowland.harvard.edu>, Greg KH
	<gregkh@linuxfoundation.org>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Thread-Topic: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant
 modules
Thread-Index:
 AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQIAATzkAgAPzOkCAAPAvgIAAx6/QgADCqYCAAOYvsIABzm0AgABlUYA=
Date: Thu, 18 Jan 2024 15:29:58 +0000
Message-ID:
 <DU2PR04MB8822B7A4365D5E36D9A4CA108C712@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
 <2024011213-situated-augmented-64a4@gregkh>
 <2024011220-asleep-dragster-1e39@gregkh>
 <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <2024011214-disbelief-sincere-805e@gregkh>
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
In-Reply-To: <ZajtviC5hDVEczBN@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|DU2PR04MB8757:EE_
x-ms-office365-filtering-correlation-id: 6bac045a-e9ca-4032-7773-08dc183a54a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 85Hp0xigUYpAc7RRQczfOhP2luUnpZRkv3xP8W+WmIubk7Md5kj66AqGxALqkcCle5M4GLfobzEYrIBOjoTn9a91IlM1LD29r/T/fjF8C/bjzIESyUT1STiV2M1hk86PImxYZXxCXyhS7BY42DHqMZ1fyG0Oc/ikEQc1YUPVlfphlW3G54Rp0ruaFEbTYc8QT7Fa/IqhJf5GUTnfzJvHReDrEmmCD3K3f1DFCaWRGErVGNbcnorO+CQAtD6VzS+0ic7C6ZBgMpVJMWqNCIq+LqIQhP+Gu7e/keheaa1R0gRbpr4kR6UaCESITPcnFksoUO8/F89i1HfUELZTsr4EW2Abgn+BEaCkMYlGbjtrz/4f7zyaZE3owQtpivzHSW/xv6FvnUNzb8VzAUm0mo7xhlfT6Kx/697JXQ2EMp8+gw+dq40YiPc+mvXcz6fMBiwxytSZw+9iNWF9Wq5dLJ6zER3MUTDzuO9Zz3RlX61P68Zx4TGWpJ4aCT1CtbTVyLzzzN4/kkvQGaJnVLBbrk3Ws0XLoKDsg6w7NdIa8d8Ajpi2YHMdgUdinJV/bREWMSzt2np16vqWtAWTX4fkMWCsOc89wroWTAUKzcA4QrxRplGOND7mZ7d17OziKeXmE6xs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(4326008)(5660300002)(33656002)(122000001)(52536014)(26005)(8936002)(8676002)(55016003)(41300700001)(478600001)(2906002)(38100700002)(86362001)(6506007)(66476007)(64756008)(316002)(83380400001)(66446008)(66946007)(76116006)(6916009)(66556008)(54906003)(9686003)(71200400001)(38070700009)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+gvozEC/h9fbYH3o9AmWNvSsdhoZ8vXWf0yF0HW6lfeNGRJnQLG8Wfia1xeQ?=
 =?us-ascii?Q?cIXd2FVSwZy6Pc2md7s7yujHhotXziNx7Cfy/ZMHQVtL6/+FfEvFZDinrPU0?=
 =?us-ascii?Q?O1DRnq9EHghfFPQa6jPVQZRkMH9EK3m6lS+U8BElKvxi2DVrGRdR/1Gnqj6w?=
 =?us-ascii?Q?uD7dbq2b9+IoejcIeMtjGaL/t4dqpJDHuoy0XiylajdqOnxXo1cpD5lfPA3f?=
 =?us-ascii?Q?nHdtJZfLpBhvGNS3u2GOhBKzA4E4HlBBwpUgnmizM21VLLUv0X6W6jydm+6k?=
 =?us-ascii?Q?9wQa1ZCHAfV39V/b13AehjfZIdKQ3SrLo5/r/RtU/SkdqEg30wGDU39kRXbb?=
 =?us-ascii?Q?ek5DDn0I3jkoes4tAvuRJG4MKjxEuxriSO5+tVwvUDjCq66aA9HgDL2uEJjP?=
 =?us-ascii?Q?TiMCnrO/DBTxP4VUGpz7/kni0YtlT7SljKDNt2Kf3Sea26v8sUrig8GPwbq9?=
 =?us-ascii?Q?3K+wqC76jiLBzAFFkR8Qkgs+mH+bKczwvAslpRTnJWut98e42hNgYwpFsXzj?=
 =?us-ascii?Q?cIuiJ2692ZSlM9a3YjV42NLOBMP7lmiqnFTGbHOdG4vJeCzkWpcwhoQaUhpS?=
 =?us-ascii?Q?2bIeb8ll81VQ5yVYw1NfK8ltmQ9milzHlz0xxqURpKLRsJPJzRYWH0tTMa8t?=
 =?us-ascii?Q?6Hoxc5Eadxtk5nNgTF/SCCSf2eJGF6LKINEDB0oMn2b3f7e4LhQX1RH6ojTH?=
 =?us-ascii?Q?/8bpOSIwgaXzYA5XF0datMjyHu90bGbJUeLwZJ/n91zskOhXDiYlyfNzutV1?=
 =?us-ascii?Q?PctmVX/yFqjr2ZdzItjrKzXiP/nunF2/ADtI/pVkEe8JpRocWJk7O9Kx39CC?=
 =?us-ascii?Q?XuYXuRMQSmYNMYtfbld4XibHU9QDpazocXnPDwowIGJQEVQLdNDmWNL4GXlI?=
 =?us-ascii?Q?idNQblVFIaQv3JE2GyCDDhqd2PP5WD27rhxpK/ESAuCcv94fCGDH/fN/1q93?=
 =?us-ascii?Q?4xXrR8THo7Qc8FWgptlVGp9DzTwkNBlmx14A/AGwHTxLL/UfHBteZg3zO264?=
 =?us-ascii?Q?2+2z0nFTTBP5hss/Lq9kzeZMVODhei0ZMO4jVtip/C8NduTY4zPdHR7JO9iQ?=
 =?us-ascii?Q?kSPTwVjK99Iwu1LwiJLgEcwhhXhC3DQdbDhv0jnXEG3EnpxShF2r8L8If6go?=
 =?us-ascii?Q?++J9AsR7/k19BYAqut5FJKoEC3CZKQBjxBpL3QjDscQEysvpWrtHrL+3Hzb0?=
 =?us-ascii?Q?YO6rbYnx6KKXC74syr1PvUX6e0wkuMtnrTlOMEKh7jHsYi5B4tC9APqUyTCH?=
 =?us-ascii?Q?U2QI0A9hiaLJPo4H9U6y8ndcodOumwCkrZgLiM+IWv5UnayGGqK4lRzVPeKk?=
 =?us-ascii?Q?FHbDgmNZPAqzsUhSReDWKnan/+lDdpp+bnkl/eaufyfThj4DxMnaX6UZzAxX?=
 =?us-ascii?Q?srS3dP4AkiYOP9hJeDeF1nPqihnHPeHaxxCLHJbWsIzELGgBk3Aeo9FYWwxv?=
 =?us-ascii?Q?bLJ9I4JQ1dMDzYFwxuWbHS4PzHw9OSMlkBTRsRntcam+PEeAf064EtUhtsp4?=
 =?us-ascii?Q?FJiD78qpcNqsOG+rdxOIuQwqyxfMibFXAAm6qPe1S0H1tqjocLhzPvnQ7beJ?=
 =?us-ascii?Q?21VLy39PURxDzrJhmIE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bac045a-e9ca-4032-7773-08dc183a54a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 15:29:58.6930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yk8YjGGTFCnZKbHoSxuEzPZtkqv9I89CmuG7OC/THu5/fjNDhkJUiZKivMxRdFEzqY3/Hea32pbkQaer1NvBUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8757

Hi Heikki,

>=20
> Hi,
>=20
> On Wed, Jan 17, 2024 at 05:57:02AM +0000, Xu Yang wrote:
> > Hi Alan,
> >
> > >
> > > On Tue, Jan 16, 2024 at 05:44:47AM +0000, Xu Yang wrote:
> > > > Hi Alan,
> > > >
> > > > >
> > > > > Those of us unfamiliar with this code need you to explain a lot m=
ore
> > > > > about what's going on.
> > > > >
> > > > > On Mon, Jan 15, 2024 at 03:02:06AM +0000, Xu Yang wrote:
> > > > > > Taking below diagram as example:
> > > > > >
> > > > > >      ci_hdrc.0        register   usb    get     tcpm_port
> > > > > >   (driver: ci_hdrc)  --------->  role  <----  (driver: tcpm)
> > > > > >          ^  ^                    switch           |   ^
> > > > > >          |  |                                     |   |
> > > > > >        +1|  |           +1                        |   |+1
> > > > > >          |  +-------------------------------------+   |
> > > > > >          |                                            |
> > > > > >      4c200000.usb                                   1-0050
> > > > > > (driver: ci_hdrc_imx)                            (driver: tcpci=
)
> > > > > >
> > > > > > 1. Driver ci_hdrc_imx and tcpci are built as module at least.
> > > > > > 2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.=
0 device
> > > > > >    and try to get ci_hdrc module's reference.
> > > > >
> > > > > This is very confusing.  Normally, a device is registered by the =
parent
> > > > > module and its driver belongs in the child module.  When the chil=
d
> > > > > module is loaded it automatically gets a reference to the parent =
module,
> > > > > because it calls functions that are defined in the parent.  I don=
't know
> > > > > of any cases where a parent module takes a reference to one of it=
s
> > > > > children -- this would make it impossible to unload the child mod=
ule!
> > > > >
> > > > > In your diagram I can't tell whether ci_hdrc is the parent module=
 and
> > > > > ci_hdrc_imx is the child, or vice versa.  I'll guess that ci_hdrc=
_imx is
> > > > > the child, since it the one which gets a reference to the other. =
 But
> > > > > now we have the ci_hdrc.0 device being registered by the child mo=
dule
> > > > > and its driver belonging to the parent module, which is backward!
> > > > >
> > > > > Very difficult to understand.  Please explain more fully.
> > > >
> > > > I checked again and let me correct the words.
> > > >
> > > > 2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.0 de=
vice.
> > > >    At the same time, the reference of module ci_hdrc is added by 1
> > > >    automatically due to ci_hdrc_imx calls some functions in module =
ci_hdrc.
> > > >    ci_hdrc will register usb-role-switch device.
> > > >
> > > > Therefore, module ci_hdrc_imx depends on module ci_hdrc. Device ci_=
hdrc.0
> > > > is a child of 4c200000.usb.
> > >
> > > And ci_hdrc_imx is a child module of ci_hdrc.  Got it.
> > >
> > > > > >  ci_hdrc will register
> > > > > >    usb-role-switch device.
> > > > > > 3. When module tcpci is loaded, it will register tcpm port devi=
ce and try
> > > > > >    to get tcpm module's reference. The tcpm module will get usb=
-role-switch
> > > > > >    which is registered by ci_hdrc.
> > > > >
> > > > > What do you mean by "will get"?  Do you mean that tcpm will becom=
e the
> > > > > driver for the usb_role_switch device?  Or do you mean that it si=
mply
> > > > > calls get_device(&usb_role_switch)?
> > > > >
> > > > > If the latter is the case, how does the tcpm driver learn the add=
ress of
> > > > > usb_role_switch in the first place?
> > > >
> > > > Via
> > > > port->role_sw =3D usb_role_switch_get(port->dev)
> > > > or
> > > > port->role_sw =3D fwnode_usb_role_switch_get(tcpc->fwnode).
> > > >
> > > > The usb controller will register usb-role-swtich device to the glob=
al list
> > > > of usb_role class. The fwnode of usb-role-swtich device is also set=
 to usb
> > > > controller's fwnode. Initially, a fwnode graph between usb controll=
er of
> > > > node and tcpm connector node had already been established. These tw=
o
> > > > functions will find usb-role-swtich device based on this fwnode gra=
ph
> > > > and fwnode matching.
> > >
> > > If usb_role_switch_get() gives away references to the usb_role_switch
> > > device, it should have a way to take those references back.  But I gu=
ess
> > > it doesn't.
> > >
> > > >  After usb-role-switce device is found, these two
> > > > functions will call: try_module_get(sw->dev.parent->driver->owner).
> > >
> > > You mean usb_role_switch_get() and fwnode_usb_role_switch_get() do th=
is?
> >
> > Yes.
> >
> > >
> > > > Here sw->dev.parent is device ci_hdrc.0. sw->dev.parent->driver is =
ci_hdrc.
> > > >
> > > > >
> > > > > >  In current design, tcpm will also try to
> > > > > >    get ci_hdrc module's reference after get usb-role-switch.
> > > > >
> > > > > This might be a bug.  There should not be any need for the tcpm d=
river
> > > > > to take a reference to the ci_hdrc module.  But there should be a=
 way
> > > > > for the ci_hdrc driver to notify tcpm when the usb_role_switch de=
vice is
> > > > > about to be unregistered.  If tcpm is usb_role_switch's driver th=
en this
> > > > > notification happens automatically, by means of the .remove() cal=
lback.
> > > >
> > > > I'm not the designer of usb_role class driver. Not sure if this is =
needed to get
> > > > module reference of its parent device's driver. Maybe need @heikki'=
s input.
> > > >
> > > > @heikki.krogerus, can you give some explanations?
> > >
> > > Yes, please, some additional explanation would help.
> > >
> > > > > > 4. Due to no modules depend on ci_hdrc_imx, ci_hdrc_imx can be =
manually
> > > > > >    unloaded. Then device ci_hdrc.0 will be removed by ci_hdrc_i=
mx and
> > > > > >    device usb-role-switch is also unregistered.
> > > > >
> > > > > At this point, tcpm should learn that it has to drop all its refe=
rences
> > > > > to usb_role_swich.  Since the module which registered usb_role_sw=
itch
> > > > > isn't tcpm's ancestor, tcpm must not keep _any_ references to the=
 device
> > > > > after it is unregistered.
> > > >
> > > > Yes, I also think so.
> > > >
> > > > >
> > > > > Well, strictly speaking that's not true.  By misusing the driver =
model,
> > > > > tcpm could keep a reference to the ci_hdrc module until it was fi=
nished
> > > > > using usb_role_switch.  Is that what you are trying to do?
> > > >
> > > > No, I'm trying to get module reference of ci_hdrc_imx too. Then,
> > > > ci_hdrc_imx can't be unloaded before tcpci module unloaded.
> > >
> > > You shouldn't do this.  Users should be able to unload ci_hdrc_imx
> > > whenever they want, even if tcpci is still loaded.
> >
> > Okay. Understand.
> >
> > >
> > > > > > 5. Then, if I try to unload module tcpci, "NULL pointer derefer=
ence"
> > > > > >    will be shown due to below code:
> > > > > >
> > > > > >    module_put(sw->dev.parent->driver->owner);
> > >
> > > I forgot to ask: What function makes this call?  Is it part of the
> > > usb_role class driver?
> >
> > usb_role_switch_put() do this.
> > Yes, it's a function of usb_role class driver.
> >
> > >
> > > > > >    parent->driver is NULL at this time.
> > > > >
> > > > > What is dev at this point?  And what is dev.parent?  And what did
> > > > > dev.parent->driver used to be before it was set to NULL?
> > > >
> > > > Here sw->dev is usb-role-switch device. sw->dev.parent is ci_hdrc.0=
 device.
> > > > sw->dev.parent->driver was ci_hdrc.
> > >
> > > Which is now gone, right.  I understand.
> > >
> > > Let's see what Heikki has to say.
> > >
> > > However, assuming he wants to continue misusing the driver model in t=
his
> > > way, what you should do is add a new field to sw, where you will stor=
e
> > > sw->dev.parent->driver.owner at the time of the try_module_get() call
> > > (but only if the call succeeds!).  Then when the module_put() call ru=
ns,
> > > have it use the value stored in this new field instead of dereferenci=
ng
> > > sw->dev.parent->driver.owner.
> >
> > It sounds like a better solution.
> > Thanks for the suggestion!
>=20
> If there is a better way of doing this, then let's use it. I'm happy
> with what ever works.
>=20
> The only requirement here is that we have some way of preventing the
> role switch provider from being unloaded while it's being used.
>=20

Preventing the role switch provider from being unloaded seems infeasible
because the usb controller device (in most cases is the provider) can be
unbinded too. If that happens, the usb role switch device will be unregiste=
rd
too and the provider driver will still exist.

Thanks,
Xu Yang

