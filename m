Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF5EC114AE0
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 03:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfLFCZM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 21:25:12 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13257 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfLFCZL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 21:25:11 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5de9bbda0000>; Thu, 05 Dec 2019 18:24:26 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 05 Dec 2019 18:24:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 05 Dec 2019 18:24:30 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 02:24:30 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 6 Dec 2019 02:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaB9GmKin+1kXy6CWq7hRRLGDnCcyfxyJpWzMXRJbFEXB0CgPiMiettK3axUskzYhzTKeoXglhLc7xLfebV/EdTsbnKnPy1A1SqhiTZP74vTId+C7kF3neCyHrbq8PWAigSHWXsSJuYeCea2C/YjoE+6statx0NTW6GjbOaj4ac3fYZbu8NA3vXsVd7IFnxaBjd4R7Ipg9JdYvKvadHr/hD0hkp4RtbBROkfDl1BmxQpOwsBp9HVRG65q0pGag1OkhQLsJEyItHCz9mlHe+pX8oJqMoBhpmO2h59I6HrEWCyr1MmFT0qoj9rN+1PL62ff6WsmXBZXrhA9gmbZuVaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukPw5cAMop+xPhmXmBPUz8DYEYteJr/5uuQEP7t//J0=;
 b=Qg3hOcoNukplN3vqUb8LJ0JCzkNrr32gt1gbUh9RA2kBNJEqto4qHiEnrD2X/iFsuopi4Kv79IM9wf8xB/EvJ3S4tKA1KRfu4Y1sgrp1+ymi2H7gmt4i3dWZGKP47vn00FUtAkIMBg4KRbK9M5ENoa3BJ2I9uwkTxR9mFeiEwXTUHSwZ9PZrO0AeJprRSFj1L/TTU+il0MJTGkpbUXFBkSawA6z9IwxOPc8OtTU6pDiUZrxlIhR8QetD9feGld43Cju8dmrVlfjGxQtnfp2H3cV6lkcGtCha+XnplaKz/EzrMBLCo2xvhkYh9eoOb2pOnIVzGsuIcz9KO5jDxt6vGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4126.namprd12.prod.outlook.com (10.255.125.12) by
 MN2PR12MB4077.namprd12.prod.outlook.com (52.135.50.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Fri, 6 Dec 2019 02:24:29 +0000
Received: from MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::2572:7735:8756:b5f0]) by MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::2572:7735:8756:b5f0%6]) with mapi id 15.20.2516.014; Fri, 6 Dec 2019
 02:24:29 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2] usb: gadget: fix wrong endpoint desc
Thread-Topic: [PATCH v2] usb: gadget: fix wrong endpoint desc
Thread-Index: AQHVqmRr1WcqqGE7wkeK/+mD/3x9VaepjgKAgALUjkA=
Date:   Fri, 6 Dec 2019 02:24:28 +0000
Message-ID: <MN2PR12MB4126D73F5E8981DA53C8F647CF5F0@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <20191204053322.35776-1-ejh@nvidia.com>
 <20191204070646.GA25122@b29397-desktop>
In-Reply-To: <20191204070646.GA25122@b29397-desktop>
Accept-Language: en-US
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
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa3c7e80-5847-44b2-db95-08d779f36bf1
x-ms-traffictypediagnostic: MN2PR12MB4077:
x-microsoft-antispam-prvs: <MN2PR12MB40772582F6C098FA846737D0CF5F0@MN2PR12MB4077.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(366004)(189003)(199004)(478600001)(99286004)(7696005)(76116006)(14454004)(4326008)(25786009)(66946007)(102836004)(316002)(6916009)(52536014)(186003)(4744005)(66476007)(66446008)(53546011)(76176011)(64756008)(54906003)(66556008)(5660300002)(71200400001)(55016002)(81166006)(11346002)(305945005)(8936002)(74316002)(26005)(8676002)(6506007)(229853002)(33656002)(86362001)(81156014)(71190400001)(9686003)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB4077;H:MN2PR12MB4126.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WcHFpIJ0u/AdAgEU5arkJ8Cyejq57osSUPjMrZvVagAUqbLsK+JB/HxvZYTPmK96Jx0Rg93Shqhb+HhIvr1zo0ZVJoNq4PCg1CiV4fSQkCgVXG0C5cCM2Mr2g4K800Jp6BqNmPfam3qsRcIm0HBjKsvQo1mvPp1IiG7HnPpfIPRKwbdMCyBsZFE4Mkt6wgPDicx50PNtXkrWF9MTbJbaLgTDRHZQ5DqrBiefpMvu5dI1wZplI2apQUjgn6oPhLOpoxZCg3B9CELSr9ZLSn5PCo/Yn9r+uKwDdqeyDPC0YT6pqMAXU1kz/b7v5uUOa+Xl9hpYcKyFUULyFOcGCl1SKmgqvsGGsudeBCv6Glp8EZHAMX0R0QQCVrYxrqn0NH6yrn9x9lOEoeaejnYpNGlfl0XxtmsyHOM7lkSqO2sia9Jb8evxtZh3B0Q0SsHmzniy
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3c7e80-5847-44b2-db95-08d779f36bf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 02:24:28.9209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKwAomzjZutFAUA/hCBrP7Hl2xiH7xicgoWXrd4QMHGuIaNXEIHPrVE3pQ5C8XkJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575599066; bh=+BoWdeS9eLdzG4OK9/4N0kdaZANQju6YGqyoQoaozlw=;
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
        b=IFdRPZXDq/OHz7IujnY9z+yCm8a+WABPkp4ZuNiKbz/cGGOQ1u4syL61kJ7rdl9Xk
         14LgBNm+GThISD+oZaM2ZXU4nY8OfVmRFVFzZfq8UjCQChMXFvz8dd9LOUvXtk3DKp
         xuwvUrZko7NwajgExn908ktFUSQAzMuv408gbCFWZQjQsb2KduhkpFHIC2szX1lUAM
         I1KOcRa6AMoKjG13fEkyeXGOu57FiW50LK8TMna1PIL14UYtoSordq8sCGQ0+qFwXd
         m4kx3JQ1ss2iAu6vDYbUOVrchk1nkCTWa7xuADSfqzpBzIpG7GYz3df2JxhmkS1vGQ
         AyVDBo1sYUAYg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,=20

Peter Chen wrote:
> On 19-12-03 21:33:22, EJ Hsu wrote:
> > Gadget driver should always use config_ep_by_speed() to initialize
> > usb_ep struct according to usb device's operating speed. Otherwise,
> > usb_ep struct may be wrong if usb devcie's operating speed is changed=
.
> >
> > The key point in this patch is that we want to make sure the
> > descpointer
>=20
> Typo
>=20
> Otherwise:
> Reviewed-by: Peter Chen <peter.chen@nxp.com>
>=20

I have uploaded a new patch following your feedback.
Could you please help to review it again?

Thanks,
EJ
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
