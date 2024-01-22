Return-Path: <linux-usb+bounces-5329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDAF83595E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 03:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7706F1F2146A
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 02:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C99EDD;
	Mon, 22 Jan 2024 02:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="iM60Ig7I"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F88365
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 02:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705890726; cv=fail; b=pzN8aoryqZ1ap1fG7NUTqPclWAy3kRoFqVzBhaqjeHkXD42aiBeqJGKzSFNBXAGUHfH4k8SnPNVi9PHUUfW2vO0vVGSCOIUgHe87AtLyYgAV5H013yIAKUkbXcERlUEm34qz1Y3g8XoerCOejk6x+O1TDKCR0uURCOu11dQrZVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705890726; c=relaxed/simple;
	bh=D4SqFJ4iu3ziWZqascAvXba31NOEchvlA/K3fJh2t4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O4QpldTMd9fomXPv8ux/fOLyaSCXpCmfqMB++B0UwTQsfD7iY8M1V6RZuH6kjdi/Y8JIkn3Xe/fhHVtWY4xQ2GQsBSeXaNEd1CxNtP1abaTr7A2Xr/P9D2GN8MXsokNBx2YHGUCuwUyfqzvilM8y3QjAxZLR279iG5iLpkIGmNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=iM60Ig7I; arc=fail smtp.client-ip=40.107.7.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hyz/neO2dRyreL8HSdMNXlVAIMFlH9d6eAx2tpLUet3UKBfsew/hff9X1KND8jH9C9toG/EGExRQsSlvWsS2SID7LFk769JGtcgnNfYm4bLvN+WOsw5UHNyoiKr0F2u33SHwF/01jrhuczB7031A1pPsqpXHV1INWdfk52WpwZokC5qZbDZYYCjsqnBopjg3gQJMdb+m1CX+yQrNICEXlZz2YhbImQnoL1/95irtnj4VJI6OE7DwrUBteqFbkUwUCKyCLnvBtpPRger9KCE8zSyplkvHTazAvY9iVgLgRSw2G5ia6Fq+9DACbuUgo2rWpHuIrLnDBUNhBsZwLYmBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpFIFIhLXdnRIbqPf+53kPZavNqLN4nvT6AQxZsF/I4=;
 b=KWrJbFxY6AYyB8niJk7HQlBSpiNymCWjDJ4NgdzHPrg0w5exTWFCXxknyhqFvtFEMMj2TQjcVXhzmXilTdWUJMhRYpPr72SW6YDKJEIM5i4uRz8ivoArMXEIY4og9hOQWi1fHF9SGQh9dX3ri7/31AVyX2+ymczMo82e8HQ41tdQHe9VIIXxQ2KqsmO2bNeAgbz6Rl0h0VUf+HrWvyGI/4dUiwuUmmV8w3e2NiWbsQufJpByQxxGcF37an7anMjIm6PBT7SSp5uZUZpA8WFuK1nBY+uVAoJtrDVCmywfZfXzn71daSDj5QWq4oxbWvoKRaRFFOxd0a0kBgoq5qK3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpFIFIhLXdnRIbqPf+53kPZavNqLN4nvT6AQxZsF/I4=;
 b=iM60Ig7IpJmuKNbWLqA89ca/zkkDuj5eKuZoPBdcsEF1gI8Ep7nCnasqnh2Y77Xr9YG7yc+noQBL0NaSxctSW9W6ioyFuL7iRHVe2YTvXZiynngr0fVHVi++H7gfs+BX3D+/D0/t3XVTVmUSchdISrXu8ZQ2XTcT7blWs3Yczo8=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DUZPR04MB9748.eurprd04.prod.outlook.com (2603:10a6:10:4e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 02:32:01 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%6]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 02:32:01 +0000
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
 AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQIAATzkAgAPzOkCAAPAvgIAAx6/QgADCqYCAAOYvsIABzm0AgAAIywCAAC42AIAAJc0AgAE+Q5CAAFXugIAABFVggAASaYCAA80DgA==
Date: Mon, 22 Jan 2024 02:32:00 +0000
Message-ID:
 <DU2PR04MB88225E4AB6DF3D4179EE4EAC8C752@DU2PR04MB8822.eurprd04.prod.outlook.com>
References:
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
 <DU2PR04MB88227057A70E1ED4A6F1CAB88C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <5a16bd56-52f7-4ea0-a2bb-f83fe0e710a7@rowland.harvard.edu>
 <DU2PR04MB8822D855BD8CA7C4FF41F7538C702@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <2d25ce4a-13e4-4ec7-b762-e5de56ff4bf5@rowland.harvard.edu>
In-Reply-To: <2d25ce4a-13e4-4ec7-b762-e5de56ff4bf5@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|DUZPR04MB9748:EE_
x-ms-office365-filtering-correlation-id: af4eb5c4-c64a-4875-8ff9-08dc1af25047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KykBl9looho43CRwR0TTNxonMImuyH/3b0cCmaqFvaunSMv45QHU65qQg0lhCg2J3mPvMBDHceYrzxXbcEOyyeWmrsshbCNYvanHCGoQFJ+sLu0JHmNF8ttLenM6uD0xr4Sk3QRlPCSeAEBg5p1B+dC6AnmdvVpT7icqYDv4EMYzNjIu4wClrdP24X04p3P+HqgDzOipmy0DDeTbiTeNywBG6VPNdh3V5V7zy2DOlBIFZ1WE8tVQ/x8jLafpiDIpifePHXqXqRNm4hA0Q82kBG+20O7UNgW9K3Cic1DnSSievTdJKZ39EuQ2UPPYGfSXHvKZvkYeV/KQD1H3IexMB03qsNlN5w2uKqBDDQJ9C9+RsZa9V9b14kIv71o4ft6ERVDaoy85ZFrY6y6708GuBKYJewj0Tm4gQOFDyLwB11h310HpsXyLOexv0f1n5XGtBataM4pnU31l5P1SUuyCTcjTwHBPm4tugsrF1WHw4dsu09hLNz73iuDf4gSvJWueGgl+WFfqeoOdLD/gTHUHGEHm2qgkCu/7h3rBqYebJn5zcr/ytofYtFRaZzFH8RzDfxKLAGvZkhJXViP/m0+qzDdcrMwWlLXai1F4eHhntGlFxlJJ8930Q1/jp+qzQ+Ai
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38070700009)(55016003)(41300700001)(86362001)(33656002)(122000001)(9686003)(38100700002)(83380400001)(26005)(6916009)(316002)(76116006)(6506007)(478600001)(2906002)(64756008)(54906003)(66476007)(66556008)(66946007)(66446008)(7696005)(4326008)(8936002)(8676002)(5660300002)(52536014)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HMG1Dax2/kS4NCbSEBGIHxfYa2+PTkvFICjb0PmBxdYdYym8XAIYvtNgObDr?=
 =?us-ascii?Q?EFq9nc+pxwlBO2QH97A4nREfh1V0MCWJI9igKXtcHltXaP1THNJL6EX1vuF2?=
 =?us-ascii?Q?AlIA3IOud0FKFJASI/3fnZlzv4SSmp1G5P4xNH0pRwxsw17dT3Y8sfLqN7uM?=
 =?us-ascii?Q?ipHzN6A5D4ZUFydjVpkbbXb6c/ZEqUpgo05XSRS4ccV+haepBDipv0SlDJ60?=
 =?us-ascii?Q?A9W+kXw13bKSRgwdHHXjH7u0BAUzSd3s6A6HktGMS4/z2Hg4XojezHXzYub1?=
 =?us-ascii?Q?xaCoHLk/aw+TGEwcgwBWsq+51iGLJe57XG1L83TkACmQnspa01YIdw5FizVC?=
 =?us-ascii?Q?axnyEVgqyNzHi8boWqU5OnTPWtL0yJOJoU5qJe1asto5vJgcZoVaCo4XZwW8?=
 =?us-ascii?Q?VcluzXP28ViB9YQNhee8FXQAUP7N6ZRhbhR1DUOf3OmG8RdZHDCZ25NE2BjU?=
 =?us-ascii?Q?n2bqUQM2eMMp/7HxJCmYl2t69ypX5xG5GcZVDUx/IGV+rk5rnyGNJnPSNgU6?=
 =?us-ascii?Q?7bttdYhBFE1kDDBalyzK1HMBfnxI9wbozjHPHMGd2gmNnCSTa9wUODGUxr5m?=
 =?us-ascii?Q?HIRcShXFvBn8g0nyFK1P8eGelZm1O49Q+W0H0U6mwah6j8ePRKi0TThF1XK2?=
 =?us-ascii?Q?7gG0DsuOo+Qjd+2h6VC/xuEKoG9YNmPkPO9adzEQozcjInldHzQEkuaYIe+t?=
 =?us-ascii?Q?LQl10sG1zSS6cNfj4KV74dtCTtIZ8elPSo5CmSbbAjo/KKT19+NXgMu0dgOj?=
 =?us-ascii?Q?bpipDnJjnpvj9D9HMXphK4m8mbsv3aveP3gnbIEInhLDMNpEEzfc15B0n9Ug?=
 =?us-ascii?Q?VCJ1mYuGDqgF+YYgtYe0m3BALcqnsgylrdSOZ5l2CsrK3G/+oSg0bY5T7K4M?=
 =?us-ascii?Q?Z7sqbBU7O9Bu7hPAOYle6US91z/hQTLhY+lF8VCRvM6qFhmV518xccXmaD0p?=
 =?us-ascii?Q?ELDCXhTubcRfeIhqLD2N8CVhFMFLzQvZ3wr6jmAnkrYT13XVFpazoaUCtEuP?=
 =?us-ascii?Q?d62J+uT5iJBy0hgctD3bJTHDKAZ7pnaRjn885PT5YVfuBg4ejXkQCfyClYzB?=
 =?us-ascii?Q?Kq2Yr2TZj8jidK6Di4bwg+2VYhHZmN8WDUvygOlsq1vs4QmEKX9tyhVVxDIm?=
 =?us-ascii?Q?ldYojl/jmor/2EdIXuXAxagTX6Mw89kSrqx+krQ5cc4HHfW0aPeRKoYiE0sj?=
 =?us-ascii?Q?nNoaJW6v5H/BYwuFzgvJPjy6sQZFRf7FS7EY8G4aH0osWs+anT6kxGjth1dh?=
 =?us-ascii?Q?sbGoaFpc/9eidieIogo5ugocbqzk55Ezx+FLGHQ7xfCxY59Ifa8DUQXooT8I?=
 =?us-ascii?Q?/7oJt3KMwtjKxjvGGKHNwNiRDRnpji1UWEp05rSsYsSm30Z8Wl9dd+Yymqw5?=
 =?us-ascii?Q?IabD9cei/616eDL4KQFBurwT19R20Svt8jOgQjAX0c5QJNjbRy6KMfqkQz/z?=
 =?us-ascii?Q?cqctR8hZegBbMgBb5x9LbMSBdQUdEM6X/i+TwMHQ2rLAAzDtTIGe42LIh0LB?=
 =?us-ascii?Q?ITkOWCR0OqqBqi/8EdhYW1x4FPWcR9btsx0d/wIIPAqf35ZzUmcmKDY30XfA?=
 =?us-ascii?Q?bigqI38noDNTNDMEYDQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af4eb5c4-c64a-4875-8ff9-08dc1af25047
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 02:32:01.0550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 838G8I+KR2vzyU9Kx5YAHGHPDbq/sEjZRd/WvQP4IiXpei8AXCkUwK2JNtpKtS31KbqKEucxVndnf507uGNG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9748

Hi Alan,

>=20
> On Fri, Jan 19, 2024 at 03:23:50PM +0000, Xu Yang wrote:
> > > What happens if the provider module is unloaded but then
> > > usb_role_switch_put() is called after usb_role_switch_unregister()?
> > > Won't there be a NULL pointer dereference inside the put_device() cal=
l?
> >
> > The get_device() will be called after the user successfully get usb_rol=
e_switch
> > device. So the resource of sw will continue to exist until usb_role_swi=
tch_put()
> > is called.
>=20
> But look: Your patch essentially prevents usb_role_switch_set_role()
> from running after the role-switch device has been unregistered.  But
> what if someone had already called usb_role_switch_set_role() before the
> device was unregistered?  Won't that eventually lead to problems if the
> provider's module is then unloaded from memory?

Yes, exactly it may happen.

>=20
> To put it another way, all those try_module_get() and module_put() calls
> were originally added to prevent a specific problem from occurring.
> Once you remove them, won't that problem be able to occur again?

Yes, it will. Thanks for reminder about this.

Thanks,
Xu Yang

