Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E0668D2F3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 10:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbjBGJgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 04:36:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjBGJgt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 04:36:49 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E2429E3A;
        Tue,  7 Feb 2023 01:36:39 -0800 (PST)
X-UUID: e8492bc4a6ca11ed945fc101203acc17-20230207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ewJRefEae3eUsRaFCzXu83iwuOn7Zp5byPi9/1QXQxo=;
        b=L+oxS8bGRhi11tmzLfGp753jyeOqpqNebfhu+SVZ4sA0AzNa8CyJiKPE/lomUoW5We8zHzDsMHpB8AcdDh/eZ0l79qXS4hoRDtGoqUsFEmDrPgnaW9vGK0b3RDqs4r9MSr32+izVxdptzck05o6apNMRn6tjnTZHwzIjEcZEohE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:d0c15306-c7d2-466a-a206-1c5f48129b89,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:b265b7f7-ff42-4fb0-b929-626456a83c14,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: e8492bc4a6ca11ed945fc101203acc17-20230207
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1619163987; Tue, 07 Feb 2023 17:36:32 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 7 Feb 2023 17:36:32 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 7 Feb 2023 17:36:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja105xrvWunrN0ARBTm9lYYTeP/DbRHHh+ffNpbt/3KZOW9Oqs5gzth4ceL4jDKR/4c8qDGQd4JKKmx0a2g+hlDaRCzSNwlT5c07zYYmnT5j5tHvT8TR89LQya53VmkYTIF1flfHsj2c92HanXTdHmx5VHESjEcs/6Boa/2tZD19piEQu+BBYgn30xRgZmaxkYEJZg4G8zEFuBvixdZ+HDcoJLnfmReg2C/s0LN1Ex19HPAAX6Sk+l6++Uesq8+0wdtlHVBUS2ICk0+Okgk0Ur3cgH7ZlbVwItM7Ov4ULtaUaynWzxiByBR2K7AFgmuJtlk1CfmOANOsmx0Jy/6+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewJRefEae3eUsRaFCzXu83iwuOn7Zp5byPi9/1QXQxo=;
 b=RzTj+uojhX5bXdiQwPDJGdzENGIBgwepdslUKggE/TzzC+7MuNrAGQO3Prf+sE4oKlXC9/8+NMXauaheT49TgP4uAXf551TM3oCDpUa5xXRYHU8gx+BSJ3/b7sXfs+k5QCte31Vb1vX2uEYGKrLxEfPS3mV9fhY0kJK5UXsS/Hvh7l354YO48/lnBSqESOK9siNfSHcgYhYM77hhRC0l34xlbWhUSzREmu6TFQaX2XRY84icQ/bBf4SJsuLZQ9qwlar//sBZ96H1gAznpgPKjIHdsCPmBZhbwyuwdzuqBXFKjBcehCJuhH4q9GMwi9NCf44opEkTo1fq8iGcdqEDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewJRefEae3eUsRaFCzXu83iwuOn7Zp5byPi9/1QXQxo=;
 b=DUtvyFfkFXkuZtgetmx4FUivumUOtYtP7/a9v3LIbJb7gWzR8OsgBf4OBPD5GNwxGfNLrK5NjyWg4SOq+adLtW7lwLowhpD+NQgysD7NIAsy/sbefKiaFuts4sF65VNnCdwUGYaMxl05xEfjdaVt6E53jKq1Qe8RgiJPiuTimxo=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by TYZPR03MB5680.apcprd03.prod.outlook.com (2603:1096:400:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 09:36:28 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::5e9b:f4cf:8d7f:60d1]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::5e9b:f4cf:8d7f:60d1%3]) with mapi id 15.20.6064.034; Tue, 7 Feb 2023
 09:36:28 +0000
From:   =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= 
        <Chunfeng.Yun@mediatek.com>
To:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= 
        <Macpaul.Lin@mediatek.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     =?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= 
        <bear.wang@mediatek.com>,
        "wenst@chromium.org" <wenst@chromium.org>,
        "macpaul@gmail.com" <macpaul@gmail.com>,
        =?utf-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?= 
        <Miles.Chen@mediatek.com>,
        =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= 
        <Rex-BC.Chen@mediatek.com>,
        =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= 
        <TingHan.Shen@mediatek.com>
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for
 mt8195-demo board
Thread-Topic: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for
 mt8195-demo board
Thread-Index: AQHZIOhZc/SzkIQRYEqlkWZSp5r8Na66LlyAgAk/HYA=
Date:   Tue, 7 Feb 2023 09:36:28 +0000
Message-ID: <73a5d74b658456d7bd3efdeab0804bc3e7c74f15.camel@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
         <20230105092809.14214-3-macpaul.lin@mediatek.com>
         <ac19ed51-75a5-58d7-5f1b-6faf9ef2b3b4@gmail.com>
In-Reply-To: <ac19ed51-75a5-58d7-5f1b-6faf9ef2b3b4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5062:EE_|TYZPR03MB5680:EE_
x-ms-office365-filtering-correlation-id: 936da6d9-fb53-4949-99cb-08db08eec9d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JYMa8ABzw8pBJdn5pCTPsH4ksmtia4uOfJXBuCwKFw2NYByQN4myWWgKNjdIZmu80DzU6Ki06OfwfqE7dM4nM0ruAuliXyLiB6voUajLPiU0tv5QgOjlC3HOkhazTvkZLweE08JU31amJFU/Xw1nASRjVhw5svvsq+/MyqOUeCqX9r62Tlu95vC5sMiwBmvhT65MF3TWJpcSXcqkOyAbBlZKK+mDoqXfQPAz0nlX2tv/pU72eB+X8lCWJUnVwtC87M0UbZplAMVnhZNANJSB+6hrGco9nc8ulEREzJmF8blyWyiNjx3VcIYXWTVGPXLbJbkAOskpk3W78mxMtaWXBToHA6CUXNhSRvCRKankJrCKqEw8gyU88+G2/Gjz7xnhviGibTkDmSxHbr3koH9Fd43NsGc9tI83TsHQe2q38kwrL85LTEuWQ2+YdqgU2zM64IkMcYmP8Y0IgykFWjFTOsP58tQHdRiK23MM8jdYr0YEIrfTYQEC0GWx+U1gRAfhIcYrvzCBMD7QwCaYgORSaRqUYJgpxiHoozDtdEaHKkgviOmf+SpNh/q7/zZYe9u8+DbW1d2Cunkhin2IErldwtpO3X1InXhSxgFk744c5JNdiCnT9jk0M1A4mbr/FQY9xIGVkQzCfE44X/aVUAn8fsOLCtdXPXUdJnwupheTl2PvfJMIa5PQtpcUQLv913P1rTqdstresygMyUiMT5TTLJoVlIyXQK2RhvWboQLmdFG4OCpN0BPKh26KR0jRJ+ZfJKJeCUSx6dg0oc3nBD7DsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199018)(36756003)(85182001)(41300700001)(6486002)(66946007)(71200400001)(316002)(54906003)(6506007)(107886003)(478600001)(110136005)(38100700002)(5660300002)(66446008)(53546011)(2906002)(66476007)(76116006)(91956017)(8936002)(66556008)(4326008)(64756008)(8676002)(26005)(6512007)(38070700005)(83380400001)(122000001)(86362001)(186003)(2616005)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFh2aVN5dURTUGZGSm9tYmlSYWZ2Uk85Nmc5NEJoZmQ0WFNmcU1VcFZpaTZj?=
 =?utf-8?B?NFQyTzhtWmJXblJTYTcyaDR3MnlFU0ljWXpNQ0Y3b2ZjNGF4QjAzYmtjMWUw?=
 =?utf-8?B?NDZRMUgxa1IxRW5XYmcrTExGN1gxM2N1OU16Ukd5MmFha0hEcG9XcWdpVitU?=
 =?utf-8?B?S05kY0VKUDMvY3V2OElpL2MyU015c1AxeDV5RDlZNFgwc2xMMWJwSmhOcVRD?=
 =?utf-8?B?Rkg2ZkQyRTIrejJkNFhuMGttK0ZYWktTVUh3M2JVblJXTTZaZ1dGc2tPNkpM?=
 =?utf-8?B?bllUKzhMUkE5MG9hSUZTR0JTbnRtSzVRZ1BXbWNXK3pUT1RzalVPR1hObXdJ?=
 =?utf-8?B?SGxYRGVaeGE5OGZxZWFEbm5HMUNBOXJsTmJobE1KcWdsa3J1bHhRU0pZLzlK?=
 =?utf-8?B?RlBlQVJyTjlVRXlVZ1YrRGlIaDJVdnlYUWhLc2duRDUxYkdxTi9ubDJrTGc5?=
 =?utf-8?B?REpZOHRRSktaTm9JMk5MQkdqV3lNOE9yeFNJVDEzVWIwaFBrc1h0Rk9ZZW41?=
 =?utf-8?B?N254V096VTJIZmthYlFoNldiU2k3UnpKVTcrSWpVVTYzOXhtZUNWVjJ2c2Rp?=
 =?utf-8?B?TXA3NGdleGo4QVZXWlQ3Yjh5RXpXQjhseUFjYWRFdjVNcjBjbHQxdUVKOUFZ?=
 =?utf-8?B?NTBQUEM2dTdKcW9yNDNCeFNzcWE3RE1qQmRGVW9Sa1RlUmpaT1lwOTYrb2Zy?=
 =?utf-8?B?TXBHSHE2NERGQll2MkFyQ1RFMGF2aVdQVjJ5ZjR6ZzhhenlMZzNieWdhS0dF?=
 =?utf-8?B?RlhXeGhyL1NBZTlYZERFOUtld0Z4OFExNC9aKy83bVFNbm1zRFhlRko4bGp0?=
 =?utf-8?B?RnozeW1QblFEOVFJajJYbEZpLzNxRnY0a0t2OXdMcE5TbEFMOWhnRzBqOTZi?=
 =?utf-8?B?c0JQNW5wcWZiVzcwRmIzcGRiYnhIaEQybWVkdk1maUJTbW9ob0VCcmpRRDVz?=
 =?utf-8?B?bUc3czJ5bEMzUzJyenBHekhaLzM4MGY0MTB5VFJZYk02VEJCcW9xZXJVZUtT?=
 =?utf-8?B?OGp3SjdHMjdkZHF2dTR4Ym9LZDhtYkJHcUZNQ1JKdzhlYnRLekEzOXZLR0dv?=
 =?utf-8?B?dTNQTGxYRE5hWDAzRWlNaFRqam9SNGViZ2g1WU5XcGNoWFlUTEwyL2ZWVTlT?=
 =?utf-8?B?ZUdTMWxlakVBNXpNdGh2Mk1jTFk1R1o3YkVaanNEdGtzMkRsVEJzNDdyM1NB?=
 =?utf-8?B?MjFqSzl0Z0kxdWpudnZIUEx5azE1YzZHdlZicXAwaE9BSVRHajZuQkJRbGRM?=
 =?utf-8?B?NE1VUXk2TlpUK2tuaGlNeGdsTGhNWHhBcUpRa1RnYzNQSjV2dnYycDl6U1V2?=
 =?utf-8?B?aUhRQ1g0WFNCbjhCclZVc1NRUnRuZzRXTStDUTFuZ212dXJYcmhGTVZ2VCtx?=
 =?utf-8?B?K0ZNd3ZpeEt5UktaNlRmU1NicU8wSzF1dUlTeFlxWnp1cVhrSk1IWksrQjI1?=
 =?utf-8?B?a3F6c21zaEZTU0laK2cvL1BnMnZYdjRmOGl2eElqOW16blhJQXhnZjlQUXJx?=
 =?utf-8?B?aEMrckFTcCt6eDVVNG1Zd204ajJIRE9SUVJRWXZLOEhaa0xmVXowTkpNYzhy?=
 =?utf-8?B?c21BaHFHYzFyaWZhNm1TTGQraXdBaE13TktFMUdERGhEbEtDOHMva3J6ZkJv?=
 =?utf-8?B?NXdoR3hCQXZ5VkhQV1NxVEF3TkhhRDZCeVZoeHZ3bHptRm5XSmRhb3dUdUxB?=
 =?utf-8?B?QnYrLzE5U0RxSVU2eFpMSVVjRVl0anJxSGlmWit0Zk95ZUFvVzNQTFlrM1Bl?=
 =?utf-8?B?Qy9hdDJWRVgyYU92VG1qemVjZzBtZUc3bEVpRUd0dUlGQmNrUHRTbFJwUTBN?=
 =?utf-8?B?Z2RjenQ3aHBWQ0ozUmlzRGFrcHNoeWZycVhrSDFCSlgxS25DMHMvZzBlR3NW?=
 =?utf-8?B?RWIvL2JmeXZuczZPc2lGYmpaNlZCd1ZMcFVuT2VyM29vbmJkSHBYTmVCUmdE?=
 =?utf-8?B?R2U3Q3BiZlk1L3cyYWVoSXFqeW9SQ3o3Z0k0MXg2RUdGL2p1alorWW83bWZR?=
 =?utf-8?B?RzRUeXZ2bzBJenZ3MzhsNnlMLzNQaFY1am11YWNBS2FQVE13cmNOeWdEWUJt?=
 =?utf-8?B?ZlNEeFB6RkJoc3R1OURFR1ZNSkcxMXNEUW4zSTlBVkhiMHhEZmloellNZGZZ?=
 =?utf-8?B?ZHIrUmVaL25PaFVRZklLMUhpd1R2RXBiTWhlbU9BWGNsVm1KVHU5cXB0QmlZ?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE1364D7DE40534C9B82E281E97168DD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936da6d9-fb53-4949-99cb-08db08eec9d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 09:36:28.4005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Apm4c2eTzElfiUBOFVaXw5sS5bpt+9XMJ0wrOS/fFJsB1xkHQDDzUqexjoudkMiSmNpN0JvNE1WEjRbqvIB6R2TmhDJA5PoUWQeV95xCZj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5680
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        T_SPF_TEMPERROR,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIzLTAyLTAxIGF0IDEzOjI0ICswMTAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMDUvMDEvMjAyMyAxMDoyOCwgTWFjcGF1bCBMaW4gd3JvdGU6DQo+ID4gMS4g
RW5hYmxlIFVTQiBkZXZpY2UgcG9ydCAoVVNCIHBvcnQwKS4NCj4gPiAyLiBFbmFibGUgdTIgc3Bl
ZWQgZm9yIG90aGVyIFVTQiBIT1NUIChVU0IgcG9ydDEvMi8zKS4NCj4gPiAzLiBDb25maWd1cmUg
bXQ2MzYwIChUWVBFQykgcmVsYXRlZCBwaW5jdHJscy4NCj4gPiANCj4gPiBOb3RlOiBGdWxsIGR1
YWwtcm9sZSBzd2l0Y2ggY2FwYWJpbGl0eSByZXF1aXJlcyBUWVBFQyBNVVggZHJpdmVyDQo+ID4g
YW5kIGR0cw0KPiA+IHVwZGF0ZSB3aWxsIGJlIHNlbmQgaW4gc2VwYXJhdGUgcGF0Y2hlcy4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYWNwYXVsIExpbiA8bWFjcGF1bC5saW5AbWVkaWF0ZWsu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUt
ZGVtby5kdHMgfCA1MQ0KPiA+ICsrKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgNTEgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS1kZW1vLmR0cw0KPiA+IGIvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxOTUtZGVtby5kdHMNCj4gPiBpbmRleCAwN2E4NjRjYjhiNTQuLjIw
N2JiNWY0YzU4ZiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5NS1kZW1vLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ4MTk1LWRlbW8uZHRzDQo+ID4gQEAgLTEyLDYgKzEyLDcgQEANCj4gPiAgICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9pbnB1dC9pbnB1dC5oPg0KPiA+ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bp
bmN0cmwvbXQ4MTk1LXBpbmZ1bmMuaD4NCj4gPiAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZWd1
bGF0b3IvbWVkaWF0ZWssbXQ2MzYwLXJlZ3VsYXRvci5oPg0KPiA+ICsjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvdXNiL3BkLmg+DQo+ID4gICANCj4gPiAgIC8gew0KPiA+ICAgCW1vZGVsID0gIk1lZGlh
VGVrIE1UODE5NSBkZW1vIGJvYXJkIjsNCj4gPiBAQCAtMzgwLDYgKzM4MSwyMiBAQA0KPiA+ICAg
CQl9Ow0KPiA+ICAgCX07DQo+ID4gICANCj4gPiArCW10NjM2MF9waW5zOiBtdDYzNjAtcGlucyB7
DQo+ID4gKwkJcGlucyB7DQo+ID4gKwkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzEwMF9fRlVOQ19H
UElPMTAwPiwNCj4gPiArCQkJCSA8UElOTVVYX0dQSU8xMDFfX0ZVTkNfR1BJTzEwMT47DQo+ID4g
KwkJCWlucHV0LWVuYWJsZTsNCj4gPiArCQkJYmlhcy1wdWxsLXVwOw0KPiA+ICsJCX07DQo+ID4g
Kwl9Ow0KPiA+ICsNCj4gPiArCXUzX3AwX3ZidXM6IHUzX3AwdmJ1c2RlZmF1bHQgew0KPiA+ICsJ
CXBpbnNfY21kX2RhdCB7DQo+ID4gKwkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzYzX19GVU5DX1ZC
VVNWQUxJRD47DQo+ID4gKwkJCWlucHV0LWVuYWJsZTsNCj4gPiArCQl9Ow0KPiA+ICsJfTsNCj4g
PiArDQo+ID4gICAJdWFydDBfcGluczogdWFydDAtcGlucyB7DQo+ID4gICAJCXBpbnMgew0KPiA+
ICAgCQkJcGlubXV4ID0gPFBJTk1VWF9HUElPOThfX0ZVTkNfVVRYRDA+LA0KPiA+IEBAIC0zOTMs
NiArNDEwLDE0IEBADQo+ID4gICAJCQkJIDxQSU5NVVhfR1BJTzEwM19fRlVOQ19VUlhEMT47DQo+
ID4gICAJCX07DQo+ID4gICAJfTsNCj4gPiArDQo+ID4gKwl1c2Jfb3RnX3ZidXM6IHVzYi1vdGct
dmJ1cy1yZWd1bGF0b3Igew0KPiA+ICsJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsN
Cj4gPiArCQlyZWd1bGF0b3ItbmFtZSA9ICJvdGctdmJ1cyI7DQo+ID4gKwkJcmVndWxhdG9yLW1p
bi1taWNyb3ZvbHQgPSA8NTAwMDAwMD47DQo+ID4gKwkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQg
PSA8NTAwMDAwMD47DQo+ID4gKwkJZW5hYmxlLWFjdGl2ZS1oaWdoOw0KPiA+ICsJfTsNCj4gPiAg
IH07DQo+ID4gICANCj4gPiAgIA0KPiA+IEBAIC00MTIsNiArNDM3LDIyIEBADQo+ID4gICAJc3Rh
dHVzID0gIm9rYXkiOw0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICsmdTNwb3J0MCB7DQo+ID4gKwlz
dGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmdTJwb3J0MSB7DQo+ID4gKwlz
dGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmdTJwb3J0MiB7DQo+ID4gKwlz
dGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmdTJwb3J0MyB7DQo+ID4gKwlz
dGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICAgJnUzcGh5MCB7DQo+ID4gICAJ
c3RhdHVzID0gIm9rYXkiOw0KPiA+ICAgfTsNCj4gPiBAQCAtNDI4LDYgKzQ2OSwxNiBAQA0KPiA+
ICAgCXN0YXR1cyA9ICJva2F5IjsNCj4gPiAgIH07DQo+ID4gICANCj4gPiArJnNzdXNiIHsNCj4g
PiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKwlwaW5jdHJsLTAgPSA8JnUzX3Aw
X3ZidXM+Ow0KPiA+ICsJdnVzYjMzLXN1cHBseSA9IDwmbXQ2MzU5X3Z1c2JfbGRvX3JlZz47DQo+
ID4gKwlkcl9tb2RlID0gIm90ZyI7DQo+ID4gKwltZWRpYXRlayx1c2IzLWRyZDsNCj4gDQo+IFdo
YXQgaXQgdGhhdCB1c2VkIGZvcj8NCj4gZ2l0IGdyZXAgZGlkbid0IGdhdmUgbWUgYW55IGhpdC4N
CiJtZWRpYXRlayx1c2IzLWRyZDsiIGNhbiBiZSBub3cgcmVtb3ZlZCwNCg0KdGhlIHBhdGNoIHNl
bnQgb3V0IG9uIEp1bCA4IDIwMjI6DQoiNjgzZmY2ZTQ4NWYxIHVzYjogbXR1MzogY2hlY2sgY2Fw
YWJpbGl0eSBvZiB1c2IzIGR1YWwgcm9sZSINCmFscmVhZHkgcmVtb3ZlZCB0aGUgcHJvcGVydHku
DQoNClRoYW5rcyBhIGxvdA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBNYXR0aGlhcw0KPiANCj4gPiAr
CXVzYi1yb2xlLXN3aXRjaDsNCj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiAr
DQo+ID4gICAmeGhjaTAgew0KPiA+ICAgCXZ1c2IzMy1zdXBwbHkgPSA8Jm10NjM1OV92dXNiX2xk
b19yZWc+Ow0KPiA+ICAgCXZidXMtc3VwcGx5ID0gPCZvdGdfdmJ1c19yZWd1bGF0b3I+Ow0K
