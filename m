Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50EE573F12E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 05:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjF0DKe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jun 2023 23:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjF0DKa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jun 2023 23:10:30 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2084.outbound.protection.outlook.com [40.107.6.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CF8BB;
        Mon, 26 Jun 2023 20:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elzgAyJgcxWHJNdT3bbSyJbcQ3tit70M0kGSinAHm65LCpguXNYhPWMytZWQimdf/xFtJf28KUdM/AIjk2xBdaiSiknx4G0SRLEjLmZlDWduJ+5Uqu2060B72MndDx3iHOjgG7+/GR1wU4yg+zvgckb22QFYA4gn6o1b5FkJfSbJ2tBxZzlRmdYgxAv913Rb4TogjZEeLhb5FmqQQw0S/kDoxhEVju2BKF7mclrL9JYyb39BSpDmVeAHKsYzx5QmjWkJ+zxH4DFZPLDi+OC1bHW92cLR1qlToIhvoVWhPZlEBAF3VDpMOV1Ba8C0caQMC7bIVhRwY0iMfIlHZgsbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUP1Soe5cxqZQ88rYehXjjScxyUwW+Ln8G6fqoGPMuI=;
 b=IrENC+6sQxyXMW5M6lAMW5jgX4SFiC7xpxPKjdV7ptLEp2a7Rc2edi17xx352MYE5ln9ZKPwpqaQlhs3qL+Nv4/5q4L8/OkSEeHCyylGEXL/hYwRHY2FjHFsJwgPr/z7Pbxhxtj6qMI3OkkhsnGZSNe0JQo7PZqg6kaiJHybOIKAfdfI5Ye6Hbse1BFv8SHBvMeHTfc1txg22GUohQ2pxU6ikBWZ3UHFIS7e7bWQ7/Y75x4TipyeCnnfV0TSzGPnhirKZOq0MGOLqf9Gc/X6ZyqXyR64plZ0WBwk0anCLi41tFmvd6np5+os4PVunHKxvWcsp9b33J8RvIhl+SRVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUP1Soe5cxqZQ88rYehXjjScxyUwW+Ln8G6fqoGPMuI=;
 b=NrXAerR+/2hXbqc67eAMJ30OstD4/bbexiRn3LrK7duCxh7XB6iYnEHMEgptPpNYP6ltRAPP/X95LpTXLzpijlUULGA0HTzNeZu5KXXJLMmPVrLz5+eKOPsuE51zMYdsxlxsKiY1N6iWD3qUi5eAYHovMTvftprlojn3WePphGc=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 03:10:26 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 03:10:25 +0000
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
Thread-Index: AQHZqBBJbsSup2uDJk6TF4DDvs1C16+dOiMAgAC3WJA=
Date:   Tue, 27 Jun 2023 03:10:25 +0000
Message-ID: <DB7PR04MB4505F485E48DE667D62602748C27A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230626092952.1115834-1-xu.yang_2@nxp.com>
 <20230626092952.1115834-2-xu.yang_2@nxp.com>
 <f7bca54b-9de1-be9a-ad46-3502df58289f@linaro.org>
In-Reply-To: <f7bca54b-9de1-be9a-ad46-3502df58289f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AM9PR04MB8469:EE_
x-ms-office365-filtering-correlation-id: e38be34b-af57-47da-c339-08db76bc0db4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: THmCjV1C/CKaxbc5i5IqoUfriy7pI8+BTRWKghOhqFwVu8Al3R05jTYXw3j7BkbkJ2iDzdIVuTFPgRQ+fGwVhPznIXcS/wDgS0VcUCYyfkpBhOnU53e6J3H+Cjwkq+5cOR+yNqWiTrGKVZ4IZ4yep9XTsYLw1W5dh4hUpkX3GKQJ51/ZNpg0a5DdsbuxOWisEfxWOwBr3kRIlDJXPqmE+++C4pYrGMs4EjZQKMzzhHuLiVAsmH0OYaRW9WWVX5kTUI+MjoY4L6FsWfeXK18PhJBCnHfUvMGl/N4HrmCJNjZ68WvtxBEZcE/QHLrv7v5j9E28FxXpjqxaJqrrZBbFe0/SBayLMyOKZsx22pk3O8a30O5LgwAfNzAEjB9ZI59qgLxEQFry8dQwZ2Q4+EPMszqab31aCoNraJb8iC2QtiWfi80riYr52t3p93GGMHsRkWqX68tKJMOwuc37QCfqPcK9mQSvoYwQaJItuLs/XuiJkkgntoPvPzXv5yvAdbxBnHql0rgr4krMhBCA0dmSfc+rTmf3omZK08KuQ2H+vp613C8tZwGQ8TSFw8DwqgYAKZ/T7a4dhocONgBh4YlbHRVmkoDUqffLqP92+7nvq6LPFeip52sZA0TxQDxkA0yG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(26005)(33656002)(5660300002)(7416002)(52536014)(4326008)(66446008)(66946007)(41300700001)(8936002)(66556008)(64756008)(86362001)(38070700005)(66476007)(8676002)(38100700002)(122000001)(76116006)(316002)(55016003)(9686003)(2906002)(6506007)(53546011)(186003)(7696005)(54906003)(478600001)(83380400001)(71200400001)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cndIQ29Cb2V1cDlSYzZwajVvWGppSGVrMy9lbWozdG9wbklER1FzQmsvWHBw?=
 =?utf-8?B?aUgvQ09hWk1aRk55amtnQkxPRjY5MUZkdGpuTjlhbVpiWDNKT0xTUWxFQ2NF?=
 =?utf-8?B?N1R2U0tsUEpvWkQ3Y1RtVWRPaSt4Qk1EVDBNTFdMTmIzVVpsajd1SWQ4UTJm?=
 =?utf-8?B?VFBZcUFhaDByV3MyNDBnWFVRUXpCNjhwVGlWTkd6a0JYR2lLT0ROblFCK2d0?=
 =?utf-8?B?cStGQm9HWWVXNndyUXA3cHJLdUUyWDhlSmZJYnF5WG5QRExzNWRNVWxHcUdZ?=
 =?utf-8?B?UEpRMm1RYU5SNTRPWkl5Qkk2OTQ3NXdtdjlFc1JheWgxb0tZdnRhRVduWEFp?=
 =?utf-8?B?Y2d1OHdid0NYMkliUnBOazg5N2Q3YWhRNzlVSjdaY3RnbnFBVVo5ZVNCRHdS?=
 =?utf-8?B?aUhTZEE3U3Ftbng1L0xVeC83NDhPUDVtRDUyVEFmYW56MlExWTJtUEY3OUhi?=
 =?utf-8?B?a2t2QmNqWnBnVmRBQ0RYOXpKMUIvVU9VZzdkWXhNY28wR1dyKy9HMlNDOXpu?=
 =?utf-8?B?SGRiRkVya282VXZQbTE4dTdiTVhFMThERVMrWTNNM2dQSFJDZDRGc3RndmhG?=
 =?utf-8?B?czRpRmNISVl1SkFDVXNidmVYR2thS2lGRndVendxOUFhcWowbkV4S1g0Ymt2?=
 =?utf-8?B?YTR6Y2xETElvQStOeS9kZ1NZcFM2VThDM0tYR1lGNHhlSERIbHJhdzFhQmd0?=
 =?utf-8?B?MGpNa2VTZzJ6R0pSajZoNjhscWJMRWc5U2wweVFtOXk4cUsvTjhkeG5kMHJO?=
 =?utf-8?B?eEYxT1pyeXNiM2xHaU1rWnh5Q2llbEZIZ0dZMHlZREtPR0U3R1A3VGp3dUVw?=
 =?utf-8?B?a2ZvVG1DdE1JM01lMnQxSjF1SjZhS05hRU5yR2NYU09OWEhKdm1uNzA0SEtG?=
 =?utf-8?B?dE9MZEFpbmdoMHQxbzV3N0Q3Q3M5YXFWYWlWWk14OTRHOTVlZEdqaUZReWcz?=
 =?utf-8?B?OGJiSktxSDY1TjNTRzJCU1JVVTY2MTJrbXBQZXh5T2lmYzVMemI5M2hFZXBS?=
 =?utf-8?B?cDlBMEU4ZnBNZzlMSG9GMkhtaWRQMFYxZ3Fpb05oclVGdlJkejdadS9NbEdH?=
 =?utf-8?B?OEI5QTVneDVJNUkvb29Zb0h1eXVHT2xqOXMyWk9pRGgzVUFCQ0FhcEFNQkRk?=
 =?utf-8?B?SGZLM0VZNUdrQzcyV3U5TE8vVUNaV3ptV3R4aS9WcFpreXZSSWM5RW53MllO?=
 =?utf-8?B?UzdmUk9jY0Z6eTZoUUhkV1hESDdCWThJaUNGM2M0VGl3b1JoVmhZcXExaVhW?=
 =?utf-8?B?bDBmUEhoS0dvTVBaclFiVHJqV3N1MUliSXhjOFNTRnNIdyt6TWFtQ3lSbStj?=
 =?utf-8?B?bUt6MDFhWDhYT1JqcFI5NnhZaWFEYmxzTGhrb1hlMjQ3TElUK3NCOXJ5dDh4?=
 =?utf-8?B?cDlrOXNQRTFGNHJsdlJLVHJxUlZIY0RjeGZwbGZDb3dvZUVlRVl3ditUYU5T?=
 =?utf-8?B?bmc5UWJCRVN6bjJBZmw4U3FWSUkrK2tzam1zcXVnQnpDeG5DR2I3c2k5Z2tt?=
 =?utf-8?B?Z2RDWVRhVm5iN1lwSVF3NzhCamVMb3AzUDVrZzd3NmRndEFJUUg5YVdYa1NW?=
 =?utf-8?B?S3NIWEVLTXZZeE41a1BZeUtYTUNlMmhIUEVRWjJtY1Y0RGFEdWJ1TXNvc1FY?=
 =?utf-8?B?QmtIMktTWENINXNrejA1WEhyV3gyNnBoYkpGN00xZDFJK0tDdDRhclh6NU5B?=
 =?utf-8?B?S3diSVJ2V0ZmREIvWmk5SHE4Tkl1d1Y0NXhVeVNqS3UzWHd6ZmF1NTdURkc3?=
 =?utf-8?B?WHZNS3VKeEdQRUJ3NEJ6TDh4blA0dU9CUVJ2NHJaRUZYdmM4NVFHdks1T2hk?=
 =?utf-8?B?VU9DbExoQnJwbGFmNmU4L1FBSEtzdXFjRmFGakVIMk1BK1pOdndDZ0I1eHR5?=
 =?utf-8?B?cUFHNDBnYXA3ZDRMMFRxWkNuWStFbHNsYUJqejIvRGNEYlptR2xrTTMycnMr?=
 =?utf-8?B?YldTUVpDb0J6Wmx2bzBPYjNabEVLWHNDK0wzdnBYRGpoWTFRcTNqdmNCYTFi?=
 =?utf-8?B?elVQQ1BiMGdZekNyK0RuKzhnWmYxcmJ3b3MvaElWRkVRdGduUC9KU2lXd0ln?=
 =?utf-8?B?dW0yK25BMFQ1czNWT0pYSTlDQlpOTkNpenJubmZvZVFNY3djbWJSbWtqYVNB?=
 =?utf-8?Q?xA/g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38be34b-af57-47da-c339-08db76bc0db4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 03:10:25.8399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51BMTZjB/eCrXtVtv945r5Z3GgpllTFC+N/X/apkVfS1Yjg/Zwn5uc11Di6NpwNvxAXO8DvpCZPur9iZT5Wc4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8469
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
dDogTW9uZGF5LCBKdW5lIDI2LCAyMDIzIDExOjQ1IFBNDQo+IFRvOiBYdSBZYW5nIDx4dS55YW5n
XzJAbnhwLmNvbT47IHBldGVyLmNoZW5Aa2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOyBr
cnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7DQo+IGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnDQo+IENjOiBjb25vcitkdEBrZXJuZWwub3JnOyBzaGF3bmd1b0BrZXJuZWwub3JnOyBz
LmhhdWVyQHBlbmd1dHJvbml4LmRlOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsg
UGVuZyBGYW4NCj4gPHBlbmcuZmFuQG54cC5jb20+OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3Jn
OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgSnVuIExpIDxqdW4ubGlAbnhwLmNvbT4NCj4g
U3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCAyLzNdIGR0LWJpbmRpbmdzOiB1c2I6IGNpLWhkcmMt
dXNiMjogYWRkIHNhbXN1bmcscGljb3BoeS1yaXNlLWZhbGwtdGltZS1hZGp1c3QgcHJvcGVydHkN
Cj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNh
cmUgd2hlbiBjbGlja2luZyBsaW5rcyBvciBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRv
dWJ0LCByZXBvcnQgdGhlDQo+IG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQgdGhpcyBlbWFpbCcg
YnV0dG9uDQo+IA0KPiANCj4gT24gMjYvMDYvMjAyMyAxMToyOSwgWHUgWWFuZyB3cm90ZToNCj4g
PiBUaGUgc2Ftc3VuZyxwaWNvcGh5LXJpc2UtZmFsbC10aW1lLWFkanVzdCBwcm9wZXJ0eSBjYW4g
aGVscCB0byBhZGp1c3QgdGhlDQo+ID4gcmlzZS9mYWxsIHRpbWVzIG9mIHRoZSBoaWdoLXNwZWVk
IHRyYW5zbWl0dGVyIHdhdmVmb3JtLiBUaGUgdmFsdWUgY2FuIGJlDQo+ID4gMH4zLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4gLS0tDQo+
ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbCAgICAgICAg
ICB8IDEwICsrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL2NpLWhkcmMtdXNiMi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9jaS0NCj4gaGRyYy11c2IyLnlhbWwNCj4gPiBpbmRleCA3ODI0MDI4MDBkNGEuLmQ4NGM2
NmMzNDJhYyAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbA0KPiA+IEBAIC0yOTIsNiArMjkyLDE2
IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICBtaW5pbXVtOiAweDANCj4gPiAgICAgIG1heGltdW06
IDB4Zg0KPiA+DQo+ID4gKyAgc2Ftc3VuZyxwaWNvcGh5LXJpc2UtZmFsbC10aW1lLWFkanVzdDoN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBIUyBUcmFuc21pdHRlciBSaXNlL0Zh
bGwgVGltZSBBZGp1c3RtZW50LiBBZGp1c3QgdGhlIHJpc2UvZmFsbCB0aW1lcw0KPiANCj4gQWRq
dXN0IHdpdGgvYnkgd2hhdD8gV2hhdCBhcmUgdGhlIHVuaXRzPw0KDQpUaGlzIHByb3BlcnR5IGlz
IHVzZWQgdG8gYWRqdXN0IHRoZSByaXNlL2ZhbGwgdGltZSBvZiB0aGUgaGlnaC1zcGVlZA0KdHJh
bnNtaXR0ZXIgd2F2ZWZvcm0uIEl0IGhhcyBubyB1bml0LiBBY2NvcmRpbmcgdG8gdGhlIGRlc2Ny
aXB0aW9uIG9mDQpVU0JOQ19uX1BIWV9DRkcxIHJlZ2lzdGVyLCB0aGUgcmlzZS9mYWxsIHRpbWUg
d2lsbCBiZSBpbmNyZWFzZWQgb3INCmRlY3JlYXNlZCBieSBhIGNlcnRhaW4gcGVyY2VudGFnZSBy
ZWxhdGl2ZSB0byBkZXNpZ24gZGVmYXVsdCB0aW1lIGlmDQphIHZhbHVlIGlzIGdpdmVuIHRvIHRo
aXMgcHJvcGVydHkuDQoNClRoZSBhY3Rpb25zIGFzIGJlbG93Og0KICAtIDA6IC0xMCUNCiAgLSAx
OiBkZXNpZ24gZGVmYXVsdCANCiAgLSAyOiArMTUlDQogIC0gMzogKzIwJQ0KDQo+IA0KPiA+ICsg
ICAgICBvZiB0aGUgaGlnaC1zcGVlZCB0cmFuc21pdHRlciB3YXZlZm9ybS4gVGhlIHJhbmdlIGlz
IGZyb20gMHgwIHRvIDB4MywNCj4gPiArICAgICAgdGhlIGRlZmF1bHQgdmFsdWUgaXMgMHgxLiBE
ZXRhaWxzIGNhbiByZWZlciB0byBUWFJJU0VUVU5FMCBiaXQgb2YNCj4gDQo+IGRlZmF1bHQ6IDEN
Cj4gDQo+IERvbid0IHJlcGVhdCBjb25zdHJhaW50cyBpbiBmcmVlIGZvcm0gdGV4dC4NCg0KT2th
eSwgd2lsbCByZW1vdmUuDQoNCj4gDQo+ID4gKyAgICAgIFVTQk5DX25fUEhZX0NGRzEuDQo+ID4g
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiAr
ICAgIG1pbmltdW06IDB4MA0KPiA+ICsgICAgbWF4aW11bTogMHgzDQo+IA0KPiBXaHkgInNhbXN1
bmciIHByZWZpeD8gSWYgdGhpcyBpcyBzcGVjaWZpYyB0byBzYW1zdW5nLCBtYWtlIGl0DQo+IHNw
ZWNpZmljL25hcnJvd2VkIGxpa2Ugb3RoZXIgcHJvcGVydGllcy4NCj4gDQo+IFRoZXJlIGFyZSBu
byBTYW1zdW5nIGNvbXBhdGlibGVzIGhlcmUsIHNvIHdoYXQgaXMgZXhhY3RseSBoZXJlIG1hZGUg
YnkNCj4gU2Ftc3VuZz8gV2hpY2ggZGV2aWNlPw0KDQpSZXZpZXdlZCB0aGUgZGVzaWduLCB0aGlz
IGlzIG5vdCBzcGVjaWZpYyB0byBzYW1zdW5nLiBJIHdpbGwgcmVuYW1lIGl0IHRvDQpmc2wscGlj
b3BoeS1yaXNlLWZhbGwtdGltZS1hZGp1c3Qgc2luY2UgaXQncyByZWxhdGVkIHRvIGlteCBjaGlw
Lg0KDQpUaGFua3MsDQpYdSBZYW5nDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9m
DQoNCg==
