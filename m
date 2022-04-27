Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 067085112A8
	for <lists+linux-usb@lfdr.de>; Wed, 27 Apr 2022 09:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358945AbiD0Hkj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 03:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358935AbiD0Hkh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 03:40:37 -0400
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (mail-zr0che01on2132.outbound.protection.outlook.com [40.107.24.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B86B42EE;
        Wed, 27 Apr 2022 00:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKYub04GbCnpo9jF9nGpW0Bmq0b6Zbfc5VLKKWk0+pudMfwKmaWev0Hv5cnH9QnD0UVlEIts6cFXGxEMMyWgjyoiK5jK7Fy36nVxGLskHcgjHXdcYF7DDmWNdOl8/xorrcnT4P1VxD0TZ+/c1cxB/gkq/fK2aMwpxP8SQJJMHQFqhOJ06g3KjcX4y48bmHPrU9m+NZYBKOnHKh+NyGQq0e/D3AQlC45yLN1xOgNyTfGigE6B78epKFSUoE4kHIQI9R5n+PPzc6kiY3l9a7mdqIQ0mXSTTWJCWA8eXSyEWz+GWMP9Fx1Yq0mM7SbpCp6Rd8oetSq4VTK9arLLtE9PSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL79KEuRFR8cxz7nnlnGlkb30hjnNY9hly2lZPl0DU8=;
 b=PBSBzGxUmedfSnKtaft38FWlYjJnn2OITz9bmPbaEAVvYxxusKVae4N1I9at4Ew6cP9mna3lVDWOKJEP4/ZN0zoPD6ZHPV2vnYQYb4ztBVJXxv6CPGA9Ntoqf6cnNzitxrklepNDHLbRt99Q4WN6EbIWFrh46TxPjjfheICBX2Cnu2zhEFEwpOwW4nCf7FKcEHKoehkYZRjWx5IbRZeX3PbDcWsfnvcW3Is7TDNoCb7FDdFno5a1pbBTKgJgI8BlB9uAh/A4NhZrp5Foxj1BqeV1jgabxXMHl3D210norbT7ZfIYODjK2JhrnzIU9wvJyPB2y686Tgml7urd3Oz0IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sL79KEuRFR8cxz7nnlnGlkb30hjnNY9hly2lZPl0DU8=;
 b=s92MhWnyXAtBF5Al8I5ijlgTfxmPC4do7zcDxa58wtyHK5S69ie1mnRlXoaE7nQzz37B/qRL1yjYtvIt4fvedDb2Fqdo2KqNwu23eEMVN/MS9hZex+lx9whP7w89e34/m+sFRILBPlKzfs2I4LTrkUkogJG1MActYBkdBdKBojsiODTuV3Q+djJoxwO9SJ8G4nzHIMXTnLJocP9QX/bivGqNhsVvksL8iCFVxzM1VQ48QdHculnbEUQxOodh/8pnRZ6Gm0pi33El6KdJI3X1jZ7+Ec6jpbLp+QzY0jok+Q7RAESqAy9DantL5y6e06fVzWoJq7VURGtgXeyXE/QPYg==
Received: from ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4c::12)
 by ZR0P278MB0314.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:35::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 07:37:21 +0000
Received: from ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f4a7:62d3:f7d7:9920]) by ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f4a7:62d3:f7d7:9920%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 07:37:21 +0000
From:   Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To:     Daniels Umanovskis <du@axentia.se>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 reset-delay-us
Thread-Topic: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 reset-delay-us
Thread-Index: AQHYWWnjac+b42BO50K+p8y+9G7Sfa0DYG0A
Date:   Wed, 27 Apr 2022 07:37:21 +0000
Message-ID: <YmjysEuwqdWoamN3@ltleri2>
References: <20220426123329.775-1-du@axentia.se>
 <20220426123329.775-2-du@axentia.se>
In-Reply-To: <20220426123329.775-2-du@axentia.se>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2af485fc-d29a-4bf2-6355-08da2820c3bd
x-ms-traffictypediagnostic: ZR0P278MB0314:EE_
x-microsoft-antispam-prvs: <ZR0P278MB03141934FAB5B28459894F6FF0FA9@ZR0P278MB0314.CHEP278.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5awMqnTHz5pnEwJZQusWfjtyRwm0q4Oa/3yL2GLOwUaDUCDmul2W8iCX90s7JZoeJYwIrt3bOTqnDLdOsRS+e46BmrCl1QjcB3LjfPT5Pl/vfJZgM8TIOco+h2SjrUxqWNayM3bjgtZ8nB34IJp46n5IzoYZFHh1inVLvICnV+SWZ4XkEie/L/0sus0VFz4VUNWX6nKAT/ZjwNoXZOaQeRGF8sAwKs2EWxYqqpUvcJr8v77wTL6ItwlpvxWrJdb6FgwqP3TZSGoFMlKHgKyPrNiW4uS+jtBYGup4lZt0lx8gMKkZyDMPQ+/GXS6WA+5czp5FOliUDulMvAf7u0zdpNMZ6j/qe6B3qEyh1AD8LIjsdODC5CYgWytdZCKEoeqzYXPO9kXe6P0lCMUq6Ea2luTBxhnkB/NMHN3Mr8nONteRZTuQgR6UD8zATTUFgF460pPd6N9ez7K0mHgvgD6lOZ1hTMPsduP0NVY98gwiYPU/J2elQzbj6DS8KS9TwGNbEHfAQw70/M9h22QaQRWpDUwcboyScovaVS5aQnFoV7SzbU9LjLrsVwxnfLPcWkRawQ+egjlHoUkagcXIc6hmycbv0BYQlgcxw36zWRc5NAxWrgbwOmO4toyMccyelKRRJxQHqPUIp8xJASAZGcqpGqNz41XXnSb7Wub3ZpcFdHcWZDe8+6RSUBwsiwCQGNKfuLoyPF5WcbvbJVRWxAwRyQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66476007)(91956017)(76116006)(26005)(71200400001)(66946007)(8676002)(66446008)(64756008)(316002)(66556008)(6486002)(54906003)(9686003)(38100700002)(38070700005)(86362001)(6512007)(508600001)(6506007)(122000001)(186003)(6916009)(2906002)(5660300002)(33716001)(8936002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8/8m2VJInMXEdIZXmk2YamMzB2Mm9LA5XNbXpV6zmv++V7oDL1PaK/tGA4d3?=
 =?us-ascii?Q?R9Rm65uq1wo8jB52dSbX6ftrsDatAptqC50OMXmpGTjeoPoxzTA9/h+CxUpD?=
 =?us-ascii?Q?e3ItJGsjgSW62BYl8linNXFhc03vs1MpKgOYeDHWtIX6BkAzxJbYQ3eXlyIo?=
 =?us-ascii?Q?mANoVDtXk2Ca4xhQQ38kNb1h0oxiDMfaHNVrMiw/Cwfdzj62IazDJAl0zkG+?=
 =?us-ascii?Q?Qze7ppQ8lF8UlJzREZhOzEtibc9p7ajVARI5DsRKQKGisaMCb5d2JKgzRe9S?=
 =?us-ascii?Q?DsMBE0AHm9Leb6BtiRzab1pr5A8avmjOo+lUDRyfg8qBThwX4/+u6ju14th3?=
 =?us-ascii?Q?474/WcmpZ1Y3Y6EiHZhbpUCd6kyPO4bAIU0ncjVdjcpm+G7xjhSlrPgCdg1B?=
 =?us-ascii?Q?zsLg+VmMBv/tUAvYjaj3KeEZAbiAHTLHWIhkv9StuPABlGVNCYgAQW5PZ8dx?=
 =?us-ascii?Q?8opOFaFQHFDSfbLiWcbJ47POBt1N9gCGa5aFzFfuOXFMOZ3x4Ie6zG2zHWZa?=
 =?us-ascii?Q?vVZbOufFuPU7plLGXtfCBSXFd78nRTLdi0xbnLrx3DglLKy8N+D9Dan2hFSK?=
 =?us-ascii?Q?TwBEJlBqiHgV02cDWOy5wT7tLzSiXne+KtsWuAjmlpYh499an9TvidfxEIT/?=
 =?us-ascii?Q?7ZtA9GTAYrIRFPvc+wYHSN8goDri/tjJmlj3b7B022DAq28Daap9lXM8d7ZF?=
 =?us-ascii?Q?Agoc30CEbaGt4T2x7f44yYcmLbBZn/LwH27VXXTRtBgccV+B+w4cFjnBuNcH?=
 =?us-ascii?Q?XHVkN+mZ4D6uJUWb+GWrnaApgf3G7vPUlyuSesQfm8e4xyUm6cqy7mblCcFU?=
 =?us-ascii?Q?eGZiq1KxueghW0VcFFMzr1DW79DlXyFo9NU7mWl/UAkyHs2JOp6/DCEqRA/C?=
 =?us-ascii?Q?/yrydOCbLs4BDxTPbddIc0L/vx2zoOqKMSFwRvSRWRMyZa9l0y5EMJLxPMqq?=
 =?us-ascii?Q?8NdG9PmXy/a8iWsJy2dsOL1AHdI1Aw+/GIyJO41XvMZgAacRNp2mSY9D48Jg?=
 =?us-ascii?Q?9GGUT/fHO5ijR7CDEAXproY1eIBBbRM+fty6QR+wnQ0b6wkuJKAuDjnd+tAm?=
 =?us-ascii?Q?Hi88gCdSk1rPKh59MjOdQPRl67uBXsU89egAX5R64bUWd6HSxth6nWtwvILr?=
 =?us-ascii?Q?j1Mb06iXNPx5MYgrm3r7SQA4Vf1d1D/jiWcyOhvh6KX0n0S/I4fO9MX7UOI6?=
 =?us-ascii?Q?mRTMJPmWMgFSJDtsFSSsv9PnmHX9yK302X/CC8ILbgeQlCAlAQ2QKAlr7XED?=
 =?us-ascii?Q?OpzAS3Z2aZn9h+NjmO0/+C494OBCcf7V74YggZolkQ5IQJ9tTra+1lNN9Xf6?=
 =?us-ascii?Q?X7UWfhGVJvnt+QHC0HZ9mzHahSvFFcrpcHwqLuUKFoGD/PhMKfehBTHYOFRV?=
 =?us-ascii?Q?0oJwUcccvMAsjskJezs1Db1/v0aCm4BzDMTyK/kV69XHGpZDHQCLNuD2qgSp?=
 =?us-ascii?Q?SQRHK2V/KUYFNk6XsrtRItO//PPXj2YNzUaqDKvFnDhmvfZBDnRjcDLFHbXW?=
 =?us-ascii?Q?c436HMm6nhgNUIfkuzQdhdjy+vKK8jB2vazdy7lfDmOwE0DFJnsMwGhIUkR/?=
 =?us-ascii?Q?09C1xvfBZagn3mZahPnkVuWEBP+FItEnLpYXJbuW+W7Zld+sOBq0A7C0NAQJ?=
 =?us-ascii?Q?ourok6ezHAg2zAJmZnvF8SIBNEa3hQ+AcGikWA4BZ8WlxsDvEvjea+7l+awV?=
 =?us-ascii?Q?Lw9lqw0B+Qno0YWU2yBch87TaXbi28P4/R+ZDJouRPTDhw+WjhC02CJ5g5nU?=
 =?us-ascii?Q?1WvoVxU8k76uii4YoTpArUE5IoiOiGkB0Xx9CG2zY6of3R7Rx1im?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <186FF62113794A41816EB9F336AA9FFD@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af485fc-d29a-4bf2-6355-08da2820c3bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 07:37:21.4223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2CFUS3FTdFYztjmryZtLjYzF4a8PvVkxEoOxLNuMXsDhHBfH3Ud6WwQS8zIO+9G6ZNDt//3CfPuRLX6DF0oWtg6bN+RseV3bTMmN5IWLojI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0314
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 26, 2022 at 12:33:47PM +0000, Daniels Umanovskis wrote:
> Next patch implements support for this property
>=20
> Signed-off-by: Daniels Umanovskis <du@axentia.se>

LGTM.

Reviewed-by: Richard Leitner <richard.leitner@skidata.com>

> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documen=
tation/devicetree/bindings/usb/usb251xb.txt
> index 1a934eab175e..d95c8ae518e7 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -12,6 +12,8 @@ Required properties :
> =20
>  Optional properties :
>   - reset-gpios : Should specify the gpio for hub reset
> + - reset-delay-us: Specifies delay in microseconds after reset deassert
> +        on hub power-up. (32 bit, default is 500us)
>   - vdd-supply : Should specify the phandle to the regulator supplying vd=
d
>   - skip-config : Skip Hub configuration, but only send the USB-Attach co=
mmand
>   - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
> --=20
> 2.30.2
> =
