Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C21DBE2031
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 18:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407047AbfJWQJx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 12:09:53 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:64941 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406998AbfJWQJx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 12:09:53 -0400
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db07b4b0000>; Thu, 24 Oct 2019 00:09:47 +0800
Received: from HKMAIL101.nvidia.com ([10.18.16.10])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Wed, 23 Oct 2019 09:09:47 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Wed, 23 Oct 2019 09:09:47 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Oct
 2019 16:09:47 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (104.47.50.57) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 23 Oct 2019 16:09:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edGuzf4L2W2B1X78lRYL9vVoUc4G8INkafTjPAbtiLQAo5mIReGl9VFRj4qcZsBYJF31lb/3y5O5G7bNJTmzNJwOEoR+CbWus3P28L6Kls0DCd/+OdkOK3d3c3fQma3/aL03qppxyFyDZjZnFJVZh3FD8l6REMf+aKkNeMYp8ILk6aaRC68BK3+f4w8sDH35iAVD3DvDLipHLgeUY+o11CXioCNl4h5w/DWXe/LhSNHZbOcE9FwsXBk6v4946vpwRbt1xDvqKs23eiVpAAdpAKyyI57HtU8nQMG9ctWLa2VuzlFaifV01tzxqS64m0rYIX+N7xQykJc5gajGChRFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRBuUN2faIExkxRzzM8saQ71bW1YkembmqtjnB2Oi88=;
 b=UbabGD3ZvGcqCCOqtAaGL9GrR6n/JHhKogyhrisiqJlvHjG5SPDw+xzdeIClIPqFc0znLRBICGW265eP/UmMJ46MfOx9xfu2VG1wT7hR3YO964Pv5fKCa4GDLtdEqq4ZHCqZjlQ8gNuLQlx9JJX/TOahzi41EmcnGU2h4BADk5ETRlmJK4leyXq1P2FgAI9N7yAlpoavWa/A4LlfCRrpjtFUiqUxt0EHoN2RsO+AXhAi05+4ZQr6b10Vn9BefqtQdD4rFWEXAKIto92hmCrsIXA51Rx6ob9xN6+0n7S9Ac0HFJxMQMMw1yg0i9yUfWspHThpPz15fj+m3eTWi9kkTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB2662.namprd12.prod.outlook.com (20.177.125.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 23 Oct 2019 16:09:45 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::68ad:82d2:4830:abab]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::68ad:82d2:4830:abab%5]) with mapi id 15.20.2367.022; Wed, 23 Oct 2019
 16:09:44 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/18] usb: typec: API improvements
Thread-Topic: [PATCH 00/18] usb: typec: API improvements
Thread-Index: AQHViAJQgHUdt6QJ7UGQ0C35ghcOm6dljltwgAC5xACAANplMIAAvuSAgACG/PA=
Date:   Wed, 23 Oct 2019 16:09:44 +0000
Message-ID: <BYAPR12MB27273BEE5E6EC8F290BF8CFFDC6B0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB27275D13BB62F9120EBB9054DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191022074110.GD28049@kuha.fi.intel.com>
 <BYAPR12MB2727707263883A987D12D39FDC680@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191023080603.GA8828@kuha.fi.intel.com>
In-Reply-To: <20191023080603.GA8828@kuha.fi.intel.com>
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
x-ms-office365-filtering-correlation-id: 24791c3d-93f5-4114-7cfa-08d757d36b7a
x-ms-traffictypediagnostic: BYAPR12MB2662:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR12MB2662CD7D4BF1B725627124F8DC6B0@BYAPR12MB2662.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(13464003)(199004)(189003)(76116006)(66946007)(102836004)(53546011)(446003)(64756008)(186003)(5660300002)(11346002)(476003)(6506007)(76176011)(26005)(66476007)(486006)(7696005)(71200400001)(66556008)(2906002)(52536014)(229853002)(4326008)(66446008)(71190400001)(55016002)(6306002)(33656002)(86362001)(9686003)(6916009)(99286004)(66066001)(7736002)(81166006)(316002)(54906003)(256004)(74316002)(6246003)(8936002)(8676002)(6436002)(25786009)(14454004)(478600001)(305945005)(3846002)(81156014)(6116002)(966005)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2662;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TChW6cxVnwp8qcrFagk2tFv+m2p6tPjcFdronOYZ7Iw/K6QPhLLWWq0SOhFzbullwWILU6daIjy4RhCeRRTkYHZBloc1CudDROTKDAqgsgoSspfcchvE/JvJdNRwUidZkAx2/x9zuRYgccJRLeZ+MNMFwQbQ/3onPev12tbJlIStgKl3fTp/bgO1ryhztLhr2pCtVpj0mdHVDOQI2wsNjs+2ttLc4eX7vyV7zScbKw3hjZfqrHOFhcwbmXguxVgoKrVeZYxK+tWQusIGwmQRkWX16TMhtBaOle56A0eOPegGymxyEQvIs1jIKYpn1M4OOIGTCxO2VKUW7CzRZSnS3vgQTr+f7kKApv9mYmSEDLwTsyagwYSOr0G5IqxD/zlhpWlPn2MCQxpnyHex1GTH9jlMhRYxDal2WliFtkfMgH3X7NU0E2RtSt8M/zVtUGI3zFBk4ZwgAouhZS5/rivOTQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 24791c3d-93f5-4114-7cfa-08d757d36b7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 16:09:44.7161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FlsL1H5vlCstpRHukhhtDAmT7xOMXRNCGpe31xnnvU+AjyltgKt/OICkoUU29RVGlczQTDQ3dFqlRGEI/4KJWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2662
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571846987; bh=eRBuUN2faIExkxRzzM8saQ71bW1YkembmqtjnB2Oi88=;
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
        b=Zq8XV20J3hlHsN0lV+0KfZ8mS6RTZbufgjqsOfEEItVOqtJltG+i9TqgzO51KHU57
         WDAOG9+mzWOGxSMsPzHlkEP9KBxkMOQLyCkPCwNZgvhkfrM2eRnJC8i5Ap4DYOh5PS
         qLvkGWtoUunXMTkjG8diyLQ0GeZIBiEUJ2dmYQnusUVFdobfouRgvZN2Dg5AZi34/c
         3ojlRqzpxmoj5VfTZAOsuHRNspi5gWbsxsjPJJKy+dhej2SO0J8D8LGuUr2Hg66lIB
         qAHMQaEePUR9EK+e8iDrORQjoONDu7QF7R5NhRelLh4z060G7ZD4lno7jiknpK3XdP
         yJ0ZfYGvyawZw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> On Behalf Of Heikki Krogerus
> Sent: Wednesday, October 23, 2019 1:06 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Guenter Roeck
> <linux@roeck-us.net>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH 00/18] usb: typec: API improvements
>=20
> On Tue, Oct 22, 2019 at 08:43:40PM +0000, Ajay Gupta wrote:
> > Hi Heikki,
> >
> > > -----Original Message-----
> > > From: linux-usb-owner@vger.kernel.org
> > > <linux-usb-owner@vger.kernel.org> On Behalf Of Heikki Krogerus
> > > Sent: Tuesday, October 22, 2019 12:41 AM
> > > To: Ajay Gupta <ajayg@nvidia.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Guenter Roeck
> > > <linux@roeck-us.net>; linux-usb@vger.kernel.org
> > > Subject: Re: [PATCH 00/18] usb: typec: API improvements
> > >
> > > On Mon, Oct 21, 2019 at 08:41:16PM +0000, Ajay Gupta wrote:
> > > > Hi Heikki,
> > > >
> > > > > -----Original Message-----
> > > > > From: linux-usb-owner@vger.kernel.org
> > > > > <linux-usb-owner@vger.kernel.org> On Behalf Of Heikki Krogerus
> > > > > Sent: Monday, October 21, 2019 4:25 AM
> > > > > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta
> > > > > <ajayg@nvidia.com>; linux-usb@vger.kernel.org
> > > > > Subject: [PATCH 00/18] usb: typec: API improvements
> > > > >
> > > > > Hi,
> > > > >
> > > > > The first patches in this series (patches 1-8) introduce a small
> > > > > change to the USB Type-C Connector Class API. Guenter was kind
> > > > > enough to go over those already.
> > > > >
> > > > > Patches 10-15 improve the ucsi driver API by introducing more
> > > > > traditional read and write routines, and the rest is more
> > > > > generic optimisations and improvements to the ucsi drivers.
> > > > >
> > > > > Let me know if there is anything you want to be changed.
> > > > This patch set is not taking care of issues discussed at following =
thread.
> > > > https://marc.info/?l=3Dlinux-usb&m=3D156995500624107&w=3D2
> > > > https://marc.info/?l=3Dlinux-usb&m=3D157012261301682&w=3D2
> > > >
> > > > We need fixes for above issues so that we can easily manage ppms
> > > > which has multiple DP altmodes as discussed in below link.
> > > > https://marc.info/?l=3Dlinux-usb&m=3D156778906010780&w=3D2
> > >
> > > The goal of this series is not to solve that "issue".
> > >
> > > This series is the base work that really has to be done in any case
> > > before we add any kind of solution for the multi DP alt mode case.
> > > Rest assured that we will have support for that soon enough, but
> > > let's just move one step at a time.
> > Ok, sounds good. I tested the series on NVIDIA GPU for ucsi_ccg and it =
works
> fine.
>=20
> Thanks Ajay. So can I use your "Tested-by" tag?
Sure, I will add it in v2 series.

thanks
> nvpublic=20
> Br,
>=20
> --
> heikki
