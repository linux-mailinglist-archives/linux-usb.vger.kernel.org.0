Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C57055378B5
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 12:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbiE3Jnv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 05:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234326AbiE3Jnu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 05:43:50 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2D010FCA
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 02:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M16A3igNo3bnpJZlrosaGCEW8Xqj0P/DJWFa1ykHMKAeD9TwutaI/fd27t1li1Tj2kVC8HUpLOQR6uACr8n2bTH9NnXappIjTPlTmQ3nGADcXHLDQA23dzCL51DSnZ2eXhdZvLZ5XvWbvT9lxkwIFEOC2p5Ce08LMDb34x8Xp6Bm+aAeaRVyBC0yXAYQq89RQHyUjbhCulAD4qvwQkFypKwMFx4sFU3v7hEf8n5Ea/mUMO1jTYXE5yuC7117WAjCZWjJJCT2ZFDUU8RG/zTsy/xk6gUrw9HgDcZZMPIw3UyTLL58i3O+Wju/6Ti752uOTAzyii5O5Ws57DZPgWmSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2r5HcmzA8o3gnbZooHVAI/AaL7VA721gFXeO4ZB8AE=;
 b=DHLwS0U6fEJLpWTA6c5m2HaD58nfF0e1V7iAuy5eLVYbxFEALG9/hXglWI0rtuqDcIWn8w3e02VHa9jq3RRHeJaajGPaP/k3UgGTNhbcSQhVWtcj2qzN+H9kslFRk3a8VaFrvn6m7oTuJ1kCZgZFsO5OBcfC9dc3m4lsMbxXzx/J1Lad9lcDi5SCbEccpbYryASn9H+EBZIl/DTAJlMypIKD/zG1PiftOhv+tfubnw1NVq8hHFSu/r2zSlE3sQ5JW4RsudspNJKZpcimBgWDqZCTETflBZ3AsCwhgFT4YlA3ciWBNwrMR/APqUN1bCOKzVpPIJeX6upTEM6K8ppC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2r5HcmzA8o3gnbZooHVAI/AaL7VA721gFXeO4ZB8AE=;
 b=liSXUtkCmLQDV1kerBHOMg92kjPlEUzL5ABsynz01fitROL5CEJ60h9t9j8NGG16+ujY6wv9NnOWAMWbaCNLyZKmc8dJyiNr3oJIJjJNieOyUcX9rc/BdGhQSVGs+oRy8PWSN1ALu35HbeWgRTyZHHJXwofCIMHkf3pnCLxZKts=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AM0PR04MB4995.eurprd04.prod.outlook.com (2603:10a6:208:c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 09:43:44 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 09:43:44 +0000
From:   "Jun Li (OSS)" <jun.li@oss.nxp.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "J.D. Yue" <jindong.yue@nxp.com>
Subject: RE: [PATCH] usb: dwc3: add power down scale setting
Thread-Topic: [PATCH] usb: dwc3: add power down scale setting
Thread-Index: AQHYcaptAJTG14qTZkGTUfNT6DIUL60zeteAgAALK4CAA6ooEA==
Date:   Mon, 30 May 2022 09:43:44 +0000
Message-ID: <PA4PR04MB964065D4D3ED6DF8009A4EDB89DD9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
 <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
 <a0573de8-fb99-797d-bd49-e1aab7223c12@synopsys.com>
In-Reply-To: <a0573de8-fb99-797d-bd49-e1aab7223c12@synopsys.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 969b6cdb-469e-4c9f-0b0c-08da4220e334
x-ms-traffictypediagnostic: AM0PR04MB4995:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM0PR04MB4995B61C752E8679578F0B3DC8DD9@AM0PR04MB4995.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nA6Bk5T/nakYEkaMpR2/q5HFo4d3QOrSMpbsOn9J14yJrSwnetbfhYhyYE84mAMTboP3n/Kmj2GqvUJnPRyHAMH1MYO6C8VGKRmEnLOJiOJi1yq598lGDVAiDPjcpE1Fci+Y8vCyG7DoL7l4/4uDl+W0MRfpU/WKT54bi2nSBkLgLScEoBLg1B7i+KIgg4FHKt27u86cjcvsw2PWVzcTvQ12JJHeHQRpIXnuKgyN76jsHrfBWMvEVLxRzv4nzOdbp+RTP9P6TiwDe0BK1VYy2Yog0ItQjyJea8YeauXvKxGIyhk8r8l35Qdwc4Q1T09AtosSVPfTr8Trhtg9z0CgExVCZMjwonUA23tbqbTZjtDAmfHDwGuyRBCsdl5bsrMN909bhK73pzBk4f9ywnjoNN/zRybG3remnAd8UbrvB8F5CVUYHrM69ciEm1HvZwDj+Tr33/n3oMnRPxvc0/8wjBZu4dP480i/vRFFpW0zrIvJ/LQ5IBtAK/83nyBGBnpgxXRcC5oc845Bpmj/D4JSdXk5vcWN2+uUUuJwZvRCEpailfSc6OfsTqEW2HDcQxZU0fOM5OzKSNP4c9zAdv2o2VwZJKDNd6kXGdDdf3aHwVo0v0fVyDUiCmCehOzQZfhQjqkytQGYvuMJf9XFGBJqTJGBgcZUb2c0wwK6dT/wBcKdedrg23pE2gKHQHaFtTg6Q9EmOaa9hRFr1zeYtT06Qw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(186003)(508600001)(52536014)(55016003)(86362001)(83380400001)(66556008)(66446008)(76116006)(4326008)(66946007)(38100700002)(6506007)(8676002)(53546011)(9686003)(110136005)(7696005)(66476007)(64756008)(54906003)(316002)(8936002)(33656002)(2906002)(71200400001)(122000001)(26005)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmh2Q2x4OUROK29XZHp6WkRVUC9aNDE1MjNlQjVPSThrdVJaZnRkeDZ3NlU2?=
 =?utf-8?B?QUtKZUxPcXA0MXI2a0w4WUNGY2t1VDBiRUg3SGJJZnVYejRqMWRkbU1KTkRU?=
 =?utf-8?B?U0wrRmhDNG1VU0Q0clNIZlRhY1JXdW92OVEzZlY5OXpPNG1DZ2dINmJVWXJq?=
 =?utf-8?B?K0RNNkVGZmVHdUtRNVBWa0x0bS9VRzRXbnVkQTkvbEtYY3p6UGpXRDUyTUda?=
 =?utf-8?B?WW5iaXpPQ2N6QldkQWtFKzk5VENYOG4rMjNBV2h2cXpJL0U0b0NtUSt5TjlJ?=
 =?utf-8?B?b0NNN0xuTzdiSkRwZCtIUzYwOEtjcWF1K0xwOEhmc1ZZSmVaRWF3K3ZQOHpa?=
 =?utf-8?B?NlJxUmd6eGxhMGUvUjNPQ3Bxcitqb0wrTmNuY3NHRGV1b2pXUHl6cmIyV0dk?=
 =?utf-8?B?OTZWN0FabytYL3dlYmRaVzdKazY3MWFHSEgzblNSWWFzM1dPTXkwcWRqTUVq?=
 =?utf-8?B?dFJPb2ZTK1dPWEVCeWxBYWZSRncyS0RPa3BGSXhLYkdodDB2M1FvMi9hOTA0?=
 =?utf-8?B?R2R1emQzcElIa3o2dU03akNBSmxFTzJSY3RwdFBrTGRaT05icGRZODNNWG4x?=
 =?utf-8?B?K0RaQkpYSkVsRGlTRHR2QS95Nkprb1Axc1VVcy9GelhLakRVeHgyTWFIY2dp?=
 =?utf-8?B?TWlpZW92NjhpZSsxdFRJU0RxQW8xOVd2dU1vN0p6dStDTnVBakNVNHdNaldr?=
 =?utf-8?B?ekJ6dVc4THIrZFI4WFAyUFlyTytNZnJ0bnlqMHo1YWV2eHhEQWNkU3JMbjhw?=
 =?utf-8?B?ZWVJdGxEcXh0ZG5xdG9udFJsVy9VOUl4cE9NSE9ERFNXYVdUTnB6MmpVRy9H?=
 =?utf-8?B?TS9QV3VyVmoxbDl0QUd0VnJPdUFPZkZ6UjB2ZWQrN1ZPK0hkWkR5dGQwa3pT?=
 =?utf-8?B?dm01c0U5Sy94UFJyS3NUZ2NuRjBFb0UwUFh4K2xlcW9Qd01MKzFDVEVQQnZB?=
 =?utf-8?B?UlIzN1lJRncyUEFIeWFDMHdsam54TFlVTWMxQVI0eVJGTGpGWUp0eit6Mkpj?=
 =?utf-8?B?b2RCWncyR2E2bThPSHBma2tkOUFlbndNK0JYU1VuM3hlOEt0ZFBVTmY2R3hz?=
 =?utf-8?B?c1NwdDF2dWVMUDQ4ZWREc2lDTDN0WDN1Y2ExR2xPSFMwcEI4ZzlFc2JGSHcz?=
 =?utf-8?B?SmpMcVp5c3BxbXZQQ3hubDk0bXRpQUZSc3J1cEhkdFFRVUtrR2VGbHZCRlhW?=
 =?utf-8?B?eDVHTFp3SElWcE84K2NXQnlOTWNwNFkvOENpTVRSTHdNbktwcmNpektxNktP?=
 =?utf-8?B?SVpIbmM0TTlPb0pmdDQ4a1FxYndNeXJqLzRGdG9YRDB4dFNyVVdTZGo2dkhD?=
 =?utf-8?B?N0xuUDZCRUd5YThQckNZTnhRd3NrVnVpbDNvbzAxdFRraW5hSWxROEh6TTQ0?=
 =?utf-8?B?Ly9PSUc4U0p4VG92MmY3Y1krVnZwZlUyaDZta2dmNE1PQldmeng3Q25MbEo1?=
 =?utf-8?B?MEpwZjhMVjVtNU1wOEZCWnJNQUtEN3FpUVVPd0ZCM0tyY1pNekoxZ0RkbDZu?=
 =?utf-8?B?WmwyamVJU0dGWkQzSm82ZTdlZ1FERUJpWjk5ak1WOURSRVZFZDdqZURZeVNj?=
 =?utf-8?B?eFpLQVVkMzcwZDdYRWRHWGUxVHc2OVBnZFY2TVEwclpQazg4OG5NMWNWdjJr?=
 =?utf-8?B?OHNiaWlSbE1oRG92RSsvZWxMQ3BkZnRxR1NBSHp6ek5DU0FBT3RZOU5rMzFh?=
 =?utf-8?B?TEJXY1VPaHFQeHdMWEFxbzdqS2p1Tmc0dE5tNDREMDVodEVvc1lSb0pSZTAx?=
 =?utf-8?B?YmFxZ1RMZ0VVNndCdTBIeVdtUUFPbjc5KzZ0NmM5c0t4T1lHblFiN1pNQ1Zx?=
 =?utf-8?B?T3luNDZqTlRvVE00SGwrT2ExMGU3blZWVDE3V2tmb0hKMUdUcHN0S3VQUExr?=
 =?utf-8?B?VjNvUW5DMnJEVmw3QURadHlGZ09ELzRKRmRhR3lWeDN4bDNjZkNVSG5BZ1pI?=
 =?utf-8?B?MG5BcjBrTUhWaFdtSjE3bW1SdTVjR2JCUnRxaTRnZjVBVVhlUnIzSVN3MVlN?=
 =?utf-8?B?bVpKNit0Wm4yWnlUSC9aRnZ5eS9OUldkSXcvSncxQjJCQnpqejBPbjhDSWhy?=
 =?utf-8?B?d2VCa2lidm5ReUpCMUo2Tk1BNWcveTRLaEI5TzIxbzZBb002Sms4cThpVlZ0?=
 =?utf-8?B?cW84RjhybEVrL3ByRGpPMU8wVXhpNlBNZ1RPbEZ6MFB4bW5SZ2JjSTdBQU9q?=
 =?utf-8?B?dmJ3TU9CWlFzUlFJRWRtSFRzL1JOTWF2YkJBOFhHZjBseExqZ3dNZEJ2TUdt?=
 =?utf-8?B?S0tEVkFiNmtZTHpkb2ZxNy9jbGE0YTlIZ0NqaklRRmN1MzcxZDJRUWg5WTVZ?=
 =?utf-8?Q?vnAv9a7vgqp1CHLJE4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969b6cdb-469e-4c9f-0b0c-08da4220e334
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 09:43:44.4103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pGS1vk/5il4onhCQoFlaTUosNCwmEgMEXNJDXmkuSZPPhBhAqfxiAzHJvKZlGTH1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhpbmggTmd1eWVuIDxU
aGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgTWF5IDI4LCAyMDIy
IDk6NDYgQU0NCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+OyBncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZzsgYmFsYmlAa2VybmVsLm9yZw0KPiBDYzogbGludXgtdXNiQHZnZXIua2VybmVs
Lm9yZzsgSi5ELiBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIHVzYjogZHdjMzogYWRkIHBvd2VyIGRvd24gc2NhbGUgc2V0dGluZw0KPiANCj4gVGhpbmgg
Tmd1eWVuIHdyb3RlOg0KPiA+IExpIEp1biB3cm90ZToNCj4gPj4gU29tZSBTb0MoZS5nIE5YUCBp
bXg4TVEpIG1heSBoYXZlIGEgd3JvbmcgZGVmYXVsdCBwb3dlciBkb3duIHNjYWxlDQo+ID4+IHNl
dHRpbmcgc28gbmVlZCBpbml0IGl0IHRvIGJlIHRoZSBjb3JyZWN0IHZhbHVlLCB0aGUgcG93ZXIg
ZG93bg0KPiA+PiBzY2FsZSBzZXR0aW5nIGRlc2NyaXB0aW9uIGluIERXQzMgZGF0YWJvb2s6DQo+
ID4+DQo+ID4+IFBvd2VyIERvd24gU2NhbGUgKFB3ckRuU2NhbGUpDQo+ID4+IFRoZSBVU0IzIHN1
c3BlbmRfY2xrIGlucHV0IHJlcGxhY2VzIHBpcGUzX3J4X3BjbGsgYXMgYSBjbG9jayBzb3VyY2Ug
dG8NCj4gPj4gYSBzbWFsbCBwYXJ0IG9mIHRoZSBVU0IzIGNvcmUgdGhhdCBvcGVyYXRlcyB3aGVu
IHRoZSBTUyBQSFkgaXMgaW4gaXRzDQo+ID4+IGxvd2VzdCBwb3dlciAoUDMpIHN0YXRlLCBhbmQg
dGhlcmVmb3JlIGRvZXMgbm90IHByb3ZpZGUgYSBjbG9jay4NCj4gPj4gVGhlIFBvd2VyIERvd24g
U2NhbGUgZmllbGQgc3BlY2lmaWVzIGhvdyBtYW55IHN1c3BlbmRfY2xrIHBlcmlvZHMgZml0DQo+
ID4+IGludG8gYSAxNiBrSHogY2xvY2sgcGVyaW9kLiBXaGVuIHBlcmZvcm1pbmcgdGhlIGRpdmlz
aW9uLCByb3VuZCB1cCB0aGUNCj4gPj4gcmVtYWluZGVyLg0KPiA+PiBGb3IgZXhhbXBsZSwgd2hl
biB1c2luZyBhbiA4LWJpdC8xNi1iaXQvMzItYml0IFBIWSBhbmQgMjUtTUh6IFN1c3BlbmQNCj4g
Pj4gY2xvY2ssDQo+ID4+IFBvd2VyIERvd24gU2NhbGUgPSAyNTAwMCBrSHovMTYga0h6ID0gMTMn
ZDE1NjMgKHJvdW5kZXIgdXApDQo+ID4+DQo+ID4+IFNvIHVzZSB0aGUgc3VzcGVuZCBjbG9jayBy
YXRlIHRvIGNhbGN1bGF0ZSBpdC4NCj4gDQo+IEFsc28sIHNob3VsZG4ndCB0aGUgdmFsdWUgc2Vs
ZWN0ZWQgYmUgdGhlIG1heF9yYXRlIG9mIHRoZSBzdXNwZW5kIGNsb2NrDQo+IGFuZCBub3QganVz
dCB0aGUgdmFsdWUgZnJvbSBjbGtfZ2V0X3JhdGUoKT8NCg0KSW4gbXkgY2FzZSwgdGhlIHN1c3Bl
bmRfY2xrIGlzIGZpeGVkLCBzZWVtcyBtYXggcmF0ZSBpcyBvbmx5DQpVc2VkIGJ5IGNsb2NrIHBy
b3ZpZGVyIGFuZCB0aGVyZSBpcyBubyBBUEkgdG8gZ2V0IG1heF9yYXRlIGZvcg0KY2xvY2sgdXNl
cnMuDQoNClRoYW5rcw0KTGkgSnVuDQo+IA0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBMaSBK
dW4gPGp1bi5saUBueHAuY29tPg0KPiA+PiAtLS0NCj4gPj4gIGRyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPiA+PiAgZHJpdmVycy91c2IvZHdjMy9j
b3JlLmggfCAgMSArDQo+ID4+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4g
Pj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMNCj4gPj4gaW5kZXggZTAyN2MwNDIwZGMzLi4xNmQ0NDFkYmMyOGIgMTAw
NjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5jDQo+ID4+IEBAIC0xMDI5LDYgKzEwMjksMjUgQEAgc3RhdGljIHZv
aWQgZHdjM19zZXRfaW5jcl9idXJzdF90eXBlKHN0cnVjdCBkd2MzDQo+ICpkd2MpDQo+ID4+ICAJ
ZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dTQlVTQ0ZHMCwgY2ZnKTsNCj4gPj4gIH0NCj4g
Pj4NCj4gPj4gK3N0YXRpYyB2b2lkIGR3YzNfc2V0X3Bvd2VyX2Rvd25fY2xrX3NjYWxlKHN0cnVj
dCBkd2MzICpkd2MpDQo+ID4+ICt7DQo+ID4+ICsJdTMyIHJlZywgc2NhbGU7DQo+ID4NCj4gPiBD
YW4gd2UgZGVjbGFyZSB0aGVzZSB2YXJpYWJsZXMgaW4gc2VwYXJhdGUgbGluZXM/IFByZWZlcmFi
bHkgcmV2ZXJzZQ0KPiA+IENocmlzdG1hcyB0cmVlIHN0eWxlLg0KPiA+DQo+ID4+ICsNCj4gPj4g
KwlpZiAoIWR3Yy0+c3VzcF9jbGspDQo+ID4+ICsJCXJldHVybjsNCj4gPj4gKw0KPiA+PiArCS8q
DQo+ID4+ICsJICogVGhlIHBvd2VyIGRvd24gc2NhbGUgZmllbGQgc3BlY2lmaWVzIGhvdyBtYW55
IHN1c3BlbmRfY2xrDQo+ID4+ICsJICogcGVyaW9kcyBmaXQgaW50byBhIDE2S0h6IGNsb2NrIHBl
cmlvZC4gV2hlbiBwZXJmb3JtaW5nDQo+ID4+ICsJICogdGhlIGRpdmlzaW9uLCByb3VuZCB1cCB0
aGUgcmVtYWluZGVyLg0KPiA+PiArCSAqLw0KPiA+PiArCXNjYWxlID0gRElWX1JPVU5EX1VQKGNs
a19nZXRfcmF0ZShkd2MtPnN1c3BfY2xrKSwgMTYzODQpOw0KPiA+DQo+ID4gMTZrSHogPT0gMTYw
MDBIeiByaWdodD8NCj4gPg0KPiA+PiArCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0Mz
X0dDVEwpOw0KPiA+PiArCXJlZyAmPSB+KERXQzNfR0NUTF9QV1JETlNDQUxFX01BU0spOw0KPiA+
PiArCXJlZyB8PSBEV0MzX0dDVExfUFdSRE5TQ0FMRShzY2FsZSk7DQo+ID4+ICsJZHdjM193cml0
ZWwoZHdjLT5yZWdzLCBEV0MzX0dDVEwsIHJlZyk7DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gIC8q
Kg0KPiA+PiAgICogZHdjM19jb3JlX2luaXQgLSBMb3ctbGV2ZWwgaW5pdGlhbGl6YXRpb24gb2Yg
RFdDMyBDb3JlDQo+ID4+ICAgKiBAZHdjOiBQb2ludGVyIHRvIG91ciBjb250cm9sbGVyIGNvbnRl
eHQgc3RydWN0dXJlDQo+ID4+IEBAIC0xMTA1LDYgKzExMjQsOSBAQCBzdGF0aWMgaW50IGR3YzNf
Y29yZV9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+ID4+ICAJaWYgKHJldCkNCj4gPj4gIAkJZ290
byBlcnIxOw0KPiA+Pg0KPiA+PiArCS8qIFNldCBwb3dlciBkb3duIHNjYWxlIG9mIHN1c3BlbmRf
Y2xrICovDQo+ID4+ICsJZHdjM19zZXRfcG93ZXJfZG93bl9jbGtfc2NhbGUoZHdjKTsNCj4gPj4g
Kw0KPiA+PiAgCS8qIEFkanVzdCBGcmFtZSBMZW5ndGggKi8NCj4gPj4gIAlkd2MzX2ZyYW1lX2xl
bmd0aF9hZGp1c3RtZW50KGR3Yyk7DQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ID4+IGluZGV4IDgxYzQ4
NmIzOTQxYy4uNzIyODA4ZDhjMGFmIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuaA0KPiA+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiA+PiBAQCAtMjMx
LDYgKzIzMSw3IEBADQo+ID4+DQo+ID4+ICAvKiBHbG9iYWwgQ29uZmlndXJhdGlvbiBSZWdpc3Rl
ciAqLw0KPiA+PiAgI2RlZmluZSBEV0MzX0dDVExfUFdSRE5TQ0FMRShuKQkoKG4pIDw8IDE5KQ0K
PiA+PiArI2RlZmluZSBEV0MzX0dDVExfUFdSRE5TQ0FMRV9NQVNLCUdFTk1BU0soMzEsIDE5KQ0K
PiA+PiAgI2RlZmluZSBEV0MzX0dDVExfVTJSU1RFQ04JQklUKDE2KQ0KPiA+PiAgI2RlZmluZSBE
V0MzX0dDVExfUkFNQ0xLU0VMKHgpCSgoKHgpICYgRFdDM19HQ1RMX0NMS19NQVNLKSA8PCA2KQ0K
PiA+PiAgI2RlZmluZSBEV0MzX0dDVExfQ0xLX0JVUwkoMCkNCj4gPg0KPiANCj4gQlIsDQo+IFRo
aW5oDQoNCg==
