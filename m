Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F4D11D444
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 18:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730177AbfLLRmf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 12:42:35 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13735 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730163AbfLLRme (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 12:42:34 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5df27c010000>; Thu, 12 Dec 2019 09:42:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 12 Dec 2019 09:42:32 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 12 Dec 2019 09:42:32 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 17:42:32 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 17:42:32 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 12 Dec 2019 17:42:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/kWP+xhv4HfnR8AI1+ueYkhNs77yg+YdCOfxg5/d5FdJYPpoLECFLBKHJAZh8gjJVGJWj2tzLt8QKfGoRuLWyAx5Dod/J4IrcKauXu4bYlbJdmRCgBtuGpqcy0TuPIsslz23Pgks8FopES+CvGjFtNeOyhOwBMyp0XO0dkDtlXjBmiz1Nt4p/DczvYlNS5gepHFhGGsJcS8sDnKSZ6YbOFMz/r5s6yf2hqBbNRRj+Ww4HxmmsNyNgcp/yrnTiurBFZ5bxLEBs0s0psf+1NXZ8ReE/y1IZ2rTomALzh56k3PBR/Pp7lFE8p6bvVE3r1tMM95MhBWnVnkhJ3bQT3ijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTer333pXX9ZjZbS61wPN0YWNt0sxVGFs9fvdew9uCU=;
 b=CrCYFGP3w7nGacoZYAaI6d5/JrBCgB5EPN3AISSp0IpI9rkHv7ZBX/8VuPWssJX2PJZxy8sGoYzUJtIILl1oJVvZ4fL8eW3cGFiGdi8LwvHAegkIz9pfb7YR31mgwONgprFlsAE9WXdIzZ530v2m6OUMsERk1OvrRAC2LPApKI/MysuFRBbfKaIA46F9y+dlxO3UlVE/mJ1tPStHdXORa/CIAbSqsRW70neV9lVMQvp5U7iop06DIBPbIoRTKjlwm9Clf9UHrykMOWsqjSXAwJx4U98xgL33/GytdzzYc+/JJV9+6LfNoAuNfYisJSnZ2o14S2hOVCfSH2vuAUbXeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB2999.namprd12.prod.outlook.com (20.178.55.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Thu, 12 Dec 2019 17:42:29 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::8d3d:d3ba:cb91:c060]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::8d3d:d3ba:cb91:c060%5]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 17:42:29 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajaykuee@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Topic: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Index: AQHVoZfAZYEU1Q0sLk61ZBRXTLc1s6e2oUkAgABCE6A=
Date:   Thu, 12 Dec 2019 17:42:28 +0000
Message-ID: <BYAPR12MB27275226F3C815F96257F081DC550@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191123004347.5127-1-ajayg@nvidia.com>
 <20191212134412.GF31345@kuha.fi.intel.com>
In-Reply-To: <20191212134412.GF31345@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-12-12T17:42:27.4721049Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=445a388b-0681-47c9-987e-24d24e61d1b1;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0c16fcf-fc3e-48f5-40da-08d77f2aa8cd
x-ms-traffictypediagnostic: BYAPR12MB2999:
x-microsoft-antispam-prvs: <BYAPR12MB2999D63C601AB55E2B53F3D6DC550@BYAPR12MB2999.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39850400004)(346002)(376002)(396003)(13464003)(189003)(199004)(86362001)(66946007)(7696005)(71200400001)(2906002)(4326008)(6506007)(76116006)(53546011)(33656002)(5660300002)(478600001)(66446008)(66556008)(64756008)(66476007)(52536014)(9686003)(26005)(81156014)(81166006)(110136005)(8676002)(186003)(8936002)(55016002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2999;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:3;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1PdjMvqXeJyAFB4s4dIuiPJCdbaR9pncCsCNre3qi0GGptSmGtatT2RLX1X5zdoIZIR0sx0B+LLXG13diEopZ2+U8nobXITsqUshHknI0jh1xmbG37I4g07t9VrPxTbeZuzahkuXpu1w3QV+YzMo7udDucmvZOTq6pzZP9BLxJICgPcf1+6VoDcRUH5PNsTu5gmM8VIszrYjvhSseA/aruXVLNTgpXRxm0MBtyWM4IsQJXRBf5k3QbkMETk+27tcOoMiGylWpWgANhU8JyCJyBt4Tq6axsQ/TcGeGTeuwE2+TQS+7uJZhMn3zMLXseeCyqbE6+Q3mKuriZtngDOpjsmUf4YgVhvVBBNS2WQ+w5dWlDukbawB0P1KEqVbN4LWA1Fpt4eH4JJyhqkEOdwBl84YhUWmkcRMFF5u7qDNe1YtgDFKZPHryKjTF19ulkg2HI4ybNUbvgRr6OfQw/5jWOwcAZSrp/jT32pZfqmy5VT0t879pdmQ8H/dUkg2dzGI
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c16fcf-fc3e-48f5-40da-08d77f2aa8cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 17:42:29.1543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0nJCUUxbXoojvbN5o/QilB7G2jUVgS9x7sHiCle9dIMmd8PSr7UOxYQ/Jl34LVZJ7s7FTPQXYW8ZJ6b8fLV/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2999
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576172545; bh=xTer333pXX9ZjZbS61wPN0YWNt0sxVGFs9fvdew9uCU=;
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
        b=gQ8g9rHGXt4LvPRRLAWKAfTVo1LQn1sOAUhO8KE7VLg9HemtaUbhSpz3a2cpFqJ7M
         aXP2EiFgX/3f0wnTjII1gjSfla6skToUK2K/cpc6eIDb7vD8K7ZhkNXQ6xjaZNbrkt
         rkM7gu7OACwhWHBuiz7sVXgPQIODVsMsXmDeV2IVMPYZsEl/EH/II7hdZ4K9vkYhBO
         ldj8ffb9P2+hf9+dG9+1tcFKVTc3dflBme5b69UcW3JAn/FS9XjHXWo+fbLZSUklwG
         3YWdC1cDXg5hmo7cFsXVPyl849gSYpa/H278Kgdr4I0TYvZmzi57IdJn0QF40St2gT
         ox40/1ebwR+aw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Thursday, December 12, 2019 5:44 AM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: linux-usb@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate DP alt=
mode
> devices
>=20
>=20
> Hi Ajay,
>=20
> On Fri, Nov 22, 2019 at 04:43:47PM -0800, Ajay Gupta wrote:
> > From: Ajay Gupta <ajayg@nvidia.com>
> >
> > CCGx controller used on NVIDIA GPU card has two separate display
> > altmode for two DP pin assignments. UCSI specification doesn't
> > prohibits using separate display altmode.
> >
> > Current UCSI Type-C framework expects only one display altmode for all
> > DP pin assignment. This patch squashes two separate display altmode
> > into single altmode to support controllers with separate display
> > altmode. We first read all the alternate modes of connector and then
> > run through it to know if there are separate display altmodes. If so,
> > it prepares a new port altmode set after squashing two or more
> > separate altmodes into one.
>=20
> I didn't see any major issues with this. There were still few extra space=
s etc.,
> but I can clean those. Maybe it would have been good to mention in the
> commit message that the reason why we need those two separate alt modes,
> for what is in reality two separate pin configurations, is limitations in=
 UCSI
> specification, but never mind.
>=20
> I still don't like the approach, but since I'm unable to explain my idea,=
 or have
> time to write something for this myself, I don't want block this any long=
er. It
> does not add that much code, so once I have time, I can always try to imp=
rove
> it myself, right?
>=20
> Otherwise it's OK by me. I'll queue it up.
Thanks for reviewing. Please feel free to improve the patch or commit messa=
ge.

Thanks
>nvpublic
>=20
> thanks,
>=20
> --
> heikki
