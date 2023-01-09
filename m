Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9A8661B8D
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 01:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjAIAf1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Jan 2023 19:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbjAIAf0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Jan 2023 19:35:26 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2044.outbound.protection.outlook.com [40.107.8.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7D81130
        for <linux-usb@vger.kernel.org>; Sun,  8 Jan 2023 16:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUpbc8KjJoif5WOb43W9+NaxS6jWY0Tp8nmqi7eLx8PXSfGICr3JajlBthVqt8Fwkrjd9wxM2XJsJh3sZKchseRT2VKqKvZcqh3Rc+RZSN11Bh1WlPrPiF+ELEMgfv8Wws3SYn3iVKkftpiKMRj2tNVt0tUuaGC4RVvV0uAJhFR9+4mTCRe/1OZ/Aja8sGBiGLgfq70vflKPPvg70GehzKFBBytrmGIPEMCjRUP3jQlEKWoeT0lDMsFSDgTPXlhECYNZXmrTqOJbuBk7Ynfx8DR9O+RbZ4qXpYiGVnuUc+TUzFylI3FQtN0Y4M/MpOhMeCMzy9784PFDk4ehDZMCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93eoO28vFfUmTe/O/jQcZGUzrlAbU0VYJkHNILEu7hs=;
 b=CqfYepV62SCdZ/tG5HaVHqjJyHkRLE4q14D8ESIT4NMyVTOMHSq1iIFGOfXzMeuEm1iVBX9Yj5DYVCA929sUKpE/DPPS+7sjmDk6H1zXQ4u605UJ8JXyqpPAZUt22pbwLm/xBk0UUWS3WmEgiRUf6u9XEvyFBgi1CWsDaOR7vMuL8JmhQwq3IkxU+4vILD6V9MGB1wcSUYF/r7DLQwq77DgMnY+zu/hhk0HTAa/xzQwqgWdlC4qeyjmNw54gOt/E74RCSsD/q+Bba9FcPhXH/3nw1tk5lrle/6c9jrlVitmFhd6TxAR2jrp6jLLNF5FSpKDNpi8evSOmroj4qu9Y/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93eoO28vFfUmTe/O/jQcZGUzrlAbU0VYJkHNILEu7hs=;
 b=hxGVSx0TEzxDaMuwJEUqIO02MOeGJavDNpwsqBmAgh9oWFWcUMplM5EqYw1++96NkszjkIFnsnF0lUTUL/UrH/JtHRaamVT9IKfukgw7eVzENTz+rAa9hwbGEb4nS8inxZpbjy2ohtksFcx6ZjcsjHOZYZRpGye2lmT4np5+Rrw=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 00:35:21 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 00:35:20 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Thread-Index: AQHZEP7hbKNmhhpCvEyFs9PZaT80zK5v+DIAgAAKJQCAJV9aMA==
Date:   Mon, 9 Jan 2023 00:35:20 +0000
Message-ID: <DB7PR04MB4505A0A29918EC71FDF5C8BC8CFE9@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20221216033150.2683718-1-xu.yang_2@nxp.com>
 <acf0485c-8061-ef12-83d9-c3b22dc235ad@roeck-us.net>
 <PA4PR04MB959190B619279B290630D8018CE69@PA4PR04MB9591.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB959190B619279B290630D8018CE69@PA4PR04MB9591.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AM8PR04MB7298:EE_
x-ms-office365-filtering-correlation-id: edb0a649-d3f0-4357-dcf9-08daf1d963b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pBdabw+WlR5GF2+Wn15AVB9g+B9WJdxTDjxtCbM1AN5IjRcG3WEXqW1CdlF2TKBInmLreX2ZFcQrODXJB5A0csKOU01A8Ui5lvruHRJqMJOuRnGCstts6c+v5KiV4Lzh0JajiWErtUSh0rrz3tUMmf6/gDVsFogk81RSAFk66ngXGI1BxlseYO3fizsPJ+lfiyS1byWUDiiJjczEwGyhGMDUcIH6wEmoKL7GsrIFgkw+FykQkyZJaEfK7bzvbiq7Gc1Uqsu8fI2c/7T+aTxcxc+aoaSAfYqt0UlOoTDC/vf7cp/xwZxE7aWm7pTswT8Isrlf4X6/ol1d0DvyBYnQaQRtYFygDmjp72PrF9+nKpk31cK5clk3m+WIGUCLu62oN1dG8yl70/o7fNqmxS/TQYR/KbhRJ8umvbwrjZduJLi8NZx/iOGXFihkYGZMuv7gaFCP4mFTUqvH8KhOCz3iYwhRBtgj0VPfHaaaqgjbkzwEdcoNAKpFOfo0eEg9b3WppunfQiRS6S/tYXQrEFD0BePMCanq3YsS3Xl66+g0sXzyKW2Sh/TQaiQc9p+jWOzFzCIhghiXZAsRMap0X3CiE3wwp52AtlNdZo1Phlh2+7s5Pqcu+CgZ5qLDatEKz4NRp8Rbk2Cv+uVlxYYVT/bI9VKWumTTrdF85BfkHrCuBcFglbyx6DtTZoecQJB3nSGfd1WpAirUKgoU+MCWSBe8YA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199015)(8936002)(5660300002)(2906002)(52536014)(41300700001)(7696005)(66446008)(316002)(76116006)(4326008)(66556008)(66946007)(66476007)(8676002)(64756008)(38070700005)(71200400001)(110136005)(54906003)(186003)(9686003)(38100700002)(26005)(122000001)(55016003)(83380400001)(86362001)(478600001)(33656002)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1l5cjdzMWlJcGhOdStvNmtHTlNRWFNXTUN5dy85N2NtaFk4dkQ4MVk5WDJU?=
 =?utf-8?B?V0xhTk9tRnpoNmZJdjRvQ2NXWGVydGtlbXpyU0xrYnpXZzd6dVlyaG5IYSs5?=
 =?utf-8?B?WHpDd3ZZRFIrL1NhTnpJcGMzNDJsTDFWbnczdlE2c3VXRWFiOEVGL0RNMTFR?=
 =?utf-8?B?dzhER2xRS2RHVzFXRDY4UHdGUi85a1lzU0pHRC94UUpvek9PUjVSSjZsbW1P?=
 =?utf-8?B?SkNPbGZ0a2h6TEsybnFSWHRiaFR3a2F0Y3lUTXRRTWk3UzVaQ01udVZ4Zkcy?=
 =?utf-8?B?c2RUb0dPejZTU0JXNVJYOTBlWHpjbUpVdEdSM2MvWituMXBDSWJnaGpEb1Ro?=
 =?utf-8?B?SzR5TktRZkVXZ3orc3RXRENtcnJhdDdzUFBMYUNQa0VvRmcrTlZmUUZOQWI3?=
 =?utf-8?B?WUJRMkFGS3g0dTJRc1NseHdBZm1uL2RjRWlvcGVyVytJREgzRWlqYUpRekdi?=
 =?utf-8?B?SFNKRXAvZ01CcndEVWVuMUIvU0NKQ1lNQUpSWjhlc2FabSt2MUVoUW1EenlE?=
 =?utf-8?B?Z3JrZU9EVzFRZE50RTkvdGZnV3NSQ0k4dWtMdFBpa0NhZGpCQ2FtdXhZRGJD?=
 =?utf-8?B?NjJqRUlzZXJJSDJWbEVYdStRczVjcHFleENVTWZtZ3lNUEF5ZTk3S2ZySEUx?=
 =?utf-8?B?TFc3VTFOS1lpaU52VHozS2grdDFxbU90cERsQ0ZuTytLUE5jVTN6WTdlekNU?=
 =?utf-8?B?YWYwcDJ6WDk5ZFVDQXhHZy9PME9zTklodXRNZ1JVcVJzbml2L2NxQzlRYUdI?=
 =?utf-8?B?b2tMSEJKM2o3VWRDbDdjZE9LZFUwb2ZadHI2WEhqcjRZVHE0QjdVNFhTS3ly?=
 =?utf-8?B?c0x1QlNJQlNkUlhHZkkvVDQ2bzhZaGhBaisrYzVnWDhtMXdqTGVHUVg1RUVR?=
 =?utf-8?B?ek9POTBhNTVlUnlwWFBIUi9LSEloVnlJSzgrQ1Fzd2x5WVRGWE9Xa2xTaXJR?=
 =?utf-8?B?eTFvc1k4SVg0bFRwN05PQ3pkS2VmWXNBNjcrcllyOTBSbFVNc04rRG9PSWc5?=
 =?utf-8?B?ciszWmFoV3NGUTBhSFpXaUJNbFpLTFpmMTRodm01VDV0L043anBpRVVJeTlh?=
 =?utf-8?B?ZVJUZWxieU1SakxrMENIRnVWenZZTGxLMVZrb1lYTnNSQmNGS2huRTdKb0ZM?=
 =?utf-8?B?ODVzV25xeDVYQlE0RkFtOHE0bGVvbDVoSVJEOE0ycmxpM1JVYWZ2aXNkc0t4?=
 =?utf-8?B?eFZvT1B2QSt5Q3ZCVDVXakNwVWcvdmZVSjliMjk5MmRTWlNsdms2bDhTUTVO?=
 =?utf-8?B?MmxZZ3ROc0JIZFdERVc4eHlrOXBPZm5IQlU1R2dqbjBva21LRWJMTkozcDBS?=
 =?utf-8?B?ZWd2QlRQaGtMdWdIckJvVDBHQmV4eStCUHJGNFh0T0FPbnRmd3VTU3haMngw?=
 =?utf-8?B?WWEwWWVmLzFiaW5DRHA4UDliRCs5d0s5NW5XcmpUVTN5TzB1aVh5SkVLU3VL?=
 =?utf-8?B?VkVub2ZQak5YUEpZT3B6ZE1EOXRFYlh2S2VCWnYrN0RWbFhleHE1Q0hKdVAv?=
 =?utf-8?B?bW5VT2ZmWnpqQlVEVEtHV29OdzBTdEg0WHNXQ0FEZlVHWEJ4cDd5VHFqSXhH?=
 =?utf-8?B?N0NudjRPQ1ZQcDZCb1UzeVp3ZkltRkVrTzVpZDhLdFlySTBROVFyY1R0M2ZY?=
 =?utf-8?B?aHFidXltUGlwLzJ2TFhnR2JtR216S0srUVE0N0ZiVjZaMk96MkVuL3l1d0NK?=
 =?utf-8?B?T2lsWG1ZZmkxdGxHdzQ3dVJJOHZWL01kb1NpYWhLM2dHMkwvNkZHdE5zMEFh?=
 =?utf-8?B?QlN0U1R1WTM5OVUvSTBTWHlOTGd3cmliQjBsTU5vUktKQ28xQzVRRDFZcTE4?=
 =?utf-8?B?ZmRzdUlIYytSSVJlV2JBUFRNL0F3emJsd1FNWHh1ekpZOWZiR2U1SUdYTTNG?=
 =?utf-8?B?SXN6dHpNbXpDWjZLVWFCeVRETUlicjk1Z0p2Z1FqQTJuTUFzZjdUYmZ5bzdS?=
 =?utf-8?B?UVRWT3QvN2xCRTV4NHJpSXFvZFp0VTZrNzBBTENqSVB5VjBBcnFqbGIyL0s1?=
 =?utf-8?B?TmlWY1k4dXFrL2RldkVhQTNZU0s5M1N6bG5WbzRybE90ZWpnTmRyUzNZdGQw?=
 =?utf-8?B?dzNvUnA4YzN3d0paM2FyOUxiMHVVZ09kcGpJQklkOXZZSng2TkdiMTRORE4x?=
 =?utf-8?Q?hdY0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb0a649-d3f0-4357-dcf9-08daf1d963b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 00:35:20.8650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8sfLIaQKSxZFLRHtvKU5XIC4v2KPDw1tjhjHUwFc4Jxrd05GHCVaq44g1PisRCyow7NNcFheU12LwFhMKa3sZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWHUgWWFuZw0KPiBT
ZW50OiBGcmlkYXksIERlY2VtYmVyIDE2LCAyMDIyIDI6NDEgUE0NCj4gVG86IEd1ZW50ZXIgUm9l
Y2sgPGxpbnV4QHJvZWNrLXVzLm5ldD47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20N
Cj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBsaW51eC11c2JAdmdlci5rZXJuZWwu
b3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgSnVuIExpIDxqdW4ubGlAbnhw
LmNvbT4NCj4gU3ViamVjdDogUkU6IFtFWFRdIFJlOiBbUEFUQ0hdIHVzYjogdHlwZWM6IHRjcG06
IGZpeCBjcmVhdGUgZHVwbGljYXRlIHNvdXJjZS9zaW5rLWNhcGFiaWxpdGllcyBmaWxlDQo+IA0K
PiBIaSBHdWVudGVyLA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZy
b206IEd1ZW50ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgR3VlbnRl
ciBSb2Vjaw0KPiA+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMTYsIDIwMjIgMToxMyBQTQ0KPiA+
IFRvOiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5p
bnRlbC5jb20NCj4gPiBDYzogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGxpbnV4LXVzYkB2
Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBKdW4gTGkg
PGp1bi5saUBueHAuY29tPg0KPiA+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0hdIHVzYjogdHlw
ZWM6IHRjcG06IGZpeCBjcmVhdGUgZHVwbGljYXRlIHNvdXJjZS9zaW5rLWNhcGFiaWxpdGllcyBm
aWxlDQo+ID4NCj4gPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gPg0KPiA+IE9uIDEyLzE1LzIyIDE5
OjMxLCBYdSBZYW5nIHdyb3RlOg0KPiA+ID4gQWZ0ZXIgc29mdCByZXNldCBoYXMgY29tcGxldGVk
LCBhbiBFeHBsaWNpdCBDb250cmFjdCBuZWdvdGlhdGlvbiBvY2N1cnMuDQo+ID4gPiBUaGUgc2lu
ayBkZXZpY2Ugd2lsbCByZWNlaXZlIHNvdXJjZSBjYXBhYmlsaXR5cyBhZ2Fpbi4gVGhpcyB3aWxs
IGNhdXNlDQo+ID4gPiBhIGR1cGxpY2F0ZSBzb3VyY2UtY2FwYWJpbGl0aWVzIGZpbGUgYmUgY3Jl
YXRlZC4NCj4gPiA+DQo+ID4gPiBBbmQgdGhlIGtlcm5lbCB3aWxsIGR1bXA6DQo+ID4gPiBzeXNm
czogY2Fubm90IGNyZWF0ZSBkdXBsaWNhdGUgZmlsZW5hbWUgJy9kZXZpY2VzL3ZpcnR1YWwvdXNi
X3Bvd2VyX2RlbGl2ZXJ5L3BkMS9zb3VyY2UtY2FwYWJpbGl0aWVzJw0KPiA+ID4NCj4gPiA+IFRo
aXMgd2lsbCB1bnJlZ2lzdGVyIGV4aXN0aW5nIGNhcGFiaWxpdGllcyBiZWZvcmUgcmVnaXN0ZXIg
bmV3IG9uZS4NCj4gPiA+DQo+ID4gPiBGaXhlczogODIwM2QyNjkwNWVlICgidXNiOiB0eXBlYzog
dGNwbTogUmVnaXN0ZXIgVVNCIFBvd2VyIERlbGl2ZXJ5IENhcGFiaWxpdGllcyIpDQo+ID4gPiBj
YzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBZYW5n
IDx4dS55YW5nXzJAbnhwLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gICBkcml2ZXJzL3VzYi90eXBl
Yy90Y3BtL3RjcG0uYyB8IDYgKysrKysrDQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvdHlwZWMvdGNw
bS90Y3BtLmMgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYw0KPiA+ID4gaW5kZXggOTA0
YzdiNGNlMmYwLi4wMmQ4YTcwNGRiOTUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi90
eXBlYy90Y3BtL3RjcG0uYw0KPiA+ID4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3Bt
LmMNCj4gPiA+IEBAIC0yMzcxLDYgKzIzNzEsOSBAQCBzdGF0aWMgaW50IHRjcG1fcmVnaXN0ZXJf
c291cmNlX2NhcHMoc3RydWN0IHRjcG1fcG9ydCAqcG9ydCkNCj4gPiA+ICAgICAgIGlmIChJU19F
UlIocG9ydC0+cGFydG5lcl9wZCkpDQo+ID4gPiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJS
KHBvcnQtPnBhcnRuZXJfcGQpOw0KPiA+ID4NCj4gPiA+ICsgICAgIC8qIHJlbW92ZSBleGlzdGlu
ZyBjYXBhYmlsaXRpZXMgc2luY2UgZ290IG5ldyBvbmUgKi8NCj4gPiA+ICsgICAgIHVzYl9wb3dl
cl9kZWxpdmVyeV91bnJlZ2lzdGVyX2NhcGFiaWxpdGllcyhwb3J0LT5wYXJ0bmVyX3NvdXJjZV9j
YXBzKTsNCj4gPiA+ICsNCj4gPiA+ICAgICAgIG1lbWNweShjYXBzLnBkbywgcG9ydC0+c291cmNl
X2NhcHMsIHNpemVvZih1MzIpICogcG9ydC0+bnJfc291cmNlX2NhcHMpOw0KPiA+ID4gICAgICAg
Y2Fwcy5yb2xlID0gVFlQRUNfU09VUkNFOw0KPiA+ID4NCj4gPiA+IEBAIC0yMzk0LDYgKzIzOTcs
OSBAQCBzdGF0aWMgaW50IHRjcG1fcmVnaXN0ZXJfc2lua19jYXBzKHN0cnVjdCB0Y3BtX3BvcnQg
KnBvcnQpDQo+ID4gPiAgICAgICBpZiAoSVNfRVJSKHBvcnQtPnBhcnRuZXJfcGQpKQ0KPiA+ID4g
ICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihwb3J0LT5wYXJ0bmVyX3BkKTsNCj4gPiA+DQo+
ID4gPiArICAgICAvKiByZW1vdmUgZXhpc3RpbmcgY2FwYWJpbGl0aWVzIHNpbmNlIGdvdCBuZXcg
b25lICovDQo+ID4gPiArICAgICB1c2JfcG93ZXJfZGVsaXZlcnlfdW5yZWdpc3Rlcl9jYXBhYmls
aXRpZXMocG9ydC0+cGFydG5lcl9zaW5rX2NhcHMpOw0KPiA+ID4gKw0KPiA+ID4gICAgICAgbWVt
Y3B5KGNhcHMucGRvLCBwb3J0LT5zaW5rX2NhcHMsIHNpemVvZih1MzIpICogcG9ydC0+bnJfc2lu
a19jYXBzKTsNCj4gPiA+ICAgICAgIGNhcHMucm9sZSA9IFRZUEVDX1NJTks7DQo+ID4gPg0KPiA+
DQo+ID4gU2hvdWxkbid0IHVzYl9wb3dlcl9kZWxpdmVyeV91bnJlZ2lzdGVyX2NhcGFiaWxpdGll
cygpIGJlIGNhbGxlZCBmcm9tDQo+ID4gdGhlIFNPRlRfUkVTRVQgc3RhdGUgaGFuZGxlciA/DQo+
IA0KPiBBbHRob3VnaCB0aGlzIGlzc3VlIGlzIHRyaWdnZXJlZCBieSBzb2Z0IHJlc2V0IGV2ZW50
LCB0aGVyZSBpcyBhbHNvDQo+IG90aGVyIHBvc3NpYmlsaXRpZXMgd2hpY2ggbWF5IHByb2R1Y2Ug
dGhpcyBiZWhhdmlvci4gU3VjaCBhcyByZWNlaXZlZA0KPiAycmQgc291cmNlIGNhcGFiaWxpdHkg
b3IgdXNlIEdldF9Tb3VyY2VfQ2FwIG1lc3NhZ2UuIEl0J3MgYSBkeW5hbWljDQo+IHByb2Nlc3Mg
ZXZlbiBhZnRlciBzb3VyY2Uvc2luayBpcyByZWFkeS4gU28gSSB0aGluayBpdCdzIGJldHRlciB0
byBoYW5kbGUNCj4gaXQgaW4gdGNwbV9yZWdpc3Rlcl9zb3VyY2Uvc2lua19jYXBzKCkuIE5vdCBz
dXJlIGlmIHRoaXMgaXMgcmVhc29uYWJsZS4NCj4gDQo+IFRoYW5rcywNCj4gWHUgWWFuZw0KDQpE
byB5b3UgaGF2ZSBhbnkgb3RoZXIgY29tbWVudHMgb3Igc3VnZ2VzdGlvbnMgd2l0aCB0aGlzIHBh
dGNoPw0KDQpUaGFua3MsDQpYdSBZYW5nDQoNCj4gDQo+ID4NCj4gPiBHdWVudGVyDQoNCg==
