Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82BA65A7447
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 05:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbiHaDLr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 23:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbiHaDLo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 23:11:44 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2624CB0B0D
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 20:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLpZio3E5YAjp1J5GXbAd1AIN0bK8LiK4FZYyDEhvXGoJPrPTDUa2y4AvtToTVlIU7kyK/HD11q7yy4qKxa1TxF1WPzbEOjsGVRkFyiftuyWBulkSVN3XKQndRPinvvtgrJkWmxDeGesRNJXnRVQpWWcAjfWyWDA5Mi7O6YgA5f7EBZXLNVX510YIXRFq4C0/xGF44+HjquAUkMonYpJ9XVjgsGg5h8SI8xFmkBZKJDQvN/H3H6W37McQJ9G4ZFfWX3yN16FAa+Xqg9msGsQY/6F/4rzVh8upZu/Vq1paLc6ET7J0n/JH/0GCTIRvDCt/UwuF1lbC7knVMwVO3fhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CH/2+xYPixy4EFSN1V7ruk5s7vXozC22hRJq5IqY8Y=;
 b=U2YcRKpIhjlF2T4/e27Rk0ZUPEwqH6cWwcTpBGngZniH/qVOEAwNiR73aAKku7u5qorMdW6CkYgEFE4aOeLSQprM7YKHnRfxSWdRD6Trg0nEn65TK7coMitVLWlt1T497XZrWLwiNkxiTapZ1LBpoWan4gKMvEdweqKwMgnoxSM323F+H9Qpv2ktlIRuCyZV6ffTjFk7gUcZKFkl1LnPVIRn9M9i85NIOGnkEN+AD6jDJvCOUUmThk7co3Rj0nxJRqe6S+Z2Uea1TE438TlxNnvRfLlU2tbLuuDdeUbls68u1kMEh65hvb4nNHswN20PywMgqxKByd5dOXeJ5mebTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CH/2+xYPixy4EFSN1V7ruk5s7vXozC22hRJq5IqY8Y=;
 b=GO11nW7WOdeTvvhU23fGdxJyPfp4DTgYGzqWAL9tnyBKtYZ0X71yl6Yt6bR7lEEKmPlWkABB+IAZu1f0VXtidGbrt+kcqrAFZkzKSYTa6naOZgtmXT6chYoxbc1COKpVtH0wyOCSH54rKMYsw0Wz5d2buc84wWC6lkbWTwVlikI=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AS4PR04MB9506.eurprd04.prod.outlook.com (2603:10a6:20b:4c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 03:11:38 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2%9]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 03:11:38 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>,
        "tharvey@gateworks.com" <tharvey@gateworks.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
CC:     Alexander Stein <alexander.stein@ew.tq-group.com>,
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
Thread-Index: AQHYvJlun8zHtetRRkihIPQ7OoRso63INeaAgAAFn9A=
Date:   Wed, 31 Aug 2022 03:11:38 +0000
Message-ID: <PA4PR04MB9640F578AEF2558BA3F08F8889789@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <CAJ+vNU2bLPAta6GpDn_dGSrCnCRuBtxvLZ-g01h1jGwQuruBuA@mail.gmail.com>
 <DB9PR04MB8412164E22460736FB15B8D687789@DB9PR04MB8412.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB8412164E22460736FB15B8D687789@DB9PR04MB8412.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bce92410-19e1-4a1a-e3c5-08da8afe84f6
x-ms-traffictypediagnostic: AS4PR04MB9506:EE_
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sUzDQyQrPsOp1AbLfct7R8P+Ncxr69qwC7N1/zJAaHqyiFfuUED0KpXYc2AOY+o9jsntx/Zq3djSSutODVmuVX6I2pcIcwuwVPKp7fppjwzn4DAvIpWL2eOZTbsXtYpq6MlvvPHKjpa7C0gTjzjh+JIafRfoxmfIMLLw9MiX5ylWIXU8wdTHYzTA5GWWnmiatbuT8DeEaksdAzO5znk1mp08XRkZuEInz6GWr/cQrnddPKt0hGA0spVzVHnqypp1qz+JSgSbQ3rlmf5I80wx70inDvz1y9cH5wiuDq9z0GtigCBkW3xcjIIUgOCFlZPAZi8X9YW3RInVGZ5v2tdeMd99m34v1EmI1Iz8Zqi8tyrDKbLwjPtc6myQ9oUAbpGtAMKXaMmBW/vIFH/j8i9ecmz9HrqA2gLgAg4q2B42TQYbGGhimOKTKbtBSMxD9FLSB9LBJwk+5hTY6K6HT67Da6FEAhn95gu3NPs24QZZ8T16JIggUGSeKADFy3UdmgzzLmWH0mA9h4Hv8UsISR/yZHk63+H38V+ioAkDLsmljxNZc3HCCilcUY7WSx8RggHoZSolzfnEH5hzSBMLGe02lksetGGFyT+K8BUFBEmuA9PG2KLnxQAWGRjpsTWzS84H/JVa+m4Am4APRd7F5fjO6qVcFv7ypwBA8DzyP0m9Ok3aVuZwxr3hVKVWFm+aGm0FVaVEm5GnRGJZi72hBqlCsAHwPfRVVPDcfv3UGwKZPCssX26W5siOQKv9MTnyDjiwZdtSjPG0yjTE8CoNzFpsBMwM7XRe27P6AY0L0rOWWXWLasmhtdMeqVcWNF73hzCLudlA49IpDLHceVhf0sA64G9P+vJPU1H3FaGnzVImhwo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(316002)(9686003)(83380400001)(26005)(55016003)(478600001)(110136005)(186003)(54906003)(33656002)(5660300002)(122000001)(4326008)(66476007)(71200400001)(8676002)(66946007)(64756008)(66446008)(6506007)(2906002)(7696005)(76116006)(38100700002)(38070700005)(8936002)(66556008)(44832011)(52536014)(7416002)(41300700001)(53546011)(86362001)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUZkQURIc3AwRTE5ZGhyTVNoWlJMZGlzR0ZBVnVDOE0xWWJtemZYN0RzcTll?=
 =?utf-8?B?U1Uxd2ZIRkl3NG5QejgyZjl3NlZhSHZxQTRyRWRMQ21mZW94VmwxUWdocHV1?=
 =?utf-8?B?WlBjOEw5SFZ5SU95NEovcnhIVHY4ejcxOVBzK0dSWTBIcFlWM05XRUwxL28v?=
 =?utf-8?B?L0I1aE9qWDFmREhFWDBUR3REcEZqemVpMDkyd3B1dHpDcEFtc1dnRkIzQVB3?=
 =?utf-8?B?NjVpT1lBeW9ITkZJY0hJdFBDS3VmRGhET0dBK2E4UDZUTFVGVlI1YWNlMVdK?=
 =?utf-8?B?eXRUTFJqandETjMzemlnbml0dkpYOVRIT2xyNzJFTzI5NThFa05rMy9jeDVL?=
 =?utf-8?B?TzRTMTVaem5sbmJuRndOblY0K3pLRXlQYUVBN3lRN2xJM0RsUmR5V2REaENB?=
 =?utf-8?B?aDVORlh6eUV1bHQ0SjJiZE5wWXBydXBOMmNtQnphVlUrbURxMXppWE1ySkJB?=
 =?utf-8?B?MDJjblFPVHREa3dUNUZEVG9OQVRla0VYb2g2Vm9UUmZ6Sy85cDFRMzQwVWQ2?=
 =?utf-8?B?dWNEL29aT2FMdzlYVEJiY3h1d1dCeU13ckZwRFNrcHh3UHpSNnh1MnpmOVZY?=
 =?utf-8?B?dVhIVWMrci92MUNVcDJxS3d1c21wK3gyM2loSEJNZDBWRDZSTTFyMU50Y0Ro?=
 =?utf-8?B?eWNMNWNwSldKTFR3U0NFbHNiby9vYlRpOHFXTFBQVlc2dm5LSmRSL3c1QkxX?=
 =?utf-8?B?RXdEek9xYUI4TE51TGlicWV6ZU4xdWwzZG5MMUc0bUhnRnl5UTZQMXBkM1R2?=
 =?utf-8?B?Ny85NFNWK3ZSTTNSOWpwQ0dGZEJBRzI1WUVtNkl2Wlg2NXkyMitTakk3ZjRK?=
 =?utf-8?B?UnBHSWRubGk4Nk0xWFZGZXhwWU53TmNHZld2T0ZRY2k4bGJPOVRBWllxRm1O?=
 =?utf-8?B?a2p4T2FoM1UzVzBwRjZCaWROb1MyandtNWZFeUdqWlJPZTB3OWdhT3VwT1NE?=
 =?utf-8?B?b3NPTVE4V0dGaGhqNkppM0RWN0RYSGlQV0wwdEFES3V6Yi9KU3dQWStXUkM3?=
 =?utf-8?B?SGxhNGFCWWVyUG9yUndLWTFUL293cmNid0hKYzJUemZvNUZuNjFmZkxYVkkw?=
 =?utf-8?B?MUJpUnBiTzlwQlBLTlAvZEw5YjNzUUFUN3R6WEJJZnZPYzR6VGVDTjc3SGt6?=
 =?utf-8?B?UzdrQ3BVS2JkL3Q5WVNrNVJZeGpqekI0N0V5THBMdzN5YjZYakJOcnF3K281?=
 =?utf-8?B?NXprM2w0dlgrWkJuT0NDQzJwNGRYY2t2eHFyWEFRWjM4N2J5dGRjdXBPOGJY?=
 =?utf-8?B?R2ZHazJwNnBkcStpYVYzbEgrcTh3M1RVaktYUXZrempqTVRmYXZLOCs5ejln?=
 =?utf-8?B?VmY4YmlMTWx0ZFcvR3ZraFdQaTVDTGkvbUk4eFVBNWU4eHovazl5NVdHeFFL?=
 =?utf-8?B?K20rRExCSzFYNmtBUzFVSlRiK2t0OHVBdjUzcHRSajVrQkg0L0YxL1haREhy?=
 =?utf-8?B?akhjU1ZZcEdHR2RCVTlpQitNbTZYUlBhUW82TkN3Nmg4YXlFSUhFRmsrc3JS?=
 =?utf-8?B?dHQrSnFRZjFVZFUyenNOTFpIRis3NVhIb0pNSTdUMUk5ZlFsdHZQamxQd2NX?=
 =?utf-8?B?ODV1SlhzTXhjMTRBd1B4YVlwVkZRQ1NNZEdRM2d6VVVrbU5ueFNUMlk3bnU3?=
 =?utf-8?B?UnJPR0htZUpOMktkM3Bab1B5RlZLNHNsK0syMzZXWS9tQnZTMm5RdjJCR0h4?=
 =?utf-8?B?cm9FbDE1SGxlQzRjMmFVMnh1aTlpOFRsOVdYVEdINnVGMndaeFJxdVJiZEht?=
 =?utf-8?B?UlJuUzJBNFIzSnFid3BxQnBOUExyekl1YnJDMitCZjhIaFNzQmNURHdLL0VJ?=
 =?utf-8?B?bzc3UEQ1cTg1MnV0UUJwWld0UVB5NURWZE9UVGF3VDBkTHc4UTF3SldraDlU?=
 =?utf-8?B?amhJUTZlV3NXSFN5NGViSGxtQWJqbmhWMmZtMHkvcmFWc3Z6a2R3eFZzM2FS?=
 =?utf-8?B?dU4zaVpkMTFPdnA1b2RoN3VCcWtLY1oxK0xSVmcxNE5LZmV6S0JPeXNuOE44?=
 =?utf-8?B?RW1uOER6SHEwTWcrb3h2VFkzSEZGODEyV1MzTTl2KzRQN1dab0R0NFFydzJO?=
 =?utf-8?B?Ykp2Y2tLVnh1U2hqNTJ0UVZwbjlmcE5hZjZxVS9vZDR0c2tQMTczU0hBS2lJ?=
 =?utf-8?Q?maUM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce92410-19e1-4a1a-e3c5-08da8afe84f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 03:11:38.3289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQT7qgMUytgCFxQeJMNvosPOqG2w8bs4j5gs38DM+QAE9IMGOplzm9OzHhuJ1FsP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9506
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFja3kgQmFpIDxw
aW5nLmJhaUBueHAuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAzMSwgMjAyMiA5OjE4
IEFNDQo+IFRvOiB0aGFydmV5QGdhdGV3b3Jrcy5jb207IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5v
cmc7IExpbnV4IEFSTSBNYWlsaW5nDQo+IExpc3QgPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZz47IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+IENjOiBBbGV4YW5kZXIgU3Rl
aW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+OyBKdW4gTGkNCj4gPGp1bi5saUBu
eHAuY29tPjsgUmlrYXJkIEZhbGtlYm9ybiA8cmlrYXJkLmZhbGtlYm9ybkBnbWFpbC5jb20+OyBM
dWNhcw0KPiBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT47IFBoaWxpcHBlIFNjaGVua2Vy
DQo+IDxwaGlsaXBwZS5zY2hlbmtlckB0b3JhZGV4LmNvbT47IEZlbGlwZSBCYWxiaSA8YmFsYmlA
a2VybmVsLm9yZz47IEZhYmlvDQo+IEVzdGV2YW0gPGZlc3RldmFtQGRlbnguZGU+OyBNYXJjZWwg
Wmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT47DQo+IFNoYXduIEd1byA8c2hh
d25ndW9Aa2VybmVsLm9yZz47IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPjsgRnJhbmNlc2Nv
DQo+IERvbGNpbmkgPGZyYW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPjsgQWlzaGVuZyBEb25n
DQo+IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRy
b25peC5kZT47DQo+IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBQZW5ndXRyb25p
eCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiBTdWJqZWN0OiBSRTog
aW14OG1wIFVTQiBPVEcvZHVhbC1yb2xlDQo+IA0KPiBKdW4sIGFzIHdlIGRpc2N1c3NlZCBiZWZv
cmUsIGFueSBjb25jbHVzaW9uIG9uIGhvdyB0byBoYW5kbGUgdGhlIFVTQiBPVEcNCj4gSUQgcGlu
IGluIFJNPw0KDQpUaGUgTlhQIGRhdGFzaGVldCBmb3IgaU1YOE1QIGFscmVhZHkgY2hhbmdlZCB0
aGUgSUQgcGluIG5hbWUgdG8gYmUgd2l0aCBfRE5VDQpzdWZmaXgsIFJNIG1heSBiZSB1cGRhdGVk
IGluIG5leHQgdmVyc2lvbi4NCklmIGxlZ2FjeSBJRCBpcyBnb2luZyB0byBiZSB1c2VkLCBhbnkg
bm9ybWFsIEdQSU8gZnVuY3Rpb24gY2FuIGJlIHNlbGVjdGVkDQpmb3IgaXQsIGV4dGNvbiBpcyB3
ZWxsIHN1cHBvcnRlZCBpbiBkd2MzIGNvbnRyb2xsZXIgZHJpdmVyLiANCg0KTW9yZSBjb21tZW50
cyBmb3IgVGltLCBzZWUgYmVsb3cuLi4NCg0KPiANCj4gDQo+IEJSDQo+IEphY2t5IEJhaQ0KPiAN
Cj4gPiBTdWJqZWN0OiBpbXg4bXAgVVNCIE9URy9kdWFsLXJvbGUNCj4gPg0KPiA+IEdyZWV0aW5n
cywNCj4gPg0KPiA+IEkgaGF2ZSBhbiBpbXg4bXAgYm9hcmQgKGlteDhtcC12ZW5pY2UtZ3c3NHh4
KSB3aGljaCBoYXMgYSBEV0MzIFVTQg0KPiA+IGhvc3QgY29udHJvbGxlciB1c2luZyBpbXg4bXAg
UEhZDQo+ID4gKGRyaXZlcnMvcGh5L2ZyZWVzY2FsZS9waHktZnNsLWlteDhtcS11c2IuYyBmc2ws
aW14OG1wLXVzYi1waHkpIGFuZA0KPiA+IERXQzMgaG9zdCBjb250cm9sbGVyIGNvcmUgKGRyaXZl
cnMvdXNiL2R3YzMvY29yZS5jIHNucHMsZHdjMykgd2l0aA0KPiA+IGlteDhtcCBnbHVlIChkcml2
ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMgZnNsLGlteDhtcC1kd2MzKS4NCj4gPg0KPiA+IE9u
ZSBvZiB0aGUgMnggVVNCIDMuMCBob3N0cyBpcyBjb25uZWN0ZWQgdG8gYSBVU0IgVHlwZSBDIGNv
bm5lY3Rvcg0KPiA+IHVzaW5nIGENCj4gPiBUUFMyNTgyMSBVU0IgcG93ZXIgc3dpdGNoIGFuZCBj
b25maWcgY29udHJvbGxlciB3aGljaCBoYW5kbGVzIHRoZSBDQw0KPiA+IHBpbnMgb24gYW5kIFZC
VVMgZW5hYmxlIGFzIHdlbGwgYXMgZHJpdmVzIHRoZSBtdXggc2VsIHBpbiBvZiBhDQo+ID4gVVNC
MyBtdXggdG8gcm91dGUgdGhlIFVTQiBTUyBwYWlycyB0byB0aGUgYXBwcm9wcmlhdGUgaGFsZiBv
ZiB0aGUgVHlwZQ0KPiA+IEMgY29ubmVjdG9yLiBUaGlzIGRldmljZSBoYXMgbm8gSTJDIG9yIG90
aGVyIG1hbmFnZW1lbnQgYnVzIC0gb25seQ0KPiA+IFZCVVMsIEZBVUxUIywgU0lOSyMsIGFuZCBQ
T0wjIG91dHB1dHMgYmFzZWQgb24gQ0MgcGlucy4NCj4gPg0KPiA+IEknbSBub3QgY2xlYXIgaG93
IHRvIGRlc2NyaWJlIHRoaXMgaW4gdGhlIGRldmljZS10cmVlIGluIG9yZGVyIGZvciBpdA0KPiA+
IHRvIGZ1bmN0aW9uIGFzIGEgZHVhbC1yb2xlIGNvbnRyb2xsZXIgZm9yIGhvc3QgdnMgZGV2aWNl
IG1vZGUuDQo+ID4NCj4gPiBUaGUgVFBTMjU4MjEgaGFzIGEgRkFVTFQjIHNpZ25hbCB0aGF0IHJv
dXRlcyB0byBJTVg4TVAgR1BJTzFfSU8xMw0KPiA+IHBpbm11eGVkIGFzIE1YOE1QX0lPTVVYQ19H
UElPMV9JTzEzX19VU0IxX09UR19PQyBhbmQgYSBTSU5LIyBzaWduYWwNCj4gPiB0aGF0IHJvdXRl
cyB0byBJTVg4TVAgR1BJTzFfSU8xMCBwaW5tdXhlZCBhcw0KPiA+IE1YOE1QX0lPTVVYQ19HUElP
MV9JTzEwX19VU0IxX09UR19JRC4gQWRkaXRpb25hbGx5IHRoZSBWQlVTIG91dHB1dCBvZg0KPiA+
IHRoZSBUUFMyNTgyMSBhbHNvIGNvbm5lY3RlZCB0byB0aGUgVHlwZUMgVkJVUyBwaW4gcm91dGVz
IHRvIHRoZSBJTVg4TVANCj4gPiBVU0IxX1ZCVVMgcGluLg0KDQpTbyBUUFMyNTgyMSBkb2VzIG5v
dCBuZWVkIGEgZHJpdmVyLg0KDQo+ID4NCj4gPiBJJ3ZlIG5vdGljZWQgdGhlcmUgYXJlIGN1cnJl
bnRseSBvbmx5IDIgb3RoZXIgSU1YOE1QIGJvYXJkcyBpbiBMaW51eA0KPiA+IG1haW5saW5lIHRo
YXQgc3BlY2lmeSBkcl9tb2RlPSJvdGciOyB0aGUgREggZWxlY3Ryb25pY3MgaS5NWDhNIFBsdXMN
Cj4gPiBESENPTSBTT00gKGlteDhtcC1kaGNvbS1zb20uZHRzaSksIGFuZCB0aGUgVG9yYWRleCBp
Lk1YOE0gUGx1cyBWZXJkaW4NCj4gPiBTT00gKGlteDhtcC12ZXJkaW4uZHRzaSkuIEknbSBub3Qg
Y2xlYXIgaG93IHRoZXNlIGFyZSBob29rZWQgdXAgb3IgaWYNCj4gPiBVU0IgZHVhbC1yb2xlIHdv
cmsgb24gdGhlc2UgY3VycmVudGx5LiBJIGRpZCBub3RpY2UgdGhhdA0KDQpOWFAgaU1YOE1QIEVW
SyBoYXMgbm90IGVuYWJsZWQgdHlwZS1DIHBvcnQgZHVlIHRvIHRoZSBTUyBvcmllbnRhdGlvbg0K
c3dpdGNoIGJpbmRpbmcgaXMgc3RpbGwgaW4gZGlzY3Vzc2lvbiwgYnV0IHlvdSBkb24ndCBuZWVk
IGEgU1cgY29udHJvbA0KaW4geW91ciBjYXNlIHNvIHlvdSBhcmUgb2theSBoZXJlLg0KDQo+ID4g
aW14OG1wLXZlcmRpbi5kdHNpIGxvb2tzIGxpa2UgaXQgZG9lcyBub3QgZW5hYmxlIHRoZSBwaHkg
b3IgY29yZSB2aWENCj4gPiBzdGF0dXMgcHJvcCBhbmQgdXNlcyBpbnZhbGlkICdvdmVyLWN1cnJl
bnQtYWN0aXZlLWxvdycgYW5kDQo+ICdkaXNhYmxlLW92ZXItY3VycmVudCcgZHQgcHJvcHMuDQo+
ID4NCj4gPiBJIGFtIGN1cnJlbnRseSB1c2luZyB0aGUgZm9sbG93aW5nIHdpdGggaW14OG1wLXZl
bmljZS1ndzc0eHg6DQo+ID4NCj4gPiAvKiBVU0IxIC0gVHlwZSBDIGZyb250IHBhbmVsICovDQo+
ID4gJnVzYjNfcGh5MCB7DQo+ID4gICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gfTsNCj4g
Pg0KPiA+IC8qIFVTQjEgZHdjMyBnbHVlICovDQo+ID4gJnVzYjNfMCB7DQo+ID4gICAgICAgICBm
c2wsb3Zlci1jdXJyZW50LWFjdGl2ZS1sb3c7DQo+ID4gICAgICAgICBzdGF0dXMgPSAib2theSI7
DQo+ID4gfTsNCj4gPg0KPiA+IC8qIFVTQjEgZHdjMyBjb3JlICovDQo+ID4gJnVzYl9kd2MzXzAg
ew0KPiA+ICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiAgICAgICAgIHBp
bmN0cmwtMCA9IDwmcGluY3RybF91c2IxPjsNCj4gPiAgICAgICAgIGRyX21vZGUgPSAib3RnIjsN
Cj4gPiB9Ow0KPiA+DQo+ID4gJmlvbXV4YyB7DQo+ID4gICAgICAgICBwaW5jdHJsX3VzYjE6IHVz
YjFncnAgew0KPiA+ICAgICAgICAgICAgICAgICBmc2wscGlucyA9IDwNCj4gPg0KPiA+IE1YOE1Q
X0lPTVVYQ19HUElPMV9JTzEzX19VU0IxX09UR19PQyAgICAweDE0MA0KPiA+DQo+ID4gTVg4TVBf
SU9NVVhDX0dQSU8xX0lPMTBfX1VTQjFfT1RHX0lEICAgIDB4MTQwDQo+ID4gICAgICAgICAgICAg
ICAgID47DQo+ID4gICAgICAgICB9Ow0KPiA+IH07DQo+ID4NCj4gPiBBbmQgY3VycmVudGx5IHY2
LjAtcmMyIGVudW1lcmF0ZXMgdGhlIGhvc3QgY29udHJvbGxlciBldmVuIHdpdGhvdXQgYQ0KPiA+
IFR5cGUtQyB0byBob3N0IGNhYmxlIGF0dGFjaGVkIHdoaWNoIHRlbGxzIG1lIHRoYXQgT1RHX0lE
IGlzbid0IGRvaW5nDQo+ID4gaXRzIGpvYi4gSSB2YWd1ZWx5IHJlY2FsbCBzb21lIGNvbmZ1c2lu
ZyBzdGF0ZW1lbnRzIG9uIHRoZSBJTVgNCj4gPiBjb21tdW5pdHkgZm9ydW0gdGhhdCB0aGVzZSBw
aW5zIG1pZ2h0IG5vdCBldmVuIGJlIHVzZWQgb24gdGhlIElNWDhNUC4NCj4gPg0KPiA+IEhvdyBz
aG91bGQgSSBiZSBkZXNjcmliaW5nIHRoZSBkZXZpY2UtdHJlZSBmb3IgdGhpcyBzY2VuYXJpbyBp
biBvcmRlcg0KPiA+IHRvIGdldCBkdWFsLXJvbGUgYmVoYXZpb3I/DQoNCkNvdWxkIHRoaXMgZHRz
IHdvcmsgZm9yIHlvdT8NCg0KLyogQ29uZmlnIHRoZSAiSUQiIHBpbiBpb211eCB0byBiZSBHUElP
ICovDQoNCnBpbmN0cmxfdXNiMTogdXNiMWdycCB7DQogICAgICAgICAgICAgICAgIGZzbCxwaW5z
ID0gPA0KICAgICAgICAgICAgICAgICAgICAgIE1YOE1QX0lPTVVYQ19HUElPMV9JTzEzX19VU0Ix
X09UR19PQyAgICAweDE0MA0KICAgICAgICAgICAgICAgICAgICAgIE1YOE1QX0lPTVVYQ19HUElP
MV9JTzEwX19HUElPMV9JTzEwICAgIDB4MTQwDQogICAgICAgICAgPjsNCiB9Ow0KDQogZXh0Y29u
X3VzYjogZXh0Y29uX2lkZGlnIHsNCiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJsaW51
eCxleHRjb24tdXNiLWdwaW8iOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAgICBpZC1n
cGlvID0gPCZncGlvMSAxMCBHUElPX0FDVElWRV9ISUdIPjsNCiB9Ow0KDQogJnVzYl9kd2MzXzAg
ew0KICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCiAgICAgICAgIHBpbmN0cmwt
MCA9IDwmcGluY3RybF91c2IxPjsNCgkJIGV4dGNvbiA9IDwmZXh0Y29uX3VzYj4NCiAgICAgICAg
IGRyX21vZGUgPSAib3RnIjsNCiB9Ow0KDQpMaSBKdW4NCg0KPiA+DQo+ID4gQmVzdCBSZWdhcmRz
LA0KPiA+DQo+ID4gVGltDQo=
