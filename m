Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB541B1DA8
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 06:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgDUEuX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 00:50:23 -0400
Received: from mail-bn8nam11on2137.outbound.protection.outlook.com ([40.107.236.137]:29537
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725904AbgDUEuW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Apr 2020 00:50:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUVfEQI3DtzS1h9G1NMDJV/1PfwO8CMj32pKmRtzXjr0Lg5wy/BvRsPKEhY1BUslIoox/ujzZEd5IuLKDX1mA197l33SQVEB22mOh014yHjVQmszF6nwWAl8LwD64y2B3Pt7ebQwVhtZzmfdtNlXPDgRzy+b3siNp+w6qZgC4cZ3P1hHntfv9R9hF+VAHNJJvRzxzrZ2p2goYRL7EEkEXbuMuGVSrX2/e7QfWmV2FCj0MtYzFBjRyG7VZqOy3UE/UD5NMWmAavJF2QYWSircf1WGA+Fd/W3KSMQvSBErz1oYUr8eESsXFTtqM+gto8WfqpfKajV2VcbT/Yufl2eA1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wU0JImVAL5TalC1Y3c9HrLomBGkenfy/QdxlFcdDxc=;
 b=kCQW4dqa/gMvlYzRsoUti/YOLyiLbc4snw0ncxizxtR9myOCtmTM6/B8KFEAuSv2ZtrbkPGn1l/TuLiWiLSTDk4mjBpdVDct/yjZmKd0lK/rGG33+a5SmIy6NTlw7soibl6WKVJB39pPZptksZNQ9O/oqEZz+WsjbqQIveEV3flHbOv5229a5Kzvm8vFcDdnFfM260tlhfYUgyWq4X6A2PCfguDIrN5mlntncxr0wwSklAVE0rrWKY14eIXeY/Vil0ymwr/NGfsAm+ks6UyMmEnFbPcAIZ7QsnE2Z7mdtMrOmkkZl35lDLl3A8WML8UbiCiUmqfvRF8IbOdABLp/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wU0JImVAL5TalC1Y3c9HrLomBGkenfy/QdxlFcdDxc=;
 b=truUt1WDvPHHdST0kL4t6AP/pqGfSre5YCynECi55cmOpNBiaI3YT2hSXyOciICPjnW6q5RHOTL06Be5Nsulm1RiV+syL4Zr7XlvOuZBQM/5bFb7hvsC2aR7YUUpEnv4wEgfnLo5rkiR5ptKXagq2Gf+E0seh1zgsP20faJGdKM=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4899.namprd06.prod.outlook.com (2603:10b6:208:6b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 04:50:18 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 04:50:18 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     Greg KH <greg@kroah.com>
CC:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: [PATCH] USB: sisusbvga: Change port variable from signed to unsigned
Thread-Topic: [PATCH] USB: sisusbvga: Change port variable from signed to
 unsigned
Thread-Index: AdYXmFp7Nt+W68ruQK2VSZ71Y86vmQ==
Date:   Tue, 21 Apr 2020 04:50:17 +0000
Message-ID: <BL0PR06MB45482D71EA822D75A0E60A2EE5D50@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=liu.changm@northeastern.edu; 
x-originating-ip: [73.167.12.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a012fb20-abf6-4063-1677-08d7e5af7d6d
x-ms-traffictypediagnostic: BL0PR06MB4899:|BL0PR06MB4899:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB4899E3514DE72CB1EE6461A2E5D50@BL0PR06MB4899.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(26005)(71200400001)(7696005)(2906002)(6916009)(53546011)(6506007)(786003)(54906003)(316002)(478600001)(8936002)(81156014)(8676002)(5660300002)(66476007)(64756008)(186003)(66446008)(66946007)(66556008)(76116006)(9686003)(4326008)(75432002)(86362001)(52536014)(55016002)(33656002);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: northeastern.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SssnIuwJAoK2ndZEo023GmrwRT06jwBAsWyfTo4aG33Sv5EIKjoWmwet2L20866RakqPcDZrLFv68mlqJHXfH3xfblVPRZYXAC7KqgYzXC/siuWLgjuB3UAPfN57AdQlSS2vZVwYJBxaSYEjpHqnyFjtD72qZneIGTC3/LuzVb5BNN19/cEV9FUunuIyyHi6jH7kZ8GMA3lrvW+VxA9yz8UjQM1pLgrGCX9HupbQmv7bCzs3wPYC4w4f5H18oB4iAJynDa/b8vIZN9pxXzwQolqh5fGMY87oUZmhB77B4q2YleOI0XlqcdYzQgGpwOYZ8Y0GQ9sJ5AnfPW9rDX1NIU2JZesP+gbNmXud7qQhGk8Ttgk07XVFquD3HWdBOubUD1vbQzAA0/8pbK6YCOAZDJteqj4TIs98A9E0ubLkFlOpnsOglGFVB9jfvfCof9fR
x-ms-exchange-antispam-messagedata: M/UX9olbhFBtCcGVv6dEqpE12mtlPHoVOjDUqWKUCf/uxrIJsa5Zf9FVKSfuD636qQbSizl/v7SqTb8lHxXJwAk+uT0/GFrivMcUIBhzg5ua/t4YVoLR21MVv/3P6VydgVWGqedJCNnuVG/fb6Jz/A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a012fb20-abf6-4063-1677-08d7e5af7d6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 04:50:18.0354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+yConY3U0wRtMlW5w84DJEAZm7pN+qQzgqV3GbEVtAKQG9wAgW80K1hr0u2/Xp3NkW8q0bVDom12c60MAbXYpwC2ROCSkkv/15FGYHZQ4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4899
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Original Message-----
> From: Greg KH <greg@kroah.com>
> Sent: Monday, April 20, 2020 7:26 AM
> To: Changming Liu <liu.changm@northeastern.edu>
> Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org; Lu, Long
> <l.lu@northeastern.edu>; yaohway@gmail.com
> Subject: Re: [Bug Report] drivers/usb/misc/sisusbvga: integer overflow in
> sisusb_getidxreg and others
>=20
> On Sun, Apr 19, 2020 at 10:04:06PM +0000, Changming Liu wrote:
> > Hi Thomas,
> > Greetings, I'm a first-year PhD student who is interested in using
> > UBSan for linux kernel. With some experiments, I found that in
> drivers/usb/misc/sisusbvga/sisusb.c sisusb_getidxreg, there is an signed
> integer overflow which might cause unexpected result.
> >
> > More specifically, starting from the fetch function in func
> > sisusb_ioctl, line 2959, struct sisusb_command y is filled with data fr=
om user
> space. Then diving into sisusb_handle_command, the signed integer, named
> port, is casted from y->data3.
> > Then when executing sisusb_getidxreg, the signed integer, port, is used=
 as 32-
> bit unsigned address in function sisusb_write_memio_byte.
>=20
> Great, can you provide a patch fixing this so we can give you the proper =
credit
> for finding and fixing the issue?
Hi Greg,
Thank you very much for this recognition, this means a lot to me!
Here's the patch which I think can pretty much fix it, although I just chan=
ged the related arguments from int to u32 : p
Please feel free to modify as you like. Thanks!

Best regards,
Changming

From 6de85a157f01cb457d9c74c03769ffd7b8cf5f0e Mon Sep 17 00:00:00 2001
From: Changming Liu <liu.changm@northeastern.edu>
Date: Mon, 20 Apr 2020 23:41:25 -0400
Subject: [PATCH] USB: sisusbvga: Change port variable from signed to unsign=
ed

Change a bunch of arguments of wrapper functions which pass signed integer =
to an unsigned integer
which might cause undefined behaviors when sign integer overflow.

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c      | 20 ++++++++++----------
 drivers/usb/misc/sisusbvga/sisusb_init.h | 14 +++++++-------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbv=
ga/sisusb.c
index 2ab9600d0898..fc8a5da4a07c 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -1199,18 +1199,18 @@ static int sisusb_read_mem_bulk(struct sisusb_usb_d=
ata *sisusb, u32 addr,
 /* High level: Gfx (indexed) register access */
=20
 #ifdef CONFIG_USB_SISUSBVGA_CON
-int sisusb_setreg(struct sisusb_usb_data *sisusb, int port, u8 data)
+int sisusb_setreg(struct sisusb_usb_data *sisusb, u32 port, u8 data)
 {
 	return sisusb_write_memio_byte(sisusb, SISUSB_TYPE_IO, port, data);
 }
=20
-int sisusb_getreg(struct sisusb_usb_data *sisusb, int port, u8 *data)
+int sisusb_getreg(struct sisusb_usb_data *sisusb, u32 port, u8 *data)
 {
 	return sisusb_read_memio_byte(sisusb, SISUSB_TYPE_IO, port, data);
 }
 #endif
=20
-int sisusb_setidxreg(struct sisusb_usb_data *sisusb, int port,
+int sisusb_setidxreg(struct sisusb_usb_data *sisusb, u32 port,
 		u8 index, u8 data)
 {
 	int ret;
@@ -1220,7 +1220,7 @@ int sisusb_setidxreg(struct sisusb_usb_data *sisusb, =
int port,
 	return ret;
 }
=20
-int sisusb_getidxreg(struct sisusb_usb_data *sisusb, int port,
+int sisusb_getidxreg(struct sisusb_usb_data *sisusb, u32 port,
 		u8 index, u8 *data)
 {
 	int ret;
@@ -1230,7 +1230,7 @@ int sisusb_getidxreg(struct sisusb_usb_data *sisusb, =
int port,
 	return ret;
 }
=20
-int sisusb_setidxregandor(struct sisusb_usb_data *sisusb, int port, u8 idx=
,
+int sisusb_setidxregandor(struct sisusb_usb_data *sisusb, u32 port, u8 idx=
,
 		u8 myand, u8 myor)
 {
 	int ret;
@@ -1245,7 +1245,7 @@ int sisusb_setidxregandor(struct sisusb_usb_data *sis=
usb, int port, u8 idx,
 }
=20
 static int sisusb_setidxregmask(struct sisusb_usb_data *sisusb,
-		int port, u8 idx, u8 data, u8 mask)
+		u32 port, u8 idx, u8 data, u8 mask)
 {
 	int ret;
 	u8 tmp;
@@ -1258,13 +1258,13 @@ static int sisusb_setidxregmask(struct sisusb_usb_d=
ata *sisusb,
 	return ret;
 }
=20
-int sisusb_setidxregor(struct sisusb_usb_data *sisusb, int port,
+int sisusb_setidxregor(struct sisusb_usb_data *sisusb, u32 port,
 		u8 index, u8 myor)
 {
 	return sisusb_setidxregandor(sisusb, port, index, 0xff, myor);
 }
=20
-int sisusb_setidxregand(struct sisusb_usb_data *sisusb, int port,
+int sisusb_setidxregand(struct sisusb_usb_data *sisusb, u32 port,
 		u8 idx, u8 myand)
 {
 	return sisusb_setidxregandor(sisusb, port, idx, myand, 0x00);
@@ -2785,8 +2785,8 @@ static loff_t sisusb_lseek(struct file *file, loff_t =
offset, int orig)
 static int sisusb_handle_command(struct sisusb_usb_data *sisusb,
 		struct sisusb_command *y, unsigned long arg)
 {
-	int	retval, port, length;
-	u32	address;
+	int	retval, length;
+	u32	port, address;
=20
 	/* All our commands require the device
 	 * to be initialized.
diff --git a/drivers/usb/misc/sisusbvga/sisusb_init.h b/drivers/usb/misc/si=
susbvga/sisusb_init.h
index 1782c759c4ad..ace09985dae4 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_init.h
+++ b/drivers/usb/misc/sisusbvga/sisusb_init.h
@@ -812,17 +812,17 @@ static const struct SiS_VCLKData SiSUSB_VCLKData[] =
=3D {
 int SiSUSBSetMode(struct SiS_Private *SiS_Pr, unsigned short ModeNo);
 int SiSUSBSetVESAMode(struct SiS_Private *SiS_Pr, unsigned short VModeNo);
=20
-extern int sisusb_setreg(struct sisusb_usb_data *sisusb, int port, u8 data=
);
-extern int sisusb_getreg(struct sisusb_usb_data *sisusb, int port, u8 * da=
ta);
-extern int sisusb_setidxreg(struct sisusb_usb_data *sisusb, int port,
+extern int sisusb_setreg(struct sisusb_usb_data *sisusb, u32 port, u8 data=
);
+extern int sisusb_getreg(struct sisusb_usb_data *sisusb, u32 port, u8 * da=
ta);
+extern int sisusb_setidxreg(struct sisusb_usb_data *sisusb, u32 port,
 			    u8 index, u8 data);
-extern int sisusb_getidxreg(struct sisusb_usb_data *sisusb, int port,
+extern int sisusb_getidxreg(struct sisusb_usb_data *sisusb, u32 port,
 			    u8 index, u8 * data);
-extern int sisusb_setidxregandor(struct sisusb_usb_data *sisusb, int port,
+extern int sisusb_setidxregandor(struct sisusb_usb_data *sisusb, u32 port,
 				 u8 idx, u8 myand, u8 myor);
-extern int sisusb_setidxregor(struct sisusb_usb_data *sisusb, int port,
+extern int sisusb_setidxregor(struct sisusb_usb_data *sisusb, u32 port,
 			      u8 index, u8 myor);
-extern int sisusb_setidxregand(struct sisusb_usb_data *sisusb, int port,
+extern int sisusb_setidxregand(struct sisusb_usb_data *sisusb, u32 port,
 			       u8 idx, u8 myand);
=20
 void sisusb_delete(struct kref *kref);
--=20
2.17.1

>=20
> thanks,
>=20
> greg k-h
