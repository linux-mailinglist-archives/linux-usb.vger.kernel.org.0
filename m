Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B4F1DD555
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 19:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgEUR4r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 13:56:47 -0400
Received: from mail-dm6nam11on2109.outbound.protection.outlook.com ([40.107.223.109]:39200
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727883AbgEUR4r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 May 2020 13:56:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQ8CXW3kx1G3CCbiIjuiC5qmdV5PlVux7MLRps63gN7Rch52H0RRYDiykgDbm3OttzQtdTsxN+xRdtQcPuw5W33zQvBIn3YxJ+KArWhpP8db+BkgpvoEd5UwQnFbnbCbHH75Rxg7V0NGzF3AkeIb9g5hGEbbnvN3vRo1CNUuHuEdTXkvxUAMYdrHuI611o4KK6CM0sCBC+vAC4dmFK2I6VJ7kIUg3VS//Jj+VXCjTfZ/Sb5EqBEX703/56nkES4lZV3mxztd2Y3mgGs3pXq7SRP/A7q5KEjQoLRWIAO7cLxiTSXcFv1YVrS64w4uXojF5EV5Xh01pIj5HQ+fEERzxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BD1axtB0qq1n9gPIQoTaB+kIMdAOXNC/gXIL8mucSY=;
 b=b32OTOqU/UNbb8DxGENt0o5NXnwajIuGoBpRWcP+dOHIgYtQ2Z+kuHEN1eJWG4SMTEJemnhiZz/r34rz4FKrK7g1kb/oRPS5VbMpxlYzgMbdQ4hQtHsj7XYan3I/Dq+V6LuuEE6HQhFbNWIE2FYe4ZHgQDIgyKlvNdgEjjFw7NWLa8l7A2kS24dE60VVA+cR7DSge6CM8hkOb+kAv7CSzxloAlFseT2WXkZpFh9qXnt/2W70gAHqk6Ps/HbkC12yEx2Wy1g673a+7alofEhKhghuND6lD+p+lNkUakFWhojqFdetFmW39R+9xl7qiQTyt6aij/kyXRmWN2sllz5D+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BD1axtB0qq1n9gPIQoTaB+kIMdAOXNC/gXIL8mucSY=;
 b=C4XLYAxSoOZjl03ILrGbwNlGTmSpuzIvjigaHbTO7keSVoJr8QZVH6UCMaLIiynOzrJtBJIkZXgKQTAWHxYrbaMb3wKLpZc1Kp5tqcitGcCttVgvmTm1NUSiP43xmpiJgxo2lqHRZPS3lh+CKGT31syfK/bcCekx+NHcVGLNbn0=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4836.namprd06.prod.outlook.com (2603:10b6:208:67::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 21 May
 2020 17:56:44 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3021.024; Thu, 21 May 2020
 17:56:44 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Topic: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Index: AdYu0IANqPvTKmyYS6uxDS+D7m5WgwAcgkiAABNU3kA=
Date:   Thu, 21 May 2020 17:56:44 +0000
Message-ID: <BL0PR06MB45480E2A734DEC31AB3F5CBBE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
References: <BL0PR06MB45483EF82A54B8751524A2E7E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200521073627.GB2579717@kroah.com>
In-Reply-To: <20200521073627.GB2579717@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17e1ea97-013a-4d5e-de65-08d7fdb052ee
x-ms-traffictypediagnostic: BL0PR06MB4836:
x-microsoft-antispam-prvs: <BL0PR06MB4836A9284B5FC6E5735A89B7E5B70@BL0PR06MB4836.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 041032FF37
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sj/uErqM3dDYasmdMPqR8nQg/r0QtvagoTjwuWHExW+mHdBT33NJSVfMaQXb73Li8TlCFOmy+Jun7tQpZbL/3VuoFI5OtG6QUxUGliepeMpL6VRNazoqJYNugEgKCoYqNPnmaHcVUYnUYR7iHyHzQLTQNyco3lOjbGRE0j7d171zq81Idq9VkWpdmnjcVf4dUx6h7QjMTduUKvE8/L9aflXNiPq6PVRBfrm8hT+1QnJ/Qm57Qc+Awh5MC6bMZZkLiZfcywQnVkS23Z04DrYc6zQ3onndMxgX3mCWo/HQhldp5/vLDdKd1SEcxYiQerb9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(76116006)(66946007)(33656002)(186003)(316002)(54906003)(786003)(52536014)(26005)(86362001)(66476007)(5660300002)(66556008)(64756008)(66446008)(53546011)(7696005)(6506007)(71200400001)(6916009)(8676002)(2906002)(55016002)(8936002)(75432002)(4326008)(478600001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: EX8TEkBON9SPuSzrIuRQgH/3Zv+kCZqCjShpR/mV2PyDV/AvEWTw6dLkNc7XNWixSUWoioSXA1hezKjwgrn7fsv+FGyOvIQYmnw4+lNnHkU7aAQ6mBcqRcgtLW02GCR515r7nZpwX1+L1/+av0q7XSTluZckmiGkvxjwh5nXozwiv8zCrXDVfIq2MYmIwt9UC2tOc8NijCg6ugzLSLqDB84cMZejmtcYKYzMAkCumA0KzAB0kcLqWurzMm8CztKSMZ4XvM+l+2cRGVAeGKAVBNfMqAK2BsH5IuFl5fMJDEyBvh7fnJqxupQMCUN5UoKCaAlRfgypmkEqWe+CPJUsNM5jm4Zt1UMgYMbW7PwMK4qBUtgadx0W7PiHjo/8kbcBOryMyfe2+gKooE8BX97937vkmBxIgobeXDyAM4czercxsqNvFpYu9ZM9FyZ5W5Zufa47p6Vl08XTlaQ4SsBCma/asmufmQeAyE8f2RIkh8Bt1l2A5DhVwdKJO6pMfKQh
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e1ea97-013a-4d5e-de65-08d7fdb052ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2020 17:56:44.2632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WaF++YZvUv7/TRkKnV9oYUbarsN/nWQtIQAUBMuktCPB+J7tBEMRzBqmtTRFYlTqAKYhrNLy9HjvNP9yCinGVJo1mnrgfyMHdNnczS4mFag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4836
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Thursday, May 21, 2020 3:36 AM
> To: Changming Liu <liu.changm@northeastern.edu>
> Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negativ=
e value
>=20
> On Wed, May 20, 2020 at 06:06:50PM +0000, Changming Liu wrote:
> > The char buffer buf, accepts user data which might be negative value an=
d
> > the content is left shifted to form an unsigned integer.
> >
> > Since left shifting a negative value is undefined behavior, thus change
> > the char to u8 to fix this
> >
> > Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
> > ---
> >  drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/misc/sisusbvga/sisusb.c
> b/drivers/usb/misc/sisusbvga/sisusb.c
> > index fc8a5da4a07c..0734e6dd9386 100644
> > --- a/drivers/usb/misc/sisusbvga/sisusb.c
> > +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> > @@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct
> sisusb_usb_data *sisusb, u32 addr,
> >         u8   swap8, fromkern =3D kernbuffer ? 1 : 0;
> >         u16  swap16;
> >         u32  swap32, flag =3D (length >> 28) & 1;
> > -       char buf[4];
> > +       u8 buf[4];
>=20
> Do we also need to change the kernbuffer variable from char* to be u8*
> as the same time to solve the same potential issue?
>=20

This is a very good point, sorry I didn't notice this.
Indeed, according to the caller of sisusb_copy_memory, the wrapper of curre=
nt function
there is no guarantee that each char in kernbuffer is positive.

However, it seems if we change the function argument type directly from cha=
r* to u8*,=20
Other parts that call this function e.g. in sisusb_copy_memory=20
or uses this pointer e.g. line 770,line 883 must change accordingly.
Looks like many force casts which doesn't look too necessary.

I wonder how about just force casting the content of kernbuffer when it's r=
ead in line 823 to line 829
from char to u8? This seems explicitly fix this bug.

Best,
Changming
