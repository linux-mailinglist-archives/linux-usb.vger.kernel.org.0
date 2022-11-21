Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B1D631AA2
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 08:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiKUHtn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 02:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiKUHtm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 02:49:42 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E1831DD2
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 23:49:40 -0800 (PST)
X-UUID: 90eccdf9cb2847a2ac8330ed7849f701-20221121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CYZsdH3SytxxFpZ+GMVPsdNxleVqCeCoB+HsydTDI5A=;
        b=bsiBj4nEGzCWXMaEZj0uvOTyL/0Y71xQR+SiSsiZGvwCbdfzuo/2vne+jAQgHB/b+gd2/TAZ+2CSJzYzU5PDTZGL8mdXLUFoVZugBUJEDG4uV01+iVD4vDeAsaac4NxkT+hIa2oyhp4AwBLBoaMplpK9ydRrgQIAxYWUTptySHc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:fddd73b2-53f1-4a98-9b6e-25bb24cb14bd,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:-5
X-CID-INFO: VERSION:1.1.12,REQID:fddd73b2-53f1-4a98-9b6e-25bb24cb14bd,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
        elease,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:f689c5db-6ad4-42ff-91f3-18e0272db660,B
        ulkID:221121154937NB586O02,BulkQuantity:0,Recheck:0,SF:38|17|19|102,TC:nil
        ,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 90eccdf9cb2847a2ac8330ed7849f701-20221121
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 681183528; Mon, 21 Nov 2022 15:49:36 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 21 Nov 2022 15:49:34 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 21 Nov 2022 15:49:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRqiqVDdffW/49Mh9QhXaNizZdnzKkPKIh42qaGLmEAkS3Lak1JgdFDSJXaJKf4ka2IMorI5oWSFpZKoW9IjgIuhwogFtm3EHaMsc2IU3ZVWSDFc7ABovbgUW0+zT5ESkobl974wT3IfxFZ+XvdnR5GpidL0NzTv5mfB9whVoKm+v0F8ytfqJbrn1oXNul9xCiOZuJ/BEp9RuzyvRb7MVIfVA4AnGy+jhwkGrHVYN+RQ6ez6TfPQiMbPe+z8tYoZv/r/MhexpFUqaCK7e3f6XG/BKYdwcRvkSf+MgRu7S6+d4od3x/RiTWI/DBvViD+c63s/DtbRtPOMKpPlIE7Z5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYZsdH3SytxxFpZ+GMVPsdNxleVqCeCoB+HsydTDI5A=;
 b=iYA667FF1MYV+LmeHvuewifUzyCwIaK1ewvWX9QIJ7pdOXJ81TfcXTiPYdHs9f4B93PkaK9ugPj724y1kTUwHNyJiLtGd+UzM2oZIAyfIyyIKdmN1jVcda9cX9cGbPwSmpOR6WOPxo3qSdE9aZnTrQ9Aw/GiH5E21/kI/Ivwi6oA2EKi/50gbISmMNvpjQnt4hdDHAw9U/GQGnXivCXi5TtM9UUlf8UXzVn+ffXz1ttyVEXFbhtSMbVnNJKH0eoQlZ4VSt0TddQP0CO2UrJybfHmxLKF/itdjQL6WYm9eNDxvQn93FKPhdYxHqL8WhMog2iJ/AI80A/IaVqEqxbu0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYZsdH3SytxxFpZ+GMVPsdNxleVqCeCoB+HsydTDI5A=;
 b=TuyhLgbeiQu87fyEW6z8L+50zz0MThoqimzfGKtvtNvN2UF7T0U/lZedRnYis1X4otTB9vYFLEGZWfk+HdWN8f8fgztGU6ZhQYESJCBoiEa4CHgGIqttFWY986xrzr7j6KN7y0l/vmPGiq78bxLHd0Uvzpkq67Fi1Rf0Q9WiGZE=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by TY0PR03MB6428.apcprd03.prod.outlook.com (2603:1096:400:1ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:49:32 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::9585:3a04:b796:b696]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::9585:3a04:b796:b696%5]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 07:49:31 +0000
From:   =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= 
        <Chunfeng.Yun@mediatek.com>
To:     "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Thread-Topic: [PATCH v2] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Thread-Index: AQHY+/fIvByBIw4zukqpItwIuyemXa5JA6SA
Date:   Mon, 21 Nov 2022 07:49:31 +0000
Message-ID: <097dc06a02377bf67e4d67a016060dbcd06f4798.camel@mediatek.com>
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
x-ms-office365-filtering-correlation-id: c7166b1a-d30f-46fa-b6a9-08dacb94ecfa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Ktqxat5G2G947QUFJivy1gG5U5r0LGnpSiTceCV3YWvg7beSwJqlFol7wAhvRh96MV5yru+VLzuHu+f2inh0avxulxI5v2phGNWDQ2a1FCpJXL1L+ssYmVEOvATq++pz8TwDneoRbgVx3V9EB5WSEvaV5JJ1beMCC4qHES4qgLOa+oRryNlrzE7D2XS5nskhnXPiCDOP16qzxMXXnEnlUn1vGfyL4i7VbpM6TooOQ0SXOzQeIjz3r1wuX+RhNXx/BPu1uzwF2/5z8UkC3CBg0NaMYOMwhkl2kz7TBuSxv+R2LhZiGtdRih1EUFBxx2eL6v5MZnJunIF/37PaaslK0IE6Y63PR5eHwH9E3LAQfw0bkCfs0NO8pAV7v4O4PipjGUwpZzMs1hyK06X/dN61+p5jbDPIcWWC7xmibViFlK0RAj1rOWMrk76+SqvuzTec/DhmmxhEtFFkkS4zsz8NMjUxM/VTLAV60XcEpSAwZGyLAQgY+P6FTnR1Dfp/uXxT2STTShIquuxcfopd7wdgeTl2M+lSaUbENBWCoB9NcM3LncqLw3uuBRM67VG0EBDQLKCSbg4pdAphefoOCw1RRANFC7tBGv4eJCfDuR/lhWwqD1J083P63rInrubzzXgAcxasOa1boeKaV0motTx9WGATW3XvZF9HzCQRW1EozJjnfJSowpcGH6IdXTyJ7qamG73o1PegbqPecqKR4cfhgGrLVE/LUO2zvVPnNcFpDk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(86362001)(41300700001)(316002)(85182001)(71200400001)(36756003)(66446008)(5660300002)(186003)(2906002)(4001150100001)(83380400001)(8936002)(2616005)(66476007)(110136005)(26005)(66946007)(76116006)(6506007)(66556008)(6512007)(64756008)(38070700005)(122000001)(38100700002)(91956017)(478600001)(6486002)(4326008)(8676002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGZnaUozUW9MYXU0a2pycDRPT0NVU3RjOGhydDdpdFlyM3E1WXpMcmdIUFBK?=
 =?utf-8?B?cUxsbnh2RHp4WUg1N1l1WjliaG1uNTluaDNsMVpWWEZLZU1FY2hGM0Vwc2Q3?=
 =?utf-8?B?NE9PVzk4K3BTSzdZYWdNL2JtSkFxankwcG9yU1dmcE5BQVpiWFkxK1VVR3Bq?=
 =?utf-8?B?SEtWd0JaNWkzcUE1ckc1NmtISDdqN0tpcGhrYUxydXQ3ZWZQTnpxaFNJb0JO?=
 =?utf-8?B?Wks4Q2hMVUsyZGswY3pTNFhDdVk4NnJEK3Avek1pbWVOaGx5U21QbjFEc2I2?=
 =?utf-8?B?cXF4WmJXVGFoRUFSbS83RzU1eUZYanZGbEt2eG5JSm8xdWs2RWpKdk9kSDAr?=
 =?utf-8?B?dnBRRnN0WUFRMXAwWXRLb3k2VWsxc0FRdkRZMWFjcHF4UVhWdkxvUHpFUzJk?=
 =?utf-8?B?Z2pWTGNIdGN2c0tCQXlKbzMweHFaK1I5NWVPNWgvRm82V2hDejdMOHpJT0k0?=
 =?utf-8?B?SlF1VytOVGlpTXVhanBlK2FhM0FURzhpb3hYTE5EZ1NDQ3RnL2o5cHNWelpR?=
 =?utf-8?B?TkFxMkpuaWZVUlBlZGpkZGVpNUF5QjNHUWl3QmVpYkJLczYyNEhENFdNRW5t?=
 =?utf-8?B?UG43SE55bWIweDFQOU9OeCtGZHdpSU0wVDEza0U5MFZDejUzclF3UXhJT2pT?=
 =?utf-8?B?aXlsOW40WHN1cnFmNWVhelg4ZURLUXNkQng1M0xpUTJXYXJRbXBON2svUHdi?=
 =?utf-8?B?UHU4Ujh1eEZ5cHF4TVIyODc2aGNGUzAyOSt5VzJzbWVHTVJxR3ZvU0RDUkVs?=
 =?utf-8?B?TUs2OUtvVFJ1NVV5YWVGME5kMk1UcUdiQzZ4UUZ1NzUrWmVDOHI1UFRJeFIz?=
 =?utf-8?B?czlIRXo1WjJ2KzNDcHc3Mm1uekxrTHJKVGc3WUg1SGViS0dhaUxmeFpNeU16?=
 =?utf-8?B?LzdjaVVucWhYcXdUc2QxQlYwRjVmY01BSHF3VDZvMDlOSXVnUUw3UTFlejJY?=
 =?utf-8?B?TTczOER4WXJQUFYvbExYdmVSQWdFdEtabEI3Nm1na2h2ZG5ZUGVCSXZ6V0M3?=
 =?utf-8?B?blc3Q2dWWTY1ajN1TElFbkpSdHkwaVkzY0Mvb3VrOGk1NlIxUHdOSzZMcVVy?=
 =?utf-8?B?aGVkcUlJVXY0d0IwODg3TTdJbDdBaUdjQzUyZjBZd0ppZllMcDZFcXZxQXRn?=
 =?utf-8?B?Uzkxc1JIU21oeWN5TW44QU5adS81MkxZYXBKQmRJbmk2Vk9tc0hudkdxMHNw?=
 =?utf-8?B?ckZjMnNmeWN3azY2a1JuSW01QnRvVTZKL0dTVzM0THBobEV0SU1taEJoQVhU?=
 =?utf-8?B?QVRJL0FCZkdnNUx5MzRoZ1k2OWJkWWxJM0N2cHRSR1QwNkcxZ0E0bjZ5aXox?=
 =?utf-8?B?MnpQSTFlNFJWdkorWWZNTmhnUzVhcWJ5VUVTZWYvNjBVQUcvUGZ1KzcwMFVn?=
 =?utf-8?B?TmF6TjljYk1NZHluZlhjMCtxMVBQdStLNkxJYUIvam43cm9KbnFqSFJwV2xt?=
 =?utf-8?B?SUxFalMrdU54VlpOSWRxRHkvMmhJVFpZUDEreVl2RHM5L0hjS1ZVSFdHdGZi?=
 =?utf-8?B?dmc5emUzd0R4R0IyV3pnYjd3eU5wSk1PSlZuclk0L2xqSUtKVUE2Y1lTUDd3?=
 =?utf-8?B?SVcxdmR1c0tQRGZKUm1HNlFUR0ZEL3pOY3NDSllBTjJRdzN5bzRtbjZqRWs1?=
 =?utf-8?B?QVNOS2VtMG1oeWVHa3B5S2o0ZXN4WmxYMzVuWGh4OGlFdnhJZHRPSDRqWFoz?=
 =?utf-8?B?M1dqZE41RWpNcElqQmk3QlJ2T1JjSUxJUmMwWjZnOCs4ek9lOU1UZWtWbjhZ?=
 =?utf-8?B?alAwSjZGU1cwTEhCazltdDBxWUFQVDZwODY2TWlyaDFET3NGMU9MTTY4VkpE?=
 =?utf-8?B?aVdHU1h6V0hJUUFtTEd1bXRXUkpScWNGbHpzZ1VkY2VSZ1QzZzQ3cTQwMC8y?=
 =?utf-8?B?WFZZYjNqNDY2ZWdER3RhWS9qQ1UxYmFwVnpoYUJqWTBadml3Z3ZBemhsL0VF?=
 =?utf-8?B?UEc5Qk54NWlRYnhjeVo4aHl2a0Z6MWRQeHE5bXJqUExVYW5ORDZJSjFlR1Fn?=
 =?utf-8?B?VEkyVE5kTkl3cHoxZEZldytjaDl5dHJKak5UcGthcUk4TlgyT3NpNkhKM2du?=
 =?utf-8?B?b1RUbndrVk8xcllXNmtoSWpiQmhDWjJWa1VDSnpYNjNnV0JJU25pUWRnNEEw?=
 =?utf-8?B?M3BmaysrK2xkV1BIM0JPVWxJaDhQM1I5eUhHZ3dzRWdvbGs1UjdBQ1QrUFl5?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5012956A6178C845BBD984AAF31FF1D5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7166b1a-d30f-46fa-b6a9-08dacb94ecfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 07:49:31.7642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdJvAsBYVTQ2Lcm8eoKcPHp1wI9ITQ5nuAxoyass+ILDSkGRvdXFxaqzsRAqMh1nK+92Kq1ThxfzJwE7arvhwoPoI8jzP9ggIEDv2f8yps0=
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

T24gU2F0LCAyMDIyLTExLTE5IGF0IDE3OjE1ICswODAwLCBZYW5nIFlpbmdsaWFuZyB3cm90ZToN
Cj4gSSBnb3QgdGhlIGZvbGxvd2luZyByZXBvcnQgd2hpbGUgZG9pbmcgZGV2aWNlKG10NjM3MC10
Y3BjKSBsb2FkDQo+IHRlc3Qgd2l0aCBDT05GSUdfT0ZfVU5JVFRFU1QgYW5kIENPTkZJR19PRl9E
WU5BTUlDIGVuYWJsZWQ6DQo+IA0KPiAgIE9GOiBFUlJPUjogbWVtb3J5IGxlYWssIGV4cGVjdGVk
IHJlZmNvdW50IDEgaW5zdGVhZCBvZiAyLA0KPiAgIG9mX25vZGVfZ2V0KCkvb2Zfbm9kZV9wdXQo
KSB1bmJhbGFuY2VkIC0gZGVzdHJveSBjc2V0IGVudHJ5Og0KPiAgIGF0dGFjaCBvdmVybGF5IG5v
ZGUgL2kyYy9wbWljQDM0DQo+IA0KPiBUaGUgJ3BhcmVudCcgcmV0dXJuZWQgYnkgZndub2RlX2dl
dF9wYXJlbnQoKSB3aXRoIHJlZmNvdW50DQo+IGluY3JlbWVudGVkLg0KPiBpdCBuZWVkcyBiZSBw
dXQgYWZ0ZXIgdXNpbmcuDQo+IA0KPiBGaXhlczogNmZhZGQ3Mjk0M2I4ICgidXNiOiByb2xlczog
Z2V0IHVzYi1yb2xlLXN3aXRjaCBmcm9tIHBhcmVudCIpDQo+IFNpZ25lZC1vZmYtYnk6IFlhbmcg
WWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+DQo+IC0tLQ0KPiB2MSAtPiB2MjoN
Cj4gICBBZGQgZGVzY3JpcHRpb24gdG8gaG93IGlzIHRoZSByZXBvcnQgZ2VuZXJhdGVkLg0KPiAt
LS0NCj4gIGRyaXZlcnMvdXNiL3JvbGVzL2NsYXNzLmMgfCA2ICsrKysrLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL3JvbGVzL2NsYXNzLmMgYi9kcml2ZXJzL3VzYi9yb2xlcy9jbGFzcy5jDQo+
IGluZGV4IGRmYWVkN2VlZTk0Zi4uMjg5OTUwZTVmY2ZiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9yb2xlcy9jbGFzcy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL3JvbGVzL2NsYXNzLmMNCj4g
QEAgLTEwNiwxMCArMTA2LDE0IEBAIHVzYl9yb2xlX3N3aXRjaF9pc19wYXJlbnQoc3RydWN0IGZ3
bm9kZV9oYW5kbGUNCj4gKmZ3bm9kZSkNCj4gIAlzdHJ1Y3QgZndub2RlX2hhbmRsZSAqcGFyZW50
ID0gZndub2RlX2dldF9wYXJlbnQoZndub2RlKTsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+
ICANCj4gLQlpZiAoIXBhcmVudCB8fCAhZndub2RlX3Byb3BlcnR5X3ByZXNlbnQocGFyZW50LCAi
dXNiLXJvbGUtDQo+IHN3aXRjaCIpKQ0KPiArCWlmICghcGFyZW50IHx8ICFmd25vZGVfcHJvcGVy
dHlfcHJlc2VudChwYXJlbnQsICJ1c2Itcm9sZS0NCj4gc3dpdGNoIikpIHsNCj4gKwkJaWYgKHBh
cmVudCkNCj4gKwkJCWZ3bm9kZV9oYW5kbGVfcHV0KHBhcmVudCk7DQo+ICAJCXJldHVybiBOVUxM
Ow0KPiArCX0NCj4gIA0KPiAgCWRldiA9IGNsYXNzX2ZpbmRfZGV2aWNlX2J5X2Z3bm9kZShyb2xl
X2NsYXNzLCBwYXJlbnQpOw0KPiArCWZ3bm9kZV9oYW5kbGVfcHV0KHBhcmVudCk7DQo+ICAJcmV0
dXJuIGRldiA/IHRvX3JvbGVfc3dpdGNoKGRldikgOiBFUlJfUFRSKC1FUFJPQkVfREVGRVIpOw0K
PiAgfQ0KPiAgDQorIEhlaWtraQ0KDQoNCg==
