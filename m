Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0C62F2593
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 02:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730779AbhALBeM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 20:34:12 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53456 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729312AbhALBeI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 20:34:08 -0500
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 100B140147;
        Tue, 12 Jan 2021 01:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610415188; bh=C5UDexWmrqrFOgoYNk+BDLJN/bkmE9LTQ03RRUG3wXU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=mTEmEeKOFu6qjq66FYtpUFgwzfDPQSfLWAhOdsdflF/UmjeKVMiLsabXIli/OwvF9
         u6A2PZDGWmPMOFC/bMU6+kMX82l0B7X3cB0xqHMeA2/7GW03FYY7nn/ItNYTbyZQ+E
         X0I/728sBIWNOV+vYeevBD6yQjEe/SNx18d+rF8FcKlsfrgik5oRPEJn/GtRpjka2H
         CcQ8AZqBVB79YqQtF3ZEm75aChfngWabzIqrA8zJYzdoXVg6u/Y7lBZTAMIi8WGj0M
         AFSD3O9wFrXLLYngAU25y68kKDUf2ViK7CeVtHw7oWIT3Hb0ykRFl5jLDf2imi6/9W
         CoDE39exez6bw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3D162A0082;
        Tue, 12 Jan 2021 01:33:05 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1AEA6802BD;
        Tue, 12 Jan 2021 01:33:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ICj/UybS";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMIQZQ8d5+1tBzMJRCJJAKhGl/jY+S7PdMoC76lzTHaf3ENYsesaBm8H8MBxvtZBqGjTXYdx36tdmPEbtoEQKM41qrD2lq6SEnX+MM6V39+NBpW3E3RgQUSP+xDqMEFlKBe0ALOG1Vn/e/uCLJ5mkkcwWZU+44LTPQIwmB6DXV6jX7tHwfnyphDvOv2QQ0lc4JXUei0DkmidYddfuixKTx3pUWQOowMMae/ePGkt/ikQ1QWSQgFCUWGbHFu5OO3P9qyDozoWq3OZ2xawEEcJEMN6WLGzP1MX5dMeAc3oZfu6/hUjT3+P7ta6Oa1SxJ5nJlLchiY6lLaFncheQuS3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5UDexWmrqrFOgoYNk+BDLJN/bkmE9LTQ03RRUG3wXU=;
 b=L/QoyALQ643I5bLapnJ+SjKgjSCf1F2tQtI+vj428hq0DXQFAu98drym8a4/4K7o62yi3aZmD6AW6mVx2x+f9ai+aUsjJ6StwSd47ZQwpjYl4lrDUmsK86VxNHys2Of12omQ1f1dftmf75ORQCv7eBUFtxCdTw1sR243FdWg8zg6fyMcnLIwYUQNTH8it5/SaxPSjUF2yH4nzVta4NntTccFzEyUdyalq/bC/l1PegPefcR0OCSHuuWKwpKZ8HGteUOLp/oSTiq4erVINbAQ0R4vQnGcDkokmTlBqoUsh1i4sHU9rtPwFCeaKdzU2T9RgolhiBEZISGTtRD4mrs0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5UDexWmrqrFOgoYNk+BDLJN/bkmE9LTQ03RRUG3wXU=;
 b=ICj/UybS0CGcyIvQ306Uf4bWSDb9TPwDtmMrgbdsyIjCE9qbnHsR4oroyaPshs5unRo3oYj6mezHhFkzmWH+y3DQKBenNXqFNG3MEb74zdVK2uyXrrxyzfc9qsVbRFExAFRXrwN18VthG56WA8EbRLvJzgUP9BhARtkwedOVyug=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3158.namprd12.prod.outlook.com (2603:10b6:a03:13a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 01:33:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 01:33:00 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Peter Chen <hzpeterchen@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: udc: core: Introduce started state
Thread-Topic: [PATCH] usb: udc: core: Introduce started state
Thread-Index: AQHW6Fn42t/s7d2V5ECRC4W61zuEWKoi8RqAgAAEU4CAAA3kAIAAMB2AgAABlwA=
Date:   Tue, 12 Jan 2021 01:33:00 +0000
Message-ID: <598a45c9-1202-eef7-f0e8-2b87c4882a9f@synopsys.com>
References: <a7c4112fcd4dc2f0169af94a24f5685ca77f09fd.1610395599.git.Thinh.Nguyen@synopsys.com>
 <20210111212955.GA1209265@rowland.harvard.edu>
 <1e5bbddf-df52-d293-d27d-9cb034eadce8@synopsys.com>
 <21c4feb3-a74b-3374-d401-438f1e62a477@synopsys.com>
 <20210112012719.GA16285@b29397-desktop>
In-Reply-To: <20210112012719.GA16285@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9f8ba7e-07ad-4dea-be4d-08d8b699ffb7
x-ms-traffictypediagnostic: BYAPR12MB3158:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB315861BDA68F1CD9FEBE3726AAAA0@BYAPR12MB3158.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0HifCp91v0YDsLykDu/GPEehGk8fzUKLkQ8Ubzm8rff1QkBngEi49/3Ba2DaPz1v9fh3D3YVno23xu6yejQdgrG9ADIzsXDtD/GaLq6l9qfZgf5/bPdYAlYi8oCha4VbL4nI5/CGRnHXJ/hpcNXxts5icstKmmCjzKH/AjNLYg8rZjrYkL/FS4FeYsJk1dqQ+8IdEWPjwfxAmdp1fCCiSJPbxWI0bGJIp7AHj3ZphF38V7TznkDvSNR+lWqZX4VzMIxNJzBDox/O1v3+TdJnHkAq9EpxwBDROzlD6Pja6aMLm49eE6+UfRa21Sj/5n4NGeTh1wM9gsXt6Tmf+yUPRmI1GG0AItPMN2YrVoJtS2MENJsHJfdb4Ph9PuyZrpSJiI12+0wGuedF0yTJXoMvkSPq0MBY4rLufOBHp194fJdTsJWg56Tdvd8ugJ2f/Ze0EnMyJeQvTEzvWmqA8cSeMo43ZdukGYVZQ7zGNQ0RkYw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(136003)(346002)(366004)(76116006)(66946007)(66556008)(8676002)(66476007)(83380400001)(64756008)(66446008)(7416002)(86362001)(8936002)(31686004)(110136005)(54906003)(6512007)(478600001)(2616005)(26005)(36756003)(6486002)(186003)(31696002)(5660300002)(71200400001)(6506007)(2906002)(316002)(4326008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z3JtNTFGU2wrTGJmWFYwRW5jSXdaU0lhV1k4RU5WTjQ3RWtHRnJaT3ptaW1E?=
 =?utf-8?B?dHpVS3BHWThSaW42bmZmUnlNOW1WNDRDMUV6WFI1dVh5dWJIdit3aGZhTkRh?=
 =?utf-8?B?eVR5YkczdGQ1RDBJanhURkxXQTdBNnJYYjVreWY3cFBPSjF5L1RKUTBQSTR1?=
 =?utf-8?B?bkh0WkEvaVB6Z0oxQnA0MmlodU5OOThOT0ROVTNNaENaNGZ1cVlxajkxa3Y2?=
 =?utf-8?B?QytDRXFXSWw1Vi9TUTQ1Qy82VkNYQUd1N2JUVjFIUGMxMCtRYzA0VTlQeExS?=
 =?utf-8?B?TEZPSW1QbWZUVEs1U3Z3cmhUck56ZnZNdVV3dEZhYW1mWnZ1dHZ1V1kzWlIx?=
 =?utf-8?B?bGx3VmtHcmhJNTlyUks5ekNScUZjSHpMbU5yTjVpUXQ5dWNTWHBhOWlGUG1z?=
 =?utf-8?B?eXpwbzM2SlJGVUVGTFc5N05lZ2tKUDBreGVBYXFVdHY1bWdwVS9YZ3l6b1lr?=
 =?utf-8?B?c0NZNXlrOHhOQTJCQ0o2U3B2elRzb3pyci9IMXpnT3BHYVN2a2cvdjRaemJN?=
 =?utf-8?B?bHk4V1NVc3QxcTJ5b0VkTXA0T1poczNabCsrNkpBNFIzL1dGT3ZRVUQyd0Y0?=
 =?utf-8?B?aStudHAxQjNFaG45VDQ0L2dsY01QMWgyeDQ2L0VmVDk5aFd6YzdLcCtjOXQr?=
 =?utf-8?B?dTZoampHbXRnbEpFNTdMQnBMeDY4T29taUdldW9RT0xwdWJuRmFrQ2NYL0kv?=
 =?utf-8?B?NFZZWElRaHJYY1FFUEYvTFNSbVdmVU5vNHQ0QlhuSktIeUVxU2h0UDRSZlhq?=
 =?utf-8?B?L1dKMEVRZE9aS2JSR0VxZmVMeTJaU0s0ek9nczN2RlJiQm53alRDbHlJRy9J?=
 =?utf-8?B?NW1zWjZWekNCM3dJcFBScDBYWTI1RmdNS3pYR09WWEVURmo4QWIybitueEVS?=
 =?utf-8?B?WFpCaUVvU1FNMnE3TE5KSUxvQVVSYkZMOFU0SXRTeXFkWEliSnFlVXNTQ3Ax?=
 =?utf-8?B?WjNzNVp1YlZPVWVmdmwvTUhPVUZqRkFDbEoyM3hJM3ZNVXhNK2toSnF1Zk9L?=
 =?utf-8?B?em9oNTY4ZUxzRTBXNDdwZGg3NGlZSGNzVmFtNXNXTm5JdmdWcjFQYlJrUi8r?=
 =?utf-8?B?UHpydkZUNllubnFSOFlLOWZhZ0JyTEhwaUVublVrcjllY3ZySDhMcktWRlpG?=
 =?utf-8?B?NUtSRXk3c0g1ZW5pZ1Z6bjcvVEkxa3Jjc3dqSGpUNGJJd3JvRGtKTUY0cGZQ?=
 =?utf-8?B?MUQ2VFlYNCtZRmxZcVl1T0ZaaEpvdkN5QlZNOFM1WEhUWDdiVEdFUDREdnh5?=
 =?utf-8?B?ZWFVNUJaTDNaK0hldnlvVzY2V05tejZqaWtVNEhlZldGUU9NVTB6bHRZNDJQ?=
 =?utf-8?Q?YP/+EmsbYPxuc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D01FA87AB1ED5F4D8BC90955333B2562@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f8ba7e-07ad-4dea-be4d-08d8b699ffb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 01:33:00.8778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGJ06IybuUgb9ZpXkO5u7bqMlApvrRxbsEw2f1zabWanUUzDouas3GBgioZzGkik0x8ERZ4JbW/8hoW8hP6oVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3158
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UGV0ZXIgQ2hlbiB3cm90ZToNCj4gT24gMjEtMDEtMTEgMjI6MzU6MDcsIFRoaW5oIE5ndXllbiB3
cm90ZToNCj4+IFRoaW5oIE5ndXllbiB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IEFsYW4gU3Rl
cm4gd3JvdGU6DQo+Pj4+IE9uIE1vbiwgSmFuIDExLCAyMDIxIGF0IDEyOjM4OjA1UE0gLTA4MDAs
IFRoaW5oIE5ndXllbiB3cm90ZToNCj4+Pj4+IEZvciBzb21lIFVEQ3MsIHRoZSBpbml0aWFsaXph
dGlvbiBzZXF1ZW5jZSBieSB1ZGNfc3RhcnQoKSBzaG91bGQgbm90IGJlDQo+Pj4+PiByZXBlYXRl
ZCB1bnRpbCBpdCBpcyBwcm9wZXJseSBjbGVhbmVkIHVwIHdpdGggdWRjX3N0b3AoKSBhbmQgdmlz
ZSB2ZXJzYS4NCj4+Pj4+IFdlIG1heSBydW4gaW50byBzb21lIGNsZWFudXAgZmFpbHVyZSBhcyBz
ZWVuIHdpdGggdGhlIERXQzMgZHJpdmVyIGR1cmluZw0KPj4+Pj4gdGhlIGlycSBjbGVhbnVwLiBU
aGlzIGlzc3VlIGNhbiBvY2N1ciB3aGVuIHRoZSB1c2VyIHRyaWdnZXJzDQo+Pj4+PiBzb2Z0LWNv
bm5lY3Qvc29mdC1kaXNjb25uZWN0IGZyb20gdGhlIHNvZnRfY29ubmVjdCBzeXNmcy4gVG8gYXZv
aWQNCj4+Pj4+IGFkZGluZyBjaGVja3MgdG8gZXZlcnkgVURDIGRyaXZlciwgYXQgdGhlIFVEQyBm
cmFtZXdvcmssIGludHJvZHVjZSBhDQo+Pj4+PiAic3RhcnRlZCIgc3RhdGUgdG8gdHJhY2sgYW5k
IHByZXZlbnQgdGhlIFVEQyBmcm9tIHJlcGVhdGluZyB0aGUNCj4+Pj4+IHVkY19zdGFydCgpIGFu
ZCB1ZGNfc3RvcCgpIGlmIGl0IGhhZCBhbHJlYWR5IHN0YXJ0ZWQvc3RvcHBlZC4NCj4+Pj4+DQo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5j
b20+DQo+Pj4+IElzIHRoZSBuZXcgInN0YXJ0ZWQiIGZpZWxkIHN1YmplY3QgdG8gcmFjZXM/ICBX
aGF0IGhhcHBlbnMgaWYgdGhlcmUgYXJlIA0KPj4+PiBjb25jdXJyZW50IHJlcXVlc3RzIHRvIHN0
YXJ0IGFuZCBzdG9wIHRoZSBVREM/DQo+Pj4+DQo+Pj4+IEFsYW4gU3Rlcm4NCj4+PiBUaGUgY2Fs
bGVyIG9mIHRoaXMgdXNiX2dhZGdldF91ZGNfc3RhcnQvc3RvcCgpIHNob3VsZCB0YWtlIGNhcmUg
b2YgdGhlDQo+Pj4gbG9ja2luZy4gSXQncyBhbHJlYWR5IGRvbmUgaW4gdGhlIGNhc2Ugb2YgZHJp
dmVyIHByb2JlL3JlbW92ZSwgYnV0IG5vdA0KPj4+IGZvciB0aGUgc3lzZnMgc29mdF9jb25uZWN0
LiBNYXliZSBJIHNob3VsZCBhZGQgdGhhdCB0byB0aGlzIHBhdGNoLg0KPj4+DQo+IFRoZSB1ZGNf
YmluZF90b19kcml2ZXIgKGNhbGxzIC0+c3RhcnQpIGFuZCB1c2JfZ2FkZ2V0X3JlbW92ZV9kcml2
ZXIoY2FsbA0KPiAtPnN0b3ApIGFyZSBwcm90ZWN0ZWQgYnkgbXV0ZXggdWRjX2xvY2ssIHNvIGRv
bid0IGhhdmUgY29uY3VycmVudCBpc3N1ZSBmb3INCj4gaXQuIEZvciBzb2Z0X2Nvbm5lY3QsIEkg
dGhpbmsgeW91IGNvdWxkIGFkZCB0aGUgc2FtZSBtdXRleC4NCj4NCg0KUmlnaHQuIEkgd2FzIHN1
Z2dlc3RpbmcgdG8gZG8gdGhhdCBpbiBhIHNlcGFyYXRlIHBhdGNoIDopDQoNClRoYW5rcywNClRo
aW5oDQo=
