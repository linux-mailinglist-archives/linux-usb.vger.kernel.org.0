Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C03D2FCA
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 19:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfJJRva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 13:51:30 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:48055 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbfJJRva (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Oct 2019 13:51:30 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d9f6fa00000>; Fri, 11 Oct 2019 01:51:28 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Thu, 10 Oct 2019 10:51:26 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Thu, 10 Oct 2019 10:51:26 -0700
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Oct
 2019 17:51:25 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (104.47.34.58) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 10 Oct 2019 17:51:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/r0a5eerJPQWZiiHHC7+h7vDyzLWzxFl16mALvhdIHNxom4Onaetc4zURVo8kUSNhllN8P40S/scCJS2mAG85KjKjGrCtuEhTTmnphb1fzgtQYG9pjuuVnENfgA3A77KcipW+/kqo5VTbe8fJUeqr5YWLS6pGoD1zk+lFHZZaTg++ppTBvaL4yOgy4VoDQsNi+LzDHdDtjvd6Yuy86ZAIr5ZL9ORDtNnpLN47lgyNuKknSWa0acwfc0Nsk/MCLW30vaq1qdEnEkR02E6scpX6kHZzHCRRERRFVR8TPHMwTH7jDCeiGmcFvRvVSR0Eu2hfYkpNfnS5cM8cmBwP2u+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SbYwWsiBInUlbfn1VQzoCqHH6BKVeY+7YozguV9fzQ=;
 b=k8YY8xFUgP9jT9KvTsAz6O5uz1580gGktLYjFeLyAJDhXb49W7bA7fK6X0CRtdh8vSEibHjBQF49BK5WxTlA3JqTGBEg4wgtay/1KZ36FPCMvjDmYkHgJ/P3T/FHgqQP7vj0CzjDi+TOfea6hu5Oh/kszUuwbpl1kKYfNyIyma5BnLqVJl9UbATFuWDZOe3INwd7FsiSSglSo6BBiZDpdaEhUVdUjWAkWy8+Z/ktHBADwuMIw35Doe3Ll/qepD+dc+XInTCvB6N8E2LG7JpOOqU5qWBxcvbAe1/lAIK6xt5X0mi0Y1/PgchKKYE5vE7hgTOG1P98kvQxSD2j71riNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3367.namprd12.prod.outlook.com (20.178.53.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 17:51:23 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2327.026; Thu, 10 Oct 2019
 17:51:23 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Topic: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Index: AQHVdFI7VovQttbK0kyVtx5zpzGGF6dGIWlAgALii4CAABgRgIALIZTg
Date:   Thu, 10 Oct 2019 17:51:23 +0000
Message-ID: <BYAPR12MB272782B958FE929E9DE2EBAADC940@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB2727E1FE3CDFC5D6DD87CF73DC9D0@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191003142443.GC1048@kuha.fi.intel.com>
 <BYAPR12MB2727465972DCB1E7ECBE41CCDC9F0@BYAPR12MB2727.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB2727465972DCB1E7ECBE41CCDC9F0@BYAPR12MB2727.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-03T16:33:20.8369395Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=2558946b-4215-4d3a-b4b9-64ef46fb01e6;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19be90c7-30ca-4af3-a09a-08d74daa7752
x-ms-traffictypediagnostic: BYAPR12MB3367:
x-microsoft-antispam-prvs: <BYAPR12MB3367FCABB0F0840B63495F0DDC940@BYAPR12MB3367.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(189003)(199004)(5660300002)(55016002)(6246003)(25786009)(305945005)(66556008)(66476007)(66946007)(64756008)(7736002)(256004)(76116006)(66446008)(52536014)(9686003)(7696005)(11346002)(76176011)(486006)(476003)(316002)(14454004)(446003)(4326008)(71200400001)(71190400001)(26005)(33656002)(14444005)(6116002)(6916009)(86362001)(2906002)(6506007)(8676002)(81166006)(81156014)(66066001)(74316002)(3846002)(229853002)(478600001)(102836004)(99286004)(186003)(8936002)(6436002)(21314003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3367;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: baSh/uQlHynSrvo5HAPSJHM9TF0Pw6T6DoS4vxbfRKulIwk6+yFEp4LtFjj5ctrDs7zA3dZA09rgMf39pkhFFnac6VjTI5RiiT1ngl/eIDYWz339GzBjvfx3SYjxM93tfsBERxHrft8DhlkXvwQVDA7dMvYXHSBmAKw5iBTyHQfGrhJ9bWwfr+zuGIEMCwK8DOTAIRnonAj7yU/Ncam2v+cNPHBJlH/IxxWi+srIO+6kpc3mN/sZy51NflpJr0vnrcJa0RgkqofCaQlbstSU+LVmPJMrCUct15XPanH74oAgd9XODbmAim9/cnonym3LiTn9kcwGcZW0TJjQk07Lsi4KQyjP4M0XtTKgS+Lot4TfX0JgufPn/vhGuDU3MfLt5s4I7/q2jKIxSSx3f97k26gbLe/4PEbyltqc4To/W8M=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 19be90c7-30ca-4af3-a09a-08d74daa7752
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 17:51:23.5908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pMJj05Jh3p//Xr1C3HPfSdQLiEuNCnAsm2oK84xKgF8rKCV7/2IAez9UOsCQBEFjklU7o2B1vFLaJKuxCPBE0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3367
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1570729888; bh=4SbYwWsiBInUlbfn1VQzoCqHH6BKVeY+7YozguV9fzQ=;
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
        b=TAupU4mdT3TXAQ29PFY3okQ1i96Vd/oYFsgYd4qAvL+Q0wCjyBTSCGGOye+bYvt30
         WBUY2/P0AVbtbqNjUprdmT8dXPkQR7v1Hyx9rCyKQ6IDkLk7pGO7v4jjXOgcv3fxYS
         R/+a/ia18BOYyrfEmhOwEcd6nisy5CaFMc6CYHmEOtJ6teM8tLKBcx6XtxhjBaY6H0
         6zFj32FEghmlgT2SXcP9TqrfK5/F1z4Fnr3P03leTmffhONxtb7UTU8ea8G+OjC+ez
         pM2yx3RgWzmy1DPa8bpkqt+yIVy1QIwTW8u8dpBedOGNQSOvAremTV33e9sHbC1AoL
         G8WbOn7GqKbeA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> > > > Hi Ajay,
> > > >
> > > > Here's the pretty much complete rewrite of the I/O handling that I
> > > > was talking about. The first seven patches are not actually
> > > > related to this stuff, but I'm including them here because the
> > > > rest of the series is made on top of them. I'm including also that
> > > > fix patch I send you earlier.
> > > >
> > > > After this it should be easier to handle quirks. My idea how to
> > > > handle the multi-instance connector alt modes is that we "emulate"
> > > > the PPM in ucsi_ccg.c in order to handle them, so ucsi.c is not
> > > > touched at
> > all.
> > > >
> > > > We can now get the connector alternate modes that the actual
> > > > controller supplies during probe - before registering the ucsi
> > > > interface
> > > How can ucsi_ccg.c get the connector alternate modes before
> > > registering ucsi interface? PPM reset, notification enable, etc.
> > > is done during ucsi registration. UCSI spec says:
> > > " The only commands the PPM is required to process in the "PPM Idle
> > > (Notifications Disabled)" state are SET_NOTIFICATION_ENABLE and
> > > PPM_RESE"
> > >
> > > Also, it doesn't look correct if ucsi_ccg.c has to replicate most of
> > > the stuff done in ucsi_init() of ucsi.c.
> >
> > How about if we split ucsi_init() into a function that first simply
> > constructs the struct ucsi and struct ucsi_connector instances without
> > registering anything, and into separate functions that then register
> > the ports, altmodes and what have you. I don't think that should be a
> > huge problem. It will make ucsi.c even more like a library, which is pr=
obable
> a good thing.
> Do you mean the solution to follow steps (a->b->c->d1) or (a->b->c->d2) ?
> a) ucsi_ccg.c calls first part of split ucsi_init()
> b) ucsi_ccg.c uses ucsi_send_command() to collect actual alternate modes.
> c) ucsi_ccg.c looks into actual alternate modes and squashes if duplicate
> altmode found.
> d1) ucsi_ccg.c calls new method to register connector alternate modes.
> This method issues GET_ALTERNATE_MODES command again and ucsi_ccg.c is
> expected to send squashed alternate mode.  This will require changes in
> .read(), .sync_write() and
> .async_write() to make it appear as if the squashed data coming from the =
ppm.
> OR
> d2) ucsi_ccg.c calls new method to register squashed connector alternate
> modes.
> This method doesn't issue GET_ALTERNATE_MODES commands to PPM but
> simply registers the alternate mode values passed to this function.
>=20
> If you mean the (a->b->c->d2) solution then it looks fine to me and would=
 wait
> for patches from you. This solution would mean that GET_ALTERNATE_MODES
> for connector is done only by each ucsi_xxx.c and not by ucsi.c

I am waiting for your comments on this.

Thanks
> nvpublic
> > I can prepare patches for that too if you like?
> > After that you should be able to get the struct ucsi instance that
> > represents the "real" PPM without registering anything by calling a
> > single function, most likely ucsi_init(). And after getting that you
> > can construct the connector alternate modes that we actually register.
> > Finally you register the final interface which does not use
> > ucsi_ccg_ops, but instead something like ucsi_nvidia_ops.
> I didn't understand this part. ucsi_ccg_ops has .read(), .sync_write() an=
d
>  .async_write() interface and they remain same for all ucsi_ccg controlle=
rs.
>=20
> Thanks
> > How would this sound to you?
> >
> > Br,
> >
> > --
> > heikki
