Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 534827378F8
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 04:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjFUCQb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 22:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjFUCQ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 22:16:28 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2087.outbound.protection.outlook.com [40.107.241.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FE919B7;
        Tue, 20 Jun 2023 19:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg/QwcRubBb56KQWve45ak4RXx7yBY5Vs7nZkgHW+Qnfdhr2yHyckKqCRbeLpET0yTZMDJsBOksd6pNH1a3QRVPjCWciOrM6bkmmFVdp4xhkSXM1oGvfHTRtr4/IFWWG6RWaqz8nK89HpSNNBv4Hv6oGtIAuF3VHQytPZiIRn3dIHQSgwNwPkEiP4mhzSr4jkyKN2Ihs3TL/s/diAKHs8uqB1VP7KSaIyr3XuP0YWa1xzW8gsX0ZNqY6nf78gEhvsXCQYmApLm8FSdVIpMuMWxOR1WdjOXVMQiIUftofy3sFNhXXYiJ0swNgmrXPbAHV7JcSo5O/mJzl9HRoTkAIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMkXQTb9hABASbJqEgVNasKrnnCXtjWoUIWYYf5kZUo=;
 b=lbN5gpXZ7rAA/xXdQP8i0jBYJYA3mcNbjtk3nHyjr39bJK8djtUmQkcY/QPO5M9YlM0fOIuOxUlJX6VpgS1OMhOTcrIo62LqCm5rMJGkg3DdJKd0Jf/CrP2U/OBKDThLIQRIUwZWimBmy+KViSfWx2QVx/14/JefheioCBbKJwZDI4P0TtfG6Fp/UNxKlzMxfV3/9XqaIMnTQxFwNWd6aQ3Rp9Y5P0t/anZ1zL7SRiLXfmdvopEdWhhQlSEKXXbCMeLL7DqxrqvIvMVnEtUxFC0Ufd4TcMfouIOEmNFAcylLhFCOxnd7UV2uYB4OmnDn6Fx88qLlCwx6dIakU1zNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMkXQTb9hABASbJqEgVNasKrnnCXtjWoUIWYYf5kZUo=;
 b=FhaqaIorvouLQj0kAFbFeChrfdlrK4+hT+4LkGzVBHEAyPlwIprDm1AdKE2vFf8u+qTL020XII3Ki+1lKSfEAh9Wrp59QWHHQyXIQFBvLf9qESYdc8s0k01K4W8QadPgd7+DSdYOk7zATCQmENmqlIJJnNPg6zfypuvoI/lYAns=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB8963.eurprd04.prod.outlook.com (2603:10a6:20b:42e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:16:12 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 02:16:12 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Rob Herring <robh@kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>
CC:     "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
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
Subject: RE: [EXT] Re: [PATCH v4 1/2] dt-bindings: phy: mxs-usb-phy: convert
 to DT schema format
Thread-Topic: [EXT] Re: [PATCH v4 1/2] dt-bindings: phy: mxs-usb-phy: convert
 to DT schema format
Thread-Index: AQHZndF00w/l6cE3KEyCwXFchhI+Na+T3FWAgACxHBA=
Date:   Wed, 21 Jun 2023 02:16:12 +0000
Message-ID: <DB7PR04MB450532123A20DBDB0059B6718C5DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230613083445.1129137-1-xu.yang_2@nxp.com>
 <20230620152921.GA3626802-robh@kernel.org>
In-Reply-To: <20230620152921.GA3626802-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS8PR04MB8963:EE_
x-ms-office365-filtering-correlation-id: 6a95a903-0b07-4b64-6cc4-08db71fd7bef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CEsRoOx0751FgHpkWgcbGuzsv5LuDBVr6asSmU6larx8Q2oarr1KhY6eVjwVX54Vg/qr65SN4X3T0foevva82KgECZNDbKqx26mmx01Q8CPikdY3PRnTN0NbGGBizu/rvdpc2blFKg2Nv6eztokZzA+jkrxGNxrKRum1VPxX180x1AARFND2y56qYRVG0mHPlZHxTX9xXdezD3h6xUAbOVJ9efm1g5+rY2SwkmiHTQnJyuWveB4mEsR+R0vUWkwcWkKxQjFxkOVaZOy5B0Ysmedt2V+2aOEQdF7QSm0J78TKacqm2ulWTyBFqoBBrYrWIDln5lqrSbwIMNA20v1htTvuYwnkq2fMyFdw0sR7R07Yu7CEwleMvKT/8BN71acCr5XPlJHjrvqmnK+7QUUrbFfCgHKMVGRm/SucCn23vtV7Y/8iqNrXXNF7OmVdcuhSV0JvCxITpY/L6zm20imn9Dgi71DGMfRAifdwEUiA3TUD74psw/IMHZF5FczrnaFd5XCutK6k4dDm9ysKZko90a5rjT0v3tLHMDNTSL/UYdy/MNVAdyWnXkpKFGecP3mhrYxolWScDch6pUHAteSqJE0NlQE4Tx9YaL20uGZdiob8IMHX4YIwaZF+kkjjIbraGQJn+7tILF87u8kIyHAp0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199021)(33656002)(66446008)(76116006)(66476007)(52536014)(66556008)(64756008)(4326008)(316002)(7416002)(66946007)(5660300002)(2906002)(9686003)(41300700001)(8936002)(8676002)(55016003)(7696005)(54906003)(38070700005)(110136005)(86362001)(478600001)(45080400002)(38100700002)(122000001)(966005)(6506007)(26005)(186003)(53546011)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JRl3kjEZx9CZ7xD3nO3b8uuoISTafB+IqrO5oZJu1qrxdr23+oEm+tEDREZk?=
 =?us-ascii?Q?IW5wXKuB4BqqMI7F4AGx8iGY/xTXi1p6+PeKQuUMj2nki3/gf8sRbuVetPNU?=
 =?us-ascii?Q?SKHFQjaiZhIUSY4APV5LY/kFs1CbyG+9XbrWKt85r8kboIg6PtB+n5M+gOak?=
 =?us-ascii?Q?TjWrQuz5+86gdkbzcI6xvpnU+Hv5+U767X07TswJ0RweRUGcwH4R+KjtuNlT?=
 =?us-ascii?Q?XwIx7b9aKG2lLVqJWyukR7JT6kyaanPYrtCjstij9kc39sk/DFJ65H1uD/tQ?=
 =?us-ascii?Q?5VB55rsCzHqh9tZLMYR2H2mcutxB6baIxpQwyppK47AMd7oF6lJgg+B6Jszd?=
 =?us-ascii?Q?U5AmVbkhWmw8ET8oZc1MJQpz+djnm/T59AYyg39vtYGqSa53tsmT4Lv7uPpj?=
 =?us-ascii?Q?DLzQS6YyaBPABKV2OF+JpVf3U9+oaGZOkabMxi/cWdbAsxcGvKnb66X7KGch?=
 =?us-ascii?Q?ienBhkbYb0zMfxPR8O0vUVTq+Us1MISoFsD7KkkXEkbGBO/tc1hACmi+V9j8?=
 =?us-ascii?Q?rgGJgryY76JiOd+pkEr6s+LYSFuoe58462tBbr8fd6mAk8ScMdyN0/XX9YNz?=
 =?us-ascii?Q?YGuPENgV+6L2m9PV7dkee53/FXaMX1UJtS5LCRQA80ujlcScrueIY1CPFMkn?=
 =?us-ascii?Q?OPUTf7nFRFZn9KvkYOJwEVJ4R1K4wg54yUgH8395kwO6gkzkJQYoKWVW9R59?=
 =?us-ascii?Q?o/PLP1nHrRlVa98S7ejDsYt8uPtK3hiVWBy1YN8OSNdjq8NXMI56b1wlb7y3?=
 =?us-ascii?Q?IiHLEGbrV8ahpd6kBrEPQF57vJicet5HAMfOLM8zvD2ux8J3DjRtQuYaEZH2?=
 =?us-ascii?Q?D6rqhzPj+UuJBoz+CeG6guJMhaGeRfmosApmp/CgTobq+WL+p7Pe20sS2a/m?=
 =?us-ascii?Q?BPWo0tbManE0M1umodiw4c4Ehq7AXlZGJ2TWyod/I9MNzG3to27Vg8DiTHpL?=
 =?us-ascii?Q?fd/X9I9Yz1yaW6b40OWoUldqqyo5Byl6xYSjiJZe5nsB+vUIkBrtw974s0Ci?=
 =?us-ascii?Q?rO3Tto1fA7pGkDUD89yuid6CB6ajI/j0NnSHSzyn7X4hQ5ZwltK3d3CQfIYU?=
 =?us-ascii?Q?8fE8/iYdSykq9PcFgD/VRLTh7Zf7Z1Q2yAg45jb42GhTSu/zQw9woA3+rpMP?=
 =?us-ascii?Q?E1TdsA6ZoFsVn4VwkuFHTGMFwXBjuS5Nx5IOUYb0wmc0lksfRu8h1tm50tkD?=
 =?us-ascii?Q?n2o2tqeWWaTuu73u2CgLbMUhXpctBxhTsIf0ZFdIKoiaNLFl0WdRPkOfx/5V?=
 =?us-ascii?Q?AZ7fWvw5kufeWA+XpA0rE8097UW/C4vHMBEy5hYXHpOQO+z+P+lNHmzXwhOo?=
 =?us-ascii?Q?mpPFz1tXFHRR7BFoq+NKrItaqTTB7ajsCCmCNB44x+U83o2Ex8RSRt88WKj0?=
 =?us-ascii?Q?RupagZRMgHvTBgc/3pN6EL17PZCM94/andgZlGJN7OP4PLo9Z0K3tJgjgq+4?=
 =?us-ascii?Q?ZyW5xAZLK3NffFYQAZpvHRMUJdZQvE7twXnVWGn8DHEg1ZzGud9iNFjuBVh5?=
 =?us-ascii?Q?v5t/diidm6Ad3HI3dn0VJ1ZtsKZfaOHgWGzeMdGdS+d0cNApq78Gdbjdl6JX?=
 =?us-ascii?Q?W/UGuyJJIPdUh7rlQAU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a95a903-0b07-4b64-6cc4-08db71fd7bef
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 02:16:12.2724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zq4se0yfS0DjWnKCU9qStyEQPs6o/FIKqdDwRvTBXBC8GuTwGxn3r+WHL1mFHz4ZbSPo+9Pn59zwgofGJYVYeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8963
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

++ Vinod Koul

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, June 20, 2023 11:29 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; shawnguo@kern=
el.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-imx@nxp.co=
m>; linux-phy@lists.infradead.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-u=
sb@vger.kernel.org; Jun Li <jun.li@nxp.com>
> Subject: [EXT] Re: [PATCH v4 1/2] dt-bindings: phy: mxs-usb-phy: convert =
to DT schema format
>
> Caution: This is an external email. Please take care when clicking links =
or opening attachments. When in doubt, report the
> message using the 'Report this email' button
>
>
> On Tue, Jun 13, 2023 at 04:34:44PM +0800, Xu Yang wrote:
> > Convert the binding to DT schema format. Besides, this also add clocks,
> > '#phy-cells', phy-3p0-supply and power-domains properties which are not
> > contained in txt file due to txt file lack updates.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v2:
> >  - change filename to fsl,mxs-usbphy.yaml
> >  - add other optional properties
> >  - narrow fsl,anatop to imx6
> >  - use additionalProperties
> > Changes in v3:
> >  - fix indentation
> >  - add clocks property to example
> > Changes in v4:
> >  - remove [fsl,imx7ulp-usbphy, fsl,imx6ul-usbphy]
> >  - limit item of reg and interrupts to 1
> >  - sort enum items
> >  - modify commit message
> > ---
> >  .../bindings/phy/fsl,mxs-usbphy.yaml          | 125 ++++++++++++++++++
> >  .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
> >  2 files changed, 125 insertions(+), 33 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbph=
y.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.t=
xt
>
> This should be applied by the PHY maintainers, but they weren't Cc'ed.

I see. Thanks for reminding.

Hi Vinod,

Could you please help to apply below two patches:
    - [v4 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema format
    - [v4,2/2] dt-bindings: phy: mxs-usb-phy: add imx8ulp and imx8qm compat=
ible
The review process has been completed.
Many thanks in advance.

Thanks,
Xu Yang

>
> >
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > new file mode 100644
> > index 000000000000..cc9f2bc7e6fb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> http://devicetree.org/schemas/phy/fsl,mxs-
> usbphy.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7Cac9c63d6d88543a24a8=
308db71a32171%7C686ea1d3bc2b4c
> 6fa92cd99c5c301635%7C0%7C0%7C638228717681736316%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjo
> iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DHB6IkZX%2=
BRcbpGNmFCYWOfPYYffoH5QPreo8
> A6jHjRz0%3D&reserved=3D0
> > +$schema: http://devicetree.org/meta-
> schemas%2Fcore.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7Cac9c63d6d88=
543a24a8308db71a32171%7C686ea1
> d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638228717681736316%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMD
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D=
XZ8gZnd%2FCse%2FCFgFKyKganKz7cs
> Vyq6hdIJpRY4p8Fc%3D&reserved=3D0
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
> > +          - fsl,imx7ulp-usbphy
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
> > +          - const: fsl,imx6sll-usbphy
> > +          - const: fsl,imx6ul-usbphy
> > +          - const: fsl,imx23-usbphy
> > +      - items:
> > +          - const: fsl,imx8dxl-usbphy
> > +          - const: fsl,imx7ulp-usbphy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  '#phy-cells':
> > +    const: 0
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  fsl,anatop:
> > +    description:
> > +      phandle for anatop register, it is only for imx6 SoC series.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  phy-3p0-supply:
> > +    description:
> > +      One of USB PHY's power supply. Can be used to keep a good signal
> > +      quality.
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
> > +  - clocks
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          oneOf:
> > +            - enum:
> > +                - fsl,imx6q-usbphy
> > +                - fsl,imx6sl-usbphy
> > +                - fsl,imx6sx-usbphy
> > +                - fsl,imx6sll-usbphy
> > +                - fsl,vf610-usbphy
> > +            - items:
> > +                - const: fsl,imx6ul-usbphy
> > +                - const: fsl,imx23-usbphy
> > +    then:
> > +      required:
> > +        - fsl,anatop
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/imx6qdl-clock.h>
> > +
> > +    usbphy1: usb-phy@20c9000 {
> > +        compatible =3D "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> > +        reg =3D <0x020c9000 0x1000>;
> > +        clocks =3D <&clks IMX6QDL_CLK_USBPHY1>;
> > +        interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > +        fsl,anatop =3D <&anatop>;
> > +    };
> > +
> > +...
> > diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Do=
cumentation/devicetree/bindings/phy/mxs-
> usb-phy.txt
> > deleted file mode 100644
> > index 70c813b0755f..000000000000
> > --- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -* Freescale MXS USB Phy Device
> > -
> > -Required properties:
> > -- compatible: should contain:
> > -     * "fsl,imx23-usbphy" for imx23 and imx28
> > -     * "fsl,imx6q-usbphy" for imx6dq and imx6dl
> > -     * "fsl,imx6sl-usbphy" for imx6sl
> > -     * "fsl,vf610-usbphy" for Vybrid vf610
> > -     * "fsl,imx6sx-usbphy" for imx6sx
> > -     * "fsl,imx7ulp-usbphy" for imx7ulp
> > -     * "fsl,imx8dxl-usbphy" for imx8dxl
> > -  "fsl,imx23-usbphy" is still a fallback for other strings
> > -- reg: Should contain registers location and length
> > -- interrupts: Should contain phy interrupt
> > -- fsl,anatop: phandle for anatop register, it is only for imx6 SoC ser=
ies
> > -
> > -Optional properties:
> > -- fsl,tx-cal-45-dn-ohms: Integer [35-54]. Resistance (in ohms) of swit=
chable
> > -  high-speed trimming resistor connected in parallel with the 45 ohm r=
esistor
> > -  that terminates the DN output signal. Default: 45
> > -- fsl,tx-cal-45-dp-ohms: Integer [35-54]. Resistance (in ohms) of swit=
chable
> > -  high-speed trimming resistor connected in parallel with the 45 ohm r=
esistor
> > -  that terminates the DP output signal. Default: 45
> > -- fsl,tx-d-cal: Integer [79-119]. Current trimming value (as a percent=
age) of
> > -  the 17.78mA TX reference current. Default: 100
> > -
> > -Example:
> > -usbphy1: usb-phy@20c9000 {
> > -     compatible =3D "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> > -     reg =3D <0x020c9000 0x1000>;
> > -     interrupts =3D <0 44 0x04>;
> > -     fsl,anatop =3D <&anatop>;
> > -};
> > --
> > 2.34.1
> >
