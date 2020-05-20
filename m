Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B021DB9BD
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 18:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgETQhz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 12:37:55 -0400
Received: from mail-dm6nam12on2123.outbound.protection.outlook.com ([40.107.243.123]:9573
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726548AbgETQhz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 12:37:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVRG3bKycXXYdbs0Q9WURSziwQgmuMSpKVegVaNbIXq5Tn9PFVjfd1kPFTybtIJuxy82l2j44vdN8Q5OXqOJsHpFF+t22rak85z3h2I3IwhJmOl4b622/0hYv1IPp4yznlNOeWuP0oiqm4XWd349cvQ+TFddWhleMiMmI2Y3WBppUs8Z5PBAp7rqLijXOLellQEOHVR3QSYGm4UIFp2IRCffQCnb8jbifUm3sOk8E1UbbywiGNJt67GeAKr9a/9ly99i/ZrzhhArlHbwTv6Hujb5BS2PLEMu2+Z07sY5s/dTuzk2vti0vJmE4mXi+wr1rr3wh5u98//BTu04FscK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pxxTNXkVyXF7hs073evuo+Z52AmzXd4Wpwuw0vSsK0=;
 b=foc+MyRy/kGoDCP/IdAPaXt7cVmOlVvG84jyrcCzmWhc5qzhOvD0/frwp3q2SQTLSrXG72ldE/3CQgZq8Gr4A2630smh9Q1U/WUQvPP7gWtLwQBUUHYrUH6+SvWUd2v83iAxG9ozrFBuZdJbPWUfF8oLtlYMiXIN3bLAJltiWsbPrqxWGKrhszNX5/kiOD2TPfv1YJnZuyQoi/4ySWoCSE4pnxJ9Ku8PySPdk9JhSf7JA2oCObarm0KUu1C2LjkkAnov4KS8GSE8Kd6sMRdtmot2lfF2l+c4W5uzsykSmkxNvIDKjITjL4HD6+XQZukyXm+6+wtXj1cASETGNO5K5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pxxTNXkVyXF7hs073evuo+Z52AmzXd4Wpwuw0vSsK0=;
 b=jcQhGNRKVJrOjhv4xWVuup30lGuV0d4v1dBvEBVuj+mBrvSNq5boSXCuoD+4KbSo3O+K5pwQ55OQmYDKtO2wg3aWX/Uv+Y8uBSPnuvjPz9U+nY1bg8VqiW5pfujmJaWvNsiCFwVlHeUHdsz4dWP+UXYQD8igf6sql+as5Htbucw=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4481.namprd06.prod.outlook.com (2603:10b6:208:29::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 16:37:50 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 16:37:50 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     Greg KH <greg@kroah.com>
CC:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: [PATCH] USB: sisusbvga: Fix left shifting a possible negative value
Thread-Topic: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Index: AdYuxNmskfT55oS6Rb26qZi3a0k1HQ==
Date:   Wed, 20 May 2020 16:37:50 +0000
Message-ID: <BL0PR06MB4548B811CFD66D0AB61ACD89E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d08da4c-e188-49b8-fc0d-08d7fcdc2321
x-ms-traffictypediagnostic: BL0PR06MB4481:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB4481D48375A77E571B6CDACDE5B60@BL0PR06MB4481.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PkplmPB9QIZ9GIPrpEuf18gH0M+1sFr60TeOerOa//kXLB58KX0dUB80m1loC2fXCmHGEGYobfaDAV1ySsLQuXhNtFLefShCKpDTSh5MXL9/sB1QST8POh3/EdzNVmwAqVLlcyZwqL0CJ1bs7acXUGc3OTFMYcJSqPfGy7nx19hRj+d6nl3gj1zJrPthKErOoGbdCrtMQ4ZmSsomuOrUSNCG8mc5/k7o7ISUBGxSN+pnKVnrNco7SQVFl/pRua1fi37zZ8sVD3p4/Cr7RhrgfNEj9N7/szShdu/j7gbmmacvDkI1/2oPVHCYCabcEwaV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(86362001)(52536014)(33656002)(478600001)(2906002)(26005)(186003)(53546011)(8936002)(71200400001)(6506007)(66946007)(8676002)(76116006)(4326008)(7696005)(66556008)(5660300002)(66476007)(6916009)(786003)(64756008)(316002)(9686003)(66446008)(75432002)(55016002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: +robPDgdcDL/SDbaxg2TgrbNPs1/ZWNwz12s3hVlSnfv1LXhyEc/KFuWkkQA2Ie/Z79hMX9N3i3PAUGWvNdvtDjNE+fLh8V0plePc6JDYxiyJotdzkpEve5o7SbVClC3j3cSA8mf6y8wxVk4XWuVI8QfHDVETYuzLW5NmdjGCDjL400N7gBi7+exZJiRDWFd3ueU/Dc8t1xU7Uif93x2HYiqu/WJ+b1A5OUx9JnOZP3Cp0Da6MVAbbHmCql4RK8CJZ7JukHjnlmRm7Zz54R3EXhOGvLY+DmNW6sl7KoFg68z1YZyMEPnwX9WkmHarP4cnr9VwCSv/ssMNZJIqyUyMLSQpFSCYSTtalzSIhCPhiRtwJPWnc5Bv90EWV+79jLd+WdhEHR+2VkXzFTy0NXkQnL60zvVnTVdOSZ1dyXE/LDi/p1D2grdOtMYatP0YmK4jFVA/mvfH7Fr0660TasOj3ES1DfWzJwrAc/8g2so7wnoXGFtLF1aG65LU7LPRqu1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d08da4c-e188-49b8-fc0d-08d7fcdc2321
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 16:37:50.7319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0VihPxESY1rHRxMaUxW2+By0UkMY65DDoG91undkWu1MTUei3rYNV4ORYSPXkRqyAcKz9SG2FcgmHuudr/IuvRC/gjtDGYrzh28f/HZazUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4481
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH <greg@kroah.com>
> Sent: Wednesday, May 20, 2020 1:02 AM
> To: Changming Liu <liu.changm@northeastern.edu>
> Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org; Lu, Long
> <l.lu@northeastern.edu>; yaohway@gmail.com
> Subject: Re: [Bug Report] drivers/usb/misc/sisusbvga: undefined result wh=
en
> left shift a possible negative value in sisusb_write_mem_bulk
>=20
> On Wed, May 20, 2020 at 03:51:04AM +0000, Changming Liu wrote:
> > Hi Greg and Thomas,
> > Greetings, I'm a first-year PhD student who is interested in the usage =
of
> UBSan for linux. And after some experiments, I've found that in
> drivers/usb/misc/sisusbvga/sisusb.c
> > function sisusb_write_mem_bulk, there is an undefined behavior caused b=
y
> left shifting a possible negative number.
> >
> > More specifically, in the switch statement for case 3, after executing
> copy_from_user, the the lower 3 bytes of char buf[4] are filled with data=
 from
> user space.
> > And these 3 bytes are left shifted accordingly to form a 32bit unsigned
> integer, swap32.
> >
> > The potential problem is, since the buf is declared as signed char buff=
er so
> each byte might be a negative number while being left shifted. According =
to the
> C standard, when the left-hand operand of the left shift operator is a ne=
gative
> value, the result is undefined. So I guess change the buf declaration to =
unsigned
> will help? Given that it's only used here.
>=20
> Sounds like a good idea, patches are welcome to fix this.

Hi greg,
Thank you for this recognition! This means a lot to me.=20
Here's the patch as we agreed.

Best,
Changming


From 14ae7c67ea3fb96ed6bea0bc9919f3c597308813 Mon Sep 17 00:00:00 2001
From: Changming Liu <liu.changm@northeastern.edu>
Date: Wed, 20 May 2020 12:19:37 -0400
Subject: [PATCH] USB: sisusbvga: Fix left shifting a possible negative valu=
e

the char buffer buf, accepts user data which might be negative value and th=
e content is left shifted to form an unsigned integer.
Since left shifting a negative value is undefined behavior, thus change the=
 char to u8 to fix this

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbv=
ga/sisusb.c
index fc8a5da4a07c..0734e6dd9386 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct sisusb_usb_data=
 *sisusb, u32 addr,
        u8   swap8, fromkern =3D kernbuffer ? 1 : 0;
        u16  swap16;
        u32  swap32, flag =3D (length >> 28) & 1;
-       char buf[4];
+       u8 buf[4];

        /* if neither kernbuffer not userbuffer are given, assume
         * data in obuf
--
2.17.1

> thanks,
>=20
> greg k-h
