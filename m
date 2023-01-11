Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2208B6651A3
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 03:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbjAKCTd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 21:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjAKCTU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 21:19:20 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF73C05;
        Tue, 10 Jan 2023 18:19:12 -0800 (PST)
X-UUID: 51cb8ca2915611eda06fc9ecc4dadd91-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VRFCo+g590Z7v1YXiRenTIm8nUIGtos+UM3JMBnSrhs=;
        b=Na1niVZfk+wSkKBshWbu7bmERYzImRAPy04b2bdHocYGWRJvyG4b953uqrGZamb+atmMCuhcA5h9aqZSd2/jd3ZuScNBp3K9pH/xy0xwlDimu61P8CrauPCSMjJrNKuEL5Z7tqfADiNFQXknYHIUZUzOIAYtJWovI8ZIelMscJI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:8fced95c-0f78-4005-b7e7-7914ce5c6d33,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:-5
X-CID-INFO: VERSION:1.1.17,REQID:8fced95c-0f78-4005-b7e7-7914ce5c6d33,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
        elease,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:5a7473f5-ff42-4fb0-b929-626456a83c14,B
        ulkID:230111101907THW46AZC,BulkQuantity:0,Recheck:0,SF:38|17|19|102,TC:nil
        ,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
        0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:1,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 51cb8ca2915611eda06fc9ecc4dadd91-20230111
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 311496848; Wed, 11 Jan 2023 10:19:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 10:19:03 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 10:19:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7dHGV/vpNZZYvRTXfMWxYoNywqTpOmqh1pxBP9Ahyca1r6IyHe2LgmNxAOoKfy097ONogNFINCSop+pc/Z4vH/65FV0jduhj3x+UQeexqSIDbb67PkhLPs9JF/ps0/WKFxOSqMMUexjZM1Fvz/2zhk4M6pDSbFl/RQ/y63zpkU/u6QRZeg6sA2NH3bUXxKftUqG8aVKPZQBBIwKglcBzuXUK2PIZduivrYigs/iE+HIVlxj4j+5rACUt+3TvU1fa/hWzZuQRbk2/wiyiG+ZvjgrC8FdPQvLlVkkwWDAVQ+q/pgJJ8c8znQhVbSBuR4YF3pP3IlFcuzMgXs7VMRlww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRFCo+g590Z7v1YXiRenTIm8nUIGtos+UM3JMBnSrhs=;
 b=bqPT46TZS7O52nSk9geERFPRcG9jTrlcgvIzrp6ZK6Pzwr4RgyFHNFTuHK5eoLPZSA+D93FhgRW4UtIUHXA/MQRltoSa95n+x9W+q1MCJCsgxJ9p4/WGd7MrddpwspR+aQxT8489Nx0GU1Xd1lkiyi3RbWdMmA6k34mMiJtI1mYp+XLy4Nb9KF05pJ51Q1NS+hPVmJ7eEzb6kUQkALBi5MSuoRFUdqQWyGEig+YtfuW18lPnBA3BamvKGXzIxS3r1g+c8uz9ATeqOtJsxVY9fLr5zksLnZzN6QvxxZ56/Tb9UhHzHftxJOZGgUCZYrZPYjZuQNsu8WervrEv78tPCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRFCo+g590Z7v1YXiRenTIm8nUIGtos+UM3JMBnSrhs=;
 b=spKfJfXVIbmj4ERfxCe2LaVaU5sLzTiN3i9pPJGIm6Rw4jKsCpHkijjQa/sRSEcOfGj50HjBK+ywXin2xORt0A1ct/WyvQHXz9ljiqGDXAEi4cWZ5T0P+u0FklBoD540ZYr47Y4GKPD5mg+P0XRG0hEq9WbmXjYO3GJ5UQU5o4M=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by SEZPR03MB6644.apcprd03.prod.outlook.com (2603:1096:101:7c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 02:19:01 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::5e9b:f4cf:8d7f:60d1]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::5e9b:f4cf:8d7f:60d1%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 02:19:01 +0000
From:   =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= 
        <Chunfeng.Yun@mediatek.com>
To:     "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= 
        <Macpaul.Lin@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
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
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
Thread-Topic: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
Thread-Index: AQHZIOg7foe86A75506v84se5lA97q6RWqaAgAcpqoA=
Date:   Wed, 11 Jan 2023 02:19:01 +0000
Message-ID: <1f1222103100b02c4ff7d2273860b1beed49256c.camel@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
         <74ecff7a-bc75-0514-6aa2-b1401b8d43b8@linaro.org>
In-Reply-To: <74ecff7a-bc75-0514-6aa2-b1401b8d43b8@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5062:EE_|SEZPR03MB6644:EE_
x-ms-office365-filtering-correlation-id: 3a0991ad-cf83-4dc8-13df-08daf37a3410
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zNTe4TnxmFBMDezStYuCZ8UnHMmyQgmShueYUMeeB3JCUKlJ9PuTaS66zx6Yi+YL3v34bC0/HNOqtWdHJ+QEucjVkdXoosRayyYJhk0aDY/5PmUQxZg9D+5rYYYVKklWzWPkTcmuHeIPA0GOEQrxZ5pXcwVEs9+29n5zeldN0oOZrtfiL36dOjKE3+A9IDf1JQZJM2diVkyxqEwiDTaYC27J/TmdrHqpXLjqgPJbLr0CkqAjiYPYH37gUnXiY95BNbgyHCPn7K2IcHezD/UvLIAevOjl1Vi3TiVhxX+n7WlOBkgR+1wwKjA3401E8qN9p4pLp1nfPvp58p7/nyikh97RKNC0+wTx7xwL1/7LuSlAY4nmLQMMIdgpsN2orq++67NvS/NYYJhGSQqXCP0gse5V5/uSxPJNx6Ev2gX+1uksjfdb+dyfVMUJSqRD4qpXhQ4qZ4uXgIEp/Ww8ha8e0oZq2sxa+h8k8/6C4Yp2kiL0sbYgziKLHvLxY2QJ+X/b0gJjDxeHv9sU+DYdxWplPc8GLq9090/ZM90RYoV3TqjD3RGUUVeokvlVptMY/QXlNF6uQhPiQyRoMZJ+vhsLjnYbtxdSRC68jUH9nSrBroFXBBKFNKdEtXIcBWJ/hu1LtkXDpubWW7Ujqa6EW7no5oLJ1QV2t/BMbf0KBcpLgqM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(64756008)(8676002)(66946007)(76116006)(66476007)(66556008)(316002)(4326008)(91956017)(110136005)(54906003)(38070700005)(85182001)(2906002)(5660300002)(66446008)(8936002)(71200400001)(7416002)(41300700001)(36756003)(966005)(83380400001)(107886003)(478600001)(53546011)(6486002)(6506007)(122000001)(38100700002)(2616005)(26005)(6512007)(86362001)(186003)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yzk3bFVOUm9TcnVNUHZRSVh6cDAxakg3S0EwVzhEdyt5ZWYvbHpuc04yMlMv?=
 =?utf-8?B?UU0yRUpRMmsvTFVCVEU0Q2Z2VUM5Y2VpZmFYazRMTGgxS1lRMlk4NGIwQi9I?=
 =?utf-8?B?TkdlSXNoUmtVOTk4eFh5cEk1SDBFcWJiL1FZT3dVUHBsYlRwdWMrU0pOSkNh?=
 =?utf-8?B?Mm92OFYzS2cwbVpGUURSSHVSNlVVdWtDdEFlRXVxdEU2bUZXNkNPWnd2UjZN?=
 =?utf-8?B?eU53Zm5mbnY1SENLU3U2T0dKSlQza3pWRTFBWnZaY0hQVWpLeHF1bm1nUk8y?=
 =?utf-8?B?b1JJZUduMVVOT1FZWXR5cHl0MkVvVjRLMW1DQi8rcUxqQU1uN2psbTlwZmF1?=
 =?utf-8?B?Lzd1c1JPWmZyMWZBY2hSanlOVlN0TDZtcnJEWmNSNndEN25kcVZLdVpJVGd2?=
 =?utf-8?B?VXJsVUdYbXF1ZWR6cjkyakZzTGgzdFhzdkZGR2FYQllZaTBmdEFRQ2hTZ1Jk?=
 =?utf-8?B?Z2QvcVZOOVpxbmU5Umg1YjZPQ3ZGaVlGOHlaRCt0RUlqQ1BYNFVYQzc2OFFW?=
 =?utf-8?B?VnVDZTk2WjJqazN6SHlOc0FwYTlyRHM3ZGFBOFlNbzQwK1ZNQWRHRFdiQWtr?=
 =?utf-8?B?TExQWDd2ZXpxNmpZMm90SWNGMGluWUVTOVNrUmpwZVBnWkxybG5MaGRReFov?=
 =?utf-8?B?NlVEYkxEcWtESzdub3puMi93YkZTVklmVkFSSVdGUXZPZndmNE4wclRURU1o?=
 =?utf-8?B?VWoxcWJ3UllZb1J0Zm9OekhQQmRlUHFTbDZ5R1JlMTA1VzZQQTR1dllxS2pI?=
 =?utf-8?B?SkdNK3NZbi9VbkIxSld4TVAxdVkyMGZyRS9uNWU2dkpBVFgxY05iS3U4Q1JP?=
 =?utf-8?B?OUFiUHd5SXh1V1pLRTcrVGNRSjdRY0RMWjlOMzZuNHpmT29EZWJSOERESTBt?=
 =?utf-8?B?V0RubGZyeEJFRERFMEZaNzluZ3ZwQ1JMNWk0ZkxkTnR5cHlqaDJmUFlVRlRU?=
 =?utf-8?B?cEZSY3p0OUlKYmtIZEYzcTRJbFM1MEkrQmFWdTVqWm1JZENycmRwRXZENWwy?=
 =?utf-8?B?WGcxSW9tQ1hJdGRWSzhUZldPWFZLNWZqbURhV3FoeXNiN2hVNkFGU1llMmxG?=
 =?utf-8?B?WUZXaFFUWDVBcThlVGIyTU5MVlVGMmZlby9XZ1pjaTU3aTh3QlVOZ3luMldF?=
 =?utf-8?B?aThESmRnaCtyeE9GaFNKNi90ejZUMHdWZXhQVFFjcDg0bHhPVDNxamM0bjZj?=
 =?utf-8?B?NHQvQzRISWN3MGVENlkwQkhEVm0zU2Z1OXl3Tzk5cW4wQXAwUjJMdWxyRU5Q?=
 =?utf-8?B?RVEvTnQyQ0l2RFNoL2c0aCtmQ0k4NkxpVHdqSW1ydzF6dFBCdm5iTTFOUEZL?=
 =?utf-8?B?VllPZ2d6ZkdxRmt0eTJTbVN4cmpOYTBrdXl5dnk1R3NoczBBUDdQYktKdFBx?=
 =?utf-8?B?RVg1OHBNS3hKWVBVT1pMUExIcDd5cXRndkd2bVI3OW9QNk85TE1VeDNBOVNL?=
 =?utf-8?B?TG8yV1pRMVhqdFZJZUQxT1liRE1UcXgwQU5lNHZZRVlkOWVjZUNvdi8rT1Ra?=
 =?utf-8?B?dHE5dlJzVlVqTTJNTkZpK1NNUnROYnVZejhqakdHVXZUbUx1U3BubWlTa3F0?=
 =?utf-8?B?ajgyQk5Ub2xsS1FSN0Flc0JWQ2pyMnVyV0RqVHNaZW9sRXRkRXlxM2FvaTlB?=
 =?utf-8?B?ZEVjdFdxaTdzTEx4TnY2RnlkMXpScmpCVWhNN0VwMCtONG91bnJJa3pjdDBC?=
 =?utf-8?B?aUJPaXIvakV4Nmlpakc1Zmc2MFRpVzZaRjdWcUh6MjAvbTMwVG1CN3IvcDN5?=
 =?utf-8?B?UjFmcTZVcEJRaWMrcUlocEx0UWR6c1YzUTMwUEdQQ1lxYWxZTlZsMlp1WVg1?=
 =?utf-8?B?UXZtQjNCUjVKblNGeG1IVHFZQTE4VDZWNWlEbVFqM0J4OVNZY2hqK0FwZDhR?=
 =?utf-8?B?TG1NSFoyZkdHQUVEdlVKSzc4dFRvVU5zclZmdjJDLzhqclRVSktrc2Q4Y0w4?=
 =?utf-8?B?U3NPWU1vUWVRTjY0ZTBKYlZMZE5mNUoybnN4MjRDK2FzaVVXY1k3U0t4akNK?=
 =?utf-8?B?SHdPdTYwRWhhdGZSUjVwQlAxWkpuVThWSGYrd01MblFFQXA3b0JQUmpyZ1Ju?=
 =?utf-8?B?SFUvR3pUM01sYzMrcmhKK0E1aEowVDllZ0ZUNG4xQS85TFRxUG03Z1hNYzJN?=
 =?utf-8?B?N01yeTlDcDNISit6anVTMFBXamJkWFhhb2cxNDJGQ0NzbjJQenl6bll0RDQ4?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <537861B62B8BD74FA001F5225A55B9DF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0991ad-cf83-4dc8-13df-08daf37a3410
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 02:19:01.0906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L1fZId+kNq9OnjTTMwaMTPyw/LnppFLyD4fwVZ9nDIHnv+5I7xU+wNx+K5sXtVJXJUm+RGZINQu3XZYbSzBdf50IcCYGDRoxINkw/cXk4cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6644
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

T24gRnJpLCAyMDIzLTAxLTA2IGF0IDEzOjU2ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAwNS8wMS8yMDIzIDEwOjI4LCBNYWNwYXVsIExpbiB3cm90ZToNCj4gPiBJbnRy
b2R1Y2UgdGhlIHNwbGl0IE1UODE5NSBsYXB0b3AgYW5kIGlvdCBVU0IgY29uZmlndXJhdGlvbnMu
DQo+ID4gVGhlIGhhcmR3YXJlIHNwZWNpZmljYXRpb25zIGZvciBMQVBUT1AgZGV2aWNlcyBpcyBk
aWZmZXJlbnQgZnJvbQ0KPiA+IElPVA0KPiA+IGRldmljZXMuIFRoZSBtYWpvciBkaWZmZXJlbmNl
cyBpbmNsdWRlIHNvbWUgaGFyZHdhcmUgY29uc3RyYWlucyBmb3INCj4gPiBkdWFsLXJvbGUgc3dp
dGNoIGZvciBVU0IgY29udHJvbGxlcnMgaW4gZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25zLA0KPiA+
IGVzcGVjaWFsbHkgZm9yIHBvd2VyIG1hbmFnZW1lbnQgYW5kIG90aGVyIGNvbnRyb2wgZmxvd3Mg
YXMgd2VsbC4NCj4gPiANCj4gPiBIZXJlIGFyZSBzb21lIGhhcmR3YXJlIHNwZWNpZmljdGlvbiBk
aWZmZXJlbmNlcyBsaXN0ZWQ6DQo+ID4gICAxLiBMQVBUT1AgKENoZXJyeSBUb21hdG8gYm9hcmRz
KSBkb24ndCBzdXBwb3J0IFVTQiBnYWRnZXQgKGRldmljZQ0KPiA+IG1vZGUpLg0KPiA+ICAgMi4g
SU9UIGRldmljZXMgbXVzdCBzdXBwb3J0IG11bHRpcGxlIGdhZGdldCBkZXZpY2VzIGFuZCBob3N0
DQo+ID4gbW9kZS4NCj4gPiAgIDMuIER1YWwtcm9sZSBzd2l0Y2ggaXMgbm90IGZ1bGx5IHN1cHBv
cnRlZC4gT25seSBVU0IgUE9SVDANCj4gPiBzdXBwb3J0DQo+ID4gICAgICBkdWFsLXJvbGUgc3dp
dGNoLg0KPiA+ICAgNC4gUG93ZXIgbWFuYWdlbWVudCBpcyBkZXNpZ25lZCBpbiBwcmltYXJ5IGFu
ZCBzZWNvbmRhcnkNCj4gPiBkb21pbmF0b3IuDQo+ID4gICAgICBGb3IgYSBkdWFsLXJvbGUgcG9y
dCwgdGhlIGRldmljZSBjb250cm9sbGVyIGlzIHRoZSBwcmltYXJ5DQo+ID4gY29udHJvbGxlcg0K
PiA+ICAgICAgZm9yIHBvd2VyIG1hbmFnZW1lbnQ7IHdoaWxlIHRoZSBob3N0IGNvbnRyb2xsZXIg
aXMgdGhlDQo+ID4gc2Vjb25kYXJ5Lg0KPiA+ICAgICAgTEFQVE9QIGRldmljZXMgc2hvdWxkIHJl
bW92ZSBkZXZpY2Ugbm9kZXMgZm9yIGF2b2lkaW5nDQo+ID4gYWJub3JtYWwNCj4gPiAgICAgIGJl
aGF2aW9yLg0KPiA+IA0KPiA+IFRoaXMgbW9kaWZjYXRpb24gaXMgdG8gYWRkIFVTQiBjb25maWd1
cmF0aW9ucyAibXQ4MTk1LWxhcHRvcC0NCj4gPiB1c2IuZHRzaSINCj4gPiBmb3IgTEFQVE9QIGRl
dmljZXMsIGFuZCBhZGQgIm10ODE5NS1pb3QtdXNiLmR0c2kiIGZvciBJT1QgZGV2aWNlcy4NCj4g
PiANCj4gPiBUbyByZW1vdmUgY29tbW9uIFVTQiBjb25maWd1cmF0aW9ucyBmb3IgbXQ4MTk1LmR0
c2kgYW5kIHN3aXRjaA0KPiA+IGluY2x1ZGVzDQo+ID4gZHRzaSB0aGVzZSBuZXcgZmlsZXMgZm9y
IHRoZSBib2FyZHMgd2lsbCBjb21lIGluIG5leHQgcGF0Y2guDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogTWFjcGF1bCBMaW4gPG1hY3BhdWwubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4g
PiAgLi4uL2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS1pb3QtdXNiLmR0c2kgICAgIHwgMTIyDQo+
ID4gKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUt
bGFwdG9wLXVzYi5kdHNpICB8IDEwMg0KPiA+ICsrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDIyNCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS1pb3QtDQo+ID4gdXNiLmR0c2kNCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWxh
cHRvcC0NCj4gPiB1c2IuZHRzaQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5NS1pb3QtdXNiLmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWlvdC11c2IuZHRzaQ0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mOWJkNzk1NDIwNDQNCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUtaW90LXVz
Yi5kdHNpDQo+ID4gQEAgLTAsMCArMSwxMjIgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IChDKSAy
MDIyIE1lZGlhVGVrIEluYy4NCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAibXQ4MTk1
LmR0c2kiDQo+ID4gKw0KPiA+ICsvIHsNCj4gPiArCXNvYyB7DQo+ID4gKwkJc3N1c2I6IHNzdXNi
QDExMjAwMDAwIHsNCj4gDQo+IE5vZGUgbmFtZTogdXNiDQo+IA0KPiA+ICsJCQljb21wYXRpYmxl
ID0ibWVkaWF0ZWssbXQ4MTgzLW10dTMiLA0KPiA+ICJtZWRpYXRlayxtdHUzIjsNCj4gPiArCQkJ
cmVnID0gPDAgMHgxMTIwMTAwMCAwIDB4MmRmZj4sDQo+ID4gKwkJCSAgICAgIDwwIDB4MTEyMDNl
MDAgMCAweDAxMDA+Ow0KPiA+ICsJCQlyZWctbmFtZXMgPSAibWFjIiwgImlwcGMiOw0KPiA+ICsJ
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTI4IElSUV9UWVBFX0xFVkVMX0hJR0gNCj4gPiAwPjsN
Cj4gPiArCQkJcGh5cyA9IDwmdTJwb3J0MCBQSFlfVFlQRV9VU0IyPiwNCj4gPiArCQkJICAgICAg
IDwmdTNwb3J0MCBQSFlfVFlQRV9VU0IzPjsNCj4gPiArCQkJY2xvY2tzID0gPCZpbmZyYWNmZ19h
byBDTEtfSU5GUkFfQU9fU1NVU0I+LA0KPiA+ICsJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TU1VT
Ql9SRUY+LA0KPiA+ICsJCQkJIDwmaW5mcmFjZmdfYW8NCj4gPiBDTEtfSU5GUkFfQU9fU1NVU0Jf
WEhDST47DQo+ID4gKwkJCWNsb2NrLW5hbWVzID0gInN5c19jayIsICJyZWZfY2siLCAibWN1X2Nr
IjsNCj4gPiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gKwkJCSNzaXplLWNlbGxzID0g
PDI+Ow0KPiA+ICsJCQlyYW5nZXM7DQo+ID4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4g
Kw0KPiA+ICsJCQl4aGNpMDogeGhjaUAxMTIwMDAwMCB7DQpzL3hoY2kvdXNiDQo+ID4gKwkJCQlj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS14aGNpIiwNCj4gPiArCQkJCQkgICAgICJtZWRp
YXRlayxtdGsteGhjaSI7DQo+ID4gKwkJCQlyZWcgPSA8MCAweDExMjAwMDAwIDAgMHgxMDAwPjsN
Cj4gPiArCQkJCXJlZy1uYW1lcyA9ICJtYWMiOw0KPiA+ICsJCQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDEyOQ0KPiA+IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47DQo+ID4gKwkJCQlhc3NpZ25lZC1j
bG9ja3MgPSA8JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9VU0JfVE9QPiwNCj4gPiArCQkJCQkJICA8
JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9TU1VTQl9YSENJPjsNCj4gPiArCQkJCWFzc2lnbmVkLWNs
b2NrLXBhcmVudHMgPSA8JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9VTklWUExMX0Q1X0Q0PiwNCj4g
PiArCQkJCQkJCSA8JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9VTklWUExMX0Q1X0Q0PjsNCj4gPiAr
CQkJCWNsb2NrcyA9IDwmaW5mcmFjZmdfYW8NCj4gPiBDTEtfSU5GUkFfQU9fU1NVU0I+LA0KPiA+
ICsJCQkJCSA8JmluZnJhY2ZnX2FvDQo+ID4gQ0xLX0lORlJBX0FPX1NTVVNCX1hIQ0k+LA0KPiA+
ICsJCQkJCSA8JnRvcGNrZ2VuIENMS19UT1BfU1NVU0JfUkVGPiwNCj4gPiArCQkJCQkgPCZhcG1p
eGVkc3lzDQo+ID4gQ0xLX0FQTUlYRURfVVNCMVBMTD47DQo+ID4gKwkJCQljbG9jay1uYW1lcyA9
ICJzeXNfY2siLCAieGhjaV9jayIsDQo+ID4gInJlZl9jayIsICJtY3VfY2siOw0KPiA+ICsJCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArCQkJfTsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiAr
CQl4aGNpMTogeGhjaTFAMTEyOTAwMDAgew0KPiANCj4gTm9kZSBuYW1lcyBzaG91bGQgYmUgZ2Vu
ZXJpYywgc28ganVzdCAieGhjaSINCmFsc28gdXNlICJ1c2IiLCBubyBnZW5lcmljIG5hbWUgInho
Y2kiIGluIHRoZSBmb2xsb3dpbmcgc3BlYw0KDQo+IA0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92
My9fX2h0dHBzOi8vZGV2aWNldHJlZS1zcGVjaWZpY2F0aW9uLnJlYWR0aGVkb2NzLmlvL2VuL2xh
dGVzdC9jaGFwdGVyMi1kZXZpY2V0cmVlLWJhc2ljcy5odG1sKmdlbmVyaWMtbmFtZXMtcmVjb21t
ZW5kYXRpb25fXztJdyEhQ1RSTktBOXdNZzBBUmJ3IW41Tnh0dUJISTVmOXRTNjU5cHFEZ1JEWk5B
RnhuWHJpZXQwRzQ4S0E2NG4xQ0VXWVlzTDB2WFkwSS1Ndzk5SDhhOFVEVzVLUl83OWs3SXZZZzhF
cjVnTnZta1hFOUhaSCTCoA0KPiAgDQo+IA0KPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10ODE5NS14aGNpIiwNCj4gPiArCQkJCSAgICAgIm1lZGlhdGVrLG10ay14aGNpIjsNCj4gPiAr
CQkJcmVnID0gPDAgMHgxMTI5MDAwMCAwIDB4MTAwMD4sDQo+ID4gKwkJCSAgICAgIDwwIDB4MTEy
OTNlMDAgMCAweDAxMDA+Ow0KPiA+ICsJCQlyZWctbmFtZXMgPSAibWFjIiwgImlwcGMiOw0KPiA+
ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNTMwIElSUV9UWVBFX0xFVkVMX0hJR0gNCj4gPiAw
PjsNCj4gPiArCQkJcGh5cyA9IDwmdTJwb3J0MSBQSFlfVFlQRV9VU0IyPiwNCj4gPiArCQkJICAg
ICAgIDwmdTNwb3J0MSBQSFlfVFlQRV9VU0IzPjsNCj4gPiArCQkJYXNzaWduZWQtY2xvY2tzID0g
PCZ0b3Bja2dlbg0KPiA+IENMS19UT1BfVVNCX1RPUF8xUD4sDQo+ID4gKwkJCQkJICA8JnRvcGNr
Z2VuDQo+ID4gQ0xLX1RPUF9TU1VTQl9YSENJXzFQPjsNCj4gPiArCQkJYXNzaWduZWQtY2xvY2st
cGFyZW50cyA9IDwmdG9wY2tnZW4NCj4gPiBDTEtfVE9QX1VOSVZQTExfRDVfRDQ+LA0KPiA+ICsJ
CQkJCQkgPCZ0b3Bja2dlbg0KPiA+IENMS19UT1BfVU5JVlBMTF9ENV9END47DQo+ID4gKwkJCWNs
b2NrcyA9IDwmcGVyaWNmZ19hbw0KPiA+IENMS19QRVJJX0FPX1NTVVNCXzFQX0JVUz4sDQo+ID4g
KwkJCQkgPCZwZXJpY2ZnX2FvDQo+ID4gQ0xLX1BFUklfQU9fU1NVU0JfMVBfWEhDST4sDQo+ID4g
KwkJCQkgPCZ0b3Bja2dlbiBDTEtfVE9QX1NTVVNCX1AxX1JFRj4sDQo+ID4gKwkJCQkgPCZhcG1p
eGVkc3lzIENMS19BUE1JWEVEX1VTQjFQTEw+Ow0KPiA+ICsJCQljbG9jay1uYW1lcyA9ICJzeXNf
Y2siLCAieGhjaV9jayIsICJyZWZfY2siLA0KPiA+ICJtY3VfY2siOw0KPiA+ICsJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOw0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJCXNzdXNiMTogdXNiMUAxMTJh
MTAwMCB7DQo+IA0KPiB1c2INCj4gDQo+ID4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTgzLW10dTMiLA0KPiA+ICJtZWRpYXRlayxtdHUzIjsNCj4gPiArCQkJcmVnID0gPDAgMHgxMTJh
MTAwMCAwIDB4MmRmZj4sDQo+ID4gKwkJCQkgIDwwIDB4MTEyYTNlMDAgMCAweDAxMDA+Ow0KPiA+
ICsJCQlyZWctbmFtZXMgPSAibWFjIiwgImlwcGMiOw0KPiA+ICsJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgNTMyIElSUV9UWVBFX0xFVkVMX0hJR0gNCj4gPiAwPjsNCj4gPiArCQkJcGh5cyA9IDwm
dTJwb3J0MiBQSFlfVFlQRV9VU0IyPjsNCj4gPiArCQkJYXNzaWduZWQtY2xvY2tzID0gPCZ0b3Bj
a2dlbg0KPiA+IENMS19UT1BfVVNCX1RPUF8yUD47DQo+ID4gKwkJCWFzc2lnbmVkLWNsb2NrLXBh
cmVudHMgPSA8JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9VTklWUExMX0Q1X0Q0PjsNCj4gPiArCQkJ
Y2xvY2tzID0gPCZwZXJpY2ZnX2FvDQo+ID4gQ0xLX1BFUklfQU9fU1NVU0JfMlBfQlVTPiwNCj4g
PiArCQkJCSA8JnRvcGNrZ2VuIENMS19UT1BfU1NVU0JfUDJfUkVGPiwNCj4gPiArCQkJCSA8JnBl
cmljZmdfYW8NCj4gPiBDTEtfUEVSSV9BT19TU1VTQl8yUF9YSENJPjsNCj4gPiArCQkJY2xvY2st
bmFtZXMgPSAic3lzX2NrIiwgInJlZl9jayIsICJtY3VfY2siOw0KPiA+ICsJCQltZWRpYXRlayxz
eXNjb24td2FrZXVwID0gPCZwZXJpY2ZnIDB4NDAwIDQ+Ow0KPiA+ICsJCQkjYWRkcmVzcy1jZWxs
cyA9IDwyPjsNCj4gPiArCQkJI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gKwkJCXJhbmdlczsNCj4g
PiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArDQo+ID4gKwkJCXhoY2kyOiB4aGNpMkAx
MTJhMDAwMCB7DQo+IA0KPiB4aGNpDQp1c2UgInVzYiIsIG5vIG5lZWQgY2hhbmdlIGl0IHdoZW4g
bW92ZSBmcm9tIG10ODE5NS5kdHNpDQoNCj4gDQo+ID4gKwkJCQljb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE5NS0NCj4gPiB4aGNpIiwibWVkaWF0ZWssbXRrLXhoY2kiOw0KPiA+ICsJCQkJcmVn
ID0gPDAgMHgxMTJhMDAwMCAwIDB4MTAwMD47DQo+ID4gKwkJCQlyZWctbmFtZXMgPSAibWFjIjsN
Cj4gPiArCQkJCWludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmdpYyBHSUNfU1BJIDUzMw0KPiA+IElS
UV9UWVBFX0xFVkVMX0hJR0ggMD4sDQo+ID4gKwkJCQkJICAgICAgPCZwaW8gMjIwDQo+ID4gSVJR
X1RZUEVfRURHRV9GQUxMSU5HPjsNCj4gPiArCQkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tn
ZW4NCj4gPiBDTEtfVE9QX1NTVVNCX1hIQ0lfMlA+Ow0KPiA+ICsJCQkJYXNzaWduZWQtY2xvY2st
cGFyZW50cyA9IDwmdG9wY2tnZW4NCj4gPiBDTEtfVE9QX1VOSVZQTExfRDVfRDQ+Ow0KPiA+ICsJ
CQkJY2xvY2tzID0gPCZwZXJpY2ZnX2FvDQo+ID4gQ0xLX1BFUklfQU9fU1NVU0JfMlBfWEhDST47
DQo+ID4gKwkJCQljbG9jay1uYW1lcyA9ICJzeXNfY2siOw0KPiA+ICsJCQkJc3RhdHVzID0gImRp
c2FibGVkIjsNCj4gPiArCQkJfTsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiArCQl4aGNpMzogeGhj
aTNAMTEyYjAwMDAgew0KPiANCj4geGhjaQ0KdXNiDQo+ID4gKwkJCWNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTk1LXhoY2kiLA0KPiA+ICsJCQkJICAgICAibWVkaWF0ZWssbXRrLXhoY2kiOw0K
PiA+ICsJCQlyZWcgPSA8MCAweDExMmIwMDAwIDAgMHgxMDAwPiwNCj4gPiArCQkJICAgICAgPDAg
MHgxMTJiM2UwMCAwIDB4MDEwMD47DQo+ID4gKwkJCXJlZy1uYW1lcyA9ICJtYWMiLCAiaXBwYyI7
DQo+ID4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA1MzYgSVJRX1RZUEVfTEVWRUxfSElHSA0K
PiA+IDA+Ow0KPiA+ICsJCQlwaHlzID0gPCZ1MnBvcnQzIFBIWV9UWVBFX1VTQjI+Ow0KPiA+ICsJ
CQlhc3NpZ25lZC1jbG9ja3MgPSA8JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9VU0JfVE9QXzNQPiwN
Cj4gPiArCQkJCQkgIDwmdG9wY2tnZW4NCj4gPiBDTEtfVE9QX1NTVVNCX1hIQ0lfM1A+Ow0KPiA+
ICsJCQlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZ0b3Bja2dlbg0KPiA+IENMS19UT1BfVU5J
VlBMTF9ENV9END4sDQo+ID4gKwkJCQkJCSA8JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9VTklWUExM
X0Q1X0Q0PjsNCj4gPiArCQkJY2xvY2tzID0gPCZwZXJpY2ZnX2FvDQo+ID4gQ0xLX1BFUklfQU9f
U1NVU0JfM1BfQlVTPiwNCj4gPiArCQkJCSA8JnBlcmljZmdfYW8NCj4gPiBDTEtfUEVSSV9BT19T
U1VTQl8zUF9YSENJPiwNCj4gPiArCQkJCSA8JnRvcGNrZ2VuIENMS19UT1BfU1NVU0JfUDNfUkVG
PjsNCj4gPiArCQkJY2xvY2stbmFtZXMgPSAic3lzX2NrIiwgInhoY2lfY2siLCAicmVmX2NrIjsN
Cj4gPiArCQkJbWVkaWF0ZWssc3lzY29uLXdha2V1cCA9IDwmcGVyaWNmZyAweDQwMCAxMDY+Ow0K
PiA+ICsJCQl3YWtldXAtc291cmNlOw0KPiA+ICsJCQl1c2IyLWxwbS1kaXNhYmxlOw0KPiA+ICsJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICsJCX07DQo+IA0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiBLcnp5c3p0b2YNCj4gDQo=
