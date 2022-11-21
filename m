Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E11631AC0
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 08:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiKUHzr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 02:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiKUHzp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 02:55:45 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13E964F1
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 23:55:44 -0800 (PST)
X-UUID: e6774b253c564988bd7d8dd2cad81839-20221121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=1HwP5y1NG5ygBSRGfp+slLF6uQRdkP8l8cYYqgg9r/w=;
        b=CpgbklxGpd1SD6XHo5Ax2b0O1jq6ntRGw91HVHaJRErwZ6KqJEcRcQ0Rm1mqvdABOE4QC/jaRBS28dDuG0tdBTF7Dl5QzsX4RViNSM9IqFUPNTXhiIwmGLjBYgBMDO3GlpfnbH9YOLrDhIaIt0Px0ZlNkOYKcJ3Utso+H/btH38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:65029a79-7e77-4abd-8ece-74504d0e2ea1,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:dcb9c5db-6ad4-42ff-91f3-18e0272db660,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e6774b253c564988bd7d8dd2cad81839-20221121
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 926394719; Mon, 21 Nov 2022 15:55:38 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 21 Nov 2022 15:55:36 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 21 Nov 2022 15:55:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q21w3+HpQoGdE4ooSxUoFR59n4UXWkBEBvksvcWLAILTd4W8yUBT6MxcrG0XUuYGDfZD8UAkQ/ImPudAxIbI4X66mBmNv5/Gz7IuT06FIe2BX+13PYIbgQcMjcOLAGVime50YXTPkwxkZ6zYrNeLGZxLpV1xz2+HZZoaoAygF741HTf0mz4ATajBxE9YDJhvoZkHVIykqiDwWejTsXLY8YN1DmBP00UulzweozwzqFWfXJySSISuWoei/hb7oC7PU2QywjugpTT1Y24pt5rfZX4RjBjN384RwmXRHGZb2aM1WO8GmQoZJnscJDd7/lwGESAA/CD46JKsJ8cBmJLf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HwP5y1NG5ygBSRGfp+slLF6uQRdkP8l8cYYqgg9r/w=;
 b=MDA/+6bo2fHLmX19UGgLOc8xdxkLKKVXmA30yaxBcuYpHctJ3HOWj6G8z/A/wOc4C66g4rzO9N/3ZgECauVQSHZHOVa3862bXiUJnFwkjmUGmAMEAOGxKuowUO58BaH5e1P8bDizD94ODmRk33VnBrT1jrNI0/YhbJxy4vMq6EJV2TSFeB0fVpocmmqMXSAeqKG1I7EnbCJTlcTcCbjv3Czp+WGfoHWUHS9CGhSdKaktZeWpMk2Hqe4qwKlg8Lbo7S5GIVMjAxTavEI1HA/E2NYn9/JujgX42mTTSvAlIk/M435qVbqKot79hFdqhMmY98KgIuhLGooqoAK7EpdeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HwP5y1NG5ygBSRGfp+slLF6uQRdkP8l8cYYqgg9r/w=;
 b=R1jBQe1NeoJOWPkYSOdabwZTRUzfcXDpdGyo3YM0VXRavkJWUEA2JkmFdPcqDia1BN5gf0HusS/XDwX/XxqaMNR4QKEcDgPNjI9WDFIfF/OFAyQ/YXy+HRXUGGgBIbKkzwo06iGiFtL76qAeq1vcxM3k8/E4I2+IYVQofMidaNc=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by TY0PR03MB6428.apcprd03.prod.outlook.com (2603:1096:400:1ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:55:34 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::9585:3a04:b796:b696]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::9585:3a04:b796:b696%5]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 07:55:34 +0000
From:   =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= 
        <Chunfeng.Yun@mediatek.com>
To:     "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Thread-Topic: [PATCH v2] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Thread-Index: AQHY+/fIvByBIw4zukqpItwIuyemXa5JBVUA
Date:   Mon, 21 Nov 2022 07:55:34 +0000
Message-ID: <3862ae986b628bc649763d9201c1f40330f59555.camel@mediatek.com>
References: <20221119091541.1755640-1-yangyingliang@huawei.com>
In-Reply-To: <20221119091541.1755640-1-yangyingliang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5062:EE_|TY0PR03MB6428:EE_
x-ms-office365-filtering-correlation-id: be3abc68-42dd-4425-6d92-08dacb95c562
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bGcIgUrxQ53PocbR8YgfmvXS7cWBHIglemKicrpd/CJFck/R/HsWP8uGBvQiOtJc5kqjyW043tTssdNd9qfkqR7hN7TcY1/c9/PZpt+4rrhQS7A5C+Wbbu+ETJL3bauZXN1WzKJso8yU69PPD9qUnoz2raCs6P42pvK+Lmg6yjK9wYX/YLwrJ801IUZrcwseB0Prvb7Rv1x4C6JfPukoxAFWrkdElZec5PFK5fBcpksHHNFO0UWzUfdAXBk3IrqUzskX7P3t9nS6stf2f5Ly4w556YZtxW+srkmuRpGfkkbIYF0C0laONhv//SyFUroD38IYZJpWozlBKuMIxZvFa0a6dby+5zs5h+upcFCoXjIzAGuMEp7WzyrjDHGA1ZkFLvm5cjC0CMkvCb7cjIRnbWR3KH3ZxkzHAT6QdVZebydU+NIK/tH2cUY1Xt70seuUL5yhhVxmZxwoGGAwZaALktDPVuQshoExADZv+hMteAc1eAnLlLzqWeo2ar+J1I4tlYgE07DqErfEYKGdS6nXHcEJbTM3mpibrb2F0j/oqj8/AxrLj1Pe8m2JQDlYE12zJtns3sM+WgMKGOfnDg2XOv0pQfnonZNrSEt5jj1WS2TmbDZn5Dm+WP9THmVOG7m1UB9QvyIrBJzbJdJwnyKDEd7mwv1+1Fu8bjOXQG7HWgv1d0DGXgwU0uFVhF/lLvy1XgyiobF4ZecN90pjwbpvuTmIVaVrEBj+gGxCv36dxfY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(86362001)(41300700001)(316002)(85182001)(71200400001)(36756003)(66446008)(5660300002)(186003)(2906002)(4001150100001)(83380400001)(8936002)(2616005)(66476007)(110136005)(26005)(66946007)(76116006)(6506007)(66556008)(6512007)(64756008)(38070700005)(122000001)(38100700002)(91956017)(478600001)(6486002)(4326008)(8676002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2dmSzhkWDloVnFoWndtNnBUeVZOVXNBb1BQOUxORkdmejRpVy9xMDREb0xT?=
 =?utf-8?B?YkZ0eGRXdTZtL2RhNGI5TUdrb3ZNc0E0L2FtandIL1IvM2llNU5oMEhKRldo?=
 =?utf-8?B?b0JQcCtaNEU1d0o4bklZL08rWFVaM2d4RWZkK3Q0M3hjUTNWMDZNU1hTMncx?=
 =?utf-8?B?djlrYXA5YmdDVzVGVFVia1I3RXRmY01OSmdzaFIwajlteENoak4wNG5EK1lE?=
 =?utf-8?B?T2pTS1ZtT2N4am5Xb0UzVmtvRFRvMXRRTkJaTjc2K1BEOVVsQks5d2pkVDZD?=
 =?utf-8?B?WDNrU2U1NE1VUU8vaUp4dWoyL2xwN3VZdUxRc3R2UG5TTk8rTUcyYkdVN2Ns?=
 =?utf-8?B?d2NYeWhackFhcEsreUZWSFUwS1NHV2RpZW1EaW9GVmt4WnRiTWdLVlFWS2kz?=
 =?utf-8?B?V1ZBMlR6YTJxUVZEdHFZUDU0UmNMYi9CVUlRRmJmc054cFdkSVBZdVBldmhr?=
 =?utf-8?B?cWtCdUlINC9TTHdVQzNXRnNEOHRQU3lWNmUzcytaWUpIM2t5bnBITnowcUht?=
 =?utf-8?B?M1FBYTQ4N1hLUXdvb3c1MDZjbDB6ZVRsRk5Hc3NDU3loTWtrbGR1SnBkZEhT?=
 =?utf-8?B?dTQvbHYvWTZjTk1NajYzZU9ZYy9MWDdBOFQ4aU1oRlFlbFdMNDI2MWpiQ3N5?=
 =?utf-8?B?TVRVRlIwZlFkREVqb29YWTh1M3hHek0yTS9zbDFOaWJIUFg4clZnRC9hcW1l?=
 =?utf-8?B?RFBNMEdBbzBQNFZYbXpUM0h4U3h3V0ZTOGRnK3B2WGpDMEZkUlM1bnNxNUdZ?=
 =?utf-8?B?UGduOGxYNUZUWnNmZjhIUGIvR1dELzJYcW00cktraDI0MjhCejBrS3h2RlVB?=
 =?utf-8?B?OHlzUTdDT2ZpOTRTTmFDZkpZbjVrUkxlNGVScUtJN0p0QldTWFVuWWhDWHVP?=
 =?utf-8?B?bjJJSFNuaVlQOWtJU09QdDZ4WkNhZUh0VXZydUwwWDhHL2NXM3Q4WTAzS0tu?=
 =?utf-8?B?aExCWXNaR3JlRmZFQWYyUXozQm1FUFhHVDFHVEUrYzBFQjlOb3pLYkZGb0FF?=
 =?utf-8?B?Um9uT3kzcUJReDBiNkM1dHROZ3pqTGdja2l2SVorV2NDU3hhMkZHRWJEN0Mv?=
 =?utf-8?B?T04vWVBjTUN4NW5WOHlNN1dPWFA5RzVVcmx4OFg2VVY1OHVuWTlWWmlLTG9P?=
 =?utf-8?B?WTJOY2phK0M4a0JSSi95ZWt5NGp4QXA4QlJMSVB2Q3I0MEJ2L1dldE1jVmxE?=
 =?utf-8?B?SG9WbUpNSEVrbTNqK2R2TTVvSXpDWkxyczBIcGQwUVNtZSswM1dpRDJBd1NT?=
 =?utf-8?B?eE5POGlJVDNrTWNLdWF4YnhLeFY4K1g1bjdReVJ4cmFIcGcvejA1eFl2M2g5?=
 =?utf-8?B?OGJ5aFRCTHNFVVNGeWZaRXM5S3hDT2FHK3JENWZhdjJCSUMyWmxoQTBrODZO?=
 =?utf-8?B?VFVhSG92YzNsdVBwVUwvODVCS2ZEa0hTNDBuVVlWY2p0eEFycjVHRUpreU5B?=
 =?utf-8?B?bytVYnF4MW83TG9Rand5dEVYQmxSSHRkeCtyQThYZ1RiRFR2Y3d2b0dPYzBx?=
 =?utf-8?B?bU5IaXptQnBWME96eGlacmF5SmtmaDM0aDVzN2p6KzRHZ3RVU21nMFZRam5Q?=
 =?utf-8?B?d0tnbjVVYXdQN3dTZ1lhMXM1dzJrUTVvcFh1S1hqMU1xakwvMWwwempSNWtC?=
 =?utf-8?B?dUNHREFuNGFUdWFsbUZoQ2xObXcveDBLMlR4THprL01hQlVEQlRxL3ZRZUZ5?=
 =?utf-8?B?REVtWU5DVWczL296T3RlYzNQbk8ySXg1RFJXUHpBdlFYOVlhK1UzcTIwTGdR?=
 =?utf-8?B?dWxsWk1xOXA1cURHSVJ2bzNqanJJMzNtSXpxMm9QWHJwZjJ4RnNYc0tQQ1dl?=
 =?utf-8?B?eFBvbjRaNjRDVTE4N2w3VTl2a0wycWRMcTJrdWU2cExvQjh1Y1JtT1BKY0s0?=
 =?utf-8?B?SHpNbnY4c0QrMFl3cTlwNi9ySkNVdHJteSszWDBNVnN5Ti95cVIrWnpVWFdl?=
 =?utf-8?B?bzlrdzIzQ2NhbzZRQ0RodUlKK1paeDNuOXA3YzJ4YTdOM0dOc2g2ZTFseTdu?=
 =?utf-8?B?aGFOTEk5bFFvMDVUVm1kYTg2VGkxczIxR281L3dNSTd0enpPcmMyaFdVUEhV?=
 =?utf-8?B?S1VBSE9oM0FCMWduMTBvSnc5TEhheEx0MnJ4RUdqOFpOMDErQ2kwcVI5bVBi?=
 =?utf-8?B?Y1lBYzlnaWNlVjZCZFJCNEx5d0hMWVozRXRaWVZyUEphdWVtQURkd244cUpX?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <921CE26E71AAF543B8FA0C645B3598C0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3abc68-42dd-4425-6d92-08dacb95c562
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 07:55:34.7849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFnZkCm/93ncbLiMp3NK/8Kdtb9QrXcbp9LPVysNINXavSV0pgnmnwyfCEpd9/4DOmqYtzskeki2BgEGoCX0UGMLlPXQmMH4ZXmB2aEn93s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6428
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgWWluZ2xpYW5nLA0KDQpPbiBTYXQsIDIwMjItMTEtMTkgYXQgMTc6MTUgKzA4MDAsIFlhbmcg
WWluZ2xpYW5nIHdyb3RlOg0KPiBJIGdvdCB0aGUgZm9sbG93aW5nIHJlcG9ydCB3aGlsZSBkb2lu
ZyBkZXZpY2UobXQ2MzcwLXRjcGMpIGxvYWQNCj4gdGVzdCB3aXRoIENPTkZJR19PRl9VTklUVEVT
VCBhbmQgQ09ORklHX09GX0RZTkFNSUMgZW5hYmxlZDoNCj4gDQo+ICAgT0Y6IEVSUk9SOiBtZW1v
cnkgbGVhaywgZXhwZWN0ZWQgcmVmY291bnQgMSBpbnN0ZWFkIG9mIDIsDQo+ICAgb2Zfbm9kZV9n
ZXQoKS9vZl9ub2RlX3B1dCgpIHVuYmFsYW5jZWQgLSBkZXN0cm95IGNzZXQgZW50cnk6DQo+ICAg
YXR0YWNoIG92ZXJsYXkgbm9kZSAvaTJjL3BtaWNAMzQNCj4gDQo+IFRoZSAncGFyZW50JyByZXR1
cm5lZCBieSBmd25vZGVfZ2V0X3BhcmVudCgpIHdpdGggcmVmY291bnQNCj4gaW5jcmVtZW50ZWQu
DQo+IGl0IG5lZWRzIGJlIHB1dCBhZnRlciB1c2luZy4NCj4gDQo+IEZpeGVzOiA2ZmFkZDcyOTQz
YjggKCJ1c2I6IHJvbGVzOiBnZXQgdXNiLXJvbGUtc3dpdGNoIGZyb20gcGFyZW50IikNCj4gU2ln
bmVkLW9mZi1ieTogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4NCj4g
LS0tDQo+IHYxIC0+IHYyOg0KPiAgIEFkZCBkZXNjcmlwdGlvbiB0byBob3cgaXMgdGhlIHJlcG9y
dCBnZW5lcmF0ZWQuDQo+IC0tLQ0KPiAgZHJpdmVycy91c2Ivcm9sZXMvY2xhc3MuYyB8IDYgKysr
KystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Ivcm9sZXMvY2xhc3MuYyBiL2RyaXZlcnMvdXNi
L3JvbGVzL2NsYXNzLmMNCj4gaW5kZXggZGZhZWQ3ZWVlOTRmLi4yODk5NTBlNWZjZmIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL3JvbGVzL2NsYXNzLmMNCj4gKysrIGIvZHJpdmVycy91c2Iv
cm9sZXMvY2xhc3MuYw0KPiBAQCAtMTA2LDEwICsxMDYsMTQgQEAgdXNiX3JvbGVfc3dpdGNoX2lz
X3BhcmVudChzdHJ1Y3QgZndub2RlX2hhbmRsZQ0KPiAqZndub2RlKQ0KPiAgCXN0cnVjdCBmd25v
ZGVfaGFuZGxlICpwYXJlbnQgPSBmd25vZGVfZ2V0X3BhcmVudChmd25vZGUpOw0KPiAgCXN0cnVj
dCBkZXZpY2UgKmRldjsNCj4gIA0KPiAtCWlmICghcGFyZW50IHx8ICFmd25vZGVfcHJvcGVydHlf
cHJlc2VudChwYXJlbnQsICJ1c2Itcm9sZS0NCj4gc3dpdGNoIikpDQo+ICsJaWYgKCFwYXJlbnQg
fHwgIWZ3bm9kZV9wcm9wZXJ0eV9wcmVzZW50KHBhcmVudCwgInVzYi1yb2xlLQ0KPiBzd2l0Y2gi
KSkgew0KPiArCQlpZiAocGFyZW50KQ0KPiArCQkJZndub2RlX2hhbmRsZV9wdXQocGFyZW50KTsN
Cj4gIAkJcmV0dXJuIE5VTEw7DQo+ICsJfQ0KPiAgDQo+ICAJZGV2ID0gY2xhc3NfZmluZF9kZXZp
Y2VfYnlfZndub2RlKHJvbGVfY2xhc3MsIHBhcmVudCk7DQo+ICsJZndub2RlX2hhbmRsZV9wdXQo
cGFyZW50KTsNCj4gIAlyZXR1cm4gZGV2ID8gdG9fcm9sZV9zd2l0Y2goZGV2KSA6IEVSUl9QVFIo
LUVQUk9CRV9ERUZFUik7DQo+ICB9DQpQbGVhc2UgdXNlIGdldF9tYWludGFpbmVyIHNjcmlwdCB0
byBmaW5kIHdobyB5b3Ugc2hvdWxkIHNlbnQgdG8gYWZ0ZXINCmdlbmVyYXRpbmcgcGF0Y2hlcw0K
DQplLmcuOg0KLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIC0tbm8tcm9sZXN0YXRzIDAwKiB8
IGdhd2sgJ3twcmludGYoIg0KLS1jYz1cIiVzXCIgIiwgJDApfSBFTkR7cHJpbnRmKCJcbiIpfScN
Cg0KVGhhbmtzDQoNCj4gIA0K
