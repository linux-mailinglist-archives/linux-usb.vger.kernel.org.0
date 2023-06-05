Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDC6721BB2
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 03:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbjFEBzO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jun 2023 21:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjFEBzN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 21:55:13 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE57BC;
        Sun,  4 Jun 2023 18:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn86g7ZDR7AcgGXg1ZQXtBKGNNLFUMiLJtwabViM9GXmSzhbEUtIfYr/Yhsi483EBGhcOqPf1F9TP51YOwjWm/e74174nl/OBaG0hH+qlN6xnL54/es/gTa8MLm7CPsosghKsf/XzPd1E2Idh02CaMMdvldx2SebLp6shrKOHMxbGFz8QuhwKgIuKh84gNIPdQEAXwT3qwQrxX423HQJzojLOZRmk3Jt2bXAK2+WPRRS3AUtfEDgP2rYM05pLvAJVoqdn0l9aKYsPmXJ1EoTc5MfYuraj3JnJr7SFIsv34cFeXKNtJHZqWiQ392AsgvuPfFlSqcbutxeq4FxLVfadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WVS7OecmavH75aeok5RGrcqxK+QT9uLETQztDC9f18=;
 b=mpEhbcm4z6psOuuYi84tfT8AvPbXAa8qL4WYmwB94MI0KeJMkiA+XobavVZubU9j8cpyj5SZr54yny0HnfMdDMzKSaIWLcDbYW7RUuM9UG/NKf+tf+pH4iVy4LYIghmQ0cMwAVKxjKxw6L0D/u9f6ZopkmyRSFGoNoLH5p8hB257I8/aynJvIaaqkCckJRq0Fbl2lmKo4/t8LAB/lEbivNb+dy2GhSAFhzQH1hCmAjn6RtrBAC3XQLUnO02NDOfP1hgo9a5vE4wAal48jGWpgc8t3xbM3noiE9xw5fUl5z746RJNRL0dL5AbrYn7B3wfghK3DGAGc4ZQ3TDOUATR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WVS7OecmavH75aeok5RGrcqxK+QT9uLETQztDC9f18=;
 b=A/8e8zXVHwz33FcC4gLDL6BmMz8BdCKrpdlwsIvCGrLZ1fZ3pJy7Nv58/LyIdoikO2yz7t6ri74cRulAqxvXfGeU+Idh2FPNuXxfWBcmmAw7lnav3Sk5q4pyu8Jb5of/CtqmSBl36dwLWSlpD+I/hoPuzFFSANOLEq+quuooyts=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM7PR04MB7062.eurprd04.prod.outlook.com (2603:10a6:20b:122::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 01:55:08 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 01:55:08 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH 1/2] dt-bindings: phy: mxs-usb-phy: convert to
 DT schema format
Thread-Topic: [EXT] Re: [PATCH 1/2] dt-bindings: phy: mxs-usb-phy: convert to
 DT schema format
Thread-Index: AQHZlF+pwK9lWUiMHkaFQ3Z0T3IvxK93f8sAgAP4UqA=
Date:   Mon, 5 Jun 2023 01:55:08 +0000
Message-ID: <DB7PR04MB450514500C0F1C8FB087BD7A8C4DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230601080723.1556461-1-xu.yang_2@nxp.com>
 <a1c109c9-9cf7-be76-df8f-74259559acb7@linaro.org>
In-Reply-To: <a1c109c9-9cf7-be76-df8f-74259559acb7@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AM7PR04MB7062:EE_
x-ms-office365-filtering-correlation-id: 1e111c18-181c-40c9-7354-08db6567e436
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vEepAV8UWhj6sZs1Hx+Jl1Pgxiq9LIl4gSSh9yBU6SibnAAOpGNp5M2vAOqetCUsCciz6sm5RaWRGts1MlIL9w3GsiXjsCTK7kPnzgCnLO1OjtFbfp2KpWq69FHd1SfNMR2tq56OJtsEKSKh1qKp7C0VQFsVPlbz+Z6jCuzbLSzkdlh/dwKD+VVpmnsDQgorpFKvPhi4dSTwILbt8hYQYWIxFF0R4LlPRuW2a0dATK8vL6UqAMAtMTGMbTGxGTjTHkREoRZ33DhxmT2BR71JWFtAcTtBmpOrenU/komQxjSkt7x8rdOQDmprsFT67Ht+CdI56cGrdi2nJLJRJK061yHfkTcSj6QeW+8uOivOF4iDX+ByR61lR8AdFrfUrns4iICr3GZVJfwOxwa+iDrEamX/IuECq4xT5HoZjqBDmwcOsxlU2s4Tpoz5f3WsayHla+jlwR6xmlezPb4dGYixCXgaDNV5bjRse8yVwQ3piEyAFzvIw2tm27apyU1eTu3UbojStKNVRor5F1Gozq388mkKAAh2jI1fmCvyhqOye5R5NCv3aV62YF3yEI0y+PIGgUjTZ25EK03HlpNewzmuVv3C8rBB5vOfta2pn8BpvBU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39850400004)(366004)(346002)(451199021)(38070700005)(2906002)(86362001)(33656002)(7416002)(5660300002)(52536014)(55016003)(83380400001)(71200400001)(7696005)(966005)(186003)(26005)(6506007)(53546011)(9686003)(478600001)(110136005)(54906003)(76116006)(66446008)(122000001)(316002)(38100700002)(66476007)(64756008)(4326008)(66946007)(41300700001)(66556008)(45080400002)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N9pJ++I8eJ79Al4XR5oV9bLYbkOAeuZlER2gGFWwZzziTMM5Eg1HVSUUwcq7?=
 =?us-ascii?Q?PEAt080lQS0XCRLkD+qNQZfDwvbIaeXZvNjMLWMnCWfjD0/9pZTg7X5x+PM0?=
 =?us-ascii?Q?TlP2Szyx9jZSXhBikhxo8dnZNu3CJCurnu8GU1+6nceKCgx9r78lpmdmIGUn?=
 =?us-ascii?Q?ScIHDJ+OtAF+L1EiF6o1tMQAdO42sQE+HGNTp1IWP77vUpZuTkkFs1qkMVhw?=
 =?us-ascii?Q?17usk997V2UOsN1sV+fVrGTKdhs2Wloc/V676Vu45/W+1CvmI1a+p1Ug0+4T?=
 =?us-ascii?Q?zD/lWbmGTCpKPtARYhMXogaywQLar5qXy32Bfv6Z569In54LaMLJodDsvWHj?=
 =?us-ascii?Q?itxDfE9r26SN8FF/wXHfjJ1pT1l95gyIPbfnjCE61MR9Gq0tdk7d4omyxnQD?=
 =?us-ascii?Q?7Fufj54qpl/9ZQ0HmVCMZPjY2qWPFAIUBQ1mDK3lSv+tVHjApw77Z+1hY6sR?=
 =?us-ascii?Q?5/E+Xomtcve4EcQ8+/NcXIaDopPTA8f3vOGK3GQipMcW4fuu40lK3TVb/mFf?=
 =?us-ascii?Q?4sdBOthEHVcrgrfGjpv95zMjtT0m7STibASGQvQD1W0XDd4QL8/hQ2mtwHxg?=
 =?us-ascii?Q?CqO/abO91Q/lPB7RhYM3SREM5ynGRHHmTtH13HBneXEiZai6KbJTD+WXZHAV?=
 =?us-ascii?Q?GJPYlNMDqVu7gC7lvfgVsRiyM9LWZLjDVG4BVuLlDs87XfNo8JCUfLCqJg0m?=
 =?us-ascii?Q?36Ca3X45r70SNH0V3I09NH4+4DiuFkM+23Qadh8nvMFhFXJuxHP807UuvKEx?=
 =?us-ascii?Q?EP0HW6BN31SuxwuEY8bDbDtDEjArYKMobN7o9acBS97/ShGZeg3jRlJFTmBI?=
 =?us-ascii?Q?GaNgpYGflG1iVPT1buLXfnpUH6UieovWrJvtcpYmiliAcWuSEffLHNBfdq+B?=
 =?us-ascii?Q?GM0d9OQY+bZbpRt3vPOZkcPdX106ACNLo+k2kIbNOVqVER0kC55+gioNkGgo?=
 =?us-ascii?Q?giPDSrn+Mb8pXyciGvyfFf65oZKCwoBY9UnZNCbAuUmpawFZbVD/sqEtL6hh?=
 =?us-ascii?Q?uFwWmIt+UkjptM8nReb2SLgLfSjtm7H/nud+g8LR5WO/Je+q0MPUN/7896V3?=
 =?us-ascii?Q?kvzcizkOBmbvGfgAF8TO+6nHdiA/tdme3nbjPZMC2NenSga3WM+Qv+53DFZ7?=
 =?us-ascii?Q?CEG1IGjXrl7LqDzet5jdlFCfwOQtcnPRQGJvjHuCv6wZYVdhvHYSsx59E1AW?=
 =?us-ascii?Q?97DePsBRB5bJB8sHu8iiVJede4j/ZVeq6VdzU+VVOXSgntMggbuYqDNOq3Uu?=
 =?us-ascii?Q?hcpVc/5Ym/ZI42Aqlg7kM9K1nvwM/3yyNxJLCAlKa+Kf4B/iHatPTgg8Xwzw?=
 =?us-ascii?Q?QTqCYJbBo2IkHfLDM7K8n/yJR7a3mKf5C+FKVDgffV9wlCZMNh5AFQWuNlQx?=
 =?us-ascii?Q?mwhXTNP+kwRXLWWh8HVWz7kzOKoubHQNPunHY9cLmJptnF/QPBbyUskWBmDY?=
 =?us-ascii?Q?VI64tKACykTLpr5nLbU76rjpWPt+Yp6ZwhoTcOhQsbmhD03PSxySvN9NXMzQ?=
 =?us-ascii?Q?2vFusAu+ppiI1Pbxlh5l2xwHOxUQ6l93SEtRrShRUDCr5uxS413jpjT2wMHG?=
 =?us-ascii?Q?JHoJODB84OyhhAoWnzI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e111c18-181c-40c9-7354-08db6567e436
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 01:55:08.7676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NR+cWBoQmUFSwW2c1rnWkjrDm/Ax5NJ9jyorLOeEbVma9hyvJq7LfShFKcTfGS8pue5gJGnk/el5nSdJiBTmBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7062
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Friday, June 2, 2023 9:15 PM
> To: Xu Yang <xu.yang_2@nxp.com>; robh+dt@kernel.org; krzysztof.kozlowski+=
dt@linaro.org; conor+dt@kernel.org
> Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de; f=
estevam@gmail.com; dl-linux-imx <linux-
> imx@nxp.com>; linux-phy@lists.infradead.org; devicetree@vger.kernel.org; =
linux-arm-kernel@lists.infradead.org; linux-
> usb@vger.kernel.org; Jun Li <jun.li@nxp.com>
> Subject: [EXT] Re: [PATCH 1/2] dt-bindings: phy: mxs-usb-phy: convert to =
DT schema format
>
> Caution: This is an external email. Please take care when clicking links =
or opening attachments. When in doubt, report the
> message using the 'Report this email' button
>
>
> Resending as my previous email probably got lost. If you got it twice,
> apologies.
>
> On 01/06/2023 10:07, Xu Yang wrote:
> > Convert the binding to DT schema format.
> >
>
>
> Thank you for your patch. There is something to discuss/improve.
>
>
> > new file mode 100644
> > index 000000000000..48b0e654e52c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.yaml
>
> Filename matching compatibles, so for exmaple fsl,mxs-usbphy.yaml.

Okay.

>
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mxs-
> usb-
> phy.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7C6226d685ea124535c3fe08=
db636b6ae9%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C0%7C638213085231814761%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2
> luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Db%2Fw1rubqpT=
N%2B5JagSotDCTmju%2BMHRsuTs
> JzyZ4OALbs%3D&reserved=3D0
> > +$schema: http://devicetree.org/meta-
> schemas%2Fcore.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7C6226d685ea1=
24535c3fe08db636b6ae9%7C686ea
> 1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638213085231814761%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwM
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DLYDKXb56MU2PeLqHdqGnTFQLKs3B
> Yha5KTFyYRCPBPY%3D&reserved=3D0
> > +
> > +title: Freescale MXS USB Phy Device
> > +
> > +maintainers:
> > +  - Xu Yang <xu.yang_2@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - fsl,imx23-usbphy
> > +          - fsl,vf610-usbphy
> > +      - items:
> > +          - enum:
> > +              - fsl,imx28-usbphy
> > +              - fsl,imx6ul-usbphy
> > +              - fsl,imx6sl-usbphy
> > +              - fsl,imx6sx-usbphy
> > +              - fsl,imx6q-usbphy
> > +          - const: fsl,imx23-usbphy
> > +      - items:
> > +          - enum:
> > +              - fsl,imx7ulp-usbphy
> > +              - fsl,imx6sll-usbphy
> > +          - const: fsl,imx6ul-usbphy
> > +          - const: fsl,imx23-usbphy
> > +      - items:
> > +          - const: fsl,imx8dxl-usbphy
> > +          - const: fsl,imx7ulp-usbphy
> > +          - const: fsl,imx6ul-usbphy
> > +          - const: fsl,imx23-usbphy
>
> I cannot find these in the old bindings. Please explain changes to
> conversion in commit msg. So far you wrote that it is pure conversion.

Will add other message in commit.

>
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  fsl,anatop:
> > +    description:
> > +      phandle for anatop register, it is only for imx6 SoC series
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> > +
> > +  fsl,tx-cal-45-dn-ohms:
> > +    description:
> > +      Resistance (in ohms) of switchable high-speed trimming resistor
> > +      connected in parallel with the 45 ohm resistor that terminates
> > +      the DN output signal.
> > +    minimum: 35
> > +    maximum: 54
> > +    default: 45
> > +
> > +  fsl,tx-cal-45-dp-ohms:
> > +    description:
> > +      Resistance (in ohms) of switchable high-speed trimming resistor
> > +      connected in parallel with the 45 ohm resistor that terminates
> > +      the DP output signal.
> > +    minimum: 35
> > +    maximum: 54
> > +    default: 45
> > +
> > +  fsl,tx-d-cal:
> > +    description:
> > +      Current trimming value (as a percentage) of the 17.78 mA TX
> > +      reference current.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 79
> > +    maximum: 119
> > +    default: 100
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
>
> missing allOf narrowing anatop to imx6. Also interrupts and reg should
> be narrowed to respective variants.

Will add such limitation.

>
> > +unevaluatedProperties: false
>
> Instead additionalProperties: false.

Okay.

>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    usbphy1: usb-phy@20c9000 {
> > +        compatible =3D "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> > +        reg =3D <0x020c9000 0x1000>;
> > +        interrupts =3D <0 44 IRQ_TYPE_LEVEL_HIGH>;
>
> Is 0 known flag? Use defines for it.

Will use defines.

>
> > +        fsl,anatop =3D <&anatop>;
> > +    };
> > +
> > +...
>
> Best regards,
> Krzysztof

Thanks,
Xu Yang

