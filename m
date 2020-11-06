Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8824B2A94FD
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 12:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgKFLH5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 06:07:57 -0500
Received: from mail-eopbgr70044.outbound.protection.outlook.com ([40.107.7.44]:1408
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726422AbgKFLH4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Nov 2020 06:07:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6aLLbT1dB+CV6Y2wVh0YCwrGZau9Umer564tpFejO4ZzppB8g6ouqJT1i4VQYTXDf91qNTTNpMmeRuJgPQ2mHY8Jgx+eHTjESQmQd6V6Gt0fb/rWX2jEfIJwx0VlUdST0zi9p1OSjVXn/gX1cbj8b3gscKeSul5LnbWDVXz+UvypZmYTstnLHj8/TCT9H5BnuyDlM0h+Zk9mM1A4TTULDkRRGVnBRbJPdH6HtkVmZQxz5h8o9unAkdI8AYvAApvqKtZ+0TO1q6+b9Do3gkh5pTKmFtYbyyUWNDVwBb/OIKrYuW1jrqVSD1N1yOAPnJ6QW8V3w1G4kqVRduEW6c1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiVodZRAAXDiDfocbc0/d9G2UMlDh1jhHCjLVqbO87Q=;
 b=kTho4EwAiOqSXSMf/RiaTh183FgyiYLXU1ON0pEb63TZo84S0ZrYVEASvQCiNc2qReeFX5hOSWAkZB32yMNTdlYfZicYBv/O2mD1wNjZcAEKynGW5kk7eSUoGwKd4BXnlJ0aa1WMNPErhlj1QBtLAQXTMU1czicZlcFIdetN/Ypksd4aj7SSFVuxzyQijzl21vH8q0UG7G0UwD6vtANebHKUN9DtKqh/b6wQN1tVNzxLxbCVEjM9UM/giTB0Cl2rrL4jJsA9w0U+Yi4XZgZS6hgHmKcNqfNZtiKRZDQqKmhrU+0YMpLuSmCdJUc4KKY1r2HjEZXLaigp/5Jz471x7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiVodZRAAXDiDfocbc0/d9G2UMlDh1jhHCjLVqbO87Q=;
 b=kDX5VIFoyRLNK5kC0G4xPC164iCmMwZozfhDvF9yGVYV9MGjp1R9frV6/X+evr9IIaOMqNVaCfobP6RQfW+OexmBmvzk8SQKuBKiX42AYxxPM0RWzwcddectqLvEm8UMmHts8IxHQ8T/Yilqpt0Qblx6h/6GIwWn+0Ec9uUnrR4=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5551.eurprd04.prod.outlook.com (2603:10a6:803:d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 11:07:47 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 11:07:46 +0000
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
Subject: RE: [PATCH v5 1/4] dt-bindings: usb: add documentation for typec
 switch simple driver
Thread-Topic: [PATCH v5 1/4] dt-bindings: usb: add documentation for typec
 switch simple driver
Thread-Index: AQHWsdbzASvYBj2HdUCPlXdENcrxN6m6IZeAgACOpnA=
Date:   Fri, 6 Nov 2020 11:07:46 +0000
Message-ID: <VE1PR04MB6528DB5965EFE139C7E0FAFA89ED0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
 <20201105222559.GA1701705@bogus>
In-Reply-To: <20201105222559.GA1701705@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5d15a498-c592-4e8a-d2ad-08d882443150
x-ms-traffictypediagnostic: VI1PR04MB5551:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB555194E012BB6C5151C651D789ED0@VI1PR04MB5551.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pa1ucgy+JmPhhVM83nK6VPHVWFzqlNPhZZyk58Q4xaWd1emygVPgRpvKjETnwn8z176FuVzGTwhT9zu2oHNfgal24nXQ5lhBPLdjPO2z5TzStYUQhCP7YS7GlTLcaobn7DfackkNtYWyvz9sGaprRFCv6SNgwxkEbpVFiocTZ/h2dxqzsg7hdVrvOHE61JcBaiGeztmHMhZqXHKvgKE701Ov5GpwdO6vFdZZiXmohJqZdPuY17l2zzIv1QdPxWZo1cowCkQG2lO+taVmU+uX4BqOE7swXrG3UMZNbiPPhiWSByyish1y5s0YatUdVfohJR7iybtBVpTkCeG5QTmyrCwzqATMG/bYWlxNbYa0JUsd3f8SR68DHA2kUhmz2iX7909q8anE+Mqd88IY8HpXXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(71200400001)(478600001)(7696005)(8676002)(8936002)(54906003)(186003)(44832011)(26005)(33656002)(7416002)(4326008)(6916009)(316002)(45080400002)(5660300002)(6506007)(53546011)(86362001)(2906002)(76116006)(66476007)(66946007)(966005)(52536014)(9686003)(66556008)(66446008)(64756008)(83380400001)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: iNMJYJuFLYSbQiI6C4ROGvuHn7xFMfJtK4hYfJmAxwTOweUBwGiEWlAqTigUUwmpS96hGcb1La8ufMg00Lt21iCgDDm0MI2ERyhlzEtQQnOofHe9MBnJknBkd89kP3CxjmlgRUY6i+sKtfDKTpBc4xUJhWfLSVYYZvq6TKWh5tsOVY/EcsUdwjSSoegBbf51QJ0CalBfYzubbYKKBJnzTkVuMwZwsbLhrOClZA2h4BAOhMk6aTqRnVXZfp0qVHemSaLV1ccia/y83hoHwSfJ/CoYrRnDTgLbEqBd+sdfBEmeFAsMLNamRKlhVVF1wlANjiju5Ta8IJDbIAke5pPAn4jukRviELoIV0ipScCFsWavF8/bYc5s5OMr+wf9OR3ZVmPNWCFClMhLpY3O3eGu+/e1J9afEUcxeeWiv/ou4RDNi/92Jbm2n0FPr3/1jBOBji1i5bm+gz2EVtGMnZsKmjWblfK8TUZs8B7l99NSzYVqFkmp+z2JjDHEs3Y+GQd4EYPmgjtC7VxUxW7nydV2vry285MC4whCufOe4386C4izgruaAykYmK8jv99Xoa9vp2hzPk8qaFB3WSJLyVIWpmVZn6btZ37Ou/jpdBRfp0Ld+T7wqdaJfiWJtt17VoDjWpjYbb8EL/S2pz+aXvra7Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d15a498-c592-4e8a-d2ad-08d882443150
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 11:07:46.8333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H2VkdSsrXh1i9Ukfbcx+NNIw4lMQfFfgy+/ocHhqXQFUco4GZTc1JJjJ3gcz9Y7R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5551
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Friday, November 6, 2020 6:26 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: heikki.krogerus@linux.intel.com; rafael@kernel.org;
> gregkh@linuxfoundation.org; andriy.shevchenko@linux.intel.com;
> hdegoede@redhat.com; lee.jones@linaro.org;
> mika.westerberg@linux.intel.com; dmitry.torokhov@gmail.com;
> prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> <peter.chen@nxp.com>
> Subject: Re: [PATCH v5 1/4] dt-bindings: usb: add documentation for typec
> switch simple driver
>=20
> On Tue, Nov 03, 2020 at 07:40:07PM +0800, Li Jun wrote:
> > Some platforms need a simple driver to do some controls according to
> > typec orientation, this can be extended to be a generic driver with
> > compatible with "typec-orientation-switch".
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
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
> om%7C78ca5205695149e2743208d881d9c753%7C686ea1d3bc2b4c6fa92cd99c5c3016
> >
> 35%7C0%7C0%7C637402119664101856%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> >
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D
> > 8TY%2BPRIui6HhxhYE1%2BLmwWL38Vp7SY1Ceb5rGG%2B4DUo%3D&amp;reserved=3D0
> >
> >  .../bindings/usb/typec-switch-simple.yaml          | 69
> ++++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > new file mode 100644
> > index 0000000..244162d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> >
> +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi
> >
> +cetree.org%2Fschemas%2Fusb%2Ftypec-switch-simple.yaml%23&amp;data=3D04%
> >
> +7C01%7Cjun.li%40nxp.com%7C78ca5205695149e2743208d881d9c753%7C686ea1d3
> >
> +bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637402119664111854%7CUnknown%7CTWF
> >
> +pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> >
> +Mn0%3D%7C1000&amp;sdata=3DHjWfKlDLyqb%2FKLlL6vdnyPe%2BnB8pSllhokIXQ%2Bw
> > +yyw8%3D&amp;reserved=3D0
> > +$schema:
> >
> +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cjun.li%40
> >
> +nxp.com%7C78ca5205695149e2743208d881d9c753%7C686ea1d3bc2b4c6fa92cd99c
> >
> +5c301635%7C0%7C0%7C637402119664111854%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> >
> +iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
> >
> +p;sdata=3Dz0bO47QVl5gw0UE%2Bx3a5E27ALgz568zp%2Bf4suGlch%2Fo%3D&amp;rese
> > +rved=3D0
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
> > +  switch-gpios:
> > +    description: |
> > +      gpio specifier to switch the super speed active channel,
> > +      GPIO_ACTIVE_HIGH: GPIO state high for cc1;
> > +      GPIO_ACTIVE_LOW:  GPIO state low for cc1.
>=20
> What does active mean? There isn't really an active and inactive state, r=
ight?
> It's more a mux selecting 0 or 1 input?

Yes, I will change the description:
gpio specifier to select the target channel of mux.

>=20
> I think you want flags 0 (aka GPIO_ACTIVE_HIGH) unless there's an inverte=
r
> in the middle.

This depends on the switch IC design and board design, leave 2 flags
(GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW) can cover all possible cases.

NXP has 2 diff IC parts for this:
1. PTN36043(used on iMX8MQ)
Output selection control
When SEL=3D0, RX_AP_*/TX_AP_* are connected to RX_CON_2*/TX_CON_2*, and
RX_CON_1*/TX_CON_1* are connected to VDD thru low ohmic resistor.
When SEL=3D1, RX_AP_*/TX_AP_* are connected to RX_CON_1*/TX_CON_1*, and
RX_CON_2*/TX_CON_2* are connected to VDD thru low ohmic resistor.

Board design connects RX_CON_1*/TX_CON_1* to typec connector CC1,
so GPIO_ACTIVE_HIGH

2. CBTU02043(used on iMX8MP)
SEL        Function
--------------------------------------
Low        A to B ports and vice versa
High       A to C ports and vice versa

Board design connects B to typec connector CC1, so GPIO_ACTIVE_LOW

Therefore, we need 2 flags.

>=20
> > +    maxItems: 1
> > +
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +    description: -|
> > +      Connection to the remote endpoint using OF graph bindings that m=
odel
> SS
> > +      data bus to typec connector.
> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          remote-endpoint: true
> > +
> > +        required:
> > +          - remote-endpoint
> > +
> > +    required:
> > +      - endpoint
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
> > +    ptn36043 {
> > +        compatible =3D "typec-orientation-switch";
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&pinctrl_ss_sel>;
> > +        switch-gpios =3D <&gpio3 15 GPIO_ACTIVE_HIGH>;
> > +
> > +        port {
> > +                usb3_data_ss: endpoint {
> > +                        remote-endpoint =3D <&typec_con_ss>;
>=20
> The data goes from the connector to here and then where? You need a conne=
ction
> to the USB host controller.

The orientation switch only need interact with type-c, no any interaction
with USB controller, do we still need a connection to it?

Thanks
Li Jun
>=20
> > +                };
> > +        };
> > +    };
> > --
> > 2.7.4
> >
