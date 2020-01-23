Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96A701470B0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 19:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgAWSY2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 13:24:28 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:24084 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728731AbgAWSY1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jan 2020 13:24:27 -0500
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e29e4d50000>; Fri, 24 Jan 2020 02:24:21 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Thu, 23 Jan 2020 10:24:21 -0800
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Thu, 23 Jan 2020 10:24:21 -0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jan
 2020 18:24:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 23 Jan 2020 18:24:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqMduF69vNQA9ra1+ABmKJLFQNGtt/CEXq0Ymf8lp7i77bNqYz5vCOIs0q5ank0GJ7OobPzCX0Qp2iJ0RabvC0IGrFIPvwFoYv/1qlvYdJV0yam+EY3yD3dvNN7Xxj54VZ8TMAfpbIiD2hXEiCNnQxcMPILtdbIVI02zQFcYUnxRSqQhHjscObUMuuK1hRf35D9j0KrNHtW8opdzVY/acDAFSKOC4incU/gA8RzDiG5sF6zBPWafhGmEVv4PeUUxPUwW7rG1tg0Q1Ud30Hx6obVST1VXRQEOoiOtE2h2AMYZT7q4oKM7WmUOCxqyR/Qym2hZFyZTeDqArqQAhq3vuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxGDu+ae8Sm1OO/M0BfhwGHPtL2SUKUMlBvdiTs/Fuo=;
 b=jmGR5zFC8YuFxAdj1sz0ef2xpaWC1VoXtdVHYwadp5KXpQq76Sw5e0DFODPe9Ae/YPz7HdVEKwUFTVjRGPQuUqPWZvSBY8EWpFNHTGSngRJnH55RdunJ0TyjWUI27KuWFOw9IqtYBTHDv/YAt6J7AhsTm11RngSPicJP3DiB8CR+IV9brSMcECRxyxilRqp/HelUuUcRaTxDMq6dmivioP/Pe3ouu1VLKPh7Hs3fBrQvNcJPCeB82YYvBEgjpJ1t0Jep03pKvKPtbv9nDy2EIt5f8iah4LX2voN4exz0R3v85UnHSoQ/Qys9JH5Iw0I9/Vm/4xvWSk0IhH8zMs1tTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3288.namprd12.prod.outlook.com (20.179.91.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Thu, 23 Jan 2020 18:24:18 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::9c2:6e7d:37ee:5643]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::9c2:6e7d:37ee:5643%7]) with mapi id 15.20.2665.017; Thu, 23 Jan 2020
 18:24:18 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajaykuee@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 1/2] usb: typec: ucsi: register DP only for NVIDIA DP VDO
Thread-Topic: [PATCH 1/2] usb: typec: ucsi: register DP only for NVIDIA DP VDO
Thread-Index: AQHVzJ7L7HDnOqXhMUOLjee8GNhnLKf4BLMAgACWcrA=
Date:   Thu, 23 Jan 2020 18:24:18 +0000
Message-ID: <BYAPR12MB2727A91BB6CBE461390C90D7DC0F0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20200116013247.16507-1-ajayg@nvidia.com>
 <20200123092454.GA2905@kuha.fi.intel.com>
In-Reply-To: <20200123092454.GA2905@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-01-23T18:24:17.4948531Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=0b64392f-460f-447b-8464-f8e565a22563;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8631cb7e-1d54-4182-2c5f-08d7a03175f1
x-ms-traffictypediagnostic: BYAPR12MB3288:
x-microsoft-antispam-prvs: <BYAPR12MB3288709C35A71A15DBF555B2DC0F0@BYAPR12MB3288.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(376002)(39860400002)(366004)(346002)(199004)(189003)(7696005)(186003)(81166006)(26005)(8936002)(81156014)(8676002)(55016002)(6506007)(9686003)(2906002)(4326008)(316002)(110136005)(52536014)(66446008)(86362001)(76116006)(64756008)(33656002)(478600001)(66556008)(71200400001)(5660300002)(66476007)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3288;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E+8TMvtB5WmY1uCPh/Jun6Nd1x3NtFkKoFm4OTuxn7Oe9w+7I3QEbTh/bctLBrxbtB1ZMQ5uzibLmvUTyQz5x/NaGQeoV1U+KJ6j6XjgrEIlJs71cNerC2agPRBSq29n8QVyk82gc3Tuq40zie+pBmJIV66pc5TKNIvlG8329NbfnqZTBL0eHKdLMyqYKia87reaB3FmdEedW9VeWAC/3ZpzQ7YOqceiTztV+FYpOf+NKSoS+Y6IRGnAge+SCGx4BwpOWfv6yxzNz/RQDn2UHc9oTRGaUjdCSxtWcQcc5z3Lsmzq7gS3CMH3MrPZF8nJpeW23t8Cdj/FaMYUO3CCQEUYReis5Fq55Rp8xxx4NTCecCYrG1zwX3jrMbxuV0dBrhc4zPXJjg7Dy+FLYbf89b0cA909LXFJzNDxrtbiEkEy5oxT4Em+AUjkqed9FwzE
x-ms-exchange-antispam-messagedata: lsl2vgaFxtGXpFyyuYqdQMBXMRo6qzncnnNrN8mboN1ICUKwlWr4LE0UYq9h+mhvxdKQW/uF6Fxg1rmFwecwGza+/OYK3Plh0WY454T2eLxAm3D8+HSxuZeCF+tsQXxGdLp5bwImcZlPz3qoWlQ+wA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8631cb7e-1d54-4182-2c5f-08d7a03175f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 18:24:18.8316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sKzeQFhBKKT4toC9P1Dwy1WcUlDCw0RqzyeS2yoUaeI+Sh9cwFqaHZ/qWL8xEqVgpUSZSW+8pHg8ybSEMNtQcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3288
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1579803861; bh=sxGDu+ae8Sm1OO/M0BfhwGHPtL2SUKUMlBvdiTs/Fuo=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=dHrpdDcI0YNWGA7d+8+zW+FoUTIJQ7jNIDsfYjAsdeBelBUF2s01NBxDgCidCKm8N
         5+DhYiKKYsnZBqQZ3jxs8G2HXqTAhAx4wW7IV+v5UCXBgDwuT7J8j+auo+FyiVCL5n
         1wdC8g6OcqqM9dfTNuFtjduAJhjRRyS6+d/PCnR1Arz7bZLGbtgf9r4CNB8IHXawbF
         PJsTdFueveF8reZnGVCKxUUehjwZLP8NhoRl1YS1CxhK9RyBgzRH5VhDaFK4nnTS/F
         XRO+KzK/Gu8eTzRIDN1MbJg3n3OmpCu91UqeCQjN6DC2MQYDgB4H+bVzchkbEuNTl/
         L+d/27QfntQ4w==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki

> On Wed, Jan 15, 2020 at 05:32:46PM -0800, Ajay Gupta wrote:
> > From: Ajay Gupta <ajayg@nvidia.com>
> >
> > NVIDIA VirtualLink (svid 0x955) has two altmode with vdo values of
> > vdo=3D0x1 for VirtualLink DP mode and vdo=3D0x3 for NVIDIA test mode.
> > Register display altmode driver only for vdo=3D0x1
> >
> > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++++--
> > include/linux/usb/typec_dp.h  |  2 ++
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c
> > b/drivers/usb/typec/ucsi/ucsi.c index d5a6aac86327..eca9d598a42f
> > 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -270,9 +270,16 @@ static int ucsi_register_altmode(struct
> > ucsi_connector *con,
> >
> >               switch (desc->svid) {
> >               case USB_TYPEC_DP_SID:
> > -             case USB_TYPEC_NVIDIA_VLINK_SID:
> >                       alt =3D ucsi_register_displayport(con, override, =
i, desc);
> >                       break;
> > +             case USB_TYPEC_NVIDIA_VLINK_SID:
> > +                     if (desc->vdo =3D=3D USB_TYPEC_NVIDIA_VLINK_DBG_V=
DO)
> > +                             alt =3D typec_port_register_altmode(con->=
port,
> > +                                                               desc);
> > +                     else
> > +                             alt =3D ucsi_register_displayport(con, ov=
erride,
> > +                                                             i, desc);
> > +                     break;
> >               default:
> >                       alt =3D typec_port_register_altmode(con->port, de=
sc);
> >                       break;
> > @@ -475,7 +482,8 @@ static void ucsi_unregister_altmodes(struct
> ucsi_connector *con, u8 recipient)
> >       while (adev[i]) {
> >               if (recipient =3D=3D UCSI_RECIPIENT_SOP &&
> >                   (adev[i]->svid =3D=3D USB_TYPEC_DP_SID ||
> > -                     adev[i]->svid =3D=3D USB_TYPEC_NVIDIA_VLINK_SID))=
 {
> > +                     (adev[i]->svid =3D=3D USB_TYPEC_NVIDIA_VLINK_SID =
&&
> > +                     adev[i]->vdo !=3D
> > + USB_TYPEC_NVIDIA_VLINK_DBG_VDO))) {
> >                       pdev =3D typec_altmode_get_partner(adev[i]);
> >                       ucsi_displayport_remove_partner((void *)pdev);
> >               }
> > diff --git a/include/linux/usb/typec_dp.h
> > b/include/linux/usb/typec_dp.h index fc4c7edb2e8a..848321c4498e 100644
> > --- a/include/linux/usb/typec_dp.h
> > +++ b/include/linux/usb/typec_dp.h
> > @@ -10,6 +10,8 @@
> >   * IDs as the SVID.
> >   */
> >  #define USB_TYPEC_NVIDIA_VLINK_SID   0x955   /* NVIDIA VirtualLink */
> > +#define USB_TYPEC_NVIDIA_VLINK_DP_VDO        0x1
> > +#define USB_TYPEC_NVIDIA_VLINK_DBG_VDO       0x3
>=20
> I think those should be defined in ucsi.c for now. We can move them to th=
e
> header if there is another user.
Sure, I will update the change.

Thanks
> nvpublic
> thanks,
>=20
> --
> heikki
