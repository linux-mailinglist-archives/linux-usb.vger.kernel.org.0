Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDED72DAE3
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 09:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237689AbjFMHab (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 03:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240059AbjFMHaW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 03:30:22 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2053.outbound.protection.outlook.com [40.107.8.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D631B0;
        Tue, 13 Jun 2023 00:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBz9s3fH1VNwnq9d+ek2peVzQbZ1BZ4DwW+h/9Zu2WxvwFhqNgVwwPD6bRUE11odw/GJjAacGcKNPZ+l4cf71u//vO4gon+TUmT0Hg84FtzEq9GVBwyf2Q+5Or+aLPZ177Hl/1VIjrinXwuxAm01fQ6dXA5Uf1RN24H7Yinq7BvxSIpIhfReZrwaBgVCPe7tQ7jQ1VIaICwyYmF+FejDeXT86a+Kk42FM9zyLgj0115nn/8z6t3HTriwri1dw1LY7dPV4nfisi4G6N/kG7Wn2Y6dQrlGxwdfE2vwU0UYYpfqMZREMYNS4ujFOWcnoKak32S+POzRz02EBLZ4PvNf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TPgNFKY0RqHauoALoKwyzF0gZaVfJ7O+1K1U48bf9c=;
 b=l8sYnng4Tc1UFS6xyE1mg8AGZKqs/ISLC7z4FTIKlobQeUPcUq3hcU+YjPcNLIeYej2WUjnL4/DFeqCcSCxbeA1wNmnZHEuhELB+N+cg164v+Yh49Juu7JySxf4YY++pp/cEc50G3ZpYbxGt6tQyJyc9x0tSvu+8DCcOG9g8oVxUk+Ow3M4Ty+fvDABuYXg08+0J5Bcx6bpeO5bhqStBidDQAjCIWhxI/bVMGGk5dC0FJxwIvmz7yF6Qqlu72IMtqVC6rnoFQ9ueNqbOE7GqAKhqnm3ZMGJP0EUp6r5i7zkD+QUrErA+luBHnFNJNWYaPiwS5V30mu0PQ40LRP6GYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TPgNFKY0RqHauoALoKwyzF0gZaVfJ7O+1K1U48bf9c=;
 b=Il3+JlCLkx8K/clX+rjnzngDNPt+FoQwE9Sq87v8HYquMJcSehOhIeHlWF6Efp6q7Z0j1WsuMThEiImzCJA2Ml9NGtTAjGDlFTyBxMANT4Tn0lp0cxHXwIIw1VURI+bPqVwUcwolAGhQM3wae/Sib5QsTaE8Dwb3Tz7ByUmxBzw=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB8435.eurprd04.prod.outlook.com (2603:10a6:20b:346::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.28; Tue, 13 Jun 2023 07:30:09 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 07:30:09 +0000
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
Subject: RE: [EXT] Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert
 to DT schema format
Thread-Topic: [EXT] Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert
 to DT schema format
Thread-Index: AQHZmboSn6UDTrFVK06L5r7rtQ42ma+Cr6QAgAP0GLA=
Date:   Tue, 13 Jun 2023 07:30:09 +0000
Message-ID: <DB7PR04MB450553FBD13E3101F8C065008C55A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
 <b8f35a9a-7553-92fa-6fdd-2522dc9bd36d@linaro.org>
In-Reply-To: <b8f35a9a-7553-92fa-6fdd-2522dc9bd36d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS8PR04MB8435:EE_
x-ms-office365-filtering-correlation-id: 802d831f-fdfc-4a9b-59b9-08db6be00452
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G9h1Go2ZxDmMTQXyphjRui1C52XcS2BRcAOvilrXLPwDBSU4o0dbcxINKVdvKlCnMtJzx6FTamH1c80mSIMuvldKdY4BR/HTxzJv6sgSEDi3ZFRFbDQsJHwmI/GVKwgWUwAQDft1JiTEaSRghmDozBt5a8BoEtzrhltHo8Jnyi7ljpERkmFAmJ47jojql52yQ1gOcA3PwFQWFoESdaFk9yRAWsRelieoXxbJwkTwP90z3g1IUlexMttF4KVg8QzlL9vR3sEUq0ucgWO+OEmTUv4lgxzmXMXzNYCWYf3BPx67FCvQhJT4c8QJ/lgPRUKCQBzEhX+2Nycs5Q4L1979bjQZE7/CaUQybmEh44H1Vr+KK0YY9EKn/Lg2xCIj8IylIA88LbCWATHSkeqUk99NWE1IVy/4YUuyX79Wuu7jgF5u7ia+LB8/ShI7lxF3UuaiRu84F41n+NjajGgEmBMr+6n0P0BD/CQ+tY3JzfpReev8HOopx1jS9s4ZanuJWx+mZJKHx7hnQS7jIFRfoEcndcSXJ85zCDnxOrEy6W10J3fcsW4lTrWWIrFGufD7NplKeVAYmDhcIlu7yRiZ3LWR3lc888EgZq8xKn5tbpNhPeuBhZc8YvowyUgP3Bx+15I93d2Ktqu9kRgpc1JfMHyi/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(54906003)(110136005)(83380400001)(38070700005)(6506007)(9686003)(33656002)(86362001)(26005)(53546011)(38100700002)(186003)(122000001)(478600001)(71200400001)(7696005)(966005)(45080400002)(55016003)(2906002)(41300700001)(316002)(8936002)(8676002)(52536014)(5660300002)(64756008)(66476007)(7416002)(4326008)(66446008)(76116006)(66946007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9I33xskFg5VarE+vOTOe9cRy5Tifr4mLM3DhPV0ir2AZFw4VpYQV5XzdiSkD?=
 =?us-ascii?Q?iC+ngVON+PRC6lhqapEpKNRL3DRylarE+nCGUqtjyQSCamEWspv/1SAw7+vA?=
 =?us-ascii?Q?/HrRZnHto7b6HeHja97y++DJo5ROk3RAfLX6bH7FYtLcgpqxF1HWJ+YezzDz?=
 =?us-ascii?Q?8yPYi6E+cYKwCA0HvzvPlESn3JRBXLDYlpO36rEIEcYnx5JN7PeENFizctXC?=
 =?us-ascii?Q?1Q38X/ijgb5Q86SrX8cswjlYpyxk1MwxTHQY4/SWb7d5x9gV5Zb7QLPgfEqa?=
 =?us-ascii?Q?8fUjBQqQKDC4Vo/lhprhGagQgMeDKf0nYhl+etkKOnx0dVfNNwix3jGQ3Gs8?=
 =?us-ascii?Q?fkGjbdzZrzlj44j6SZmLRqybPunBkBBVbuoBTcDMZJo76qqExnE4jaRlIbti?=
 =?us-ascii?Q?x+JrgbtNxJy+3WN/vHumf1hqNHnkZ+vbruR0iWftM/owgqyWor3yKDTqTBuR?=
 =?us-ascii?Q?0PbGLZpXiNoZT02rqRqRXjeTZWxBUWev2J6iM6ZvjGDA8eOqklRi3LX9MvrJ?=
 =?us-ascii?Q?FVfUB1Tkr5wI/CpvEQR2TLmbFJWQlZpfNAAg5qTTkIhKHHzWqE7M8l61eCVD?=
 =?us-ascii?Q?R+V4u7sjROsAycL6+to26iRxTYCurdZEafOlGCplHABvyICPKZYLDbThVD0W?=
 =?us-ascii?Q?7K6OiyAHwC0S4O81hVGSoP6bvxt9Rv4FLTdUwmDw6WXdwKa1PYFLbqsOyckQ?=
 =?us-ascii?Q?y4vsOd1RKdvkTZjfZ7ftYwNXynC4cgCpfrllqRFGihn9/BJxjWH+lriT+YMk?=
 =?us-ascii?Q?Xx+wtzvh0cLnX/T6KUCQVqdg/AhDYc3P3cgengL7frgEwo9K6wPT0XaQqy1C?=
 =?us-ascii?Q?mz56KsJLbk8DFpTPTVPp0YYcz/k46AzlaRVzDsNk4mYFoC/S2vEsCm1mLS6p?=
 =?us-ascii?Q?dOklfy843zxSEXatdpAwMlchW3te1q2vrmXXXmV1NbyeGJyt6Ve6ZKaAWHR5?=
 =?us-ascii?Q?n69BNrXRLsbjrR5bTHCJzIdrw8uNiNsHfn4fFN2D0e0pqsaby4CpBW9cJSb+?=
 =?us-ascii?Q?aBhjXHbrYmQe++knuFUPv8A9+BL2ZDcHMcyFk40d6NiGwXnCSDXWPT7aaExI?=
 =?us-ascii?Q?S57wdNiP/yq2hFQCoKrITIv+yqjacq5VtbetjkQ52p4b3hmP+fAKDK05HnSP?=
 =?us-ascii?Q?S7iIbFo/J5xYC71vYhucJnYsgjn8srN3Jc9ayQDvYIH2vCXGpc66GY/7Mo3c?=
 =?us-ascii?Q?f/rX8hgSN/vMvyRrpmTsVVxSFyObVfXHuNtW2DDm+rBvow3FZHRXQ1tOUO7b?=
 =?us-ascii?Q?VSXp+gFNCA62RsSaWvoGQ0EQzh9hblzlxVPDOuKeX2BwfSIyXnsBhKUq6Ec4?=
 =?us-ascii?Q?srqgA52brwui34S59FQb51xJjDyIED7kR9KlQ78FE187wBtCd7j4qZND6E3R?=
 =?us-ascii?Q?XOtTWmGoptB448pjLKZIY6fO0NLYGyuAI/H7bS/g6kwK9fXih5t0WLTOhMb6?=
 =?us-ascii?Q?REzHcVqhv3wbOOhyh2oTMXhFPpEFRDnF1vmi3Y79rARuRael+pZw8dH3azkg?=
 =?us-ascii?Q?ybdjswm9yaJ77QmbrQsX+/vkbC76oraooNSSju6ftFbxdOtMpc1XEiCi6A5D?=
 =?us-ascii?Q?J4AQc0HJwIbIpLZARF8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802d831f-fdfc-4a9b-59b9-08db6be00452
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 07:30:09.2212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kIRVVG1yZC4fgbYX8GT3phzS6GtgUJIfNg2dufPXIBUvWdFnOmduJQFxWjfCc6G0muniTNvkE+w9Kgxs53RBtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8435
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Saturday, June 10, 2023 12:44 AM
> To: Xu Yang <xu.yang_2@nxp.com>; robh+dt@kernel.org; krzysztof.kozlowski+=
dt@linaro.org; conor+dt@kernel.org
> Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de; f=
estevam@gmail.com; dl-linux-imx <linux-
> imx@nxp.com>; linux-phy@lists.infradead.org; devicetree@vger.kernel.org; =
linux-arm-kernel@lists.infradead.org; linux-
> usb@vger.kernel.org; Jun Li <jun.li@nxp.com>
> Subject: [EXT] Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert =
to DT schema format
>
> Caution: This is an external email. Please take care when clicking links =
or opening attachments. When in doubt, report the
> message using the 'Report this email' button
>
>
> On 08/06/2023 05:36, Xu Yang wrote:
> > Convert the binding to DT schema format. Besides, this also add other
> > optional properties not contained in txt file.
>
> Why ones do you add?

I add clock, power-domains and phy-3p0-supply to this doc. Because
the txt file should contain these properties but it not. I think the
txt doesn't get update in time.

>
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v2:
> >  - change filename to fsl,mxs-usbphy.yaml
> >  - add other optional properties
> >  - narrow fsl,anatop to imx6
> >  - use additionalProperties
> > ---
> >  .../bindings/phy/fsl,mxs-usbphy.yaml          | 128 ++++++++++++++++++
> >  .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
> >  2 files changed, 128 insertions(+), 33 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbph=
y.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.t=
xt
> >
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > new file mode 100644
> > index 000000000000..1b6b19fdf491
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > @@ -0,0 +1,128 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> http://devicetree.org/schemas/phy/fsl,mxs-
> usbphy.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7Ccdb34e27fd17419bbe3=
608db6908b13d%7C686ea1d3bc2b4
> c6fa92cd99c5c301635%7C0%7C0%7C638219258284008643%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIj
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D4pNCtSE9=
x4kENZsGf2nq%2F2S8uazubTjeqpSZ
> XyRRVOo%3D&reserved=3D0
> > +$schema: http://devicetree.org/meta-
> schemas%2Fcore.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7Ccdb34e27fd1=
7419bbe3608db6908b13d%7C686ea
> 1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638219258284008643%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwM
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DQjXo%2FzS6Ntl2RGBScVJfkdIONo6Sa
> psDkcDM5AY9cgQ%3D&reserved=3D0
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
> > +          - fsl,imx7ulp-usbphy
>
> Keep the list sorted.

Okay.

>
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
> > +          - const: fsl,imx7ulp-usbphy
> > +          - const: fsl,imx6ul-usbphy
> > +      - items:
> > +          - const: fsl,imx8dxl-usbphy
> > +          - const: fsl,imx7ulp-usbphy
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
>
> You should list the items.
>
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
>
> You should list the items.

After my check, the maxItems value of reg and interrupts should be 1.
Will change it.

>
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
> > +              - fsl,imx6sl-usbphy
>
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.

Missed this in v2, but already checked bindings in v3. However, I have
checked schema using dt-doc-validate and dtbs using dt-validate tools.

>
> > +              - fsl,imx6sx-usbphy
> > +              - fsl,imx6sll-usbphy
> > +              - fsl,imx6q-usbphy
> > +              - fsl,vf610-usbphy
> > +            - items:
> > +              - const: fsl,imx6ul-usbphy
> > +              - const: fsl,imx23-usbphy
> > +    then:
> > +      required:
> > +        - fsl,anatop
> > +
> > +additionalProperties: false
> > +
>
>
> Best regards,
> Krzysztof

Thanks,
Xu Yang

