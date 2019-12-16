Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E24121E8C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 23:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfLPWuC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 17:50:02 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:1846 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbfLPWuB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Dec 2019 17:50:01 -0500
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5df80a140000>; Tue, 17 Dec 2019 06:49:56 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Mon, 16 Dec 2019 14:49:56 -0800
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Mon, 16 Dec 2019 14:49:56 -0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 22:49:56 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.55) by
 HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 16 Dec 2019 22:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEkZYv5DgjdPDWkSXeA1EP9bRv1dIJnBqmmvwgxeSgFk+4jz9q1FBC9BDzRkD8xUN47DBV9JX2xOsG8cnN3soQIWtyFwlcXTZD0WU6mH+821RYVUI+g6VLkwq6inVfp8K/zjW+25DS/GjiOQ6jfAcg2goB4gcFx/LC1gf/H+IcabDcE3n6B9HNJsvcZoKYognAb95PUuGMoLlvDo71UOOGi6cE0hsilrIC//bitKJP43qNmeY8FM3bFjLRtlSsxSsNXEtZdZd/SBjQVEWBLdkw0ndYywO0lPXLeh1MTpawrKeYcW3f3g18uVhvvUk2TgF28gaMgi7NfJ4S/A4BONXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Otvg3WLiBI8LyT6g6aDQdp/0W02Dpgf6RY5OYTbmuD0=;
 b=n3IsWbSyfn4WYjmerWhgQIMA5XKJ/RAc2mkJnCQd5mqeksLa38fBdS7xqn2YCjajPj7Y33wO95qAsY5nB/pdxMgv2KXGsm2qII/oj0Hyr82Xl/50YfHHtJqt7zusYBI1RMmUrdSm6wlwbtiipooqxq8oTwuQNu1mPE29ApBh04PlfblWul+CG+XAxNlqvwkbg02Cs5r6flmxdmywXQktqbRF6jaTSfqlxrkazS34I43CR+S6IX3HyMD4q3B9DHbM4wQqGjrbGAHWEMwPyGj6n6BUYaUq88+IAaN9ghxkDFeFWcWHSKQ7GZCZGEHoK1BJ6q7gPG1h6Pnl5stGccRztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB2758.namprd12.prod.outlook.com (20.176.254.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Mon, 16 Dec 2019 22:49:52 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::8d3d:d3ba:cb91:c060]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::8d3d:d3ba:cb91:c060%5]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 22:49:46 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Ajay Gupta <ajaykuee@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Topic: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Index: AQHVoZfAZYEU1Q0sLk61ZBRXTLc1s6e2oUkAgABCE6CAAT26gIAFYLPw
Date:   Mon, 16 Dec 2019 22:49:46 +0000
Message-ID: <BYAPR12MB2727CB6BDCD3E76DDB92BB55DC510@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191123004347.5127-1-ajayg@nvidia.com>
 <20191212134412.GF31345@kuha.fi.intel.com>
 <BYAPR12MB27275226F3C815F96257F081DC550@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191213123753.GH31345@kuha.fi.intel.com>
In-Reply-To: <20191213123753.GH31345@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-12-16T22:49:45.0488584Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=305bb137-acec-4963-9516-80a57d7b13df;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47a9d0ff-b012-4061-f79b-08d7827a3fda
x-ms-traffictypediagnostic: BYAPR12MB2758:
x-microsoft-antispam-prvs: <BYAPR12MB2758325C87E66DC241FA054FDC510@BYAPR12MB2758.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(136003)(376002)(39860400002)(366004)(396003)(13464003)(199004)(189003)(4326008)(26005)(6916009)(55016002)(9686003)(7696005)(316002)(71200400001)(478600001)(76116006)(66946007)(33656002)(8936002)(8676002)(66446008)(81166006)(81156014)(66476007)(66556008)(64756008)(52536014)(5660300002)(2906002)(6506007)(54906003)(86362001)(53546011)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2758;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fZI28wvV8RQelnM3uD9Nz4DslWlC2l2L/K1YUPR0/Khfo48NpHMWKy23DI770Z1JhsioUyy5j0BZThp0Kgsj95HXmSU0DAsT+VQkVW0p4Ko1/q/VHuwqrGJHsiklpzURjHN64AMV4sHAcPd4Y0I7E5kwW9h+ZdH49DFSdlHbHodPuWH1iS7G73bET5zBtRIhEcNrU4hSU84aCXsYvFHYxSscy+ZCODbKyg4EMasJYCV3iDsfLhgfctaVewqYWl7lqLmBcB7Qx2haP/FpdL3bPrRWRMDnaYLJNrP4beqRtkqFs6G1Hixvl/saTgc2OJCDqJefwwZModiJ8O6i6fKMIOmn7kcpNzo8aMUf6Z15TIdMvV8kPIunzRfSCA7pPWJxjf1pXA0EpyVLMYxj/t8drSTgY5tklJBJVlBLnumCyrkERomKr8TfuOPVNXefc96GrX56ka8w8iDEhIGMJ7bL5QlS1wmhtxPQOxjSXTdRz/v7pjHiZ/Tp7HcWChzsDLWM
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a9d0ff-b012-4061-f79b-08d7827a3fda
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 22:49:46.3051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwpdYuShK2P0V6rFBOxYYGS3VyGunYWqNG96wAfqvrv3PWQY3nShLWOHR7fdneKQUpUS1UQVcGk2AoG4bR04ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2758
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576536596; bh=Otvg3WLiBI8LyT6g6aDQdp/0W02Dpgf6RY5OYTbmuD0=;
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
        b=ePuM4E566dG8yeVyEsbrDUhJPgCPRTbJugAaDxB789zRJsOpcKtlp4GlUrpLJWjP2
         Yp2BG1C0cPkNRMFvOP/9nYHlnkd/wsHx6ofXwNzmWJ+K1LLDm3UUs4rUJWXRg+0B74
         xYfw+Sx+ViH0BT4husq3WLgxdSHc22i865yfHZldid1FvFAB24FUTPu7KBlY1MXU/K
         BQnspnH62v9z6TrV89eFAg5/zmepnHBmM2kuazlVz9Zb74nBr0FaxCpUqeS+kSMPfn
         WIs8r20iIanhRBgqDeyefH6tfYZhyCxBBIxWZEi/S0viaaYnrufT0m5h2wws136r9/
         11qqK/P5U5AoQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> On Behalf Of Heikki Krogerus
> Sent: Friday, December 13, 2019 4:38 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: Ajay Gupta <ajaykuee@gmail.com>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate DP alt=
mode
> devices
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On Thu, Dec 12, 2019 at 05:42:28PM +0000, Ajay Gupta wrote:
> > Hi Heikki,
> >
> > > -----Original Message-----
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Sent: Thursday, December 12, 2019 5:44 AM
> > > To: Ajay Gupta <ajaykuee@gmail.com>
> > > Cc: linux-usb@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> > > Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate
> > > DP altmode devices
> > >
> > >
> > > Hi Ajay,
> > >
> > > On Fri, Nov 22, 2019 at 04:43:47PM -0800, Ajay Gupta wrote:
> > > > From: Ajay Gupta <ajayg@nvidia.com>
> > > >
> > > > CCGx controller used on NVIDIA GPU card has two separate display
> > > > altmode for two DP pin assignments. UCSI specification doesn't
> > > > prohibits using separate display altmode.
> > > >
> > > > Current UCSI Type-C framework expects only one display altmode for
> > > > all DP pin assignment. This patch squashes two separate display
> > > > altmode into single altmode to support controllers with separate
> > > > display altmode. We first read all the alternate modes of
> > > > connector and then run through it to know if there are separate
> > > > display altmodes. If so, it prepares a new port altmode set after
> > > > squashing two or more separate altmodes into one.
> > >
> > > I didn't see any major issues with this. There were still few extra
> > > spaces etc., but I can clean those. Maybe it would have been good to
> > > mention in the commit message that the reason why we need those two
> > > separate alt modes, for what is in reality two separate pin
> > > configurations, is limitations in UCSI specification, but never mind.
> > >
> > > I still don't like the approach, but since I'm unable to explain my
> > > idea, or have time to write something for this myself, I don't want
> > > block this any longer. It does not add that much code, so once I
> > > have time, I can always try to improve it myself, right?
> > >
> > > Otherwise it's OK by me. I'll queue it up.
> > Thanks for reviewing. Please feel free to improve the patch or commit
> message.
>=20
> One thing that I do want to do is I want to isolate the changes done to u=
csi.c.
> Can you test the attached diff? It applies on top of this patch.
Tested the diff and it looks good. Please add additional change at [A] on t=
op of
your diff..

Thanks
Ajay
> nvpublic

----------------------- [A] ---------------------------
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -368,11 +368,8 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *c=
on, u8 recipient)
                if (!len)
                        break;

-               if (!alt.svid) {
-                       /* break out of outer loop and register */
-                       i =3D max_altmodes;
+               if (!alt.svid)
                        break;
-               }

                orig[k].mid =3D alt.mid;
                orig[k].svid =3D alt.svid;
@@ -382,7 +379,7 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *co=
n, u8 recipient)
         * Update the original altmode table as some ppms may report
         * multiple DP altmodes.
         */
-       if (recipient =3D=3D UCSI_RECIPIENT_CON && ucsi->ops->update_altmod=
es)
+       if (recipient =3D=3D UCSI_RECIPIENT_CON)
                multi_dp =3D ucsi->ops->update_altmodes(ucsi, orig, updated=
);

        /* now register altmodes */
----------------------------------------------------------
>=20
> thanks,
>=20
> --
> heikki
