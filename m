Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063CC1DBC6E
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 20:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgETSOO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 14:14:14 -0400
Received: from mail-dm6nam11on2137.outbound.protection.outlook.com ([40.107.223.137]:38017
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726560AbgETSOO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 14:14:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/OySGyVSujhFe7KGpgR4SlemI0vMebtsRcDZvWvJLGFk25sNZ8As5sRaxrSnKcBML5U/Yib7fMycOVAXLXDR96MwspEiSnLOTGfn/2RkFUH2f5q/qXe7Ccs4+7KgZOg+I7UaeV32PKGdZwBdPe9AwRaVWP3hQmOeigTWonw++LSZBGihxLBI+YBi2pqvIam9Ko9CYwk0k3JAXH545+JtA17oH9hjyda0ZOhbD4k1m5mSqNC2ywt20+xfTBCo1eI3WXWn6IT+cAh77OKbUdgrwAJ+m1ncRjtuZ3OGLbGaoe7MeoCp6si9jYB7c0C14Bf0Pk951SoWNxb3A91FANT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+Qgw7b8lCP2akUGIwxf2OOH9ZOC5WyfMFT7Ta46pxU=;
 b=ED7rljTn4AryJ8NUsYiRwUBzorqixbxxQNnr07fbWOmQnOAPc+ed9QxWbl9+/Efehcc1Me1wfyNs5FcZ6QYQcfGSHfm5uNZZ8i9MzBczeKifmksnX+ZlqBeoT4Y36WV+zEXSm/YU7id+5TbD1UitkaROhaqIniG2yYWcfoL8H11cI29/i/sQwgYR8JX19WEsG3ObK2Z3VVCThkvpXaEp9TYMF1zcDv57v9463v7yBi4uZRAXkvezVafRnvZyguksEZkQ8SlSnwcWQ8jS3L9S9Q7YqBPb+EKotOR7r34FHawufDlDTnDYl5Ap040zgWGBcYlVeO4vjgWtHbN/S0eGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+Qgw7b8lCP2akUGIwxf2OOH9ZOC5WyfMFT7Ta46pxU=;
 b=PMh0d6jHFQYWNockW9Oy/XeZQKyuEseu2EcpTlAH090Wp+EvH4OvN5cXUWAJva2hQxNgp3uC3Xk7ZazcbKQLDWdAZkgRJ5NLsysHkaCZpVhBi3J7Q+b3gkYypfFaK0aCy35XPK60iLzM442XdKt5Jhng+uWWTjtTg+184j0/G+8=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4722.namprd06.prod.outlook.com (2603:10b6:208:58::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Wed, 20 May
 2020 18:14:10 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 18:14:10 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     Greg KH <greg@kroah.com>
CC:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: RE: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Topic: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Index: AdYuxNmskfT55oS6Rb26qZi3a0k1HQAAXJ6AAALdtDA=
Date:   Wed, 20 May 2020 18:14:09 +0000
Message-ID: <BL0PR06MB45484699A1AA2D89918E9FDFE5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
References: <BL0PR06MB4548B811CFD66D0AB61ACD89E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200520164707.GB66231@kroah.com>
In-Reply-To: <20200520164707.GB66231@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 613e618d-b54c-4930-0a9c-08d7fce997e2
x-ms-traffictypediagnostic: BL0PR06MB4722:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB47221A626EA377F3BDA87B20E5B60@BL0PR06MB4722.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yo0I5c2Yje0Tb2yBtQRw1BApjj46Az3dRsw2T/4itKc936TCkoA4o+tNkxVR7PFHveFjCaQbrnkicQuL5E7EZL5cD9pcZyz8L0hspO3anTe+owWCIseps8xuYTOZae8ftYuDcph39HpMxY1WmNhnkQRmhchKAwTizgEco9XSalr/2jkwTIYpJM7cQxIDI4IHamQaAQmwOeaLR4Gsbn7Ds+gya2Gk02pGTKG42dR1gWf0Liw8q/FHgV9esQDWo8X8mcBbyA7nuy9oolZ617VqNZhjGJNXgSxnQ3Hl3k2O7qDLrkuCQtAyC1H5OcciuCX76WSLNzi2+0t+UvUVp+lzyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(54906003)(9686003)(2906002)(6916009)(786003)(55016002)(316002)(4326008)(478600001)(75432002)(8936002)(8676002)(7696005)(64756008)(5660300002)(6506007)(53546011)(76116006)(66946007)(86362001)(66556008)(66476007)(71200400001)(186003)(33656002)(52536014)(66446008)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 0FmD9khkWtWr0jrMsz/WVL0aiZWWobYiV/GYWRljw6txC+BUVctTC6bKKfoH99O1xPQbw6nXJwVNku3sAdmZQwBFaWJahbVtH/iKrHK/qnXvFAfWTuShfLWzF54/vGAV64yTG6ETu5pHZWmQ4fYJraqdchS5uxnSTWIbXFYyvE4CJ/KdZdQjQ5YspKEqWUn0/utxU+4BwELrGRMg7W1zLY7QWCEemTf6ZmG064jZ5KOaCiDP2u5tvrikr1AjkDsR9SYs5e5TREur7oENFWnC6Ul24mOJJHHWk4WzGKaycyRacDjBptVlu3+mMTNQW4X/M5RVgOZvxnnkiwx2AKJOFjq8IgCuN7nM47PQYImuDjj9ricUlnLSMxOAiSkpns86asj8x5veKelcTjz6AttVDGEKkeebpwyb4ybjv04/WHC43gyMXGlXziGrZJAoUqGuHgpjocjFUA6sAkzMSwVxS0RYroktiNOwJNQ4RNsePkJ7tydT/rSRuWSsZ2iGV/Cq
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 613e618d-b54c-4930-0a9c-08d7fce997e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 18:14:09.9958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDp8csXmvT7wdYuSvbQsOMvgZOhJz1k1PPOQlvnCIZ3Drli8x93ps3jW2XMwWyCut/xGKJKMR3IOqQZ+6o0HrQaIwLLpe9Hf46ImjrGB6BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4722
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH <greg@kroah.com>
> Sent: Wednesday, May 20, 2020 12:47 PM
> To: Changming Liu <liu.changm@northeastern.edu>
> Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org; Lu, Long
> <l.lu@northeastern.edu>; yaohway@gmail.com
> Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negativ=
e value
>=20
> On Wed, May 20, 2020 at 04:37:50PM +0000, Changming Liu wrote:
> >
> >
> > > -----Original Message-----
> > > From: Greg KH <greg@kroah.com>
> > > Sent: Wednesday, May 20, 2020 1:02 AM
> > > To: Changming Liu <liu.changm@northeastern.edu>
> > > Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org; Lu, Long
> > > <l.lu@northeastern.edu>; yaohway@gmail.com
> > > Subject: Re: [Bug Report] drivers/usb/misc/sisusbvga: undefined
> > > result when left shift a possible negative value in
> > > sisusb_write_mem_bulk
> > >
> > > On Wed, May 20, 2020 at 03:51:04AM +0000, Changming Liu wrote:
> > > > Hi Greg and Thomas,
> > > > Greetings, I'm a first-year PhD student who is interested in the
> > > > usage of
> > > UBSan for linux. And after some experiments, I've found that in
> > > drivers/usb/misc/sisusbvga/sisusb.c
> > > > function sisusb_write_mem_bulk, there is an undefined behavior
> > > > caused by
> > > left shifting a possible negative number.
> > > >
> > > > More specifically, in the switch statement for case 3, after
> > > > executing
> > > copy_from_user, the the lower 3 bytes of char buf[4] are filled with
> > > data from user space.
> > > > And these 3 bytes are left shifted accordingly to form a 32bit
> > > > unsigned
> > > integer, swap32.
> > > >
> > > > The potential problem is, since the buf is declared as signed char
> > > > buffer so
> > > each byte might be a negative number while being left shifted.
> > > According to the C standard, when the left-hand operand of the left
> > > shift operator is a negative value, the result is undefined. So I
> > > guess change the buf declaration to unsigned will help? Given that it=
's only
> used here.
> > >
> > > Sounds like a good idea, patches are welcome to fix this.
> >
> > Hi greg,
> > Thank you for this recognition! This means a lot to me.
> > Here's the patch as we agreed.
>=20
> Please resend this in a normal format where we can properly review it.
Sure, I'm so sorry for this inconvenience, I've sent you a separate patch ,=
 hope this works.
>=20
> But:
>=20
> >
> > Best,
> > Changming
> >
> >
> > >From 14ae7c67ea3fb96ed6bea0bc9919f3c597308813 Mon Sep 17 00:00:00
> > >2001
> > From: Changming Liu <liu.changm@northeastern.edu>
> > Date: Wed, 20 May 2020 12:19:37 -0400
> > Subject: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
> > value
> >
> > the char buffer buf, accepts user data which might be negative value an=
d the
> content is left shifted to form an unsigned integer.
> > Since left shifting a negative value is undefined behavior, thus
> > change the char to u8 to fix this
>=20
> Properly line-wrap your changelog when you resend this.
[Changming Liu]=20
Got it, I believe in my patch, I properly line-wrapped the line, I hope the=
 patch you received is well-formatted.=20
Otherwise, I'll have to send through my gmail account.

Sorry again for this inconvenience.

Best,
Changming
