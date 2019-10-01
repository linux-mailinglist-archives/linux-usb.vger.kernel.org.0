Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B07C3FF6
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 20:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfJASgf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 14:36:35 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:53194 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfJASge (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 14:36:34 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d939cad0000>; Wed, 02 Oct 2019 02:36:29 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Tue, 01 Oct 2019 11:36:28 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Tue, 01 Oct 2019 11:36:28 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Oct
 2019 18:36:28 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (104.47.49.59) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 1 Oct 2019 18:36:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZntZJVRV5Run0IVhqeNBwBr79jCeQH9aAwsvMIIq3eXu2zmNLrW91cr0/UbWfzAPRCUx/z/gcgYnI28jwOYCYokhxPcHwP8iKT6cyLog6GEmyNKD4XT4CCFrHm5OI00kdQcTrJHScXqpewq0emsMCkpSTFx3yjwgr4IwUTdtU3K1Y0TFPp0W8oEfBRSBpsWsw06uclg+MD3Q1yScHWT/KjHU6tqF2JWOou1ZVTC/UwQTSfi93n0JHoJCx/ogUMBEeGUiKyZdjgbOr1ZrOEeWZyUdhGAGDM+00rqAzp6qZimjf5WiHI5zjS7n2ZcDFo+pXdcxnqTIwXlG3wDJMTKEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eVnl57FKI3qHbWTkALBCKuosAxIQ3dT2jgpDOMQJz0=;
 b=M1YmIYkqClizOHYwJKK+I9Zo8zFVA2WidWldHfnrAk9ZupVxvsFcADhqbsIG8rFoLih9pbXabf9hEZRwCyvSzznkQaOClrSPbjqUW0rA/mM0xQe7kgeTPmFa4Sfm9E5tFFB1INjaHwoDQp4rLPThQUpIj33jgCpMWhOGpgMWEFUwWYOaaWziZBIvazM7SZMDpyZ3C35GYrN6onWcX1uRoPuNMB51plksDI8mXjrfj8jN/SFzDm51p8J/3U5tcsjGQLtbbkcctn6RM8+BKo5/yzwCaf8/O49DICDvwctG4hZRPryqplT6qMlrvxDLrh3dyAHNczVElS+Bf4xd/7zUfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3109.namprd12.prod.outlook.com (20.178.54.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 18:36:26 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 18:36:25 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Topic: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Index: AQHVdFI7VovQttbK0kyVtx5zpzGGF6dGIWlA
Date:   Tue, 1 Oct 2019 18:36:25 +0000
Message-ID: <BYAPR12MB2727E1FE3CDFC5D6DD87CF73DC9D0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-01T18:36:24.5195047Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=af0348d5-5164-4ba3-b376-b38fb7412ad5;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69708d2b-b9ff-4b07-aa1b-08d7469e443d
x-ms-traffictypediagnostic: BYAPR12MB3109:
x-microsoft-antispam-prvs: <BYAPR12MB31095E3AC5F2B70DE8F61EF2DC9D0@BYAPR12MB3109.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(396003)(366004)(376002)(346002)(13464003)(199004)(189003)(486006)(446003)(9686003)(8936002)(229853002)(102836004)(26005)(7736002)(55016002)(305945005)(186003)(6436002)(478600001)(71200400001)(71190400001)(99286004)(11346002)(476003)(6916009)(74316002)(256004)(14444005)(64756008)(66556008)(7696005)(86362001)(66446008)(4326008)(33656002)(2906002)(6116002)(5660300002)(52536014)(316002)(3846002)(76176011)(66946007)(66476007)(76116006)(81156014)(14454004)(66066001)(6246003)(6506007)(8676002)(53546011)(81166006)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3109;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TuXPZBfxTiTDv8a49DzMvI7FQMXvSywz9goGAnL3gQ+2SmtV7+ulK9vb3vo/NiC4PX89WJGLTzse0RUn5PjsvvAMIS3wlZn85wFKw8iuEN75ch/+IcAx0luNbWRaRsZcLXinrwcG2+MyR9PQFjeFYaBB7H+XSGiuaJxntYiUpnokONM9yzFLcDdD7/58ZNaMGUFsxcmL0Xwjfqe9Vkba9rlWcfZljcJ3zQdkrUzNAPHXBuNq+FGKgJRbjPOqlDIqvqGUwcbb+7sPO07qhA0MW3dO7i4RcccewE2hH0dy0iehvVYFZp250Ho7otgQq+cr1YU9uB63z2iOd9fT+F6PLThd0dQaAsnPGlL7JyPKIcBdewXz1pgJWr8ox1K/A6eklYo1rK4jvtLSmzXjQkqSRQvwgXIKBd99BvBusfXzD3c=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 69708d2b-b9ff-4b07-aa1b-08d7469e443d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 18:36:25.7634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4xOt6E0OcHtRxqiKcZw8/c2EiF6RvkjJeVZr3n71RLcEPyDh0rRpr4Fn0e2xjtI3mva1cImMdCVzxTZ6EaQ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3109
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1569954989; bh=7eVnl57FKI3qHbWTkALBCKuosAxIQ3dT2jgpDOMQJz0=;
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
        b=oVoTkGdPTMzKMrtZw84RAUipbBrI4RS54f1GvQoFc/J7QJshU3nTif8sqONna3gUv
         OUXJn9ZlIyf3r0FSEPAeTdF35px/iQYWIKRSw7l8yqQaIXAUB/AestKAVhKXczUWg+
         GWjUdl6kP5ZIuo0rWClEJt+im16WoRB10S7ZkaBPpG0HkF4+6QQ3RENFzELAbkWsV6
         /53K79FLWUtdfCllrIhIjM155Tb/LI92VJMFr+O2CQFNjVvnlJICcvgw88+bHAL3Dq
         9iWMUNrwRoHsPn925t4gXPRP43jkL/SSKtPKmu+/ZZiG89RxkUTCtsT2rA7nVL57de
         J2t/GARxPJCXg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Thursday, September 26, 2019 3:07 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: linux-usb@vger.kernel.org
> Subject: [PATCH 00/14] usb: typec: UCSI driver overhaul
>=20
> Hi Ajay,
>=20
> Here's the pretty much complete rewrite of the I/O handling that I was
> talking about. The first seven patches are not actually related to
> this stuff, but I'm including them here because the rest of the series
> is made on top of them. I'm including also that fix patch I send you
> earlier.
>=20
> After this it should be easier to handle quirks. My idea how to handle
> the multi-instance connector alt modes is that we "emulate" the PPM in
> ucsi_ccg.c in order to handle them, so ucsi.c is not touched at all.
>=20
> We can now get the connector alternate modes that the actual
> controller supplies during probe - before registering the ucsi
> interface=20
How can ucsi_ccg.c get the connector alternate modes before
registering ucsi interface? PPM reset, notification enable, etc.=20
is done during ucsi registration. UCSI spec says:
" The only commands the PPM is required to process in the=20
"PPM Idle (Notifications Disabled)" state are=20
SET_NOTIFICATION_ENABLE and PPM_RESE"

Also, it doesn't look correct if ucsi_ccg.c has to replicate most=20
of the stuff done in ucsi_init() of ucsi.c.

Thanks
> nvpublic
> - and squash all alt modes with the same SVID into one that
> we supply to the ucsi.c when ever it sends GET_ALTERNATE_MODES
> command. Also other alt mode commands like SET_NEW_CAM can have
> special processing in ucsi_ccg.c and ucsi_ccg.c alone. There should
> not be any problem with that anymore.
>=20
> thanks,
>=20
> Heikki Krogerus (14):
>   usb: typec: Copy everything from struct typec_capability during
>     registration
>   usb: typec: Introduce typec_get_drvdata()
>   usb: typec: Separate the operations vector
>   usb: typec: tcpm: Start using struct typec_operations
>   usb: typec: tps6598x: Start using struct typec_operations
>   usb: typec: ucsi: Start using struct typec_operations
>   usb: typec: Remove the callback members from struct typec_capability
>   usb: typec: ucsi: ccg: Remove run_isr flag
>   usb: typec: ucsi: Simplified interface registration and I/O API
>   usb: typec: ucsi: acpi: Move to the new API
>   usb: typec: ucsi: ccg: Move to the new API
>   usb: typec: ucsi: Remove the old API
>   usb: typec: ucsi: Remove struct ucsi_control
>   usb: typec: ucsi: Remove all bit-fields
>=20
>  drivers/usb/typec/class.c            | 125 +++---
>  drivers/usb/typec/tcpm/tcpm.c        |  47 +--
>  drivers/usb/typec/tps6598x.c         |  49 +--
>  drivers/usb/typec/ucsi/displayport.c |  26 +-
>  drivers/usb/typec/ucsi/trace.c       |  11 -
>  drivers/usb/typec/ucsi/trace.h       |  79 +---
>  drivers/usb/typec/ucsi/ucsi.c        | 592 ++++++++++++++-------------
>  drivers/usb/typec/ucsi/ucsi.h        | 410 +++++++------------
>  drivers/usb/typec/ucsi/ucsi_acpi.c   |  96 ++++-
>  drivers/usb/typec/ucsi/ucsi_ccg.c    | 214 ++++------
>  include/linux/usb/typec.h            |  38 +-
>  11 files changed, 785 insertions(+), 902 deletions(-)
>=20
> --
> 2.23.0

