Return-Path: <linux-usb+bounces-365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 210EF7A5BA7
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 09:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 026C21C2101C
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 07:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B539038DD1;
	Tue, 19 Sep 2023 07:52:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CED38BD3
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 07:52:20 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152B8116
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 00:52:14 -0700 (PDT)
X-UUID: 6eb4206e56c111eea33bb35ae8d461a2-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=KMFsyVVdE6ij2pX2J0uZ26xs6e7ZWa3MLo3mSMfHUm0=;
	b=EYwsDGOpg5EY5AXISPsZEb3/Uj9HQz5UmfJVbO4zR6JR30nDRZkJ+/3joTHE9/1WojaEaXiggHwoNp5lr6eTU6KB1+vXSY93LEozJWUld/7BubJG5jMbNyEVK3n/+fvBqEfZz0cgS656N+tdoc3xE+xeYTUWuMNDaqkF9y/foLc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:fa467d8a-66be-4406-91fe-e5d5f889a652,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:d08532c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6eb4206e56c111eea33bb35ae8d461a2-20230919
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 457262208; Tue, 19 Sep 2023 15:52:08 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 15:52:07 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 15:52:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6PiniyGIKiinWHoHxgJZft62PRLDj4DY8OioD79icAYJIg5ytVf5t6DyFtIUgZkK3hzxuwcf5M+u6tDx3XOJyKIzq+kQwUKBRhmo2oeJ0jsDHvQP+5I36d/etgsdHvgLZ6Wyoeoiu3g62wvtbtB+uinNQ6JmeeCYK4IhG6VoxOrfYEpZbct8cXuyTKhOcF3jJdYv5fvX9SH5kgSzyX4WMxzJbFpWgSbNT8ec1QRp88VcHTXLpR8yURVwjacA4EDB6EEa2VNNhxafQQGj1i0gk8frd68LfoLBQcpP92vIqGa1mn+gOfSvhy6bLAgJis3a6G2m5M5Eov2bgY/wsEJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMFsyVVdE6ij2pX2J0uZ26xs6e7ZWa3MLo3mSMfHUm0=;
 b=n6V5pRMBp0iGlqMEaID/1X0oKwrXPKkcT+OzQcE6wuXfc5zNcVdkm8XyzXATw4FOyXJCln4HmbQQar6njq7gjgd0r/n9DrQlETsATYzI1fiCHRpYdE3wMZAg4Xgz+gDxdGtF6+ZLFA0ji1m14YFhYKsrwGhWDB+VowxhoRpNlqqVgNkvARmjRUnmc6LWON0uDGkL1HFYfMnYkuZrmryMX4jf80mBZluuG6GBLXQDHApwp/QpqKLIGCjx/DdElg8SPp7/U99VuR3ALen+EIzN8OjdYD/X4J5rXJFn3baJn+4dZM29TabxuseE+ttBanRRR4jQYWMxmLgjb3bTdLChhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMFsyVVdE6ij2pX2J0uZ26xs6e7ZWa3MLo3mSMfHUm0=;
 b=VnusQKFZaC+nuAeV8gK3eRV81vRkQYLkpBpO+YnyAsqiqagJLEmljJPVnC/wzuzvXhRg2w8BzDeofpMLxO/WbMVSrxMbCqe9RAEHFb2Tf3SEYqAjmHms6jSSo2SDfHuironjJbZsNtCfX8OM2t65Af2Qm7IT+xYDGd3I/ii3zGA=
Received: from TYZPR03MB7153.apcprd03.prod.outlook.com (2603:1096:400:33c::6)
 by SEZPR03MB7355.apcprd03.prod.outlook.com (2603:1096:101:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Tue, 19 Sep
 2023 07:52:04 +0000
Received: from TYZPR03MB7153.apcprd03.prod.outlook.com
 ([fe80::ca92:ecfd:d3bd:a9d3]) by TYZPR03MB7153.apcprd03.prod.outlook.com
 ([fe80::ca92:ecfd:d3bd:a9d3%5]) with mapi id 15.20.6768.029; Tue, 19 Sep 2023
 07:52:04 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Thread-Index: AQHZ50aEEHyknxTx2EezJbrnbGH5+7Ahzc2A
Date: Tue, 19 Sep 2023 07:52:04 +0000
Message-ID: <3cdb8de0223327b820b5344945ce53c0555f4882.camel@mediatek.com>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7153:EE_|SEZPR03MB7355:EE_
x-ms-office365-filtering-correlation-id: cc9df457-c477-45bd-e7b7-08dbb8e5509d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7saNtdKaa850vnh6Lhzt91FituDNt4rpnt00r3iL4TChSc8Uhv9R0JysjR1QLa6J3W+evLSSv3YbDKKz13Shf0/3sWcH0ZGw4UtVGgb3mCJIz3pdNyqkjt8LIUHgnF55iEm2OI0h9zQEkeQxNa8j+ZRof1edww7wSKuTc5mXDHinAAYE0G7I4+OtB5iZTRh1oUIaZyPtM3ZI4MWHqm8+haJCbSL3jmzVYezCx2K+xzYZUWIXR654ftlQTzN/cBi7+xtVx5wxbssJUo2QD0qvhcMneIRmNQqKSA17baiSjY1Q/FZ6uD03vIrhhSwSym4pMAXI4imHletHnxvK40ZH0gIg9OL2clBDmmXzlAHF35aWlmzYLzWuNnjXUsJnTt9dFjI9SfB28UtY2MaXovTnh8kazIoPF43v8U1mvPc4xAN6xtOpXz6tFj/abHzzbclOqG4h1sqDViU4APd6QxCZlzohG+6luzi5q269EYwVsTZPhBYTzNEM/VrDXLhT5KFkMlZz82NcYRymvcbB7aqS9z18XHyvbDtn3KMOa1a9RVKa7kJnMYHRftYWpPg3L5s+OOw85wxT0pod4P+IQVduwATDincStmpD8RBzckZXn/3q4nh/4w9mMN0a59oqkGmXoG+Q+StvNjfqUQn7imBtM0u3hShQ3BafmJVoNrGQIeOcEiEYIcgDXUXusb4rYVWV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7153.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199024)(1800799009)(186009)(316002)(4326008)(5660300002)(6486002)(6512007)(6506007)(41300700001)(110136005)(2906002)(8676002)(8936002)(66446008)(54906003)(64756008)(66556008)(66476007)(76116006)(66946007)(91956017)(478600001)(86362001)(122000001)(66574015)(71200400001)(83380400001)(85182001)(36756003)(26005)(2616005)(38070700005)(38100700002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTJTWFhpVUJvUDVTYmo0YUJsOFdxSWxUZ2M2dkYyT2JEOWhVSHlNNmhabjJ0?=
 =?utf-8?B?K1VKeGUxSHZOeXoyck1wczJtWXBqOG9ldXZQWlhaL2FWSXJmR3ZXRzhmL0o3?=
 =?utf-8?B?Rk1GODZvK2E1V3ZwZEtOWjlQSDk1RXJONlMrT1FKYlh4UkJDSUpHZ1JnSzdh?=
 =?utf-8?B?Z3F0L3lsOERCOUNIbEgyQ284NkcrdXVtZlFOSkRoV0s4SkFRMXIxWjI3OVR1?=
 =?utf-8?B?UmJQclVkWENMcVp5clNLc0Roa0ZnaDUxOUlhMXRJaWh2cDNoTzdtT2EzU0Rr?=
 =?utf-8?B?aGxmaGV2N0xmS0FtYkI3QmY4MUh1UEVBQTdPWmtta2NETmpCRk9JMWZHNU83?=
 =?utf-8?B?a05MWlVFbWNHc3pRMzVVNGs5TnNVeUxKMklEejAxYTJ1anJyd0V1NGdBczc4?=
 =?utf-8?B?OHpJSGsvcXM5bW1XUHh6ZC9tcXE0dGc5N2poYVl6aGhpaDM3UXFQaU5HMC9W?=
 =?utf-8?B?TldUaVR5SHFYN0JsZ3F5QlF3Y0JMdUdhN1NPRS9OUWdjd1NnaXQ0RU1IbmNh?=
 =?utf-8?B?enRIcUVEdklPMnJZOXBrSkRDQ05oTTJ6SUh5cWxxZWFHNWJOTUFha0xmbTYx?=
 =?utf-8?B?TStSREMxdUNkNVR4eTlnTTNwSHd5OXRBVmxuRWtSMDNnc1hveC9XWC9HQ3pB?=
 =?utf-8?B?Sm5wM2N6c2VQUVp1cG5iZ2dPM1k0NXBqNm5GYlFidWF1RlZ6dlNUN1IreUcz?=
 =?utf-8?B?MVYvNUJtOExXZ1dDVUt6NHFGVFNiR0x0L21wTS96THpzSEpHWkl4QW8xM0xJ?=
 =?utf-8?B?OUR0QnVSdEVBcXRTelZGeHVkS1NRQi81N213ai9pTkxITXZuc1JWR2xUMFlP?=
 =?utf-8?B?Y0FMN0dZYTh3aFY4Nnh5Qm1iTGM0U0RpaDF5ZFk3OFgydGs3Uk9GL2I1OHBL?=
 =?utf-8?B?Q1I4WmwzZy9GTkxpRlduVnQxcVNoRjdhWEZtNkRjZHVUMjMyVHhDMUpvUWxT?=
 =?utf-8?B?WEdMb3BoR2JEVHpEWlE3aTQ3NUQzcmc2eWtXbElZKzhSaU8vMzFsV0Jxa3BB?=
 =?utf-8?B?eEFmb1A3WStCN1NPa09nK0FpZjdxRkNkOURWdDI1WXhrejBVY29Zem5GRmU1?=
 =?utf-8?B?VkxRQjViTVVnVTkwTkhHMEdTMkszYlh3dFdCVlZTTU5rZE04bmNRUXV0U0FE?=
 =?utf-8?B?N1NYY1N6akY1cVhLbGZPeFZ1S3ZLSnFvdGtydDVBYXdSVisyRnpUVmtKSkp6?=
 =?utf-8?B?VWxwa3BaSEFiNWJXTzFUcFpnOTNTNXlPWGlRYW45LzVCRUh5anoyMTZoZUY5?=
 =?utf-8?B?ZVNKNGNRazBGSzFMTzh3Sjh0SmlFNWZMK2VFQmpjTlUycko4LzE4ZHdMOU5p?=
 =?utf-8?B?eUt2OE5GS21SZ3NsZzlIS2JMMkRQbWYwU0wyWUxPMEJZek54bjA5dnlKVUo1?=
 =?utf-8?B?eVhjWWdiODBiUGFOZWpLMmVzVnZ3UVpOWXRYb01oaHNiNml4N0ppR3d6anFS?=
 =?utf-8?B?ZE5zOGxRbWtwS2lCTjc1ZVBNR2czeVNkTmw2eTlwYXhLTCt0WUZxVjcvc3VZ?=
 =?utf-8?B?T0lFbHBEZGkrd1JkMGVyZnh2eklKVWR6VllERFdPbjdZRnpHZEJDQ3VJVGpw?=
 =?utf-8?B?eU5qVU9DbzRmK1hLVlNXSFBlM1dPdHREUmhnbnVKUWJoVFpJRjM5VnVKSWRr?=
 =?utf-8?B?bkNJUG93ZTdkbzdKUlBIYVZIcUl1bjhqRjZCZUJXL09lUHZ6dStwelpEUTVM?=
 =?utf-8?B?MHBJUW9Wc0c0eHg5OGRUeGZHQ0VTZjZjVXNjTjE1SWhuNlpPNFpYN284T3g1?=
 =?utf-8?B?VlJ1QW1pTHEwUlo4ZUxrcmY3NHFCSjRCSTZyYXN2azRubTVCL3B0MlJPblZR?=
 =?utf-8?B?RkZDV01Kd1pzZm9XRlVPV0ZXWlNiK05TN2ZYQjNWb3Vaa1hYcVdvSEpJLzVo?=
 =?utf-8?B?TlZaV3B0STN1OC9vYUxRVjZyMW9LcHBvbFZ4TERwOW5BWlprZEZuS2p3TTV1?=
 =?utf-8?B?MUlHam5tcWRkOG03THUwamZ0ZWtMdCttcWhzSkhjSTRmeWhZdEJUQXpvZTRs?=
 =?utf-8?B?clpta09TeWZheTh2bGg2NmN1MmtZZzdzOFFYOGlpa3l5VHhCK3A2RmpWbGx6?=
 =?utf-8?B?TDZONmwybXQ3ZTd6dnE1RnVoSzhsQjJiUk1FN1NJdnY2M21kZ3hNOGxRSUpH?=
 =?utf-8?B?RFY5a0hJdGFnaTkxTk5tbVMyTkl1M1NCSTVrQlFvTC9XeDBDY0h3V0R6YXpV?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8D9E6D8F98E764F957A1DC30E459F69@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7153.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9df457-c477-45bd-e7b7-08dbb8e5509d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 07:52:04.2248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5nFjf8YtypZG7bHvCBxAaS/5HswGj3eRoXmOLLmKC+5kzY43jdkStTTzDHhi3RjbsAmmwN6N2TUGdWpG30kj3W1Yltl5LhMe1mV6meWRs0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7355
X-MTK: N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,T_SPF_TEMPERROR,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

T24gVGh1LCAyMDIzLTA5LTE0IGF0IDIyOjAyICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIg
b3IgdGhlIGNvbnRlbnQuDQo+ICBUaGUgLnJlbW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3Jt
IGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaA0KPiBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRo
b3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcNCj4g
YnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVk
IGlzIChtb3N0bHkpDQo+IGlnbm9yZWQNCj4gYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4g
cmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZQ0KPiBpcyBhDQo+IHF1ZXN0IHRv
IG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAg
b2YNCj4gdGhpcw0KPiBxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvIC5yZW1vdmVf
bmV3KCkgd2hpY2ggYWxyZWFkeQ0KPiByZXR1cm5zDQo+IHZvaWQuDQo+IA0KPiBUaGUgZnVuY3Rp
b24gbXR1M19yZW1vdmUoKSBjYW4gb25seSByZXR1cm4gYSBub24temVybyB2YWx1ZSBpZg0KPiBz
c3VzYi0+ZHJfbW9kZSBpcyBuZWl0ZXIgVVNCX0RSX01PREVfUEVSSVBIRVJBTCBub3IgVVNCX0RS
X01PREVfSE9TVA0KPiBub3INCj4gVVNCX0RSX01PREVfT1RHLiBJbiB0aGlzIGNhc2UgaG93ZXZl
ciB0aGUgcHJvYmUgY2FsbGJhY2sgZG9lc24ndA0KPiBzdWNjZWVkDQo+IGFuZCBzbyB0aGUgcmVt
b3ZlIGNhbGxiYWNrIGlzbid0IGNhbGxlZCBhdCBhbGwuIFNvIHRoZSBjb2RlIGJyYW5jaA0KPiBy
ZXN1bHRpbmcgaW4gdGhpcyBlcnJvciBwYXRoIGNvdWxkIGp1c3QgYmUgZHJvcHBlZCB3ZXJlIGl0
IG5vdCBmb3INCj4gdGhlDQo+IGNvbXBpbGVyIGNob2tpbmcgb24gImVudW1lcmF0aW9uIHZhbHVl
ICdVU0JfRFJfTU9ERV9VTktOT1dOJyBub3QNCj4gaGFuZGxlZA0KPiBpbiBzd2l0Y2ggWy1XZXJy
b3I9c3dpdGNoXSIuIFNvIGluc3RlYWQgcmVwbGFjZSB0aGlzIGNvZGUgcGF0aCBieSBhDQo+IFdB
Uk5fT04gYW5kIHRoZW4gbXR1M19yZW1vdmUoKSBiZSBjb252ZXJ0ZWQgdG8gcmV0dXJuIHZvaWQg
dHJpdmlhbGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+IENoYW5nZXMgc2luY2UgKGltcGxp
Y2l0KSB2MSBzZW50IHdpdGggTWVzc2FnZS1JZDoNCj4gMjAyMzA3MDkxNjMzMzUuMzQ1ODg4Ni0x
LXUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZToNCj4gDQo+ICAtIEtlZXAgY2FzZSBVU0Jf
RFJfTU9ERV9VTktOT1dOIHRvIGNvcGUgZm9yIHRoZSBjb21waWxlciBiZWluZw0KPiBjYWxsZWQN
Cj4gICAgd2l0aCAtV2Vycm9yPXN3aXRjaC4NCj4gIC0gUmViYXNlIHRvIGEgbmV3ZXIgdHJlZQ0K
PiANCj4gSnVzdCB0byBldmFsdWF0ZSB0aGUgb3B0aW9ucywgSSB0cmllZCB3aXRoIGEgQlVHX09O
KHNzdXNiLT5kcl9tb2RlID09DQo+IFVTQl9EUl9NT0RFX1VOS05PV04pIGJlZm9yZSB0aGUgc3dp
dGNoLCBidXQgZXZlbiB0aGVuIGdjYyBpbnNpc3RzIG9uDQo+IHRoZQ0KPiBjYXNlIGxhYmVsIGZv
ciB0aGlzIHZhbHVlLg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFV3ZQ0KPiANCj4gIGRyaXZlcnMv
dXNiL210dTMvbXR1M19wbGF0LmMgfCAxOSArKysrKysrKysrKysrLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfcGxhdC5jDQo+IGIvZHJpdmVycy91c2IvbXR1My9t
dHUzX3BsYXQuYw0KPiBpbmRleCA2ZjI2NGIxMjkyNDMuLjE4YzZjZjlhMmQ3MSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy91c2IvbXR1My9tdHUzX3BsYXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9t
dHUzL210dTNfcGxhdC5jDQo+IEBAIC00NTEsNyArNDUxLDcgQEAgc3RhdGljIGludCBtdHUzX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICByZXR1cm4gcmV0Ow0KPiAg
fQ0KPiAgDQo+IC1zdGF0aWMgaW50IG10dTNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICtzdGF0aWMgdm9pZCBtdHUzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiAgew0KPiAgc3RydWN0IHNzdXNiX210ayAqc3N1c2IgPSBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YShwZGV2KTsNCj4gIA0KPiBAQCAtNDY5LDggKzQ2OSwxNyBAQCBzdGF0aWMgaW50IG10
dTNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICBzc3VzYl9nYWRn
ZXRfZXhpdChzc3VzYik7DQo+ICBzc3VzYl9ob3N0X2V4aXQoc3N1c2IpOw0KPiAgYnJlYWs7DQo+
IC1kZWZhdWx0Og0KPiAtcmV0dXJuIC1FSU5WQUw7DQo+ICtjYXNlIFVTQl9EUl9NT0RFX1VOS05P
V046DQo+ICsvKg0KPiArICogVGhpcyBjYW5ub3QgaGFwcGVuIGJlY2F1c2Ugd2l0aCBkcl9tb2Rl
ID09DQo+ICsgKiBVU0JfRFJfTU9ERV9VTktOT1dOLCAucHJvYmUoKSBkb2Vzbid0IHN1Y2NlZWQg
YW5kIHNvDQo+ICsgKiAucmVtb3ZlKCkgd291bGRuJ3QgYmUgY2FsbGVkIGF0IGFsbC4gSG93ZXZl
ciAobGl0dGxlDQo+ICsgKiBzdXJwcmlzaW5nKSB0aGUgY29tcGlsZXIgaXNuJ3Qgc21hcnQgZW5v
dWdoIHRvIHNlZSB0aGF0LCBzbw0KPiArICogd2UgZXhwbGljaXRseSBoYXZlIHRoaXMgY2FzZSBp
dGVtIHRvIG5vdCBtYWtlIHRoZSBjb21waWxlcg0KPiArICogd2FpbCBhYm91dCBhbiB1bmhhbmRs
ZWQgZW51bWVyYXRpb24gdmFsdWUuDQo+ICsgKi8NCj4gK1dBUk5fT04oMSk7DQo+ICticmVhazsN
CkhvdyBhYm91dCBjaGFuZ2luZyBhcyBiZWxvdzoNCiAgICBkZWZ1YWx0Og0KICAgICAgIGJyZWFr
Ow0KPiAgfQ0KPiAgDQo+ICBzc3VzYl9yc2NzX2V4aXQoc3N1c2IpOw0KPiBAQCAtNDc4LDggKzQ4
Nyw2IEBAIHN0YXRpYyBpbnQgbXR1M19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAq
cGRldikNCj4gIHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsNCj4gIHBtX3J1bnRpbWVf
cHV0X25vaWRsZSgmcGRldi0+ZGV2KTsNCj4gIHBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZCgmcGRl
di0+ZGV2KTsNCj4gLQ0KPiAtcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgcmVz
dW1lX2lwX2FuZF9wb3J0cyhzdHJ1Y3Qgc3N1c2JfbXRrICpzc3VzYiwgcG1fbWVzc2FnZV90DQo+
IG1zZykNCj4gQEAgLTYxNSw3ICs2MjIsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdHUz
X29mX21hdGNoKTsNCj4gIA0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXR1M19k
cml2ZXIgPSB7DQo+ICAucHJvYmUgPSBtdHUzX3Byb2JlLA0KPiAtLnJlbW92ZSA9IG10dTNfcmVt
b3ZlLA0KPiArLnJlbW92ZV9uZXcgPSBtdHUzX3JlbW92ZSwNCj4gIC5kcml2ZXIgPSB7DQo+ICAu
bmFtZSA9IE1UVTNfRFJJVkVSX05BTUUsDQo+ICAucG0gPSBERVZfUE1fT1BTLA0KPiANCj4gYmFz
ZS1jb21taXQ6IDk4ODk3ZGM3MzVjZjY2MzVmMDk2NmY3NmViMDEwODM1NDE2OGZiMTUNCj4gLS0g
DQo+IDIuNDAuMQ0KPiANCg==

