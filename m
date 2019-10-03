Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6B9CA8D4
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 19:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391601AbfJCQdd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 12:33:33 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:6500 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404103AbfJCQdb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Oct 2019 12:33:31 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d9622d70000>; Fri, 04 Oct 2019 00:33:27 +0800
Received: from HKMAIL101.nvidia.com ([10.18.16.10])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Oct 2019 09:33:25 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Thu, 03 Oct 2019 09:33:25 -0700
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Oct
 2019 16:33:24 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (104.47.34.52) by
 HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 3 Oct 2019 16:33:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1cgRftDzFgXEggV0fjColxWynAdI9k8lfgj3GA6FhyDANX6zbDZ2n2fFpqVcdV7/A0ceG60r9O3uOnVNCOkP4Vdyk70dNu7qgPBZC4+Dfi3t66mfICtszbLJCQgd07oEeo/O0MqZfTgXYNH8mRsMqvY8HSiscSzYM4286lBPdOpnwWxY/2ZZhlulJGw4zg5v/nPphyQwCwp0dbphn1ocZexY0Soy92HjePbIZv7R1hWqMaMdw2GGYngyfMP2KhWgazMqrxA4Sn03k+7BtDBrDejmkx7ZD1YXh37Im29cPRJSG3eti7g8fAIdJyutqOf93JKyLWrSixoU/vSBXB6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzodYkYuimDBreh2GtwRZrN31O6fM1FdV99E75J5CO8=;
 b=exkAlMEcU28/3tbF3VtWzjPBbCBBCmFzMYOyBLTaNW/5+ggfYmiqWiem/7bjcPGQ9qTjVApXMimU79Ptvlu86/xtObaCX0SEzuVZhnEJNABjJvdUdH3cPz2R9XwqQgMkpwrGoNrLP6Y9Bwcxw1q/jW2t4l1X/4gXNdB7l/nEq+8rOlXVq8f8CWko52NHALb2ZMvc0upXtlBqCi+kIzxZm0i3HlOfnZY3zUI/PDOCQuIJYaDK+ITtYmD6O2lzy8cmFJLGDmgrBI17//PLvRo5iDIsWE1pcWcfskvM1uCxIummyh/CteRVTityXz/PgZcE7fbYIKq7GytX5vryzgkEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3320.namprd12.prod.outlook.com (20.178.55.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 16:33:22 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 16:33:22 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Topic: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Index: AQHVdFI7VovQttbK0kyVtx5zpzGGF6dGIWlAgALii4CAABgRgA==
Date:   Thu, 3 Oct 2019 16:33:22 +0000
Message-ID: <BYAPR12MB2727465972DCB1E7ECBE41CCDC9F0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB2727E1FE3CDFC5D6DD87CF73DC9D0@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191003142443.GC1048@kuha.fi.intel.com>
In-Reply-To: <20191003142443.GC1048@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-03T16:33:20.8369395Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=2558946b-4215-4d3a-b4b9-64ef46fb01e6;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df70d29c-9b93-4b5a-5c16-08d7481f6829
x-ms-traffictypediagnostic: BYAPR12MB3320:
x-microsoft-antispam-prvs: <BYAPR12MB33207E67151DBD2F15B3BBD2DC9F0@BYAPR12MB3320.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(199004)(189003)(13464003)(6116002)(2906002)(305945005)(476003)(76116006)(66946007)(66476007)(4326008)(64756008)(66446008)(66556008)(6436002)(6246003)(99286004)(9686003)(229853002)(55016002)(5660300002)(52536014)(478600001)(3846002)(86362001)(6916009)(14454004)(256004)(316002)(8936002)(33656002)(486006)(7736002)(74316002)(76176011)(53546011)(7696005)(71200400001)(71190400001)(102836004)(6506007)(25786009)(11346002)(446003)(81166006)(81156014)(8676002)(66066001)(26005)(186003)(14444005)(21314003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3320;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wvvQ2N+M68Ch8dcABAvNCF4ogwNQjs3HcEJ4RnAtF9PGVoYUemaeqsIo8B4JUnynpSThfwuJ/lqzd0nh4/hygCpO0rqY8t75kYzCvhjJCoVqRzUedmbLc/HfYtfPESTNJk/Tooebb/y+J+2+OLI6JnSc6Jq9pywp6TgaLOOMGaVnx7rf6cZ9N4Rs+on9Ley4EfU1/JaxttEQMiszMa8/dPHdMwyhpveA3wjGLpaSpB1wJkuAPn6tVFxCE2eVnyHnTnFtqTxrShyhTHFxP715ayklZoPf+uMuRHQez+lJyhYY27pCzkuCJc35PmsF1V2jYYLF3wS8XGO/bVmkt50Ba2xbVuC6E1C23fVMLCsuTc2jWKAQR1ZI2SnQqXP6mYbHEQSvL3m5HW2j7usJcEGmYbHXLK8CIQnN8T2YKBsYvos=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: df70d29c-9b93-4b5a-5c16-08d7481f6829
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 16:33:22.3222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HEXrMuV/h6Gn7zJgWIBi0s7dZPqKZu4XdJ+RngBM1A9gDTH7Os6C9VIpM7JskDLc8rkTi18mGb7mZbQAw4EUiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3320
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1570120407; bh=yzodYkYuimDBreh2GtwRZrN31O6fM1FdV99E75J5CO8=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=NHpufqaL76CTebrTqdoT/Z3RwZrxv2rGkv+ivtK3g0Rx3j6qKUZAoSVt6+oLg7a8Q
         wWas6u46/1R36YCJey4sb47P5l71cQCaudQ07ql8fhbjFjg6bxMt2U4nQud7QUhLmc
         A4FQIK7AMWiYgeAR7KMaz9rixgQEoz6IRu7djaAiSTyhvopTzwyFz6Z5GOA5KMq71r
         dNTqOznGqvSi2ilwo14xn+ucqd4kAaXztoWoehQKjQex3hZqTNL9psmTHb7lrYDI1N
         JRpGteB/3ch+wW9qGrHNUEUCAkLoDSyBr3I9w+XavxePHtqUhwCgtpfxvRJqZheq0y
         daKd0KPJKkW7g==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,
> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Thursday, October 3, 2019 7:25 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: [PATCH 00/14] usb: typec: UCSI driver overhaul
>=20
> Hi Ajay,
>=20
> On Tue, Oct 01, 2019 at 06:36:25PM +0000, Ajay Gupta wrote:
> > Hi Heikki
> >
> > > -----Original Message-----
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Sent: Thursday, September 26, 2019 3:07 AM
> > > To: Ajay Gupta <ajayg@nvidia.com>
> > > Cc: linux-usb@vger.kernel.org
> > > Subject: [PATCH 00/14] usb: typec: UCSI driver overhaul
> > >
> > > Hi Ajay,
> > >
> > > Here's the pretty much complete rewrite of the I/O handling that I
> > > was talking about. The first seven patches are not actually related
> > > to this stuff, but I'm including them here because the rest of the
> > > series is made on top of them. I'm including also that fix patch I
> > > send you earlier.
> > >
> > > After this it should be easier to handle quirks. My idea how to
> > > handle the multi-instance connector alt modes is that we "emulate"
> > > the PPM in ucsi_ccg.c in order to handle them, so ucsi.c is not touch=
ed at
> all.
> > >
> > > We can now get the connector alternate modes that the actual
> > > controller supplies during probe - before registering the ucsi
> > > interface
> > How can ucsi_ccg.c get the connector alternate modes before
> > registering ucsi interface? PPM reset, notification enable, etc.
> > is done during ucsi registration. UCSI spec says:
> > " The only commands the PPM is required to process in the "PPM Idle
> > (Notifications Disabled)" state are SET_NOTIFICATION_ENABLE and
> > PPM_RESE"
> >
> > Also, it doesn't look correct if ucsi_ccg.c has to replicate most of
> > the stuff done in ucsi_init() of ucsi.c.
>=20
> How about if we split ucsi_init() into a function that first simply const=
ructs the
> struct ucsi and struct ucsi_connector instances without registering anyth=
ing,
> and into separate functions that then register the ports, altmodes and wh=
at
> have you. I don't think that should be a huge problem. It will make ucsi.=
c even
> more like a library, which is probable a good thing.=20
Do you mean the solution to follow steps (a->b->c->d1) or (a->b->c->d2) ?
a) ucsi_ccg.c calls first part of split ucsi_init()
b) ucsi_ccg.c uses ucsi_send_command() to collect actual alternate modes.
c) ucsi_ccg.c looks into actual alternate modes and squashes if duplicate a=
ltmode found.
d1) ucsi_ccg.c calls new method to register connector alternate modes.=20
This method issues GET_ALTERNATE_MODES command again and ucsi_ccg.c is expe=
cted
to send squashed alternate mode.  This will require changes in .read(), .sy=
nc_write() and=20
.async_write() to make it appear as if the squashed data coming from the pp=
m.
OR
d2) ucsi_ccg.c calls new method to register squashed connector alternate mo=
des.=20
This method doesn't issue GET_ALTERNATE_MODES commands to PPM but simply=20
registers the alternate mode values passed to this function.

If you mean the (a->b->c->d2) solution then it looks fine to me and would w=
ait for patches=20
from you. This solution would mean that GET_ALTERNATE_MODES for connector i=
s done
only by each ucsi_xxx.c and not by ucsi.c

> I can prepare patches for that too if you like?=20
> After that you should be able to get the struct ucsi instance that repres=
ents
> the "real" PPM without registering anything by calling a single function,=
 most
> likely ucsi_init(). And after getting that you can construct the connecto=
r
> alternate modes that we actually register.
> Finally you register the final interface which does not use ucsi_ccg_ops,=
 but
> instead something like ucsi_nvidia_ops.
I didn't understand this part. ucsi_ccg_ops has .read(), .sync_write() and
 .async_write() interface and they remain same for all ucsi_ccg controllers=
.

Thanks
>nvpublic
>=20
> How would this sound to you?
>=20
> Br,
>=20
> --
> heikki
