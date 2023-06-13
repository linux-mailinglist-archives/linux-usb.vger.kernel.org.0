Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 738DB72DB3E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 09:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240669AbjFMHlp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 03:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234240AbjFMHli (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 03:41:38 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2045.outbound.protection.outlook.com [40.107.14.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C175A1718;
        Tue, 13 Jun 2023 00:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5M5q91jD8eihSfkyIcJbXkXg3ou45I5BoxDyYdDWa2IlP2XDjGQZCfCJv3c+2BmKqxGkE9PlnrbMyZ5DlE7dtxPpysfnm3Inwn4pgMI8uQNv6E8SqBO8OHR9pVPGgxmJq/qyduuu3n1ml7eASFzX59QrOOImhEs3pTJoZsgPLhNcX9rbnBq1+sDbQfLXSSKn9Bw8pmYhYtD9Kif7eOc5zLS8LEQfIgUsl/U72arOyYP3f0/gionddQgvXIMd+DRGDl4YO0Rf/hDs/Hr5sl+3VuHe151+7rk38gw7PSGuNZTMj3ZJlldMcMEA+tqtYU+XPa9qphZbdfNAPmRPn8W3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqQFGEo2R01w9ABIG3VlEncZxdpFXBEyP44RfgQ8Ns0=;
 b=jJSWpsVwiRliRwwWj/enD7t2GW+87Q8xPXMlxWIJmu7SkNSwsa4gNifRGQcrPTOYpDpKDTDO4ESRCI9gA0ScoAuWKCXRr/d1sT46KOyDqufbh3CgRI02GJzs802jdqcEOB4C9nSt4zbuHjNMu7fVYvapBt8xPjhJ0Er61YTuNERCes75ZSvobKLwlv5fTHMlIQwylDMhsAyhjxQVDYT1dezyu+Q3jiyDUeNWP+nwW2fTfaqPfPFylpp7vLjegbhiKgam3pO5+5sIfxLerB3sEZSMQT34LZHaFjdjyxb6qThX5hswrJH1eYqG9nCD4O7KU+n0QIeac9olL6ffZ5bISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqQFGEo2R01w9ABIG3VlEncZxdpFXBEyP44RfgQ8Ns0=;
 b=RSve8NSE2VcDb6RfQLmLg7bx2KCFU3s5rwQ+tdETDykj9T373oIsXpOezoBlyIdX25ipvE2erIGipA/WIybClt5X6SD7/Jt1r75dtpPf+6qHdkWgak8237KQY8YZ0vJvlN9rfYHQKWsHVFi7AxNmvjdKtNCLr+e++3MoIFKVO3E=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS5PR04MB9895.eurprd04.prod.outlook.com (2603:10a6:20b:651::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Tue, 13 Jun
 2023 07:41:25 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 07:41:25 +0000
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
Thread-Index: AQHZmboSn6UDTrFVK06L5r7rtQ42ma+Cr6QAgAP0GLCAAb1QgIAAADQQ
Date:   Tue, 13 Jun 2023 07:41:25 +0000
Message-ID: <DB7PR04MB45051E84DA57203E114F6DC28C55A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
 <b8f35a9a-7553-92fa-6fdd-2522dc9bd36d@linaro.org>
 <DB7PR04MB450553FBD13E3101F8C065008C55A@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <b7bfc733-7d0d-d04b-5bba-ba1b5a056235@linaro.org>
In-Reply-To: <b7bfc733-7d0d-d04b-5bba-ba1b5a056235@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS5PR04MB9895:EE_
x-ms-office365-filtering-correlation-id: cb40e6c8-216c-4554-a5e4-08db6be19773
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CDBKUa+kF3rCXCkFqQMmUEMJSFCcvRlxe3qJZmlBMRcvBMwNs0569HkeNEtu1oPQI2FrrAy4YPxjVQSSqvOEbqQImcgePAxM5Qa65v8r1x4r4jmP6zgiNR8wkNh0rLFpizizUueQgWsQwPNCfhNoxPDxQbl10r09/FhTKOWo0KU0NeSV9Xv462i1DWsb2mlwtoAy2V6A1HvWyje0X3S7b1KXgL9kl5sbRt8I5yEM1TcM46EEsT0fv29btqbnI17pqQzAJ93j7I7yBof9FZedVE/TC5TjyDekrWyTrO8/WK6S+0cAA2FYOogptdGhNB8oL6vlrvjxKN02xU1ZM8gV4/0bFoPCaexjfWOBBvch3nBqWtj2W6XzH47BmHvXlg/E0eJoYOGfiowPSEgSJsr7xhG8nP00aMzXvQlj2UBnLdy4q3VAnH+FrLu1F9Lg7l2K0/M9SgHbIX2b74H3tcveWy3oCDZ09h4jThFniGf4I/bf3g45MvoJ9K0mdEdUtV8K366HdRVrr0trrGwCR+011oRnNT0dV2S64tyYLKoNR4lGFW3/PGBafbCrwOSvVxovG9QUKGL4PNxJs3RCimmHIXOaGlReB1BJuwZ7hmtif4i82FD4v/xxce3bSGtsPEFA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(33656002)(38070700005)(2906002)(52536014)(5660300002)(7416002)(86362001)(83380400001)(38100700002)(55016003)(7696005)(53546011)(71200400001)(9686003)(6506007)(186003)(26005)(478600001)(122000001)(110136005)(54906003)(76116006)(66446008)(316002)(41300700001)(66556008)(66476007)(66946007)(4326008)(8936002)(64756008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFk0SDg3MkRUT1k3cWh1TytzZDViR0xUbk16V3ZNcTFJenErVzVrNXlWN1gv?=
 =?utf-8?B?M3BGb2NQdGYzcGVuZlhLVnNGcmdSYkhkY3J6SkNsMCtRZUZrSVdGUWpRZmUz?=
 =?utf-8?B?ZVZlcjV6cGMxeHBGWnFYbWtCSldwMUhKVG1DTks1d3NhcENWaEMvK2ZUcElu?=
 =?utf-8?B?Q1NmN0l1RWVCVjV5MGlua3YrSXBCTlNXZ0NhQmVLUHhpWUo3ajZNMnN4NlJQ?=
 =?utf-8?B?RjIxbjZNKzJTdms3Q1pDMkdhN21IcTFMQktrSWtualpmVTk0R1VsMExOSTJK?=
 =?utf-8?B?ZWpNdURESktCQWpiR0xjQ2ZkLy94dWhYVjkvbTc0ZEErQkVSTVNNY09RMk5G?=
 =?utf-8?B?UlJRREN4b2hteEtKdkczMS96Uk9zS3lIQTJlcXVDaVA2T0Zyd1NvTUphb1J0?=
 =?utf-8?B?UWxqUlNZSHJ2bWhRaWpsU3c3clY0VmQySTF5UUIxeTAyclNYby9ybDgwNkR2?=
 =?utf-8?B?TjVvTHQ0U2QzaVpOVlNlbTBVb0thdlBaYlVkRkpmTUF2dlY0MmFqVGpTSU50?=
 =?utf-8?B?NCtkaTRIOWRVd2lhSG9NQjh1U2ljUGdGRnJCa05mYmxYbmJGUXZMYVMxWUFy?=
 =?utf-8?B?Rm9jK09kQ3MrMnBXREM1UlNlMm01K0ptR2xVRGJNRXRZUFJmOFZJWkNwODdz?=
 =?utf-8?B?R1BYTHA0TlBSazNhbGtUL3RWWFl5Sm9IUHM0QkdhNFFybmJieXVVQjJIV1FG?=
 =?utf-8?B?VGg1WnFlcUwweVNXaDR0eUhsVGI0dDFzd1MrSk1ySzRKZE9BQUx0NFVtR3Jm?=
 =?utf-8?B?VXNRSjJnbFdHbEk0MFgyQldnR3pJelFoSUZwVVVDR3RkTzMxT2pycEpKWHM2?=
 =?utf-8?B?SlZpWmo2MEpDUlR3TjcreDJWTWxBZklCWDVLano4bUJUQzdwN2F2L0lkd1pt?=
 =?utf-8?B?amJKVGJWVmZRSnU4Uk53RElQaTRQYXZqL2wrQy9XcE9COUNKaVZaVzk4cmhy?=
 =?utf-8?B?SjRRbU9udGZvbzI0Z0R5YXE5NmpyV21jSW5Db1lGY0t4TjRUV1hVUUJuOHYv?=
 =?utf-8?B?dlUzL29iQmhScDAyWHpZNmRhOXJ1TW5FMm5RSUVqZ3RJWVE2aGo0bzVuOS9w?=
 =?utf-8?B?YnIzbUN3NUJZdGZZMWQ1SjNZcXp2Qmo3aXpRWis0TVRTSTZVTkZpN3BkeVVB?=
 =?utf-8?B?VzN4R21Pb1BKdGxvNzBJaHlnSzNqRitOYTlUWEI1OGQzTkszeHVHcEtKTFRO?=
 =?utf-8?B?TEtMRDhST05nTGVoYUxvVWNTYVJXelNBSGk1MXlCbWVyOXVBSlRmeUZxK2Qv?=
 =?utf-8?B?eFhzQjFFc0ZGcEg1QVZpMHp1ZTMvazFodzlqaTlabTI3THRpUkptNyt4bDFQ?=
 =?utf-8?B?cEs1bVBLUUQxb1FkanJ4ZTRPZDRYaVRETWIvanArU0tFMXliWll3bi9JVDlv?=
 =?utf-8?B?ZDllNUlpN0N5QytPZzhuQW5RQUhaV2w0UUdMN29QRXB1M1ZjS24rN1BxUmFE?=
 =?utf-8?B?a2xNYXIzbWZtTnhmN0tOUllNNHhTbVhRZDBMMm5WcmRBbFhDdVZqaktBazVQ?=
 =?utf-8?B?N29oQjdLV2s2NStPMnhCQUJmd1d0UjYwMFNEOHNkeHRKc01BY29sRHFPRUps?=
 =?utf-8?B?ekRPNW9BeGZxSGI4ZTBXSW9BN3VzQXdJUE5mNUx5ODI5RGlSV1ByL3ltZ0FT?=
 =?utf-8?B?VVdUUUpOdnpRSERPbDNvMlNtc1k2eENPenRFMXc1Tm8xY3BOeVQ1Vk9pbjVi?=
 =?utf-8?B?c1ZITG9OVVBlTW9ZWEhxeTN6cG9UTElOSGNhclhYOEx6cU9RaTBZdmN0U3RH?=
 =?utf-8?B?ZmgxRExYMFY4VU8vSWVSSFJrUFE4NExLQTgzRXIzZmo2MkkyQ0I3eUQ1eklZ?=
 =?utf-8?B?QkJmMXVXYzRmYjVNdGxyaHV1aTdVaGRPbEl1dEdUNjhoRDQzQi8wZWlSRGZy?=
 =?utf-8?B?bzJRUmc0dENLOStBTHkzN3VBYisvdXI4WTdjTVNRVmxUZWNpeHJwcU5lb0M4?=
 =?utf-8?B?blNmVmtYZEVGQ1VlS3FlNW9ldHpBRGRpZXZuaUU0RjZzNzlZQmdOWHBBK3o1?=
 =?utf-8?B?Qk4yTWV3c1pBd3Nub04yVlpJMER2VUVWd1BQL3JMYWorWC9BNk1OVzdkcmFk?=
 =?utf-8?B?cnpBZFc4cXZLOFd5NVJxeDRFTFd4WHA4bU1LNm5tQVh0RkxBaTZEbEZkMHp5?=
 =?utf-8?Q?GtmA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb40e6c8-216c-4554-a5e4-08db6be19773
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 07:41:25.5225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vhAMF7R/oMKlWpkeZ4I7sLs0ddInWrL27mEU3Sk1EPvMCKdxpCj5xY+4x2wr7BB8/fiOJChp9INWXyU0WEFuKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9895
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUg
MTMsIDIwMjMgMzo0MCBQTQ0KPiBUbzogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+OyByb2Jo
K2R0QGtlcm5lbC5vcmc7IGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsgY29ub3Ir
ZHRAa2VybmVsLm9yZw0KPiBDYzogc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRy
b25peC5kZTsga2VybmVsQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207IGRsLWxp
bnV4LWlteCA8bGludXgtDQo+IGlteEBueHAuY29tPjsgbGludXgtcGh5QGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiB1c2JAdmdlci5rZXJuZWwub3JnOyBKdW4gTGkgPGp1
bi5saUBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW0VYVF0gUmU6IFtQQVRDSCB2MiAxLzJdIGR0
LWJpbmRpbmdzOiBwaHk6IG14cy11c2ItcGh5OiBjb252ZXJ0IHRvIERUIHNjaGVtYSBmb3JtYXQN
Cj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNh
cmUgd2hlbiBjbGlja2luZyBsaW5rcyBvciBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRv
dWJ0LCByZXBvcnQgdGhlDQo+IG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQgdGhpcyBlbWFpbCcg
YnV0dG9uDQo+IA0KPiANCj4gT24gMTMvMDYvMjAyMyAwOTozMCwgWHUgWWFuZyB3cm90ZToNCj4g
PiBIaSBLcnp5c3p0b2YsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPg0KPiA+PiBTZW50OiBTYXR1cmRheSwgSnVuZSAxMCwgMjAyMyAxMjo0NCBBTQ0KPiA+PiBU
bzogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+OyByb2JoK2R0QGtlcm5lbC5vcmc7IGtyenlz
enRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZw0KPiA+PiBD
Yzogc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBl
bmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207IGRsLWxpbnV4LWlteA0KPiA8bGludXgt
DQo+ID4+IGlteEBueHAuY29tPjsgbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc7IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7DQo+IGxpbnV4LQ0KPiA+PiB1c2JAdmdlci5rZXJuZWwub3JnOyBKdW4gTGkgPGp1bi5saUBu
eHAuY29tPg0KPiA+PiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGlu
Z3M6IHBoeTogbXhzLXVzYi1waHk6IGNvbnZlcnQgdG8gRFQgc2NoZW1hIGZvcm1hdA0KPiA+Pg0K
PiA+PiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJl
IHdoZW4gY2xpY2tpbmcgbGlua3Mgb3Igb3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3Vi
dCwgcmVwb3J0DQo+IHRoZQ0KPiA+PiBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1h
aWwnIGJ1dHRvbg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAwOC8wNi8yMDIzIDA1OjM2LCBYdSBZYW5n
IHdyb3RlOg0KPiA+Pj4gQ29udmVydCB0aGUgYmluZGluZyB0byBEVCBzY2hlbWEgZm9ybWF0LiBC
ZXNpZGVzLCB0aGlzIGFsc28gYWRkIG90aGVyDQo+ID4+PiBvcHRpb25hbCBwcm9wZXJ0aWVzIG5v
dCBjb250YWluZWQgaW4gdHh0IGZpbGUuDQo+ID4+DQo+ID4+IFdoeSBvbmVzIGRvIHlvdSBhZGQ/
DQo+ID4NCj4gPiBJIGFkZCBjbG9jaywgcG93ZXItZG9tYWlucyBhbmQgcGh5LTNwMC1zdXBwbHkg
dG8gdGhpcyBkb2MuIEJlY2F1c2UNCj4gPiB0aGUgdHh0IGZpbGUgc2hvdWxkIGNvbnRhaW4gdGhl
c2UgcHJvcGVydGllcyBidXQgaXQgbm90LiBJIHRoaW5rIHRoZQ0KPiA+IHR4dCBkb2Vzbid0IGdl
dCB1cGRhdGUgaW4gdGltZS4NCj4gDQo+IENhbiB5b3UgbWVudGlvbiB0aGVtIGluIGNvbW1pdCBt
c2c/DQoNClN1cmUuDQoNClRoYW5rcywNClh1IFlhbmcNCg0KPiANCj4gPg0KPiANCj4gPj4+ICsg
IHJlZzoNCj4gPj4+ICsgICAgbWluSXRlbXM6IDENCj4gPj4+ICsgICAgbWF4SXRlbXM6IDINCj4g
Pj4NCj4gPj4gWW91IHNob3VsZCBsaXN0IHRoZSBpdGVtcy4NCj4gPj4NCj4gPj4+ICsNCj4gPj4+
ICsgIGludGVycnVwdHM6DQo+ID4+PiArICAgIG1pbkl0ZW1zOiAxDQo+ID4+PiArICAgIG1heEl0
ZW1zOiAyDQo+ID4+DQo+ID4+IFlvdSBzaG91bGQgbGlzdCB0aGUgaXRlbXMuDQo+ID4NCj4gPiBB
ZnRlciBteSBjaGVjaywgdGhlIG1heEl0ZW1zIHZhbHVlIG9mIHJlZyBhbmQgaW50ZXJydXB0cyBz
aG91bGQgYmUgMS4NCj4gPiBXaWxsIGNoYW5nZSBpdC4NCj4gDQo+IE9LDQo+IA0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
