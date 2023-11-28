Return-Path: <linux-usb+bounces-3414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC277FBD08
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 15:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D171B21D89
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 14:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482705AB9A;
	Tue, 28 Nov 2023 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="zw86McUo"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD26D4B
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 06:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuvW146eNVLlWYikL2b+RmvrrP83wMW8bjUhoThK3d8cdFuZGFLDcQC0d84Opj47J9mEQK4KFT15kLSN/Lb/XSKfe/36aIEQ7xf/tQ3j+YvJGzw/uDa6WoQo54OPNAW6r+P3qpDY2QjqjHTbIB10WCc0i598EuhUYdcR3QFkfNmpYk1e5ne11u16X5RebAZ8oCXe2wWuSEmAVEclqypuWnypoZlsdCl0NhzaqTxWCShMFyd6GTZvBxpT4JnF8GF4LBEvGP7UOtq0VbgN1TGtdwB85TU2aJlYKU3zc/Y8RoEu22UIAOdwiinyRLex6W13Bywy+SPvmvR9DsdK8qBkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vq7tZuuy2wGlQLcGg4Y2Iy3BTxIvNsJHYcy+SMg9ZvQ=;
 b=ZOxvHimaJaqix2VKlbWm/PXqE+0Wj6UxkTkP+RhV0SFRJ/Oo5CacTnlO7mo07lyj88MCy0AWYzVzSaE8gpn0gjPgtiKzixak91DrWyyAkh0OctBRK6ept/bX/NsgLjKHpuAwv5u+H0eK3jUJc4QEWuEGibf7CjtPpAdFKJB0IeQxRY5kFyV8tV6PGNVUaXy8gx+W9w+0P3Kr04X6V2KGpIVRr5yOgltagqm1UpfnpeB+AA0LMMFoYBT+IX2MXFpcXjbq2JPDEkkeUtwL49ZswaXU0ecNWhi5thsqErBE+yTX0/iuwQXhUHHJKsj/vU7zujaGh7BnOJL6tibWm7sPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vq7tZuuy2wGlQLcGg4Y2Iy3BTxIvNsJHYcy+SMg9ZvQ=;
 b=zw86McUontbl8oqNvWZ/LcD9aTg7S6H34kCc2SWPkI3r5IHH2fA0z2u+11wjeK8Wz4m0U1rfR7l5xJFqVpgrYrmZiN3LhLgfbzcX/ipiv6S/GXYT35pGgwFa+g0xDrjFBjK8ZFtphEaLZiHGV7CVBTglc8gRssNi/A3iLKZ2PUpLxBULGHt+x7QfulP7i+V3iEvtGp5zVSttcB/NyZEtJt80JETz1eign6HejKC3veQxDzL1WMYxbVYT1SSHpUmEMEgosY8I2XbqUunRhtcr/RNJi3JuEHo7CMyO8Zzd8FzSYyBd9ZiZHTW7ivPa4JGoCE23X1FLuFPsDJGsAUJaVw==
Received: from AM7PR04MB6839.eurprd04.prod.outlook.com (2603:10a6:20b:103::9)
 by AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 14:43:03 +0000
Received: from AM7PR04MB6839.eurprd04.prod.outlook.com
 ([fe80::eae8:400f:55f3:bdb1]) by AM7PR04MB6839.eurprd04.prod.outlook.com
 ([fe80::eae8:400f:55f3:bdb1%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 14:43:03 +0000
From: Ivan Ivanov <ivan.ivanov@suse.com>
To: "Minas.Harutyunyan@synopsys.com" <Minas.Harutyunyan@synopsys.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Oliver Neukum
	<oneukum@suse.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Topic: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Index:
 AQHaF9Jc8cpwlb8ez0CIUJONtczHPrCGUSgAgAegmYCAAByfgIABdI8AgAAvDICAADDAAA==
Date: Tue, 28 Nov 2023 14:43:03 +0000
Message-ID: <d8176b8a6851974a692804f006d59d3324903b62.camel@suse.com>
References: <20231115144514.15248-1-oneukum@suse.com>
	 <f0bd323a-8384-e303-907f-5d533af6d71e@synopsys.com>
	 <ZWRbkdTASTNJB8Fv@apocalypse>
	 <f293d306-54fb-ecb5-4515-70a6c1faf1b1@synopsys.com>
	 <ZWWsGknhNuVggNNa@apocalypse>
	 <bfb8e693-7085-430c-0481-3d6630168240@synopsys.com>
In-Reply-To: <bfb8e693-7085-430c-0481-3d6630168240@synopsys.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB6839:EE_|AS8PR04MB8420:EE_
x-ms-office365-filtering-correlation-id: 163052ed-50ca-4d59-da1b-08dbf020539f
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6IOIO4PfqY52UIsi3Lj2vn0zsBfLvYFHbfAzMnLEgyFOIKveuTQHB7qM0GAx019YfzdxcmtvrF7x1UTutoUnFeoIQIJtdtR6leetwHlXIQUKS0bp23IhL+qNiDUghOgFlUjH5PfiSMHfoyW4sirj0Oy8Y/Ez0rPmgS4DQhSw8I3UteE5qY2Sp8+Psu2ZCEtLV2gKeMCCgIVQ0OuhT3kBb+5VlQ7bt6vQrgEhlxLkuUE4hRpMhqFuwFNZM9p03FVnsvTZrI3aL9ca8ioW2aA2/WzE3lw+jTrOUqcbmAi76puOUccd/vxFVdnGNLiJ/mwEUk5cZEie80UEVR8roCi4sT3r6gzH3wCPfHFPadfsRou6uT/5D4kOd4zWU3qAoJRBkoAGoUDhnEr1CKqY01RceDfHupfXdSdOnEQ/HofsZ/6oj5sTvp0IF5WS0Isq/3PdnQPTxLK3Mn8YM6G5b6KBU23ioX6u+gMNRrfV0zTx3ZRtA0EFKBHASbN+5Qoi07YlsczFSXuU0YCvi9GPQlWp4wPt9I34j7WuRL0RMgHkiTXkzTplt5qAx+hNVsiga1SeuawOq0MzeraLWODvRD4AQfOdZlsW8gUKgVh+lsA6iY9EL4ffJEV6b2fQHBGSwTs7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB6839.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(8936002)(8676002)(4326008)(44832011)(5660300002)(66556008)(91956017)(6916009)(316002)(76116006)(66946007)(64756008)(41300700001)(54906003)(66446008)(66476007)(6512007)(4001150100001)(478600001)(6506007)(71200400001)(6486002)(2616005)(107886003)(26005)(66574015)(2906002)(4744005)(38100700002)(86362001)(122000001)(38070700009)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWFCaGNzNVhWcTRPZ3F3L25EcGVzc1VDbzA5bndvNER5SmtmK244TUdVem1x?=
 =?utf-8?B?VTdTc0Z4R28vV2xONVMxNDFnUCs1QWFzenh5alJrRVNOOHRVWjl2c0o2RTd2?=
 =?utf-8?B?SlM0blRlRHdhWnBBMVQyc1Fpem9abExIVlVSMUYzYm5Pb2hteEZON09USHdI?=
 =?utf-8?B?U2ZKdWZ0ak5NTDhRTlljZGZYbGtoK1EwRm9BblBCWkFVeVhFVVVQb2ZYSmli?=
 =?utf-8?B?aG0zZVByQzlVVlFjTE94OGFpTDZuRTVpcWwrQUJHYm9kWFdKT0VhdmFKT0tP?=
 =?utf-8?B?VmdoK0djTTJhRGltZllCZGh1UTJ4S0RHVExhaFA0OW1lRlYvT0Q5SlBCbjMz?=
 =?utf-8?B?Ykc4YjZJdytNUzB0R3h6MVdPY3E4cStOa20xRUtMak5nd2o5UlRwWU9yTkJm?=
 =?utf-8?B?OGNaUkhla2RZMWk2MmVFazNxNzRqNVBlYkVwRnRyMTgwZkNUOGFuR3loNjU2?=
 =?utf-8?B?akpTU2JTSEhtVElEZWV2aTV4UlBwdm1BZzQ3R1U5UVlKQmxVMXhPbDl0dTJq?=
 =?utf-8?B?ODlFeVl0QTArNWJJc1J2aEJsOHBBZmNDZmxyZTJBbXVVUkQxMXdqZ2RCZ3pz?=
 =?utf-8?B?cjdyM3FvU0VjcUZpK21OM1hJbnRFOFBCNmE5VTVnOXVvQmg2OFUyYjUwVEFS?=
 =?utf-8?B?VkZFYzUwZ1VBUGtvN3JucXArNTBEWjNyQk02UG0rTEFoUldSWER3cTdBZGUr?=
 =?utf-8?B?QzJCY2VMa0NhTXV2TkpzL3lDejBsRXg1bG5ud1lsdFJNZjFNdUhOa0x2VlhB?=
 =?utf-8?B?bDZVemN5aURXZi9TVzdLQXlEbFNzb1NHNDdsN2I2anB6Um10dU9lOTE2bGFZ?=
 =?utf-8?B?WFpGZ2k0VG51TWNJTHYrd2VRMk5EcVNGa3RVbkE0MTk2YWliYnA4cUhKWlEy?=
 =?utf-8?B?MGVKSDVuMlRqR0tMREJFLy83dWJkYnFENUlNbjFXZ3l6VC9WdkZMaUN0d1FI?=
 =?utf-8?B?M0hRRENzTDFhQmxodllmZGx4cS9WMFhNU1VoQjRnUEwvdDlVTTg5SW9vNDdX?=
 =?utf-8?B?TU1FdGMrbVJrREQ2Tld5eVFEUjIzeUpSUkxSa3hPM04xdUhGN3NsOHJZT3lY?=
 =?utf-8?B?YStLMHpkb0NPREs5dkgvUE51dmdHRDhlQURTMEY4V1ZSNGlRUTNCbk50Tjlv?=
 =?utf-8?B?SzhwVmxPaTRYc0YycDJBZDcwQzU0TFVYT0tBNTJpTXdZT2FNL3Z5R1hnM3dh?=
 =?utf-8?B?NVJrQk94b3FURzJ1TTdLOEZHVUVadmttUDRmOWRIM1VvbXA1TzQ3V3FTRDZs?=
 =?utf-8?B?alFjYzh0d2N5WTFCS21TNWpEZ1NZaUZqYXlob1J2N2NIN2dVaWhYMENBbmoz?=
 =?utf-8?B?RGxzOUVCVTlURG14MVB2NnpQR3BaR2UvdUUzY3ZwYnlCZTNjSEFBeEJWMks0?=
 =?utf-8?B?ZFgxL0U2a2d0WGxLSHpNaHB5eHVIT0hycmZDSTViTGJmNHFqM3lRWFdON0NB?=
 =?utf-8?B?VXZCdHAyOTVyaTJNTUpVY29sS3VxT0pVTlpIVUd2amkxbHJGUmhIQ2FVblFh?=
 =?utf-8?B?THAvUDc5R0RtNFhoUStxZ2RZNG5DamxXS09CMnBrVVRzcmUrSUhsVUZBYW4z?=
 =?utf-8?B?eFdVM21PNFgvdFdHbnBTM2FKQTB4NXJFeHlreU9rSjlvNTlZc2ZWWUpib0x6?=
 =?utf-8?B?UGI0SnVyTjdiWU5meDNoa1RjNWxXVGZTejlxcVZ1OVo1cGkxWWhPZW95VUNT?=
 =?utf-8?B?SVhrWXZocmtGeVZNaEx5T3JQWXY0eUpxV2VjL2FZck1mRWZ0RmZJSXd2dTYy?=
 =?utf-8?B?NmoyU3o5ekNNa2JPalh2REtTVzNsLzdPMm9ycFVqa2NQVUVQUlhDN1pHRno4?=
 =?utf-8?B?Yjl0UGE0Mm5WZGl3SGxtNzk4YTh5TU4xWHhZcGdhTXlHRkoxVldPNGtDeUJ0?=
 =?utf-8?B?TmFuSGR6OVYyTjEvTzRjRVY5QUl2eXdJb1pnb08wV0hIN1FxbDBOMlZoUVkz?=
 =?utf-8?B?VTAxR0Y3dFhqeW1ZajdOdXRqYWJHY2JMTnAvUERkaHduUit1QWJQd29rbHEy?=
 =?utf-8?B?Z1dEeGN4WnFpaEQvL0lPdTVPM2hJcWJtOGNPWWJMbkJyZWtvUjhxa1VZTDVz?=
 =?utf-8?B?UWdOS2JNb0NFYkVuS2VaSGVMK0pIbGV4T3JrUEt0Ym9Sd1VMTjhwL25GZlZi?=
 =?utf-8?Q?Oiq9j5nD3yYxObzM7mJoV4oyl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <246F2944A1CA1043A59561DA4718CC9B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB6839.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163052ed-50ca-4d59-da1b-08dbf020539f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 14:43:03.5175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1zBNw1cgzVaI99oAtDiU/okzUb5Nm4U+R+O2kMWKIldNOzv03wQk75XvExOhbW2UyKy7iDwFmE/M0rskIpWQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8420

DQpIaSBNaW5hcywNCg0KT24gVHVlLCAyMDIzLTExLTI4IGF0IDExOjQ4ICswMDAwLCBNaW5hcyBI
YXJ1dHl1bnlhbiB3cm90ZToNCj4gDQo+IERvZXMgdGhpcyAic3B1cmlvdXMiIGludGVycnVwdCBi
cm9rZSB5b3VyIHRlc3RzPyANCg0KSXQgaXMgbm90IGp1c3Qgc29tZSBraW5kIG9mIHN5bnRoZXRp
YyB0ZXN0IGNhc2UgdGhhdCB3YXMgYnJva2VuLg0KYnV0IHJlYWwgd29ybGQgdXNhZ2UuIFlvdSBj
YW4gZmluZCBjb21wbGFpbnMgYWJvdXQgdGhpcyBlcnJvciBvbg0KdmFyaW91cyBpbnRlcm5ldCBm
b3J1bXMsIGp1c3Qgc2VhcmNoIGZvciBkd2MyX2hjX2NoaGx0ZF9pbnRyX2RtYQ0KYW5kIGl0IGlz
IG5vdCBzbyBkaWZmaWN1bHQgdG8gcmVwcm9kdWNlLg0KDQpXaXRob3V0IGRhdGFib29rIEkgYW0g
bm90IHN1cmUgd2UgY2FuIGNyZWF0ZSBiZXR0ZXIgZml4LCBidXQgaWYNCnlvdSBkZXZlbG9wIGRp
ZmZlcmVudCBzb2x1dGlvbiBJIHdpbGwgZ2xhZGx5IHRlc3RlZCBpdC4NCg0KUmVnYXJkcywNCkl2
YW4NCg==

