Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65EE6ABE20
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 18:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732792AbfIFQ4y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Sep 2019 12:56:54 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:44709 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727521AbfIFQ4y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Sep 2019 12:56:54 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d728fd00000>; Sat, 07 Sep 2019 00:56:48 +0800
Received: from HKMAIL104.nvidia.com ([10.18.16.13])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Fri, 06 Sep 2019 09:56:48 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Fri, 06 Sep 2019 09:56:48 -0700
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Sep
 2019 16:56:48 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (104.47.49.53) by
 HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 6 Sep 2019 16:56:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiAdZJuiniuMz/wCroKdIh3/toLqQKVf2uSu2/y89Ini+7eYvuTl0qBEdoKil5Rq8jfBArlaOf5deeMk6t1/v97JbPansIfk/CxzDyXxgwRPrgH+vOc4v2SdZmokguYjWMQLvfRJw+MDIkHPlzHlNkkr6EAWk5j0DTxwfcg1u9KESV8ujvHKhFxtXTxi3cZRNIZgOlJvzcMTJNIszjWPCLXihV7D8vFErVTjOj9cPJWfoKeoHTqNerEUoskXuSUo9QmQY+yZTamkybCn3dfkwpExPI9WS+fLYCITJ5Dgj2v+7NNJZDiI7rNmh6IYtZnYIrcssYIudR8+Mwb3EICA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydbcGjPYFR8Z1h2G6tPlA6o3hCEYTWv44vzCoVzlIWg=;
 b=WolV37y0qsTxOMObR9oB2XLevw3W5D9xcZ+RnzMCEPX+/J2ECegPvnECQgryrp1zHzbSn6BT5Ox+Sd3s5Vs8m1jeKstkKoDr5d4dFTVjhqRTrygSmot2Nf/BYoRTUkIneIzWCjON0yERvG8zePVhsTm6yd2HF8qmD5NwwL8/nH+CtW2BLvF9iOTejFRCIaOxludZcfdQlO8VbjZLnam6bAWa55bTEWSCiY3nGTbewBn0ZqwpvSg9Q279y9iHUZGbjB7lJ9QBJJwtskutA7czNL/whVjmPvakxHNqrPN5jfRadD3ram5lKuJJDXh25JoXJkHEx++rU/tChqR62sUwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BN7PR12MB2723.namprd12.prod.outlook.com (20.176.177.94) by
 BN7PR12MB2706.namprd12.prod.outlook.com (20.176.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Fri, 6 Sep 2019 16:56:44 +0000
Received: from BN7PR12MB2723.namprd12.prod.outlook.com
 ([fe80::6459:8ad8:4765:6d88]) by BN7PR12MB2723.namprd12.prod.outlook.com
 ([fe80::6459:8ad8:4765:6d88%4]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 16:56:44 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajaykuee@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v4] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Topic: [PATCH v4] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Index: AQHVYz4Do/O3J09RNUiBEp8YUwMlkKceq5gAgAAxT5A=
Date:   Fri, 6 Sep 2019 16:56:44 +0000
Message-ID: <BN7PR12MB27230ABB5F93E7ED007665EADCBA0@BN7PR12MB2723.namprd12.prod.outlook.com>
References: <20190904162714.5739-1-ajayg@nvidia.com>
 <20190906134318.GD30048@kuha.fi.intel.com>
In-Reply-To: <20190906134318.GD30048@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-09-06T16:56:42.7617085Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=1fcf5c84-78a8-44ec-a47c-7d307db2d754;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f2f42d6-e4a8-4986-ce0b-08d732eb32d2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN7PR12MB2706;
x-ms-traffictypediagnostic: BN7PR12MB2706:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN7PR12MB2706DD75447478278BB7C79BDCBA0@BN7PR12MB2706.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(199004)(189003)(110136005)(86362001)(26005)(25786009)(446003)(66066001)(102836004)(5660300002)(6506007)(7696005)(486006)(476003)(76176011)(11346002)(4326008)(6436002)(7736002)(186003)(71200400001)(71190400001)(66946007)(66476007)(66556008)(64756008)(76116006)(66446008)(81166006)(55016002)(966005)(6246003)(6306002)(33656002)(9686003)(8676002)(478600001)(8936002)(81156014)(99286004)(229853002)(305945005)(74316002)(52536014)(53936002)(316002)(6116002)(2906002)(256004)(14454004)(3846002)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR12MB2706;H:BN7PR12MB2723.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iT4Isc7kWbvWKfSyP8RVT4vtCnuuuxGfG5xzdwISxcbxjmNnGRNqZeKjxEDe8QHPA/kMJZaV57oBXya9YB0pzJCiTUmQPnkoq1M54MS99YPdSf2v5RDJ5UKksYlUhWtpsn5wE+Jy3mDWP4x0LNkRkVQnIaqRgYSCXQHg5LneQyYzjo/LzmNrT7JjDDix2CISWQrxjQ+LKpaqp1WbN+Q5LpCBfq6ZmqKvdAv0Cm7AneNQ5plO9Sxxc3YGm3gqENtBGNyPubRQLUGfwijdZwXQYzHgeKiWIdUXdhJgz0m47ocmqUFKpEFEbX5W94FXPGPdWmJt4e/k9IUhdTCLsd4wR859K7im5alBNDahZ3qITcwkCRroPBQlqaQB0TLlvPXNVGBoEzZNBFYB/tjFmP8rfMOsCdjFKDER2tnhPwKljgU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2f42d6-e4a8-4986-ce0b-08d732eb32d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 16:56:44.6031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2gcMd/m3h1O5WRGuYEepnKSLmEB9Lb48IOsH6mRlkPIm0L6VX+5LgHVae/6kTt2/IlK1mzM9BH6NCNRbjWlWfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567789008; bh=ydbcGjPYFR8Z1h2G6tPlA6o3hCEYTWv44vzCoVzlIWg=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-ms-exchange-purlcount:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         x-ms-exchange-transport-forked:MIME-Version:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=G+qjRWgjtE5QjtIoUukXdPgUnKam9RAWsKh612MN1E507y0rfvw6EnJVJzl/OtlvO
         Hj4kAWjMOGLsi80JPVdWrt3JzO1HYxw/KUlYxDI5yFVC1BqciUyHzjeg39Ba+idVwC
         49vThW3j6XdOIDOT0tYHI6fmXus1ks6mxmhLYc4x762MkHj1jtlxLMHiImW+Ffoqyv
         nwKJJbAvdgiEuypTUYBXgp182l7fyAdqfysysUGV6Nv78eAIb6NwWhWu8QQJogYf85
         Vsf2mfo/vlW6KlmzUSDKdtmK19+w4UfF4k9HqcF1knOK+s7CqMjLm+KVj4hBNYenKi
         szoMCfCBr6YkQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

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
> This patch has still some stylistic issues (like the comments: please use=
 the
> same style that was used previously in the driver),=20
Ok, I will fix them in v5.

> but besides those, I'm still not sure I understand why couldn't we isolat=
e=20
> the solution to ucsi_ccg.c.=20
Please check my comments at [1] explaining why it can't be isolated to
ucsi_ccg.c.

[1] https://marc.info/?l=3Dlinux-usb&m=3D156625373324903&w=3D2=20

Thanks
> nvpublic
> I have to take a better look at this next week.
>=20
> I'm sorry this takes so long.
>=20
> Br,
>=20
> --
> heikki
