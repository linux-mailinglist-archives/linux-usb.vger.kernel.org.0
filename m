Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3EA13C873
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 16:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbgAOPyQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 10:54:16 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:56297 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgAOPyP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jan 2020 10:54:15 -0500
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e1f35a30000>; Wed, 15 Jan 2020 23:54:12 +0800
Received: from HKMAIL101.nvidia.com ([10.18.16.10])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Wed, 15 Jan 2020 07:54:12 -0800
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Wed, 15 Jan 2020 07:54:12 -0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan
 2020 15:54:11 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 15 Jan 2020 15:54:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaEnG0ebbVnPdWuQfa6/NHDpVSTt3urNyY6XQFB5pZtfYrxk/aS8IYjvLsUIikVllJaGgLuIvIriTnbIKA/9t/db+lgDDw3pb5FMdDIm/HiFJi8/ikuGW6OQdAgru9FyEHWkXczADpPkKyW85ZEsLRcSK/vlJjLf0J82N5AIlfVDc5JlGakeQ/1y8j72FZY4zmh5Sn6VgQ86EpMp0+CwkMMaDoK78LLcmXwhmEpBMoObG3SMbSnfmQPLL2173XBSYO9bsXaJ6c/pPiqfIKYrOS9wk1HmdQa9DaywzXNgw7X5jnTKm63+9R45FJ5g0LIhOaVFOvRHzmRtzR6OvnPHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX28Ao0O5xVFXa0fsZjPAI1Ry6AlxCmQhHW9x6P1z6M=;
 b=SOac49UrpRzAhnmgiS1DNBldZa9IUPzvIfLS99zk7w3Gs3uak2iRcylItsn/9U1yUUMb93oYa64PP+47UMhECYVpOASoAAMO/7vdWmPQfyiAzFvM7unk8/N8amQu2we46HzW1reTPvY4wtWexocp75HvSiscoc1LYJQVsqMxnncq3ibEe7PXcjQcUOZMW1skCVCddcpo/xwKIa/ng+xGiIIlO0kcJuFbDhd3zaGRZCa98q86LsdmrP5V8zyTh/yFQv9NGtxHhlR6iNUVwxSzSvCAosfGamwPozhw9qucj6skpj4Hw9teK4UomoAhdkQwpb3oerGBeUP7Ej7K8v5Fww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4126.namprd12.prod.outlook.com (10.255.125.12) by
 MN2PR12MB3312.namprd12.prod.outlook.com (20.179.80.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Wed, 15 Jan 2020 15:54:07 +0000
Received: from MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::cd37:66e9:2ab1:b349]) by MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::cd37:66e9:2ab1:b349%5]) with mapi id 15.20.2623.017; Wed, 15 Jan 2020
 15:54:07 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: uas: fix a plug & unplug racing
Thread-Topic: [PATCH] usb: uas: fix a plug & unplug racing
Thread-Index: AQHVycHw0Tn7jTscuEWM2br6Fy2U56foWKIAgAEXieCAAM3GgIAABnmAgAE1LICAAGJiAA==
Date:   Wed, 15 Jan 2020 15:54:06 +0000
Message-ID: <MN2PR12MB41262435500D3FC463DBFC32CF370@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <Pine.LNX.4.44L0.2001140956040.1593-100000@iolanthe.rowland.org>
 <1579080683.15925.24.camel@suse.com>
In-Reply-To: <1579080683.15925.24.camel@suse.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 858c67e1-e27f-4c9a-b3d0-08d799d32727
x-ms-traffictypediagnostic: MN2PR12MB3312:
x-microsoft-antispam-prvs: <MN2PR12MB3312D946D19CE27F6EDE130CCF370@MN2PR12MB3312.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(189003)(199004)(186003)(5660300002)(52536014)(110136005)(66476007)(66446008)(2906002)(64756008)(86362001)(66556008)(76116006)(26005)(66946007)(7696005)(9686003)(81156014)(8676002)(81166006)(55016002)(8936002)(4326008)(6506007)(91956017)(498600001)(33656002)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3312;H:MN2PR12MB4126.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S/UGi1VPiSqClxbtx2TwdBRAs0ez/OAsFSQGK3SaUXbY6OS9o7wFYaB9i4k++Kh08qTmeA5JwrwJVcsG61o3olOhmbyK5f7x4ZrUuk+9wrR1ecqsig6lL7gCb7acB9GNxce5LOM1JyBkTBisqabikFOO2FbhygesRT5l9S64ebzV6FDoNMRbHoyXfxVuwR6tqaO7z1VqK/gEqshfZISlAXr0OljUr2ZSqYuQkikzve7SHs3SOs+KrSAnzIw1+8EV75kJiNVjWeG9/4Tz0MpIg9vSkhjTvFot2j40ON/yhgREJ+aTU+Ityj5YtyMJd2VXi3mhn8Ts9LIsZCON7F0KDgQkqEC0Wu85kxF/WnEgsWFUW/Ofr7/B7Otp1eB9yLFCWYnPGekFjRmpfu4fM3ar25ES2WvfWSkRZ4IGUKCTaz4HU2HRsTLl4OrrrWhzP4kd
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 858c67e1-e27f-4c9a-b3d0-08d799d32727
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 15:54:06.9510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFX7/HBtF8q/3cqrxq1IlGjO5BuVJodKDB7pt50VsjvVbFgGJDK7LmrrgWkwzziE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3312
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1579103652; bh=citxploRCF9vGS4od9xOjxr2pGytWebjnMbl8q2cXGc=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
        b=JChE72NmaJSRehycKvjue8rzIwbkojvkF0ENcv+U82n/WELI3YJcFtpaoqZByKb4R
         me76tuIfQ7mKORaa54NsUSfdpuaNMOGU1KGpuMcxDBdwmkJvOKmmBqAFDuiBJpZuRY
         bFwDrdeOjvqe+9ZMlDojpBorSilwES/tWRPz5JxxTxtP8svmC47kr/+bN0zWofmN6N
         17q+47TnbJe1I+dJZ/ff82gkZQ03PsmsHIY5jeznNuJUIwDEUleHwiADJvSmZtr5Ei
         2FcAgQeHpIlgbUgtt2n+Ma0NR8Hf9H4+rkUIWMyvS+aSJYHqUqiQP68o34bMlrI/oh
         Yike9G4MYdOWw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum wrote:=0A=0A> Am Dienstag, den 14.01.2020, 10:04 -0500 schr=
ieb Alan Stern:=0A> >=0A> > No.  The discussion has gotten a little confu=
sed.  EJ's point is that=0A> > if SCSI scanning takes place in the contex=
t of the hub worker thread,=0A> > then that thread won't be available to =
process a disconnect=0A> > notification.  The device will be unplugged, b=
ut the kernel won't=0A> > realize it until the SCSI scanning is finished.=
=0A> =0A> OK, I think we have two possible code paths at least=0A> =0A> F=
irst:=0A> uas_queuecommand_lck() -> uas_submit_urbs() -> -ENODEV -> retur=
n=0A> SCSI_MLQUEUE_DEVICE_BUSY=0A> =0A> That looks wrong to me.=0A> =0A> =
Second:=0A> The submission actually works and we eventually terminate the=
=20URB with an=0A> error. In that case nothing happens and eventually SCS=
I core retries, times out=0A> and does error handling.=0A> =0AActually, t=
he second case might happen when we connect uas disk directly to =0Aroot =
hub. In this case, the root hub thread got stuck waiting for the completi=
on=0Aof the scsi command. It might not be able to handle the disconnectio=
n event=0Aand set uas disk state to USB_STATE_NOTATTACHED accordingly.=0A=
=0ASo, the URB submission in uas driver works but nothing happens, and sc=
si layer=0Awill time out this operation and retry it several times. Event=
ually the root hub =0Athread will continue to run when it got the result =
from scsi layer. But the whole=0Aprocess might take about 60 seconds.=0A=0A=
That's another reason why I would like to run scsi_scan_host() asynchrono=
usly=0Aand keep the hub thread free.=0A=0A> > In my opinion, if scsi_scan=
_host() will be run asynchronously, this =0A> > interface needs to be gua=
rded against runtime PM between uas_probe() & uas_scan_work().=0A> Yes it=
=20does. But it has a child, the SCSI host, which has an elevated count. =
It is already guarded.=0A=0AI just checked the code, and the reference co=
unt will be incremented in scsi_scan_host(), =0Aprecisely speaking, in sc=
si_autopm_get_host().=0ASo, I still think we need to manually add referen=
ce count of interface here.=0APlease correct me if there is anything wron=
g.=0A=0AThanks,=0AEJ
-------------------------------------------------------------------------=
----------
This email message is for the sole use of the intended recipient(s) and m=
ay contain
confidential information.  Any unauthorized review, use, disclosure or di=
stribution
is prohibited.  If you are not the intended recipient, please contact the=
=20sender by
reply email and destroy all copies of the original message.
-------------------------------------------------------------------------=
----------
