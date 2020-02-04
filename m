Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC80151694
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 08:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgBDHo0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Feb 2020 02:44:26 -0500
Received: from mail-eopbgr40083.outbound.protection.outlook.com ([40.107.4.83]:24736
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726566AbgBDHoZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Feb 2020 02:44:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSOHCjT/+1MtZldPTz2vklTqiy0GZ7V+todKgbiSCbv+dzTAGroNxnb9tgk35E1phlg94N84oUXbHmpRJidZXkwvadGD89G+k2B8GzrFfOLytIaMCAYkbewdm3dz6O28ppuxwhiSmbCr4v36eDomcInOjoZZ7y2xW4KEVm99bs6sMAzTXcBfWc/69LM4mUe4yMfuGey60kJ50j9u2QR3wCo6RczqEg8jgJKG7tRug4eEKhBWjgNKpVtxTGonpxms+XgAVOOGL2CQJCvRCDQqCianMHExmxNPKxj1wtYHsBgo/VFoybmnKeAqVPH/oGCm/QfB9+pCGRFjDnJ0eSiCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPNlS3jlXxKXdHRthYvlaQZp3m1CPUvfD1VR3QO9+ZM=;
 b=bToDPGPAWgiMtrBmb+ROb8vcEPPMZCIy30kBBGbxdG4gcrUf/J9vk+VQu8d/es31Wzj19aHHOwbonTaU2Qo3LelA9/mIoQ7YePgWfUcSeT4OM0ILrYDnTEG2t8d+tI9cTSCLRLxlIqkjX1m+5phoR/0JgvGAUTTanDUtgVk76qn5hHqg5lZOjnhMZYMor0TVCcMl/OKV9lfDICDSNd1i2Xye/4UNebMl9FtVeoJontvuyeSVbP/BMcELhj7TZj6znEtbLYmgSXttGj8EDuuot6pz4Onb5C6ZHJV5B1m8phFPMKmO+2CsBgo3oS+PBpXlfC3qEg9qjaqM50lYCqVe3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPNlS3jlXxKXdHRthYvlaQZp3m1CPUvfD1VR3QO9+ZM=;
 b=EKfszNbdGbyRYDRJbBfGPo/Em2CHu17qTmk+uwBGfZrrYzAEVtl+fMpOzGqzcC238DuK3ycADeknIWuONrZ9wne0iDmTzdPysz42hX5a/yDQsk0bhRmfrfrJJDXdzK5BHrxrY1k1RtY34TfoObR2JXmyrMuARAmTb8qpX1Ck6XA=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4591.eurprd04.prod.outlook.com (20.177.55.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Tue, 4 Feb 2020 07:44:20 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2686.031; Tue, 4 Feb 2020
 07:44:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Peter Geis <pgwipeout@gmail.com>
CC:     Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Thread-Topic: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Thread-Index: AQHV1LqaVEQK+QBFlEajUWQRaUhLOagERL0AgAD/9wCAAJ9JAIAD35yAgADwwoA=
Date:   Tue, 4 Feb 2020 07:44:20 +0000
Message-ID: <20200204074419.GA6681@b29397-desktop>
References: <20200127023548.27107-1-pgwipeout@gmail.com>
 <20200131052716.GA30672@b29397-desktop>
 <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com>
 <20200201061330.GA9178@b29397-desktop>
 <CAMdYzYrbvsTunwxJLcC_-ZhczsQfyDLOjTnZ+eorb325qO-QhA@mail.gmail.com>
In-Reply-To: <CAMdYzYrbvsTunwxJLcC_-ZhczsQfyDLOjTnZ+eorb325qO-QhA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d7634fae-247a-4c43-c017-08d7a9460b93
x-ms-traffictypediagnostic: VI1PR04MB4591:
x-microsoft-antispam-prvs: <VI1PR04MB4591886A9D4DE63ADB99C1578B030@VI1PR04MB4591.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03030B9493
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(39860400002)(376002)(396003)(136003)(366004)(346002)(189003)(199004)(5660300002)(33656002)(4326008)(71200400001)(478600001)(91956017)(76116006)(66946007)(64756008)(66476007)(66556008)(186003)(316002)(6506007)(26005)(53546011)(44832011)(33716001)(81166006)(81156014)(8676002)(6916009)(8936002)(86362001)(54906003)(6486002)(6512007)(2906002)(1076003)(9686003)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4591;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 65ztHLdky1X7DCnvBa/w3hiJIka/kenT49UtZomJ44yXEfJ8a3JII4hJdDktpwJGs1b3Kp5wa5CKip9eXIwxNT8e/RQ8qmiQGAWFr/eFkgPH7/gALeqPLuLTpqUZWWhXEVomkss1Kpb7hh52NpgRS6/7HGxhZKMC4un4rUPljmuAEpWDf3Ma5j4AeHfBiOU1AmdLuLklF+igetiEM+47EYAW3rPjS06Hj/mfYNxTcEz4HzrAVkhVGYn3kMNoaCH6uBMrAVIbDd1cySTSYkp3DMnQaIjpA8EsnnKe0wxS30iC8uZl3GoR1Wmj/B+0zp8pqWbfLg8Kyc2+KGR4vdWyKqJD3oya90RnBigFDr5i+6MIYUKXiZPFGbnADAPIBZnWG+yaifnAe8WZd+wCQbabdRwy/VkaGswD+WOcJECdH6CkkdtV1iO04aYij2Pvdk1j
x-ms-exchange-antispam-messagedata: rV1ReSlAEb+QHrd3uZb4ct6jGc08fN8gkvSNdoL/AiV5uTiQY70AfyDJ1vCCEPCwF8tNjvSv93IRffa8Z4nf38+ZW6lM0j3VvfPMtY+9SzKoSYGYJwIHNNItLs1F97p/QiQ7aYy2xX1C8iQQRVcx0w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C011C59726DBE746A361D68A58C9D361@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7634fae-247a-4c43-c017-08d7a9460b93
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2020 07:44:20.1692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o54FSsfqKBL57lExPCjCLJx6YVoIN1nMg71n0/2RRSYg405I9f3kT68opTOHfvQIHK2JzhCZzVWwW1rDgG5VWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4591
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-02-03 12:22:37, Peter Geis wrote:
> > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipide=
a/ci_hdrc_tegra.c
> > index 0c9911d44ee5..5d85363ad0f4 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > @@ -95,6 +95,7 @@ static int tegra_udc_probe(struct platform_device *pd=
ev)
> >         udc->data.flags =3D soc->flags;
> >         udc->data.usb_phy =3D udc->phy;
> >         udc->data.capoffset =3D DEF_CAPOFFSET;
> > +       udc->data.dr_mode =3D USB_DR_MODE_PERIPHERAL;
> >
> >         udc->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> >                                       pdev->num_resources, &udc->data);
>=20
> I do not wish to set the dr_mode manually, since this could break
> things on devices I do not own.
> Future work is needed to address the tegra_udc capabilities, as well
> as fully correct the hang issue.
> This patch merely aims to fix a corner case.
>=20
> >
> > > They also seem to be missing the extcon phandle, which means automati=
c
> > > mode switching is not possible?
> > >
> > > >
> > > > But one thing I could not understand, if the driver doesn't support
> > > > dual-role, how could you do manual role switch?
> > >
> > > Manual role switching is conducted via debugfs,
> > > /sys/kernel/debug/usb/ci_hdrc.0/role
> > >
> > > >
> > > > >
> > > > > Detect this state by checking for the extcon phandle when dual ro=
le mode
> > > > > is set to otg.
> > > > > If it doesn't exist request the driver to only enable manual role
> > > > > switching.
> > > > >
> > > > > Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/12=
4")
> > > > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > > > ---
> > > > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > > >
> > > > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/c=
hipidea/ci_hdrc_tegra.c
> > > > > index 7455df0ede49..2f6f6ce3e8f5 100644
> > > > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > > @@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_dev=
ice *pdev)
> > > > >       udc->data.usb_phy =3D udc->phy;
> > > > >       udc->data.capoffset =3D DEF_CAPOFFSET;
> > > > >
> > > > > +     /* check the dual mode and warn about bad configurations */
> > > > > +     if (usb_get_dr_mode(&pdev->dev) =3D=3D USB_DR_MODE_OTG &&
> > > > > +        !of_property_read_bool(pdev->dev.of_node, "extcon")) {
> > > > > +             dev_warn(&pdev->dev, "no extcon registered, otg una=
vailable");
> > > > > +             udc->data.flags |=3D CI_HDRC_DUAL_ROLE_NOT_OTG;
> > > > > +     }
> > > > > +
> > > >
> > > > The CI_HDRC_DUAL_ROLE_NOT_OTG flag may not be suitable here, please=
 see
> > > > comments for it.
> > >
> > > I've dug around the various mailing lists and I fail to find any
> > > reference to why this is not a valid use case.
> > > The commit message specifically references dual role capable devices
> > > without proper otg implementations, such as missing the otgsc
> > > register.
> > >
> > > My current use case is the Ouya, which deadlocks the kernel durning
> > > probe if the otg capable usb controller is set to dr_mode=3Dotg.
> > > It works with this flag set.
> > > Unfortunately there isn't a property for dr_mode set to non_otg_dr_mo=
de.
> > >
> > > I found a post stating that the driver blindly touches registers in
> > > otg mode, which leads to the deadlock if those registers are read onl=
y
> > > or non-existent,
> > > Eventually someone should look into why this deadlock occurs and make
> > > a proper fix that applies to all users.
> > > Unfortunately I do not have the knowledge yet to accomplish this task=
.
> > >
> > > With some simple modifications to the tegra_udc driver it is possible
> > > to get host mode working, vice using the tegra-ehci driver.
> > > At this point role switch works
> > >
> > > I also managed to move all of the functionality of the tegra-ehci
> > > driver into the tegra-udc driver.
> > > Unfortunately it doesn't behave correctly under some cases, so I neve=
r
> > > submitted it.
> > >
> > > Do you have a recommendation for handling this?
> >
> > If you would like adding host function in chipidea driver for tegra, an=
d
> > want dual-role switch to work, first, you may need to know which
> > dual-role switch you need:
> > - Through controller's id and vbus pins
> > - Through extcon, eg,GPIO.
> > - Through usb-role-switch class, eg, Type-C controller
> > - Through sysfs, /sys/bus/platform/devices/ci_hdrc.0/role
> >
> > The first three are automatically switch, the last one is manually.
> > Current chipidea core should support all above switches, maybe there ar=
e
> > some limitations for them, the fixes are welcome.
>=20
> AFAIK reading through the comments, the chipidea driver intended to
> exclusively use extcon for automatic role switching, please correct me
> if I'm wrong here.

No, extcon is supported.

> USB-C support is not a likely scenario, as currently the chipidea
> driver only supports usb 2.0.

USB-C is a connector, not related to USB HW revision. For USB 2.0
USB-C solution, there is no SS TX/RX connected on connector.

>=20
> >
> > Second, you may check if touch otgsc will hang or deadlock the system.
> > If you can't touch otgsc when portsc.phcd =3D 0, you may need the flag
> > CI_HDRC_DUAL_ROLE_NOT_OTG, afaik, few SoCs can't touch otgsc if it
> > supports dual-role.
>=20
> I added some traces to the driver, and it doesn't actually appear to
> be a register read/write that is breaking things. (Not directly
> anyways).
> The hang occurs after it enumerates the usb gadgets and hub.
> Still trying to track down exactly where the hang occurs.
>=20

Try to see if it is related to runtime power management.

--=20

Thanks,
Peter Chen=
