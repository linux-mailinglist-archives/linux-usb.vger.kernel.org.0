Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43EDD14F6D5
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2020 07:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgBAGNl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Feb 2020 01:13:41 -0500
Received: from mail-eopbgr80049.outbound.protection.outlook.com ([40.107.8.49]:56802
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725819AbgBAGNl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 1 Feb 2020 01:13:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw44wNje2LXZQ/jt+HsZ7SptygL/tkMCxAVBIk/CWz91Rf638i4vk+hF+xR5ZwJ5yG05RwgZxMIrvqBFBfFM0UdwMITaqO8sioia9mPf8LAF24HfIzUzRDy/QwyYEkcRy2Z3DOupiuydLlC1pDVXk5JHQ5eikPHIqzqFmjo5FgAqMKVNhh8FT2XTyTSDTDUQ2VW8EYQwv9w4wcwhVA1+2sOqOgDaLpwtMcDuLQCtOUS0P0nSULmeoZ9DnX0ZCtlGEBRYbeFM2VosCuP5DdXuLLC1c5T8u1X6v3377uz6quO7J4FyMNxdmDkVJ+qQrvUi9eR+GBWwM6AF64lOI7zFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrwnO2ja7AMB7xaAvNjGS73SJBTc5iKZBnfXSEOuTVE=;
 b=RHU1dZp0sfWMOKDbPKEYd1GBKcEOkXqllNhWkDoiVIgtPp6k0z3APb/sQVB+K7P3aCYde0IjD9zWjcfkCmLf4AQ2Xa9dPGtNfnjx61EOrYSGBLlVvorxB7h8lHxktIHKVsYen2A6EVID6M8am8PgQ6CKlWom2vKWAPyb0LK9Y5gMOSbOxN7iGNmU0h81udGtREkFTT9Ihdx3cNXX3B9AueQe7s0as3gj2txqmA7gNS9AwzERRAA+iN/4dcNR612mrgQk/ISNdVnzjuKkDFQsj9OhBH/VCx7o6vY55aikPqZTSoL8CZMPN4hynWxaMKSI3d4JkUXkhcHcd8jC/sTgYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrwnO2ja7AMB7xaAvNjGS73SJBTc5iKZBnfXSEOuTVE=;
 b=Wi2HmvQ2JVAx6eysSZppjwQxJ34zEe6p/XniMfycVoua+dQzHVyKg7/Ox1Gi3jig+ee1SWyEvQSs+uZmF1m+BXJMGQFj0DcMHN2ekbV28X3+qqD4ePaD9EibMROCdfgDgkBIYxaJ5MKc/P2jrrsjcqrTQd9k3PX8IC8qeK2Yk/o=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4558.eurprd04.prod.outlook.com (20.177.55.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Sat, 1 Feb 2020 06:13:31 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2686.031; Sat, 1 Feb 2020
 06:13:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Peter Geis <pgwipeout@gmail.com>
CC:     Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Thread-Topic: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Thread-Index: AQHV1LqaVEQK+QBFlEajUWQRaUhLOagERL0AgAD/9wCAAJ9JAA==
Date:   Sat, 1 Feb 2020 06:13:31 +0000
Message-ID: <20200201061330.GA9178@b29397-desktop>
References: <20200127023548.27107-1-pgwipeout@gmail.com>
 <20200131052716.GA30672@b29397-desktop>
 <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com>
In-Reply-To: <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 43b0d75e-6a7a-4ffe-b65f-08d7a6dddc79
x-ms-traffictypediagnostic: VI1PR04MB4558:
x-microsoft-antispam-prvs: <VI1PR04MB4558A02E7A2CA7828A7205268B060@VI1PR04MB4558.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03008837BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(199004)(189003)(2906002)(33716001)(6916009)(6486002)(1076003)(9686003)(66946007)(186003)(6506007)(53546011)(76116006)(66446008)(6512007)(66556008)(66476007)(64756008)(91956017)(81156014)(81166006)(26005)(8676002)(8936002)(71200400001)(54906003)(4326008)(5660300002)(44832011)(316002)(33656002)(86362001)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4558;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hgW+Jx8Bp9mNgTamcUssrkq01hlcg3L+by566ptuKRvh9AjtYRgxQB8a0PMWBCDIJCJx1fgiXCPALiBHa5qMSg3FbhM2XRlANdViPSOSJm7fMu2wUWE58KvAo8YFpfnl0wlKwEFTXgdI6TljBxRkCUZrJ7+/1p+AAvNsefSko3Z+KpFtRN4Jer+TylNCaeF9ovk31r3eSLrgrMrvwk/UPXKky40now4x40Rc/1nKZoGbDUbuZgiz+zHSagNdZ3quWi72a97svpJmW/74vVN1aowwUWFc/faNLCPpL/06e3iOJ9v2MscuvcQczJevS+oL4j+Mu1TslaAx0kifUnAMbw/BRpCXuDACZLzJpPdQiU4EapYLwckzI4vRJubv3jxdmc9tczDYkj5kO29MH6QSPj2/+1ERxVEXBVEkiLnFcpT1zrGF6HiQ30TbgpG62PIt
x-ms-exchange-antispam-messagedata: qsxwSQCypemASpyFYph2d67tqDm613YUAEjsYp2nGVVegf8tFEAvqXNwp4dAN/d7U3wUwqY3VnWFF7mMoRo3yBKjYSQwV/5tamswuzhiuYurXHp7UBHtcF3swmyVl0OA57YeeGbLZDy4uMi5iCaefA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4CEEBDAF8A417049A2B11C9554834F70@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b0d75e-6a7a-4ffe-b65f-08d7a6dddc79
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2020 06:13:31.1812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J6jPwKXbxaR6zZhXbKYqaQSsmgpDS5B3ZUOaZm3RC5VkbyFZQAY7w3PeSgKKT5namNamnpRTP+k3ytKUVqCiRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4558
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-01-31 15:43:24, Peter Geis wrote:
> On Fri, Jan 31, 2020 at 12:27 AM Peter Chen <peter.chen@nxp.com> wrote:
> >
> > On 20-01-26 21:35:48, Peter Geis wrote:
> > > The ci_hdrc_tegra driver does not currently support dual role mode, b=
ut
> > > it does not explicitly prevent its use.
> > > Certain devices support dual role mode, but not automatic role switch=
.
> > > This can cause the device to lock up during initialization of the
> > > driver.
> >
> > If the driver only supports peripheral mode, you could set dr_mode as
> > peripheral-only at glue layer, it would not be override by core.c.
> > See ci_get_platdata.
>=20
> The mode is set via the device tree dr_mode property.
> Even though the current tegra_udc driver does not currently support
> mode switching, board device tree files such as the apalis-eval and
> colibri-eval-v3 have dr_mode set to otg.
>=20

If you would like fixing wrong dts setting issue, you could do below:

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci=
_hdrc_tegra.c
index 0c9911d44ee5..5d85363ad0f4 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -95,6 +95,7 @@ static int tegra_udc_probe(struct platform_device *pdev)
 	udc->data.flags =3D soc->flags;
 	udc->data.usb_phy =3D udc->phy;
 	udc->data.capoffset =3D DEF_CAPOFFSET;
+	udc->data.dr_mode =3D USB_DR_MODE_PERIPHERAL;
=20
 	udc->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
 				      pdev->num_resources, &udc->data);

> They also seem to be missing the extcon phandle, which means automatic
> mode switching is not possible?
>=20
> >
> > But one thing I could not understand, if the driver doesn't support
> > dual-role, how could you do manual role switch?
>=20
> Manual role switching is conducted via debugfs,
> /sys/kernel/debug/usb/ci_hdrc.0/role
>=20
> >
> > >
> > > Detect this state by checking for the extcon phandle when dual role m=
ode
> > > is set to otg.
> > > If it doesn't exist request the driver to only enable manual role
> > > switching.
> > >
> > > Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
> > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > ---
> > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipi=
dea/ci_hdrc_tegra.c
> > > index 7455df0ede49..2f6f6ce3e8f5 100644
> > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > @@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device =
*pdev)
> > >       udc->data.usb_phy =3D udc->phy;
> > >       udc->data.capoffset =3D DEF_CAPOFFSET;
> > >
> > > +     /* check the dual mode and warn about bad configurations */
> > > +     if (usb_get_dr_mode(&pdev->dev) =3D=3D USB_DR_MODE_OTG &&
> > > +        !of_property_read_bool(pdev->dev.of_node, "extcon")) {
> > > +             dev_warn(&pdev->dev, "no extcon registered, otg unavail=
able");
> > > +             udc->data.flags |=3D CI_HDRC_DUAL_ROLE_NOT_OTG;
> > > +     }
> > > +
> >
> > The CI_HDRC_DUAL_ROLE_NOT_OTG flag may not be suitable here, please see
> > comments for it.
>=20
> I've dug around the various mailing lists and I fail to find any
> reference to why this is not a valid use case.
> The commit message specifically references dual role capable devices
> without proper otg implementations, such as missing the otgsc
> register.
>=20
> My current use case is the Ouya, which deadlocks the kernel durning
> probe if the otg capable usb controller is set to dr_mode=3Dotg.
> It works with this flag set.
> Unfortunately there isn't a property for dr_mode set to non_otg_dr_mode.
>=20
> I found a post stating that the driver blindly touches registers in
> otg mode, which leads to the deadlock if those registers are read only
> or non-existent,
> Eventually someone should look into why this deadlock occurs and make
> a proper fix that applies to all users.
> Unfortunately I do not have the knowledge yet to accomplish this task.
>=20
> With some simple modifications to the tegra_udc driver it is possible
> to get host mode working, vice using the tegra-ehci driver.
> At this point role switch works
>=20
> I also managed to move all of the functionality of the tegra-ehci
> driver into the tegra-udc driver.
> Unfortunately it doesn't behave correctly under some cases, so I never
> submitted it.
>=20
> Do you have a recommendation for handling this?

If you would like adding host function in chipidea driver for tegra, and
want dual-role switch to work, first, you may need to know which
dual-role switch you need:
- Through controller's id and vbus pins
- Through extcon, eg,GPIO.
- Through usb-role-switch class, eg, Type-C controller
- Through sysfs, /sys/bus/platform/devices/ci_hdrc.0/role

The first three are automatically switch, the last one is manually.
Current chipidea core should support all above switches, maybe there are
some limitations for them, the fixes are welcome.

Second, you may check if touch otgsc will hang or deadlock the system.
If you can't touch otgsc when portsc.phcd =3D 0, you may need the flag
CI_HDRC_DUAL_ROLE_NOT_OTG, afaik, few SoCs can't touch otgsc if it
supports dual-role.

When you add host function, you may set dr_mode as host-only first, it
could make thing easier.

--=20

Thanks,
Peter Chen=
