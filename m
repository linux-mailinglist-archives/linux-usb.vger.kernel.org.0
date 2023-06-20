Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1FC73620E
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 05:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjFTDLZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jun 2023 23:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbjFTDLI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jun 2023 23:11:08 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2073.outbound.protection.outlook.com [40.107.14.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4FA1716
        for <linux-usb@vger.kernel.org>; Mon, 19 Jun 2023 20:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBk9SIXOvB8A/jFOltpMTbYxrTlvFflZO7XYcOZIuuBvAwjhfLAsVKmo4g+RnTAE0etlKprkfwLiQBcx1/lDstCKn5kZ3jYOAxGFufyO8wn2uveqBBCGcAuY0z6Yob2cWr/sbJORsAa+DD1AhvTKNKbage11OrFWPywGhzNSycW+h8OheHVMRgcmua3l7ZKTZtwOJOm4zjhFNBnxb5TrzUZ5MMX8tWYBIhABUSb3zCWVeuTMaL1iykCW2DVXq2HAT4r99vWAHXm7v3LQNqUmHy8VBsMRVE00qk21RzAmhceK0BlOQJVeb/809MU2QqsdMlFadmsjakf3WvK9DN89xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ar8GzCgIYdAkArIGf0Kg+Bvywzeu+iKhamcayiPRL5s=;
 b=P6b637MMQs5mgeFNc6fNOuFYWR+XaS7R2613Fh6zACCA8tzPDZHmyqjXUmgdzxjhF4f5eJVgtkkkP+gx+KFEL/SHBJ2bhTxkeXzVqRVexemZ2KFddn/d9ylTCm8zXvDlFa7OK2/84sA5iLEFORHiyObhyxGnWRFSjieMpLe4Xvi+qMu6YvVhDh3xc31sbplco6cKeB2jz44JaEXaN67M2VpC0h27PjTsq1dFxi/l7X7B3kzQjLjOh/m/DINzImz32kUeryGkFI7sqlbBwSxfp5Le1naNkAfjDLlRLDi4taeaXhJHoxP1F7TRof8sxGOSukvwMPbvHLb7SBEXnP2BqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ar8GzCgIYdAkArIGf0Kg+Bvywzeu+iKhamcayiPRL5s=;
 b=ZuRSgqAtjIMylM8pY4sXrsydUvvy4suWecdTPQzzbKsC5jSpvgfZsHIWd39HNTrT2MorSHac27xkBVgwbIeZs1u3EqtoexaCHZM1xxpaQnCRsazAgzMF4uVZBYqEZBA5my/cyqIq1sgSxADGVx2oOMaq+dRG5x1FECCAg0JqssQ=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VI1PR04MB9860.eurprd04.prod.outlook.com (2603:10a6:800:1d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:10:46 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 03:10:46 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Faqiang Zhu <faqiang.zhu@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for
 non-drp port
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for
 non-drp port
Thread-Index: AQHZmfv2XcNX5Iuf6UWaOH7ssz4VQq+A5P+AgADPfnCAEVdJIA==
Date:   Tue, 20 Jun 2023 03:10:46 +0000
Message-ID: <DB7PR04MB45059A20E2474FDCED4C89128C5CA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230608112858.4405-1-xu.yang_2@nxp.com>
 <0330ffea-d258-8fb8-ff89-5ebb0388f1ff@roeck-us.net>
 <DB7PR04MB450545D417BC401B92335F7C8C51A@DB7PR04MB4505.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB450545D417BC401B92335F7C8C51A@DB7PR04MB4505.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|VI1PR04MB9860:EE_
x-ms-office365-filtering-correlation-id: c91c52eb-ab79-4c13-d1e4-08db713bf11d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KmS0UnAp5KOCADErVLqMqNBltpyeVJzv7f71L6hyYtWJNAQBcbEz9YiR9tc0HDL8h+WL/ClM/5ALaI/KiD+/DbF6vVhTToIDa4wzpdZ24w1OKt8eRsYzRUVslJAZ44BBXAUOQ7Pp607JtKGpA4YjVZp2QzyjByUiyF3EgFnQntYVadF4WzVTy1aCzCmdbuvoA+/K28x67rRU7tyA9zzAf6WQTRJIgzExbisWAYUwFbAGfXjwZLX0fgSsjhWZY6m1uU1QVALDmMEo+H1sqYpUX2x6pBBx7WhITaoM9LjaeH9+tBVnHSp0B5hq0dGjeBQA7+pzKyZIss6aim/Th+6PdK3TmobIPoAkiyNy12x90qEdR9D9EHexHJjRju37+5Pb73N1SL7AgONmD2MLGvuYWUSnamRnQxu/8L9sWsJlufD/bbKNKufhRezQ/btpuSyDmVwK1YO4zdV49HzMlzDPzZXg92rX88ddB+rJzuVALylkDiba7q8P6EyiNTQ/vh0L4hIPwpb/cVu3OPvYBucm7Iee9N2MybWdxcC/uAEVSUqdF3aiO7DJsLuJcx5CbM2o5Bdkyl5GUNX00U97GF2iA8K+axIs8MV5hRTwY5/V9IIAZawnp1ekjT67QT0negj4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(478600001)(7696005)(71200400001)(110136005)(54906003)(83380400001)(53546011)(6506007)(26005)(186003)(9686003)(2906002)(52536014)(5660300002)(33656002)(38100700002)(122000001)(4326008)(76116006)(66946007)(55016003)(316002)(86362001)(8936002)(8676002)(41300700001)(66476007)(66556008)(64756008)(66446008)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTBxYjNaMjRQVlZ6aE13NnlIWWwrdzVhMHpKY3VVMG16MFNLcGswSGRzbFhO?=
 =?utf-8?B?YUg5dGdIMUhjN0FPdzhiUk1xUG16dDd3dXZlOTVNMWJ4UmJGTHAvdEZPY28w?=
 =?utf-8?B?MzN5VDk0WlhxSDhWVXBpRS96UURJMXFNSER0TllxcE5tM3pnNkJ4QW5TU2pW?=
 =?utf-8?B?ZUU5T0VvTHVWRDVKdFFiVC80a1A3K2MvcXhQRm90NUQ2QWhlRVdtRXYvZnlW?=
 =?utf-8?B?Yzh1SFVLcVEwbCtuUTVoTVBJZ2I4M2lkaVBsTUZxU2M1ajBEVDFVNkdrL3M3?=
 =?utf-8?B?bUlrM3NjNC9RSVNBVUQ4NUJ6TlBsL1ZXNndTeDJwZzZIUGMrbGlHT2F6TGE4?=
 =?utf-8?B?Y3I1QzdwV2pTK0MzZ3dLcDI1SDVPSFFudXpNTXNuYkI2UDB6N0gySm55amx1?=
 =?utf-8?B?RzJieEE4ekVyZ3pQTWJNMlRaSzN0bjVybVV0L01DUUNXYm9wMVJZdVlMekFX?=
 =?utf-8?B?WEhWTExucjUwd2dJZUJSMzIwQ2Uxbld6cVlXU05nWWlTb0t5ckt2L0hVRzM5?=
 =?utf-8?B?NjVPOXM0NEtxdW5pR3Q2eWhRcnJIR001UFo2RnQ4Vk8zU1Ywb3cyYUU5N2Nz?=
 =?utf-8?B?VWtMb09NWWg2UFMvUmNnUmMzeE1vSkN4b3kyM0ZXZFI4UTZmTHRESkIvQVpk?=
 =?utf-8?B?TlZjUUZMLzNoSHhCam9URVllbkNYMDBud1JJa01BeitINkJEazZRbysxbzRP?=
 =?utf-8?B?Njl2Z1NaY0F2VXFFNzVrd0R6aTd4TU85M1I5SHhwZ281ZzFOQ3NSQlA4T1l0?=
 =?utf-8?B?MFdCTmhQYXY0MTRwTDF3WVJnclBWNDF4bzYzT1FHRFY2L3ZyUWN0Vk1NVjVB?=
 =?utf-8?B?aFhUejBFSGpCVXZvQVFyOUdpY253UWNOOXhXUHFCN21oMzJCdktQL3IrOElQ?=
 =?utf-8?B?MnAwUU9OZTlPVFo0dFJGV0RTL2RIVkEzTXFXanBvYmRQR2VmcVV1L0JscXVk?=
 =?utf-8?B?UUVQZ2h2MHNGRHk3THBYYU1ZaDZqVnlDYnBWZFR2OXIzSzc3MDc1WmhhKzBK?=
 =?utf-8?B?dEl3YVpxb0Zrc0IzQS9GL1J5V2hEUS9KTkRTdGNWTVcyUXdvUUlCMlg1SFI0?=
 =?utf-8?B?NWY5QmlOME9ob056TlBOcWE5MnZjQmM4YVp3T2Z6aXhSM2FOSENwSDMvaTZP?=
 =?utf-8?B?YTlkait1WHErOVdoWHRQNHBPZ1U4WlJHVFZDblZ5V2E0T1lham9FeWxlY0Vk?=
 =?utf-8?B?cEladkU5TTA0bTNLb3hqaUFQNGJmdHZEUHNpb2JWRVpnKzZwekFhLy95NE52?=
 =?utf-8?B?ejdURXFiMEhTVHhhdURERFlpMjJGUlVHQmRMWllTdHVFRTBVNGs3TysxY0FY?=
 =?utf-8?B?eU5aRmtvSi93MVJEWDNMNFBUYkFYaVVuUDBpTTN5UkRWMHVFOUJZaEdMRGhI?=
 =?utf-8?B?d3VCU3NQNVRVRE1NTWtVR2lLclZwRWVaemxxb09aVkYzdU1rWWoxTVJJbExT?=
 =?utf-8?B?eEJjQWV1SGYxUGhnOThEdmJWOGJXeTdWcXZJTEl6dkxNb1hZS2NEK1dMSDM5?=
 =?utf-8?B?anBEWEU5T3p1SndFMHFwSGUyQ0hDNlF4S1dLOUFlNXFsVkRNS3RDdHhxaExh?=
 =?utf-8?B?eEY3ckdsMGFKSFFwTmE5TlV3TW5nN05idmZ0T3hpRlptVmlvZW80S3lSbjhD?=
 =?utf-8?B?aWV2bjJJVXhXdUlPTmt4R3AwVnl6bFl5MHU1ejJtNzRjc0hXY1BjeDR0R0Jt?=
 =?utf-8?B?Rk9FeVU4Q1BhbmNXdzI4dFdoLzRhS3hCNW1pZFAwSjY2SXJXSDFHaUVuZ0pw?=
 =?utf-8?B?RGcwVnVBU2FlY1N2OUEzZExXdEs4YW9Qb25BemdycWhOZFJOcHBmMk5UdVpm?=
 =?utf-8?B?Q3RPdFd5THpuSnBTb1BZNDBPM3k3MmlOQW1vRWdXZ1dFQWhEbmNGN3o3SzEz?=
 =?utf-8?B?NFNzZmpkVG9IU21KNFloNVM2SXlNL0E3NXFTd3FwWUhRRHkxQmRNamJjbW92?=
 =?utf-8?B?cCtLRFR6SWRpUzNzUlFGb1ZGOFJIRVpHdzBhVU1uNXRNWDYrekt1b0tmajBK?=
 =?utf-8?B?bGllWWZQOEZ2amlWNjJvWHJTL0FVSXZkcjhVV2JNcWtOMzhrazRtQ05vS0N4?=
 =?utf-8?B?T1JNd090Zy9PN3ppWEhGalk0aGFqbkJJTE5tRFE0TFpaUUhmS3RPL01nY1E4?=
 =?utf-8?Q?DZlc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91c52eb-ab79-4c13-d1e4-08db713bf11d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 03:10:46.4762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ips12bW0ovLXsDUNLgBziEOOKMh6xBviYHFneAT+7h6FJOqJk9UKp1f8zM3vy3JOHRaT+kA/g67wrigwhEJeiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9860
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

KysgSGFucyBkZSBHb2VkZQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFh1IFlhbmcNCj4gU2VudDogRnJpZGF5LCBKdW5lIDksIDIwMjMgMTA6MTUgQU0NCj4gVG86IEd1
ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5p
bnRlbC5jb20NCj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBkbC1saW51eC1pbXgg
PGxpbnV4LWlteEBueHAuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgSnVuIExpIDxq
dW4ubGlAbnhwLmNvbT47DQo+IFpoaXBlbmcgV2FuZyA8emhpcGVuZy53YW5nXzFAbnhwLmNvbT47
IEZhcWlhbmcgWmh1IDxmYXFpYW5nLnpodUBueHAuY29tPg0KPiBTdWJqZWN0OiBSRTogW0VYVF0g
UmU6IFtQQVRDSF0gdXNiOiB0eXBlYzogdGNwY2k6IGFsbG93IGRycCB0b2dnbGluZyBmb3Igbm9u
LWRycCBwb3J0DQo+IA0KPiBIaSBHdWVudGVyLA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+IEZyb206IEd1ZW50ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBPbiBC
ZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiA+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDgsIDIwMjMg
OToyNCBQTQ0KPiA+IFRvOiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT47IGhlaWtraS5rcm9n
ZXJ1c0BsaW51eC5pbnRlbC5jb20NCj4gPiBDYzogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7
IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBsaW51eC11c2JAdmdlci5rZXJuZWwu
b3JnOyBKdW4gTGkNCj4gPGp1bi5saUBueHAuY29tPjsNCj4gPiBaaGlwZW5nIFdhbmcgPHpoaXBl
bmcud2FuZ18xQG54cC5jb20+OyBGYXFpYW5nIFpodSA8ZmFxaWFuZy56aHVAbnhwLmNvbT4NCj4g
PiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIXSB1c2I6IHR5cGVjOiB0Y3BjaTogYWxsb3cgZHJw
IHRvZ2dsaW5nIGZvciBub24tZHJwIHBvcnQNCj4gPg0KPiA+IENhdXRpb246IFRoaXMgaXMgYW4g
ZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvciBv
cGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlDQo+ID4gbWVzc2Fn
ZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzIGVtYWlsJyBidXR0b24NCj4gPg0KPiA+DQo+ID4gT24g
Ni84LzIzIDA0OjI4LCBYdSBZYW5nIHdyb3RlOg0KPiA+ID4gU29tZSBzaW5nbGUgcG93ZXIgcm9s
ZSBUeXBlLUMgcG9ydCB3aXRoIGR1YWwgZGF0YSByb2xlLCB0aGlzIGtpbmQgb2YNCj4gPiA+IHBv
cnQgY29ubmVjdHMgbm9uIFR5cGUtQyBwb3J0IGZvciB1c2IgZGF0YSB3aWxsIG5lZWQgdGNwbSB0
byB3b3JrIHRvDQo+ID4gPiBnZXQgcG9sYXJpdHkgZm9yIG9yaWVudGF0aW9uIGNoYW5nZSBhbmQg
bGV0IFR5cGUtQyBwb3J0IGtlZXAgYXQgZmFrZQ0KPiA+ID4gcG93ZXIgcm9sZSB0byBwcm92aWRl
IGFub3RoZXIgbm9uLWRlZmF1bHQgZGF0YSByb2xlLCBzbyByZW1vdmUgdGhlIGRycA0KPiA+ID4g
cG9ydCBjb25kaXRpb24gZm9yIG5vdy4NCj4gPiA+DQo+ID4gPiBIYXMgYW55b25lIGVuY291bnRl
cmVkIHRoaXMgdXNlIGNhc2U/IEhvdyBkbyB5b3UgaGFuZGxlIHRoaXMgbGltaXRhdGlvbg0KPiA+
ID4gaW4gY3VycmVudCB0Y3BtIHdpdGggYSBiZXR0ZXIgd2F5PyBQbGVhc2Uga2luZGx5IHNoYXJl
IHlvdXIgdGhvdWdodHMuDQo+ID4gPg0KPiA+DQo+ID4gSGF2ZSB5b3UgPyBUaGlzIGlzIGFuIG9k
ZCBjb21tZW50IHRvIG1ha2UgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uLg0KPiANCj4gU29ycnkg
Zm9yIHRoaXMuIEl0J3Mgbm90IGEgZm9ybWFsIHBhdGNoLg0KPiANCj4gPg0KPiA+IEVpdGhlciBj
YXNlLCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IG9uZSB3b3VsZCBuZWVkIHRvIGVuYWJsZSB0b2dn
bGluZw0KPiA+IHVuZGVyIGFueSBjaXJjdW1zdGFuY2VzIGlmIHRoZSBwb3J0IGlzIG5vdCBEUlAu
IFRoZSBkZXNjcmlwdGlvbiBkb2VzDQo+ID4gbm90IGV4cGxhaW4gaG93ICJuZWVkIHRjcG0gdG8g
d29yayIgY29ycmVsYXRlcyB0byBlbmFibGluZyB0b2dnbGluZyBvbg0KPiA+IG5vbi1EUlAgcG9y
dHMuDQo+IA0KPiBNeSBjYXNlIGlzIGEgc291cmNlLW9ubHkgUEQgY2FwYWJsZSBwb3J0IHdpdGgg
ZHVhbCBkYXRhIHJvbGUsIGNvbm5lY3QgdG8NCj4gbGVnYWN5IFBDIGhvc3QgdmlhIEEtdG8tQyB0
byB3b3JrIGFzIFVTQiBkZXZpY2UgbW9kZS4gVW5kZXIgY3VycmVudCB0Y3BtDQo+IG1lY2hhbmlz
bSwgdGhlIFBDIHdpbGwgbm90IHJlY29nbml6ZSB0aGUgc291cmNlLW9ubHkgUEQgY2FwYWJsZSBw
b3J0IGFuZA0KPiB0aGUgdXNiIGNvbnRyb2xsZXIgaGFzIG5vIGNoYW5jZSB0byB3b3JrIGFzIGRl
dmljZSBtb2RlLg0KPiANCj4gSG93ZXZlciwgaWYgSSBlbmFibGUgQ0MgdG9nZ2xpbmcsIHRoZSBQ
RCBwb3J0IGNhbiByZS13b3JrIGFzIHNpbmsgcm9sZSBhbmQNCj4gdGhlIFVTQiBjb250cm9sbGVy
IGNhbiBmdW5jdGlvbiBhcyBkZXZpY2UgbW9kZSB0b28uIFNpbmNlIGl0J3MgVVNCMyBwb3J0LA0K
PiBpdCBjYW4gd29yayBvbmx5IGFmdGVyIHRoZSBTUyBsaW5rIGhhcyBjb3JyZWN0bHkgZXN0YWJs
aXNoZWQuIFRodXMsIHdlIGFsc28NCj4gbmVlZCB0Y3BtIHRvIHNldCBjb3JyZWN0IG9yaWVudGF0
aW9uLg0KPiANCj4gU28sIGl0IHNlZW1zIGEgbGltaXRhdGlvbiB0byBsZXQgc2luZ2xlIHBvd2Vy
IHJvbGUgVHlwZS1DIHBvcnQgd2l0aCBkdWFsDQo+IGRhdGEgcm9sZSB0byB3b3JrIGFzIG5vbi1k
ZWZhdWx0IGRhdGEgcm9sZSB3aGVuIGNvbm5lY3RlZCB0byBub24gVHlwZS1DDQo+IHBvcnQuDQoN
CkkgZG8gc2VlIGJlbG93IHBhdGNoZXMgZnJvbSBIYW5zIHRvIGZpeCB0aGUgc2FtZSBpc3N1ZSBh
cyBvdXJzLg0KDQo0ODI0MmUzMDUzMmIgKCJ1c2I6IHR5cGVjOiBmdXNiMzAyOiBSZXZlcnQgIlJl
c29sdmUgZml4ZWQgcG93ZXIgcm9sZSBjb250cmFjdCBzZXR1cCIiKQ0KNjI1OGRiMTRkNzhjICgi
dXNiOiB0eXBlYzogZnVzYjMwMjogSW1wbGVtZW50IHN0YXJ0X3RvZ2dsaW5nIGZvciBhbGwgcG9y
dC10eXBlcyIpDQo3ODkzZjllMWMyNmQgKCJ1c2I6IHR5cGVjOiB0Y3BtOiBOb3RpZnkgdGhlIHRj
cGMgdG8gc3RhcnQgY29ubmVjdGlvbi1kZXRlY3Rpb24gZm9yIFNSUHMiKQ0KDQpTbyBJIHRoaW5r
cyBpdCdzIHJlYWxseSBhIGxpbWl0YXRpb24gZm9yIFNSUCB0byB3b3JrIGNvcnJlY3RseSB3aXRo
IHRjcGNpIGRyaXZlci4NCk1heWJlIGFuIGltcHJvdmVtZW50IGlzIG5lZWRlZCBmb3IgdGNwY2kg
ZHJpdmVyLg0KDQpUaGFua3MsDQpYdSBZYW5nDQoNCj4gDQo+IFRoYW5rcywNCj4gWHUgWWFuZw0K
PiANCj4gPg0KPiA+IEd1ZW50ZXINCj4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8
eHUueWFuZ18yQG54cC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBu
eHAuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2ku
YyB8IDMgLS0tDQo+ID4gPiAgIGRyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jICB8IDYgKysr
KystDQo+ID4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3Rj
cGNpLmMgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpLmMNCj4gPiA+IGluZGV4IGZjNzA4
YzI4OWE3My4uODg1NTllNzQ5MTIwIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvdHlw
ZWMvdGNwbS90Y3BjaS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNp
LmMNCj4gPiA+IEBAIC0xNzUsOSArMTc1LDYgQEAgc3RhdGljIGludCB0Y3BjaV9zdGFydF90b2dn
bGluZyhzdHJ1Y3QgdGNwY19kZXYgKnRjcGMsDQo+ID4gPiAgICAgICBzdHJ1Y3QgdGNwY2kgKnRj
cGNpID0gdGNwY190b190Y3BjaSh0Y3BjKTsNCj4gPiA+ICAgICAgIHVuc2lnbmVkIGludCByZWcg
PSBUQ1BDX1JPTEVfQ1RSTF9EUlA7DQo+ID4gPg0KPiA+ID4gLSAgICAgaWYgKHBvcnRfdHlwZSAh
PSBUWVBFQ19QT1JUX0RSUCkNCj4gPiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
Ow0KPiA+ID4gLQ0KPiA+ID4gICAgICAgLyogSGFuZGxlIHZlbmRvciBkcnAgdG9nZ2xpbmcgKi8N
Cj4gPiA+ICAgICAgIGlmICh0Y3BjaS0+ZGF0YS0+c3RhcnRfZHJwX3RvZ2dsaW5nKSB7DQo+ID4g
PiAgICAgICAgICAgICAgIHJldCA9IHRjcGNpLT5kYXRhLT5zdGFydF9kcnBfdG9nZ2xpbmcodGNw
Y2ksIHRjcGNpLT5kYXRhLCBjYyk7DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvdHlw
ZWMvdGNwbS90Y3BtLmMgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYw0KPiA+ID4gaW5k
ZXggM2M2YjBjOGUyZDNhLi42YWE2MjEzMmU2OWEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L3VzYi90eXBlYy90Y3BtL3RjcG0uYw0KPiA+ID4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvdGNw
bS90Y3BtLmMNCj4gPiA+IEBAIC00Mjc0LDcgKzQyNzQsMTEgQEAgc3RhdGljIHZvaWQgcnVuX3N0
YXRlX21hY2hpbmUoc3RydWN0IHRjcG1fcG9ydCAqcG9ydCkNCj4gPiA+ICAgICAgICAgICAgICAg
cmV0ID0gdGNwbV9zbmtfYXR0YWNoKHBvcnQpOw0KPiA+ID4gICAgICAgICAgICAgICBpZiAocmV0
IDwgMCkNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICB0Y3BtX3NldF9zdGF0ZShwb3J0LCBT
TktfVU5BVFRBQ0hFRCwgMCk7DQo+ID4gPiAtICAgICAgICAgICAgIGVsc2UNCj4gPiA+ICsgICAg
ICAgICAgICAgZWxzZSBpZiAocG9ydC0+cG9ydF90eXBlID09IFRZUEVDX1BPUlRfU1JDICYmDQo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgIHBvcnQtPnR5cGVjX2NhcHMuZGF0YSA9PSBUWVBF
Q19QT1JUX0RSRCkgew0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHRjcG1fdHlwZWNfY29u
bmVjdChwb3J0KTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICB0Y3BtX2xvZyhwb3J0LCAi
S2VlcCBhdCBTTktfQVRUQUNIRUQgZm9yIFVTQiBkYXRhLiIpOw0KPiA+ID4gKyAgICAgICAgICAg
ICB9IGVsc2UNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICB0Y3BtX3NldF9zdGF0ZShwb3J0
LCBTTktfU1RBUlRVUCwgMCk7DQo+ID4gPiAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gICAg
ICAgY2FzZSBTTktfU1RBUlRVUDoNCg0K
