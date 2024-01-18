Return-Path: <linux-usb+bounces-5234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B917C831CD3
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 16:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A7CB1F228D9
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 15:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A3F286AF;
	Thu, 18 Jan 2024 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="YMDTwcKf"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DFE24B5D
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 15:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705593177; cv=fail; b=o3lmRme39zD/s5U1a7dOyVYpuXpa8zIa7inVj6oyinlqufK3IKkCkpqcAHGAYfnr2YWRAbdZr0BDUUXelSr1xCLyVyVVXOxHsOTRH2Ul6jFMJqmazaoUpHW/o5HskJfmDnW5lh5f8FlGHsXCGktnpAwqBmm7hgkRLMP/ch5mMYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705593177; c=relaxed/simple;
	bh=gjCny5G8JAJoopqTmfzc9lIdvxlhFehRr3cl5o/XKkE=;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=o6HOfihfVgetbG13CVFSDOz7RCv0EzvUqB/GBOQ6fjCQ6gpETINMdiAW/jSyTQsa4uGqg2yMLCMtEJ+M/iVchBg7P2mrDpVfJYYM+VP2+9KrCGIcxGCIi8x8FMU7KRxcglhEdhv96f8L9bqAbaJtRrtNxxZKn4IT8MvdRUtVhJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=YMDTwcKf; arc=fail smtp.client-ip=40.107.7.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhIjO2D1qQmTBEaWpNcOhVgb/C9SKXOlqxEMEDunqrcdJkUXtLJ7a1KoxAQIob1GCbzhxgM+c9a2U5HJN0uNlGUwauny2OwUmWs+WwRDeuKdPbLi5lMeznMFSmUR630QS9zs9gF3xIdPT0OsghBll2kWQItcAiCo8+d/Y6RYKNjHrCzpcpLCgefFrRC2iIItQrLHclZ8IjdnLqzx8Uznsrvy8gXIUmnys5mgPlK1A+nQV+CPClkdD3JJTKM+KFP4GtAVLzRUASiTrC7O5deqhvvqiGcIVfvayT36hGAjmlNcWEJdVeH8rW9Qc+/4bpjxCzIJcjn6XuZdjxxa4K9d7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMel1Rt9sDpnRcAuIg4rNk+8nT/yVafSZ+zSKrgiezk=;
 b=HbT8vm2ydhz0HH3iyW23dSBTwzF080uhkCyjw1ecKgkeCWFHevUZ9VfBlCiz4YblZGaRCYc0To6boCLrsNH2gu5+uGZJNib9a2DC378KhlSbFeAEkwoBkuX09THGE/t5piw1qg4G7M+A7mMk+AUa5ckYahPOUl6mjBTar4PanfSpMC3VgdxWac4Ag0oLgmdt0/9SLMqo1ou/+LyPPAAmhF0+j+/z7mYYW8ptBkauIxeI+LvZbjzuojKQzeOL42gBCYgL3fhDWec4AI+K85Wc394SztUnO7xsqs3xD6wxMYaR7MC3dNwg1dF3SxfUqsBUJp2o7ahLukMpfUv3ttpnmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMel1Rt9sDpnRcAuIg4rNk+8nT/yVafSZ+zSKrgiezk=;
 b=YMDTwcKfy4e2aHnkim9eXQUxpUkJklumCzJ6UeFGTZqYpr2z8EmCWzcEFLYBGGYld+e401tDI8Z973ZxkXL8Gf9JBqSzz4VCr+pIEns7JHdNHA/bzF9jvrhDbmMFBDX1L6s27Nt7YTa2JtJq6UejQD2XZqo9GfXSFDclgTVHKSo=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8994.eurprd04.prod.outlook.com (2603:10a6:20b:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 15:52:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 15:52:52 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>, Greg KH
	<gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "ivan.orlov0322@gmail.com"
	<ivan.orlov0322@gmail.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Jun Li
	<jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Thread-Topic: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant
 modules
Thread-Index:
 AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQIAATzkAgAPzOkCAAPAvgIAAx6/QgADCqYCAAOYvsIABzm0AgAAIywCAAC42AIAAJc0AgAAJmgCAAANHsA==
Date: Thu, 18 Jan 2024 15:52:52 +0000
Message-ID:
 <DU2PR04MB88220905301520363CD1566F8C712@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <2024011214-disbelief-sincere-805e@gregkh>
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
 <0f386d9a-b375-472b-8054-beb142916faf@rowland.harvard.edu>
In-Reply-To: <0f386d9a-b375-472b-8054-beb142916faf@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AS8PR04MB8994:EE_
x-ms-office365-filtering-correlation-id: d7fc52ca-11b8-4758-1ae5-08dc183d8777
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rj4m9bC8ViKHIZ0KlEl+9+o/AbU4EvTNGBgHVd0Adph9Nj/sv5gIMR02fH1jTS/awptXkC9t8Y8Xyr4wn4cEnVtX8quVOk/TOvXbCLW2xG3r1M0k3I9KBrPPZ5fOlMh5FzEMTMNGkjBl60tVb94RIUqKM4lliJtzXyUovoa5Sa+SSzR53hQcVZiDxzufbdhOamkmDV9+ydmw9ARayv68iNfa93JedjhBv8kzga7DMm4brlaaTp1dKe3DmEMwQ9EfJyd+yvFezVBiXzNr9B2us5Cv018ogfjPoeMnKkha/mBX0D5it7DmIPKqk2hiTAKsWmCkQkjZZYkiHOG0j4XomU1fAt4bBaexH5j3Zo65IJz9LLVZv6IXcKFBpeNhnskKeZ6SVViyws/0r6q/Wy4f/h8ZOzP7xQK8Aak9xKf/DKsG1kVmV9wKOnHE5GwXVYEZAplnXY9u+AKJ1EeilM5E2E+GfSV8VzDOTkvV1C0LEQ6O5R31TRR/4GIO+5o63U0drGTihEMkRjLcsFb8J+IJ8GAQZU6/eJrOkjzeztpOeIvLYHq0CukznlnYM3HnG1yQ71YMOln/+79HRPwv+Hqh2NVGga38ZpQ8vgqblK4x7bs/YboSPzj31ab8zd7AuM0W
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(55016003)(83380400001)(33656002)(86362001)(38070700009)(122000001)(66946007)(8936002)(8676002)(4326008)(71200400001)(38100700002)(26005)(7696005)(9686003)(6506007)(110136005)(66446008)(76116006)(66476007)(64756008)(54906003)(66556008)(316002)(478600001)(52536014)(41300700001)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Rq/+QcRQ2cNb8Qi1nqb/vdIDq9d1aB56YGjl3xD/Mt8ebqnAojVQGX4vad0o?=
 =?us-ascii?Q?d6HWMrD80foykDd7JACFbB5vaI4nqEJje1CDhJDdWTn3txPobZaIa29qleeJ?=
 =?us-ascii?Q?c9X6OC8rW7iplK9yynuS9pvV5STHfZjmXL/iYBZoGFOCbTZYceOE+5uoJTqd?=
 =?us-ascii?Q?KaH06m33ZrP8PdvMBKDDrvy5m9Ui6xlL7FX791OVl8l+6u4ZIx24Azn/VLCi?=
 =?us-ascii?Q?IoI1cH1e+b7Mgdvv8I/eZZAmWRTGUAr+JWRD2WgQgNo92TbmoFFz+AlHZorg?=
 =?us-ascii?Q?wJ9fVMSNAvRrWBy1O1UtLqCzuKv5PRKYu4YfvQJVxa639fvbimXSSNC7pRUN?=
 =?us-ascii?Q?v19G/9XCjnAlnYV1/UW2OuI2tQvcQr5oj/d2Va7lD5bDBo1zyqAQM6DDBQxf?=
 =?us-ascii?Q?EvPX1laoDNwtv5o2vfLSL34kYjlrsL8E4dgVWou9dbpE2ZqBsnURCNXulxrH?=
 =?us-ascii?Q?2KXeyCDlicCu+UeBiAN01n7cBj4bFYlu/JAkaPj/ENAA64laW5Vj/dn6+Ska?=
 =?us-ascii?Q?H1imIyhc1FMvGcve6GuJISxsXlES6xNRshBEcQryJE3WHn0RRTaF9zx+aBN3?=
 =?us-ascii?Q?OA0ar8Iocm+N4xu+tY5QStYIuWHFt1Nldzn+VHuM2VIUGp5hT52I0fj/mqTG?=
 =?us-ascii?Q?Lv71rhM+wUpy/Z5TD6LtQyoJOdY84IaGTgg9px7rVp7epX5tSMgG+T2OuJCd?=
 =?us-ascii?Q?YD32LPCDOW389OZ7P6Jm83+oQCSH5bMl/eTeRwfi0M0cw+gwgFpJZlX5/U3/?=
 =?us-ascii?Q?QUTT5V1lUrNGo7S2saAmiORzvZbXTi+A1Hkws+O7TcmtYjZQz8kRPfJDigqF?=
 =?us-ascii?Q?qQdSgenE2gsea1GKNBIxqpQPNewu9I/1gktHmKNQBHLUZNb7N6gOM3+rrkjf?=
 =?us-ascii?Q?Es04N026agY6G7o0e/Bw7p6dYHGdxOA35kfGDZZsBoqw+p6730L8Sn7jY50Y?=
 =?us-ascii?Q?JVElYfVkLu2CmIDH7PmlJRXvJzbCB41wyTl27vKGoRM8kdTZJ5sl1NXmozAp?=
 =?us-ascii?Q?R5W42I/K20HOGsmHikawHGtu5NTfZHiVkVmzmQMIod2Ab7Ay+KoK/VeDPz+X?=
 =?us-ascii?Q?aWXDDJjq+EzKMMtqQSl13jQLcIIfReXDtOAy33uJTWyODzg8AJbz/k+GG5Fm?=
 =?us-ascii?Q?QCmpWWAeCJfbX0ktClV2hy0bxcNBDstPTP5dr+enmw44ug3r/oJupLsySHng?=
 =?us-ascii?Q?KkiTC7bnpXWys8XOjawQjj3mc5d2OCllOuVB2EZgsHC5wb3xHFjNqVw06U7+?=
 =?us-ascii?Q?R6duMk9maRJoifbFRkENnNkf00R3t/1B7ug4NlSKH9+WiNkR+rKneAMcZagA?=
 =?us-ascii?Q?nrMQPmn4gk4M6G/bQ/5mnlx2gO0Aanxnb8v+w2eunioH1HIDf3IqCT4Dn879?=
 =?us-ascii?Q?vZfYiOmEggbRmeyg3+5c0qUEeBor/Xw6//NGJaJprjrjtZuNho3Kd5OMeZVy?=
 =?us-ascii?Q?qpoZ/ruUySKUmARzrlW/8l3cEDuySZsgYb3r3dgc1LStMEl7HnFNw9qwSNqk?=
 =?us-ascii?Q?WU0xDYq92do1IWIziyHeCXItyP45Kl5gjZn9WqwUtT014docrasLysvElGYe?=
 =?us-ascii?Q?u6uTU4OuxzA7Mp4+pX4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fc52ca-11b8-4758-1ae5-08dc183d8777
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 15:52:52.4185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZuN39VQkVydiXt6sQWY3GAtER7tYYui5er56+M2H0HwVLKaPdmq723eKu4aBic7tgWgXEAgKS1wt3wSMDVswoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8994

Hi Alan,

>=20
> On Thu, Jan 18, 2024 at 03:54:16PM +0100, Greg KH wrote:
> > On Thu, Jan 18, 2024 at 02:38:58PM +0200, Heikki Krogerus wrote:
> > > It is "being used" when something (user) acquires reference to the
> > > role switch that it provides. The "user" is in most cases USB Type-C
> > > port driver - what ever knows the role the port needs to be in.
> > >
> > > USB role switch is meant to act as a "resource" like any other. So
> > > when you acquire for example a GPIO, the gpiodev driver is pinned dow=
n
> > > by calling module_get() just like this driver is doing to the switch
> > > provider.
> >
> > So again, if the hardware is present in the system, the module referenc=
e
> > count will always be increased and can never be removed no matter what =
a
> > user does?  That feels wrong if so.
>=20
> It's not quite that bad.  Even if the USB role-switch hardware is
> present in the system, the module controlling it can be removed if the
> role-switch resource isn't being used (which will cause the module count
> will go back down to 0).  This may require the user first to remove the
> module that's using the resource.
>=20
> > > > Any module should be able to be removed any time, unless there is a
> > > > "code" requirement of it being present.  The driver model structure=
s
> > > > should make this possible if used properly.  Trying to much around =
in
> > > > various parent devices and the drivers bound to parents should NEVE=
R be
> > > > done as happens here, sorry I missed that in the review process.
> > >
> > > If this is not something that this kind of device class should be
> > > doing, then let's remove the whole thing. But if that is the case,
> > > then shouldn't we remove that from all the other bus and device class
> > > drivers as well?
> >
> > I started to remove it many years ago, but then something prevented tha=
t
> > as there was actually some valid uses, but I can't remember at the
> > moment.  Try taking it out and see what happens!  :)
>=20
> The problem here is that a device is being used by module B that isn't a
> descendant of the device's driver module A.  If B didn't take a
> reference to A then A could be unloaded while B was still using the
> device.  When B finally drops its reference to the device, the
> driver-model release call would get a NULL-pointer violation, since the
> code for the release method was part of A and has been unloaded from
> memory.
>=20
> In the current code, B takes a module reference to A and drops that
> reference after dropping its reference to the device.  The bug that Xu
> Yang wants to fix (the original reason for this discussion) has to do
> with the way B drops its module reference to A.  It gets the module
> handle of A by looking up the owner of the device's driver -- and that
> approach doesn't work if the device has been unbound from its driver,
> for the obvious reason.  The proper solution to this problem is for B to
> cache A's handle at the time when it first acquires the module
> reference.
>=20

I've tried your suggestion and it appears to be working fine. Now I'm not s=
ure if
the module get/put parts should be removed or to fix the NULL pointer issue=
. I'm
working on this issue, so I have time to fix it. I think if first way is ta=
ken, the status
of usb_role_switch device should be updated when it's registered/unregister=
d. Or
other issues will occur since the user doesn't know the change of usb_role_=
switch
device.

Thanks,
Xu Yang


