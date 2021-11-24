Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D47445C6B9
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 15:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352198AbhKXOKt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 09:10:49 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47272 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346174AbhKXOHy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Nov 2021 09:07:54 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DB85241BE4;
        Wed, 24 Nov 2021 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1637762684; bh=/ziePrfKh5y1Nvq60BBBMaMcuHY/uvSZb0ScpiipAIk=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=FVkpuv+1VOHBWA5keZpfjN4fQ/odA6zvhG00cWHGAE5t/H5tOKuJ6rC1zmgnMJ8c1
         JAsX6mcqjILJszB3mymqMqGfwgYg/HoyOHKbLDUBE2L8CZ9CoZvKxxqtuvR67Vqm6Z
         IuzSnDqWjlh4L0GklhHcLPYwfZLrW38z2iTL8KHJV1onQWVrx/imqW6oEEXLEdRwFL
         O8ZLy6N9JM/z/Io+ai9US/L9tkzywc/c49qSfVOUynYjWJeLNt9d0IfG+jErhsPlj4
         ix2LxwSRWeaRP+jLfDgLAdDWO9crzTWINeAP+D2Fim+xC6sws/yeZOgGfDybpmiXMS
         5NfZOUnXlDa/g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9CB38A0062;
        Wed, 24 Nov 2021 14:04:44 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 40902400DF;
        Wed, 24 Nov 2021 14:04:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ltZRMmiz";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6MiHIRzA2neFPyoeDNa8MFuZHQvLQSmop52DS8kFJrcBPs423zI3K1ML/BQxM22vbt7TaJ6aQqY1giZftoxIr7ejNpkAJ1k5rDcxdH4D0z+lL8sygheV2JEIjrYbk4Q8NSfQr/1XWugkbj2Eeg1zAYUW4MJbDy/cC9hi9Jk9M5lXKFBJCt8wc40b/he//DesErw7VC5ji62TzaByz0n3bKlDAARTHxDjTQZY/S0qZ13Bd00x6hhAzSY/8pKP/DPGoIP2/JegPnbPsXphcBFyCs/YDh8/XdUEVESvGiO/Qw8Th47enBLI9wzvvZ3RzPTyamFAM7iMf3GmlSKWIHY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ziePrfKh5y1Nvq60BBBMaMcuHY/uvSZb0ScpiipAIk=;
 b=CIrc7dGzyA3+0bghUyCSo9v92uoWr6+mwSUSF3vQXSNbdwTCFCZ6Zk6UVMHMZWpr8yuwQ+Bb3LkAgY0DsGTRhOs3f+mw0TIJpKewTjOZyp33Yb91FjXspmbGZg9nafFnNg8grgnfOeLTB46O4eajzLLL8QL/ee66sghcMWbNhFRGHggYtgj1B2NZspfuT61BRP0hpM2Chvn00DFSWw2JMExUpjLaYexQYw3MyjBdYy0/vkG1SBmTdXKdD+MKK93TOymwlHsu3t+VR/iY3/wMjR37MoV3rrX8njJ+8pttjtA/mDJ42larrwYZYpO+r2CVm1dYfAcVHuaVSE2kK0Ajsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ziePrfKh5y1Nvq60BBBMaMcuHY/uvSZb0ScpiipAIk=;
 b=ltZRMmizUtyrokF50UpSM7PE9ff5mWRb5jCNU2py8IbN9xcGog9jPr5BzP5G+m1MnHwyafAm3B8roEqz0IOS3uN0rOUGt7PxSkUbb83xP2o/SSG6QIrHjS5cTeJ6cH2kkNjx1kOAVIyqa1UI9hRpEQvsMPAtRZv9jCMxdliKSNU=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM6PR12MB5566.namprd12.prod.outlook.com (2603:10b6:5:20d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Wed, 24 Nov
 2021 14:04:42 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::a0da:c3e5:4562:cea9]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::a0da:c3e5:4562:cea9%7]) with mapi id 15.20.4713.024; Wed, 24 Nov 2021
 14:04:42 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: gadget: high-bandwidth (mc > 1) status?
Thread-Topic: usb: dwc2: gadget: high-bandwidth (mc > 1) status?
Thread-Index: AQHX4QaFzYXwmWGutEmQPz5HEETK8awStmcA
Date:   Wed, 24 Nov 2021 14:04:42 +0000
Message-ID: <d129d6de-3447-f51f-356a-0589971f9cae@synopsys.com>
References: <ea4697fd-8911-3f79-540b-a03214678ccd@ivitera.com>
In-Reply-To: <ea4697fd-8911-3f79-540b-a03214678ccd@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c2cae50-6e76-479f-1164-08d9af535d1d
x-ms-traffictypediagnostic: DM6PR12MB5566:
x-microsoft-antispam-prvs: <DM6PR12MB556618E55FB43B74121F4201A7619@DM6PR12MB5566.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 38TGUfnlKVTmBzlc4BXmlkOnSiOYS1c7Qr/AVrGpELNpFxUqEsjUkf0lEOe7qBkakjsVPyW603GHCnt01HwiD6pQXze8NDPxGYTx0uLUbTFkN1ZmGrJz4oGKujMP1alk9MzKpOKnzZ8zMilfnBaZJHkT4usDHo/iByhlEsomjRTD1PPVqCF2LCZEEi8Z27v6Cx8FwLt5ldj5HmbUXxvBYUG93BEUGm2H9oQe8fc0LMDu+9FBjehayOj6vFuWimgNMwFuJkaMdMmkewXxRy1OvwPuoNVheK9u/j5g639g76E+VCMbl+NnhRZzqnfQbJ2pckqGv0SLyxLsruWdtZsUq9I2xH+Hc4wqdHUBRpjh3Ml51UfwGZC3wRgZ4gYUAxlGHPiOr4pXq3sHyU8swkoKnuleiPGD9BZnnChBe19HF2oTDiPLflOSS1kzNyU04J77VNdyosTgkpp9jjOMtgAEli5tPoSIlPc0g3Hq6pQgFOECdtYMxD0H4AuTs8dteVEcZHVpKo1rTkL8YlpYUTh9xMn8YiakzTvst4TueAnS8NC2PQWCTu7MTxYXshJ8Y4ii4/sFv8hKTP0LMixxBpsY0maRAF1dIZWANsnr4qBz/4Go9iQbMd0u1FT9IuwmEgue48fmMtHzCcHcXClSwP8XmzZy4TpxnBY+DVmvUp5xX51ONlrJEITU2y++ohNwe+PqNa7FCoSeu3TBTAIji6ZunQu2kwXdAVnireP5C4T4HlMBs4zydWSmq1wOoHUriNsA0WCueGGh1AbHfK2YYDcN7cNr59rgN0DK5sTDJMv21p5Zn536t61JDFPB+fNbqWBkkI1QBTleevKxgMtdUtZhDxH8OL4nCAqMqLDDg9C6f7s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(76116006)(8676002)(66556008)(66574015)(66446008)(91956017)(64756008)(71200400001)(38100700002)(6506007)(53546011)(83380400001)(508600001)(2616005)(26005)(8936002)(186003)(6486002)(122000001)(36756003)(31696002)(966005)(110136005)(5660300002)(316002)(6512007)(2906002)(31686004)(86362001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW1hc0ZhOGxCTjg3cXkxekhhekVaYm1JWTdYWFZIWHdJOFhCMkZkbjZDQlE1?=
 =?utf-8?B?U0NsOFMxejNZZlQ5NFMvNHZiK1pCdjBHVEJhKzhEWmNaMXowcENmZWp2Q1lV?=
 =?utf-8?B?aHMxS2tiNzJmbUFXY1REU0xPbGJTV215VUZsTllrVjFPYi9FVWc0ZEJFd2Ir?=
 =?utf-8?B?RitDN3FMUVV1ekNMTXpjK1lvS01ld1FvWG10T2U0TXlhOEswcjJiQjBXeXM0?=
 =?utf-8?B?QThiaFJNcEk3QjhxWnlkWXM3Y0ZpaWZ1dDVkNm0ydTY4YW1vYnZ0bkdVWmxZ?=
 =?utf-8?B?blYyKzViWS9Xa2ZXdmo4Nkx1bXpWNTNvbE1xVlBwR25EMmVYbXdkaWZxemZh?=
 =?utf-8?B?YUJVeWwxVzNvb09PYWlKTlloUHhWUHV3WDYzdHVOKzhlZm9wK0ZiY2Rub0hx?=
 =?utf-8?B?T0kybTFFTkhPRVpjc2dqZGhsZEFJemUrSEFjREpPaVpnWmpqaDRORHFxZTRh?=
 =?utf-8?B?Mk92bm5tVWNrcERIbUNZeTNqOGZhZG5UNGNrTDdUMVFhWnJPd1dXMFRHMlJ0?=
 =?utf-8?B?U2x2Ui9WanBUVzNGS1lBWDdMVUJBTy83bnJNamp4QmZBelMrbWpML1o1azE5?=
 =?utf-8?B?cWQyWDQzelBCRDFja2dTdkxOWUMwSHZEbUhnSmp3R3AvUTFhVUNNY2N1YnZQ?=
 =?utf-8?B?Y0x4WUhoQllucGQ4WEg5bys3SVlxRDBnUnFrVEFyeWxJLzZzK21tOFhvSXE4?=
 =?utf-8?B?TlpmUDFia0JuVG8rMmcrZEZFRVBSNzVNR1R1azhEV3YvdFc0S05PeGdCdE9z?=
 =?utf-8?B?R0dqSXlabGFMRjlySkF6dXZ3NUVrMHNwUlB2U29XeG12emE5dEpURWw0MTB5?=
 =?utf-8?B?S2orZjJPelorVlNLc1UvWVNZVjNQcC9FSU9ZendWZDRvbmpocmpBMWl2UXU0?=
 =?utf-8?B?K2w0Q1ljaldPb1NhNGsxSS8zVWdyN1N2aWxvMWo4OGYwRXJwQ3phaUVZb24r?=
 =?utf-8?B?c3RLa0xxTHRQcGx1UHo1cE4wUkZnRnN5UnVoeE5hemZiU0ZaSkRYVitGd2pT?=
 =?utf-8?B?MVRwdmdIVHRFS1JaNSsrSlhBTVFXK045UWJscmE2OHQ0QnJXeWRKamlXamNP?=
 =?utf-8?B?VkpZSXhSN0VTdENHUFB4WE9NM0Zpb09QNlJSZ1BXQ1BhYnBDcVYrQmFhSmdB?=
 =?utf-8?B?aTVkN3pVQXJhS09BaDVocFNjSW5rRyt4UGVUYlRrcHN3c21iSWYvcDA3VzJy?=
 =?utf-8?B?dS9BUzAxOE4zRVJ2TWJzWmJNOUVYSDFNZkRVVmVMYmo5OGlsQXVxRExlRmdC?=
 =?utf-8?B?NUordUxRU2UzUkdvengrMVdZc2poYzJUUUlFSnk5Y09URnpwNVhjcTRSaW56?=
 =?utf-8?B?YnR2c3N4TzROVkdvZG0xRVBvb2RXNFc5dGkvNEYxNHo1U1RrSTZseHRuN2cy?=
 =?utf-8?B?cWd2VnBWcnJEQ2x6ZVlDUnpQNXV0Q3ErenhzNDBnMUZQVm9PSmk1VzluTzdD?=
 =?utf-8?B?R2ZsdFlrcVMyMlFidVBJRFBieEhxVExyeWdvbmlnMHNDeFk5N1FzS1ZDMDBH?=
 =?utf-8?B?bkJsZExWWWpPTElMNkxkT3M5QzF5QXFQUyt0RzVPVGdaZHkxS2xaeHNyWllO?=
 =?utf-8?B?bHBLUitkM0FNakpBUmx5QjJPczNialkxNlVBRy9Pb1lvdzBVSlk5UDlLY1E1?=
 =?utf-8?B?SjVhOE9mQ3gwbHJCMk5NVlRZbTFaVGErNUFpRmJDTjVxVDgySHNHeHlCdjIr?=
 =?utf-8?B?RUZNRW9qL3FNclI3cG10MUduWUlER3V3NW54WnRVQVdHYUZVSDFkWi9RU3hl?=
 =?utf-8?B?WHJra2hCVEZLTXNKTVB0QUlFNG5mNTNUWHVxM24yZVFFMDh1N05aQ0FZZ2lO?=
 =?utf-8?B?YlZFY3djUGVGNVVxR1ptQTJscmgweUZEeVZUV1Q3Q3E3NHN4TzJhMGZ0bHoz?=
 =?utf-8?B?WkZIbnpVMkFOK2lWeGtsTEw3SDhDdUNoelJmdXNFQ0pkeWpVU2wraXYrdCtS?=
 =?utf-8?B?SHVYTTB5bHVLeVFWaE1mSFpMOUhSNWFEVUNGVEZQOHhjeUJYTEVibWsyTDUv?=
 =?utf-8?B?MzY5bjVJeWR0WFIyTE1jYmx3Zks5aktmNWVQaHRhdFZGUFRXeDg1Z21lTkdh?=
 =?utf-8?B?cmdKTk9HSWJQYUJzZ0VJT2FqMmJpR1l6akV5djJzNlBqWm43b0hwUWtPRHd6?=
 =?utf-8?B?YU9TYldGOWNHbm5JTzVCaSt1NWR1VmFpSVdkbmxlSUZyYnE3S1h4UHduaEpo?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CC1FE119C18FC4EB1F4EF4EBA080129@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2cae50-6e76-479f-1164-08d9af535d1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 14:04:42.7245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btKEK8WnwAALOw+lhL12n0hIUT37cmwj+mWU0cUXR7IgeacgWTLwCpTCX1HzKOVbQ5E6jhQHLBndNrq6tYcSyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5566
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGF2ZWwsDQoNCk9uIDExLzI0LzIwMjEgMTE6MzkgQU0sIFBhdmVsIEhvZm1hbiB3cm90ZToN
Cj4gSGkgTWluYXMgYXQgYWxsLA0KPiANCj4gUGxlYXNlIGRvZXMgZHdjMiAoc3BlY2lmaWNhbGx5
IGluIEJDTTI4MzUvUlBpKSBzdXBwb3J0IEhTIElTT0MgbXVsdGlwbGUgDQo+IHRyYW5zYWN0aW9u
cyBtYyA+IDEgcmVsaWFibHk/IEkgZm91bmQgdGhpcyBjb25kaXRpb24gDQo+IGh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xNi1y
YzIvc291cmNlL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMqTDQwNDFfXztJdyEhQTRGMlI5R19w
ZyFNTU5FNkNZdldFRmVXdDhXOXBJbXdOQS1ONF8wNFU4VXNCV1FtdTlPOUJ3cTFIYWxDQXVweWI5
a3pHQkFPT01sS210NnhlZnokIA0KPiANCj4gIMKgwqDCoMKgLyogSGlnaCBiYW5kd2lkdGggSVNP
QyBPVVQgaW4gRERNQSBub3Qgc3VwcG9ydGVkICovDQo+ICDCoMKgwqDCoGlmICh1c2luZ19kZXNj
X2RtYShoc290ZykgJiYgZXBfdHlwZSA9PSBVU0JfRU5EUE9JTlRfWEZFUl9JU09DICYmDQo+ICDC
oMKgwqDCoMKgwqDCoCAhZGlyX2luICYmIG1jID4gMSkgew0KPiAgwqDCoMKgwqDCoMKgwqAgZGV2
X2Vycihoc290Zy0+ZGV2LA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXM6IElTT0MgT1VU
LCBERE1BOiBIQiBub3Qgc3VwcG9ydGVkIVxuIiwgX19mdW5jX18pOw0KPiAgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FSU5WQUw7DQo+ICDCoMKgwqDCoH0NCj4gDQo+IEJ1dCBJIGRvIG5vdCBrbm93
IGhvdyB0aGUgRGVzY3JpcHRvciBETUEgaXMgY3JpdGljYWwgYW5kIHdoZXRoZXIgDQo+IGRpc2Fi
bGluZyBpdCB3aWxsIGFmZmVjdCBnYWRnZXQgcGVyZm9ybWFuY2Ugc2VyaW91c2x5Lg0KPiANCj4g
SSBrbm93IGFib3V0IHRoZSBSWCBGSUZPIHNpemluZyByZXF1aXJlbWVudCAoYW5kIFRYIEZJRk8g
dG9vIEkgZ3Vlc3MpLCANCj4gdGhlIGN1cnJlbnQgZGVmYXVsdCB2YWx1ZXMgY2FuIGJlIGluY3Jl
YXNlZCBmb3IgdGhhdCBwYXJ0aWN1bGFyIHVzZSBjYXNlIA0KPiBpZiBuZWVkZWQuDQo+IA0KPiBJ
IGFtIHRyeWluZyB0byBsZWFybiBpZiBpdCBtYWRlIHNlbnNlIHRvIHNwZW5kIHRpbWUgb24gYWRk
aW5nIHN1cHBvcnQgDQo+IGZvciBoaWdoLWJhbmR3aWR0aCB0byB0aGUgVUFDMiBhdWRpbyBnYWRn
ZXTCoCB0byBhbGxvdyB1c2luZyBsYXJnZXIgDQo+IGJJbnRlcnZhbCBhbmQgbWM9MiwzIGF0IGhp
Z2ggc2FtcGxlcmF0ZXMvY2hhbm5lbCBjb3VudHMgKHNvcnQgb2YgImJ1cnN0IA0KPiBtb2RlIiBz
aW1pbGFyIHRvIFVBQzMpLiBXaGVuIGRvaW5nIHNvbWUgQ1BVLWRlbWFuZGluZyBEU1AgaXQgd291
bGQgaGVscCANCj4gdG8gYXZvaWQgdGhlIHRpbWUtY3JpdGljYWwgaGFuZGxpbmcgZXZlcnkgMTI1
dXMgbWljcm9mcmFtZS4gQm90aCBPVVQgYW5kIA0KPiBJTiBhcmUgaW1wb3J0YW50Lg0KPiANCg0K
QWNjb3JkaW5nIHByb2dyYW1taW5nIGd1aWRlOg0KDQoiSXNvY2hyb25vdXMgT1VUIFRyYW5zZmVy
cw0KVGhlIGFwcGxpY2F0aW9uIHByb2dyYW1taW5nIGZvciBpc29jaHJvbm91cyBvdXQgdHJhbnNm
ZXJzIGlzIGluIHRoZSBzYW1lIA0KbWFubmVyIGFzIEJ1bGsgT1VUIHRyYW5zZmVyIHNlcXVlbmNl
LCBleGNlcHQgdGhhdCB0aGUgYXBwbGljYXRpb24gDQpjcmVhdGVzIG9ubHkgMSBwYWNrZXQgcGVy
IGRlc2NyaXB0b3IgZm9yIGFuIGlzb2Nocm9ub3VzIE9VVCBlbmRwb2ludC4NClRoZSBjb250cm9s
bGVyIGhhbmRsZXMgaXNvY2hyb25vdXMgT1VUIHRyYW5zZmVycyBpbnRlcm5hbGx5IGluIHRoZSBz
YW1lIA0Kd2F5IGl0IGhhbmRsZXMgQnVsayBPVVQgdHJhbnNmZXJzLCBhbmQgYXMgZGVwaWN0ZWQg
aW4gRmlndXJlIDEwLTI4Lg0KSWYgdGhlIHRyYW5zZmVycyBhcmUgZm9yIGEgaGlnaC1iYW5kd2lk
dGggZW5kcG9pbnQgKG1vcmUgdGhhbiBvbmUgTVBTIA0KcGVyIM68ZnJhbWUgKSwgY3JlYXRlIGFz
IG1hbnkgZGVzY3JpcHRvcnMgYXMgdGhlIG51bWJlciBvZiBwYWNrZXRzIGluIGEgDQrOvGZyYW1l
IChudW1iZXIgb2YgZGVzY3JpcHRvcnMgPSBudW1iZXIgb2YgcGFja2V0cyBwZXIgzrxmcmFtZSku
DQpNYXhpbXVtIG51bWJlciBvZiBkZXNjcmlwdG9ycyBwZXIgzrxmcmFtZSBwZXIgZW5kcG9pbnQg
aXMgdGhyZWUuIg0KDQpUbyBwcm9ncmFtIGRlc2NyaXB0b3JzIHRvIHN0YXJ0IEhCIElTT0MgT1VU
IHRoZXJlIGFyZSBubyBhbnkgcHJvYmxlbS4gDQpQcm9ibGVtIG9jY3VycyBvbiBjb21wbGV0aW9u
cy4gSWYsIGZvciBleGFtcGxlIG1jID4gMSwgZHJpdmVyIHdpbGwgDQphbGxvY2F0ZSBhbmQgcHJv
Z3JhbSBtYyAqIChyZXF1ZXN0IGNvdW50KSBkZXNjcmlwdG9ycy4gSWYgaG9zdCBzZW5kIG1jIA0K
cGFja2V0cyBwZXIgZnJhbWUgdGhlbiBldmVyeSBtYyBkZXNjcmlwdG9yIHBlcmZvcm0gcmVxdWVz
dCBjb21wbGV0aW9uIGlzIA0Kbm90IGJpZyBwcm9ibGVtLiBCdXQgaWYgaG9zdCB3aWxsIHNlbmQg
bGVzcyB0aGFuIG1jIHBhY2tldHMgaW4gZnJhbWUgDQp0aGVuIG5vdCBjbGVhciBob3cgdG8gZXhj
bHVkZSB1bnVzZWQgZGVzY3JpcHRvcnMgZnJvbSBkZXNjIGNoYWluIHdoaWNoIA0KYWxyZWFkeSBm
ZXRjaGVkIGJ5IGNvcmUgLSBieSBzdG9wIHRyYW5zZmVycyAoZGlzYWJsZSBFUCkgYW5kIHJlLXN0
YXJ0IA0KdHJhbnNmZXJzIChmaWxsIGFnYWluIGRlc2MgY2hhaW4pIGZyb20gbmV4dCBmcmFtZT8g
T3IgcHVyZ2UgdW51c2VkIGRlc2NzIA0KYW5kIHNoaWZ0aW5nIGRlc2NyaXB0b3JzICJ1cCIgaW4g
YSBjaGFpbj8gWW91IGNhbiB0cnkgdG8gaW1wbGVtZW50Lg0KDQpUaGFua3MsDQpNaW5hcw0KDQo+
IA0KPiBUaGFua3MgYSBsb3QgZm9yIHlvdXIgZXhwZXJ0IGFkdmljZS4NCj4gDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IA0KPiANCj4gUGF2ZWwuDQo+IA0KPiANCg0K
