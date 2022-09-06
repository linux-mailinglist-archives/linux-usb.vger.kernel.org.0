Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17405ADD22
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 04:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiIFCDz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 22:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiIFCDt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 22:03:49 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64AA3C8FC
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 19:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXgNe/y/iy0Rzm4Rj8q/0iu4XUapUCUkiMWVLMZaNEfkdCXlyIFTcV0iM4gHCSfJzWwRsG5/dCL1pdcJABIK8WabcvxhGw3LM6Xa77oAnymygaqTMwObtbmTqh44sE11KPT2Gym/Hl+JM5PcTFwBynTwJke/QFMxi7lQ+hCd5UhW1Mn0j7Xij6j1XMGwoPAecdrr5SxB4/ckxvYDFS2I8ysv0LJGq4Qoa3gqaW5kKOzPwMCmgUwYaBkWsk0X1qN6/+0vTmSbW3lpW4xTLFdqNQSpdgiwc+PUaZkknqYC1K0M8oLeQMiysMpvuAy/u/T2qyteGfqIlzMX/goRQ8LGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+APEyUvEw/h+LS4LdKhamFrcW0fu+5C2vnFYod7YNSE=;
 b=M4qw8R34tt8JJ3AEifoVd7tUti2oFy06gnNJM4hqF8AqJ+2cX/+pNvsOBudOusiA52ZIRsTZCWVIHX4aJVmZ+RjYvTMyB1G6mKGXdea2dyGFh36yICWp8uMUy22sStz/0NGaeIlh4ltzHtUMxcPSeE1aDYL7PL80/0B2VmvAu93I4FN0UuPRH1n+GEqWTaXGSXbbDp/qa9ilDnJfOmKrFBGgFHsWf6OhqAZG24n2siHdvPySMwpc8aaPJEAfzQItEbNV6DwqsqWM7K7SoOIgQChxCcgYhgOGsmBRVmYm/5d7cJF1VAZxpBmxXGyCIcXTC0Q9DmyPu/4VOyddf4yyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+APEyUvEw/h+LS4LdKhamFrcW0fu+5C2vnFYod7YNSE=;
 b=oyR7NYaNfvgEsRYStgFwHX6doYrbr87J962zRF1N1Casyc7fsHI5ZS2JbZKfmjklVCJEwDIllgxcId120YA0w7Ja3lZxsb5NMNgN0gzhCaWyBzI2Cmnbsoh4BGASMY+KFKqkD/faVL7p8hUx4Sfv0FpOQcerxohtA0BHBnbY8P0=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AM5PR0401MB2434.eurprd04.prod.outlook.com (2603:10a6:203:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 02:03:34 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2%9]) with mapi id 15.20.5588.012; Tue, 6 Sep 2022
 02:03:34 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "tharvey@gateworks.com" <tharvey@gateworks.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
CC:     Jacky Bai <ping.bai@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
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
Thread-Index: AQHYvJlun8zHtetRRkihIPQ7OoRso63INeaAgAAFn9CAAPtrAIAIdHuQ
Date:   Tue, 6 Sep 2022 02:03:34 +0000
Message-ID: <PA4PR04MB964034EE17769786212D31A0897E9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <CAJ+vNU2bLPAta6GpDn_dGSrCnCRuBtxvLZ-g01h1jGwQuruBuA@mail.gmail.com>
 <DB9PR04MB8412164E22460736FB15B8D687789@DB9PR04MB8412.eurprd04.prod.outlook.com>
 <PA4PR04MB9640F578AEF2558BA3F08F8889789@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <CAJ+vNU10JeQg7GO+cd+Twn_uE4Hsh0T422+vZKT-DW517OD-RA@mail.gmail.com>
In-Reply-To: <CAJ+vNU10JeQg7GO+cd+Twn_uE4Hsh0T422+vZKT-DW517OD-RA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 781ccfb3-72d2-4724-f461-08da8fac012a
x-ms-traffictypediagnostic: AM5PR0401MB2434:EE_
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oH1KwR7rzuXGoqiGykyZfk8j6EPjUKwgcoa4+5wZudRy+dPMaSsvXZ0r4DnIAw+Lmk7WVIxPxJZk0xM1U/r7Eo3thPOsx7tbGJERUl4Saa8HzQGad+t7K34KTcoU0DLxRf5tnI3fxU3BqK+JoXtyc1hlXripHJtJOn/v0OnKvl0q+21nZE4Ws/PRXhpzx89FQUNQOhPUppggfozfNB+B/+SpOBDRa4MB5HFpJATSvjRbKovj2aPWnHyF3BK5ElTc8qiegKCIvzjjr3nvbgEQV0v+6TrLgXVpFU/7CCUnL8+a6Vr1Na2G0KOlqpti44Lse0NfCRllS6T59gwQKHtjSw4KqF6PM3JwaAFRyCkKI+/GuXXBIGmkHvJNXEPo0SoHl0y8oq/N5xRWtqYE9GkHcVrNRQC+VOTArCXbYpa1c8wxL2kL9+My/XjPkV6VgvoHPgHDL650rk7ZlxHKQ+Il9ZLfbppGdGMU8TacQrd3FMTkX64uD+hVLiUnKDOkAWd+BrteqC2hXWeavtHUXWoWCZWKGQ7o4GZzLLxpcR6fx6SuViRJPNhMReQoJyF5x75ojVhn+vdGedCKTXdZr7XTxYLmTe3mdyqVCGgQN0o/Vl0NKmuDWbV7BGPraIoB6RZIgZFuYzv90OnUK4Id/3bSC22SInLRZ9BrdhdjvzBKuDkreJ40r49TgVm2F31ikrxJvYc6bgKqQNKJ50lRr4urmAiC+4tfovjScIrHi4UZm0BrejG20mkNA2t67mRMRkyXqZ+S1T13BSzviQYcJ5eRn2pypO2r3uozyIHuKgLR/ZVi5l8YM96A7bIeFRYLmcVXlssdZWm2HhyMAZ0nEodF9nQ1aKZY0QV29YKjW0i19ec=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(52536014)(9686003)(41300700001)(26005)(8936002)(2906002)(122000001)(33656002)(478600001)(44832011)(7416002)(66556008)(38100700002)(66946007)(76116006)(66476007)(86362001)(64756008)(66446008)(6506007)(8676002)(4326008)(53546011)(7696005)(5660300002)(110136005)(38070700005)(54906003)(186003)(316002)(55016003)(71200400001)(83380400001)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajBueDBWSWIvSFhTOEh2cWREK2xrK1BmekVwdHBXM2RGYmp0eVJkZzZFOXUw?=
 =?utf-8?B?MDVOV254a3pLUU5wVjZMRGI5V2JRUUIwNnNmOXN0VlFEbU9pSVhqZUEwWlU1?=
 =?utf-8?B?cWN6L3ptYUFaMTY3bldnRkp6TFZ3QmRUSVRtVkxvR1BaSkRVYlN0S0hvV0hq?=
 =?utf-8?B?c0pWTzlNQUplcFlqOUxVTXMrRnA5djVIQ3Y5QzJhUk1QenpsdE13WkZCa3Jq?=
 =?utf-8?B?M1pCZzhSUG5kblN5TmlKVDd4ZHlxdE81R3FHOUMyUDQwc1JBVTY2U1ljSzU0?=
 =?utf-8?B?THFFb1QrYzhjSWwxN1FUM1g3NmVWNVh3enZzek5HZDZpeGg0QjNGaFhhQkxm?=
 =?utf-8?B?ZmRpbENlNzhwSE96QUs2ZTVadlZrMittTVhIOEgwMjcrd3ExeVBPNTUzMks2?=
 =?utf-8?B?LzNyU3hxZTBERXdHRUdvTXFPdnFNYTVNdjlEVmxsamYxOUJXaUZYNHJsWno2?=
 =?utf-8?B?SWU2elRkbVJNZDBGTUswWnNJbTJCQ2l0bE9TT3lreHFWVDRlRjhPSWRlL2E1?=
 =?utf-8?B?b0tqMERhYlFia3dZQVJENDNscXp5UWowcXQxaDZudlpXdWxkTVZiS3dmL0ZW?=
 =?utf-8?B?cWFXVldhOXJmRDB6S1BxR0VLY1VRUDJQUlo1K2ROU3dQSzlaNmh0QlExWHQ3?=
 =?utf-8?B?R3U5UXpWM2tPQm05US9rNXFlWEJVa29LakdYdjcvdFdQRUNWOWVXSFFRUzlm?=
 =?utf-8?B?a2JSZnFucWQzZ2RhTGNkVVU2N1Z1ZlRCU0wyNGZOaHU5T2l1b2l4dEFpMGNU?=
 =?utf-8?B?UDV6MzcwUzZYaFZOVkRHaGZleEdWa2ZCaXVmR2tuZ2tLclY4cThiclRURW1I?=
 =?utf-8?B?bXRmbzNVdFlndHRxaFhnd3cxQmxJTmdNOEc2TE9iV2N3UC90NktvMUh3VzM5?=
 =?utf-8?B?cjJ5SktVcXNnRVNKZlVPdUR0ME42bzN6aSszZGNDWCtiaERUSUFBU09sZE9U?=
 =?utf-8?B?OFhOQjc3MHl2akEwL1FUdUw4TS91bEFGb3oyTE5hNjlBSWEycEhhdHBqdERB?=
 =?utf-8?B?Nmk4Sno4c1kyMUVVNjNFcGxNbFpCNHJ6WWtuRkFyT0hMVE91MHE0aFBMZ1pl?=
 =?utf-8?B?aHFmV1ljakNBWlVIVmRZMUZsM1hQTzNYYjI2Z2F2b3hkNGVudEVMVkhnOWt1?=
 =?utf-8?B?SnJvWFFaMzN0c2paZUNyUXVkMVU1UGhIMlFlQzE5OW91aDA4MEIzNG5qR085?=
 =?utf-8?B?WCtkRjZZVkNYcEFJR2p6cXhYVlYrTncvbUVqVVVoZmNYSUxVQjI0eWxrQ3Qy?=
 =?utf-8?B?STk2bGExSnlYSFk5MjhUZERnTS95L2IrK0hjTFR6Rm1MaVpxWGlkQSttdkZa?=
 =?utf-8?B?dmRWOFM0eFdBNlAzQ3Rkbm8vZ2wvVitpS3hGTXd4NDkzMnpVcmxnUTZ3QlRH?=
 =?utf-8?B?V2NOSm9rbWZqby8xR3hMUXlpQmxHbnVWdDM4U1RsdmJSV013S0RBYTNCMUtR?=
 =?utf-8?B?TnZjTTBWS3U3UzVLRGJpTUZNaFVvYTB4eEpHeHlGMUZzWDZlODVKckdoa0VI?=
 =?utf-8?B?S0Z5dVZwbXZBRWhMVUJoVTVUZHJtSC9NZEhuY1VoSEtvejRZckhzcFQzUXZj?=
 =?utf-8?B?VmxZb0FRZXNHVk5ranYrVmZPcmhFWHMxRWZkd25xWktyUktLUlJaaFZrdUhs?=
 =?utf-8?B?cnhpSDBmSExndWVMVTVFL1p0UnhVaXVqeGVXTDBRalIrV081dGNBUlZzK1Nh?=
 =?utf-8?B?MU1iWERGaWdXTWIyQm1LajdpaHJlL21QRHZBWmVIU09SOVZOUnR5TjgwUWkv?=
 =?utf-8?B?SVhLcU9aUEJBYlhzMVVrL3RmL0lTdWxCOUlnM1lvallQOURxUGVZeVhWaFVH?=
 =?utf-8?B?VGRoekVPb0EzMVdEUWVoNW1JTWhjNUprZlNPWGdMT25CZWUvSTFjWTJJaktT?=
 =?utf-8?B?dDVJeDlENmdRY25TQ3l2Q0lnUktTVTA5dGU0RjdVR3VRaCtSNUdvMWhXRkh0?=
 =?utf-8?B?SmNDVU9uUHExeDJCWk1TM2Z5OFBGSUExaEpqMWltQXg2NE8zd3FuRC9aK2xh?=
 =?utf-8?B?dlBpcU80ZmxSWkdPMmVsbVliQmJBaEkwQzZsRjhkVDlhTXZadGFsSG91WHFT?=
 =?utf-8?B?NUJvNUpkQkt6NUwreDJObHBsY09DSlQwNFJlKzdiZW1BWUNUSERnMjltUk5F?=
 =?utf-8?Q?U06k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781ccfb3-72d2-4724-f461-08da8fac012a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 02:03:34.2460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kbA0oTGFhL8YCo6nqhaGMPfeHZAGOeyuKpRVLrFeJV0/HYIM7VU2OWtVF6bPljR6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2434
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGltIEhhcnZleSA8dGhh
cnZleUBnYXRld29ya3MuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDEsIDIwMjIg
MTI6MzggQU0NCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+OyBBbGV4YW5kZXIgU3RlaW4N
Cj4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+DQo+IENjOiBKYWNreSBCYWkgPHBp
bmcuYmFpQG54cC5jb20+OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBMaW51eCBBUk0NCj4g
TWFpbGluZyBMaXN0IDxsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBSaWth
cmQgRmFsa2Vib3JuDQo+IDxyaWthcmQuZmFsa2Vib3JuQGdtYWlsLmNvbT47IEx1Y2FzIFN0YWNo
IDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPjsNCj4gUGhpbGlwcGUgU2NoZW5rZXIgPHBoaWxpcHBl
LnNjaGVua2VyQHRvcmFkZXguY29tPjsgRmVsaXBlIEJhbGJpDQo+IDxiYWxiaUBrZXJuZWwub3Jn
PjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZGVueC5kZT47IE1hcmNlbCBaaXN3aWxlcg0KPiA8
bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPjsgU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwu
b3JnPjsgTWFyZWsNCj4gVmFzdXQgPG1hcmV4QGRlbnguZGU+OyBGcmFuY2VzY28gRG9sY2luaSA8
ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+Ow0KPiBBaXNoZW5nIERvbmcgPGFpc2hlbmcu
ZG9uZ0BueHAuY29tPjsgU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsNCj4g
ZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFt
DQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+IFN1YmplY3Q6IFJlOiBpbXg4bXAgVVNCIE9U
Ry9kdWFsLXJvbGUNCj4gDQo+IE9uIFR1ZSwgQXVnIDMwLCAyMDIyIGF0IDg6MTEgUE0gSnVuIExp
IDxqdW4ubGlAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEphY2t5IEJhaSA8cGluZy5iYWlAbnhw
LmNvbT4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDMxLCAyMDIyIDk6MTggQU0NCj4g
PiA+IFRvOiB0aGFydmV5QGdhdGV3b3Jrcy5jb207IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7
IExpbnV4IEFSTQ0KPiA+ID4gTWFpbGluZyBMaXN0IDxsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+OyBKdW4gTGkNCj4gPiA+IDxqdW4ubGlAbnhwLmNvbT4NCj4gPiA+IENjOiBB
bGV4YW5kZXIgU3RlaW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+OyBKdW4gTGkN
Cj4gPiA+IDxqdW4ubGlAbnhwLmNvbT47IFJpa2FyZCBGYWxrZWJvcm4gPHJpa2FyZC5mYWxrZWJv
cm5AZ21haWwuY29tPjsNCj4gPiA+IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRl
PjsgUGhpbGlwcGUgU2NoZW5rZXINCj4gPiA+IDxwaGlsaXBwZS5zY2hlbmtlckB0b3JhZGV4LmNv
bT47IEZlbGlwZSBCYWxiaSA8YmFsYmlAa2VybmVsLm9yZz47DQo+ID4gPiBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBkZW54LmRlPjsgTWFyY2VsIFppc3dpbGVyDQo+ID4gPiA8bWFyY2VsLnppc3dp
bGVyQHRvcmFkZXguY29tPjsgU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPjsNCj4gPiA+
IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPjsgRnJhbmNlc2NvIERvbGNpbmkNCj4gPiA+IDxm
cmFuY2VzY28uZG9sY2luaUB0b3JhZGV4LmNvbT47IEFpc2hlbmcgRG9uZw0KPiA+ID4gPGFpc2hl
bmcuZG9uZ0BueHAuY29tPjsgU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsN
Cj4gPiA+IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBQZW5ndXRyb25peCBLZXJu
ZWwgVGVhbQ0KPiA+ID4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCj4gPiA+IFN1YmplY3Q6IFJF
OiBpbXg4bXAgVVNCIE9URy9kdWFsLXJvbGUNCj4gPiA+DQo+ID4gPiBKdW4sIGFzIHdlIGRpc2N1
c3NlZCBiZWZvcmUsIGFueSBjb25jbHVzaW9uIG9uIGhvdyB0byBoYW5kbGUgdGhlIFVTQg0KPiA+
ID4gT1RHIElEIHBpbiBpbiBSTT8NCj4gPg0KPiA+IFRoZSBOWFAgZGF0YXNoZWV0IGZvciBpTVg4
TVAgYWxyZWFkeSBjaGFuZ2VkIHRoZSBJRCBwaW4gbmFtZSB0byBiZQ0KPiA+IHdpdGggX0ROVSBz
dWZmaXgsIFJNIG1heSBiZSB1cGRhdGVkIGluIG5leHQgdmVyc2lvbi4NCj4gPiBJZiBsZWdhY3kg
SUQgaXMgZ29pbmcgdG8gYmUgdXNlZCwgYW55IG5vcm1hbCBHUElPIGZ1bmN0aW9uIGNhbiBiZQ0K
PiA+IHNlbGVjdGVkIGZvciBpdCwgZXh0Y29uIGlzIHdlbGwgc3VwcG9ydGVkIGluIGR3YzMgY29u
dHJvbGxlciBkcml2ZXIuDQo+ID4NCj4gPiBNb3JlIGNvbW1lbnRzIGZvciBUaW0sIHNlZSBiZWxv
dy4uLg0KPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+IEJSDQo+ID4gPiBKYWNreSBCYWkNCj4gPiA+
DQo+ID4gPiA+IFN1YmplY3Q6IGlteDhtcCBVU0IgT1RHL2R1YWwtcm9sZQ0KPiA+ID4gPg0KPiA+
ID4gPiBHcmVldGluZ3MsDQo+ID4gPiA+DQo+ID4gPiA+IEkgaGF2ZSBhbiBpbXg4bXAgYm9hcmQg
KGlteDhtcC12ZW5pY2UtZ3c3NHh4KSB3aGljaCBoYXMgYSBEV0MzIFVTQg0KPiA+ID4gPiBob3N0
IGNvbnRyb2xsZXIgdXNpbmcgaW14OG1wIFBIWQ0KPiA+ID4gPiAoZHJpdmVycy9waHkvZnJlZXNj
YWxlL3BoeS1mc2wtaW14OG1xLXVzYi5jIGZzbCxpbXg4bXAtdXNiLXBoeSkNCj4gPiA+ID4gYW5k
DQo+ID4gPiA+IERXQzMgaG9zdCBjb250cm9sbGVyIGNvcmUgKGRyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jIHNucHMsZHdjMykgd2l0aA0KPiA+ID4gPiBpbXg4bXAgZ2x1ZSAoZHJpdmVycy91c2IvZHdj
My9kd2MzLWlteDhtcC5jIGZzbCxpbXg4bXAtZHdjMykuDQo+ID4gPiA+DQo+ID4gPiA+IE9uZSBv
ZiB0aGUgMnggVVNCIDMuMCBob3N0cyBpcyBjb25uZWN0ZWQgdG8gYSBVU0IgVHlwZSBDIGNvbm5l
Y3Rvcg0KPiA+ID4gPiB1c2luZyBhDQo+ID4gPiA+IFRQUzI1ODIxIFVTQiBwb3dlciBzd2l0Y2gg
YW5kIGNvbmZpZyBjb250cm9sbGVyIHdoaWNoIGhhbmRsZXMgdGhlDQo+ID4gPiA+IENDIHBpbnMg
b24gYW5kIFZCVVMgZW5hYmxlIGFzIHdlbGwgYXMgZHJpdmVzIHRoZSBtdXggc2VsIHBpbiBvZiBh
DQo+ID4gPiA+IFVTQjMgbXV4IHRvIHJvdXRlIHRoZSBVU0IgU1MgcGFpcnMgdG8gdGhlIGFwcHJv
cHJpYXRlIGhhbGYgb2YgdGhlDQo+ID4gPiA+IFR5cGUgQyBjb25uZWN0b3IuIFRoaXMgZGV2aWNl
IGhhcyBubyBJMkMgb3Igb3RoZXIgbWFuYWdlbWVudCBidXMgLQ0KPiA+ID4gPiBvbmx5IFZCVVMs
IEZBVUxUIywgU0lOSyMsIGFuZCBQT0wjIG91dHB1dHMgYmFzZWQgb24gQ0MgcGlucy4NCj4gPiA+
ID4NCj4gPiA+ID4gSSdtIG5vdCBjbGVhciBob3cgdG8gZGVzY3JpYmUgdGhpcyBpbiB0aGUgZGV2
aWNlLXRyZWUgaW4gb3JkZXIgZm9yDQo+ID4gPiA+IGl0IHRvIGZ1bmN0aW9uIGFzIGEgZHVhbC1y
b2xlIGNvbnRyb2xsZXIgZm9yIGhvc3QgdnMgZGV2aWNlIG1vZGUuDQo+ID4gPiA+DQo+ID4gPiA+
IFRoZSBUUFMyNTgyMSBoYXMgYSBGQVVMVCMgc2lnbmFsIHRoYXQgcm91dGVzIHRvIElNWDhNUCBH
UElPMV9JTzEzDQo+ID4gPiA+IHBpbm11eGVkIGFzIE1YOE1QX0lPTVVYQ19HUElPMV9JTzEzX19V
U0IxX09UR19PQyBhbmQgYSBTSU5LIw0KPiA+ID4gPiBzaWduYWwgdGhhdCByb3V0ZXMgdG8gSU1Y
OE1QIEdQSU8xX0lPMTAgcGlubXV4ZWQgYXMNCj4gPiA+ID4gTVg4TVBfSU9NVVhDX0dQSU8xX0lP
MTBfX1VTQjFfT1RHX0lELiBBZGRpdGlvbmFsbHkgdGhlIFZCVVMgb3V0cHV0DQo+ID4gPiA+IG9m
IHRoZSBUUFMyNTgyMSBhbHNvIGNvbm5lY3RlZCB0byB0aGUgVHlwZUMgVkJVUyBwaW4gcm91dGVz
IHRvIHRoZQ0KPiA+ID4gPiBJTVg4TVAgVVNCMV9WQlVTIHBpbi4NCj4gPg0KPiA+IFNvIFRQUzI1
ODIxIGRvZXMgbm90IG5lZWQgYSBkcml2ZXIuDQo+ID4NCj4gPiA+ID4NCj4gPiA+ID4gSSd2ZSBu
b3RpY2VkIHRoZXJlIGFyZSBjdXJyZW50bHkgb25seSAyIG90aGVyIElNWDhNUCBib2FyZHMgaW4N
Cj4gPiA+ID4gTGludXggbWFpbmxpbmUgdGhhdCBzcGVjaWZ5IGRyX21vZGU9Im90ZyI7IHRoZSBE
SCBlbGVjdHJvbmljcw0KPiA+ID4gPiBpLk1YOE0gUGx1cyBESENPTSBTT00gKGlteDhtcC1kaGNv
bS1zb20uZHRzaSksIGFuZCB0aGUgVG9yYWRleA0KPiA+ID4gPiBpLk1YOE0gUGx1cyBWZXJkaW4g
U09NIChpbXg4bXAtdmVyZGluLmR0c2kpLiBJJ20gbm90IGNsZWFyIGhvdw0KPiA+ID4gPiB0aGVz
ZSBhcmUgaG9va2VkIHVwIG9yIGlmIFVTQiBkdWFsLXJvbGUgd29yayBvbiB0aGVzZSBjdXJyZW50
bHkuIEkNCj4gPiA+ID4gZGlkIG5vdGljZSB0aGF0DQo+ID4NCj4gPiBOWFAgaU1YOE1QIEVWSyBo
YXMgbm90IGVuYWJsZWQgdHlwZS1DIHBvcnQgZHVlIHRvIHRoZSBTUyBvcmllbnRhdGlvbg0KPiA+
IHN3aXRjaCBiaW5kaW5nIGlzIHN0aWxsIGluIGRpc2N1c3Npb24sIGJ1dCB5b3UgZG9uJ3QgbmVl
ZCBhIFNXIGNvbnRyb2wNCj4gPiBpbiB5b3VyIGNhc2Ugc28geW91IGFyZSBva2F5IGhlcmUuDQo+
ID4NCj4gPiA+ID4gaW14OG1wLXZlcmRpbi5kdHNpIGxvb2tzIGxpa2UgaXQgZG9lcyBub3QgZW5h
YmxlIHRoZSBwaHkgb3IgY29yZQ0KPiA+ID4gPiB2aWEgc3RhdHVzIHByb3AgYW5kIHVzZXMgaW52
YWxpZCAnb3Zlci1jdXJyZW50LWFjdGl2ZS1sb3cnIGFuZA0KPiA+ID4gJ2Rpc2FibGUtb3Zlci1j
dXJyZW50JyBkdCBwcm9wcy4NCj4gPiA+ID4NCj4gPiA+ID4gSSBhbSBjdXJyZW50bHkgdXNpbmcg
dGhlIGZvbGxvd2luZyB3aXRoIGlteDhtcC12ZW5pY2UtZ3c3NHh4Og0KPiA+ID4gPg0KPiA+ID4g
PiAvKiBVU0IxIC0gVHlwZSBDIGZyb250IHBhbmVsICovDQo+ID4gPiA+ICZ1c2IzX3BoeTAgew0K
PiA+ID4gPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiA+ID4gfTsNCj4gPiA+ID4NCj4g
PiA+ID4gLyogVVNCMSBkd2MzIGdsdWUgKi8NCj4gPiA+ID4gJnVzYjNfMCB7DQo+ID4gPiA+ICAg
ICAgICAgZnNsLG92ZXItY3VycmVudC1hY3RpdmUtbG93Ow0KPiA+ID4gPiAgICAgICAgIHN0YXR1
cyA9ICJva2F5IjsNCj4gPiA+ID4gfTsNCj4gPiA+ID4NCj4gPiA+ID4gLyogVVNCMSBkd2MzIGNv
cmUgKi8NCj4gPiA+ID4gJnVzYl9kd2MzXzAgew0KPiA+ID4gPiAgICAgICAgIHBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7DQo+ID4gPiA+ICAgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3Vz
YjE+Ow0KPiA+ID4gPiAgICAgICAgIGRyX21vZGUgPSAib3RnIjsNCj4gPiA+ID4gfTsNCj4gPiA+
ID4NCj4gPiA+ID4gJmlvbXV4YyB7DQo+ID4gPiA+ICAgICAgICAgcGluY3RybF91c2IxOiB1c2Ix
Z3JwIHsNCj4gPiA+ID4gICAgICAgICAgICAgICAgIGZzbCxwaW5zID0gPA0KPiA+ID4gPg0KPiA+
ID4gPiBNWDhNUF9JT01VWENfR1BJTzFfSU8xM19fVVNCMV9PVEdfT0MgICAgMHgxNDANCj4gPiA+
ID4NCj4gPiA+ID4gTVg4TVBfSU9NVVhDX0dQSU8xX0lPMTBfX1VTQjFfT1RHX0lEICAgIDB4MTQw
DQo+ID4gPiA+ICAgICAgICAgICAgICAgICA+Ow0KPiA+ID4gPiAgICAgICAgIH07DQo+ID4gPiA+
IH07DQo+ID4gPiA+DQo+ID4gPiA+IEFuZCBjdXJyZW50bHkgdjYuMC1yYzIgZW51bWVyYXRlcyB0
aGUgaG9zdCBjb250cm9sbGVyIGV2ZW4gd2l0aG91dA0KPiA+ID4gPiBhIFR5cGUtQyB0byBob3N0
IGNhYmxlIGF0dGFjaGVkIHdoaWNoIHRlbGxzIG1lIHRoYXQgT1RHX0lEIGlzbid0DQo+ID4gPiA+
IGRvaW5nIGl0cyBqb2IuIEkgdmFndWVseSByZWNhbGwgc29tZSBjb25mdXNpbmcgc3RhdGVtZW50
cyBvbiB0aGUNCj4gPiA+ID4gSU1YIGNvbW11bml0eSBmb3J1bSB0aGF0IHRoZXNlIHBpbnMgbWln
aHQgbm90IGV2ZW4gYmUgdXNlZCBvbiB0aGUgSU1YOE1QLg0KPiA+ID4gPg0KPiA+ID4gPiBIb3cg
c2hvdWxkIEkgYmUgZGVzY3JpYmluZyB0aGUgZGV2aWNlLXRyZWUgZm9yIHRoaXMgc2NlbmFyaW8g
aW4NCj4gPiA+ID4gb3JkZXIgdG8gZ2V0IGR1YWwtcm9sZSBiZWhhdmlvcj8NCj4gPg0KPiA+IENv
dWxkIHRoaXMgZHRzIHdvcmsgZm9yIHlvdT8NCj4gPg0KPiA+IC8qIENvbmZpZyB0aGUgIklEIiBw
aW4gaW9tdXggdG8gYmUgR1BJTyAqLw0KPiA+DQo+ID4gcGluY3RybF91c2IxOiB1c2IxZ3JwIHsN
Cj4gPiAgICAgICAgICAgICAgICAgIGZzbCxwaW5zID0gPA0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBNWDhNUF9JT01VWENfR1BJTzFfSU8xM19fVVNCMV9PVEdfT0MgICAgMHgxNDANCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgTVg4TVBfSU9NVVhDX0dQSU8xX0lPMTBfX0dQSU8xX0lPMTAg
ICAgMHgxNDANCj4gPiAgICAgICAgICAgPjsNCj4gPiAgfTsNCj4gPg0KPiA+ICBleHRjb25fdXNi
OiBleHRjb25faWRkaWcgew0KPiA+ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJsaW51
eCxleHRjb24tdXNiLWdwaW8iOw0KPiA+ICAgICAgICAgICAgICAgICAgaWQtZ3BpbyA9IDwmZ3Bp
bzEgMTAgR1BJT19BQ1RJVkVfSElHSD47ICB9Ow0KPiA+DQo+ID4gICZ1c2JfZHdjM18wIHsNCj4g
PiAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ICAgICAgICAgIHBpbmN0
cmwtMCA9IDwmcGluY3RybF91c2IxPjsNCj4gPiAgICAgICAgICAgICAgICAgIGV4dGNvbiA9IDwm
ZXh0Y29uX3VzYj4NCj4gPiAgICAgICAgICBkcl9tb2RlID0gIm90ZyI7DQo+ID4gIH07DQo+ID4N
Cj4gPiBMaSBKdW4NCj4gDQo+IEp1biwNCj4gDQo+IFRoYW5rIHlvdSwgdGhpcyBkb2VzIGFwcGVh
ciB0byB3b3JrIGFzIGludGVuZGVkIGFzIGR1YWwtcm9sZS4gSSB3YXMgbm90IGF3YXJlDQo+IG9m
IGxpbnV4LGV4dGNvbi11c2ItZ3Bpby4NCj4gDQo+IEFuZCB0aGFua3MgYWxzbyBBbGV4YW5kZXIs
IHlvdXIgdXNiLWR1YWwtcm9sZSB2aWEgY29ubmVjdG9yIG1ldGhvZCB3b3Jrcw0KPiBhcyB3ZWxs
Lg0KPiANCj4gV2hpY2ggbWV0aG9kIGlzIHByZWZlcnJlZCwgdXNpbmcgZXh0Y29uIG9yIHVzaW5n
IHVzYi1yb2xlLXN3aXRjaCB2aWEgYQ0KPiBjb25uZWN0b3IgYXMgaW4gQWxleGFuZGVyJ3MgcGF0
Y2g/DQoNCkxvb2tzIEFsZXhhbmRlcidzIHVzYiByb2xlIHN3aXRjaCBpcyBiZXR0ZXIgbm93LCBm
b3IgeW91IGFjdHVhbA0KdHlwZWMgY29ubmVjdG9yLCBJIGFtIG5vdCBzdXJlIGlmIGEgbmV3IA0K
Y29tcGF0aWJsZSA9ICJncGlvLXVzYi1jLWNvbm5lY3RvciINCnNob3VsZCBiZSBhZGRlZC4NCg0K
PiANCj4gQWRkaXRpb25hbGx5LCB3aGVyZSBpcyBpdCBhcHByb3ByaWF0ZSB0byBwdXQgdGhlIHBp
bmN0cmwgZm9yIHRoZSBPQyBhbmQgSUQNCj4gcGlucyBpbiB0aGUgdXNiX2R3YzNfMCAoZHdjMyBj
b3JlKSBub2RlLCB0aGUgdXNiM18wIChkd2MzIGdsdWUpIG5vZGUsIG9yDQo+IHRoZSB1c2IzX3Bo
eTAgKHBoeSkgbm9kZT8NCg0KdXNiX2R3YzNfMC4NCg0KTGkgSnVuDQoNCj4gDQo+IEJlc3QgUmVn
YXJkcywNCj4gDQo+IFRpbQ0K
