Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4164E72F27A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jun 2023 04:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242131AbjFNCNP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 22:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjFNCNO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 22:13:14 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2085.outbound.protection.outlook.com [40.107.249.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E26A19B6;
        Tue, 13 Jun 2023 19:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftUaKRPHoYJdKIznzmUaqpmwg/ppmISYrlJmclPfP4yPx/7CDF/ISnuL3be3Pa2iKHoA9rZSTGb5LAxyEZIiBQJ2zyI+Ic/M3dAYQ6tsmbXuH0Zv0t4zQbzbRhDTVG+bM1cs5iT/1Oqli8pnvqJABvuwL63BC/k4uurmZ3r2EY8TGy9cz8laYWuaEsKaeVl++/riCr4Hs2hzH3GwZ3NJorFy3aUfd2zJahg0QOkH+1/rdvypTLH994yg3X7Yd71EklfXy574D0BrnkL9tXfLmyBfyOrfuE8k2oc068EoxJy/XhCVpRcB5LgDf6pQ9MMc1yTRInur01ZQ0GEDd+/Frg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsa1LEVhbKiDoK4EYGCQTBSzeZw3BsaMbjziejU6/FU=;
 b=TgS2fXqODnG9D4glm1KSVOSHJbDGT7JS4Co+XwEzO3/AizuYA35lfLYWGDn189UcRvCRg/NZcUIbiShJQNe3ky1cDl0aPhSqGb7wxFwi14DQcMNcjHGaWQLzr2UL7JP9A7tkh/B/grz8EJHm9H7up3tD8M0Al6J9VO6ik/E6bxXC+yN/oYhVrDTxIJPsHuRcFAWl0vfzx+7zCgFqSUEzbBsVNUsDZ9MwoleJ4zMT+8LMZAw0gDDGW1xldM2EPJ+VpFLsAly8BhsFuhqu6l82qDUg75DUcgtQ7nP+sMeeTZC4SfXJdvPxmO9RWYhJ/C1D4monPCABTJg0tNLnLWufng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsa1LEVhbKiDoK4EYGCQTBSzeZw3BsaMbjziejU6/FU=;
 b=gFxdx8/Y28WKQ0k4+feJqWLBg8ZClHrn7cGXF/7TdwU4qBlKOVcYFQ8+ZKu+9x0kRU1vnZ8mcOHKClbhGqs3l1P3LV8zngjYyX7I9bZMRx/nXmNZZipNxGkUzdN9/6Fjh25eehVeJ/c6SFF7hOX0DgOUz/rZYqEPRS+IquxRSCY=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DBAPR04MB7272.eurprd04.prod.outlook.com (2603:10a6:10:1ad::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.46; Wed, 14 Jun 2023 02:13:11 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 02:13:10 +0000
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
Subject: RE: [EXT] Re: [PATCH v2 2/2] dt-bindings: phy: mxs-usb-phy: add
 imx8ulp and imx8qm compatible
Thread-Topic: [EXT] Re: [PATCH v2 2/2] dt-bindings: phy: mxs-usb-phy: add
 imx8ulp and imx8qm compatible
Thread-Index: AQHZmboU7xjiSqeCy0WBnzLcdAfebq+JI/UAgABztLA=
Date:   Wed, 14 Jun 2023 02:13:10 +0000
Message-ID: <DB7PR04MB4505C79371879ABB09AB0BEF8C5AA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
 <20230608033642.4097956-2-xu.yang_2@nxp.com>
 <224e69e6-ac1e-70c3-c0b3-4b72cc3cb0ad@linaro.org>
In-Reply-To: <224e69e6-ac1e-70c3-c0b3-4b72cc3cb0ad@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|DBAPR04MB7272:EE_
x-ms-office365-filtering-correlation-id: e8e223f8-875c-4420-fbcf-08db6c7ce695
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +qVllGgIfy6Ax8J/E8jJJUL2QrHcMP7WXI8SDOR/uyBb6FdKI705C71W9CnX+aYXuJtMKMTM4slOaXTQp2wFQL/udf93Ey9PCGhvOmI5MELStGF9c6h00dQIXaB2ZGSPOdy5nQhZlwNp/BeEOe5zJ3WLmCFEbt/8DpXcsHAXSeKRAIy8pJ5pge5QWhJ1wSCgAzEjRyBdnzvX30p0Xdf3tyIgoNs+t6sz5mPekzXy1OodmwHvsQwPZhLDQ3nkVj1bLR9wHEeDJtSmohMQutXYoAK5t5vjTNfzoOXUQyQXMz7hn4XRH4EU4+DEEVNH2es0UpVmaLN0Ip0dipRUssfZw2JDAzaCawAnTEPjW8divlN1JaRfSqVoxLZYudvQ83DnDRNNI4ozJzLDBbPRgrTAz37LqQKO56xfPHVQDBZU5XiEdW+Bmaiy5s4nui8U4qNv863k5thgKqBk080U1OeS3yizZ4NaDCYTytNVzNLJKF44i85vqm4fZcD/NSENIVjuYMSxxqpqZVZWjtYdhtIfNh09qVzG20/ByuzjBAAmGjx/RMPzWDIZ1H/I1aJjnvna09j74icgnLTvXjdHmJGK/DtfOUGDv/z2Gngf9Q0q1rnjt+AJQakdHK9U2fKp+Fs2sKPS2ONTqyizaIVmwIC/rw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(7696005)(38100700002)(86362001)(38070700005)(83380400001)(122000001)(33656002)(9686003)(6506007)(53546011)(26005)(55016003)(186003)(2906002)(110136005)(54906003)(66476007)(4326008)(66556008)(316002)(7416002)(66446008)(64756008)(76116006)(41300700001)(52536014)(5660300002)(478600001)(71200400001)(8936002)(8676002)(66946007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUxHNFN3NDZ3N3NZalZJSkpoYm5Ib2hLWWx0Kzg2cDU2L2l1c2UvRlR6bnZ4?=
 =?utf-8?B?YnI5dHNYYXZHWURhSU1yMmRMV2V0RkJudDZ2amZrNXVmaSs3aWtERG5Qay8y?=
 =?utf-8?B?SFAyc01aZU9DMkl0bmR5OGF4OHc5ZUNNYis1S2VHanl5TkNmZFlmamdkb0xE?=
 =?utf-8?B?Q2VPZWRsbHYrYkxBb1RwdVFxUDJ0RFNYVkdraWY2dGtYdnRhZVJMbjVzOXdp?=
 =?utf-8?B?VllocGFLaDJsakxvYXBpR1pjdGdLZzdYclhTWmphOGQ0QWtYSVZaUnhGUzkx?=
 =?utf-8?B?WWdxbnhpWDlhZWlTci9qN0Rnc1laK2hZTm45TER1TnI4M0dZcmZSbyt2TDgz?=
 =?utf-8?B?Z01DUmw5YTJ4UGtVNGx0eUxCNUNBdnN0MWZLd1JCbXM0Nno3RUtDMTh2NW8y?=
 =?utf-8?B?V29CNTFIcy82enZlYkF6WGtPRldQWlB1ZXo1TlZRNGZKeWYxU1k3bVEwM09s?=
 =?utf-8?B?WERrWmFYYkMxWXdzTURUUWpNeE5uMHVlV1hYd3NUVmk3KzRRcDNvNXIrbkg4?=
 =?utf-8?B?YytlWUY5ckdQNzFYMTc1SjlFK0NtMmJzNkxVdnJNaXRyT0JJeDJiTFhldG44?=
 =?utf-8?B?d0tiRmUvSjFjZmtHbXJ0M1FmMjV5L3VjUHZTb2ZreU9SQ3p4dC9wUHNFU0dC?=
 =?utf-8?B?MmFjSm9wYlJ3MGtpbDlXWktLdmlzc29UaFFHQ09QMzc4VmFtc0dPenBrcllB?=
 =?utf-8?B?RFZEYWhWeUZ0WkJBYUx6WlRFNHJTWklFUjU0Nkl2L0M5UlRvN0NuM0xpNGl5?=
 =?utf-8?B?UVZyUTlVLzkybngyWFh3TFdaRC9vWkxPcFFqdGpkaVNaVEUwYnNIRkcyMGh2?=
 =?utf-8?B?SHBiSkpwUit2SHNRdEEramhuQkNiN1d3eURXb3dhUWJYMGdVSTd4QkZWVkhO?=
 =?utf-8?B?Q2ZQNS9SYXlPWVBINzh2UlI0dXphU1NISHdKbEQ5UGN1YnR2cGtvaTBNanp5?=
 =?utf-8?B?WDR2TXZGcTBEQnUzWDZoQmQycDRSdVVDa0I1NkNMQlJFSUpHTDNuNW9JVGRJ?=
 =?utf-8?B?YUdHZlg0eVRpTUIvRi9TTnIyNHZzWm9KR1pDSFR1bjMrR3FIZXlJRkRiY3Jl?=
 =?utf-8?B?OUhpdzYrZUZ2S2Ruc0ZBaHVYQ21Kd3psZk5NcWRFblJLUnNUbVZaQnUxVlVZ?=
 =?utf-8?B?UXpLN29pc0FkUnRsU1dPSFdtMVBpUmtrNUF5V2F1OVNFZEcxMWpTZlpZQURL?=
 =?utf-8?B?ekt6ck8vcHlvOGp4K29UVk1IcE9HNWJ1dSs1bXN5VklCS1l1K0FOUVpkdGdx?=
 =?utf-8?B?eXJmSjhORWpsZHMxYlZ6UjMwZXhvMkhTR1dTOUs1Tklyb0k3Z2x5V09UQjNV?=
 =?utf-8?B?VGg2UUtPR2lDTW9jeFFyZUlFVXNoYjZ0T0hMTHFOQ2Z4anFDeVI2SDR0OG1I?=
 =?utf-8?B?STR5WHNObCtvVy92OXBpazROaTdQMUhBcHh4TmRvTENxQ1M4bWsrVGRzV3FP?=
 =?utf-8?B?a1lUcmtna2Q4OGEzK2pEZTh1MTJKV0UvK0ZSdElxRlVOWG94ZE1qQTBBRGtD?=
 =?utf-8?B?SjRHekg5a2xBbjFLbTJqUGk4V2pxeDkzNkpYUHBZRGlRUVNiLzBFK1ZaQk5m?=
 =?utf-8?B?UWNhRTJyQjdYcG04WVR3YjEvbG1WV2Z5aEZ5NUtaNGRMLzBYb3dnaUtOc3Q2?=
 =?utf-8?B?YmFNOWFVTkNkWkNheUlmTFhna05Qb2ZPQnlVdGFOa0pLSVVjSjZRUURkRnNX?=
 =?utf-8?B?QTY4UmRUMk1mSnBoU1V6aHpHQkE2eitXUXdpUTVLQzVJQ2xrSGNweEJyNGwy?=
 =?utf-8?B?cVZDWEdobHdnVTBIVmJjMjRHd3pvS2FFOU1ZOENsUXBXTmRydnV4ZmFQeGdi?=
 =?utf-8?B?LzRlLzRjUWRVZzhHRVMrYVF0NEF3bTBDeEhUNzZXS25JcnZwOUdncjlacVVH?=
 =?utf-8?B?Mks3SXlaSmd4ay9PV0VGeDNmVXNWK21OY1Q1cXA3SlhabVVOSGNPMmNtTXdM?=
 =?utf-8?B?cEY0aVVMSHBqSUVvQm04TUxWb01rTkVDMDFIRVM4bytYYkxiZmVCQVNEKyti?=
 =?utf-8?B?dEo3SmE2V3g3VzNMK0xtRDEwRFRIQm12SXJMcHF4NTRSbDEwQ0lVZmNHeGt3?=
 =?utf-8?B?a051aEVKbjVVYmN0RHNWZHYrK1A0eDNCS2s1ZHlzMU1UYXRSZjhEVEMyNkNt?=
 =?utf-8?Q?gj8w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e223f8-875c-4420-fbcf-08db6c7ce695
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 02:13:10.3281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ZzT8it1adP0xXlSt/G/bPa/gufcHig+CY4l8yby2/5SeBRB0YfmY1WAKdwBbns37oXxGchKScwUnEclwp23Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7272
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBKdW5lIDE0LCAyMDIzIDM6MTggQU0NCj4gVG86IFh1IFlhbmcgPHh1Lnlh
bmdfMkBueHAuY29tPjsgcm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0b2Yua296bG93c2tpK2R0
QGxpbmFyby5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmcNCj4gQ2M6IHNoYXduZ3VvQGtlcm5lbC5v
cmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2
YW1AZ21haWwuY29tOyBkbC1saW51eC1pbXggPGxpbnV4LQ0KPiBpbXhAbnhwLmNvbT47IGxpbnV4
LXBoeUBsaXN0cy5pbmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4gdXNiQHZnZXIua2Vy
bmVsLm9yZzsgSnVuIExpIDxqdW4ubGlAbnhwLmNvbT4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQ
QVRDSCB2MiAyLzJdIGR0LWJpbmRpbmdzOiBwaHk6IG14cy11c2ItcGh5OiBhZGQgaW14OHVscCBh
bmQgaW14OHFtIGNvbXBhdGlibGUNCj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwg
ZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvciBvcGVuaW5nIGF0
dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlDQo+IG1lc3NhZ2UgdXNpbmcgdGhl
ICdSZXBvcnQgdGhpcyBlbWFpbCcgYnV0dG9uDQo+IA0KPiANCj4gT24gMDgvMDYvMjAyMyAwNToz
NiwgWHUgWWFuZyB3cm90ZToNCj4gPiBUaGUgaW14OHVscCBhbmQgaW14OHFtIGFyZSBjb21wYXRp
YmxlIHdpdGggaW14OGR4bC4gVGhpcyB3aWxsIGFkZCBzdWNoDQo+ID4gY29tcGF0aWJsZS4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiA+DQo+
ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAgLSBubyBjaGFuZ2UNCj4gPiAtLS0NCj4g
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9mc2wsbXhzLXVzYnBoeS55
YW1sIHwgNSArKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BoeS9mc2wsbXhzLXVzYnBoeS55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9mc2wsbXhzLXVzYnBoeS55YW1sDQo+ID4gaW5kZXggMWI2YjE5
ZmRmNDkxLi4xMzk1YTk4MmMzODcgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9mc2wsbXhzLXVzYnBoeS55YW1sDQo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9mc2wsbXhzLXVzYnBoeS55YW1sDQo+ID4g
QEAgLTMyLDcgKzMyLDEwIEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBm
c2wsaW14N3VscC11c2JwaHkNCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxpbXg2dWwtdXNi
cGh5DQo+ID4gICAgICAgIC0gaXRlbXM6DQo+ID4gLSAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14
OGR4bC11c2JwaHkNCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAt
IGZzbCxpbXg4dWxwLXVzYnBoeQ0KPiA+ICsgICAgICAgICAgICAgIC0gZnNsLGlteDhkeGwtdXNi
cGh5DQo+ID4gKyAgICAgICAgICAgICAgLSBmc2wsaW14OHFtLXVzYnBoeQ0KPiANCj4gS2VlcCB0
aGUgaXRlbXMgc29ydGVkLiBZb3VyIHByZXZpb3VzIHBhdGNoIGFsc28gaGFkIHdyb25nbHkgb3Jk
ZXJlZA0KPiBpbXg2dWwgaW4gZW51bS4NCg0KVjQgYWxyZWFkeSBmaXggdGhpcyBpc3N1ZSBhcyBi
ZWxvdzoNCg0KQEAgLTI5LDcgKzI5LDEwIEBAICBwcm9wZXJ0aWVzOg0KICAgICAgICAgICAtIGNv
bnN0OiBmc2wsaW14NnVsLXVzYnBoeQ0KICAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14MjMtdXNi
cGh5DQogICAgICAgLSBpdGVtczoNCi0gICAgICAgICAgLSBjb25zdDogZnNsLGlteDhkeGwtdXNi
cGh5DQorICAgICAgICAgIC0gZW51bToNCisgICAgICAgICAgICAgIC0gZnNsLGlteDhkeGwtdXNi
cGh5DQorICAgICAgICAgICAgICAtIGZzbCxpbXg4cW0tdXNicGh5DQorICAgICAgICAgICAgICAt
IGZzbCxpbXg4dWxwLXVzYnBoeQ0KICAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14N3VscC11c2Jw
aHkNCg0KVGhhbmtzLA0KWHUgWWFuZw0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRv
Zg0KDQo=
