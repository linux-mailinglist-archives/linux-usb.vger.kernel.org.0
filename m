Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB567F95CB
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 17:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfKLQiw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 11:38:52 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:18302 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLQiw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Nov 2019 11:38:52 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dcae01c0000>; Tue, 12 Nov 2019 08:38:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 12 Nov 2019 08:38:50 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 08:38:50 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 16:38:49 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 16:38:49 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (104.47.48.58) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 12 Nov 2019 16:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1Jl9c9YgWq3KoFDsnTDP1QlshqiVln1z+a9Tn55g8b4nx+RCMFUInkQEjhal2BpIA99c+CL0XQXMGbfp7gy5r3MuZ4aLl3L7l90RsjdxdaXHjr5ms1vTIq1xB4GHd4mdNNg2m6l7eVqgE5j/atvdNZjcMepblVTFjBvEkcp1SS8QRFTsbK+rSJT7QVMKD9XNFzKab6J+Nn8O7h1BpgZIl61z+TbncrMLOqATHOteS/v5UyhklrOpJR6L8XS1ABG08vpMA97Pxao26PJY+9ZYVN4YHfO7Iju8mmvVWMA4B6OaDkOCekLo/xJlW18GbwOjlvKtTNcAB9yOvBkFdgkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYFPJ+ixKvjdDoUmpZX+BRN2I/Qy2M1QBV+0JOuATpc=;
 b=bjKgaz42N+rxG8DBM5LST4IF6Emdr/bNwhaH05HgZ7nfMh4Ltagc9L31+ZjY9/7ASQr+GpzrgOc55Haz8BOcHh4EIhMqatC6PBQn8yJnqmE2tln7LjgGGYM59ALpDVNZBltWFdTyvpMmgnu57lj53rCG13BGNqqYKDOx+r1/9vWa90nBQ31rP0uBUkq0sl7tJX1WCjsl1e5hjt07XUY5ZJNsBLEoF4g+OF+0/TnDqy3DWE9odMSR491tEy/NYNKCqIKdWSdoANVlVIpGYb2VMV6PniJftHQ1k8OaaVXGJeIY/Fb1/BoinmgkYZNL7fjs836qW2Fn05FnsfcOxPOe2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3141.namprd12.prod.outlook.com (20.178.54.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.22; Tue, 12 Nov 2019 16:38:48 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::3cb6:57a3:46db:55aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::3cb6:57a3:46db:55aa%7]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 16:38:48 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/18] usb: typec: API improvements
Thread-Topic: [PATCH 00/18] usb: typec: API improvements
Thread-Index: AQHViAJQgHUdt6QJ7UGQ0C35ghcOm6dljltwgAC5xACAANplMIAAvuSAgACG/PCAHecA4IABMWIAgAAB2oCAAFvFoA==
Date:   Tue, 12 Nov 2019 16:38:48 +0000
Message-ID: <BYAPR12MB2727DF52EE646CA303CDFAEBDC770@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB27275D13BB62F9120EBB9054DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191022074110.GD28049@kuha.fi.intel.com>
 <BYAPR12MB2727707263883A987D12D39FDC680@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191023080603.GA8828@kuha.fi.intel.com>
 <BYAPR12MB27273BEE5E6EC8F290BF8CFFDC6B0@BYAPR12MB2727.namprd12.prod.outlook.com>
 <BYAPR12MB2727DC214FE8D4AA1CC50E83DC740@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191112110030.GA4013@kuha.fi.intel.com>
 <20191112110707.GB4013@kuha.fi.intel.com>
In-Reply-To: <20191112110707.GB4013@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-11-12T16:38:47.2074540Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=fd0ef4ad-9e82-4947-bbe9-3a75ecaed01e;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2f8edca-9d21-42f5-65c4-08d7678ecafb
x-ms-traffictypediagnostic: BYAPR12MB3141:
x-microsoft-antispam-prvs: <BYAPR12MB3141151127792C6D3948A377DC770@BYAPR12MB3141.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(199004)(189003)(13464003)(55016002)(25786009)(4326008)(476003)(76176011)(71190400001)(71200400001)(11346002)(486006)(54906003)(478600001)(256004)(6246003)(53546011)(6506007)(86362001)(76116006)(102836004)(446003)(26005)(966005)(7696005)(66476007)(64756008)(66556008)(6436002)(14454004)(52536014)(66446008)(99286004)(9686003)(6306002)(229853002)(5660300002)(561944003)(33656002)(66066001)(6916009)(305945005)(7736002)(74316002)(8676002)(81156014)(81166006)(186003)(6116002)(3846002)(316002)(66946007)(8936002)(2906002)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3141;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2uxoEHSaxIIFUuoCpLDWwASGFDzglbHZzTi3YyGeuPX7qlTRD7Y8Z1cuBjL9yuApvRWHa63k1p5yYkL8p+5/sP9StG/pbmFChAUaB7mUzHMjHh3LRRpLlAJLVm4POqAV/JsYmVywZf4U3DMHl/7a8dbUD57clAIpAj///3Thgk0GM6ihw1ZqFLQGZlknLpR4a249fUv4hbjdRXajtJAlLdYDCoboiAs76emI4flHLTOTIHeSMp73KPoAHLFdu1hLttw4TiZh/1T6qedvnmEugbdUqjOrdPheQIzhBZLglQLNPZAuPFebql4DKJPLEevUUCZD84qFkVF67DNwasUbeXWRC7fhaH1nsxHJxfiE6I2owZjI+cex1g3Gm+6nBT8sL+gzWc4pzFpKL99H+e93HXopajs+kVaA+GnTuhhZsVR8ZdfMa+JMmaC5qwNw1Yft
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f8edca-9d21-42f5-65c4-08d7678ecafb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 16:38:48.2545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMG5f44Exte7+p5cSET45tqmlc63FY9cr5+32jFxhjZ7E2O8BaE1atPtxw9w+znQGJUwvmfFoGknHWWjTseQ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3141
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1573576733; bh=MYFPJ+ixKvjdDoUmpZX+BRN2I/Qy2M1QBV+0JOuATpc=;
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
        b=POQcnwvF8H5FMsb7X62bS7AqVJxiIAQqBJ8buMYNW46v4AGLl3D7nutlgyrGKlpYG
         dNkUenFWMwbOdTUE3f8IoRt7+e89ziKth6jCI5isQNPksiavsWpnLanrVr516rrayn
         yDFpCHiNtUhgiF0YWoualaH6JvwumHi/DmpFYnvtYqvhGB6Vmjdpa5GW1b+MsiMw16
         T7+LramyqNtgjVGGQQudpIsYB931hHCWD+fcNl9A+a2mUHPJvjXBT35LONq4WzAzf2
         QkMvRLaP4xVq1f1ao6V/oJcK/MuZuAe0y37YjS/PdxyzX2KaD/bAfkDWT229mRGsR0
         lRQ4yEpJ+WSkg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Tuesday, November 12, 2019 3:07 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Guenter Roeck
> <linux@roeck-us.net>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH 00/18] usb: typec: API improvements
>=20
> On Tue, Nov 12, 2019 at 01:00:34PM +0200, Heikki Krogerus wrote:
> > Hi Ajay,
> >
> > On Mon, Nov 11, 2019 at 04:51:05PM +0000, Ajay Gupta wrote:
> > > Hi Heikki,
> > > > > > > > > The first patches in this series (patches 1-8) introduce
> > > > > > > > > a small change to the USB Type-C Connector Class API.
> > > > > > > > > Guenter was kind enough to go over those already.
> > > > > > > > >
> > > > > > > > > Patches 10-15 improve the ucsi driver API by introducing
> > > > > > > > > more traditional read and write routines, and the rest
> > > > > > > > > is more generic optimisations and improvements to the ucs=
i
> drivers.
> > > > > > > > >
> > > > > > > > > Let me know if there is anything you want to be changed.
> > > > > > > > This patch set is not taking care of issues discussed at fo=
llowing
> thread.
> > > > > > > > https://marc.info/?l=3Dlinux-usb&m=3D156995500624107&w=3D2
> > > > > > > > https://marc.info/?l=3Dlinux-usb&m=3D157012261301682&w=3D2
> > > > > > > >
> > > > > > > > We need fixes for above issues so that we can easily
> > > > > > > > manage ppms which has multiple DP altmodes as discussed in
> below link.
> > > > > > > > https://marc.info/?l=3Dlinux-usb&m=3D156778906010780&w=3D2
> > > > > > >
> > > > > > > The goal of this series is not to solve that "issue".
> > > > > > >
> > > > > > > This series is the base work that really has to be done in
> > > > > > > any case before we add any kind of solution for the multi DP =
alt
> mode case.
> > > > > > > Rest assured that we will have support for that soon enough,
> > > > > > > but let's just move one step at a time.
> > > Since this series is gone so what is the plan for updated changes as
> > > discussed at
> > > https://marc.info/?l=3Dlinux-usb&m=3D157079026214073&w=3D2
> > >
> > > This is needed to support ppms which has multiple DP altmodes as
> > > discussed at
> > > https://marc.info/?l=3Dlinux-usb&m=3D156778906010780&w=3D2
> >
> > Give me a few more weeks. I'm sorry for the delay, but I have to
> > finish some other tasks. Can you work on this in the mean time?
>=20
> Actually, if you can prepare the proposal you had earlier, I think we can=
 just go
> ahead with it now.=20
My idea is proposed at=20
https://marc.info/?l=3Dlinux-usb&m=3D156875897316318&w=3D2=20

Are you referring to it? If yes, I can rebase the change and post it.=20

Thanks
> nvpublic
> If I have some "better" idea how to handle the multi-DP alt
> modes, then I can prepare a separate proposal for it after we have your i=
nitial
> solution. I do have an idea for a solution, but I don't want to block thi=
s any
> longer.
>=20
>=20
> thanks,
>=20
> --
> heikki
