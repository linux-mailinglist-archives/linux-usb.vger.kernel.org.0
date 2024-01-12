Return-Path: <linux-usb+bounces-4947-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9700782BD31
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 10:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1A628806E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 09:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBA15C8EA;
	Fri, 12 Jan 2024 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="HToxQ+46"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E05787A
	for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYTC3EIIK9GgkE0Wg6yl9fC8+Jt/ywjCHXmA0hXZuwlzo6EDTueONDsfBOoCWjfAy02ucC3TwZ7vIbKTkRM2rH5Cyhc2Hvvrm/UhFR8YpVRdl3Xjq9xH10ChbSchJ3ckxJPZtW9qpYTBimlUriCUtT/WBGmhrn3bgLkrKYlL/TlwGrTC4LLm5wnKMF6+aUNG7yWv/ToZQ5bcrDpFZyi3Kkvxs+sZlrKj1ETq6u3EsxPKGSWrz8SqnAa0BU9qP+2ryOHBQtSEuYrQ6C6KNhdG2lxLgAIEHKtUKz9T1K1XK9FW0czGanGgITLcWYZt0edNUoC5utpNTWoHZ+M3dxPtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFTOvR4W6CwGTrtAabVy8KlQjDeYCSzHBO3NU0UXN0k=;
 b=OlDu7F2tIBEF2X2onEr9l4Z9ou5btBmPBHEzt+ohAFb3Vhhf7iRUHxxeTe4qRWbZngvtKCbBLiJd99BXUQpWJQ0MiFdbHzSfr9eb9uusHwzUqndrSmkEe51HQtZjPhdBbr5TbDs8xSI56aM9I5DqvEoPfTgu8S7aEA2Z4adB89Z/yTxuTP/xOjQaQ8wUQugUCX5CB19O7sMz9RZuAIshPyskcCmyn932IDnKV8PLDvlpCX5EbLHD8CBW++o5bIlFJQUin/+hI0npM503KHp32KKoMjAUBMqAOWkUTfZ/1IlcnxGwqkU6FlO/OLCmRfNw76Xq5mLZwtWAEXp7XJwdpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFTOvR4W6CwGTrtAabVy8KlQjDeYCSzHBO3NU0UXN0k=;
 b=HToxQ+46syssZ3/2gGdD+0e22ixEYM4fFEVmyx4lEe3J+gUrfzpTPwqY6crBZeb/EWZAZCBezjXvujLw7hB6xkfxSpoo1qM4yy0/BPsG0oenk04keejjMAyHMMTDcW9513UeVQrXBkqo5EYMMRWkUphGyHIsVm2AF19VG1Pymtc=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9335.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 09:28:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 09:28:04 +0000
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
Thread-Index: AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQA==
Date: Fri, 12 Jan 2024 09:28:04 +0000
Message-ID:
 <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
 <2024011213-situated-augmented-64a4@gregkh>
 <2024011220-asleep-dragster-1e39@gregkh>
In-Reply-To: <2024011220-asleep-dragster-1e39@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AS1PR04MB9335:EE_
x-ms-office365-filtering-correlation-id: c6f4e375-0e58-4c4e-0722-08dc1350c7b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fTFDiKiBbz1FueJ26ulDTjVGZUp606xh/2Xq/iw62iW5dPLAF8N7Xnd7/zFTTSUDiV+dZSSDRFVwyyTXQt6IsJOsLfNvS3KdYLxDKFifBR9oFHg6IemligdUniRjxks29V8rhy5iAEYtPzCqiJ3AWVzxlk25ganUS75YU87IF4fK5nJEfc29og1syKNMk3uIBy23RJPhNF9JghfDcnQns0P8j/l0iZvedAm2KnPBp7Ka8Vim4CcyT42Dq0wTcs4WFz/miss6Ic811YoNzpPGomCYugBl4UbHlVK8mC4W7S5dn/TYBuT7LLR9jy2MWXRdYAZ13lF/V6R+jXmEP+QTHyplExZG3tK45m1DwvMyjc+8Y2eVkT8NlpcosJtTcPYDLAFAQUoqHRgU9Zx6+7vjKtyOUvPC9AWk8xWCUy54RcuT660dlZz528MCrAFqAunI32PdYRVangQ0VoGpgMHrSM6OICY+ENtkDYEC3my/kICpgkxhuRUpP8E9FnMMtxVJ1Pf5IRTdhLzRyLQ6gw5sw6W5Yr02J4cDvfIYUuHwOq8Rg6ihAZAFIHxyxRoE86KY7x9IRy/fYwtIKG8RkuFtr/f6aiA0XgZf3/7gcojE76JekUw0rRHmS6A0RXc/Dwn0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(33656002)(86362001)(41300700001)(122000001)(38100700002)(4326008)(64756008)(52536014)(8936002)(316002)(54906003)(6916009)(66446008)(66556008)(66946007)(76116006)(66476007)(8676002)(26005)(478600001)(71200400001)(7696005)(5660300002)(9686003)(6506007)(2906002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gwXlnJfoNJkrOcEX8vgo3yYYmZz4F8p9INvur8GSG/QBdkbeft+xy6KGiyQc?=
 =?us-ascii?Q?PvxmDGxdVDSWSqY8M9kQv4sYtSkf3U/++k8IZWb9rrBnsw3JnfEuF+x+TuwZ?=
 =?us-ascii?Q?5mTPt0FyrqZkhE99U27S2HK9tsnZessZbxD6zzPNwzxJpVVbuqWo5TCcmuwE?=
 =?us-ascii?Q?rfMalLt37DYDkRti8OyA4k6+Oo6bb/QFRAHmAjfiKnFJWsfe0hSeYspXwTpP?=
 =?us-ascii?Q?2g5t5rNWnsOPpy3kwdhj3nOpMBADp6II0V4o7yMw2M6SzwfcY/m4KYIpfhhR?=
 =?us-ascii?Q?KA/uynW+9HoPhV4cqBfH3tkDG18QFOHTAaRM/Ve/gwBrkMht4nSMM5vcr1Eo?=
 =?us-ascii?Q?JW5u3uzGm7Vb5nHQYVYAY0/mD5k+aDGO83YlFRMZ3OQGyNDO64NuOKJfeev2?=
 =?us-ascii?Q?1FAK4yHLBxbMMVHO1BuEUdR5yNUsp5RXx4bnmRqPxgYA4BaJn0oYTC0H682E?=
 =?us-ascii?Q?U7Erhmbao4qG8XpNVDS/8Tu/33JmBEU/xex76bckTBCya25jCxsQDYgcUs5P?=
 =?us-ascii?Q?hXVBuUNj3toz1DvHHZCNchutTXhV+1quAM5mHkhjU6xK77RUM87QhSF/Ak1y?=
 =?us-ascii?Q?cBchQjTcKsficgcHZTN0Pq1mF2eKR4QXJkLsQq7unOH1RMwJg0HDP+B+PuZm?=
 =?us-ascii?Q?LXNw/nTETiF9km2dpb6qaV7R7pBBqZapG/1jGX2ad4eSKyLVcFbRAfMBcYi2?=
 =?us-ascii?Q?YbposzYXgAKOJ+1ttW+6NuQJRQ4Tw0FZeVqsrzp7/1NbZXH4n1fUpCnGL2tK?=
 =?us-ascii?Q?yhIQnH3GSbgJ1JQiAmyWxihWRyhVvFJff3u7ak2dqA5QwwCkCWXBkrtx6KL1?=
 =?us-ascii?Q?U/eG5G7WNP/koiX07UFQ5ZNfQSwW/k+BBGnIXfsv8O/82egF7kYLfHPWDcyi?=
 =?us-ascii?Q?95xDLG07SYG6uXi12TOCeiEUZuiwErEH2mbBSVJRaAsbwRrtBLbTQDz/v4vA?=
 =?us-ascii?Q?Lecf5kRGalZ3KGPZyDyGY2lmB5nqmlWyWjA1xULpjzFrk6GNNDEJ8uxScro0?=
 =?us-ascii?Q?aUp2hDU0YWaSs04FS+flng4Q/dlxBksAD5blJ43Snrki6g68XjaPh49md4yu?=
 =?us-ascii?Q?PcGGF9BVmmGnVUgKcPbVXSuKm9UWQy8Pvil/tMLnhc/8Th0AeiSzqpCgv11t?=
 =?us-ascii?Q?IrW3TaPEc/edDiFh9FVjlGbxWx1D1pOur634o0AgBOesjGepyq6VRsW7NvPc?=
 =?us-ascii?Q?V8/oe7xZHcGstRGMaoo5hWvA1eTxgZPhsfRrsM9qV5JpIL590jjZOafZ7pak?=
 =?us-ascii?Q?NhpTSh6PwmLN3x42XnONJZkSuAK7UMrWp76wnYEVEFTPCq4pY+JXDZgc+9Zv?=
 =?us-ascii?Q?Gc/U9II7XsMd5R+v6lQpmmH1GNe5wljwvw544dn8EE4mn7YJT/aHlb9YWBEF?=
 =?us-ascii?Q?jlR7eWvQJcMoxootkhnuOcpTO9KksT+fEkXV5ryM5vVI3ZCdQbscM2pkvh8O?=
 =?us-ascii?Q?W7CV+HPJFGxDbei/yqE4BZX8aGNS7eLGYVX5WcA8TltrGyRPIhKNRH8ewbFr?=
 =?us-ascii?Q?oSI6ABtrw4RglFoy2tAEZaU2FMo6Olp4etvyFoqT087amFhJGP87jv03cPUw?=
 =?us-ascii?Q?4cq20k4XbZGnkrp5zU0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f4e375-0e58-4c4e-0722-08dc1350c7b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 09:28:04.8199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65f4DnLt79JtiTZrDO9l3Y/uc8alM6Fj3Fcg4u52/T4vbSFa5z8uUbFDGxLOJfpUCzXQ4FGxjtxIFb8TGEPgVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9335

Hi Greg,

>=20
> On Fri, Jan 12, 2024 at 09:24:11AM +0100, Greg KH wrote:
> > On Fri, Jan 12, 2024 at 04:01:08PM +0800, Xu Yang wrote:
> > > +void usb_role_switch_get_modules(struct device *dev)
> > > +{
> > > +   while (dev) {
> > > +           if (dev->driver)
> > > +                   WARN_ON(!try_module_get(dev->driver->owner));
> >
> > You just crashed all systems that have panic-on-warn enabled, which is
> > by far (i.e. in the billions) the huge majority of Linux systems in the
> > world.
> >
> > If this is something that can fail, then properly handle the issue,
> > don't just give up and say "let's fill the kernel log with a mess and
> > reboot the box!".
>=20
> Ah, I see now you are just moving the code, but please, let's fix this
> properly, don't persist in the wrong code here.

This is a true module dependency issue and it only occurs when
load/unload modules. The dependency of usb controller glue driver,
usb controller driver and the user driver (such as tcpm) of usb role
switch is not correctly established.

This patch is used to adjust dependency of them, without it, two issues
may happen:
1. "NULL pointer dereference" kernel dump will be shown
2.  The reference count of usb controller module may never decrease to 0

Thanks,=20
Xu Yang

>=20
> thanks,
>=20
> greg k-h

