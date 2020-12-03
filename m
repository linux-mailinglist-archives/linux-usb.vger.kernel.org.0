Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9072CD578
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 13:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbgLCMZV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 07:25:21 -0500
Received: from mail-vi1eur05on2072.outbound.protection.outlook.com ([40.107.21.72]:3033
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726798AbgLCMZU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Dec 2020 07:25:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTsRGzvGJycC5J4YsS1szwIm/rRUejg2pr1yqtPyJwDeWYP/rx5xc8RtHT1sEvG0y0hFUOOjgyoe7G7XHpR1OgiT3ejOPbWRFMiwExQMuhsyeHgyq4TdydqSGcw/00nkgLhNWeF3VpchR+URHUpC5gt99RCdGfmLWLROwIg7gQUL3hkvm1WiD2gTtubRGR56M2wwmg4O1xE8UULJLQ5y1tVhiD7XsNiFrUFwWlfedXRYS7Xb2jc+X7xOXER/rIXmoqfXs91BCOzrmQWZcO4SESQnZBBrhAwOFV1etJNAIqjt1Fbi6gZWOO2Tv5EkMSFVIQ+YCGZVaATDGYd3eCgAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWAAxhJ4PPqYq2p52YwJoCg2wtz8zyIDw3QuNFZ3BXs=;
 b=WfVH9JcZcIBoGkfofYgMoQLdAEEva600zuQ3N+79QOtUhffQNJi+yqqaldKQRzAFwCwma6BJRVdyfFEhk1rGqSLmPIizv2ZUlKAQRTbfehO39LK3GrFtf7msAjtIpz1DS9FY9wSLc5R5q1dleYJKHreYeqI/tpTLCichJNisUouYB+XNPzhckFF+pb1eylb+t0SfnF6OgtxUplAD2eZY+pdNhptRD0R4L7ZUCNPIHFc171EsPNnYDPVEmmbv397+sAXO8RIkmPp7WpgR9/Y8mdWWHFFO78hooLxSLbX+xSIAV3EbpWFOsD6m56G/2+Pq3bs960WTGTQsu2BvNBMi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWAAxhJ4PPqYq2p52YwJoCg2wtz8zyIDw3QuNFZ3BXs=;
 b=lGZYif1+KrUy+lIBOC8mctudjgZ7onwFOz1WacapLQFMMmLh8o8IUBeW/M3P7iTreZiRo3pSkrmXeiEhoRFwjHMgvYn48i3KO3f4fCtjPdyLH/XqTIrsc4BpNjyU9naYOi1TTktXmNO/8bGQ67C00sTd/8Olv17yUKm0FmBs8PI=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB6189.eurprd04.prod.outlook.com (2603:10a6:803:fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Thu, 3 Dec
 2020 12:24:27 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3632.021; Thu, 3 Dec 2020
 12:24:27 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v6 1/6] dt-bindings: usb: add documentation for typec
 switch simple driver
Thread-Topic: [PATCH v6 1/6] dt-bindings: usb: add documentation for typec
 switch simple driver
Thread-Index: AQHWwaIqJhI1eaFUiU25NknzEOhLJKnhQXgAgABEyBCAA86dUA==
Date:   Thu, 3 Dec 2020 12:24:27 +0000
Message-ID: <VE1PR04MB65284E6A67F8ED5AF98A2D4F89F20@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
 <20201130214716.GA3040203@robh.at.kernel.org>
 <VE1PR04MB6528AAEEBDF31EF8F7A2D9EE89F40@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528AAEEBDF31EF8F7A2D9EE89F40@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4a26fd33-1765-49eb-1579-08d89786609b
x-ms-traffictypediagnostic: VI1PR04MB6189:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB61890B4D58921EEA903A2F3A89F20@VI1PR04MB6189.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N80fKVEWxVNE+FZRib7q+KyUmdeX9kQxSL7XHWtmhrz+RQvEDiN53Qp2jr4Ei6pay2fRsebn1Viu1oBHW8ZDnS7f9xHS2ZRBpNwJemCu2+trymym6V39wQ56Lg84oQRKdygOtoinsnJDk9vHFSjYBqHINGdbVIDo9yx0Z60B1NAlhVK4nNLHtVZFeyZ+Rye17haHCUZKOvBT4j+eN+EXEagLWRm9ui4QLB/IswEcFq5wZ23Eh5M57t/H39uuOnGEqK1PmHGjGT3IQ2m8RSFm2CtHaxRFhPWlz3fzY9kIKm+5E3aN7cOwBcEWqCXlIfnjRS713Zj3R3I5onyu7MYq9GilYxkAzS2DRdkoFF04p91p+LoBoEGeGCUNB4uBuC5HErVhHM7rR0lazhyzdKuB5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39850400004)(4326008)(2906002)(8936002)(5660300002)(64756008)(966005)(66446008)(7696005)(66556008)(76116006)(54906003)(478600001)(83380400001)(66476007)(66946007)(86362001)(45080400002)(316002)(9686003)(8676002)(53546011)(52536014)(55016002)(6506007)(6916009)(7416002)(44832011)(71200400001)(26005)(30864003)(186003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Eco0C9QzaasvkwfonAt2z2jvaSo1cLWprGLyjLG/liRYArsVoT4tMQSrcyKP?=
 =?us-ascii?Q?QObDRqABkzbwyfJUFNXjo4CnGkmD08w3b8OrtF6GsO/r1GnbGVpl95K6rf6w?=
 =?us-ascii?Q?U/w0G0J9VQWmwMY7ORj2DOakJe+qIPUXPrWZYY0+HCg96dbgGxja6g0rdinX?=
 =?us-ascii?Q?1G42KKHz/EugS5xeOvvd+J5t+cZcCTVAmdPNQsSk4/h6IGBnAaBGJPIPkSO4?=
 =?us-ascii?Q?9IlZcbtQb03+3D8c1SUQz6UvXGb5sjy5dQPhLNDxIlaa3dC8J/+OvAgno/p+?=
 =?us-ascii?Q?crkyJqvNUHF9uA6Ubo1mkTR+TOs6hQYaR0W3jtKJe5Zyyl+D3sxjpoXdv7We?=
 =?us-ascii?Q?geJt59AXWQUHMeR2W0paq466TOEsgaWOnJ3GGBslU4Ogg/IXIRg9YIjgr00G?=
 =?us-ascii?Q?6Lxnq84t+Sp0IeX5h3GzKksfJttZEMUP/hQj0KWGvSZOPCPbL7/fo2sKlO63?=
 =?us-ascii?Q?IJTIh0/ALcZ7b7ppYX045bv0N06ekSH9qDPT57aqBsH9O68dt4VWDULlu9jO?=
 =?us-ascii?Q?MqlRj+3LIRkf476LOOxucDGnCDxfAKCDGzpm1b3F2SclXl0j70SWUWUmh3Eg?=
 =?us-ascii?Q?uM9Vcp3Ab5qzRx62dOZH7unnLdUhIS2tJztp1XKjoVzr5SewXefbsfjijQSC?=
 =?us-ascii?Q?4qZo2/j4dB+xICRQZbJLbxUQOtZO8siX5UO7rH/rYTYqrNHHjwaXyG9sCrzB?=
 =?us-ascii?Q?/MWemncMFlSAJX8ghmiInQ4qWlPyxLHLbasq7kWHIJaVgmJCrIMAqg4ygk/Q?=
 =?us-ascii?Q?o4HyK+dcsh4UeshOPKy7IDBgf3ePMUHTU07TpAECUPGxjQK9aWW5vPxMMgvX?=
 =?us-ascii?Q?nxkGROSssqjSmHc0o7t2BkImcNHjGu+5z/MFyw1YJz/i9HbNMo1CgKRIDr6a?=
 =?us-ascii?Q?mUTfLQsqLboptFF5rd8BRFJxxnSgQOel2sRPiKMH/y+6wX3eaGrJRioWd6zC?=
 =?us-ascii?Q?tUbNE+Ap7WumLdJ4c5k+sRdDKDRXh4jr4vkVhdKkVI8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a26fd33-1765-49eb-1579-08d89786609b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 12:24:27.3704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j49jw7TkRpCoWe9cxBK/UfJJ1H9gMXWFq/VUD9GEJvNju48if1sm1EBDGkidDXBu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6189
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob

> -----Original Message-----
> From: Jun Li
> Sent: Tuesday, December 1, 2020 11:13 AM
> To: Rob Herring <robh@kernel.org>
> Cc: heikki.krogerus@linux.intel.com; rafael@kernel.org;
> gregkh@linuxfoundation.org; andriy.shevchenko@linux.intel.com;
> hdegoede@redhat.com; lee.jones@linaro.org;
> mika.westerberg@linux.intel.com; dmitry.torokhov@gmail.com;
> prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> <peter.chen@nxp.com>
> Subject: RE: [PATCH v6 1/6] dt-bindings: usb: add documentation for typec
> switch simple driver
>=20
>=20
>=20
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Tuesday, December 1, 2020 5:47 AM
> > To: Jun Li <jun.li@nxp.com>
> > Cc: heikki.krogerus@linux.intel.com; rafael@kernel.org;
> > gregkh@linuxfoundation.org; andriy.shevchenko@linux.intel.com;
> > hdegoede@redhat.com; lee.jones@linaro.org;
> > mika.westerberg@linux.intel.com; dmitry.torokhov@gmail.com;
> > prabhakar.mahadev-lad.rj@bp.renesas.com;
> > laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> > devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter
> > Chen <peter.chen@nxp.com>
> > Subject: Re: [PATCH v6 1/6] dt-bindings: usb: add documentation for
> > typec switch simple driver
> >
> > On Mon, Nov 23, 2020 at 10:01:31PM +0800, Li Jun wrote:
> > > Some platforms need a simple driver to do some controls according to
> > > typec orientation, this can be extended to be a generic driver with
> > > compatible with "typec-orientation-switch".
> > >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > ---
> > > changes for v6:
> > > - Use general mux bindings for typec switch, one typec switch
> > >   may have 1 or 2 GPIOs for channel selection, if 1 GPIO, only
> > >   can be used to select cc1 or cc2; if 2 GPIOs, the second GPIO
> > >   can be used to deselect both channels or keep normal operations.
> > > - Add one more connection to usb controller.
> > >
> > > No changes for v5.
> > >
> > > changes on v4:
> > > - Use compatible instead of bool property for switch matching.
> > > - Change switch GPIO to be switch simple.
> > > - Change the active channel selection GPIO to be optional.
> > >
> > > previous discussion:
> > >
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fpatch
> > >
> >
> work.ozlabs.org%2Fpatch%2F1054342%2F&amp;data=3D04%7C01%7Cjun.li%40nxp.c
> > >
> >
> om%7C4436142512ac45fef86f08d8957983c2%7C686ea1d3bc2b4c6fa92cd99c5c3016
> > >
> >
> 35%7C0%7C1%7C637423696442152522%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> > >
> >
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D
> > > JCV9OtFkfLv4bH2LIxfnk0lVIO6j830%2F%2Bx2OMOi%2Fs6o%3D&amp;reserved=3D0
> > >
> > >  .../bindings/usb/typec-switch-simple.yaml          | 122
> > +++++++++++++++++++++
> > >  1 file changed, 122 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > > b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > > new file mode 100644
> > > index 0000000..030ade5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > > @@ -0,0 +1,122 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > >
> >
> +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi
> > >
> >
> +cetree.org%2Fschemas%2Fusb%2Ftypec-switch-simple.yaml%23&amp;data=3D04%
> > >
> >
> +7C01%7Cjun.li%40nxp.com%7C4436142512ac45fef86f08d8957983c2%7C686ea1d3
> > >
> >
> +bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637423696442152522%7CUnknown%7CTWF
> > >
> >
> +pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> > >
> >
> +Mn0%3D%7C3000&amp;sdata=3DvSLcoGYWCgwpsi4LWbKo2VTyCVgN%2BA7zjHfE8QCS4rg
> > > +%3D&amp;reserved=3D0
> > > +$schema:
> > >
> >
> +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi
> > >
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cjun.li%40
> > >
> >
> +nxp.com%7C4436142512ac45fef86f08d8957983c2%7C686ea1d3bc2b4c6fa92cd99c
> > >
> >
> +5c301635%7C0%7C1%7C637423696442152522%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> > >
> >
> +iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&am
> > >
> >
> +p;sdata=3D0fd3wjAtKwLCQAY3NG2Be4qNA9FiFhtO0HIZmCK7AQs%3D&amp;reserved=3D=
0
> > > +
> > > +title: Typec Orientation Switch Simple Solution Bindings
> > > +
> > > +maintainers:
> > > +  - Li Jun <jun.li@nxp.com>
> > > +
> > > +description: |-
> > > +  USB SuperSpeed (SS) lanes routing to which side of typec
> > > +connector is
> > > +  decided by orientation, this maybe achieved by some simple
> > > +control like
> > > +  GPIO toggle.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: typec-orientation-switch
> > > +
> > > +  '#mux-control-cells':
> > > +    const: 0
> >
> > Who is the mux-control consumer?
>=20
> Typec(controller)
>=20
>        ptn5110: tcpc@50 {
>                 compatible =3D "nxp,ptn5110";
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pinctrl_typec>;
>                 reg =3D <0x50>;
>                 interrupt-parent =3D <&gpio4>;
>                 interrupts =3D <19 8>;
>                 mux-controls =3D <&typec_switch>;
>                 mux-control-names =3D "mux-typec-switch";
>=20
>                 usb_con: connector {
>                         compatible =3D "usb-c-connector";
>                         ... ...
>                         ports {
>                                 #address-cells =3D <1>;
>                                 #size-cells =3D <0>;
>=20
>                                 port@1 {
>                                         reg =3D <1>;
>                                         typec_con_ss: endpoint {
>                                                 remote-endpoint =3D
> <&usb3_orien_sel>;
>                                         };
>                                 };
>                         };
>                 };
>         };
>=20
> >
> > > +
> > > +  switch-gpios:
> > > +    description: |
> > > +      GPIO specifiers to select the target channel of mux.
> > > +      The first GPIO is for cc1 and cc2 selection, the GPIO flag use
> > > +      GPIO_ACTIVE_HIGH if GPIO physical state high is for cc1; or us=
e
> > > +      GPIO_ACTIVE_LOW if GPIO physical state low is for cc1.
> > > +      The second gpio is to deselect any channles by places all chan=
nels
> > > +      in high-impedance state to reduce current consumption, the
> > > + gpio
> > flag
> > > +      use GPIO_ACTIVE_HIGH if GPIO physical state high is for
> > > +      high-impedance state (so low for normal operations); or Use
> > > +      GPIO_ACTIVE_LOW if GPIO physical state low is for high-impedan=
ce
> > > +      state(so high for normal operations).
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  idle-state:
> > > +    description: -|
> > > +      For TYPEC_ORIENTATION_NONE by deselect both channels if suppor=
ted.
> > > +    const: 2
> > > +
> > > +  # Standard properties described in  #
> > > + Documentation/devicetree/bindings/mux/mux-controller.txt
> > > +
> > > +  port:
> > > +    type: object
> > > +    additionalProperties: false
> > > +    description: -|
> > > +      Connection to the remote endpoint using OF graph bindings that
> model
> > > +      SS data bus to typec connector.
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +      endpoint@0:
> > > +        type: object
> > > +        description: Endpoint connected to typec connector.
> > > +        additionalProperties: false
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +          remote-endpoint: true
> > > +
> > > +        required:
> > > +          - remote-endpoint
> > > +
> > > +      endpoint@1:
> > > +        type: object
> > > +        description: Endpoint connected to usb controller.
> > > +        additionalProperties: false
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 1
> > > +          remote-endpoint: true
> > > +
> > > +        required:
> > > +          - remote-endpoint
> > > +
> > > +    required:
> > > +      - endpoint@0
> > > +
> > > +required:
> > > +  - compatible
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    typec_switch: mux-controller {
> > > +        compatible =3D "typec-orientation-switch";
> > > +        #mux-control-cells =3D <0>;
> > > +        pinctrl-names =3D "default";
> > > +        pinctrl-0 =3D <&pinctrl_ss_sel>;
> > > +        switch-gpios =3D <&gpio3 15 GPIO_ACTIVE_HIGH>,
> > > +                       <&gpio2 20 GPIO_ACTIVE_HIGH>;
> > > +        idle-state =3D <2>;
> > > +
> > > +        port {
> > > +                #address-cells =3D <1>;
> > > +                #size-cells =3D <0>;
> > > +
> > > +                usb3_orien_sel: endpoint@0 {
> > > +                        reg =3D <0>;
> > > +                        remote-endpoint =3D <&typec_con_ss>;
> > > +                };
> > > +
> > > +                usb3_con_data: endpoint@1 {
> > > +                        reg =3D <1>;
> > > +                        remote-endpoint =3D <&dwc3_0>;
> > > +                };
> > > +        };
> >
> > This still seems unnecessarily complicated. What I had in mind is just
> > something like this:
> >
> > mux: mux-controller {
> >   compatible =3D "gpio-mux";
> >   #mux-control-cells =3D <0>;
> >   mux-gpios =3D <&gpio3 15 GPIO_ACTIVE_HIGH>,
> >               <&gpio2 20 GPIO_ACTIVE_HIGH>;
> >   idle-state =3D <2>;
> > };
> >
> > connector {
> >   compatible =3D "usb-c-connector";
> >   mux-controls =3D <&mux>;
> >   ...
> > };
> >
> > Then you aren't re-implementing the gpio-mux driver.
> >
> > This should work for *any* mux implementation as long as the mux
> > states always have the same meanings from the perspective of the connec=
tor.
> >
> > Of course, I have little visibility into the possible h/w
> > implementations for Type-C and maybe this isn't sufficient. So input
> > from Type-C experts would be helpful.

More thinking of this, I have a proposal like this:

 34         mux: mux-controller {
 33                 compatible =3D "gpio-mux";
 32                 #mux-control-cells =3D <0>;
 29                 switch-gpios =3D <&gpio4 20 GPIO_ACTIVE_LOW>,
 28                                 <&gpio2 20 GPIO_ACTIVE_HIGH>;
 27                 idle-state =3D <2>;
 26         };
 25

Then I don't need re-implement the gpio-mux driver.

 24         typec_switch {
 23                 compatible =3D "typec-orientation-switch";
 22                 mux-controls =3D <&mux>;
 21                 mux-control-names =3D "mux-typec-switch";
 20
 19                 port {
 18                         usb3_data_ss: endpoint@0 {
 17                                 remote-endpoint =3D <&typec_con_ss>;
 16                         };
 15                 };
 14         };

The simple typec switch driver as the consumer of mux-control,
and also as the provider of typec_switch to typec class, this
can be extended to use other mux solutions.

 31                 usb_con: connector {
 30                         compatible =3D "usb-c-connector";
 29                         label =3D "USB-C";
 20                         ... ...
 19                         ports {
 18                                 #address-cells =3D <1>;
 17                                 #size-cells =3D <0>;
 16
 15                                 port@1 {
 14                                         reg =3D <1>;
 13                                         typec_con_ss: endpoint {
 12                                                 remote-endpoint =3D <&u=
sb3_data_ss>;
 11                                         };
 10                                 };
  9                         };
  8                 };

Then existing typec mux interface can be kept, is this making sense
to you?

Thanks
Li Jun

>=20
> From h/w point view, this can work if only consider my(GPIO) case.
> But I still need register a typec switch in provider side to make it unde=
r
> the unified typec switch interface:
>=20
>   7 struct typec_switch {
>   6         struct device dev;
>   5         typec_switch_set_fn_t set;
>   4         struct mux_control *mux_ctrl;
>   3 };
>=20
> typec_switch->dev.parent =3D mux_chip->dev;
>=20
> So either I put the typec switch creation in exiting mux-gpio driver; or
> I create a new typec switch driver with gpio mux code duplication.
>=20
> If I go directly with mux control w/o(out of) typec_switch, then I don't
> need any driver change as you expect, but I guess this is not preferred,
> @Heikki, any comments?
>=20
> Thanks
> Li Jun
>=20
> >
> > Rob
