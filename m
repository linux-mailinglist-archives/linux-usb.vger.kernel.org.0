Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0370727CD7
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 12:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbjFHKao (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 06:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjFHKan (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 06:30:43 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C421FFA;
        Thu,  8 Jun 2023 03:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvDuHYUm6qkNwbZRWr2oamEIT6tleaE4F4ofhaHAH75tFqYAsSFagSBOiCDf3UYUBKdbWCEVRQ4B3oUn1jl6R4kKFY7znCyc22VsZwRrAkckOvsUeuAuH/4xAaQh4dXLCZen9siKzBi1GeMUZ8WDk6GbsjBzVJQZ+XAbzOFGzyIOgDUhxo0Jx24zrwMpoh+4yb/oSBN/005ch8Q7ewI7zLnw3fkiiaimtVAc/2n9P4KU6mMWEjnoU3Xw/SDkajCFLLFy+aN5/kS29o8Ig2/OAwqIPgKTRnOQ67A+jvb39hX5oEvTNS2bEntrnTaGw6fafn1BAMQ9TKqzC6e35l3xNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaEI2fK4jMuKSGKe3Fzgo106Q9QL6toDdnIrWCuxVGA=;
 b=Uo9E8/rcSt18Wvu6NDZwVVNC6K6ZJCZpYo1FZ73sRYpdp+CKB8KYeR83D9/iWOdyW8iryHW8XGur8HeESxl/YbZlr4pxYDn+AFdpqUuZJJEA9NF/eEzjtcDWGRl0Ff3CoGer8ul9lfxFtrKtYNcw9B7sz55oy6gVe1ADuQNXW+h2QEyGbXhiUMRGXYrw5f1rTclGjY05ZsTzY/7rtGiVzPfRIiGjgKqMknm5r8v6OmyEK9El3zP57tFqrS5UqOQXdJ1pFNyarg8cmIg1LMGQN4/tQI9c7iqS0aLjS0pU6Ds4jF+FFTlidYqVk4LkUu1kqKSTZ5ggiMmsUnwj1h8VMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaEI2fK4jMuKSGKe3Fzgo106Q9QL6toDdnIrWCuxVGA=;
 b=f/38zm2sLEAzgvtZv634hlrallJ8M5qldo55bOWTbhWNU2i+64NDrAbs5lpENsaEGVpaD3oSzCy4H7neQ7WiOP7Oa/wtpjbFUibWzEn3HMNG5cPyHpdyik6iwSaFySNdwmyOajMQBP0WRKVGLrcfMSMDDNuqDiPZFpIKw+NCul0=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Thu, 8 Jun
 2023 10:30:38 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 10:30:38 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
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
Thread-Index: AQHZmboSn6UDTrFVK06L5r7rtQ42ma+AiewAgAAokCA=
Date:   Thu, 8 Jun 2023 10:30:38 +0000
Message-ID: <DB7PR04MB450531C695BF4326220A8ADE8C50A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
 <0530fbbb-e345-8f8a-5332-526ddcd55eb2@i2se.com>
In-Reply-To: <0530fbbb-e345-8f8a-5332-526ddcd55eb2@i2se.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|PA4PR04MB9565:EE_
x-ms-office365-filtering-correlation-id: 2a347c05-e32d-48e4-2702-08db680b66ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sSyvkEqEtQNfBRDvA/c3vs/WZol80FbHe/KGA/RRqi/XOnTvC9N3sSDl0y9ioWoRXdckz/AeyLf6pulUQXpkQQra6Rsm2K5ZtwuFAGtFIScGM+IUHp+CDtC9MeHhcAL1QWGKw15O2zHwKoGLD24KJ/osUakhnIHGr8FU9QITxkNLPm3kSBIWt1qrIS5s1VMWRAucSoG0Iam+bjDmdoorGdzQKCOeeNoYTKvds5hzwAJEAt2OXOSlGqrCJ3KTZCpv9PLR+JhGbinU6PG5JoQ0w3ysmJta2ZIRfq/TFN2fFmqSyQgQc/IHHkO/5DHYKQ4KhSkvAzQlRdgCHRO4C93s/fYVI7cBhTJi34HEjrJdumXaz+JjPWhffUa0utWMgZYcctWQ/1UQqV4wbAlsnXfL6KAReazb5Yz7XVFvvugqlRsgDgQ9gwxVxUHBaOaNpTfTRCcHiPV4lquc4ZDuC/8juGau+DXFoyoST/1+mkwYPI5j3E4jzn1UhEuH8iDPH74CIw4sWG806BF3Ippr8PClffRpzJbHLilO/Cqhn5HIN9fIzeqc8qkyYtUuIwL29lyYHkRxqJfP7rdBtC+LzhD69sOuiRExoL6ahlO48h8nlff7Nzkb1tVRpfCU6wBsOanPy4957/CqTsr/PW7NYc++/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(33656002)(9686003)(6506007)(26005)(966005)(53546011)(83380400001)(122000001)(86362001)(38070700005)(186003)(38100700002)(55016003)(110136005)(41300700001)(316002)(2906002)(66446008)(45080400002)(478600001)(66946007)(66476007)(54906003)(8936002)(64756008)(8676002)(4326008)(5660300002)(7416002)(76116006)(7696005)(71200400001)(66556008)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xPy9PdHF9llbp9J5FrfcsxXFZeMTAiqEvv9FWOaPAW+M6338EV1ocqiZBYrC?=
 =?us-ascii?Q?4ZCWA/AvprD/i5dLBSYF+0v8USoADqVFYk37w/HrS45VQ1uT3c9ZSioCjaLn?=
 =?us-ascii?Q?g8FwNTbICNSJPzNHFsUbRwaSwfFv6puqLOWqzRriKwSAoTmgbl1MMCXyFvgO?=
 =?us-ascii?Q?Rju8CkTybEbe4vHFhpsBOQ5Ldq0C76416Hq5c0iwLepgXHx8TQPGUKOWAmix?=
 =?us-ascii?Q?d2mcuSKe33DaY5AJ1EG+VEZbmW1A2fsWedaEuG0exgIae9fpk+zPz2p0bbFu?=
 =?us-ascii?Q?uLoaoFY4XEbiOyR5qIhZLe/xtnP2ppkUJ2TyS7ORtZXcrrAkymF4KX0aqXjG?=
 =?us-ascii?Q?E9Zdv7GALmTny6n5KYcqg5Lqtd+4anXHTYV7yeVtoP8nQpTIxCBP/fOrlyQC?=
 =?us-ascii?Q?IA9aHIachJsqhyDnswGBoAf7o7UQoO807lRkYqqSahpFIn9KxzSsa2z2kj6h?=
 =?us-ascii?Q?QL2uSzKKUp/7/w1eHnWrMf7QobB2U5E8FwBQHtQXs0tFyHA7/3tWBFQL0Pt1?=
 =?us-ascii?Q?8rsFAOf0O3QgcrPS1iLykGM97e00GBi18S84vrDwcKi2rlMRcxVWOMGZZcYX?=
 =?us-ascii?Q?+Jb/KQAj74wMaPlm282clGXpFh3yIzS7+x81XGwrNqnFHnEEvX4n1qWCKti7?=
 =?us-ascii?Q?40KMDE/pYE9K++0s90IDkOdAixkgm0oy65Q2uBqBgVRGXwIyNfkekKH7EmFk?=
 =?us-ascii?Q?gFPLYadLFdt+xqUqg16B3U7jzWHUwPj4hpf5/V/AXUNgV+9gR/Z1srIz+PSn?=
 =?us-ascii?Q?Etx6ZzJ495oPlt611hjmO56YBRJgb7958Bxy3TwP0/ILDaUls/VAejPhwUcN?=
 =?us-ascii?Q?L/rucI63o0j9T6zI0Z7Nrg6ckuNLM87tcFqdmNAmAbZPp6BR3ZZceidec85U?=
 =?us-ascii?Q?0XTb5g719xPp7iU459it5IFU0fEPeK/dgFmY/xyCKNy+VXSx/NRc1OcvFAgQ?=
 =?us-ascii?Q?VwXD38tlQc4PLwNHb8dr4GmYYoQaS52CFW+5khYRiCP/mVsSmHoUIgGW1sBs?=
 =?us-ascii?Q?RoxIP7IoG9pB6H8ZUYoWuE6RD4LcoCmZGc9GHixlpXE9KqnUY9PpmnyW+7k2?=
 =?us-ascii?Q?o2g/7WP/DetXEEX2JGlUapH9FGYczObprjbRBQy6n+BLtVvPYxV0MSheku/z?=
 =?us-ascii?Q?IqX792Nea8nnWfdedQq7SXl6qGTKBqXW8O+AG3nonctzBLUBjE3EBUF9E1JP?=
 =?us-ascii?Q?fqkMpBBJFHZJL6T/vqk0q1UmLbR8rhsQJAqHsDt8ojG6JCd6YKXepyrPIUGh?=
 =?us-ascii?Q?WRDHx45e5kMpDt2oebIZPpUpOtpSeMttjWoaNZGFOW25oAT1iLT+7192wC+t?=
 =?us-ascii?Q?+yCFa65DUUY8/R/cDsyGadoiH9rtMFLks9OTN7Fwj5F+QRHnPN+L2ghRHlgM?=
 =?us-ascii?Q?rWnzZBj1yVIShTvxrtNQhsk7pfg6K29QcoAxKLzltWHCd+TpeDO3hqMP2FFS?=
 =?us-ascii?Q?yoCJwNLMkbWMBiSNmU1a4eENbAp3S2uWCC7p6rBpOr15D15PussooVr72taC?=
 =?us-ascii?Q?JgI+fg4yJKqXiC4MNmO1C3KognGxb2TcWE1EedTggA9Gn7NF5AP5tFR58W8b?=
 =?us-ascii?Q?pYPtuiHHQhf/gT8LlSA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a347c05-e32d-48e4-2702-08db680b66ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 10:30:38.1746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hJCy5+k2+617aKNh2VJPlg1d94NaLVu0O9v5sGFT1jU6GneamgcVZWMBpzYIXSJsekee4qFtG9/esVhHzsJKqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9565
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Stefan,

> -----Original Message-----
> From: Stefan Wahren <stefan.wahren@i2se.com>
> Sent: Thursday, June 8, 2023 3:56 PM
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
> Hi Xu,
>
> Am 08.06.23 um 05:36 schrieb Xu Yang:
> > Convert the binding to DT schema format. Besides, this also add other
> > optional properties not contained in txt file.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v2:
> >   - change filename to fsl,mxs-usbphy.yaml
> >   - add other optional properties
> >   - narrow fsl,anatop to imx6
> >   - use additionalProperties
> > ---
> >   .../bindings/phy/fsl,mxs-usbphy.yaml          | 128 +++++++++++++++++=
+
> >   .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
> >   2 files changed, 128 insertions(+), 33 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbp=
hy.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.=
txt
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
> usbphy.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7C5df4d949f975469013b=
408db67f5d46c%7C686ea1d3bc2b4c
> 6fa92cd99c5c301635%7C0%7C0%7C638218077754788407%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjo
> iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D8Sz8tK9GV=
QqE6ywVLpxPB8YDFQvygZvj6s1NjZk
> hbzU%3D&reserved=3D0
> > +$schema: http://devicetree.org/meta-
> schemas%2Fcore.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7C5df4d949f97=
5469013b408db67f5d46c%7C686ea1
> d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638218077754788407%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMD
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D=
iaX16VnSJnvU%2F0tcnRgsdnTxMsD89
> 5r4WquGsCFt9Qo%3D&reserved=3D0
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
> on the one side the fsl,imx7ulp-usbphy has an individual compatible
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
>
> on the other side this should be compatible to imx6ul. So at least one
> definition seems to be unnecessary.
>
> Looking at usb/phy/phy-mxs-usb.c suggests me that fsl,imx7ulp-usbphy is
> not directly compatible to fsl,imx6ul-usbphy, because the platform data
> is different. So maybe the using dts* files should be fixed instead?

The imx7ulp and imx6ul only has minor difference. In general, imx7ulp
is compatilbe with imx6ul. We don't need to modify both dts file and
this doc here. So the validation of existing dtb would not fail.

Thanks,
Xu  Yang

>
> > +      - items:
> > +          - const: fsl,imx8dxl-usbphy
> > +          - const: fsl,imx7ulp-usbphy
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
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
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    usbphy1: usb-phy@20c9000 {
> > +        compatible =3D "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> > +        reg =3D <0x020c9000 0x1000>;
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
