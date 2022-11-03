Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53202617BF3
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 12:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiKCLxd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 07:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiKCLxa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 07:53:30 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3C5DB3
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 04:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqrTt6EshpCTEzkck3L9gg8m34wOrxaboi8sINw1IAw7bii/OLZXoyhUT4+zzeVQ3ELrLSjbSPXZwwnLyQ4pNwiV+0udFA1LLZm8U8GmqOmJo66ZLrXFBdKClP3MHBj9iacZnT16WELMCnTmMOeMavOBX9qZkEkgbKHFSJgBEQ6nYVeSkcgInKESa/gfUnAaofBddy+dQCO5cbURNEFrvalot6rKIL0jRaZ9M/3cMCxe4jAVYG04Nb5pAu6XWaXrzy8bZOxjIJ3hXmn9BIHLgyNpJoMZoc4JLhH4P3QrD+2t2Zxq4Wk2gxv6JsiMlWuNTu0G3fl4gqtBflTaG7G0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPxOMjxYCql4e2xCd382MtOUQ8zYKng3bp2W+xefreE=;
 b=C9TPDAAv8pCO8J2/lEQZt5lw9GlpfmrKclSR6pqhZts5qPQJ8cX5JiUMi0wo0A0z6QXnJr2/uXisSbRP9w17pZTwzP9OE99TMppbBl/MVLxdfjJgBetqgOYA13qTYx5Rc2b/cS13jV21OZrJd/Y2meljDt/sgC96489RcLW+LDrGsyxIwmryAWIj9a/gJ+6ams/eApyO0tHGxOva03/pL1SOEmE/tg39SmpGMVv7PGv53Xx1U4IcdfphyzSnhFegebWxSHM6v3ccMsYZnpYlEIEjPgYHIRkyCdUn86r8l/ZYy3UjxoITiQKLoRq4CjL2lUWEjRozu7hHEaNwr4Mj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPxOMjxYCql4e2xCd382MtOUQ8zYKng3bp2W+xefreE=;
 b=p3s+q8LQlYOqztLhjnDXRRN7CSoJGcoVoTfJo6LscttlpzpnZVpyrqpwQxMdwwl/R61xLfBfF3cSJz0X+M9sS7JdQ1YRGqtzFcHuR9327006wbxVhowVySZJWxFZTCxf9g+vZEJl2BkliRTiRn90IfvZLui3+cX9uKRqDOx3GhI=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 11:53:25 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%9]) with mapi id 15.20.5769.016; Thu, 3 Nov 2022
 11:53:25 +0000
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
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: RE: USB runtime PM issues on i.MX6ULL
Thread-Topic: USB runtime PM issues on i.MX6ULL
Thread-Index: AQHY6slI0uttgXhTUkWibWMoTeyBrq4ohyNwgAADqQCAANZ5gIABH8MAgADk9+CAAAfzYIAAhhIAgAEq9TA=
Date:   Thu, 3 Nov 2022 11:53:25 +0000
Message-ID: <PA4PR04MB9640FC6466D5BC1588FC37F789389@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
 <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2F4tCMaB4x2fZck@francesco-nb.int.toradex.com>
 <PA4PR04MB9640FA4674C8B80A9FEA44DC89399@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <PA4PR04MB9640217920D3CD7A506FF9E389399@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2Kv6IkOFc4W0Ebc@francesco-nb.int.toradex.com>
In-Reply-To: <Y2Kv6IkOFc4W0Ebc@francesco-nb.int.toradex.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|AM7PR04MB6854:EE_
x-ms-office365-filtering-correlation-id: 82b9c91b-ea66-4b5d-b8d5-08dabd920426
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DmKooLyt3TamZgcIKjjjJ85vkwqxkB0zQ2d5aduHsJnPX245YHjaI1dX5+plFD0xrlm6teDvulAoKxEe4nG9YWnJXNJ02bqNeLGfd+fNp1OTxWqutIqEJTNJyyXeg6ilwh8z1CtGJsNvuKTm9rcWflPQUPfld3jG9T3a0GCQXJFhU0aPcJfC1hbDI8nQTvrOIQLM/4GuImbKS/3OZI9xHOxMD2famhKztYTRyrJfiQkXVFDtBVgIYMZXi9uTqVjSvZNJPD7HXZCph8uFtLDnroD0ni8bDxOgt3FiOBfTgIOxPj1RryoSh2a+G4DrZwFX3krQtsthklU0pAROLN2iBb8kZEYKrgriQ/TBvzow0e7TwxscR3Ibg+tYl/A89b8kN2LXkdO++81PS2lfe55MiH9gLdvtUAlDQAQLjRghnxFPKwBNlNPEMW++EsYyqJE/9e29GtuGCPhb0SB0xpj/KmIJ7y/pCMQGjI1JNnirKZKAFxBAeaQv5nDT/dvC+SvPxHz3lMuWouLl1buiHofEjB4P5Abayg5mHJhxIxc/CvEpGprFGapFemZmVLEKt772VMs0Cm3/zD9VwYfaOREXts4JinN1M3gmNfx3+wgx/dcamavXfmk1MRKOuq6WQJAabeMB2/iPXeQ9Zind/n8GlHyweWpn5/AHocjspoA9bhRqpWUheiaOSG4NTINNjVCJR6iNK+FrBl/WjvYXhv9N1Ipd8kRRAp6BMGEUIotJXWGQTBBvxkJ6HuO/TtUtYxlmmguPbSKXhR8Tgx6xSm6tIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199015)(38070700005)(55016003)(33656002)(86362001)(64756008)(6506007)(122000001)(7696005)(38100700002)(316002)(66446008)(8676002)(4326008)(76116006)(71200400001)(53546011)(6916009)(478600001)(54906003)(186003)(66556008)(44832011)(2906002)(66946007)(5660300002)(8936002)(83380400001)(52536014)(9686003)(66476007)(7416002)(26005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vZ4TAullKAP3O83UlELxYt1kFNimQM4fko5vkZBEsbGs527U7ZTMistGG8Th?=
 =?us-ascii?Q?4azY+f/ggSHdJmgeKJoX+DgUwL5UtLVZzU5qy469CIWse+iXRHKE3utw/QfT?=
 =?us-ascii?Q?ZsMrKfuYY8sNmMp66kduXZ1Qr/cTQVJcRTxyNFAONBxII0cJl6TU73AlHJu4?=
 =?us-ascii?Q?RfwkRhNFmquGnE+EsWSxDreMic6agd0Sv+fbvr+cx+xezFPpE2Jvr+zmzjDm?=
 =?us-ascii?Q?q2ywFqssrrfLEDClDU1wikaXzRskFduOffqfukj4lTzMLalN2xCIRFYDkChI?=
 =?us-ascii?Q?l99kZGXVNLQKhFTXcS2fdJo8YHwvhaR6xwUOup0gG45CzQNAHkZvCeZEpMFb?=
 =?us-ascii?Q?aD5LYUNZ1nO+5e3kyfttJkYTU2+fmUWfmG+T9+fmEbXI6rxxg/jlLbthGaqJ?=
 =?us-ascii?Q?Pb9dnKBoQvUsB9qDRX+AjMOgC+Lz4pFMnt4cPjGmovDCTqip6dn3g839Au0U?=
 =?us-ascii?Q?yd1wDTYB/66f/W9zl0J5QTBFGgEIaeYe9zK7m057KvaFSG6Gpa3vHO0ZVcoZ?=
 =?us-ascii?Q?awRK8Jg/FM7RfYHZlxE1heN9NXU/X39DQNZBFtd9TBUu9/G7iwKF9GmvmMrp?=
 =?us-ascii?Q?qDUdUg5Rd2WKTw2zU549H7ESf5wn04zP9gSigkcs5H9tAX7XeBZzzDYIiCnw?=
 =?us-ascii?Q?Us8f+SgTPRKmXnVGmoGWiN2sFyV2MQuqAmi21FTP7qY73TjuwQ4Kf5ySak1H?=
 =?us-ascii?Q?/spdiIcfIESba+OgIlzveAAqQMxJukA29WOvSYQxiModvncR77XWQ9aJb3zD?=
 =?us-ascii?Q?W+F0cMu584na5hhkYdbtI85SVo9G8xs+JprSGTqNbQQNloavuy0rGmeP+7/W?=
 =?us-ascii?Q?ZsaDNjFvywoRCJZvaSXSV4OnPu897k1nt7IlUtRn7MACtp+Pz9zviFf/1I9g?=
 =?us-ascii?Q?Cst6TT87pT6sBCX0kn1c8fLmafP42LNKo6U37k44x2QQMcznzVVnhEnq8S6G?=
 =?us-ascii?Q?bzK9Ewfl9mVbtfFH5Vkvr9dVABsEsLzroA1EyA+FL/yjcbx6qdEoqbCLS05M?=
 =?us-ascii?Q?rchrwKqVT8EzVwc4SPrKwI48gleemOs936zc2xOOQa+6Mt0vOvB/zSW4G0PP?=
 =?us-ascii?Q?vv1+u+GRi+PUzalKtYmZCg4YCYWxuYpDhHmJVAI1iKJBOOcOuT1NWGZ8+8R5?=
 =?us-ascii?Q?VvkC10fBC9e/Q6X97E9Z1EmrqzF7ZFX8DKSmoyYQcpEwPxiaM/ujY8tOOgNO?=
 =?us-ascii?Q?cEY4NCsy5M7Y0Krwuohr/6Nazfciq5z97AsUBZcuRIXKbPyJ/jzcvuvxXoMV?=
 =?us-ascii?Q?4Gw6R0TrpXpTeNEkoA06kKv/pZQNQsQmhJcG9GRF8nuRohrLWeg3QePk1bVO?=
 =?us-ascii?Q?HuZ5hvzrq4FgtmeYHLnNaXeV3HyoSG808cMEwnQ1n47czzKraBiU4bRLlwZU?=
 =?us-ascii?Q?j3pCpWrWcqBB+cSftcX71VYMBILEGIUhcPsNS253xqRY8Z7yDAU8o+ULRO1x?=
 =?us-ascii?Q?By0TXDv5iqEUWo4ApXDDZI7E84NAzjEIHGzeXmJL3NKULjbPBGmu6aD48vmO?=
 =?us-ascii?Q?ClkI9dVoDnHV2SsFcfVy5LFZRy7gqjcpohVrA7GYN6ulsaYuGKltD8QGLXuj?=
 =?us-ascii?Q?LCMkaaCHpbTSKWvwRQk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b9c91b-ea66-4b5d-b8d5-08dabd920426
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 11:53:25.8398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QVDOqnk/iCOCNTp2lAYKs4YKJaKu1PKe/RF1uqfgUWyLtJzvykT9k5KkMmGUU1qL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854
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
> Sent: Thursday, November 3, 2022 1:59 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: Francesco Dolcini <francesco@dolcini.it>; Jun Li (OSS)
> <jun.li@oss.nxp.com>; Peter Chen <peter.chen@kernel.org>;
> linux-usb@vger.kernel.org; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; dl-linux-imx
> <linux-imx@nxp.com>; Felipe Balbi <balbi@kernel.org>;
> philippe.schenker@toradex.com; Francesco Dolcini
> <francesco.dolcini@toradex.com>
> Subject: Re: USB runtime PM issues on i.MX6ULL
>=20
> On Wed, Nov 02, 2022 at 10:12:42AM +0000, Jun Li wrote:
> > > > On Tue, Nov 01, 2022 at 03:10:46AM +0000, Jun Li wrote:
> > > > > > On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wrote:
> > > > > > > > I am debugging some unexpected USB behavior on a i.MX6ULL S=
OC,
> > > > > > > > chipidea controller ("fsl,imx6ul-usb") and a fsl mxs usbphy
> > > > > > > > ("fsl,imx6ul-usbphy").
> > > > > > > >
> > > > > > > > The HW design has 2 USB interface, the first one is dual-ro=
le,
> > > > > > > > while the second one is a host port with NO way to re-read
> the
> > > > > > > > VBUS (USB_OTG2_VBUS is not really connected, there is just
> a
> > > > > > > > capacitor to GND).
> > > > > > >
> > > > > > > How is your USB_OTG1_VBUS status? Can you try to make your
> > > > > > > USB_OTG1_VBUS pad has a valid VBUS voltage, then run your Hos=
t
> > > > > > > only port test with runtime PM enabled?
> > > > > >
> > > > > > USB_OTG1_VBUS is tied to GND the same way as USB_OTG2_VBUS, not
> > > > > > really straightforward to do such a test.
> > > > >
> > > > > iMX6ULL need at least one valid VBUS(either from OTG1 or OTG2) as
> > > > > input to power the internal USB LDO if I understand correctly.
> > > > This surprise me a little bit, since
> > > >  - the i.MX6ULL datasheet prescribe to keep the VBUS disconnected i=
f
> > > >    unused
> > >
> > > I think "unused" here means you do not need/enable the port at all.
> > >
> > > >  - downstream NXP kernel seems to work fine ("seems" since we do ha=
ve
> > > >    some patches there, so I could be wrong)
> > >
> > > What do you mean by " downstream NXP kernel seems to work fine"?
> > > The downstream kernel can work on your HW? But upstream kernel
> > > driver does not?
>=20
> Correct, NXP downstream kernel is working fine, upstream kernel requires
> runtime PM disabled to work correctly.
>=20
> > > >  - disabling runtime pm on upstream Linux kernel make it works
> > > >    perfectly, so there is a way in SW to have this HW configuration
> > > >    working.
> > >
> > > Again I want to make sure the both VBUS pads(OTG1 and OTG2) voltage
> > > are always at 0v on your HW, can you double check and confirm?
> > > I ask this again because such situation should cause the USB port
> > > Cannot work at any cases, but your current status is: only low
> > > power wakeup cannot work.
> >
> > Could you please check the voltage of pad of VDD_USB_CAP on your HW?
>=20
> I was about to clarify you this point, it's important and I forgot about
> it, sorry about that!
>=20
> VDD_USB_CAP in our design is connected to a 3.0V external LDO, voltage
> on both VBUS pads is 0V (FYI: this specific hardware design was validated
> by NXP hardware engineers).

Then the HW design should be fine.
I need find time to try the upstream kernel on my iMX6ULL board to check
this.

Li Jun
>=20
> Francesco

