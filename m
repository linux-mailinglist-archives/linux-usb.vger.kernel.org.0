Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCD35A7341
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 03:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiHaBS1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 21:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiHaBS0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 21:18:26 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587D9AC248
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 18:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMUR0fwkMdL/XDn8QQQoAM5TNCTlnNW8F6eIXvzN5EQ2WuWIfCyigp4PHz0zWn6c0EelJYoZc9t89FjYc5ZL+a2P+jKVHAdJ/6r2a+AReA6VsrwiZdj/s5pEmzEXLlh4xk2jdmLDgCPHOETwzHfTHhBp28jKH7pp5marjZdiZW1DiEFr1NT5ZPR/VahWDgV8FrJEczcaV146U8/f5Tz9IntZ7FbvQY8nTu363IpqTMwvbzNoL+gf22R5rajc9fIosHMKlsBmxwKFjrOJvj0vNeifcoXkxbKHGwkJThuU1gfsaxDACFvkwowSrH4SL4PTZ1wrnyz2vWUMVzDRLBBhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rgj3QZG7TzPZH/OBMPXsD3aaNsfo1tm6T1bougQa0M=;
 b=HDmPlqEk0f885QQTHHiZ/kHKcqfEfGyqfyT5Ssu8PMOnvZ/WPHb8HQu4u4wnYfOnlv9CQ4iC2xc3NBJLT67uL7E9I6gJsVUhIeYund7KRYW1mJ8U2yOg5usdE2QrE7YMag63LT1H7WSXe1+U96LaVWAuYff0eB5XlS9SSL422Q23G/t+N36zRNtI1vfrL9bk+lM6StPQ7sPoyDnaa3FBgnN2JsvVUq5NQQ+e4YNunyTzPbQrJb9Ds7MB/wgGDsInslD6mG1UlDNHNZ2SES/6X84ApCsSCp0pUrEI809obtW8+B7DDTm9O+/aWig/fkajn9EFMLSBptGedzNFPmWoEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rgj3QZG7TzPZH/OBMPXsD3aaNsfo1tm6T1bougQa0M=;
 b=YLnMnW3oNjjEmmok71G0WlZdv2lEKvq/WvUBQ2k4aZ5WiN8ACexmG3AbJpoGJ/u60T3pS/sJwFMoxxetAWnT7dCgaOVa13GPqW1Dk2KMhKeAc7byw6hNsd+xWINtJ81zAxiSOf3Uob1SW5kRi2oarzXzqTvzuks+/4VU2sR3III=
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9)
 by AM0PR0402MB3490.eurprd04.prod.outlook.com (2603:10a6:208:1a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Wed, 31 Aug
 2022 01:18:17 +0000
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::38fa:c0c7:75b2:39fb]) by DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::38fa:c0c7:75b2:39fb%8]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 01:18:17 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     "tharvey@gateworks.com" <tharvey@gateworks.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Jun Li <jun.li@nxp.com>
CC:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jun Li <jun.li@nxp.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Felipe Balbi <balbi@kernel.org>,
        Fabio Estevam <festevam@denx.de>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: RE: imx8mp USB OTG/dual-role
Thread-Topic: imx8mp USB OTG/dual-role
Thread-Index: AQHYvJlu/FbpWPFIAUGQFgdKXhdUCK3INXOQ
Date:   Wed, 31 Aug 2022 01:18:17 +0000
Message-ID: <DB9PR04MB8412164E22460736FB15B8D687789@DB9PR04MB8412.eurprd04.prod.outlook.com>
References: <CAJ+vNU2bLPAta6GpDn_dGSrCnCRuBtxvLZ-g01h1jGwQuruBuA@mail.gmail.com>
In-Reply-To: <CAJ+vNU2bLPAta6GpDn_dGSrCnCRuBtxvLZ-g01h1jGwQuruBuA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0db1444-b856-4608-a0d2-08da8aeeaf54
x-ms-traffictypediagnostic: AM0PR0402MB3490:EE_
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FE852dUsvBktZLUxe+JRNIsevGPewYzqKaGmjgBupUjDKE0YVAeTNgVEWbGWrQZyz3U2PtG8o+65ltDFRzMK4K5KKcE3VP8UBsNhJPp7rA9Q7nvHXW0h0DXkehO80nJEkbiU5Xtyi0NTygSWcgs6NXX3ue5REwnjuIWdMI3A4ogtZlh/W8Fkgr8iGst7ECA0B4PpV9ZkQF93MYJLiKWUXiHwa0zqiJ40ARm9EJ4Zx54AuNOvxxnRuIqMLdWg8noN5FNalJGDOJaor6mSEmbUnC+amxg20JzQZ5daz1WHIl3tKmzOGYBa5tFijPAWjZRK5NGjAhkJeUqqroE8rI9dDpjh5h84ddQ8C8O6Uvwd8SgwsU67TZ10ZBu7m07sCNOptio2ZUOowUgS0/9Oz8sxiSW1V9469uRgULcv/vpnai+aIRuz6ZEDOrZnkaKQEFhRayvAiNpNmNlnPgnrCVrfkuvj3Xq8HGjl8D9rK9fcpIii6VWAgT6tHfe/lrfvakRWdqNgI8VvUcnjoISZ8M3biPxvEABcDAOwPhBkIT7MVfDsl7Vv/3k1pGJ6wchq5UvRvdkQY1oczTnO3qtKRaffkLlGSrhPKZ5GSgMPp4vXY7REKOOAYKbb4W+X+pSBhJObjYI7tK1Qe1vAs/ArMvZXukaLQNj7q4WAbZnt6UEdkVZn4KQb+R+C99+bNQOsF7PDipPXZMH2sTtm3vX2HF912/66qlcmgfYyKEJEe1sRdLHY4XewpvyYozVkhS0S9L38OF7OJjMfYM+h7PuO4Vgsn6LO/uIDOHbQ2H54DE8m7Geewvb0S3CaaeZCFcv21Kcq/uoIruXe2O7MmG4rbFovhngF0JaQ9ZfFT6uv329coDY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8412.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(86362001)(83380400001)(54906003)(71200400001)(7416002)(8936002)(6636002)(55016003)(186003)(52536014)(110136005)(33656002)(9686003)(2906002)(5660300002)(64756008)(66946007)(66476007)(66446008)(122000001)(76116006)(66556008)(316002)(8676002)(38100700002)(6506007)(26005)(7696005)(4326008)(41300700001)(478600001)(38070700005)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTRid2hjdG1IT2RqdUZpbXJGUnNIYnh1TmFNMnZIWTV4WWlyT20vR09UZE42?=
 =?utf-8?B?ZjE4WEpKcTNpWUdyaHYvbGhJWHpxN3l0SVFNTEppb2NuUm53eVBsMXNXYm8v?=
 =?utf-8?B?aTFNMFUxS21RUHdZTy82Y0NzM0NEbDlKdHhObE05bHlGN012L0kxbElwMmJF?=
 =?utf-8?B?eEx2U090SzFicjdQakpFajZzSUs1MUU2NmJRTDBFSjdWamM1T29HVkxvRUZL?=
 =?utf-8?B?SlA4dlFqUjFuSHJMM3pnYlJ5UGw4UUErUHNCNkljaUxpdHAvdzBTTmc0U1Vx?=
 =?utf-8?B?WnBLMDBlZ0tSdXhIRU9rVnByYnBRNXU1UUpRdkV4RVlOemMyYWNvcURpQVBH?=
 =?utf-8?B?L3hvM05Dek9LeFV0TFlxOTNxdkE5ZXJYNW5vQjdKT3dkVEx1L24xL1V3WFdU?=
 =?utf-8?B?SFJINFpvREFlaTQySENQaFhBNkFVQXdSQnZkREttWnJuckszR0N5Vzd1R2dU?=
 =?utf-8?B?cDVvVzNZSFZRR2w0QU9TZVFuMmRqSERNRTVKQnRkY2lUWFNQNUhvQ01vOHBM?=
 =?utf-8?B?MUtTOElJQ3RVdVpTUnllN0hENEp4MFRCd0taSjN1cHhaSTFsbWJ1VlI4OWJ6?=
 =?utf-8?B?NVQ4ek4wZ3pSZWM5Y0FHQWtMNEpGcUNBeUlZbnc2RnFmZXdSNU1vTFlZWW1M?=
 =?utf-8?B?TUtRQ1NTRi9lUUorVjcwdjVUaTl2eXB0blJYV1dEYXNtcUhqb1BvVThLd3JJ?=
 =?utf-8?B?Q2JkdEtnczlEZkRsRkh5Y1UzOWI0cDQyU2tNWWpTN3RlRkFybFpnK3BHUjFq?=
 =?utf-8?B?N3VxS1JGeDJXd01xcXpPU2RuNjEvSnhLaW5lRXAzeUxWbHQzaEhJMHZzdkJl?=
 =?utf-8?B?QmgvZW1zRWo0aTdKMDM3amFOTTdwMmNrYkpOZHVWV3dXVjZRaXJHRXI2aWhE?=
 =?utf-8?B?MDNWdGt4TGdQV3E5aGFFK1ArU3pxWm1jbnViMmM2V3dwMDh3bis5YnBleDln?=
 =?utf-8?B?ZHlDWGRndTVhLzdURVFYanZJbDNiSUk3L1ovbEJLcm5ZaU8ybXFUeVVxdmNY?=
 =?utf-8?B?SkdsVEdpMlVuWFFzUXNxU1NmMWJaK2l6c216TGVUMFkxcVQzd0Z2UHdFRnBs?=
 =?utf-8?B?THAzdUVWTW56cjlZOFN1NHhld0RXMEdzZDFBcWpxTy9HK1FzajJrWG93M1V4?=
 =?utf-8?B?blljVGRtZUFhRmFJcituM2FUN3h0V2tFamp6OFBGM1U5SXJHY29iZFdPR2NR?=
 =?utf-8?B?QXEzcmhUc0ozeFJWdXc2Z2lWR2c3SUFERDJTZmwxTHFTQTROVTdwbnE5WGQv?=
 =?utf-8?B?dVFjME1YdXh0aCtILzhFTVNiNDJpeTdZTEJjS1ZGVVBJdGhQd0daR3RzRnBi?=
 =?utf-8?B?YXpZanBUSExScC9uc2tMcnIzOS9aMXp6Mk5vcTNCbVcydXN1MzRLM2lBeTZZ?=
 =?utf-8?B?WFhxYkcrRDBSamhvZWF3UXVoTE1aR1BzeUpMYk5LV3V0V215cXFZK1lUZkpQ?=
 =?utf-8?B?WlJ5THU5dGtWTGsyN0F0S2FhZWVCYW9yQldsa0dLNjZ5TzV0OGJGOTI4TEl2?=
 =?utf-8?B?bHUxdDBiNW5Xc2Q5dXFEeGVJQzV1TzhnMHlkWEZuRHhWR1RicDNhVVQzM3pm?=
 =?utf-8?B?MjJqM1EzQSt5ZE5rMDBuM1hYdjlqZkEvbFB0YUxGeFU1SVR6c3F2RkxwaTJM?=
 =?utf-8?B?c1F0N012TGYrRmgxbWJPZURvTmpXNVA0MUs2L2MzRUhOdSt3TmtQaGxSY1Vq?=
 =?utf-8?B?S0NndjNFdzBpaW8rY1N4eTNRRmsvVXZib3JpektwS29TUWo1QjZBc3dlaVcy?=
 =?utf-8?B?K3lXNXJKQ1hNeDVoalpCTVMxVWpLMjM2SmczWXZRL1JFRVVtbE5vVE5IY0JI?=
 =?utf-8?B?Sm9hZFo3eHdwaENLbnJNbDJiQlllVU5jemJFd1dicy9RaG5tQndaUGtBOWl3?=
 =?utf-8?B?K2loN0JKVEpha0ZrRkJVYkVjVlZlUmRWaUpzTXNGMzQ4VHE1MG1zYmdKWHB3?=
 =?utf-8?B?YVdOOGV5bWNCZlEyY3VHRDRFNFNGOXJabXhZbFcrQUcwLzZWY2NudWVhTkFX?=
 =?utf-8?B?QlROL3R0ck1vU1M2WEhFa3dWVXVQU0JBTzJTTXZGRTVZcVkvaEFURnFkMEUx?=
 =?utf-8?B?OVRmc1RDRTJPQkV6UEFScEpmVm5WU3BuZWVuM3E2MDBHajBpT0l4L1liWWlZ?=
 =?utf-8?Q?qgME=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8412.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0db1444-b856-4608-a0d2-08da8aeeaf54
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 01:18:17.4598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IeM659RXWBGOERwsRiI32bcgNSJ50vhbvR3DY782GbfFTc3NhnXtfum3cvhK52kwFV1BxwLb1uLwlrAcN1lWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3490
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SnVuLCBhcyB3ZSBkaXNjdXNzZWQgYmVmb3JlLCBhbnkgY29uY2x1c2lvbiBvbiBob3cgdG8gaGFu
ZGxlIHRoZSBVU0IgT1RHIElEIHBpbiBpbiBSTT8NCg0KDQpCUg0KSmFja3kgQmFpDQoNCj4gU3Vi
amVjdDogaW14OG1wIFVTQiBPVEcvZHVhbC1yb2xlDQo+IA0KPiBHcmVldGluZ3MsDQo+IA0KPiBJ
IGhhdmUgYW4gaW14OG1wIGJvYXJkIChpbXg4bXAtdmVuaWNlLWd3NzR4eCkgd2hpY2ggaGFzIGEg
RFdDMyBVU0INCj4gaG9zdCBjb250cm9sbGVyIHVzaW5nIGlteDhtcCBQSFkNCj4gKGRyaXZlcnMv
cGh5L2ZyZWVzY2FsZS9waHktZnNsLWlteDhtcS11c2IuYyBmc2wsaW14OG1wLXVzYi1waHkpIGFu
ZA0KPiBEV0MzIGhvc3QgY29udHJvbGxlciBjb3JlIChkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBz
bnBzLGR3YzMpIHdpdGggaW14OG1wDQo+IGdsdWUgKGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4
bXAuYyBmc2wsaW14OG1wLWR3YzMpLg0KPiANCj4gT25lIG9mIHRoZSAyeCBVU0IgMy4wIGhvc3Rz
IGlzIGNvbm5lY3RlZCB0byBhIFVTQiBUeXBlIEMgY29ubmVjdG9yIHVzaW5nIGENCj4gVFBTMjU4
MjEgVVNCIHBvd2VyIHN3aXRjaCBhbmQgY29uZmlnIGNvbnRyb2xsZXIgd2hpY2ggaGFuZGxlcyB0
aGUgQ0MgcGlucw0KPiBvbiBhbmQgVkJVUyBlbmFibGUgYXMgd2VsbCBhcyBkcml2ZXMgdGhlIG11
eCBzZWwgcGluIG9mIGENCj4gVVNCMyBtdXggdG8gcm91dGUgdGhlIFVTQiBTUyBwYWlycyB0byB0
aGUgYXBwcm9wcmlhdGUgaGFsZiBvZiB0aGUgVHlwZSBDDQo+IGNvbm5lY3Rvci4gVGhpcyBkZXZp
Y2UgaGFzIG5vIEkyQyBvciBvdGhlciBtYW5hZ2VtZW50IGJ1cyAtIG9ubHkgVkJVUywNCj4gRkFV
TFQjLCBTSU5LIywgYW5kIFBPTCMgb3V0cHV0cyBiYXNlZCBvbiBDQyBwaW5zLg0KPiANCj4gSSdt
IG5vdCBjbGVhciBob3cgdG8gZGVzY3JpYmUgdGhpcyBpbiB0aGUgZGV2aWNlLXRyZWUgaW4gb3Jk
ZXIgZm9yIGl0IHRvIGZ1bmN0aW9uDQo+IGFzIGEgZHVhbC1yb2xlIGNvbnRyb2xsZXIgZm9yIGhv
c3QgdnMgZGV2aWNlIG1vZGUuDQo+IA0KPiBUaGUgVFBTMjU4MjEgaGFzIGEgRkFVTFQjIHNpZ25h
bCB0aGF0IHJvdXRlcyB0byBJTVg4TVAgR1BJTzFfSU8xMw0KPiBwaW5tdXhlZCBhcyBNWDhNUF9J
T01VWENfR1BJTzFfSU8xM19fVVNCMV9PVEdfT0MgYW5kIGEgU0lOSyMNCj4gc2lnbmFsIHRoYXQg
cm91dGVzIHRvIElNWDhNUCBHUElPMV9JTzEwIHBpbm11eGVkIGFzDQo+IE1YOE1QX0lPTVVYQ19H
UElPMV9JTzEwX19VU0IxX09UR19JRC4gQWRkaXRpb25hbGx5IHRoZSBWQlVTDQo+IG91dHB1dCBv
ZiB0aGUgVFBTMjU4MjEgYWxzbyBjb25uZWN0ZWQgdG8gdGhlIFR5cGVDIFZCVVMgcGluIHJvdXRl
cyB0byB0aGUNCj4gSU1YOE1QIFVTQjFfVkJVUyBwaW4uDQo+IA0KPiBJJ3ZlIG5vdGljZWQgdGhl
cmUgYXJlIGN1cnJlbnRseSBvbmx5IDIgb3RoZXIgSU1YOE1QIGJvYXJkcyBpbiBMaW51eCBtYWlu
bGluZQ0KPiB0aGF0IHNwZWNpZnkgZHJfbW9kZT0ib3RnIjsgdGhlIERIIGVsZWN0cm9uaWNzIGku
TVg4TSBQbHVzIERIQ09NIFNPTQ0KPiAoaW14OG1wLWRoY29tLXNvbS5kdHNpKSwgYW5kIHRoZSBU
b3JhZGV4IGkuTVg4TSBQbHVzIFZlcmRpbiBTT00NCj4gKGlteDhtcC12ZXJkaW4uZHRzaSkuIEkn
bSBub3QgY2xlYXIgaG93IHRoZXNlIGFyZSBob29rZWQgdXAgb3IgaWYgVVNCDQo+IGR1YWwtcm9s
ZSB3b3JrIG9uIHRoZXNlIGN1cnJlbnRseS4gSSBkaWQgbm90aWNlIHRoYXQgaW14OG1wLXZlcmRp
bi5kdHNpIGxvb2tzDQo+IGxpa2UgaXQgZG9lcyBub3QgZW5hYmxlIHRoZSBwaHkgb3IgY29yZSB2
aWEgc3RhdHVzIHByb3AgYW5kIHVzZXMgaW52YWxpZA0KPiAnb3Zlci1jdXJyZW50LWFjdGl2ZS1s
b3cnIGFuZCAnZGlzYWJsZS1vdmVyLWN1cnJlbnQnIGR0IHByb3BzLg0KPiANCj4gSSBhbSBjdXJy
ZW50bHkgdXNpbmcgdGhlIGZvbGxvd2luZyB3aXRoIGlteDhtcC12ZW5pY2UtZ3c3NHh4Og0KPiAN
Cj4gLyogVVNCMSAtIFR5cGUgQyBmcm9udCBwYW5lbCAqLw0KPiAmdXNiM19waHkwIHsNCj4gICAg
ICAgICBzdGF0dXMgPSAib2theSI7DQo+IH07DQo+IA0KPiAvKiBVU0IxIGR3YzMgZ2x1ZSAqLw0K
PiAmdXNiM18wIHsNCj4gICAgICAgICBmc2wsb3Zlci1jdXJyZW50LWFjdGl2ZS1sb3c7DQo+ICAg
ICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiB9Ow0KPiANCj4gLyogVVNCMSBkd2MzIGNvcmUgKi8N
Cj4gJnVzYl9kd2MzXzAgew0KPiAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+
ICAgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3VzYjE+Ow0KPiAgICAgICAgIGRyX21vZGUg
PSAib3RnIjsNCj4gfTsNCj4gDQo+ICZpb211eGMgew0KPiAgICAgICAgIHBpbmN0cmxfdXNiMTog
dXNiMWdycCB7DQo+ICAgICAgICAgICAgICAgICBmc2wscGlucyA9IDwNCj4gDQo+IE1YOE1QX0lP
TVVYQ19HUElPMV9JTzEzX19VU0IxX09UR19PQyAgICAweDE0MA0KPiANCj4gTVg4TVBfSU9NVVhD
X0dQSU8xX0lPMTBfX1VTQjFfT1RHX0lEICAgIDB4MTQwDQo+ICAgICAgICAgICAgICAgICA+Ow0K
PiAgICAgICAgIH07DQo+IH07DQo+IA0KPiBBbmQgY3VycmVudGx5IHY2LjAtcmMyIGVudW1lcmF0
ZXMgdGhlIGhvc3QgY29udHJvbGxlciBldmVuIHdpdGhvdXQgYSBUeXBlLUMNCj4gdG8gaG9zdCBj
YWJsZSBhdHRhY2hlZCB3aGljaCB0ZWxscyBtZSB0aGF0IE9UR19JRCBpc24ndCBkb2luZyBpdHMg
am9iLiBJIHZhZ3VlbHkNCj4gcmVjYWxsIHNvbWUgY29uZnVzaW5nIHN0YXRlbWVudHMgb24gdGhl
IElNWCBjb21tdW5pdHkgZm9ydW0gdGhhdCB0aGVzZQ0KPiBwaW5zIG1pZ2h0IG5vdCBldmVuIGJl
IHVzZWQgb24gdGhlIElNWDhNUC4NCj4gDQo+IEhvdyBzaG91bGQgSSBiZSBkZXNjcmliaW5nIHRo
ZSBkZXZpY2UtdHJlZSBmb3IgdGhpcyBzY2VuYXJpbyBpbiBvcmRlciB0byBnZXQNCj4gZHVhbC1y
b2xlIGJlaGF2aW9yPw0KPiANCj4gQmVzdCBSZWdhcmRzLA0KPiANCj4gVGltDQo=
