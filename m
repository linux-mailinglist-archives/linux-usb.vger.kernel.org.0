Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F11A1E0D64
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 22:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731593AbfJVUnn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 16:43:43 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2950 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbfJVUnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 16:43:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5daf6a020000>; Tue, 22 Oct 2019 13:43:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 22 Oct 2019 13:43:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 22 Oct 2019 13:43:41 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Oct
 2019 20:43:41 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (104.47.40.51) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 22 Oct 2019 20:43:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjHAB3BwRop3+2F36bOg700e/8xP/Skdz+w6Ew2DZ4o6ITE+xUgmZGU4ItRDBG6RmxKn/fgHkxLoM8YQt1d5UBt5C/pDAfwI3RRqJfXUOiWCCEbx4VHS7wkcm38ftKoRjlOULVavGeySs6ToR1FG/Kf6f0Ikm28mFdUmR7cGUtQk11CFNteg1yML7To6okF6wXOKm39o+W06yhDfNSSEIPrxR/igoilQMF8pdFG2nYYAPAUq1+pDrQp5ANtHQI/Q75BdfjeTUFyUXEmoo8IkrxAbVoTsA3LcBFyHJsprVPRegKp+idrsrXMfCh8bCv1p3Mbt6ifj40R8n51v9bO7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSqAnOfg5fO/itEBInI7OxJOACpTtSgJZxLGyEl+SVo=;
 b=V3E4GCzQhnRzDy5RZl0+/oAc10LT3L5JCRUM5lzpg6ROIN2uwqctZhTMfnjcIonRYftQ6o6SlIvGm/Qa5CtS8HYCYL2uEXUJ7SpkePUhA203l0CIAfpSbIEdlAakTbpa7vMbfiuMiXW5qY0AwwI7Kbwf1Ak8pV9nXdpY7P8gZxDGOEPHszgDLdOPeOfvPx05hCLZEC2Ycz6rz0Lw5FIzhffrz7R4rw6T+CvjGTW/q04j2u+5zJ/RauNKHwdRuh1++ycXzc4W8bx01FZcq8e6XqUJ+ND6pih9hzqGi0gdzVQaBf60Rw8Hy6wL0EH2Kz++NWWWHeJdNBKzfOEfzBaCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB2856.namprd12.prod.outlook.com (20.179.93.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.28; Tue, 22 Oct 2019 20:43:40 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::68ad:82d2:4830:abab]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::68ad:82d2:4830:abab%5]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 20:43:40 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/18] usb: typec: API improvements
Thread-Topic: [PATCH 00/18] usb: typec: API improvements
Thread-Index: AQHViAJQgHUdt6QJ7UGQ0C35ghcOm6dljltwgAC5xACAANplMA==
Date:   Tue, 22 Oct 2019 20:43:40 +0000
Message-ID: <BYAPR12MB2727707263883A987D12D39FDC680@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB27275D13BB62F9120EBB9054DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191022074110.GD28049@kuha.fi.intel.com>
In-Reply-To: <20191022074110.GD28049@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-22T20:43:39.1377195Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=330b81c3-740b-493f-9dfa-d909ba60db46;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a21c244-fbbc-4ace-1c0c-08d757308561
x-ms-traffictypediagnostic: BYAPR12MB2856:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR12MB28565A1C858DF778333BF2E6DC680@BYAPR12MB2856.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(13464003)(189003)(199004)(76116006)(86362001)(6246003)(25786009)(229853002)(6436002)(55016002)(4326008)(52536014)(66066001)(64756008)(6306002)(66446008)(54906003)(66556008)(66476007)(66946007)(33656002)(9686003)(11346002)(7736002)(7696005)(476003)(8676002)(186003)(53546011)(71200400001)(6506007)(5660300002)(74316002)(71190400001)(966005)(6916009)(305945005)(446003)(81156014)(81166006)(102836004)(478600001)(26005)(256004)(8936002)(6116002)(2906002)(3846002)(316002)(14454004)(99286004)(76176011)(486006)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2856;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5R5QFVdUTjhqi9HO8i3aK/GDyp+4nmXxMawLMFl3wSzgyuNnXhHEwlFNMiAqjt5M6mBOErvCW4FUVnBhTS6SPSxYbwc9aT8TokKdgK2qMIO1bSlYKpZh67ytZoGeZmIaoFZBCy7jtjxb6gnJDAecethGLztmVoKMhS++2gymTyoY/k84kAJVRvPZ2YRUNC+7o8kx0y+KP3YyZ8D6szAjhx8hiKbOi30OY5oWHcJyTIKSfY/gFazYYuWdOEsOKEmZFJF4QEL0HNZ8p6hpz1aXw6qBb+SPrZvrHtyIakW4Rbsp5xCW/GwI7pFP7l7Ju1QNHB7jUbjWT1FsOPsZB6taZ5YtkwP7OEXtOdNV7z10MSEiLtIrZxl0eUqjoBqB64HXzv/ppU/B668J82hGLdtKLZZbx/vCWbRwDlpmQTvg7FIRZUr17TJ/2IRS8sPkdEvvX3SJG9aGkSvHVxxa39hdRN8CmyxSAkoCn4+3MIeze9s=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a21c244-fbbc-4ace-1c0c-08d757308561
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 20:43:40.2755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F78HL97pEHKfWDdOhEiJn9wCwE5LJKTPQCGCcwNcu1uIx1mu4XQc8EH0Y6ToIFowVqYAFoZ4+hA0Kf6VZ786hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2856
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571777027; bh=oSqAnOfg5fO/itEBInI7OxJOACpTtSgJZxLGyEl+SVo=;
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
        b=T/jyeMg4euye3ImRnfOII/ycgmTpxJtQcQTjYg52kd+lnGWA3mRZQl6Qyrl8pe2H3
         9fpjQl2IXs4e6+47PgY6pCtLhu42xXLDsa9CMSxNcEnVu6410wMsMcyUnuWecjj2Pt
         dD69z1iUFDLFOKdOkzGB4F5Cgti9jF20WyQPpQ0Q0oYFmd5xnSg6dIN7QFhEvZhTCi
         S07vGAoylTfAvdenKeNHyXfhsiUa4RtnzrO8T5Pidhi5lsKYLfVpjmuwPLOh7WxqHA
         QnU3OdzhmeYK+P1wWOyvL9vCDFrmWcHPQ9tEWuzLMbyO9HnIguD7YGvIWHAA1PNPCb
         qseuO83F6W0ug==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> On Behalf Of Heikki Krogerus
> Sent: Tuesday, October 22, 2019 12:41 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Guenter Roeck
> <linux@roeck-us.net>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH 00/18] usb: typec: API improvements
>=20
> On Mon, Oct 21, 2019 at 08:41:16PM +0000, Ajay Gupta wrote:
> > Hi Heikki,
> >
> > > -----Original Message-----
> > > From: linux-usb-owner@vger.kernel.org
> > > <linux-usb-owner@vger.kernel.org> On Behalf Of Heikki Krogerus
> > > Sent: Monday, October 21, 2019 4:25 AM
> > > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta
> > > <ajayg@nvidia.com>; linux-usb@vger.kernel.org
> > > Subject: [PATCH 00/18] usb: typec: API improvements
> > >
> > > Hi,
> > >
> > > The first patches in this series (patches 1-8) introduce a small
> > > change to the USB Type-C Connector Class API. Guenter was kind
> > > enough to go over those already.
> > >
> > > Patches 10-15 improve the ucsi driver API by introducing more
> > > traditional read and write routines, and the rest is more generic
> > > optimisations and improvements to the ucsi drivers.
> > >
> > > Let me know if there is anything you want to be changed.
> > This patch set is not taking care of issues discussed at following thre=
ad.
> > https://marc.info/?l=3Dlinux-usb&m=3D156995500624107&w=3D2
> > https://marc.info/?l=3Dlinux-usb&m=3D157012261301682&w=3D2
> >
> > We need fixes for above issues so that we can easily manage ppms which
> > has multiple DP altmodes as discussed in below link.
> > https://marc.info/?l=3Dlinux-usb&m=3D156778906010780&w=3D2
>=20
> The goal of this series is not to solve that "issue".
>=20
> This series is the base work that really has to be done in any case befor=
e we
> add any kind of solution for the multi DP alt mode case.
> Rest assured that we will have support for that soon enough, but let's ju=
st
> move one step at a time.
Ok, sounds good. I tested the series on NVIDIA GPU for ucsi_ccg and it work=
s fine.

thanks
> nvpublic
>=20
> thanks,
>=20
> --
> heikki
