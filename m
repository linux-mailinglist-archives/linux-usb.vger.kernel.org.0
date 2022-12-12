Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9667D649B89
	for <lists+linux-usb@lfdr.de>; Mon, 12 Dec 2022 10:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbiLLJ7e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Dec 2022 04:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiLLJ7c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Dec 2022 04:59:32 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB5664C0
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 01:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVX6JtzuIMPF0m2sSC3mWRySrOFA+20aaYZo9VoAKLzjMdk+d/oHsOB7NjKD5Ai5tivggd/Hp2+cZEBCYS14HuUcrxYAcSP9oocd+yGTqmV5p13kNdGwdd/Kr73tOWP7ZuAsUc/Oc5kgVn6gJgAdJmLhJ8dptDyPooRfMkV6sOYPBa41XZJ5KAtOxTkuLdmf0x2RpjRqwZR7Lu7f6GDOteswNPqIyTht47VHrhKCC4tOaOF/o6TvzVKC908qYd7RwGGeCZRaDI5Ol0o6fEnSKFLEIPf9vG8e6+/pRFX4yPwtA+pS8hHLAhsPZC++hneSYocHHmu/vcTSBgTt3XcgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rukwRXg6HcI10mqn5XnSN0mxYSqDK64IG6sNoqUHoAE=;
 b=m2la2zDBK4oL1UqIjoJBEtUFCiInNywdfwKzbwGb/65Dr6ZkuB0v09MZcRguKr+jT3PzjPltpkfmJVt6coR0hgyH22VJedBwXnP5P3/ZKWxdkOI8W4qyncTV69/Ly0PoWEDyZWUENKVn1x74wq1l4tuEJ/ooDdJu7PUDt247Iqfcy38BwC4ZDejzpe5Rqx0dmYfcGhWGXNvvMVzbCgTuK55xQ8RMksV4ML+8fCgmYZ+akY5mNgnpJTmBj/w9UMqc3NSAep/lZEOmx872yqaDuz2kOvPkL0E6T/ZCgVU7Q8QBCVX5pkfTzoqSl0RY52yIwxMgx8NhFrQ+YDpcqKEWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rukwRXg6HcI10mqn5XnSN0mxYSqDK64IG6sNoqUHoAE=;
 b=lHl6QGiczaneCEV26jKq2rr2NztHoopGjF4FGsKqWTST8dsPBC5G+d/ngYAHdfON5bqMmpCMgD8mAx/i/Fe4jNKztiqTdkfU1CqZo3GpCmV861YnbEE47FTICjAP/VRmeDQ3uw+RbKnxjvTSyhQMjVnZVv2/Aj9bvbaJtiNGyvI=
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by VI1PR04MB6877.eurprd04.prod.outlook.com (2603:10a6:803:131::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 12 Dec
 2022 09:59:29 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 09:59:29 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpci: Request IRQ with IRQF_SHARED
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpci: Request IRQ with
 IRQF_SHARED
Thread-Index: AQHZCtUxpJRWvQPP80OGQK6Vz0iWn65o3IWAgAEtllA=
Date:   Mon, 12 Dec 2022 09:59:29 +0000
Message-ID: <PA4PR04MB9591E4C4AF6849A2C0C4D6928CE29@PA4PR04MB9591.eurprd04.prod.outlook.com>
References: <20221208071648.2379254-1-xu.yang_2@nxp.com>
 <908adfb7-c5f5-b69c-1771-dc346ecbb0da@roeck-us.net>
In-Reply-To: <908adfb7-c5f5-b69c-1771-dc346ecbb0da@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9591:EE_|VI1PR04MB6877:EE_
x-ms-office365-filtering-correlation-id: a7128cbd-02b0-4d9f-d134-08dadc278f45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ifHWCJbwHLs3z80piD6XKRUxwg9yTstu/QGLcbuep7BcQkTbDM8fLqAt/oXnLw9JBQZLrC6tldiWCiO9MeevthWpOw3g1ZRO0/UbFCwTQnzQ2SFW0H68uR6GvcbgHpkIvj8ZkLK6qv57Ln0q5QBUC1VCwFWHz0LDGDA1PsZi9D0hE3PJvLPKlNPWn0qD3vEke/5gst8UmPLhZKxr83a0EXQbxo6rC3We0A0uv4G1IubujEmT9I1vMxcN0QabcNMMY0YKUg1YoyMdI4zgzga9P0Ot92IqQ1R6das9Qgla40+AMHt2Pq9h5Nheh3Y+ZL8mLHBv9lP8MBi0MvouVut0I4hNBqad67lBtl+90feajrMkxwQkn6iUa/K3INPuj2x0JCQrYGgJQcZ+ZkJqCJaGrQZg5Kbz1MP39DlwE3t5wsQmMgnRkA9M2cID2JAy0wl8YmKax4kIFQpCa0McGRWzQtlbvV4N2vozFPckik0HvnhK7A3ejysAQkC5e1FCIAy9DjynIsPSLSpt3i/dZHfrsPcPoMXZpB7bcmlV2i7Axr9z+AVWa3V/rBquj2oG37DPWcxuvQMNJjQ8J6Cr/r5nyUQKHWL86hTlSrjL1XNZ213zKVGASQdPjdX73Gn+nGigbbHZx0hEngbmHkkTcrQFHS9/ysaXdpWW+AiZozjIHN4f+90uQhRQOOPALzjI0uBZLarbbNgvoSzwa9RbXQEELQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(38070700005)(86362001)(55016003)(66946007)(76116006)(316002)(110136005)(66556008)(66476007)(122000001)(8676002)(4326008)(64756008)(54906003)(66446008)(2906002)(478600001)(52536014)(41300700001)(5660300002)(83380400001)(9686003)(71200400001)(53546011)(26005)(38100700002)(8936002)(186003)(6506007)(7696005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVFYNzJYWXcydFJqdXlCRjR4eUk0amtoaWN2YWV3U3M1b2VyeFRsZ1VSTzhR?=
 =?utf-8?B?RXZ0eXNsMUdDWSt6a1dKVW5nU21tV1l4ZHdKUXVjM1c3YUlqOU5VbEdWZmJv?=
 =?utf-8?B?ZzZFTmpRYjdkeVVYdmkrNG9Ca2Q4VFJqZG05aVl2eXI4ZXMrNEQzQlhEUE80?=
 =?utf-8?B?YkhPdDB0MWFQVjlpd1dqMTJqSncrWVdobXQ1dHhqbERVMHMwQ0c2ekhkOUVK?=
 =?utf-8?B?b3V2ZXdTbHFkcGZoT1JsY3VwTnBwMXdVeGhhbUF4M2pQUlJzdmVYTEIxdWpv?=
 =?utf-8?B?bW5uRURGQUFTMmpBb1dNVm8yeSs0YzQwT2UwTm9rWVJ1TU5GUFFjeE1vTS9J?=
 =?utf-8?B?UmlkeU9WNTE2cEtxNmtndks0S1VnVXB5c0RPekJXQy84VEFwMVhrbWRxMG8x?=
 =?utf-8?B?ajVmYmxzZVJzejA2R21RdGJuUHFnYnduMjBqV3J6L2VrbkJTck42S2pEZzha?=
 =?utf-8?B?dEYwazdlaE9XS3RUR0oxcTlpK2trMFRKOE5qa00xTnVJbU1OMmh1QVFxV2Jn?=
 =?utf-8?B?ZU1yb1dmZFVETW5zWVY1R1JpYjB6YnhMdnNGV2hocVpoSVdpeWUvRDBobEVk?=
 =?utf-8?B?NTd0cVNrcTJOUHBzM0h6OGUvbXJDNHk4eVNsR0VPS2dUWU9paDlIUFRTZS9r?=
 =?utf-8?B?QzEwR2pMNGp0L0dUUjBuWkU5aW9LM1YzT3NyVkYveG15TTRBWkl4U3l4N3Uv?=
 =?utf-8?B?bjc4WHRwZTFpUGt0VVRxRDRmL3g4WW9iNzcwSU93VEk0NUdqcTZPSE5zVEQ2?=
 =?utf-8?B?cVF4cE51d1dYWDRGQWJtSCtpRjZFM3lFRTJwT0dEQ21LMnpsWlVzODBuUm5P?=
 =?utf-8?B?Qlp5VmZkcXpLVStlczd2Ui9aV1cvcE5PWmJpcTVsbmU1NlBsOEZXM0lnTk9C?=
 =?utf-8?B?UEtpTVdYTFN0NjlsbjM4TnpXc1NPNE9sY2tEMDQ3KzBEQW4xMlM4NHZZZGhJ?=
 =?utf-8?B?cFFLZTROdTZrN2p5Zlp6VWY3akN1UllFVUtGdXdONlN5N0JTdzNDbUhPelBw?=
 =?utf-8?B?Q2F1UklKcHhzNE5xdjZLM3pLd0dSeWdYRUZoWE9FNlhnekE5amJFUHl6UURI?=
 =?utf-8?B?OEFldGNUaXJTMVEvWG1ub1BNT2lBV2N1ZUVYeGtad0xPMkV3Y29QOUdERllZ?=
 =?utf-8?B?VDQzSllaU1BBQU5CVEc3T0lIRVlzR2lZSStBZitEUU5NZitkcGUycUthRHBL?=
 =?utf-8?B?N2dpZzM5N1dYUnFHVG1RSGpUSThuWVF2V2JCbkdaKzhPeXhUYlJySFhNLy9V?=
 =?utf-8?B?VU1sUG1uWnJPNWdJR0R4NitlVUNCUzRVd3VsVFU2NTFyekVTME50OHRqZ1NF?=
 =?utf-8?B?NnBsb08ySnBDRlpKMEI3RUVNdWMzdHg3dUhKVldvRlRoNStsUmxEVi83ZmpK?=
 =?utf-8?B?RXNkeVFFMVl1RWZZa05MUnB4M1YwWHU0Sk5KM3dYKzlJZzYyMDhoTVAvcThk?=
 =?utf-8?B?eks3VTQ5a0FxK2RobEEyb2lKdmNVa21nKzZCOHJRb3FvNDhUREZEMzJtend1?=
 =?utf-8?B?TjhaS3UyMlY4d09YL1o5ZkM3SFR5WlBqMHA5aDRGVCt3Qld5YUNhT3JkOVZz?=
 =?utf-8?B?UGFKT2o1c1lyWGdBR2ZBR3FwTCtFcFI3RDJjMkVOQWFvYkxNNVFFZG5DMWZ0?=
 =?utf-8?B?RFlQVmJFRDJVeDcyd09LY2pnL1hCUFVSeDlUU3dlWkl5UmpCQ1VYNmxiVVp4?=
 =?utf-8?B?MVE3eHlLSjRlc1VROFRYMDhyZysvSjEvd0RDTVpuMFhydGNPM3Z2TU5oNFJw?=
 =?utf-8?B?aDJSUStvdTFRS3RSbi9MWDhqNmk5Z09nVXNnUlNERkFpUmZWaEZrdWZQS0Q3?=
 =?utf-8?B?VzhXSFFqL2M3a21wSk96MFVPNnJzWitrMWRGaXFTZzVUOSt2S0ZFcmhuamIv?=
 =?utf-8?B?YURCOTR3K2pMbXptK1JuOUJkeEVVemRHaHNBa0dXencrb0lOazAzY2hKMyth?=
 =?utf-8?B?UXE1aXZ0YjIrOFZ2cXVXa1NZMWpwc1o5OWh0NVFabFJ4WHBzeStYWDB3OEtK?=
 =?utf-8?B?cEU1dFpwSWVRaml2dVRwNSt3OFo2T2phMlIzTWRmQm5ONGVqQ2J0YVdjYVNw?=
 =?utf-8?B?amZPRFQ3cnR5YSs5QmRmb095UkVjbDRvNFRZL0pUK0dmVHRWaGRFR2xaRFo1?=
 =?utf-8?Q?Oeig=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7128cbd-02b0-4d9f-d134-08dadc278f45
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 09:59:29.1586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDzM0dPg32uJNugzywXdkzQx1a07CvtoYaZjDPdZwdZUL2DGbP8WAFPrVgLPPDk/JyBu1XU39WIg+i626EadPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6877
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3VlbnRlciwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVu
dGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sN
Cj4gU2VudDogU3VuZGF5LCBEZWNlbWJlciAxMSwgMjAyMiAxMTo1NiBQTQ0KPiBUbzogWHUgWWFu
ZyA8eHUueWFuZ18yQG54cC5jb20+OyBoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tDQo+
IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9y
ZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEp1biBMaSA8anVuLmxpQG54cC5j
b20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0hdIHVzYjogdHlwZWM6IHRjcGNpOiBSZXF1
ZXN0IElSUSB3aXRoIElSUUZfU0hBUkVEDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+
IE9uIDEyLzcvMjIgMjM6MTYsIFh1IFlhbmcgd3JvdGU6DQo+ID4gVW5kZXIgcmVzb3VyY2UgY29u
c3RyYWludHMsIHRoaXMgaW50ZXJydXB0IG1heSB1c2Ugb3RoZXIgaW50ZXJydXB0IGxpbmUNCj4g
PiBvciB0aGlzIGludGVycnVwdCBsaW5lIG1heSBiZSBzaGFyZWQgd2l0aCBvdGhlciBkZXZpY2Vz
IGFzIGxvbmcgYXMgdGhleQ0KPiA+IG1lZXQgdGhlIHNoYXJpbmcgcmVxdWlyZW1lbnRzLiBCZXNp
ZGVzLCBUaGlzIGlycSBmbGFnIHdpbGwgbm90IGNhdXNlIG90aGVyDQo+ID4gc2lkZSBlZmZlY3Qg
aWYgdGNwY2kgZHJpdmVyIGlzIHRoZSBvbmx5IHVzZXIuIFNvIGEga2luZGx5IHdpc2ggdG8gYWRk
IHRoaXMNCj4gPiBmbGFnLg0KPiANCj4gVGhlIGxhc3Qgc2VudGVuY2UgaXMgbm90IGFwcHJvcHJp
YXRlIGZvciBhIGNvbW1pdCBkZXNjcmlwdGlvbi4NCg0KV2lsbCByZW1vdmUgaXQuDQoNCj4gDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT4NCj4gPiAt
LS0NCj4gPiAgIGRyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2kuYyB8IDIgKy0NCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2kuYyBiL2RyaXZlcnMvdXNiL3R5
cGVjL3RjcG0vdGNwY2kuYw0KPiA+IGluZGV4IGZlNzgxYTM4ZGM4Mi4uMjIzYTFkZTRmYjFkIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2kuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2kuYw0KPiA+IEBAIC04MzgsNyArODM4LDcgQEAg
c3RhdGljIGludCB0Y3BjaV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+DQo+
ID4gICAgICAgZXJyID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgmY2xpZW50LT5kZXYsIGNs
aWVudC0+aXJxLCBOVUxMLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgX3RjcGNpX2lycSwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IElSUUZfT05FU0hPVCB8IElSUUZfVFJJR0dFUl9MT1csDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBJUlFGX1NIQVJFRCB8IElSUUZfT05FU0hPVCB8IElSUUZfVFJJ
R0dFUl9MT1csDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZf
bmFtZSgmY2xpZW50LT5kZXYpLCBjaGlwKTsNCj4gPiAgICAgICBpZiAoZXJyIDwgMCkgew0KPiA+
ICAgICAgICAgICAgICAgdGNwY2lfdW5yZWdpc3Rlcl9wb3J0KGNoaXAtPnRjcGNpKTsNCj4gDQo+
IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBzdWZmaWNpZW50LiBUaGUgaW50ZXJydXB0IGhhbmRsZXIg
YWx3YXlzIHJldHVybnMNCj4gSVJRX0hBTkRMRUQsIGV2ZW4gaWYgdGhlIGludGVycnVwdCBzdGF0
dXMgd2FzIDAgYW5kIHRoZSBoYW5kbGVyIGRpZCBub3QgZG8NCj4gYW55dGhpbmcuIEl0IHNob3Vs
ZCByZXR1cm4gSVJRX05PTkUgaW4gdGhhdCBjYXNlLg0KDQpZZXMsIHlvdSBhcmUgcmlnaHQuIFRo
YW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uIGFuZCBJIHdpbGwgcHJlcHJhcmUgdjIgZm9yIHRoaXMu
DQoNClRoYW5rcw0KWHUgWWFuZw0KDQo+IA0KPiBHdWVudGVyDQoNCg==
