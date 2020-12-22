Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C009D2E0458
	for <lists+linux-usb@lfdr.de>; Tue, 22 Dec 2020 03:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgLVCX4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Dec 2020 21:23:56 -0500
Received: from mail-eopbgr40057.outbound.protection.outlook.com ([40.107.4.57]:46830
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725825AbgLVCXz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Dec 2020 21:23:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcSmzYUcoOPXEBYgqxohr0/k4KPfRM0PuGalpvr4kKg1RyLX3FsT6BmJl5XlzIwFVMZRObdRJw6TUlArAHjTMimzVcVw3SbwwQVqxPl0xMWXVuxKEdUlU7Fk3POxyHJMd1J50r/j+b+5t2gMsunxhbgtEs+4k0ibpfAH0GtRsJZpJYdoqDrmoxSRBp8OiLI/rz1sAk2YvGnN7aZYA547AIMOQpmwdbdFiabvRjr6t+2cJDAu8jfXzAEtWj4wO3d8vyVi4qzK7qMahdmaJ3Qi+/fYzaDNxaYv7YaEAKxNXPkCjYRXzCcEpECB+GtWf2b1Yx8czunz5MsiCmojQj0A0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMHpbjslkMgJPxu7KiaxD53leVXlL9hECR0uGPv5Wm4=;
 b=ZVROLvpTtuVH56tdk65nVYWn267viWKnzE12f8dl8vI1FWT55ozPH8O0BR0qudmUBcnwVkhfxDtxpIfxjlkO4C4Dv9+ZVCWwclMFQrY5D3pq9XPQkCEkE2w6sb9w26eNCg5eAZiM//MTLTIiRfL0NqyrqPij36BsJgY8j0/F7+aDDz1InDCAR1d9wumulWLBB4tpWQdrzr1Iws3sM8njzqjKExt0aQRtDj3XtgVND2DZSOlV7JoJO0H+XEP/IEzaWKWDZyku1qeukKON/siGwTXTYdWw2jhXJeBVg6TiQpVrWrbHADnWvYstqQ1efPQbBH0p100TRjfurE9ykAVS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMHpbjslkMgJPxu7KiaxD53leVXlL9hECR0uGPv5Wm4=;
 b=k4t2sV+o5F2WxVcZmRcWQ+193Xss18JgeXX5Xlk0hsU/GI2LwbW/ZlTBr95oelTu8jZgq4+4+oWeruQosjr7I1B08KofgRnhvNp4AtuI727xmzb+yvRW4Ve6QEHF8XXsPuhiCOCW7vnI1w1Xb5kryXtuofzYGuiywNIVhSv5snM=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR04MB3013.eurprd04.prod.outlook.com (2603:10a6:6:4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.25; Tue, 22 Dec 2020 02:23:07 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 02:23:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@ti.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Frank Li <frank.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] of: platform: introduce platform data length for
 auxdata
Thread-Topic: [PATCH 1/2] of: platform: introduce platform data length for
 auxdata
Thread-Index: AQHWzvpRc1lpsn9SoEybCA1XxhexYqnwdyeAgACuF4CAEU8X8A==
Date:   Tue, 22 Dec 2020 02:23:07 +0000
Message-ID: <DBBPR04MB7979702AC5456ADE17604AEC8BDF0@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <20201210134215.20424-1-peter.chen@kernel.org>
 <CAL_JsqKxcWjdxVHSSHKKRtshwOXeodjQWCYt6G7asJYjjuoWQQ@mail.gmail.com>
 <20201211020155.GA490@b29397-desktop>
In-Reply-To: <20201211020155.GA490@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 634e869d-6291-4c84-b965-08d8a62084e6
x-ms-traffictypediagnostic: DB6PR04MB3013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB30132650E601A441797951CB8BDF0@DB6PR04MB3013.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HDG7rnmEqdzva15Ko2uF+rA7He3m/+LbAksG7I5QGwjcjw4ZFnaLmC/VQQypRuf22hjQbf8LbUnJ/nzbu7l/ebzG3Ogll2eckJ3RzvObsmjjdeTI/VO4Q4IJ/DAUIwXEPlqPICCXTp7xn71liMKloQg5GEOLgcoh6LN7EFNKwBKmxYo408aLWNFgh8HWOr8tVU/wRlIXsEsYhF335NsUxaR8VGznVacWsOajMWrxW5R2QknykI6dIQVa6qfkX8/OgJUyFEF5Vs8b1faeJIN1IqbZIM7PnUCnOnRP+9eJQF/gxwdUqqNpa7V70A1Ar0j8690C/KAMs3uRYA0FarGzNrw62kSAt0sdOnEqaxeWYNzna6KDbKQzZR6LybMHNS2DTA0MowcsPc1ExM6xOHrtgA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(64756008)(66476007)(66556008)(66946007)(52536014)(8676002)(86362001)(44832011)(71200400001)(66446008)(76116006)(5660300002)(8936002)(2906002)(316002)(33656002)(83380400001)(478600001)(54906003)(7696005)(186003)(26005)(53546011)(6506007)(55016002)(9686003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wPa82aPsRxzSpTYWNJDfKWNxhHOpJO2ff49N6SD1AOF2D6qEfyOJq8BVl1cx?=
 =?us-ascii?Q?H64txiJL1ZfRuTtO77XuFVqSigP40eZNx3iOVpn2OyhmO/DBygKzqkR8nc4U?=
 =?us-ascii?Q?L2WZzuoJZ98445FX1UBR/mLsGH5iFJ1Uy6Y1sWEXsLcmK3zo5+n51UiRohxQ?=
 =?us-ascii?Q?8tH+cKbajOXJvqFv3eclE8i0UEm4D3bGTUTFpYcNRN/2nYYDJX/Hp0NsujiR?=
 =?us-ascii?Q?eE1YQ57zt/RbCxT6lX6kHyFqvGucvuCPNmGgPuBgJXdTciy2GzqlA0TyucYC?=
 =?us-ascii?Q?ZVIZBnz8udeYx7sdxDwosNfIKrCw2ocCzkR/e7U/IQkS7C7ZUWcobemlhojx?=
 =?us-ascii?Q?YFyY6l1+b8zEYBDr/CrUbZK0K1usHOb1hZ2lXlkJEB5ZqVSNZmJrE5+ZMV2g?=
 =?us-ascii?Q?DA79HjS1ddRpTp/Vy6Ct8kOllPzDODgKXsDi5UAjbavQi5IZE4sxMSbXQEqn?=
 =?us-ascii?Q?QwbXisNGSwlfFun2o21wm3hbQABEpPzCYtp7FgWykUUr1v3QBG/x7STc3UC1?=
 =?us-ascii?Q?ywoSGxh6traRn1Y7kF2C3uxoRmvU9Gik5sK3VSdrBKLIO7XPTPJZ053AqDO4?=
 =?us-ascii?Q?PUt5g3OhK3fwvi9A/+l4OnSYLk92HG01CAybjF5G4TLnmvhnPG/qwo0uyzr+?=
 =?us-ascii?Q?1TGA4ibTcwGKFi+Il4VboQJXDjnsK7N2u7njYm8U6mThoQI7gcyKKKUYk/D2?=
 =?us-ascii?Q?keqaILQZDt8ZHO/XWvBlyiyoBotiLq45lADvEiT0LuBGMtGnKg0k/a0nMioS?=
 =?us-ascii?Q?O/i+YrkrS5w8xPFA5k1qamFDlwWSOXaf0kX9joEirJodaeup/KbrKOZsKuzK?=
 =?us-ascii?Q?CQmCUgimnMf9Gm8pic0znQO1ratWS53v3VbrlnxVuWEvNN7YVzkUXotNwi1V?=
 =?us-ascii?Q?xphQ9RJnx1wXxgLAN6Xpyz2dyZEmncxlT/pYSnoq2VFhAaDeb9skO/6Pn3Gl?=
 =?us-ascii?Q?ft99Spn8uhKXpOvzZ2+oZ8cBd3uUXm/9koljs8x2pJM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634e869d-6291-4c84-b965-08d8a62084e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 02:23:07.0946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NKJ2Ldctnt6dHt40EWsOi9CMxrI7XfNC/gFrHXh+58tMfaC79/WPUtHksi5tsL/Ce4/0yshymXF6/LEGpQMKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3013
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> Subject: Re: [PATCH 1/2] of: platform: introduce platform data length for
> auxdata
>=20
> On 20-12-10 09:38:49, Rob Herring wrote:
> > On Thu, Dec 10, 2020 at 7:42 AM Peter Chen <peter.chen@kernel.org>
> wrote:
> > >
> > > From: Peter Chen <peter.chen@nxp.com>
> > >
> > > When a platform device is released, it frees the device
> > > platform_data memory region using kfree, if the memory is not
> > > allocated by kmalloc, it may run into trouble. See the below comments=
 from
> kfree API.
> > >
> > >          * Don't free memory not originally allocated by kmalloc()
> > >          * or you will run into trouble.
> > >
> > > For the device which is created dynamically using
> > > of_platform_populate, if the platform_data is existed at
> > > of_dev_auxdata structure, the OF code simply assigns the
> > > platform_data pointer to newly created device, but not using
> > > platform_device_add_data to allocate one. For most of platform data
> > > region at device driver, which may not be allocated by kmalloc, they =
are at
> global data region or at stack region at some situations.
> >
> > auxdata is a "temporary" thing for transitioning to DT which I want to
> > remove. So I don't really want to see it expanded nor new users. We've
> > got about a dozen arm32 platforms and 5 cases under drivers/.
> >
>=20
> How to handle the below user case:
> Parent device creates child device through device tree node (eg, usb/dwc3=
,
> usb/cdns3), there are some platform quirks at parent device(vendor glue
> layer) need child device (core IP device) driver to handle. The quirks ar=
e not
> limited to the hardware quirk, may include the callbacks, software flag (=
eg:
> XHCI_DEFAULT_PM_RUNTIME_ALLOW/XHCI_SKIP_PHY_INIT, at
> drivers/usb/host/xhci.h)
>=20
> > > +       int platform_data_length =3D 0;
> > >         int rc =3D 0;
> > >
> > >         /* Make sure it has a compatible property */ @@ -378,6
> > > +387,9 @@ static int of_platform_bus_create(struct device_node *bus,
> > >         if (auxdata) {
> > >                 bus_id =3D auxdata->name;
> > >                 platform_data =3D auxdata->platform_data;
> > > +               platform_data_length =3D
> auxdata->platform_data_length;
> > > +               if (platform_data && !platform_data_length)
> > > +                       pr_warn("Make sure platform_data is
> > > + allocated by kmalloc\n");
> >
> > Isn't this going to warn on the majority of users as static data is the=
 norm.
>=20
> This warning only triggers at the cases which driver defines auxdata and
> platform_data pointer is in it. Besides, directly assign the address of s=
tatic data
> to device platfrom_data pointer is wrong thing, this region will be freed=
 using
> kfree at platform_device_release. Using platform_device_add_data API is t=
he
> correct thing to do that.
>=20
=20
Hi Rob,

Would you please give me some suggestions how we could fix/workaround this =
issue?

Peter
