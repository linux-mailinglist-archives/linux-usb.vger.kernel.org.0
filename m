Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77C736160AD
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 11:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiKBKMs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Nov 2022 06:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiKBKMq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 06:12:46 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81426248DC
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 03:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5HIcMMOVj2dOnqzlbr8nW9i78HL2KWZfkjxeAj3x3if5zRCvGPvk/JQCRghWKQ9eVBkrqwUrd5CFuVUwQpaQ0XJWJ00b1uQXabtsewbhbD/7DV4RH52AMLBkeHoc6ogrEqnpYKCR+SqXJZmcxYTRiLOZsFvjxibDaqyKnye1OLtzJj8+LD6gZoi6QIfTt7yADwTbeLly6sl4fp97UG2zrwE/dO+eR2NVi8cxy+vKk5UfKDkZThqDseBEONw57Y5HVVFKHK08Mqva2FpzuQ5QwJWYSzKsybOLb+Lfht5OM9AQJv+FZWqas5v4UOMS/UnPF/gACBEnkJbu8zdFJVN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nG8HrVrwjrFdTRworXd8MYCVIZ2IOI51mJsG8VLptSM=;
 b=BeyQ9OYtf4LAfeSAaFtHS+1m6xhTA0b8T+tJf9+BG/QnVdsb2T39KL5CfuFh7aEsjNeKuaTw0iQs9UkJJeQqQW+hjU++kV7N9pO+i+3CP+FZYlBnLDcLet5HvQ/LlXqSzX39l5qmIWCB3xWtfxNTTZmXUxci7sBkDBGep/wX8b3e2oWtavxe0KPGADA6dGKZ3umQtVhQDuZpOL5/cWiEiFk29/i1vBiIHXApBjx/N1Khg94HcxeIvGbEe5pyTWBAp0oYsUT/jtcHLqwb+QfnfMTPy4a2Pgyx/4k+9BpN2P18OHWidQDquBKTc/X3Xbfkix7hXgi//2EUDAXsuO+iDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nG8HrVrwjrFdTRworXd8MYCVIZ2IOI51mJsG8VLptSM=;
 b=prmd7MRbT+KFUEzBqulXLwPjG7At37lfSEhovb7CRJa2oNkrr5KLQuKrFr7E3eFUfxSeV5ZiaErGE0yKk18Rg/ghqh10Y5qSdhGileoaoJqcAdFg7+qeLU/c+P+Ow5Jrmmr9c/zJKNzMCoLQ2RtgOQeqYWrYykVsaYVpHqbbFL4=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DU2PR04MB8950.eurprd04.prod.outlook.com (2603:10a6:10:2e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 10:12:42 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%9]) with mapi id 15.20.5769.016; Wed, 2 Nov 2022
 10:12:42 +0000
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
Thread-Index: AQHY6slI0uttgXhTUkWibWMoTeyBrq4ohyNwgAADqQCAANZ5gIABH8MAgADk9+CAAAfzYA==
Date:   Wed, 2 Nov 2022 10:12:42 +0000
Message-ID: <PA4PR04MB9640217920D3CD7A506FF9E389399@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
 <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2F4tCMaB4x2fZck@francesco-nb.int.toradex.com>
 <PA4PR04MB9640FA4674C8B80A9FEA44DC89399@PA4PR04MB9640.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB9640FA4674C8B80A9FEA44DC89399@PA4PR04MB9640.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|DU2PR04MB8950:EE_
x-ms-office365-filtering-correlation-id: d3ccc3f5-720f-41cd-23eb-08dabcbac790
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q66cgJpNHrWtnrl5PuNB3/Kza8y+JBwqf0mZMC4nQYjTRHo1mSddplwn4wF1xBVyo6O2mOK7UiMWILLNBoffoZIqa5/vCLnDTjMmfPutxtQi/Hy1FSCxx20ZrTVpGtlkhFZSDh8U4Tnbmgge7D3Pe6ZtPQR6t0tgW2mN8Jnddiaw5PO3mC7RRuXMNWwPDD/Ds7sJw5z5QiGumU0nrxpWeS8ZKf5ZdKe8ki2HpaXkvYE+CpYXkIeR2IdkQC1O8wMStrh6GPYjkIu48qUpVazINWFRTKr7FOV5tVAWM/nH0Zg0c+JWwSkmqzAjNCnZbgkQ6IqBlPSs8ex+bjckOKYpWlTRGcBqwQLnXgmc4sW+nzg24Y8CLlnxHrkgCUvah7QKHAaVMh2Lyl14yYPSaodUBv5KV0h2/kU3937SBqztUEGLlPZOny8mNp2wK3/amyCQ0DGHOrlLvziMwYREPM1y32b/+F7R6yXt9WTgiOy++jabE4vrDA0XC2VG5gqVCMMrfCCJhVUkXYKnzaDIRzAsPMDml8nXywdmrinbWtUjT0CrBkboCX62R2gPg+kCItOA96fRFfrQs1jxhX4rdeZuEV9Y8WeM0oUiDDsO3WkA9AUXLxddsVK4MUBLr5NjdF0Eh87dcuxfu6a+V7kQtay+Oifn6gwuJ6NiQLNgcAhCiuK8ZzP4+tUEshWXictDsMKAD2uhHc25+EFYM8oISCWGOdhbNPv69yeUxN/4m6etM6fj7UMgzcT0v8rQ+/MUrH1lRPG0V71wEKsPak/cRZZhMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(71200400001)(55016003)(7416002)(5660300002)(38100700002)(122000001)(83380400001)(2906002)(86362001)(33656002)(66446008)(38070700005)(2940100002)(6506007)(9686003)(186003)(26005)(53546011)(54906003)(316002)(478600001)(6916009)(52536014)(41300700001)(64756008)(4326008)(66946007)(76116006)(66556008)(8936002)(66476007)(8676002)(7696005)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dQl8yn1mePsLJQmqBSuYnT25dj9XYJBcjMWH+1Xq7CxMD2sO71I6bWLshf2F?=
 =?us-ascii?Q?JhyvXH1s1+MqKvtqZMW2XKFy/A3W3rPcD5wba+S4KYDMucHQpkXDenlZFIni?=
 =?us-ascii?Q?tYfWrpr8Y98AHhGX7lI0RNj18bzWFeOhe+XabjC523MI4ZmbX/EsHOZXTpIl?=
 =?us-ascii?Q?QCJvdHdFx7GhXQoejmFGWvCy0fOtWWwq3DSQHsS8Nvk1AYsmjQnhVUI7QRnj?=
 =?us-ascii?Q?8V41hHLciQE6bykPKwT+HAd//BJaEgi7DwDqw3B/4aYx82CY+Dpi9RZAf5Rg?=
 =?us-ascii?Q?0zweGJE0fHSdeuzzFuxR6ubliwH61jUINZ+H3cWgNteDkPg1w9o2U64QQj0n?=
 =?us-ascii?Q?0gLc1qC1Q7vHNeWFEA8LoJK/tDc0nQvR/CCPjn4AU8rNQy2EVi2EBL7eev/j?=
 =?us-ascii?Q?uWrC+DPu0MMIV7nu5mlO3D4dQAOdFjrRdTvz9Z18w9WbI3/jDEyUPpphNHjD?=
 =?us-ascii?Q?HoHmzBXIdnyEzGR04qCev95xhbhMgw7DOwg5+e8dsxZda4b73TUy2K01P7+F?=
 =?us-ascii?Q?zKKdfhNiDxafi9mUfU9xrx0zu5nCXBNv7cQ3VUwZCfqC+nevQ9E7ZRLMEoYJ?=
 =?us-ascii?Q?ST4XuOEBW+D17xbGLKNmVmXDBwY7XimufEl17GoCKDwnSYPjXxmluse34IDl?=
 =?us-ascii?Q?Cxj4vMLeW0xbD02QmbwxhYJ2aPkmw6WzGZOjSPHsYIodfOeyKsh5CSfKfHcs?=
 =?us-ascii?Q?BoS7FROG/hnBQxzGx5Iz4y0J4w2dq7v4hUW/slFDm2uim8mfnk8yWSLDtnfD?=
 =?us-ascii?Q?Kn83IOVZkFx11KDTkYZKE8n0J7eimLUK77Wsg2ZwG6+EctDAXYhJF3VvDu9t?=
 =?us-ascii?Q?i/XTAgEYBqfo8foIQxksRtyh7enOVFxWURVq+50XSN7zOTJCUBlF8nxIvWEe?=
 =?us-ascii?Q?jmsJXty/Kxnx4FpIYZU3+tplKRoxA83QrYpjY9YRG4FMIvi79I3eAxstitRF?=
 =?us-ascii?Q?qnZdup0WN9LFaR7K5zj58FkQ40w9hS875XCgJyTZ9XH2mbWbGBUSZ/ee3SoI?=
 =?us-ascii?Q?bYAew81c3H2wsa43QY12mANYnYKUMi1sCPbcPgimDDn+imvaJJuiO3RxtJ9S?=
 =?us-ascii?Q?PPSkyZK8JwciJrFN4GcQ41/HXRsf71+OiGNSR3sXwP4w1IwLi5tripFiigQv?=
 =?us-ascii?Q?0Ktlkcb1ICTL+CmL0tArqSPlrHL/5s8bm6uaZdxSGGkQwaF0oU3BFbtAbfCO?=
 =?us-ascii?Q?UqtRAUCl7+rGPVVGeiSPplG8GUxZrKF28/aR8W9YhlBJ9eRRixQs/FfDXh4n?=
 =?us-ascii?Q?Jd9gjzMWchHwdiPCEiez4WK46ihm7wzH9Sbe5djqJHhNtMI0SoAjh9iF3C9g?=
 =?us-ascii?Q?BjmkHG6p6QhIranLqVY/fqAwnmopyZth1AziWdGikaImMu15vS/E+f4Ye9lD?=
 =?us-ascii?Q?CL7EdbytwI3ZwHLm2UD8PnA+CtRUQ986tu7gExzDbi5DB2DLV0nxEnkIrC7Y?=
 =?us-ascii?Q?OxD1fcka7lErTSszz3e0foS79A30gn9DQNRhgPb/lnp0cYsGkg7kQPlRx6Hj?=
 =?us-ascii?Q?GJExPtzuC+Vowu9RjRpJd0ERuLqI1Qo/YkwdlRSicOVnYT+yVK+WfDjQpK6p?=
 =?us-ascii?Q?sAiTjTAdGv35aTUveeI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ccc3f5-720f-41cd-23eb-08dabcbac790
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 10:12:42.4241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kt7ZfKrcxorVsYIf+rZ3G5Xw5KRSLOTgy+SA5o3UzbkHsKhEFyesb5F/nkkB9mY6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8950
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
> From: Jun Li <jun.li@nxp.com>
> Sent: Wednesday, November 2, 2022 5:45 PM
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
> > Sent: Wednesday, November 2, 2022 3:51 AM
> > To: Jun Li <jun.li@nxp.com>
> > Cc: Francesco Dolcini <francesco@dolcini.it>; Jun Li (OSS)
> > <jun.li@oss.nxp.com>; Peter Chen <peter.chen@kernel.org>;
> > linux-usb@vger.kernel.org; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> dl-linux-imx
> > <linux-imx@nxp.com>; Felipe Balbi <balbi@kernel.org>;
> > philippe.schenker@toradex.com; Francesco Dolcini
> > <francesco.dolcini@toradex.com>
> > Subject: Re: USB runtime PM issues on i.MX6ULL
> >
> > Hello Jun Li,
> >
> > On Tue, Nov 01, 2022 at 03:10:46AM +0000, Jun Li wrote:
> > > > On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wrote:
> > > > > > I am debugging some unexpected USB behavior on a i.MX6ULL SOC,
> > > > > > chipidea controller ("fsl,imx6ul-usb") and a fsl mxs usbphy
> > > > > > ("fsl,imx6ul-usbphy").
> > > > > >
> > > > > > The HW design has 2 USB interface, the first one is dual-role,
> > > > > > while the second one is a host port with NO way to re-read the
> > > > > > VBUS (USB_OTG2_VBUS is not really connected, there is just a
> > > > > > capacitor to GND).
> > > > >
> > > > > How is your USB_OTG1_VBUS status? Can you try to make your
> > > > > USB_OTG1_VBUS pad has a valid VBUS voltage, then run your Host
> > > > > only port test with runtime PM enabled?
> > > >
> > > > USB_OTG1_VBUS is tied to GND the same way as USB_OTG2_VBUS, not
> > > > really straightforward to do such a test.
> > >
> > > iMX6ULL need at least one valid VBUS(either from OTG1 or OTG2) as
> > > input to power the internal USB LDO if I understand correctly.
> > This surprise me a little bit, since
> >  - the i.MX6ULL datasheet prescribe to keep the VBUS disconnected if
> >    unused
>=20
> I think "unused" here means you do not need/enable the port at all.
>=20
> >  - downstream NXP kernel seems to work fine ("seems" since we do have
> >    some patches there, so I could be wrong)
>=20
> What do you mean by " downstream NXP kernel seems to work fine"?
> The downstream kernel can work on your HW? But upstream kernel
> driver does not?
>=20
> >  - disabling runtime pm on upstream Linux kernel make it works
> >    perfectly, so there is a way in SW to have this HW configuration
> >    working.
>=20
> Again I want to make sure the both VBUS pads(OTG1 and OTG2) voltage
> are always at 0v on your HW, can you double check and confirm?
> I ask this again because such situation should cause the USB port
> Cannot work at any cases, but your current status is: only low
> power wakeup cannot work.

Could you please check the voltage of pad of VDD_USB_CAP on your HW?

Li Jun
