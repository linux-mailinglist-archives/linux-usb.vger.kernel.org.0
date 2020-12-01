Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D302C95A4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 04:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbgLADN4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 22:13:56 -0500
Received: from mail-eopbgr20083.outbound.protection.outlook.com ([40.107.2.83]:64047
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727175AbgLADN4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 22:13:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+CZ64mWRWN6VJgvD9yfuADj2N4Z2vEUbYskdYm6bbCiH4nF3vIBsqP3vTH2y1wye3MIvCmXuUSEGfyhDNXCOE7Qq3yTQmmE0bdoHhOj8TQ6cwUzfV6v+cQq9vtUu0ggEum07dYfLHuc8I4eGTjTqlMVT613i9Rzs3f/HX9pBNA2g7bZNHuO5++nj2jlxxR0m5BKNXMf9ukbD7YdacJMs+ff2W6heZAlfn+6e9x7lMKt+ZVt8cW3Z0EO87UJBAsQCPnwxGxaCMQ2Dij85vlwedIlNZ8SNrVksr2R4MB/1dBxdspTUUTcyiM0JzueKRp/05vIdCrApwoFPCrfOoFR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV2zlB5puPx6bFT/dsSZnSEDF3bBX9Co/y2efrYKudk=;
 b=j+ayFSaiUN870ojIJZyvy9OsYz82ImS1colg0RoqEBW6aSPmCBfnZpc5SzPFNI32iTk9WKiv2QMewCSxfXJfvnwL1ChUJODfRfdlKGODknLfI+kOngyIYXYQ122+vxsAqHJzwaKKRr9ouWGttFymnk7g6e08VOJFvvNgtkBw2eslqKhnRXwDqMjBX1+0ZsvRwyC4BzDdZGySJ7QPjB+cJE1nKK7SiqWNTYIEITD1NOFxLYqeRlIYyPzPQyRb1EQM+dXgAxWMAn9ZslrqoZuX5RTmAD4DFdw/epkUSNMFoF2S3SLDYPXizVBrdJcgN6cncYEzbMlARtAlbflvXSMZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV2zlB5puPx6bFT/dsSZnSEDF3bBX9Co/y2efrYKudk=;
 b=gWbgVxyQgamJTqBdFqLAW83iefXZDZrzgjVqKOF8DDpYs0R9QsLGRGAqMr2296+kxU5X7G5bEa3l8bKiPzjx7W/q7DCBZDjszlF0XPmE6l8g85U5cyh0h8j/IBmy5S8Szsph7SvMtMdtHZ4Ppnyz4DCUnb4447zZj7gWSBC4sbI=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 03:13:06 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3611.032; Tue, 1 Dec 2020
 03:13:06 +0000
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
Thread-Index: AQHWwaIqJhI1eaFUiU25NknzEOhLJKnhQXgAgABEyBA=
Date:   Tue, 1 Dec 2020 03:13:05 +0000
Message-ID: <VE1PR04MB6528AAEEBDF31EF8F7A2D9EE89F40@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
 <20201130214716.GA3040203@robh.at.kernel.org>
In-Reply-To: <20201130214716.GA3040203@robh.at.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0e63fe3b-d391-488b-117a-08d895a705ab
x-ms-traffictypediagnostic: VI1PR0402MB3359:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB33599FEF68C4AECFB2382BC589F40@VI1PR0402MB3359.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NI0QTx942wvs/AmNZSXoAHvMwnKz9YIE1bh6STehBVKADNiGjH95ktSllIWfGEFfa8VepdIkC+MFbxXrHglf5NqWFthr+26KkqLWo5Yz1xwx0geM3OVjKVRW3b0RGB/VlrX1BiFGODC0z9/DJ8VScz4bpcZpuSJWOwDukEUqMtp4YxzkMpSJSxe0qCUfE/jVUAi18jmUPKOAJcj7FjocisCeDQT/gIfWNvaKOeYjpCCZpWSrsXX5zW/i2iBEAO5IBjBdRIr7MAhS9FvCLzLFekZ5IX+yNHLkyJZg8XtC542S9NfxqF8WXokjmzuU7K6/41Uv2WBCl/VjChU2lFG8CkimbUU0sJqe8QYetm0Otz8+iHsusZ5sowss4WMUrCBZJR/bd6xvj2+KGjBpCbQ2Ww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(2906002)(8676002)(44832011)(76116006)(66476007)(6506007)(66446008)(966005)(45080400002)(64756008)(33656002)(66946007)(66556008)(54906003)(186003)(478600001)(316002)(55016002)(83380400001)(7696005)(9686003)(4326008)(6916009)(71200400001)(7416002)(52536014)(26005)(53546011)(8936002)(86362001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?kQSlAdplzcEqwj1QMLpxd7yD+zOhL0Uzoo8Fm9Oxtb3djnKjuehef1xjxaEV?=
 =?us-ascii?Q?DHS6cCYD9OMzn0zq29PgCsB4quf4dqEnEIdu+yjtBXs9mWFgzZmYdds2XyKv?=
 =?us-ascii?Q?iUhmZ3CRy3YvbO6ojEdIPbFbJoUU8SO9GA5Ee6NTYlDiiv+L7S2EBbJYRRVi?=
 =?us-ascii?Q?JRFA6dj+v3jbEZtnSI/KmlT43nTmQQAVRGcVByCpbFJvnbhTDTRjnB3D5a/R?=
 =?us-ascii?Q?R46VZgmXcVUECQr2d1Ur7kTE6o1zJaMnw+5WdXMVxgMX5gitwfKa6YaV03Ob?=
 =?us-ascii?Q?GhUfmL/01OVB3U8XUKjMF/AKdr1LmbmaF2L+3sWDGfMgaT8IDF+0tBXaHHWj?=
 =?us-ascii?Q?1EKDl8lBSL3J2Uwwy2HdXlt5QfaRwR30Oa+2LtHhFUC0mP7TotFf7w51WfXn?=
 =?us-ascii?Q?/Vx4BKv1QBy97EXpjfU8oKMZMgKe+2XqUxCIr3zrAgE6OBoAKm71LhirDxGK?=
 =?us-ascii?Q?6v9mSTqdQj26rcc/gjXVvwdAmaHmVsFmaX7Ln9xH+h6Vt2y2RyV991crmURv?=
 =?us-ascii?Q?tNaoER3NtzEB6JVuNYDq2RGehG+m+3kMG0BMyyXgrok6s3PL5Jwc9Zszcbmq?=
 =?us-ascii?Q?5sjJsQuaRTJY+eBpLmM/4/yrnV3rfkP3nBNCDEdJI9WG15JWaGlrj/kESv1m?=
 =?us-ascii?Q?ePB5OiSNGWNbl85QqBaDO9DIz2t12wOr9CpoKZXU2v0cF4VakUibDHkOzj6A?=
 =?us-ascii?Q?pfHLnddFjeUOhiOekNyMkjPrN0hlFXwYX9q+qOkI0X5Qt0j/73r6NQbelCga?=
 =?us-ascii?Q?mEH0m5R5S/ZGWLCELP4UM2tKhvDMZuUJTf5VhnoUJOK3nu8u8oA0TZVcjzqx?=
 =?us-ascii?Q?Pc2D/8R+9ssHCoLw9kruAzSqN8tNpjbJqf8jAi1o3Mjyna4cEkdC3OrsfzSj?=
 =?us-ascii?Q?sLKHiTec7XOpRxgy5dqnUPVfbtrIDGKxAYGjDv6S7Pv54AAKBtsiwJo+5jLb?=
 =?us-ascii?Q?N7XACnVv/78DiuQxd6Ei4GOR0qngEfeCAVRglRKI3wc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e63fe3b-d391-488b-117a-08d895a705ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 03:13:05.8760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nkD7M2DUz+PgeX/ehzphbRabAu6NPn69sQqZP83/zsObWMKeAnSnyrk1o+Fkvd1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3359
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, December 1, 2020 5:47 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: heikki.krogerus@linux.intel.com; rafael@kernel.org;
> gregkh@linuxfoundation.org; andriy.shevchenko@linux.intel.com;
> hdegoede@redhat.com; lee.jones@linaro.org;
> mika.westerberg@linux.intel.com; dmitry.torokhov@gmail.com;
> prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> <peter.chen@nxp.com>
> Subject: Re: [PATCH v6 1/6] dt-bindings: usb: add documentation for typec
> switch simple driver
>=20
> On Mon, Nov 23, 2020 at 10:01:31PM +0800, Li Jun wrote:
> > Some platforms need a simple driver to do some controls according to
> > typec orientation, this can be extended to be a generic driver with
> > compatible with "typec-orientation-switch".
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> > changes for v6:
> > - Use general mux bindings for typec switch, one typec switch
> >   may have 1 or 2 GPIOs for channel selection, if 1 GPIO, only
> >   can be used to select cc1 or cc2; if 2 GPIOs, the second GPIO
> >   can be used to deselect both channels or keep normal operations.
> > - Add one more connection to usb controller.
> >
> > No changes for v5.
> >
> > changes on v4:
> > - Use compatible instead of bool property for switch matching.
> > - Change switch GPIO to be switch simple.
> > - Change the active channel selection GPIO to be optional.
> >
> > previous discussion:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fpatch
> >
> work.ozlabs.org%2Fpatch%2F1054342%2F&amp;data=3D04%7C01%7Cjun.li%40nxp.c
> >
> om%7C4436142512ac45fef86f08d8957983c2%7C686ea1d3bc2b4c6fa92cd99c5c3016
> >
> 35%7C0%7C1%7C637423696442152522%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> >
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D
> > JCV9OtFkfLv4bH2LIxfnk0lVIO6j830%2F%2Bx2OMOi%2Fs6o%3D&amp;reserved=3D0
> >
> >  .../bindings/usb/typec-switch-simple.yaml          | 122
> +++++++++++++++++++++
> >  1 file changed, 122 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > new file mode 100644
> > index 0000000..030ade5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > @@ -0,0 +1,122 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> >
> +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi
> >
> +cetree.org%2Fschemas%2Fusb%2Ftypec-switch-simple.yaml%23&amp;data=3D04%
> >
> +7C01%7Cjun.li%40nxp.com%7C4436142512ac45fef86f08d8957983c2%7C686ea1d3
> >
> +bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637423696442152522%7CUnknown%7CTWF
> >
> +pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> >
> +Mn0%3D%7C3000&amp;sdata=3DvSLcoGYWCgwpsi4LWbKo2VTyCVgN%2BA7zjHfE8QCS4rg
> > +%3D&amp;reserved=3D0
> > +$schema:
> >
> +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cjun.li%40
> >
> +nxp.com%7C4436142512ac45fef86f08d8957983c2%7C686ea1d3bc2b4c6fa92cd99c
> >
> +5c301635%7C0%7C1%7C637423696442152522%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> >
> +iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&am
> >
> +p;sdata=3D0fd3wjAtKwLCQAY3NG2Be4qNA9FiFhtO0HIZmCK7AQs%3D&amp;reserved=3D=
0
> > +
> > +title: Typec Orientation Switch Simple Solution Bindings
> > +
> > +maintainers:
> > +  - Li Jun <jun.li@nxp.com>
> > +
> > +description: |-
> > +  USB SuperSpeed (SS) lanes routing to which side of typec connector
> > +is
> > +  decided by orientation, this maybe achieved by some simple control
> > +like
> > +  GPIO toggle.
> > +
> > +properties:
> > +  compatible:
> > +    const: typec-orientation-switch
> > +
> > +  '#mux-control-cells':
> > +    const: 0
>=20
> Who is the mux-control consumer?

Typec(controller)

       ptn5110: tcpc@50 {
                compatible =3D "nxp,ptn5110";
                pinctrl-names =3D "default";
                pinctrl-0 =3D <&pinctrl_typec>;
                reg =3D <0x50>;
                interrupt-parent =3D <&gpio4>;
                interrupts =3D <19 8>;
                mux-controls =3D <&typec_switch>;
                mux-control-names =3D "mux-typec-switch";

                usb_con: connector {
                        compatible =3D "usb-c-connector";
                        ... ...
                        ports {
                                #address-cells =3D <1>;
                                #size-cells =3D <0>;

                                port@1 {
                                        reg =3D <1>;
                                        typec_con_ss: endpoint {
                                                remote-endpoint =3D <&usb3_=
orien_sel>;
                                        };
                                };
                        };
                };
        };

>=20
> > +
> > +  switch-gpios:
> > +    description: |
> > +      GPIO specifiers to select the target channel of mux.
> > +      The first GPIO is for cc1 and cc2 selection, the GPIO flag use
> > +      GPIO_ACTIVE_HIGH if GPIO physical state high is for cc1; or use
> > +      GPIO_ACTIVE_LOW if GPIO physical state low is for cc1.
> > +      The second gpio is to deselect any channles by places all channe=
ls
> > +      in high-impedance state to reduce current consumption, the gpio
> flag
> > +      use GPIO_ACTIVE_HIGH if GPIO physical state high is for
> > +      high-impedance state (so low for normal operations); or Use
> > +      GPIO_ACTIVE_LOW if GPIO physical state low is for high-impedance
> > +      state(so high for normal operations).
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  idle-state:
> > +    description: -|
> > +      For TYPEC_ORIENTATION_NONE by deselect both channels if supporte=
d.
> > +    const: 2
> > +
> > +  # Standard properties described in
> > +  # Documentation/devicetree/bindings/mux/mux-controller.txt
> > +
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +    description: -|
> > +      Connection to the remote endpoint using OF graph bindings that m=
odel
> > +      SS data bus to typec connector.
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      endpoint@0:
> > +        type: object
> > +        description: Endpoint connected to typec connector.
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +          remote-endpoint: true
> > +
> > +        required:
> > +          - remote-endpoint
> > +
> > +      endpoint@1:
> > +        type: object
> > +        description: Endpoint connected to usb controller.
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            const: 1
> > +          remote-endpoint: true
> > +
> > +        required:
> > +          - remote-endpoint
> > +
> > +    required:
> > +      - endpoint@0
> > +
> > +required:
> > +  - compatible
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    typec_switch: mux-controller {
> > +        compatible =3D "typec-orientation-switch";
> > +        #mux-control-cells =3D <0>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&pinctrl_ss_sel>;
> > +        switch-gpios =3D <&gpio3 15 GPIO_ACTIVE_HIGH>,
> > +                       <&gpio2 20 GPIO_ACTIVE_HIGH>;
> > +        idle-state =3D <2>;
> > +
> > +        port {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                usb3_orien_sel: endpoint@0 {
> > +                        reg =3D <0>;
> > +                        remote-endpoint =3D <&typec_con_ss>;
> > +                };
> > +
> > +                usb3_con_data: endpoint@1 {
> > +                        reg =3D <1>;
> > +                        remote-endpoint =3D <&dwc3_0>;
> > +                };
> > +        };
>=20
> This still seems unnecessarily complicated. What I had in mind is just
> something like this:
>=20
> mux: mux-controller {
>   compatible =3D "gpio-mux";
>   #mux-control-cells =3D <0>;
>   mux-gpios =3D <&gpio3 15 GPIO_ACTIVE_HIGH>,
>               <&gpio2 20 GPIO_ACTIVE_HIGH>;
>   idle-state =3D <2>;
> };
>=20
> connector {
>   compatible =3D "usb-c-connector";
>   mux-controls =3D <&mux>;
>   ...
> };
>=20
> Then you aren't re-implementing the gpio-mux driver.
>=20
> This should work for *any* mux implementation as long as the mux states a=
lways
> have the same meanings from the perspective of the connector.
>
> Of course, I have little visibility into the possible h/w implementations
> for Type-C and maybe this isn't sufficient. So input from Type-C experts
> would be helpful.

From h/w point view, this can work if only consider my(GPIO) case.
But I still need register a typec switch in provider side to make it
under the unified typec switch interface:

  7 struct typec_switch {
  6         struct device dev;
  5         typec_switch_set_fn_t set;
  4         struct mux_control *mux_ctrl;
  3 };

typec_switch->dev.parent =3D mux_chip->dev;

So either I put the typec switch creation in exiting mux-gpio driver; or
I create a new typec switch driver with gpio mux code duplication.

If I go directly with mux control w/o(out of) typec_switch, then I don't
need any driver change as you expect, but I guess this is not preferred,
@Heikki, any comments?

Thanks
Li Jun

>=20
> Rob
