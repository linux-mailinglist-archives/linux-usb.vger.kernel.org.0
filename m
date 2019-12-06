Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8763A114AF2
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 03:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfLFCgG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 21:36:06 -0500
Received: from mail-eopbgr60068.outbound.protection.outlook.com ([40.107.6.68]:18423
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726109AbfLFCgG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Dec 2019 21:36:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilEV5LV1iQyKGI9paQjCJYkU2kHPuYbXCrnx5n/t2IJvtWRm64wo3txnby2Fxv3A+kdECQa+aFgsv6Uhwo0Sr54/hT8bl7N2cERzhkOcK0No2o064Tb9jdo/9grwExkA+eQjCGxpr9OYDT8puzAS8HaZcDzuBtfiKp0earsVXcF8eKu0PW9GTaaQhzWYcuRDeK3sjY91X0U3j2Q0GnyTYK1aYXSXSpUHs5gTcuschNdsLgpiqeI1rz2g/qaykf0Uf8nVvA0Xm+h8bk30RzKlpBkpvnJr6ltVf6ToeBYTxqCVtk73y7NWJ8ZKUlF1FAqy5GHqaH1TGA3BnUc69YDkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWf7Xt7thlFMx/zoGVjWEs/sSfGU1SJZG3bsb+v5ahE=;
 b=d71Psz3hMpXEjuSURamq8EAkiccVCI9PoVAUnXw7vk66Ofu4vPWRd6c9T/SYE72Jc88gMkgdRHrocExCBWauayswk9G4rceLjTMk7nKnmSeRvxcHUANHEpwIm8cfiadCTmGYJj/cPURn11e46v/CUxv5GCXq38uB/mSUKjRNR2bHG3RNRrDfI5fuElHtRw6zwN064um1m+ghOx30DS8pndL1/k+ir9y22ectrUf8KvWDrYKuN7F7KfGx/Wg6i2INZ+h11E3ErTDmaChludsV5Eit/LvbOze2XWMS7mQBo4ByYsIHL+BP/9vTlGxnXtjwOs12jJsSPLH4i+0PZgvSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWf7Xt7thlFMx/zoGVjWEs/sSfGU1SJZG3bsb+v5ahE=;
 b=fKloPOVznC8+2R3cV0cDop36Jb2roLDS3Ex3DSjP1RmhLbaX8NanzDO+/HUtP+mkhEl0YJzfwgPQbu39Vy8BjOa8WuqJiJJu1Fdc18xmj6UMtMOOjPg0wbU6yLP0Gf8rNZlI43d5ojrI7UAuBLKfZ92SUM5SRH5XuRC8FMtg7HU=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6336.eurprd04.prod.outlook.com (20.179.24.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Fri, 6 Dec 2019 02:36:00 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9%7]) with mapi id 15.20.2516.015; Fri, 6 Dec 2019
 02:36:00 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     EJ Hsu <ejh@nvidia.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2] usb: gadget: fix wrong endpoint desc
Thread-Topic: [PATCH v2] usb: gadget: fix wrong endpoint desc
Thread-Index: AQHVqmRjLMvtmsW5AUGcmwtQARW6E6epjf4AgALVygCAAALVUA==
Date:   Fri, 6 Dec 2019 02:36:00 +0000
Message-ID: <VI1PR04MB5327D493C1B25F199D5F72C88B5F0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20191204053322.35776-1-ejh@nvidia.com>
 <20191204070646.GA25122@b29397-desktop>
 <MN2PR12MB4126D73F5E8981DA53C8F647CF5F0@MN2PR12MB4126.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB4126D73F5E8981DA53C8F647CF5F0@MN2PR12MB4126.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-12-06T02:24:25.0899276Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=5505fdac-df4d-49a6-9e5e-1a3d37c4824c;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 706224bc-a616-4364-6e2b-08d779f507db
x-ms-traffictypediagnostic: VI1PR04MB6336:
x-microsoft-antispam-prvs: <VI1PR04MB63363A086E9B0E1C58ECD2118B5F0@VI1PR04MB6336.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(11346002)(54906003)(71190400001)(71200400001)(316002)(76116006)(99286004)(4744005)(6916009)(2906002)(44832011)(74316002)(53546011)(6506007)(86362001)(102836004)(478600001)(305945005)(14454004)(186003)(26005)(5660300002)(8676002)(25786009)(7696005)(8936002)(9686003)(66476007)(66946007)(4326008)(66556008)(81166006)(81156014)(64756008)(66446008)(76176011)(33656002)(55016002)(52536014)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6336;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HO7DEK5BINDYDeF4/N2quCB9ITbKfJK/TD2Q1Tk4tBb/8TDYowd4SegpA0OOpeyqCzwNdOsYu8ED7jPe0n/D0U1r16r7ZMKlUEK4lDvvDdlNxRtvXADe6sxYKfhZTTd8BcRlwOFp0rKJQJayiWUwymlfhuNg9CVBU1atc1zk4Y8eeWEoqP1nXXKCK978mb26RPjg63LhEKMKjm01laTW8YvnPYy5BMzGCMEfCdWiGS2QijHS5tS4/beawGjDi4EBuRu4eNKeshD73g/Hw0n9vTif1eowEfLFYleSAlZSp3b+lQJM/o6nS4iQgyZkFwnVnAiarXSKU5Vig06fYgMdoRp1ZPUJm8RWm9gkO239Q6Bbf5Ibizv+y02LucFzANo8AlWGXtNIeMP5QOUlLRzwRk9t8/RCMGOq0SAK58Vul6Lho+LqFAe/psmr7LYs1a1E
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706224bc-a616-4364-6e2b-08d779f507db
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 02:36:00.0714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +yNuHwdF7dnNqWQ4+00s5vYX48U0kKs3bSNdFGVBIrQKqfR1VhJHIdApOlF/5C3yTPjQ1eWammm8UCPaWmT0Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6336
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> Peter Chen wrote:
> > On 19-12-03 21:33:22, EJ Hsu wrote:
> > > Gadget driver should always use config_ep_by_speed() to initialize
> > > usb_ep struct according to usb device's operating speed. Otherwise,
> > > usb_ep struct may be wrong if usb devcie's operating speed is changed=
.
> > >
> > > The key point in this patch is that we want to make sure the
> > > descpointer
> >
> > Typo
> >
> > Otherwise:
> > Reviewed-by: Peter Chen <peter.chen@nxp.com>
> >
>=20
> I have uploaded a new patch following your feedback.
> Could you please help to review it again?
>=20

Feel free to add my Reviewed-by for your v3 since you only change the
typo I pointed.

Peter
