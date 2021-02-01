Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5175130A95D
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 15:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhBAOJI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 09:09:08 -0500
Received: from mail-bn8nam11on2057.outbound.protection.outlook.com ([40.107.236.57]:45152
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231360AbhBAOJE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 09:09:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjxV0OlWbNaTp+rCzYjrbI8waoDM33J62TnGbQwyqiKwNVPwM9EiINw/6xjwnbnQ2lUbP0S0Bae2MhOet8x8BCOEZh1TBaV84HB1g+kbKqU5ROvBAh/tQmsUg6yZ9ZPRkU+FC7Z2PI3UYhtKYjzpocSkYLCH1+B0Pu8FqZIa+ZFS9vVNEQUSi5XVJMFzFVBXRypknhGr7Z0d+GQGxZCwmya8788j+DBfM57anuTFs7O6YHyUItIwfbix9Cy3dNPf4bEsC8uZvwWJF77N36SHkY8XNwfGvwHZ9zIeoQAOsA8iwqLN+QoomjpiYETtXk79WTogVdOdzNWISj8aQaMY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDqU9UvFUGIu632CAxmatLvrTy0cXPKnlSxmPgG8ymU=;
 b=hocJHKCYgWCUlMhMHBE9yUXtuM8+nf+P3K+YbqkDILamcS0pyh1D6zvUeibed+ZPjdSz8bIKbUL0CUc1+Y3vPA+5ekZxlCeTnpOUrlKMFJepVOZV7ASZcQBTvNKQ3ZwWsURijwCjivpz9uHy/vmvo+3giK1ifsSlQL8W9Sm+I1jV1IRXC45VunB6kzW2wAd23NmhEDoBGgZut+mWw9jdco+3a9DT0+f+R4kXzZkZMFJJYel1TGJzpAuGnKaGLSforJ0YUFbPuC6u+SdXJEL468PSYlevZQ6cye7bh+4eKIufSl3zZGrCK2rsLmWk7PG85lVBty4nyXq40qfsJkZfYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDqU9UvFUGIu632CAxmatLvrTy0cXPKnlSxmPgG8ymU=;
 b=lReE7GfBZHHBPUEm7rl5tpHkmr4UvjoazL9g91sg2Dt5sQ0wGj5+IgyWGUBSu5ifo/awSSUKiplvCDUTABSC6d56PDLHc2kRKQl53gPJ8s4UtW1pZC4YYKLG/A7g4BjkjERPFdZfFpojvZi4FEOWj+cVxUJrSmxBsduVkJFzM9I=
Received: from BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20)
 by BYAPR12MB3605.namprd12.prod.outlook.com (2603:10b6:a03:ae::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Mon, 1 Feb
 2021 14:08:09 +0000
Received: from BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16]) by BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16%4]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 14:08:09 +0000
From:   "Liang, Prike" <Prike.Liang@amd.com>
To:     Greg KH <greg@kroah.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: RE: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
Thread-Topic: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
Thread-Index: AQHW7gVV3ApciWvP60+Oe5Ez24fdsao7ZFWAgAADIgCAB/w5gA==
Date:   Mon, 1 Feb 2021 14:08:08 +0000
Message-ID: <BYAPR12MB3238626A32C6E62DA008B72CFBB69@BYAPR12MB3238.namprd12.prod.outlook.com>
References: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
 <YBFPdf6Mc0ZgPsuy@kroah.com> <YBFSFhgk+O40GYhO@kroah.com>
In-Reply-To: <YBFSFhgk+O40GYhO@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=72a23dc6-c1b2-4d1b-bdca-0b9517a3d0c7;MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only -
 Unrestricted;MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-02-01T13:40:55Z;MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [139.227.235.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 84fe5733-49f6-4602-c6f1-08d8c6bacdc3
x-ms-traffictypediagnostic: BYAPR12MB3605:
x-microsoft-antispam-prvs: <BYAPR12MB3605693E18D97F9508F32BA1FBB69@BYAPR12MB3605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3WV7S39Z3RiyPqeduMhDa7KsYxf263qS80JEzMKvrF0msWe7RZ/SweliICVjP8z3dWAOHNuMqy18yC2CCDQ76m8loQIPvAtaM+zhJFAu0vf59GysEVQ+YyBKVGL0c2S2246hrcFDz0uARa1V8q8V2u0B2WI4y9VHZeMM1/roCV0ABOpB2HVQIw230NadJryVdUYaeGc5AjQsfYiIp2ylwAiqZ90aDP/e4PLN74g0Oa2ptsmGiHch9WuJq1kuEkAMPxwgNWjJ+yk7fJNRjrdHey3LHMELrF1Jy/4rhZRjGKAoiNHdBayZRiVIQ10Fv0whFhfSDS3UDBJHfikGNiilB4KRhGkt4Mj5cMVcxycvySX3cS+tQq3T1iL8TMkVyD4YtGb0ItEHbgYsGELXbTgcUOrtw3P3w3ieiysVGBiGuOOll/sqDjaoyZzRHbVuQ1pDrGHfkrWJiT9M72lN+XdsQ8o7dFD3f7d7bDpHbLovZWvt9x3SlBWNMSWcN4i+9G+3FxI+KwExc5JUuen7CfFHm7shEM46Pq6BN2AQI5STM0POp9ZZ/u0O4S93Ody4xHNF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3238.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(76116006)(55016002)(186003)(26005)(52536014)(64756008)(478600001)(66476007)(86362001)(8676002)(5660300002)(66446008)(66946007)(66556008)(316002)(54906003)(6506007)(71200400001)(8936002)(2906002)(9686003)(33656002)(4326008)(7696005)(6916009)(83380400001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?AckRXYsFidlu51zVzXGkRKc94p1+J+x4Pk5X9O7M44S7zXbgj5fkSTWJ8qPI?=
 =?us-ascii?Q?yeu9wpdSr/vJZbh3xwHjsKvIeXpO4/Bk9XbO7E7fk3Uki5tsnwAXGMZdSSFq?=
 =?us-ascii?Q?S9mvhkspqcajMo1aKFufbrqunCzm01We2LDXyczq2b5m1PSfvpoIh2LtZjSp?=
 =?us-ascii?Q?tvWMbk618YvtQEnVN/aew3fjyWzFvkPjPHre9/IeOH0MtTKeGfGrME+LBnZc?=
 =?us-ascii?Q?gnzYa18cMd+wDDgi/sqmQCzVRCl8fkzb4BsJr37gRj3N0UaxWrwAEdPmk4i8?=
 =?us-ascii?Q?XIpNm9zcGpVicD0J0A2pkMfgA7FzI3ibSKbAWF/VjzgKT2D9GRvPAe3j7O0M?=
 =?us-ascii?Q?yRP/pQAUtictqY6qFnxUqbO1Cesf6u1EeNJ/bf8m6gJaI6NYLRTnIcXzplQF?=
 =?us-ascii?Q?xP/8mYFl714YncOam0QBxSCDA7yKUrJuDvRqX4CuXsfrGO74lLoOu6UX6KY9?=
 =?us-ascii?Q?kGb+PlpTpAZ9tkjBMXcFZktqRM3CGl4aI4XnQNFHMdwWGjrVplj6aIcWojNV?=
 =?us-ascii?Q?doSG2TJQqK+Vzy3wioxgOY0s9AErawtzjFUSnQTxPGCvHo+hPKAwNZugo0ZJ?=
 =?us-ascii?Q?bjuEsWhGjod01v/9ijiCWoWqUanw9vpDQj++e3in9dDSgZn6nIA6npfERhOV?=
 =?us-ascii?Q?q3m5MrjbUbYwCbzKESyUI6tKRJkdtM28fzkgZOqOHIk4qsA8J7UU1Gm6tqSC?=
 =?us-ascii?Q?DoxFx46OiHgj6mtgqdfw8XVRw4FQa80Ya7oCx2qYOQ1Wr7cU6Le06IFXsPyU?=
 =?us-ascii?Q?WFatgyGbhUmRUSOoD9/rwKP4UVneTjLTTyj5NJG2Dl3rR1O9n6IlCUUHhvIg?=
 =?us-ascii?Q?Ey1THdmNHKZcnvuMQXAZonRmyr+HwHhic4+AlKnGuTVcD6dgfBF0wQN9Mb6A?=
 =?us-ascii?Q?MTr0jyEvFpFcJJyu+wS0HYH4lGVxGeNLyxaCP+OW2Ylo/ZesC4DJDehDMEm3?=
 =?us-ascii?Q?g4BP4WixasaYG4TjTTauDJAleQNDEdh5hdVc8mm+5l2MKsdo1+BoMXI1uMcd?=
 =?us-ascii?Q?R7QSMwYeR3lkmKFQ447lv1+1kQR9PSe7bfPLQu/y5r4x3o+afMAeirkUDq2u?=
 =?us-ascii?Q?B1Ke2MGB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3238.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fe5733-49f6-4602-c6f1-08d8c6bacdc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2021 14:08:09.0142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDGazIRq7nOq7bI7zS+SG1B/Vedx60Qa2P1bXHEKiSxrWnFC3L6S7amU6Ks7/8rF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3605
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[AMD Official Use Only - Internal Distribution Only]

>
> On Wed, Jan 27, 2021 at 12:33:09PM +0100, Greg KH wrote:
> > On Tue, Jan 19, 2021 at 09:48:44AM +0800, Prike Liang wrote:
> > > During xhci suspend some AMD USB host will lose port status change
> > > events and need to have the registers polled during D3, so now just a=
void
> D3cold.
> > >
> > > Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> > > ---
> > >  drivers/usb/host/xhci-pci.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/usb/host/xhci-pci.c
> > > b/drivers/usb/host/xhci-pci.c index 3feaafe..bff817a 100644
> > > --- a/drivers/usb/host/xhci-pci.c
> > > +++ b/drivers/usb/host/xhci-pci.c
> > > @@ -170,6 +170,11 @@ static void xhci_pci_quirks(struct device *dev,
> struct xhci_hcd *xhci)
> > >  (pdev->device =3D=3D PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
> > >  xhci->quirks |=3D XHCI_U2_DISABLE_WAKE;
> > >
> > > +if (pdev->vendor =3D=3D PCI_VENDOR_ID_AMD &&
> > > +pdev->device =3D=3D 0x1639) {
> > > +xhci->quirks |=3D XHCI_COMP_MODE_QUIRK;
> > > +}
> >
> > Why not add this check to the
> > xhci_compliance_mode_recovery_timer_quirk_check() function instead,
> > where all other systems that need this quirk are tested for?
>
> Ah, you don't have a pci device at that point in time.  But, why aren't y=
ou
> making the same calls that the caller of that function does when setting =
this
> quirk here?  Isn't that also required?
>
[Prike]  Thanks comment. This XHCI host port status lost issue was seen on =
the s2idle wake up period and poll the CNR bit failed in xhci_resume() that=
 eventually result in the XHCI device resume failed. However, this issue ma=
y not totally caused by the entry of XHCI compliance mode and seems only pa=
rtially enable the COMP flag with disable XHCI D3cold can work around this =
failed case. Regards to this issue maybe we needn't the COMP quirk and only=
 need disable the D3cold for some specific XHCI device during processing xh=
ci_pci_suspend().

> thanks,
>
> greg k-h
