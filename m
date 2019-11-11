Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE1EF7926
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2019 17:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfKKQvV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 11:51:21 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:33863 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727112AbfKKQvR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Nov 2019 11:51:17 -0500
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dc991810000>; Tue, 12 Nov 2019 00:51:13 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Mon, 11 Nov 2019 08:51:12 -0800
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Mon, 11 Nov 2019 08:51:12 -0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Nov
 2019 16:51:12 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.56) by
 HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 11 Nov 2019 16:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqM/w+Vi7m42y47ZtE/5yhKUweoyyKSI8sXmR7DBlv7CBBXfp8v+7XXM3aOJatCbs+L2BxnFQAkQhHhJLS9k+2VwHLQeJHpxAa06J/MQJsWaXn9NK8W14d49PVMzPdCmTFoqcIHmHdUK3V9KrYQI3vzN6ujcCkHRHjGZNcuNKCUj8USnZqd07yPdyGmc+wkBW2eVrFIbbA7PAs/ZgqCZNZYenx5SisGgV9U9gCicaOZg7H32mbGRqANBRd3cTIVrMiPrQ325+I17JyZ2hvLcDYDrXtN4tHwqEmk9HkkcYxL94KsREczzx+6Uo0tO2mKwV6jizS+h60F4m2+rkA/tDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKoSVC0PfGuhTwTKLnUTHGAOnQ/j6VmqRgEe7PxuYEE=;
 b=c5Kmr+Rl+Xt70EiFjQLLo7EngcBinSB2CrEhPs2vp2geHINVEC3VvT1r+MZn5ncdEgNh6tDFcbczFre7EivQ78Ehf4a/MdhQqa6WwDNycStchySk/oeLXqyCG8zgep3GsP0DmH8/8KD6jYrQ5WbE6/wR/KC3CZcjJAFoXq66bui1RKnReGiyisb6elod7BgrFWiTIc1YJZk0ZO950HaAXzYEGwl54dixMm4N2ngQVtbWV2laFT0PfbngDRshbUkjvTuyKOEAKV1jroiYIhIXinJRw5WB2fMXkLBxJB6rQfrOS7Jo0jXlfWyfNIadTMyv7vQNKskTBcFyQPkGdF8aGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3368.namprd12.prod.outlook.com (20.178.54.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Mon, 11 Nov 2019 16:51:09 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::3cb6:57a3:46db:55aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::3cb6:57a3:46db:55aa%7]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 16:51:08 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/18] usb: typec: API improvements
Thread-Topic: [PATCH 00/18] usb: typec: API improvements
Thread-Index: AQHViAJQgHUdt6QJ7UGQ0C35ghcOm6dljltwgAC5xACAANplMIAAvuSAgACG/PCAHecA4A==
Date:   Mon, 11 Nov 2019 16:51:05 +0000
Message-ID: <BYAPR12MB2727DC214FE8D4AA1CC50E83DC740@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB27275D13BB62F9120EBB9054DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191022074110.GD28049@kuha.fi.intel.com>
 <BYAPR12MB2727707263883A987D12D39FDC680@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191023080603.GA8828@kuha.fi.intel.com>
 <BYAPR12MB27273BEE5E6EC8F290BF8CFFDC6B0@BYAPR12MB2727.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB27273BEE5E6EC8F290BF8CFFDC6B0@BYAPR12MB2727.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-23T16:09:43.2531383Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=42f6e7cd-c908-4653-8edb-55c510c5619a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f38397d9-4c2e-45a2-c4dd-08d766c759f1
x-ms-traffictypediagnostic: BYAPR12MB3368:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <BYAPR12MB33686D2E357D4F36BA79873DDC740@BYAPR12MB3368.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(26005)(305945005)(6306002)(54906003)(71200400001)(71190400001)(229853002)(7736002)(99286004)(74316002)(9686003)(316002)(86362001)(6246003)(6436002)(6116002)(66066001)(3846002)(4326008)(66556008)(7696005)(8676002)(966005)(25786009)(476003)(6916009)(6666004)(2906002)(64756008)(76116006)(66946007)(81156014)(11346002)(81166006)(66446008)(66476007)(446003)(76176011)(186003)(55016002)(5660300002)(102836004)(486006)(478600001)(256004)(6506007)(33656002)(14454004)(52536014)(8936002)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3368;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BLnTersyrLTaVZrYjbwWdwolOPYhD6nUlr7e5AzeZLhyShyQhyK8o/DdTdRFcIj2AKmj1kBqzJUTwTFtP+741vmX9rJqOvEXEV3DcMwqOKPuZJiTqRe9rhZx4JNsglEvNL799DQfEsiYL0HkwD4mAuMfhpSZDFDx0+m//J3rSYIMh3EmeUieZ4cqvissuBKje94bH6tU1eFNyujKD1hauGesn+aBts9DUxg2D/E5bESK6CC+5ly6uCOKI5eea/Eeapgmv4IEozRm8RlGgTsHQAZUC8r2eYCgPZE9Aizpef3Jamaaj3s7bSDWsGHgUcDhZFUlQ0Y0d1UwVNQBMFwqqF5v0DOrsJweGRRHyg08qN4wNzNTT//kaBoKd2bSVJoNbLYxedZTqSiBMgaz2+mobvf9B14gt0vmgwcpPk6xz7WvxcM4hWWMJNYaJ6WeL0O5NZxg9ZSXjD+pmNG1dxoM1udOlE5LgkieUSxwbf0kRpk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f38397d9-4c2e-45a2-c4dd-08d766c759f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 16:51:07.0897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y00Tmgn61T+aouMOcHmImUugnx2MFG5P3oFRxdcYy/MKUgoWzbhY8b0rDXDgNRorjFeWZHi9tQUddb0ALLJQaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3368
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1573491073; bh=kKoSVC0PfGuhTwTKLnUTHGAOnQ/j6VmqRgEe7PxuYEE=;
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
        b=AxHytHkRsHf2dKTfF89+Aog2YQRhz/kmbLPVClztSaOG29nvoHvBXTcvofDJjD+w6
         a7JQ0kMdFwCgZqVJ9npGO0XiR8HkAR7hS/tSnwbK6oTL29LJDUoX7kK3j5ETnEFd5M
         mvTye6X+GzC4Xbe8Ds3hPFb9HDZxvwPqz4PUUJoDlMTQa7JWq1o+RNUAOBzlvqGXja
         njOiZPfJ3bJtrdXByl7RM83Stk4Qn8tqQtLG1mqDBIs4Je4jHVU0tSkAZPuHVAg0vx
         FC1t8tHYd+tPbNHlQOmxN7zzB5tMZ4b6fRry2z33LTuiyy9Kyyp6Kh+p7yjsPRcorM
         rMshBj5h0QEKg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,
> > > > > > The first patches in this series (patches 1-8) introduce a
> > > > > > small change to the USB Type-C Connector Class API. Guenter
> > > > > > was kind enough to go over those already.
> > > > > >
> > > > > > Patches 10-15 improve the ucsi driver API by introducing more
> > > > > > traditional read and write routines, and the rest is more
> > > > > > generic optimisations and improvements to the ucsi drivers.
> > > > > >
> > > > > > Let me know if there is anything you want to be changed.
> > > > > This patch set is not taking care of issues discussed at followin=
g thread.
> > > > > https://marc.info/?l=3Dlinux-usb&m=3D156995500624107&w=3D2
> > > > > https://marc.info/?l=3Dlinux-usb&m=3D157012261301682&w=3D2
> > > > >
> > > > > We need fixes for above issues so that we can easily manage ppms
> > > > > which has multiple DP altmodes as discussed in below link.
> > > > > https://marc.info/?l=3Dlinux-usb&m=3D156778906010780&w=3D2
> > > >
> > > > The goal of this series is not to solve that "issue".
> > > >
> > > > This series is the base work that really has to be done in any
> > > > case before we add any kind of solution for the multi DP alt mode c=
ase.
> > > > Rest assured that we will have support for that soon enough, but
> > > > let's just move one step at a time.
Since this series is gone so what is the plan for updated changes as
discussed at
https://marc.info/?l=3Dlinux-usb&m=3D157079026214073&w=3D2=20

This is needed to support ppms which has multiple DP altmodes as=20
discussed at
https://marc.info/?l=3Dlinux-usb&m=3D156778906010780&w=3D2=20

Thanks
> nvpublic
> > > Ok, sounds good. I tested the series on NVIDIA GPU for ucsi_ccg and
> > > it works
> > fine.
> >
> > Thanks Ajay. So can I use your "Tested-by" tag?
> Sure, I will add it in v2 series.
>=20
> thanks
> > nvpublic
> > Br,
> >
> > --
> > heikki
