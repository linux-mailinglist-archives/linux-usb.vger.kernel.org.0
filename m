Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9B872951E
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 11:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240002AbjFIJ3k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 05:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240445AbjFIJ3X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 05:29:23 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2051.outbound.protection.outlook.com [40.107.15.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976EC469E;
        Fri,  9 Jun 2023 02:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2XoMhn5/FBKVKZl03SvsdC+qPs1yssEFcDktxh4IKyDRoAlc7XWajxT0xGjHAhwIIKpVclUdek06o/u9I5XKVuNqjcKPDzRk9IY28Q0bhmcP2UCBCK2GelNHBBDGIagmSAa8t3EqHcLioONTF2mqTDEp+2d6WEchTC2dR62dmFeOGmvABx3+CxBdqFTuNXdQEqT5vEzVW63ger4wt9r7rkzMhxH6SzmZdNVYK6TanqnQb8y4Zrgg/6cHDjM1JWcQ6UwVp/5nQiSZeHQ9qMBIJa7yc1vtYUBbhRvOrjahziamLT8jSX/GaZdBsHl234EbuhWYbQ61S0Dh8v2oezkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKJkr4oH750B7ze7eKc8rM6dodvD1wciXeg7Ffk82kw=;
 b=iSROQ3TVP9vgQrGyTW10o978VRERNXDgeHKKdMCRSPlyh7tJEfYM7bOwNYL1Ke4Uxeq5ggDekRppoHEyWFzURLkJ5pai2MkfWe2UdvcVm0fQLpcKsjs0Gh6NDhXLmiVmdvNQd/tnQpt/Xz8oQGFivVMQo7M6T5qtuFI/AitrgybgM9jo+nVR3bYiaNuafV1mdG6VmSfxYSj8RVT8HwsOM36L5rWFM2y/ilhxiOs9oDyL5Z3xRd0N0ae0GK7Nn0/ZAG8Kkog0oEvDvemfmdUoshOd6r4UqgoT+ShmXvMULE+wjXOO5bPiRFwfZpW3RP89+7k94vLmZo9gWg8MTcDUpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKJkr4oH750B7ze7eKc8rM6dodvD1wciXeg7Ffk82kw=;
 b=XUe7eP2z145jGF728vTNbcU4LAD4c8qEn2ozEoi15Ui2HfhKrd4BCGz3TcIaEW7+kI6TJ1PyXjYq1ZZ7Ry/7QpwOdSERWGuyhbUiw3UuPdG9jC87leNmH1CQV6hQr+dgmt/+1sVhhBnsKD9P9CUQcXX4TRzUGhb3atdWPMUvzLs=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB8192.eurprd04.prod.outlook.com (2603:10a6:102:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 09:23:42 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 09:23:43 +0000
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
Thread-Index: AQHZmboSn6UDTrFVK06L5r7rtQ42ma+AiewAgAAokCCAABWoAIABP0uQ
Date:   Fri, 9 Jun 2023 09:23:42 +0000
Message-ID: <DB7PR04MB45052D3A34957FD53EE460938C51A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
 <0530fbbb-e345-8f8a-5332-526ddcd55eb2@i2se.com>
 <DB7PR04MB450531C695BF4326220A8ADE8C50A@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <6901b02a-fbf5-d4c5-69d5-174298ad8ff5@i2se.com>
In-Reply-To: <6901b02a-fbf5-d4c5-69d5-174298ad8ff5@i2se.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|PAXPR04MB8192:EE_
x-ms-office365-filtering-correlation-id: ab2bafd9-6813-4b08-993c-08db68cb37fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g+/kPZFHMORSNJ6FtnZw9KMIejuJpYbC2sMnfGiLZofTTrs1ii96fR/SaS1F2HMAs40ctppBvAizmaxLRbU0Pz35d5QrpPKdETXqv6yqy2FOGw2r8/4XbV8AUYTAVIQ5ifoITaeQJa1XLicmipIMcFcBVk20tFvwQJa1aVrji7qlk78h2dZX6ziViNnlfBtWQEsYE/2MaaARmuaj7pS4vJ0nU5TPi5bQBX0HHlELEOQnaJd6swf6O3hVC7DqfNo5EctSmzQhJpeHg/5JwstYhXHN8C2WCBsMb0tRG7wO9pSsfpM37veRMmvva4JlI5uR4kF6hoKoFeY/lAWebtjey9q/B4A9qq5u4kB0dr+1YZGJVdFKH0tsPCoCi/qo4gkYCJZBOQI50CieXFCPOylx3E73ec4+6qa/+bNaFlgCSxslsuEXuUTmM21k/FqfJiJ+uJtNNeM5iRq67DBXy77XjKRPtIuJE42nmpEG8ZzKjYL40mg3mLoAKJHF+ucy/98T/BT8PWkYkyV+ktoijz54PJX6Y1nSvQgPD3pXZFR0ToRNu4cYtx1TaOiZvFTiFyL9/jvsXtqmdmsJ3mkbcyfRGSOxpdyuyLZnL1M52gnjh3YYa77dY8L41eeM3RbgA/Y0sV7DvxKMMTQVXjowNziDrg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(55016003)(71200400001)(83380400001)(53546011)(54906003)(64756008)(478600001)(66476007)(8676002)(66446008)(41300700001)(8936002)(66556008)(316002)(4326008)(38100700002)(122000001)(9686003)(110136005)(6506007)(26005)(966005)(186003)(7696005)(76116006)(33656002)(5660300002)(7416002)(30864003)(52536014)(38070700005)(86362001)(2906002)(45080400002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AXxc2AYezAZYeP+sxZQh8mic/OY3jwe5m4cW7qJDSPpNwMDW6+LWvNKgd2Ax?=
 =?us-ascii?Q?unrb7NSbH1JXZhxCiKZubpj/x+AgPicQ20M8cH3q1RPL3yjKsbHS1CcNyh6f?=
 =?us-ascii?Q?Mp497bxFMiXIiJJAe8bUroenJ8D3036cOxB0pSOyI8qJtHf0Z77XnV0IR8Vj?=
 =?us-ascii?Q?177rcqf4vfOUAXq9yVsHQDbOlj8XqcLtN/gu8/lHqh6iNYMR2fyqwnDJuicR?=
 =?us-ascii?Q?JfZkkHFBlc4flgtgybgexY7r9owLf7BOUlzFCBhPODFUj59dSPot9SIR8250?=
 =?us-ascii?Q?cuK0yv5pbA7c5u+V0QmbNcMHuMif36XMHe35R2QeBNBiUHl3K8+F2VvJDCMV?=
 =?us-ascii?Q?RzusBZTZ7YYcjn1igNyQfEfvCOnAn4wQX4nE9JlGCBkYHTU+h8KB+2Iwq9Tn?=
 =?us-ascii?Q?V8LqTKZaHsQ1z0JMgONa8XVNkwEm807JYTCwcn9soSw3GT5GWVml9Cvp29PI?=
 =?us-ascii?Q?YlNz2VOHAxXpyGUfVs+dS3rpWpBsQXn0ke4cc+D7WuHddRuI8xVpsS1n+bCY?=
 =?us-ascii?Q?DUpe/5EkUAr8ui5U4vLOT3T+gAjcOGDMCDvqBJwuelOdgmBNCEMVulbPQzI1?=
 =?us-ascii?Q?f75Xk6FOkSJmpTpe84ykP1ryzPJgY/3PG1O6QqWg3AKcoeSJjtzHfTJE76YS?=
 =?us-ascii?Q?tcL5aaOvsuYJ2hHcP8mPdiE3PzcVlNbRWjytDJXN0x3qxEdBEjDnmyjB2mcB?=
 =?us-ascii?Q?DJsAoql4o+qmtL7JTpZTCKhKc0LxQ8Xuy2APvievtuqz917aAKXNkBf2UVHs?=
 =?us-ascii?Q?Tj/Iz33QPsHds2n7BELiakrnkI5GbLvOyvcFBnMkWQjlAuW+nrL8LQERAQCI?=
 =?us-ascii?Q?EFGjYzWqU9SKuI8OLLP0SbqfyXJDtosbhcruIlq1vxcrBU9Nh6zeMRUA0gAA?=
 =?us-ascii?Q?4pgmeV3JXFGtw42koYXzAyz5hy8FZlL54ejnCenaLJF6yzGdGMOvpvRUEJcN?=
 =?us-ascii?Q?8TLycMxPaXIUWsou8T8EQo/7MJLjiw+P9AjGr0xdMEzId6cwEtyDuEUuGEkV?=
 =?us-ascii?Q?O4jdmtnI84AZ4ohsgLvh7fAFvt6MrR5hUhHkFyLZimXTjYAogvg8R0YrbtSz?=
 =?us-ascii?Q?/5mbsx/DcQm+sQ5ONDwf8FSjxhAp9jJPT2hpdScZ71jio8veGmpQtKbY9p9E?=
 =?us-ascii?Q?szI0B6D0OtbK9jKRjDRHxk/+SyG7Br2uKSwdag9kkopoLsTo2f1oQ2pekK3h?=
 =?us-ascii?Q?hgm7Wa1GJnr+grX4kVMibrBJw0fBtqBQ6DZx/prlJl/yau7yTS3mr9YB7Oi/?=
 =?us-ascii?Q?d1IxJNEFxYWHycY8g9moEm/Vy2k2JyW7ofhHeHxTjN/y4mSOP3mOeE4tFX/O?=
 =?us-ascii?Q?oiS2c+1K48R7p7uDZaBxnQs2xhZ7/Ss82bhP/di09JidGyHmWsmTYFZmV/Qf?=
 =?us-ascii?Q?c/4ov9+DFqkkjKAoPYuTEiG96PVZXBJlN9JBYLIRKpyGp5jE5GQLZXyTCp3f?=
 =?us-ascii?Q?3qDN217Jth5LXPE3AitrK6cvlqel/7zAgo4K/IZtqy56TUhGIGvo6ldZ707g?=
 =?us-ascii?Q?ggmrduhz6Az3C5lMIN3VN/4gJmPMtxZMr+Kp11MBh5Q6+Fh0WcGb5kCWQjnT?=
 =?us-ascii?Q?z1ibSMZiyUuc7q+0LbY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2bafd9-6813-4b08-993c-08db68cb37fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 09:23:42.9392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lbTQ+/EX1/7qU/CoQy23gLUau+n8KMDy2IFEXgjJ4Vn9UaD10pT46BR1EVF9xWBnhWxWNnIh2ovBqFMySMITkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8192
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Stefan,

> -----Original Message-----
> From: Stefan Wahren <stefan.wahren@i2se.com>
> Sent: Thursday, June 8, 2023 7:39 PM
> To: Xu Yang <xu.yang_2@nxp.com>; robh+dt@kernel.org; krzysztof.kozlowski+=
dt@linaro.org; conor+dt@kernel.org
> Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de; f=
estevam@gmail.com; dl-linux-imx <linux-
> imx@nxp.com>; linux-phy@lists.infradead.org; devicetree@vger.kernel.org; =
linux-arm-kernel@lists.infradead.org; linux-
> usb@vger.kernel.org; Jun Li <jun.li@nxp.com>
> Subject: Re: [EXT] Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: conv=
ert to DT schema format
>
> Caution: This is an external email. Please take care when clicking links =
or opening attachments. When in doubt, report the
> message using the 'Report this email' button
>
>
> Hi Xu,
>
> Am 08.06.23 um 12:30 schrieb Xu Yang:
> > Hi Stefan,
> >
> >> -----Original Message-----
> >> From: Stefan Wahren <stefan.wahren@i2se.com>
> >> Sent: Thursday, June 8, 2023 3:56 PM
> >> To: Xu Yang <xu.yang_2@nxp.com>; robh+dt@kernel.org; krzysztof.kozlows=
ki+dt@linaro.org; conor+dt@kernel.org
> >> Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de=
; festevam@gmail.com; dl-linux-imx
> <linux-
> >> imx@nxp.com>; linux-phy@lists.infradead.org; devicetree@vger.kernel.or=
g; linux-arm-kernel@lists.infradead.org;
> linux-
> >> usb@vger.kernel.org; Jun Li <jun.li@nxp.com>
> >> Subject: [EXT] Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: conve=
rt to DT schema format
> >>
> >> Caution: This is an external email. Please take care when clicking lin=
ks or opening attachments. When in doubt, report
> the
> >> message using the 'Report this email' button
> >>
> >>
> >> Hi Xu,
> >>
> >> Am 08.06.23 um 05:36 schrieb Xu Yang:
> >>> Convert the binding to DT schema format. Besides, this also add other
> >>> optional properties not contained in txt file.
> >>>
> >>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >>>
> >>> ---
> >>> Changes in v2:
> >>>    - change filename to fsl,mxs-usbphy.yaml
> >>>    - add other optional properties
> >>>    - narrow fsl,anatop to imx6
> >>>    - use additionalProperties
> >>> ---
> >>>    .../bindings/phy/fsl,mxs-usbphy.yaml          | 128 ++++++++++++++=
++++
> >>>    .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
> >>>    2 files changed, 128 insertions(+), 33 deletions(-)
> >>>    create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-u=
sbphy.yaml
> >>>    delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-p=
hy.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yam=
l
> >> b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> >>> new file mode 100644
> >>> index 000000000000..1b6b19fdf491
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> >>> @@ -0,0 +1,128 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id:
> >>
> http://devicetree.org/schemas/phy/fsl,mxs-
> &data=3D05%7C01%7Cxu.yang_2%40nxp.com%7C35ccff605dbd46ac9d8608db6814f13f%=
7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638218211379372106%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6I
> k1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DgSKnnBeB7BrscJNdHEPWgALwvaS=
lnZrCbW2lo1K8D0s%3D&reserv
> ed=3D0
> >>
> usbphy.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7C5df4d949f975469013b=
408db67f5d46c%7C686ea1d3bc2b4c
> >>
> 6fa92cd99c5c301635%7C0%7C0%7C638218077754788407%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjo
> >>
> iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D8Sz8tK9GV=
QqE6ywVLpxPB8YDFQvygZvj6s1NjZk
> >> hbzU%3D&reserved=3D0
> >>> +$schema: http://devicetree.org/meta-
> &data=3D05%7C01%7Cxu.yang_2%40nxp.com%7C35ccff605dbd46ac9d8608db6814f13f%=
7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638218211379372106%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6I
> k1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DD3MKKJpLHdfLhK9ubiqQYGZ7ORN=
DOYbA%2FJOQX%2B3DoAg%3
> D&reserved=3D0
> >>
> schemas%2Fcore.yaml%23&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7C5df4d949f97=
5469013b408db67f5d46c%7C686ea1
> >>
> d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638218077754788407%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMD
> >>
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D=
iaX16VnSJnvU%2F0tcnRgsdnTxMsD89
> >> 5r4WquGsCFt9Qo%3D&reserved=3D0
> >>> +
> >>> +title: Freescale MXS USB Phy Device
> >>> +
> >>> +maintainers:
> >>> +  - Xu Yang <xu.yang_2@nxp.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    oneOf:
> >>> +      - enum:
> >>> +          - fsl,imx23-usbphy
> >>> +          - fsl,vf610-usbphy
> >>> +          - fsl,imx7ulp-usbphy
> >>
> >> on the one side the fsl,imx7ulp-usbphy has an individual compatible
> >>
> >>> +      - items:
> >>> +          - enum:
> >>> +              - fsl,imx28-usbphy
> >>> +              - fsl,imx6ul-usbphy
> >>> +              - fsl,imx6sl-usbphy
> >>> +              - fsl,imx6sx-usbphy
> >>> +              - fsl,imx6q-usbphy
> >>> +          - const: fsl,imx23-usbphy
> >>> +      - items:
> >>> +          - const: fsl,imx6sll-usbphy
> >>> +          - const: fsl,imx6ul-usbphy
> >>> +          - const: fsl,imx23-usbphy
> >>> +      - items:
> >>> +          - const: fsl,imx7ulp-usbphy
> >>> +          - const: fsl,imx6ul-usbphy
> >>
> >> on the other side this should be compatible to imx6ul. So at least one
> >> definition seems to be unnecessary.
> >>
> >> Looking at usb/phy/phy-mxs-usb.c suggests me that fsl,imx7ulp-usbphy i=
s
> >> not directly compatible to fsl,imx6ul-usbphy, because the platform dat=
a
> >> is different. So maybe the using dts* files should be fixed instead?
> >
> > The imx7ulp and imx6ul only has minor difference. In general, imx7ulp
> > is compatilbe with imx6ul. We don't need to modify both dts file and
> > this doc here. So the validation of existing dtb would not fail.
>
> The fact that according to the schema imx6ul needs fsl,anatop and
> imx7ulp doesn't need it, let me think that the difference is not really
> minor.
>
> Nevertheless the compatibles for imx7ulp-usbphy looks fishy to me,
> because there are two ways to describe imx7ulp-usbphy ( with and without
> fsl,imx6ul-usbphy ). From my understanding there should be only one way.
>
> In case you are just concerned about validation issues in this series:
> it's acceptable to convert txt file to YAML and fix outstanding
> validation issues within the series via separate patch. In my opinion
> the goal is to get a proper DT schema and not just to avoid DT
> validation warnings.

I reviewed the dts files and driver again. It seems indeedly that
imx7ulp-usbphy is diverged from imx6ul-usbphy today. Therefore, to keep
this doc clear, "fsl,imx7ulp-usbphy", "fsl,imx6ul-usbphy" could be
removed. Thanks for your input. I will remove the second one and keep
the first one in V4.

Thanks,
Xu Yang

>
> Best regards
>
> >
> > Thanks,
> > Xu  Yang
> >
> >>
> >>> +      - items:
> >>> +          - const: fsl,imx8dxl-usbphy
> >>> +          - const: fsl,imx7ulp-usbphy
> >>> +
> >>> +  reg:
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +  interrupts:
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  '#phy-cells':
> >>> +    const: 0
> >>> +
> >>> +  power-domains:
> >>> +    maxItems: 1
> >>> +
> >>> +  fsl,anatop:
> >>> +    description:
> >>> +      phandle for anatop register, it is only for imx6 SoC series.
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +
> >>> +  phy-3p0-supply:
> >>> +    description:
> >>> +      One of USB PHY's power supply. Can be used to keep a good sign=
al
> >>> +      quality.
> >>> +
> >>> +  fsl,tx-cal-45-dn-ohms:
> >>> +    description:
> >>> +      Resistance (in ohms) of switchable high-speed trimming resisto=
r
> >>> +      connected in parallel with the 45 ohm resistor that terminates
> >>> +      the DN output signal.
> >>> +    minimum: 35
> >>> +    maximum: 54
> >>> +    default: 45
> >>> +
> >>> +  fsl,tx-cal-45-dp-ohms:
> >>> +    description:
> >>> +      Resistance (in ohms) of switchable high-speed trimming resisto=
r
> >>> +      connected in parallel with the 45 ohm resistor that terminates
> >>> +      the DP output signal.
> >>> +    minimum: 35
> >>> +    maximum: 54
> >>> +    default: 45
> >>> +
> >>> +  fsl,tx-d-cal:
> >>> +    description:
> >>> +      Current trimming value (as a percentage) of the 17.78 mA TX
> >>> +      reference current.
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    minimum: 79
> >>> +    maximum: 119
> >>> +    default: 100
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - clocks
> >>> +
> >>> +allOf:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          oneOf:
> >>> +            - enum:
> >>> +              - fsl,imx6sl-usbphy
> >>> +              - fsl,imx6sx-usbphy
> >>> +              - fsl,imx6sll-usbphy
> >>> +              - fsl,imx6q-usbphy
> >>> +              - fsl,vf610-usbphy
> >>> +            - items:
> >>> +              - const: fsl,imx6ul-usbphy
> >>> +              - const: fsl,imx23-usbphy
> >>> +    then:
> >>> +      required:
> >>> +        - fsl,anatop
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +
> >>> +    usbphy1: usb-phy@20c9000 {
> >>> +        compatible =3D "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> >>> +        reg =3D <0x020c9000 0x1000>;
> >>> +        interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> >>> +        fsl,anatop =3D <&anatop>;
> >>> +    };
> >>> +
> >>> +...
> >>> diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> b/Documentation/devicetree/bindings/phy/mxs-
> >> usb-phy.txt
> >>> deleted file mode 100644
> >>> index 70c813b0755f..000000000000
> >>> --- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> >>> +++ /dev/null
> >>> @@ -1,33 +0,0 @@
> >>> -* Freescale MXS USB Phy Device
> >>> -
> >>> -Required properties:
> >>> -- compatible: should contain:
> >>> -     * "fsl,imx23-usbphy" for imx23 and imx28
> >>> -     * "fsl,imx6q-usbphy" for imx6dq and imx6dl
> >>> -     * "fsl,imx6sl-usbphy" for imx6sl
> >>> -     * "fsl,vf610-usbphy" for Vybrid vf610
> >>> -     * "fsl,imx6sx-usbphy" for imx6sx
> >>> -     * "fsl,imx7ulp-usbphy" for imx7ulp
> >>> -     * "fsl,imx8dxl-usbphy" for imx8dxl
> >>> -  "fsl,imx23-usbphy" is still a fallback for other strings
> >>> -- reg: Should contain registers location and length
> >>> -- interrupts: Should contain phy interrupt
> >>> -- fsl,anatop: phandle for anatop register, it is only for imx6 SoC s=
eries
> >>> -
> >>> -Optional properties:
> >>> -- fsl,tx-cal-45-dn-ohms: Integer [35-54]. Resistance (in ohms) of sw=
itchable
> >>> -  high-speed trimming resistor connected in parallel with the 45 ohm=
 resistor
> >>> -  that terminates the DN output signal. Default: 45
> >>> -- fsl,tx-cal-45-dp-ohms: Integer [35-54]. Resistance (in ohms) of sw=
itchable
> >>> -  high-speed trimming resistor connected in parallel with the 45 ohm=
 resistor
> >>> -  that terminates the DP output signal. Default: 45
> >>> -- fsl,tx-d-cal: Integer [79-119]. Current trimming value (as a perce=
ntage) of
> >>> -  the 17.78mA TX reference current. Default: 100
> >>> -
> >>> -Example:
> >>> -usbphy1: usb-phy@20c9000 {
> >>> -     compatible =3D "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> >>> -     reg =3D <0x020c9000 0x1000>;
> >>> -     interrupts =3D <0 44 0x04>;
> >>> -     fsl,anatop =3D <&anatop>;
> >>> -};
