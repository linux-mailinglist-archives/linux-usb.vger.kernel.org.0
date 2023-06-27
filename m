Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8008973F888
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 11:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjF0JRA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 05:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbjF0JQz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 05:16:55 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2049.outbound.protection.outlook.com [40.107.8.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42E0213F;
        Tue, 27 Jun 2023 02:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EitP0sv3bAGG04oXXnEJESYO50IO+G3sJjmbYMunu4fqjTvGhYtjovWqe7MuRk9ls8G+04YtSIiileLU4HMYoIKoy2trfqzcGBsTnhYtQUiq4Ml+M7c8ms6xu/qrxfb9gBZ0rAnzJYOiHL1St6F6HYab0CBhGii2o14ZQnIxadQxKNxxL+M7UrtlIE32UTYPLAkXkCpF+8Q0woooOW+g5yo/FgZ2kcsR5wH8h3kN4sTQycPpnyLhBI1Jo6TYbd3/QiQjt9wVDfL2H3q7Va4NYLr/u9vm34yxIqxbc31KSNEo/DuK1l+4Z2W97tZGuC0ldjCDGzONN3Sw0aOc3v4ueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJzcsj9e3eKcY0M++ZBHPwEFy1jPKrYKTadlZyGD1Nk=;
 b=EyCrLLq6Kp+2RoQnmvgFnLn0EpFy/yAeQbhjESEbTNKa83AYwvvnTjf9FeS7GzOaLcU+rfopUj1MiUDugY5Hj3wQYvo94OaGBD+Zq5GYMmFe0I3yhBl3SY4uQ9rUDqoTsxWMkYggvcfBAxPkB4kFyCNngEpPfJzEmu8YaYw1fM6PPiAgj6Rgh2NhI82AQK8p/wrnibt8oEG9uNMHPrhSIn3BjjeoZHF5bOk/HAyGeqRD7eCVxvpJSN3z+5TcFN++5EJh0QpQH80NboW65iMoK+FyVkLq4w2b12+JN2C+sYi9s1q4qePrYitHJcvtP0cJu8ZCL8GGBjxwyMzpMlmHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJzcsj9e3eKcY0M++ZBHPwEFy1jPKrYKTadlZyGD1Nk=;
 b=CXpRrnkxpKvMHnGoyn5G5xnIjf+7500sDg9iLCupG+JOsLoRAmpLG/6ESK2mAfbuFMMuN7eWNlYP60iuf/3SZPzdB/M+TJV50gUwmEeqplyQ7ktpGX3VK38ptcOMFmOB5eIE4cal1+qAM/7h2YA5+4lWnhE8QCo0GRHdllCUO94=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB7846.eurprd04.prod.outlook.com (2603:10a6:20b:2a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 09:16:46 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 09:16:46 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH 2/3] dt-bindings: usb: ci-hdrc-usb2: add
 samsung,picophy-rise-fall-time-adjust property
Thread-Topic: [EXT] Re: [PATCH 2/3] dt-bindings: usb: ci-hdrc-usb2: add
 samsung,picophy-rise-fall-time-adjust property
Thread-Index: AQHZqBBJbsSup2uDJk6TF4DDvs1C16+dOiMAgAC3WJCAAD4+gIAAMALg
Date:   Tue, 27 Jun 2023 09:16:46 +0000
Message-ID: <DB7PR04MB45055836133FC984F6A00B6C8C27A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230626092952.1115834-1-xu.yang_2@nxp.com>
 <20230626092952.1115834-2-xu.yang_2@nxp.com>
 <f7bca54b-9de1-be9a-ad46-3502df58289f@linaro.org>
 <DB7PR04MB4505F485E48DE667D62602748C27A@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <10e356c6-81fa-f127-8263-0fdf8a512aa6@linaro.org>
In-Reply-To: <10e356c6-81fa-f127-8263-0fdf8a512aa6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS8PR04MB7846:EE_
x-ms-office365-filtering-correlation-id: 33507b98-3e91-4d94-21e0-08db76ef3b45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fPoGukMdmudHuUZufXgpqg1aGHnhCEGosw9TLuPJTJNVWsE9jYgO83xRthKv7iV33ITTW9Qo5dPAXinLNOJl1Nus+OwShka5JS3T+L3Bxe3Uci02iJxvkcqK0H2KO90sngpOdVMu2zpAAHZyyLJXJv76UBsaUxRa5LDIXPl+e4KwWBEavHBo05vgCdS0byJLNlGJrUUm/phQGpUk8T5G94lJKlEzg+S1zKgPdMrQuTcnkCysfTPz98Vl7jxip9UuCNEXCrPpVXc2XZ4DaBcHO4oJhiSr2Q3ld0+eIMQFkl3AkyGaV4sGFo27iRKqKHDZLl+kTdAW/Qlnn6vpvk1IccQ4xnh96gTHkTAL9vIyK6NAQpAWDnujt9E9ZceXF+QVOlyIZW+xrzcKXlQ1QDk/KA+Waw6AUHBzrY8cedQpX5xT4JqvFqJ85m9spPXz3IJcvCwyLILkMC20B7WaTLwXt1VE5TSjQUAkscIHtj1KFEB6XaQfiUsgJET3BKd7s4BiT0QwRPFzug0NM6/xiDnu0BKtqXsbCjQfYBxwPiWwmlfqEWZAbVb/dcYHnHHqRwo+t3kK+8Km4ERDulGOXLAKkU7xSOk27p/zOvALk0pI/ns=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199021)(110136005)(54906003)(2906002)(45080400002)(7696005)(38100700002)(83380400001)(26005)(6506007)(186003)(122000001)(53546011)(71200400001)(9686003)(55016003)(966005)(86362001)(41300700001)(478600001)(38070700005)(64756008)(66556008)(66446008)(66946007)(33656002)(76116006)(66476007)(316002)(4326008)(8936002)(7416002)(8676002)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TYOV+jJjNtT3ywaIVhTUYMNrSY+IZfBonemEdtauEmAMOI6O5GlaD5vfXbj5?=
 =?us-ascii?Q?IyEbebW9ShkdXDdPFTHtmNPOrXWuosbOM4MU5heHzNyWaxgR3Hc/NvlKcneT?=
 =?us-ascii?Q?aNPd5NKTDTcQlfrCtRU9cMIhuByExNTuPIfX9rlU+Go10hqjR9n4Ks6rSOM+?=
 =?us-ascii?Q?ms/1WsgA//bxHtoWK5hUuObGpOS0aJbdVit/7pKCSApH6flqENUuhPus7Bpb?=
 =?us-ascii?Q?5/yAG/GLbs6kkW0zMNNnb/v+ZbQY7ip0FOu9bj/l+9B9LgTvzd5jCcjRluZs?=
 =?us-ascii?Q?i4TMFWPIosuo5gCHaHE4+ocYWPs80cMcmjBfDmKA22RS+LChKPeoiuq6N2hN?=
 =?us-ascii?Q?gBg4fQSETMM7LOfcikSOkbnJHPja7LE+nzrAxhd6SvZfGzVON7S8MTTu7VYj?=
 =?us-ascii?Q?YgxRRhaM8wstqt3Z0CVLx8JYoHYYCPsY7nDHExY+6RKBrhiQ6JkZ/Qov4NR6?=
 =?us-ascii?Q?qXNU5qbweblbWvwTgqWsgh2gIajRUw383i/JgIULe39EbAYnPCNn/nUjcQda?=
 =?us-ascii?Q?HCak+VM+KtJJKFNQ0zESDNkorSb6wkxW5Z+o4dKwotMh00lDB7UmRbo6ebJu?=
 =?us-ascii?Q?BewvQJl/T6N635/SSN0tWS+/xFS/GSRQEoA81Du7M0KfA9Bg1gcAjDd43EXE?=
 =?us-ascii?Q?j4ec1kFFKRVsQhhGtBvVu9TKQoU7UkISJkumE3PLcuR6AZnZMUyqoiJ1HA1M?=
 =?us-ascii?Q?GfyIFuNZ/2wJLoDbpo7UUgWVwhgVDxroVWH3IIVI9ZjxuSNmhNrt6T9wv+ed?=
 =?us-ascii?Q?aOaghOPeKDeTD3a5vThenC/FtmxbpO7Aiddc1580eGOC66DXodehFmW8x3qX?=
 =?us-ascii?Q?HNCO+0r/hOrxmwI8Gr8j26EKCxNp7RLjadh+hCnt5sy41GDbJQ4RDPbesjus?=
 =?us-ascii?Q?MjEbdKPx2rKXXH+GYpGnaIlHA2KgXlAgkd31aAPsRopxCmSQh56csgcVRNVY?=
 =?us-ascii?Q?VlaTWIFXQLD488uD0MOoBFWCTFMlCXIdkhLEkr1zxESw/4+nUy/tQtPPKllS?=
 =?us-ascii?Q?EjrDY0Fqn3EzK/enb6pqj+kMywo1jGHHQ7mWGP02g3tRLFwOrA73njjOP9E+?=
 =?us-ascii?Q?nJGvh6ZicS3GZ/LlZAaKk6xW2nSn4FGqKKzY2+Jk9+7sAjK6f+CjVWPaOcXB?=
 =?us-ascii?Q?ITA5l3NR6NcZOlqmf45gn6KFBFJfiywLBjt8akh6YMtcxFFGI2h5kHdoDPe8?=
 =?us-ascii?Q?Sddvt8hw3lefUzWocY9EQiTq83OqnNaZoYXAtYQNyUBY0WUSyjGp04ZPBgK0?=
 =?us-ascii?Q?EDH4mQ69q7h9bSOlEneNU2qh6ErvACq4s6qpUGs4CMJHPF3Zl2F3F96+hSnG?=
 =?us-ascii?Q?m3HlGh5ryHjEgZtXz5Ez9bbUJXdeLeHG8K6P+KQq3p6UInFTVvqL5Lhs4G+c?=
 =?us-ascii?Q?lklRdRNbMqr5FtqjQU5xMU/ZsU4DRRSfZaZTw5EDqjiNJk/Ik7kzfXFFTeXJ?=
 =?us-ascii?Q?qkf5XrMBMg+M2Rwe/oL5UXVyWcZbReyghbRm3d1ofL3Er2ElMHYoTQC4OnEA?=
 =?us-ascii?Q?1oLerOrEfaivYmStCqVLM6Cd8E6wXQDJyfptg75hBi4oTPJ6NsSOmYkHHfWV?=
 =?us-ascii?Q?/52NEBCgZP5pXpnuFko=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33507b98-3e91-4d94-21e0-08db76ef3b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 09:16:46.6516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kh/3Cb2hD5c2mnzMMw1fXjv7flpxMPWAdzRMptN2/VDU6L0KAc7kA9j7hE5hor0x6OFDkrMwsCpB2ChGhQYyCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7846
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Tuesday, June 27, 2023 2:24 PM
> To: Xu Yang <xu.yang_2@nxp.com>; peter.chen@kernel.org; robh+dt@kernel.or=
g; krzysztof.kozlowski+dt@linaro.org;
> gregkh@linuxfoundation.org
> Cc: conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de; dl-=
linux-imx <linux-imx@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; linux-usb@vger.kernel.org; devicetree@vger.kernel.org=
; Jun Li <jun.li@nxp.com>
> Subject: Re: [EXT] Re: [PATCH 2/3] dt-bindings: usb: ci-hdrc-usb2: add sa=
msung,picophy-rise-fall-time-adjust property
>
> Caution: This is an external email. Please take care when clicking links =
or opening attachments. When in doubt, report the
> message using the 'Report this email' button
>
>
> On 27/06/2023 05:10, Xu Yang wrote:
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Sent: Monday, June 26, 2023 11:45 PM
> >> To: Xu Yang <xu.yang_2@nxp.com>; peter.chen@kernel.org; robh+dt@kernel=
.org; krzysztof.kozlowski+dt@linaro.org;
> >> gregkh@linuxfoundation.org
> >> Cc: conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de; =
dl-linux-imx <linux-imx@nxp.com>; Peng
> Fan
> >> <peng.fan@nxp.com>; linux-usb@vger.kernel.org; devicetree@vger.kernel.=
org; Jun Li <jun.li@nxp.com>
> >> Subject: [EXT] Re: [PATCH 2/3] dt-bindings: usb: ci-hdrc-usb2: add sam=
sung,picophy-rise-fall-time-adjust property
> >>
> >> Caution: This is an external email. Please take care when clicking lin=
ks or opening attachments. When in doubt, report
> the
> >> message using the 'Report this email' button
> >>
> >>
> >> On 26/06/2023 11:29, Xu Yang wrote:
> >>> The samsung,picophy-rise-fall-time-adjust property can help to adjust=
 the
> >>> rise/fall times of the high-speed transmitter waveform. The value can=
 be
> >>> 0~3.
> >>>
> >>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >>> ---
> >>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml          | 10 ++++++++=
++
> >>>  1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml =
b/Documentation/devicetree/bindings/usb/ci-
> >> hdrc-usb2.yaml
> >>> index 782402800d4a..d84c66c342ac 100644
> >>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> >>> @@ -292,6 +292,16 @@ properties:
> >>>      minimum: 0x0
> >>>      maximum: 0xf
> >>>
> >>> +  samsung,picophy-rise-fall-time-adjust:
> >>> +    description:
> >>> +      HS Transmitter Rise/Fall Time Adjustment. Adjust the rise/fall=
 times
> >>
> >> Adjust with/by what? What are the units?
> >
> > This property is used to adjust the rise/fall time of the high-speed
> > transmitter waveform. It has no unit. According to the description of
> > USBNC_n_PHY_CFG1 register, the rise/fall time will be increased or
> > decreased by a certain percentage relative to design default time if
> > a value is given to this property.
> >
> > The actions as below:
> >   - 0: -10%
> >   - 1: design default
> >   - 2: +15%
> >   - 3: +20%
>
> Include it then in the description or even make the property -percent:

Okay, will add this in v2.

Thanks,
Xu Yang

> https://github.com/devicetree-org/dt-
> schema%2Fblob%2Fmain%2Fdtschema%2Fschemas%2Fproperty-
> units.yaml&data=3D05%7C01%7Cxu.yang_2%40nxp.com%7C9ba7b99a7b6849ec138e08d=
b76d71211%7C686ea1d3bc2b4c6fa92
> cd99c5c301635%7C0%7C0%7C638234438320292819%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2lu
> MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dj3mETXe6ZMmeDx=
FbZ3N1hQaIb4wSt3IrIIbxm8f%2F
> S1g%3D&reserved=3D0
>
>
> Best regards,
> Krzysztof

