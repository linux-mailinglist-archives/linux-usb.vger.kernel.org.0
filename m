Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83C1655F64
	for <lists+linux-usb@lfdr.de>; Mon, 26 Dec 2022 04:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiLZDRS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Dec 2022 22:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiLZDRR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Dec 2022 22:17:17 -0500
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2057.outbound.protection.outlook.com [40.107.249.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F9010DA
        for <linux-usb@vger.kernel.org>; Sun, 25 Dec 2022 19:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8tTxtGQfp46f3WhhqToU9mBJawm+P6m5pKsDS3Ntk7iOwNxV6e22ooOYayQwYxPGLe4ukcXWBos8y9bwgIpIMcci8D21fTQlyJc6i0zlbtgY9jqNDqYR0Ns4t/S7+Rl8AJKHoAorXI3bZJILjfyUj80BIdNyPP4nMbUfGnB5zrPJO+A9LOWroqxwO0YI7bSHfQdzip/B/LpWAOex9l/xMSkFFU7LA5JEhVp52T2sMoE+NPL1PHZTd2wHj/7Yrdj6FEZHwkcgoV4gCz3JQvcgcDPQJ1v4xpj4g2CNZiq9yR4ggaWH3tSN36LceYxtmlIlenE9cp5aisAEEelHy9MIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5exwLp1UIF2fjtzwFSx4d3By44/Hf+r4tl2bZwkwsHM=;
 b=TrSCAcLGz1UK/v0E3UshnDk06yVlZbqdlGSLny36iTnn44tJtm7jaL0yb6Fn4YXgXO4d6raUmyvOs0xRe5j6LHXy4hBOA2F6Zbfob38XKqjpMkgLj8bZHKe282c9COi7arW/v00xG7jgg7HRDcLlQwE2gCDjN03IYJm1//9NCFZ2sNER368oYdNGn9YiEql4aGXThvKC6iy2kH2EMbmilI85fstSPDsGghfPX8eHG0LG/G2Hp2iAh4oHKh+BKkJea1tOWp0Qtw3cNaXPo5Zn5Zm1jT7CiQ+10sxEk/q8RPLxMmNUQNhYrqh4SXrE8/cb9ki5jJCHf2A7VwInJyrAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5exwLp1UIF2fjtzwFSx4d3By44/Hf+r4tl2bZwkwsHM=;
 b=NL8DtUkTsRBcbW5kZDHNhDEY2yGYOXcQNyG/3+pd1KAQfi8VAfxTHjfsVen/hJLT2cwCgz0MP48QvuGj39KhC4/mlOfR2+TBdMXkHoEHkYFPaYj5SrGurhBREeCb4HbAJWj0h5DG3WNA2OLZTBK1AFT6dd3mshstq74OvAd7+J0=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DB9PR04MB8137.eurprd04.prod.outlook.com (2603:10a6:10:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 03:17:12 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9%6]) with mapi id 15.20.5944.013; Mon, 26 Dec 2022
 03:17:12 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Francesco Dolcini <francesco@dolcini.it>
CC:     "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Felipe Balbi <balbi@kernel.org>,
        "philippe.schenker@toradex.com" <philippe.schenker@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Xu Yang <xu.yang_2@nxp.com>
Subject: RE: USB runtime PM issues on i.MX6ULL
Thread-Topic: USB runtime PM issues on i.MX6ULL
Thread-Index: AQHY6slI0uttgXhTUkWibWMoTeyBrq4ohyNwgAADqQCAANZ5gIABH8MAgADk9+CAAAfzYIAAhhIAgAEq9TCAUqp2IA==
Date:   Mon, 26 Dec 2022 03:17:12 +0000
Message-ID: <PA4PR04MB9640BDD0B040765259B010E489EC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
 <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2F4tCMaB4x2fZck@francesco-nb.int.toradex.com>
 <PA4PR04MB9640FA4674C8B80A9FEA44DC89399@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <PA4PR04MB9640217920D3CD7A506FF9E389399@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2Kv6IkOFc4W0Ebc@francesco-nb.int.toradex.com>
 <PA4PR04MB9640FC6466D5BC1588FC37F789389@PA4PR04MB9640.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB9640FC6466D5BC1588FC37F789389@PA4PR04MB9640.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|DB9PR04MB8137:EE_
x-ms-office365-filtering-correlation-id: 812cb948-25ad-4f5c-bfbb-08dae6efae8c
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4MRMDtfPNbD1J7JdDK7ZPCkUa7fa9nmV9gJCshS9Dgwrh+SX/IXEh4X9AFddJOCmMXZvr9fN5jC/2aqw9Bv64flOen9VDzXe/hj7FP02i0adfOKjeGqlTzXtJYiCu6n2rhnaNaE0JBjQ/UChgMZL5qtS3g24rXDa/scEuJlxgxYr3VQcRuSulm1hY1LGC1X6OmLlNhbPtQGfqW6mcW6nIxaDc+vtUpp0GedamD+SN5rpLJqNt2GXcIZCGkL5N2KPqlxX3VQjhck+ufYhLmTK94NptrwaOPl77D263XueoPLOWWbU/sjXX4RguZK2wvr2VuJTa4aUc5l8RrcBQJIpKAyh1Gkli9ka9N4J1zZRQHs5EXQXeks02toPjNn3618GrM8l2/qCPQ14oij9tDY6/pQpqKKIfQrEr2vJbJswJaQmY48Z3Z9qXPVqd64QcYeF1SJSeIRr2oEL6R8ezfcU1a+OQDaK2gSf/9V0qYxxY887PsR3vJOE0LcfGjIhOghIIzhE4lJvAJNt4qmXaDxjJfUsSFB+jBAmN2Rc1YVsZRd/+2xChbG7mhOHhX9pNXph/akYHyznvHSWHVGsfDFA8diYvujVGICm7IXjPEI+4lxTvOUe8dBTHuUA1KNDxeWTJhBmyIeGVpBePrFn4gXBBcjKiEcfj5WufHvu2yv1FtTc2t/VKmmqwjgE5VpwHdxT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199015)(478600001)(33656002)(71200400001)(316002)(2906002)(6916009)(54906003)(83380400001)(38070700005)(38100700002)(122000001)(86362001)(55016003)(53546011)(6506007)(7696005)(9686003)(186003)(26005)(66476007)(64756008)(66446008)(66556008)(66946007)(8676002)(76116006)(5660300002)(4326008)(7416002)(52536014)(8936002)(44832011)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Xm7iWqTk3xSpjA+tWQICHIVVW0T4jd8off5rPExpNilWuNfVIW26JUOGzygy?=
 =?us-ascii?Q?+ZQmoqeQEbDv3926Bq0CUvjrWbBKSEv7DucCpxyA8kgRGaf3hEOjnkJfvVGT?=
 =?us-ascii?Q?KlJywsAekmSJgHB1EVqA2ve3xOo/IVX5fIjLs1JLmmEvSOFwUKWZ3JPWWDV0?=
 =?us-ascii?Q?o0lRnEorTpjaHI/kyhHZhiYQRlgHxn8AvU3wkl8wQ29fmqxbY9FSUB1t6upk?=
 =?us-ascii?Q?ef5myOKTU5JknEKy+t4X9I7AfGv1fzkxe8x4lPOYOv4un2hjy/KVqUj1XdqM?=
 =?us-ascii?Q?m/sGxOsNH7MqAZZ+sRNwNBVSI7dVPHFMuqsJg4ph6S6kMW4YYU0San5kZThx?=
 =?us-ascii?Q?cnBLkignxWCe1+Xu3T4RGZiamZvH092DjMLgSN0Xhg75zangrLwPOzXAq9GK?=
 =?us-ascii?Q?5U8NXiJd47qBzk5zB4YzapOTHUUwgE8mnthvd68RElDblKO+YsaasiQ8uxss?=
 =?us-ascii?Q?Z1q/AcKXIQiaKuoNI3W3BIY6Hv2IdEl9Lvx9KTXtzu3wGX+M5FYJAhL44xMf?=
 =?us-ascii?Q?3LnnbQTaOWUm6Ajq+cbntgggyKK9iu0Q/lkVjsjfG4WTx7myAXJo6OeJ12NT?=
 =?us-ascii?Q?MoLuszFlu09GhRIx2CCGY9Xo6gjFl7spWorV6mthfCDaGYG4UZgY23zAy+Jy?=
 =?us-ascii?Q?nUvmNu23QZ4ih7u+mKT8mnryDr++L1Ep0WuWGKoBTQidC1Doet4E1XNHd4g1?=
 =?us-ascii?Q?yN3rBI/CCOkeOMtSfMq2JtovKPLloyZOoTqAT+OMjaZ06+MiNk5VVTYnAUX5?=
 =?us-ascii?Q?qbTxMuDZQOzI0+leqfU1668QAMlnn6auzPR+Lkk+9SWe1ZiL2wlesx6gCm9W?=
 =?us-ascii?Q?sk2k8LH8Gl1bkGdNtswrV9nrTi4CjBrvq0lG+n2SYlt266CNyQTE97Peznld?=
 =?us-ascii?Q?fN7XfAiiJ2HbdLgwciowWqyHHfyjqe1tV/mUKzvHTCPzRVd4AUjQyhwLGTNU?=
 =?us-ascii?Q?CHUNxT10ntPZ4gpggXiJbRDnRXUKTUWb364zwU72qLHG88L55n9sZRtzlQN1?=
 =?us-ascii?Q?6iEiIfS0kUn1AUzhP16p09cowkRMMViu545+Cqb+qL7oEj6XUNIAwNGtVjKV?=
 =?us-ascii?Q?APanLCAQgWZD2y1lXJwxVqSUrUSmQWZmEn3OVCilZ9WuuewyGPqrACQbF6xN?=
 =?us-ascii?Q?lctMELx+NoMnlNy+IvObMqPmEG894o5XAjywKAaRynGtgkL1LKSEqpgL7i9g?=
 =?us-ascii?Q?ruVKw3CbuWb/pYIUhnlJLcuesTmU9XHSHhTljHwVIjjdc0673NoW4iahRpmc?=
 =?us-ascii?Q?PfnwNWo7HIdP0dL4mxU3+xpAQuL4O1V+0dREOA2l2XTPjoj0sszgE/NgF/rh?=
 =?us-ascii?Q?Q34DUOqCcr2iBbMfQfl0NyM3hU43s4VxE8UMQmc3ch2HOu+09jRquyYdGdws?=
 =?us-ascii?Q?NtXfXC1QEEswGS9lAwyjY/OZnDFJkRirTxdaLQYaPqG9cHp/Sal3aLmtZEPL?=
 =?us-ascii?Q?f3jUMFOsbdQBIt7ivBrYIQTaiiNOAuqy3++XBnKjx3eNmWryUcY5e9+8sMxn?=
 =?us-ascii?Q?JM1vDSaJiuQtZW22cwo3iZ8S/tZE7gH/i2hZejbMV5OjqhJdOqPQ8EndEl6e?=
 =?us-ascii?Q?92KIxeaaDqJ3QP0Q5nI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812cb948-25ad-4f5c-bfbb-08dae6efae8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2022 03:17:12.6222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqCeojwtcTiObat3esY4f7+QuqUGRyGV4gTk8JYIxBT3bshJsZDrheWP2HdwNFuo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8137
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Francesco,

> -----Original Message-----
> From: Jun Li
> Sent: Thursday, November 3, 2022 7:53 PM
> To: Francesco Dolcini <francesco@dolcini.it>
> Cc: Jun Li (OSS) <jun.li@oss.nxp.com>; Peter Chen <peter.chen@kernel.org>=
;
> linux-usb@vger.kernel.org; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; dl-linux-imx
> <linux-imx@nxp.com>; Felipe Balbi <balbi@kernel.org>;
> philippe.schenker@toradex.com; Francesco Dolcini
> <francesco.dolcini@toradex.com>
> Subject: RE: USB runtime PM issues on i.MX6ULL
>=20
>=20
>=20
> > -----Original Message-----
> > From: Francesco Dolcini <francesco@dolcini.it>
> > Sent: Thursday, November 3, 2022 1:59 AM
> > To: Jun Li <jun.li@nxp.com>
> > Cc: Francesco Dolcini <francesco@dolcini.it>; Jun Li (OSS)
> > <jun.li@oss.nxp.com>; Peter Chen <peter.chen@kernel.org>;
> > linux-usb@vger.kernel.org; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> > dl-linux-imx <linux-imx@nxp.com>; Felipe Balbi <balbi@kernel.org>;
> > philippe.schenker@toradex.com; Francesco Dolcini
> > <francesco.dolcini@toradex.com>
> > Subject: Re: USB runtime PM issues on i.MX6ULL
> >
> > On Wed, Nov 02, 2022 at 10:12:42AM +0000, Jun Li wrote:
> > > > > On Tue, Nov 01, 2022 at 03:10:46AM +0000, Jun Li wrote:
> > > > > > > On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wrote:
> > > > > > > > > I am debugging some unexpected USB behavior on a
> > > > > > > > > i.MX6ULL SOC, chipidea controller ("fsl,imx6ul-usb") and
> > > > > > > > > a fsl mxs usbphy ("fsl,imx6ul-usbphy").
> > > > > > > > >
> > > > > > > > > The HW design has 2 USB interface, the first one is
> > > > > > > > > dual-role, while the second one is a host port with NO
> > > > > > > > > way to re-read
> > the
> > > > > > > > > VBUS (USB_OTG2_VBUS is not really connected, there is
> > > > > > > > > just
> > a
> > > > > > > > > capacitor to GND).
> > > > > > > >
> > > > > > > > How is your USB_OTG1_VBUS status? Can you try to make your
> > > > > > > > USB_OTG1_VBUS pad has a valid VBUS voltage, then run your
> > > > > > > > Host only port test with runtime PM enabled?
> > > > > > >
> > > > > > > USB_OTG1_VBUS is tied to GND the same way as USB_OTG2_VBUS,
> > > > > > > not really straightforward to do such a test.
> > > > > >
> > > > > > iMX6ULL need at least one valid VBUS(either from OTG1 or OTG2)
> > > > > > as input to power the internal USB LDO if I understand correctl=
y.
> > > > > This surprise me a little bit, since
> > > > >  - the i.MX6ULL datasheet prescribe to keep the VBUS disconnected
> if
> > > > >    unused
> > > >
> > > > I think "unused" here means you do not need/enable the port at all.
> > > >
> > > > >  - downstream NXP kernel seems to work fine ("seems" since we do
> have
> > > > >    some patches there, so I could be wrong)
> > > >
> > > > What do you mean by " downstream NXP kernel seems to work fine"?
> > > > The downstream kernel can work on your HW? But upstream kernel
> > > > driver does not?
> >
> > Correct, NXP downstream kernel is working fine, upstream kernel
> > requires runtime PM disabled to work correctly.
> >
> > > > >  - disabling runtime pm on upstream Linux kernel make it works
> > > > >    perfectly, so there is a way in SW to have this HW configurati=
on
> > > > >    working.
> > > >
> > > > Again I want to make sure the both VBUS pads(OTG1 and OTG2)
> > > > voltage are always at 0v on your HW, can you double check and confi=
rm?
> > > > I ask this again because such situation should cause the USB port
> > > > Cannot work at any cases, but your current status is: only low
> > > > power wakeup cannot work.
> > >
> > > Could you please check the voltage of pad of VDD_USB_CAP on your HW?
> >
> > I was about to clarify you this point, it's important and I forgot
> > about it, sorry about that!
> >
> > VDD_USB_CAP in our design is connected to a 3.0V external LDO, voltage
> > on both VBUS pads is 0V (FYI: this specific hardware design was
> > validated by NXP hardware engineers).
>=20
> Then the HW design should be fine.
> I need find time to try the upstream kernel on my iMX6ULL board to check
> this.

My iMX6ULL EVK board cannot reproduce this issue with upstream kernel.

Could you try to set the bits [7,3] of 0x020c8200(for 2nd USB controller OT=
G2)
to be value like 0x1000FC? This may be done at your bootloader(uboot), so
make sure those targets bits are set before doing your test, or doing this
with below change(not compiled or tested):

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index d2836ef5d15c..e390ef534a7c 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -89,6 +89,9 @@
 #define ANADIG_USB1_CHRG_DET_STAT_CHRG_DETECTED        BIT(1)
 #define ANADIG_USB1_CHRG_DET_STAT_PLUG_CONTACT BIT(0)
=20
+#define ANADIG_USB2_VBUS_DET_SET               0x204
+#define ANADIG_USB2_VBUS_DET_VBUS_OVERRIDE     GENMASK(7, 3)
+
 #define ANADIG_USB2_VBUS_DET_STAT              0x220
=20
 #define ANADIG_USB1_LOOPBACK_SET               0x1e4
@@ -288,6 +291,11 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
        if (ret)
                goto disable_pll;
=20
+       if (mxs_phy->regmap_anatop && (mxs_phy->port_id =3D=3D 1))
+               regmap_write(mxs_phy->regmap_anatop,
+                            ANADIG_USB2_VBUS_DET_SET,
+                            ANADIG_USB2_VBUS_DET_VBUS_OVERRIDE);
+
        /* Power up the PHY */
        writel(0, base + HW_USBPHY_PWD);

>=20
> Li Jun
> >
> > Francesco

