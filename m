Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6FB2946A5
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 04:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406403AbgJUCna (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 22:43:30 -0400
Received: from mail-eopbgr00074.outbound.protection.outlook.com ([40.107.0.74]:45120
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406385AbgJUCna (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 22:43:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEFqRhycn01uQOV8zPGCqQqDoaM7MJiPw4ouwUMvWUWQsXjw8qTAtoXzdH4xvZp8kZJwyGNYghZCuKecjpi3H/zeSFykaP1oEj6eB8Y/QpLjYMch1ElKXNJoR5wHY72lTb2X1bv/jAk+7snNrHrGdj6Ngk8RI/0HERCcDppKfE+rtQzcMn0gpOVnPzNjI6QOZ0FI9u0XSSe1rlxJ5JGHwDnZmueOqLyHpqN4udy/mZXfg4vEi6wgM+RUoAJOEyppUjZoLiggbpsK/uqFuAn4xqphAKC8Go7AO0Sjki06Rps+mhfxr+7+gRygcDKZR0jVej3ZLMpJLjYRZLjGX/Gg+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSMgINsbTJr9gdlIO/I3iKLuldmtzxX1ryn3/bV3KYM=;
 b=QsObvuV9Fq6no9P0ajJUvzfPCDhRzfkMEPcMBIIeXYEBNF5nGpyW4JUhKVzyYOPWTlbkMlProVVyD4fIfMuj86bxtSQnj/Hc8rlZpRV1UMIH3GzbOYKvSZEyCPzbEoVEXRs1M/jYutXOHzL15Fc93bTAHVWekKOeASAGtwIqQYgeOwU/2IzJEHJ8zr1R8fVxO6H0eEPKdG28XmyElu2AJVo0dCrN7o7SQHR4VheVR4okpHsulTnp32EhdCdCcl3DR4K1/v7PsD5jUdlDNhtbzWOXk0hp8hcAO6okjjkf9tYOGboX7WaovmBZHalc0uLOKFVL8rrZGsjE+ntE2lbcLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSMgINsbTJr9gdlIO/I3iKLuldmtzxX1ryn3/bV3KYM=;
 b=gQClqs6ZOK5TMmFLBT2qeNZZ3ma+fgDeC4DfNlqnRr6mISQdYc04i4P35PE3OYFjaZGSk+uWljtMQrYR3hWn1Za9pabsocm9gHyrc59TpIQ4SXi2TM6aTI/alXpjKN9etkdX2yaiikz6NwEZTc1lokn+e0lwMfaP2sAdIbNlEOw=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4526.eurprd04.prod.outlook.com (2603:10a6:803:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 02:43:25 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 02:43:25 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v4 3/4] usb: typec: mux: add "compatible" property for
 switch match
Thread-Topic: [PATCH v4 3/4] usb: typec: mux: add "compatible" property for
 switch match
Thread-Index: AQHWpfeqLoWTCCsls0ukMiojFHP2O6mgAgQAgABxq4CAAL8cgIAAJtgA
Date:   Wed, 21 Oct 2020 02:43:25 +0000
Message-ID: <VE1PR04MB6528048B59995264D78EE9D7891C0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-3-git-send-email-jun.li@nxp.com>
 <20201020060448.GA29717@b29397-desktop>
 <VE1PR04MB65285BE4972D3C7EB36E27D4891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <20201021001538.GA26381@b29397-desktop>
In-Reply-To: <20201021001538.GA26381@b29397-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9db9c9df-7702-4850-3b07-08d8756b1562
x-ms-traffictypediagnostic: VI1PR04MB4526:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB452605DE1AF6B4EB187AD14E891C0@VI1PR04MB4526.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wizsTPJ42FYphGpzADQsFs/RZCV1NNM7P35ZV6hIdlz97ZmoC/xtSe7bjIsQM70NPdhiMtwRfCa5kUp6xVzi48jVo76+Lprs7sRsfd/G+oHQkEcZMKLMyucp4GRamy9qXOJsYuyjX3GzYkaRUQcUsOOsubg+d+09ZY8DsMac4FYLnNb2bAxCJSUQ2RyTjl6YKbViDl5GRBCk8K+56erAozuMl+DOkpT4wsMvou0KVoP7G3NzZaDGettZOUNWnOGcYtqSoXluykXgfUhTBIX8U0SEMIv27TyuGCLxfJB3qfGEzzAwEx/KDxptEZx41I2OHlwUDu6O6iBKgQEo10eysQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(86362001)(54906003)(7696005)(478600001)(6506007)(26005)(186003)(316002)(71200400001)(53546011)(55016002)(8936002)(2906002)(7416002)(9686003)(6636002)(33656002)(4326008)(5660300002)(66946007)(66556008)(64756008)(66446008)(66476007)(83380400001)(52536014)(76116006)(44832011)(6862004)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: NQW8e05uCGjcAo2w7/ayXKCp6j6+kVZABB7n3NuY9pNLc1by8APqFq6u3x6OAOAXFy6B2BbImZZBWDKod/e5ZLsDv7btQBU/YG6VUVXeDDl6Q4UJD41Vt7+xEzaRyQ3EKCBoe6zkeyyobwakzQmm6qmNMnogboOgEBvph0h2OX8bJqy4l7cqeFjx5K7IoVNLpw1u4x9NU6+DTEbp529OhxFjlmOaHInci+k96pOEyExTdHTFsChhlro88f4YiUs186lw8kNwe/kCDsq3Ou1ge638X6FqCkZ1XzZQBHSwbX6U/I0wFrICgJuqM1MI+3eOrUcogqgOhGxqTYtq825B0UohH2KWnPFKahTNVEc/g5AkCVMO6xM2Fj51IILi/AeRuq7qnA49R5jQ22kyc/9cWKynhPWvQsBQG3fWMQ/ZR4nLgiMPweKekX1jLB122UkxxRJBOROjc1soMHkYPHtyrPjSZ+BRhPR7ZTOAVAwhavJvJcv1+a53uCZElNGYcoXZfiFDuWNNfGgLcikep+RYjmC0pSj3SauQnQHNPH/BjB1ax5sQBDcYlObbAW2D7UV9809zovoTEHpQ2sF2ufR7RugoAwgilChv/t2Xm0S+6dKzzn3sKkmCMnXM9poow/WZyJGTNGgicrwNJQkaM3G6cw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db9c9df-7702-4850-3b07-08d8756b1562
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 02:43:25.2795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzt/enhuReJUEjGsfBantz8Vf8xVL23RCS3wLVRsPoTcAVj6vNXRcEuxhuz23j75
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4526
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Peter Chen <peter.chen@nxp.com>
> Sent: Wednesday, October 21, 2020 8:16 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> rafael@kernel.org; gregkh@linuxfoundation.org;
> andriy.shevchenko@linux.intel.com; hdegoede@redhat.com;
> lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH v4 3/4] usb: typec: mux: add "compatible" property fo=
r
> switch match
>=20
> On 20-10-20 13:02:30, Jun Li wrote:
> >
> >
> > > -----Original Message-----
> > > From: Peter Chen <peter.chen@nxp.com>
> > > Sent: Tuesday, October 20, 2020 2:05 PM
> > > To: Jun Li <jun.li@nxp.com>
> > > Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> > > rafael@kernel.org; gregkh@linuxfoundation.org;
> > > andriy.shevchenko@linux.intel.com; hdegoede@redhat.com;
> > > lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> > > dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> > > laurent.pinchart+renesas@ideasonboard.com;
> > > linux-usb@vger.kernel.org; devicetree@vger.kernel.org; dl-linux-imx
> > > <linux-imx@nxp.com>
> > > Subject: Re: [PATCH v4 3/4] usb: typec: mux: add "compatible"
> > > property for switch match
> > >
> > > On 20-10-19 17:03:14, Li Jun wrote:
> > > > For those need a dedicated typec switch simple solution driver,
> > > > use compatible property for matching.
> > > >
> > > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > > ---
> > > > New patch for v4.
> > > >
> > > >  drivers/usb/typec/mux.c | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> > > > index
> > > > 52ad277..3da17d1 100644
> > > > --- a/drivers/usb/typec/mux.c
> > > > +++ b/drivers/usb/typec/mux.c
> > > > @@ -39,7 +39,8 @@ static void *typec_switch_match(struct
> > > > device_connection *con, int ep,  {
> > > >  	struct device *dev;
> > > >
> > > > -	if (con->id && !fwnode_property_present(con->fwnode, con->id))
> > > > +	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
> > > > +		       !fwnode_property_present(con->fwnode, con->id))
> > > >  		return NULL;
> > >
> > > If property is not present, should not fwnode_is_compatible return NU=
LL?
> >
> > Do you want to say:
> >
> > If property is not present, should not *typec_switch_match* return NULL=
?
>=20
> If fwnode_is_compatible returns true, it should mean the
> fwnode_property_present is true too.=20

Nope.

fwnode_is_compatible():
        property name: compatible
fwnode_property_present():
        property name: typec-orientation-switch

> But if fwnode_is_compatible is false,
> the fwnode_property_present may return true, the code does not return NUL=
L.

Yes. Original matching via bool property is still allowed.

> Then, with this new patch, what changes compared to original logic?

One more way to match typec switch via compatible.

>=20
> Peter
>=20
> > >
> > > >
> > > >  	dev =3D class_find_device(&typec_mux_class, NULL, con->fwnode, @@
> > > > -61,8 +62,8 @@ struct typec_switch *fwnode_typec_switch_get(struct
> > > > fwnode_handle *fwnode)  {
> > > >  	struct typec_switch *sw;
> > > >
> > > > -	sw =3D fwnode_connection_find_match(fwnode, "orientation-switch",
> NULL,
> > > > -					  typec_switch_match);
> > > > +	sw =3D fwnode_connection_find_match(fwnode,
> "typec-orientation-switch",
> > > > +					  NULL, typec_switch_match);
> > > >  	if (!IS_ERR_OR_NULL(sw))
> > > >  		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> > > >
> > > > --
> > > > 2.7.4
> > > >
> > >
> > > --
> > >
> > > Thanks,
> > > Peter Chen
>=20
> --
>=20
> Thanks,
> Peter Chen
