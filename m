Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9891035970A
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 10:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhDIIBc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 04:01:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:32928 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231496AbhDIIBb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 04:01:31 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5554A40443;
        Fri,  9 Apr 2021 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617955278; bh=GhnwR22/icZamqPtVUzn8uVEA4A+JPUZ16Oa3uK66xA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ZTws2G82Kv7QyHN5Qa2XoRoLgvKfY+Dky0BUmFXsOuh4Lv+TJD24BpWk45KP1ptqv
         c7YFTq+/SZShsaYfwH0KkP1eEArkkbiL/i0h/P0YmuNIO9yyqKSar2scf4PWUP9RcF
         5Fo0CNDOw9HNON6dUJ+yRgecC0gcWmCHqnzZ+CdAkUxTgP2+9Chyyt3MGpOjW0m+Tq
         w5TxBiboq1oPMaeFz9oC3BXD2OafkpJNDY11ZZ+JtLkg4M0GVkWNXTS24US/ejia6t
         fu6DDmROfVr7cewQzq1KAQEV8L9eBl30WA5aV4M4H+T/xEdDXvjVjCOWWFVdD4lzRs
         qgp3XBa9yQSYQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 126D4A0063;
        Fri,  9 Apr 2021 08:01:17 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 82EC280129;
        Fri,  9 Apr 2021 08:01:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="sDcCq0QQ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kjd9d2EW2zupl5WJT3UGA5BNVmxzUIPalc2Nsy9gAb5+eMVnazABmQfCa8a9Vvxb1zemQQW0twB/yM6ZF6fKfxT6ruDY9lLsmY3YoLSo+1UKYc/UjHBn81gDc2QXgzRud/4xKuiyy1VSQmCIpsbHoc/RRup6pcrgZNy1DsKv8d7iutkPrLTGLogxDb0YQ4bEeEUj5nBGkg6uHKpSivacSDVpTHORAykaCKCijI/ZwHqh8Dqc9x+xkx56HacPncm1Av2TvF1EVTnHrr+g5q1YyRwObqevSt2OgPf/7ce13KMQmkj98ZhKrj3I8m6UgH2CgaOBW7FCiqIrWVd8SXH0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhnwR22/icZamqPtVUzn8uVEA4A+JPUZ16Oa3uK66xA=;
 b=fGfUDLZTjZI6AyeNOM06IIc93yRZ0oNuSlIr7+nA+4/0ii3IWPDjM++xHlxrg4YsfUkh+OOBjsmP1xxtolwTH9LfNIVGhCELgppFAtta8Xlim65hiDgslzqoDBp5aPkqJnqwJzAiSfzXMcjkgvf4GSu9qW+tWT1vHxIQuFjqNpUTlpYhtYLwTBRpZ+Mphq3SVp65FItWVf52ngqLW1XhEpXfeVIXTKOtBJMhQjEoMufmDiP3qTnhy1uBGHZFexWN1z0TnA93bgA74HcNU0JelmX++RbQft9bnBvgN+mYyCc1d0ls7r7+qVgpZoIhI0x9qu8pFsxpsMKf0Y6H7KjnbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhnwR22/icZamqPtVUzn8uVEA4A+JPUZ16Oa3uK66xA=;
 b=sDcCq0QQ90rrauFqXQq5Cxg+PN6G+vEe1ClOQ29kM8D+U4AS/Lu+SyID8p8AP4QxNgg4bYCMaaQaycmixAmwBNZv+F8uqGARvWxYwQOlVZHVtcMzB4HlF9IZPRFIU7ZmmtmNx7POVrWYmmrxWB9WAVOpnpDqVyasUkSPft5AgrE=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB4728.namprd12.prod.outlook.com (2603:10b6:a03:a3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Fri, 9 Apr
 2021 08:01:16 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 08:01:15 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 6/6] usb: dwc3: host: Set quirks base on version
Thread-Topic: [PATCH 6/6] usb: dwc3: host: Set quirks base on version
Thread-Index: AQHXLOGd3Si088JpHkKcBGl9GJ5z3qqrwDkAgAATCoA=
Date:   Fri, 9 Apr 2021 08:01:15 +0000
Message-ID: <fbc6c921-114b-ed0b-ed68-b425e09e3e9b@synopsys.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
 <a792b1ea6b7083d400b3a6b38dcca70588fc5587.1617929509.git.Thinh.Nguyen@synopsys.com>
 <YG/50kPULbzZRlFj@kroah.com>
In-Reply-To: <YG/50kPULbzZRlFj@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b628aa6-4ba6-4061-c213-08d8fb2da68c
x-ms-traffictypediagnostic: BYAPR12MB4728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB472819575FC1C3B863305FFDAA739@BYAPR12MB4728.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kXl1LQqPy+nw5E6+JpZqnfTr40xDsbyo6xiIuN5AF42O9bOYQIKkmY/ENMWVX4MUDkMUbWj9YdCdHxtf6kYeISqDBJ4Lmm2FcWmrHEIBJ8HxGH0xE3FnlRhRM7F4QZVrMZTJJ/g0RR0mMzFWukfS8A28/wettqU+F7OaDzBi3qnghcawuNmzXu98H1DyKrHabVuimaBQQYBJU0Qq3VD0PwVeRMbGSfzVC6Ph60G3kt/IYUxjbzpC1YNtxkRVuUPaZmuG1BdMHOPjNVkH00THBeyEu7wzzWCxlV15pSUUlB9QKv6O+enwDB5NHH0AM3C2/PLE7QFFKLEldJRkAD7lZ8bVXwqdYnn3+fmcpBOwvUrj5s421H8CIN0d56iVtjlNziHTMybHPgmYc6k+lQo3gTUEgPhcKgl3FsUUXjidh7qKlOSjcK981zbrcKm6cgNGIHTbmMPqC+5pB68kvpL7kJUSkhZUpCphMOf8eMtT7k7gJrShOti8/Dmbxn46+2we/YLX/mVK3EHW1ZmJ5crsjE3RPQSFvrRoInfaCCu+cSG9k3Of6s7vnElkZeTfqLxSMorGcJANup+JzYe+7wsROOFnn4v8sRbj06+1t+fpF5r+7aNrNscC7yjrmNhWuYVxNnM47GTOb3Yevt8ilGCP0f8BlZkQ2/RivjG+s4APIXNWNE6anzHKXa1sMo5V63jFR9WSHVqlD2plXPTPK15xbCCUVDlu9XoPp8TCHqMObIc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(396003)(39860400002)(136003)(2616005)(8676002)(36756003)(8936002)(71200400001)(83380400001)(31696002)(66946007)(66446008)(66556008)(107886003)(76116006)(66476007)(6512007)(64756008)(26005)(110136005)(186003)(38100700001)(478600001)(31686004)(316002)(4326008)(5660300002)(54906003)(6506007)(86362001)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NFBiYzJFSHViZUtramJjamJXMmxQaEZIeERKSWZlQ1lBd2p3allFclJwQjhY?=
 =?utf-8?B?dUVydzdQTitCdC9ic3dadzRoMU9qb2txYTdBd1pzTVJFY3lIWTZiSEFST2Mz?=
 =?utf-8?B?NEQ0NWpCeDBXVTQzMlBoRllYNEM1YzdlMHZlYUp5RDRDVHBjamN4QzU5aHV5?=
 =?utf-8?B?WmZhZStKaVJNdVl3TlZ0VXEyWlkrQ1NqSlZwbS8vdXhmOXQvQVJUanh1bUNs?=
 =?utf-8?B?UjI3ejh1YlI0YjQxdVEzN3FsWEtyOHNnWVRrK3BxV3Q3YmV4a1haeXR2cnVI?=
 =?utf-8?B?b214d2sxRTRvODUzd1AzcExNOHQrNkg1N0s1bnFPNEQwd1VDbStPeWZTdGR1?=
 =?utf-8?B?RGFIWmRwYVAzdEJrV01BbHpTeVlFY2hGRkorSElHOHpPbnhoa0l6VFJxc2NV?=
 =?utf-8?B?TUg3WUpIRGNpY1lqcEtlU20wTlB3c200bGdZUk5XbzVtWlVVLytSSkgxamlG?=
 =?utf-8?B?aW5IcWxBT3RheWdQSkl1alpnUHdib3E1UU5RZmR5UUNLZjJnQ09kYVRlN01W?=
 =?utf-8?B?Z2E2dGoxWkhjeXVGa1lobGZZdmlMMVQ3UjQ2Z3diRVdodTYyZlU0ZXhqWjVo?=
 =?utf-8?B?bUNTYTcvbVo3elI3NUNnK0Ryd015VGtGa3p6RFlUdTJtWk94T0V2MDB2V3ly?=
 =?utf-8?B?Q1RNNDhWaHlqZDdtMWErRnBiSWp3TzZmWlpvY1ZTcFk0TjdMNUgvL0RzdlZ1?=
 =?utf-8?B?d2JseHA2Rlc4U2IxOC96TG1uaGs1NXRBOVlnbFVadyt4Tnk3VFZScGtuSVdq?=
 =?utf-8?B?YUFtMlYwVWM5OFNETXE5N2VQcjROQ01FMUF1M3pRdzFVMVFSRVpEamhDU1N4?=
 =?utf-8?B?NnhSU1pKd1plQ3RGTGR0QU1GZHhrR1YyNnlxYVhzL3ZNK3drZkd6bEtNVUpR?=
 =?utf-8?B?bG1idXNjbGhhSXRzckFqNVJkZDJ6NDljZ2UxNHA2MEhMNXNiWVAvREhsVjBQ?=
 =?utf-8?B?bnJQUEJTQVp6TWg3MWZmYzBhUnNXZHBYSkFJV2xCWnh1RFgvTjZDOCtqb3Mv?=
 =?utf-8?B?RWN5YmhDWGhLMEZJTzZDby9qWDkrUFN3NUlVcCtFSjBwYU9Sbm8yQy9jTm9R?=
 =?utf-8?B?TXZFYldvcXdVNjlJbVpzSkRZdERRMWtlOHlzNXRwdk5JUWtEZ2hrOUZzMWFN?=
 =?utf-8?B?WXRMcS9CYnlCOGJuaW9welBlcWJBdXlhZmY4bkIvcnF6M0NKeUtxZUlBQTd2?=
 =?utf-8?B?R0JmTm5QWC8wc09JZEF2K2tJNmJtSm1IYWlaMHk5L0xGaHZBQS82L2xFd1Jz?=
 =?utf-8?B?cnh2VlNhU0hXTlhUZmorU3pBSkR1aXdOMGd2elJ6QkVpWDhMT3JkckxwZVZT?=
 =?utf-8?B?NTdnMjRWRG8yZDUwck0zeElEYVJRT0dSNVhrYVlEOGpMMUg3Sm52U2tXYWUw?=
 =?utf-8?B?YlhVT2tTTkMyck5UYVVHSmhmaWNLZ05ObEtkOXNsa1M5K1h0Y1Q5bDlYanVt?=
 =?utf-8?B?UUZscUJjVlFJZkI4dFBqRDF1OCtXdk1xOTgxTzFsM0w3a05NYng2V0tVK2lD?=
 =?utf-8?B?YWo5T0hNOE5Bajh2d1g3WS9vUWxzbzZiQ0xlZlgwcXFUYmdPQUtZZjJqQ2xt?=
 =?utf-8?B?RTVPRDBPelZKTldUSzl4ZEZ4K2JtZS9aR3NVcDEwTmZ3V283NWhTVjZ0eG9P?=
 =?utf-8?B?dlFSQi9PU2wwTlZtRGdKcWVCbGh4NzgrbUtBajhNVkZ5eURKNmRRVDk5Yy9m?=
 =?utf-8?B?VVRYS3hoREV1V3ZtT1VnN29HZjZBamtUaDU2eGJLL2NPRzBSMHcwd2YwSkFQ?=
 =?utf-8?Q?o6n8dCcHuA0rr47MPw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A21257A155E63941BCC2F4D812764EE5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b628aa6-4ba6-4061-c213-08d8fb2da68c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 08:01:15.7408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UwH5F9y+XIaukQ4pMeM9b8B/5H79KD+g9Ll8RogkCYAAIlhMBnTHlOv53vRNJM2dBhe8Vwd4cWec/xXmIij31w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4728
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBUaHUsIEFwciAwOCwgMjAyMSBhdCAwNjo0
MjozMlBNIC0wNzAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBXZSBjYW4gY2hlY2sgZm9yIGhv
c3QgcXVpcmtzIGF0IHJ1bnRpbWUgYmFzZSBvbiB0aGUgY29udHJvbGxlciBJUCBhbmQNCj4+IHZl
cnNpb24gY2hlY2suIFNldCB0aGUgZm9sbG93aW5nIHF1aXJrcyBmb3IgdGhlIERXQ191c2IzMSBJ
UCBob3N0IG1vZGUNCj4+IGJlZm9yZSBjcmVhdGluZyBhIHBsYXRmb3JtIGRldmljZSBmb3IgdGhl
IHhIQ0kgZHJpdmVyOg0KPj4NCj4+ICAqIFhIQ0lfSVNPQ19CTE9DS0VEX0RJU0NPTk5FQ1QNCj4+
ICAqIFhIQ0lfTElNSVRfRlNfQklfSU5UUl9FUA0KPj4gICogWEhDSV9MT1NUX0RJU0NPTk5FQ1Rf
UVVJUksNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBz
eW5vcHN5cy5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL3VzYi9kd2MzL2hvc3QuYyB8IDIxICsr
KysrKysrKysrKysrKysrKysrKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5jIGIvZHJpdmVycy91
c2IvZHdjMy9ob3N0LmMNCj4+IGluZGV4IGYyOWEyNjQ2MzVhYS4uYTQ4NmQ3ZmJiMTYzIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvaG9zdC5jDQo+PiBAQCAtOSw2ICs5LDcgQEANCj4+ICANCj4+ICAjaW5jbHVkZSA8bGlu
dXgvYWNwaS5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4+ICsj
aW5jbHVkZSA8bGludXgvdXNiL3hoY2ktcXVpcmtzLmg+DQo+PiAgDQo+PiAgI2luY2x1ZGUgImNv
cmUuaCINCj4+ICANCj4+IEBAIC00Miw2ICs0MywxNyBAQCBzdGF0aWMgaW50IGR3YzNfaG9zdF9n
ZXRfaXJxKHN0cnVjdCBkd2MzICpkd2MpDQo+PiAgCXJldHVybiBpcnE7DQo+PiAgfQ0KPj4gIA0K
Pj4gK3N0YXRpYyB2b2lkIGR3YzNfaG9zdF9pbml0X3F1aXJrcyhzdHJ1Y3QgZHdjMyAqZHdjLCBz
dHJ1Y3QgeGhjaV9wbGF0X3ByaXYgKnByaXYpDQo+PiArew0KPj4gKwltZW1zZXQocHJpdiwgMCwg
c2l6ZW9mKCpwcml2KSk7DQo+PiArDQo+PiArCWlmIChEV0MzX1ZFUl9JU19XSVRISU4oRFdDMzEs
IEFOWSwgMTkwQSkpIHsNCj4+ICsJCXByaXYtPnF1aXJrcyB8PSBYSENJX0lTT0NfQkxPQ0tFRF9E
SVNDT05ORUNUOw0KPj4gKwkJcHJpdi0+cXVpcmtzIHw9IFhIQ0lfTElNSVRfRlNfQklfSU5UUl9F
UDsNCj4+ICsJCXByaXYtPnF1aXJrcyB8PSBYSENJX0xPU1RfRElTQ09OTkVDVF9RVUlSSzsNCj4+
ICsJfQ0KPj4gK30NCj4+ICsNCj4+ICBpbnQgZHdjM19ob3N0X2luaXQoc3RydWN0IGR3YzMgKmR3
YykNCj4+ICB7DQo+PiAgCXN0cnVjdCBwcm9wZXJ0eV9lbnRyeQlwcm9wc1s0XTsNCj4+IEBAIC00
OSw2ICs2MSw3IEBAIGludCBkd2MzX2hvc3RfaW5pdChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPj4gIAlp
bnQJCQlyZXQsIGlycTsNCj4+ICAJc3RydWN0IHJlc291cmNlCQkqcmVzOw0KPj4gIAlzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlCSpkd2MzX3BkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZHdjLT5kZXYp
Ow0KPj4gKwlzdHJ1Y3QgeGhjaV9wbGF0X3ByaXYJZHdjM19wcml2Ow0KPiANCj4gVHlpbmcgdGhl
IGR3YzMgY29kZSB0byB0aGUgeGhjaSBjb2RlIGxpa2UgdGhpcyBmZWVscyByZWFsbHkgd3Jvbmcg
dG8gbWUsDQo+IGFyZSB5b3Ugc3VyZSB0aGlzIGlzIHRoZSBjb3JyZWN0IHJlc29sdXRpb24/DQo+
IA0KPiBncmVnIGstaA0KPiANCg0KQ2FuIHlvdSBjbGFyaWZ5IHdoYXQgZmVlbHMgd3Jvbmc/IFRo
ZSB3YXkgaXQncyBvcmlnaW5hbGx5IGltcGxlbWVudGVkDQphbHJlYWR5IHRpZWQgdGhlbSBpbiB0
aGF0IHdheS4gV2hhdCB3ZSdyZSBkb2luZyBoZXJlIHNpbXBseSB0YWtlcw0KYWR2YW50YWdlIG9m
IHdoYXQgeGhjaS1wbGF0IGdsdWUgbGF5ZXIgY2FuIHVzZSB0byBzZXQgdGhlIHhoY2kgcXVpcmtz
Lg0KV2l0aCB0aGlzLCB3ZSBkb24ndCBoYXZlIHRvIGNyZWF0ZSBuZXcgYW5kIGR1cGxpY2F0ZSBE
VCBwcm9wZXJ0aWVzIGZvcg0KZHdjMyBhbmQgeGhjaSB0byBzZXQgc29tZSBxdWlya3MuIFdpdGgg
dGhlIGV4cGFuZGluZyBsaXN0IG9mIGR3YzMgRFQsIEkNCnNlZSB0aGlzIGFzIGEgcGx1cy4NCg0K
VGhhbmtzLA0KVGhpbmgNCg==
