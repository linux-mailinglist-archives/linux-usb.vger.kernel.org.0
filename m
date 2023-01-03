Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F72865B9DA
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jan 2023 04:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbjACDpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Jan 2023 22:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjACDps (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Jan 2023 22:45:48 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D4CBC32
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 19:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBQyhni6eu6guaUPmz6TDct0f9i2vKbRzDiEPocpeuXhpEz4lG0tlycLMBk1qzJ5uD+psnm+yyMze9uQwaHKSIokHtBRu5fRt7DdGYTPBnukp8CT+MmWRnXgbMw6QL5lsTtEhJk6jmzggcRla8dDud3UJexpGnVV4kEUz1jMX28sUl24alMmnp9uH+6/e7PGPymnfpomxMe9PC/Wt1vG0acL69elflFyBpBObfOE/uVNrO41xwtcan1fY7DJLRnEMgRSj+G8ozB6D4Y+wG12QCWsPRKYwXsNSIXQ/4k96/8guYSj4qCFfVq03c2+AD7nu/Ur/+MBq37SchWtxOBplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMI5chM0MWoD5jrO1HpIZC7Na7YXVbezih65VpVuFQg=;
 b=BORUxkxX0RtWFM4bptiDeCC++AwoSh6ef9fPv3/8BrSoet6i13LkU5aBZub/NhsbkoX+EKma3PY4Zpj38zr7ph4D0fDijLr2iHRJQ1uSZLJp3AkcolcWRZiozEGTDN0TByUvN4nT6FqjvPESlGuYexlhyAVZk/XE4qFdLgmSpY6IVjjounqLHhMV+6uMjGCJS7QONSJAWOghs8XR4CiTirZA8o90SujkiJFh9aTijVOXD7Pn7El3yUubwY5m3nSKtO1ErMg1WZGMTD+AHejEAg1xNHtnzde3j2X6Cl0c7DHXBNm2chs6nMvmD8+dD3njlSzoJVvnZiwcAd/DLeyd/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMI5chM0MWoD5jrO1HpIZC7Na7YXVbezih65VpVuFQg=;
 b=Q8CTknkR+n/NuUh8/E55incUrdZQy4yyD/O5UGWvzKVlE+DyeDX/zwK9Ok86CE9SXwegoEhIKH1N7yj/TfsaZ1dUiE8f5jZQPAtEjaTDIyW/Kn0T0oXD0FBRx9XeV8AQDiMJTmLYJh2bt4fr/hKI1TB7y6OCSl5r25yDoyWefG0=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 03:45:43 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9%7]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 03:45:43 +0000
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
Thread-Index: AQHY6slI0uttgXhTUkWibWMoTeyBrq4ohyNwgAADqQCAANZ5gIABH8MAgADk9+CAAAfzYIAAhhIAgAEq9TCAUqp2IIAA4vWAgAu8DiA=
Date:   Tue, 3 Jan 2023 03:45:42 +0000
Message-ID: <PA4PR04MB9640EC2CF15B64C8AA36582389F49@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
 <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2F4tCMaB4x2fZck@francesco-nb.int.toradex.com>
 <PA4PR04MB9640FA4674C8B80A9FEA44DC89399@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <PA4PR04MB9640217920D3CD7A506FF9E389399@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2Kv6IkOFc4W0Ebc@francesco-nb.int.toradex.com>
 <PA4PR04MB9640FC6466D5BC1588FC37F789389@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <PA4PR04MB9640BDD0B040765259B010E489EC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y6nBb4pq4+GD1DDB@francesco-nb.int.toradex.com>
In-Reply-To: <Y6nBb4pq4+GD1DDB@francesco-nb.int.toradex.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|PAXPR04MB8093:EE_
x-ms-office365-filtering-correlation-id: 5d1af402-af0e-403a-da00-08daed3cfd49
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0YIBD0TJOvA0Kk7pFoJfY/+mBJStTEWyyteDQ/ykpBlxG5r8AWcojFF/6fuuKCwuIE2vP9ms68U88QBGJN74r4fHCvmUvpTFozWzzbWkr7a9qg6Kh34crW5uK6xITFqTc+vgKkQoqqy7ESOaDhzzreQZiISPn8b17CtnCRihGUjI6F4E+qggnGu0pTlbctKm8G7Id8iYQ45RmpT+1Vg9bitC78DEUB0NovdpAEMH033P9Le9sc7HrhN4bwboShsFKatyTPHPNK81kQMV2Rht2pl6B9Werf2GOoTcWpU1cpn3AKTNR6+11H3PrjyOqAe7G9qByGhvL2XFRJg29w4b4lxnKRPJj5/Ox6xrgNl/mcaSXEVwzjPJU5XG1tH5JhOuLrNnfvC/7wDogi44iDJrZoNCK4G0XVopjWG14z/f8jnfyXCisi0p83uN/Pw4RJiS3fUAhf0AiTO6nebNjAUIBx3ODM9kjUXAU+wWlcQKxM5Nciiv1uMFBjAOCqJjPvMFk9Cjit+Soxuc/YVq1cHSsWfl9avgoKbW9uNJTEfE+7p8NUbNKT6au0pgb6O3Fuv2n/zj6OEZBto0H1LvmrkF5h2DZxA0Vd4IcENnTfiVGnlqQas6ZKxNBxvE8SLBNQ1AMMgjpzdYu7vavrIi4z3UXMC0ZDt+7svNZDrigGANsNhK/yzUcvittjL28LelmT3lomxkxlB0kJaJQ0oEDM6UfCz4vq2n2Q0gIfOp+JGmeYo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(83380400001)(26005)(9686003)(53546011)(186003)(33656002)(6506007)(7696005)(55016003)(38070700005)(86362001)(38100700002)(122000001)(8676002)(41300700001)(4326008)(2906002)(7416002)(5660300002)(44832011)(8936002)(66476007)(71200400001)(52536014)(478600001)(66946007)(76116006)(66556008)(316002)(54906003)(64756008)(6916009)(66446008)(22166006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kbVCLPQBn6d5HuBgB6M+aSAotrvW3qpZlh+y1j0Bv9JVXiz40xYWsKdRAWau?=
 =?us-ascii?Q?OjJm5/IWiE5aB9RG9ZUeBMDuw3xBLl4oU6y4QGanwCj8E68r+DIhlqVHBmbG?=
 =?us-ascii?Q?qkAvmD0HgwXf1J527al2ypNk0KH2Qu1JhWnZxVzILcZ2fqaFn006zLG6TCxE?=
 =?us-ascii?Q?SDXyGWCNBftp1LZ7pSoVnxwsSgE+9nfirXSb7pUqKitaENgvXAcWoVQiPtso?=
 =?us-ascii?Q?Ck/CeuU88b6OKa/zQ6DVR5XFoTUXLtKv/H843LsI3t0BiX9G6FYX+DN+IU5q?=
 =?us-ascii?Q?Ovz4AuJp0ODzFcMaMgH9zWOeOrY3V7ZpPKJRbMquiA0W7QKCel9AAHS1xl58?=
 =?us-ascii?Q?AQhq44xWI1TX00NqG3Mhk37X3zEPUUIEThTOa9Ef+1TFMVWsBEtor5zS6btK?=
 =?us-ascii?Q?A/k6RbWO7xF888xd5TWGGHdMeetcKIlEL6Lm6FxKrkuaKCDrRWC/W3E0rrXM?=
 =?us-ascii?Q?YeLcSUokWt6RkmRQbCBHOdlHHTHg6CMKWSx00Cx4zUXqsWaLmkPzeKU5kkQg?=
 =?us-ascii?Q?OVn8iSrsiOQ28TUQaPE2G6CmnsnDUx5l4FTcRIIpN9nfgdY1AGsNQFpVKl93?=
 =?us-ascii?Q?B7iz9j36xuNoO85zXws+QYJIYsi2MH+DDPoowhejKBPCdywE4rjZqHoNmKFG?=
 =?us-ascii?Q?AnvK1MONrzezGianWKV+G/RebZw4kTScZOEgB/WlZ6bv4NWT4ASxSbyBhOkA?=
 =?us-ascii?Q?HvHfLb5R8P3OeHs+VwEH7kO+ITosyHIs6WiTNc7oPRVdsTuR0lHF0xBbS9jq?=
 =?us-ascii?Q?ULJGr6s4FkNaPqgje0McvpgFea3+0YTaAOWx1BlT0anmdW3vbC5JlC8q7fMu?=
 =?us-ascii?Q?s8lM01gfMJJ3GTfEcS0+EeCxE2egZQKWS5KlY3o+wiria857j9ONu7hJdfJa?=
 =?us-ascii?Q?gtatHfGFFzZHJOWvbZp1ZVwer39l7uHhw+vT5fHBsINpJNkp0XAc2/L6EJfk?=
 =?us-ascii?Q?gB3LkUe8YjjGbZwIQxPH9LCBGWafIpHGx9siPKC6yQbiXcDpFgEJLN2XDdAD?=
 =?us-ascii?Q?TrFMEDNT0mSgOpf9Jn0y4mGrf1505otywfrUwlUMHwBfdfyv7lgcU9sUQJ7L?=
 =?us-ascii?Q?h8O1WXTdBKE0cLfmb26aWDddACgxtvSwMmhkpDtTPqKFluOl50v4t4d5q4j1?=
 =?us-ascii?Q?vqHB2Msxa4n6n+mt4NhECgenlOztlu8N0wXBVr1Qk5JAlL4W0SKzTiImJkr2?=
 =?us-ascii?Q?dpZxjRqtdKx7DlYsL6cpt856Nys80JbTkMzvFFRxWxmwxSIHo5f2u0ewI3cV?=
 =?us-ascii?Q?zq1yxxYRybyzw77L4e2iPobo1RCoXA4Dp9FAaeksWAgOMcP5L2O9UkgDVPWv?=
 =?us-ascii?Q?UfttiP/9fG4MYnwQSx/DHO2KzM/r/2mIs3Y/bfa01HMMoGWdri5gb5Qw0n8a?=
 =?us-ascii?Q?jOBRhDWQKaY5PPGxPIBqJH9r23Sx8FHsYNM+h5QRWCjTAwJFx/MOVP64SHci?=
 =?us-ascii?Q?q150F/KQKvhZ1uuQlsm0J5YnHPpNJI5WTyAKIogRDus6zgYMPTxpIzFAPK5t?=
 =?us-ascii?Q?izKikZL3anNUn3P1HBmcGCkmZ1wbVmMWubyypvMqAz1uGzwucJQl3d9xyClz?=
 =?us-ascii?Q?yaxkqeLPF2V4ZOq98e4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1af402-af0e-403a-da00-08daed3cfd49
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 03:45:42.9486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9n28NiVGh1CfVtHrJWnfjCoqQDElHhEooBeZsiR4DZIswFl3dCEXiKj2xyab+I2l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Francesco Dolcini <francesco@dolcini.it>
> Sent: Monday, December 26, 2022 11:45 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: Francesco Dolcini <francesco@dolcini.it>; Jun Li (OSS)
> <jun.li@oss.nxp.com>; Peter Chen <peter.chen@kernel.org>;
> linux-usb@vger.kernel.org; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; dl-linux-imx
> <linux-imx@nxp.com>; Felipe Balbi <balbi@kernel.org>;
> philippe.schenker@toradex.com; Francesco Dolcini
> <francesco.dolcini@toradex.com>; Xu Yang <xu.yang_2@nxp.com>
> Subject: Re: USB runtime PM issues on i.MX6ULL
>=20
> On Mon, Dec 26, 2022 at 03:17:12AM +0000, Jun Li wrote:
> > > From: Jun Li
> > > Sent: Thursday, November 3, 2022 7:53 PM
> > > > From: Francesco Dolcini <francesco@dolcini.it>
> > > > Sent: Thursday, November 3, 2022 1:59 AM On Wed, Nov 02, 2022 at
> > > > 10:12:42AM +0000, Jun Li wrote:
> > > > > > > On Tue, Nov 01, 2022 at 03:10:46AM +0000, Jun Li wrote:
> > > > > > > > > On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wr=
ote:
> > > > > > > > > > > I am debugging some unexpected USB behavior on a
> > > > > > > > > > > i.MX6ULL SOC, chipidea controller ("fsl,imx6ul-usb")
> > > > > > > > > > > and a fsl mxs usbphy ("fsl,imx6ul-usbphy").
> > > > > > > > > > >
> > > > > > > > > > > The HW design has 2 USB interface, the first one is
> > > > > > > > > > > dual-role, while the second one is a host port with
> > > > > > > > > > > NO way to re-read
> > > > the
> > > > > > > > > > > VBUS (USB_OTG2_VBUS is not really connected, there
> > > > > > > > > > > is just
> > > > a
> > > > > > > > > > > capacitor to GND).
> > > > > > > > > >
> > > > > > > > > > How is your USB_OTG1_VBUS status? Can you try to make
> > > > > > > > > > your USB_OTG1_VBUS pad has a valid VBUS voltage, then
> > > > > > > > > > run your Host only port test with runtime PM enabled?
> > > > > > > > >
> > > > > > > > > USB_OTG1_VBUS is tied to GND the same way as
> > > > > > > > > USB_OTG2_VBUS, not really straightforward to do such a te=
st.
> > > > > > > >
> > > > > > > > iMX6ULL need at least one valid VBUS(either from OTG1 or
> > > > > > > > OTG2) as input to power the internal USB LDO if I understan=
d
> correctly.
> > > > > > > This surprise me a little bit, since
> > > > > > >  - the i.MX6ULL datasheet prescribe to keep the VBUS
> > > > > > > disconnected
> > > if
> > > > > > >    unused
> > > > > >
> > > > > > I think "unused" here means you do not need/enable the port at
> all.
> > > > > >
> > > > > > >  - downstream NXP kernel seems to work fine ("seems" since
> > > > > > > we do
> > > have
> > > > > > >    some patches there, so I could be wrong)
> > > > > >
> > > > > > What do you mean by " downstream NXP kernel seems to work fine"=
?
> > > > > > The downstream kernel can work on your HW? But upstream kernel
> > > > > > driver does not?
> > > >
> > > > Correct, NXP downstream kernel is working fine, upstream kernel
> > > > requires runtime PM disabled to work correctly.
> > > >
> > > > > > >  - disabling runtime pm on upstream Linux kernel make it work=
s
> > > > > > >    perfectly, so there is a way in SW to have this HW configu=
ration
> > > > > > >    working.
> > > > > >
> > > > > > Again I want to make sure the both VBUS pads(OTG1 and OTG2)
> > > > > > voltage are always at 0v on your HW, can you double check and c=
onfirm?
> > > > > > I ask this again because such situation should cause the USB
> > > > > > port Cannot work at any cases, but your current status is:
> > > > > > only low power wakeup cannot work.
> > > > >
> > > > > Could you please check the voltage of pad of VDD_USB_CAP on your
> HW?
> > > >
> > > > I was about to clarify you this point, it's important and I forgot
> > > > about it, sorry about that!
> > > >
> > > > VDD_USB_CAP in our design is connected to a 3.0V external LDO,
> > > > voltage on both VBUS pads is 0V (FYI: this specific hardware
> > > > design was validated by NXP hardware engineers).
> > >
> > > Then the HW design should be fine.
> > > I need find time to try the upstream kernel on my iMX6ULL board to
> > > check this.
> >
> > My iMX6ULL EVK board cannot reproduce this issue with upstream kernel.
> >
> > Could you try to set the bits [7,3] of 0x020c8200(for 2nd USB
> > controller OTG2) to be value like 0x1000FC? This may be done at your
> > bootloader(uboot), so make sure those targets bits are set before
> > doing your test, or doing this with below change(not compiled or tested=
):
> >
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c
> > b/drivers/usb/phy/phy-mxs-usb.c index d2836ef5d15c..e390ef534a7c
> > 100644
> > --- a/drivers/usb/phy/phy-mxs-usb.c
> > +++ b/drivers/usb/phy/phy-mxs-usb.c
> > @@ -89,6 +89,9 @@
> >  #define ANADIG_USB1_CHRG_DET_STAT_CHRG_DETECTED        BIT(1)
> >  #define ANADIG_USB1_CHRG_DET_STAT_PLUG_CONTACT BIT(0)
> >
> > +#define ANADIG_USB2_VBUS_DET_SET               0x204
> > +#define ANADIG_USB2_VBUS_DET_VBUS_OVERRIDE     GENMASK(7, 3)
> > +
> >  #define ANADIG_USB2_VBUS_DET_STAT              0x220
> >
> >  #define ANADIG_USB1_LOOPBACK_SET               0x1e4
> > @@ -288,6 +291,11 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy=
)
> >         if (ret)
> >                 goto disable_pll;
> >
> > +       if (mxs_phy->regmap_anatop && (mxs_phy->port_id =3D=3D 1))
> > +               regmap_write(mxs_phy->regmap_anatop,
> > +                            ANADIG_USB2_VBUS_DET_SET,
> > +                            ANADIG_USB2_VBUS_DET_VBUS_OVERRIDE);
> > +
> >         /* Power up the PHY */
> >         writel(0, base + HW_USBPHY_PWD);
>=20
> Hello,
> I tested your patch and it does not work. I therefore tested a slightly
> improved version that really ensure the right register value is written.
>=20
> [    8.408564] port=3D0 reg=3D0x200 val=3D0x1000fc
> [    8.440235] port=3D1 reg=3D0x204 val=3D0x1000fc
>=20
> but it does not work never the less. Unfortunately bits 7-3 are not docum=
ented,
> so I was not able to do much more.
>=20
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c
> b/drivers/usb/phy/phy-mxs-usb.c index d2836ef5d15c..3ff5489d679e 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -89,6 +89,10 @@
>  #define ANADIG_USB1_CHRG_DET_STAT_CHRG_DETECTED        BIT(1)
>  #define ANADIG_USB1_CHRG_DET_STAT_PLUG_CONTACT BIT(0)
>=20
> +#define ANADIG_USB1_VBUS_DET_SET               0x200
> +#define ANADIG_USB2_VBUS_DET_SET               0x204
> +#define ANADIG_USB1_VBUS_DET_VBUS_OVERRIDE     GENMASK(7, 3)
> +
>  #define ANADIG_USB2_VBUS_DET_STAT              0x220
>=20
>  #define ANADIG_USB1_LOOPBACK_SET               0x1e4
> @@ -309,6 +313,7 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>                 writel(BM_USBPHY_IP_FIX, base + HW_USBPHY_IP_SET);
>=20
>         if (mxs_phy->regmap_anatop) {
> +               unsigned int val;
>                 unsigned int reg =3D mxs_phy->port_id ?
>                         ANADIG_USB1_CHRG_DETECT_SET :
>                         ANADIG_USB2_CHRG_DETECT_SET; @@ -319,6 +324,15 @@
> static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>                 regmap_write(mxs_phy->regmap_anatop, reg,
>                              ANADIG_USB1_CHRG_DETECT_EN_B |
>                              ANADIG_USB1_CHRG_DETECT_CHK_CHRG_B);
> +
> +               reg =3D mxs_phy->port_id ?
> +                       ANADIG_USB2_VBUS_DET_SET :
> +                       ANADIG_USB1_VBUS_DET_SET;
> +
> +               regmap_set_bits(mxs_phy->regmap_anatop, reg,
> +                            ANADIG_USB1_VBUS_DET_VBUS_OVERRIDE);
> +               regmap_read(mxs_phy->regmap_anatop, reg, &val);
> +               printk("port=3D%d reg=3D0x%x val=3D0x%x\n", mxs_phy->port=
_id,
> + reg, val);
>         }
>=20
>         mxs_phy_tx_init(mxs_phy);
>=20

Thanks for try those, those bits are for vbus valid override,
You can verify if the override real works by checking the OTGSC
Registers(a few bits to show the BSV/ASV/AVV) via the debugfs
/sys/kernel/debug/usb/ci_hdrc.1/registers.

echo on > /sys/bus/platform/devices/ci_hdrc.1/power/control
cat /sys/kernel/debug/usb/ci_hdrc.1/registers

if the BSV/ASV/AVV are all set to be 1, means it works.

Enable runtime PM back:
echo auto > /sys/bus/platform/devices/ci_hdrc.1/power/control
then do your issue test.

if this cannot work for your HW, I need a similar HW to reproduce the
issue for further debug.

BTW, how is __mxs_phy_disconnect_line() impacting this issue
result on your HW? If not called, then the direct plug usb device
to the OTG2 port can work, but adding an external hub between still
cannot work?

Li Jun

