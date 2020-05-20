Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CE81DA8BE
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 05:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgETDvL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 23:51:11 -0400
Received: from mail-bn7nam10on2132.outbound.protection.outlook.com ([40.107.92.132]:4193
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726938AbgETDvK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 May 2020 23:51:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDE5PcYM/AL3dvB1+dgJZAsTpYWq9W+awY+lFzIyrbClEJ2ZgjQYP9X1rdLB/qKwsEWFrUkteks0zu9h14YuT6f4qlcppr4FpN4YTES44QfXuEd/LSWpzXtZREU7+uh7JO5NqyivTxVrzAkKFuwlIVeiSgn0ifFbFz1ZimXR4ySrv2IGbQWWavgt0k8MhwutUTYVmfs3cU1hX3VYf9Xjx2c+GTL8vm5q67F2zORmBYejaB7KTXU4d696tG2h8JtIbaTNVUZnKhmzaX/JDtd3da5e9+3J5RcAL2W5MVl5wBsrgXjwO+CvkCgjB9NqeIqC2UIYpijQi8zOlDdx5xd1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THeRaPUnkcTYcQnwv93LeGlpvHwA1TUQpgyMrAS/1tU=;
 b=JgVNyAu7lyhUPn9HVt8OD48Cxl79xfBCsZend9suDYb3GPXDt7Ks70ek2cqZWM/vGh/03xRrLuKoaEClr240ZGRCl0Rm4CkZv4APVdmQiqifuLB/rZMAZo9lui4gf2cmMCXFM66x9GKlVWG69tzns5xJIvxi707sKeGno/kdrGLrSNENXYaHwBWOuzAzp7FtS4iHRzNlqTJ12FN8a5zjTVUrklzKDJStK0kAbZElSxsjcdXuAwlBcJVBADCYk+WSLuHZqpWvUOHrkWuHwvoSZB+F8fn0BqGZbh+YF/KlvzLtI59doEBZix277MI47zSWaWesv2T59QR4lRo1iIge0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THeRaPUnkcTYcQnwv93LeGlpvHwA1TUQpgyMrAS/1tU=;
 b=qF6B7Yg242ejvan+mHK8dA4Fi0T6N7cm3MpeloxyCopDwgocW93op4ULaH06/oygzP6yAKRWodM0AqEGO1JfWN78DlBBmxhZEMufkDMT1dZyTPjv9JlY4BRj6GP4qa6to70n8IbIY7S7Hrzvv57qsXnSUNcpcD5ikQ+F6+vwrWk=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4753.namprd06.prod.outlook.com (2603:10b6:208:5c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.31; Wed, 20 May
 2020 03:51:04 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 03:51:04 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        Greg KH <greg@kroah.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: [Bug Report] drivers/usb/misc/sisusbvga: undefined result when left
 shift a possible negative value in sisusb_write_mem_bulk
Thread-Topic: [Bug Report] drivers/usb/misc/sisusbvga: undefined result when
 left shift a possible negative value in sisusb_write_mem_bulk
Thread-Index: AdYuWRRubczH7bESTyqwoCyPI8W43Q==
Date:   Wed, 20 May 2020 03:51:04 +0000
Message-ID: <BL0PR06MB4548D5526F5BFAD528039FECE5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: winischhofer.net; dkim=none (message not signed)
 header.d=none;winischhofer.net; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d2ee2c2-ff01-4fa0-ebe8-08d7fc710536
x-ms-traffictypediagnostic: BL0PR06MB4753:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB4753A856358559B2BA8F5BADE5B60@BL0PR06MB4753.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YA87RucfjHY1AHo7cAKJA8PuZgtZ/4vFsIMdvsXNep3VHG6JfGTetL3nZr0S666CSj0IecZRN1fLfRT28tbFPGu3dQMV47FgQDKl3nPIo2kLKQ5p/qyEkMiAZYqB0Daerxl0jlo+fpQj8qWmj/6ITQSK96jLAV44FueiBNkPsyrk4UXcG6SIrn68PhI3uNfGIy7Oq85bLryd3UQ5wHuTXwucZzOzRy4DJ2//ynTC8GHG8rfTziMhHrDg1S7Ti6w8uA8xAAzRmyTCM+DrRAh5hoZBBrIQK938rotZ3WYKGSQ9xuJI2lK8vc9BRhA/5jHqW3ENyIK2EZ/o8SrEfYsQjjUuyXe5A/yYL/ytLnNH28DCqPmVgxkxVIzsvLBPlfFGvGhGzNzTmPdNsqnCY/L6yn8ZndDE+NPauVff9v/kRgqhSxbz+aJjIXhXgNtejBCV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39850400004)(86362001)(2906002)(54906003)(110136005)(7696005)(6506007)(75432002)(71200400001)(76116006)(64756008)(186003)(66476007)(66556008)(66446008)(786003)(66946007)(52536014)(26005)(316002)(4326008)(33656002)(5660300002)(8676002)(9686003)(8936002)(478600001)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: FgGsW9D204bXB/8KuIG26vDJ3hDcJJ8JFrbddVz3kr/l0p7ux4DOA72k2EIJBl6mOHk8Qh4ZsVSNI2lIV9bvA2hCpaH0TrViXIp1W2truRuIXpe+jWKuKAOSq7DlW3e4JHZnVx725td5DFYqJcDFAXi1XkdMCSNWKhHit07Pu4qEZBvMz3YYipi0nHTCqpMPxWMBH571C3pRWmfJe4U8RtDCird+mEqaeFveaihRIPE7GPOaYMyM1klrpvybiLpecO5dIAc56UfLZKUT8MGSxD5t9bAMy+fQHuC2+1WlV9lpcOT2m0aiBhPZpphWvuTM8qhuhkVH2/zgHt3dGkZ3NblMOXQrdDwGJJ93R07kG99ARwwc4v1Ok8X4LK7wBstmmXMk0/sKYuME7W2ntRIRxyB09dH1ZyI0Ax3zXwGO8yuQmgLSN04HJ94BYLtmTH7LgRRvdc6IbHKzDzm9o9ScquzhyyI7hMHmgRoXVq/lBj8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2ee2c2-ff01-4fa0-ebe8-08d7fc710536
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 03:51:04.3534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBRlIO23GILe1yl+mVOkzj9gC33k0rlfpDHgCcrUCUUjhPSLu3Taa96pRkYbgiefb3n6xjn/CvxgZKvpSblRaEux0ZG0p9fMitMSXUMv3qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4753
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg and Thomas,
Greetings, I'm a first-year PhD student who is interested in the usage of U=
BSan for linux. And after some experiments, I've found that in drivers/usb/=
misc/sisusbvga/sisusb.c=20
function sisusb_write_mem_bulk, there is an undefined behavior caused by le=
ft shifting a possible negative number.

More specifically, in the switch statement for case 3, after executing copy=
_from_user, the the lower 3 bytes of char buf[4] are filled with data from =
user space.
And these 3 bytes are left shifted accordingly to form a 32bit unsigned int=
eger, swap32.

The potential problem is, since the buf is declared as signed char buffer s=
o each byte might be a negative number while being left shifted. According =
to the C standard, when the left-hand operand of the left shift operator is=
 a negative value, the result is undefined. So I guess change the buf decla=
ration to unsigned will help? Given that it's only used here.

Due to the lack of knowledge of the interaction between this module and oth=
ers, I'm not able to assess the severity of this problem. I wonder if it's =
worth a fix? If not, I would appreciate it if I can know why, this will hel=
p me understand linux and UB a lot!

Looking forward to your valuable response!

PS: I'm that guy who sent you a bug report and the patch was accepted 3 wee=
ks ago, please allow me to express my appreciation again!

Changming Liu
