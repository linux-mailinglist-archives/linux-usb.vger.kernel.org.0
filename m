Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B3EDF6E0
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 22:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbfJUUlU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 16:41:20 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:10023 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJUUlU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 16:41:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dae17f30000>; Mon, 21 Oct 2019 13:41:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 21 Oct 2019 13:41:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 21 Oct 2019 13:41:17 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Oct
 2019 20:41:17 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (104.47.49.52) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 21 Oct 2019 20:41:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nR9ukohNHs34T7j0XecdBRovsmTxVFxDcfccdzcWB3kS//XaDnATBRba/gZfqJWj1eVoAwu7Z7Lo2nAi5G5wYsXZn9bXyfQlGEBl/sM1VCQv0IQTgx7KFOVKBeaB01FIA3XJAJiaMT8t8chtl5oNctkOZndEgu3bfULassMpQD285tBt/JTUMafZKCo45PBCK0UW6Mjd94Imvr5UZVEOw40ct3/Lzq/d2Vq+Ve90kkBx4TTCLcacIdyIwaU/yxGSuETj8oYI7r9CMKRK/KKRh05+XBhUSQvKb1qDNzcgeZszO21U5CTxM/AGdqirWO3Ai8Ffjo6ThQ1gsNeDlNQuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk4kFRasizOPNQjH872TbkQs/JcZ5h7jrgMluXg75KA=;
 b=QZ8c5XQNf+90xH5GCBXUyc50lPQoH+Ll2G1Ca947G0LY6jbfZx6nsyNPmds252wjtxpxha85j4embn0XKHKuu2jBbbRyKlrQlkG+/qIQFQzdmOeiyiy17IRlgCG2hYKxWeCVUhKGXiCjIReB+69iiI4PVt3M8rdos2Rkro99YTaCbyFuBQWGCG+ilPVXC0/eZtj1mgS90JjHGcBTAHJ3GFF1UXXt9b6XlS22Db6h5lyB9PMkXodstKlLlwp7+51fHqTS22zGvASaxcwqnORgXKCMMDI8WfJtQhkO27ynGIrMPq5nbCl1/rokfz5mnj6aK8tgTfOTwsSTTjgJAwcApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3077.namprd12.prod.outlook.com (20.178.54.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 21 Oct 2019 20:41:16 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 20:41:16 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/18] usb: typec: API improvements
Thread-Topic: [PATCH 00/18] usb: typec: API improvements
Thread-Index: AQHViAJQgHUdt6QJ7UGQ0C35ghcOm6dljltw
Date:   Mon, 21 Oct 2019 20:41:16 +0000
Message-ID: <BYAPR12MB27275D13BB62F9120EBB9054DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-21T20:41:15.1464419Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=14d48251-a22e-4d89-bef9-b8ab32b148c5;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 018314d6-b809-4306-2716-08d75667052c
x-ms-traffictypediagnostic: BYAPR12MB3077:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR12MB3077D4E1DDF2C952DE87621DDC690@BYAPR12MB3077.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(199004)(189003)(13464003)(55016002)(4326008)(6246003)(74316002)(86362001)(305945005)(81156014)(81166006)(8936002)(7736002)(6436002)(229853002)(9686003)(6306002)(8676002)(478600001)(14454004)(33656002)(966005)(25786009)(6116002)(3846002)(186003)(26005)(71200400001)(71190400001)(11346002)(446003)(66066001)(256004)(476003)(54906003)(486006)(316002)(76116006)(99286004)(66446008)(66476007)(66556008)(64756008)(2906002)(102836004)(5660300002)(66946007)(52536014)(76176011)(7696005)(6506007)(53546011)(110136005)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3077;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 79M+jM+ntA8cXkgldb87Uqo8dKlX0SnJevbCzCm+MUe68BXEMjT9jlyvttSZmmP/PIuB8Zccu8L8fBTDFPHFHEk8hKGRsJ2zdm7OcRBsj9hC+MEEZtQ30X5ocpnktRNimis7qooxSntULAv7vAW62z+S+rH2Ri5XXCbb124WIPuBfBPV3yBuXnkYz+EcxZmrWiTi00gERHm385W+brPswjRtofYN7kwsnIT14zzDkFGnw8RzdQfFBTdgLZsswfMAzy2XvYa/zccbV1G/69jLar75iCLaWlSt3EOL9HDPPoC2ASe33GAUfpwO6lQfZ0fCxp1wLXoMEf+IMuVr1/dDqZH/0YgRQe/sD4sSUoctFS4sk9mnrvRspHT3Uii/KwrF6Awvt2On1/hGPRxzdsiHAW7zbSop9jmJ+b72fu5goUYIDtw1CPi0LNZ+w/KkpSP2rTSlgemV+2EbGr5sibFje9UAuU12uxN0vu1ehJQPhPU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 018314d6-b809-4306-2716-08d75667052c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 20:41:16.2845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbLh06EmwKUbg51bq9f4qjCfHGWLvnaDmjdnsJF7N1wtt2S0uyo9BainF5cTuulTxBxEI6q/gBFosMPgUbXw5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3077
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571690483; bh=jk4kFRasizOPNQjH872TbkQs/JcZ5h7jrgMluXg75KA=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-ms-exchange-purlcount:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=FOmMTu+tHqBgqOeriyfiSlkxtT4zcg/aMYhAavMt1/0e6EQ0GvEyq/iLqpSJPEvlJ
         F3E61vdwYcOmK/gro5z//mpxHpgDGbHqqC5jCzu1aqagA7zycF3aHvvCzDd2GnIa5J
         rWTgBw6ArMjygIP3FAlj0SmoT6PyOo+MAzjxeqwelz5OhUNhS7e3SSj+lerveYC/xC
         muX4tHOjWRsXlGN+q1lKz/6pMUO/CXLQg0n6+w1VMuekdHzeyH0kLDyF/LDvem5ioo
         arU4JX2cByYCbFdgs/lCn48WHtbXlSQRdYjhgmeF0kdAjJh6/O5sqOFBBGTu5b7jRQ
         Wm/+V+7CkGc8w==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> On Behalf Of Heikki Krogerus
> Sent: Monday, October 21, 2019 4:25 AM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta <ajayg@nvidia.com>;
> linux-usb@vger.kernel.org
> Subject: [PATCH 00/18] usb: typec: API improvements
>=20
> Hi,
>=20
> The first patches in this series (patches 1-8) introduce a small change t=
o the
> USB Type-C Connector Class API. Guenter was kind enough to go over those
> already.
>=20
> Patches 10-15 improve the ucsi driver API by introducing more traditional=
 read
> and write routines, and the rest is more generic optimisations and
> improvements to the ucsi drivers.
>=20
> Let me know if there is anything you want to be changed.
This patch set is not taking care of issues discussed at following thread.
https://marc.info/?l=3Dlinux-usb&m=3D156995500624107&w=3D2
https://marc.info/?l=3Dlinux-usb&m=3D157012261301682&w=3D2=20

We need fixes for above issues so that we can easily manage ppms
which has multiple DP altmodes as discussed in below link.
https://marc.info/?l=3Dlinux-usb&m=3D156778906010780&w=3D2=20

Thanks
> nvpublic=20
> thanks,
>=20
> Heikki Krogerus (18):
>   usb: typec: Copy everything from struct typec_capability during
>     registration
>   usb: typec: Introduce typec_get_drvdata()
>   usb: typec: Separate the operations vector
>   usb: typec: tcpm: Start using struct typec_operations
>   usb: typec: tps6598x: Start using struct typec_operations
>   usb: typec: ucsi: Start using struct typec_operations
>   usb: typec: hd3ss3220: Start using struct typec_operations
>   usb: typec: Remove the callback members from struct typec_capability
>   usb: typec: Remove unused members from struct typec_capability
>   usb: typec: hd3ss3220: Give the connector fwnode to the port device
>   usb: typec: ucsi: Simplified registration and I/O API
>   usb: typec: ucsi: acpi: Move to the new API
>   usb: typec: ucsi: ccg: Move to the new API
>   usb: typec: ucsi: Remove the old API
>   usb: typec: ucsi: Remove struct ucsi_control
>   usb: typec: ucsi: Remove all bit-fields
>   usb: typec: ucsi: New error codes
>   usb: typec: ucsi: Optimise ucsi_unregister()
>=20
>  drivers/usb/typec/class.c            |  42 +-
>  drivers/usb/typec/hd3ss3220.c        |  36 +-
>  drivers/usb/typec/tcpm/tcpm.c        |  45 +-
>  drivers/usb/typec/tps6598x.c         |  49 ++-
>  drivers/usb/typec/ucsi/displayport.c |  40 +-
>  drivers/usb/typec/ucsi/trace.c       |  11 -
>  drivers/usb/typec/ucsi/trace.h       |  79 +---
>  drivers/usb/typec/ucsi/ucsi.c        | 606 ++++++++++++++-------------
>  drivers/usb/typec/ucsi/ucsi.h        | 417 +++++++-----------
>  drivers/usb/typec/ucsi/ucsi_acpi.c   |  94 ++++-
>  drivers/usb/typec/ucsi/ucsi_ccg.c    | 170 ++++----
>  include/linux/usb/typec.h            |  41 +-
>  12 files changed, 774 insertions(+), 856 deletions(-)
>=20
> --
> 2.23.0

