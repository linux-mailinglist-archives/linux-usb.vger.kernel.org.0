Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8175D13BA75
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 08:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgAOHqI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 02:46:08 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51656 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726088AbgAOHqI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 02:46:08 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0B6F8C045B;
        Wed, 15 Jan 2020 07:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1579074367; bh=4x6IlZKnkIiZktJMmD6BhqtWGbKkn0FyfD6fAurgT7g=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=jXO4Or3FBPS4zodv561GdHBfnnfUPtrNJB/zvNtWRK11O6pdB8MdmA4U9Tmf+iWj8
         b/+xPgtT0J6yYXCRt5oV6/7znKCtmEFpMPY5JS+7Udbx3rS5Oob5pFxVXBYbs4ODfF
         X+T69FQfcq2i+SNtRB5VriG+mJVm3xF7G4aP3vtG+bWdIxkQ4LLVLnJVW/pQpx/2dO
         BZfYCaV9MqaSfwQ8sBYTLKMcM1G98vjyUmzSIEw5XPM2MjmLHIyhfOdEY7yJhH37OX
         QjsbNHvxMcdFKFMFmKXb84WKLpOvJd0oyM1ljhBsON/FMOqzWPdB5+hwr9LTq7m0cc
         ZL0fGylkA2QNQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8FFF5A0069;
        Wed, 15 Jan 2020 07:46:06 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 Jan 2020 23:45:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 14 Jan 2020 23:45:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVqxnwpcYMXPGTOaa+BnxcHWRBdnGiIMWU8D9jPVSMqhiNFJCgB92eHctJZclIb7oGHa6YZNbCF7ug35hjUtfJBMuwrJICpwxE7UieqqidQtV0EtkyDdg6HmQokD9l8L50T4p7I3qjK0UOf7GJLY+/8myR8ZnVZFBu2CsjJH5v7D0R5WBRpWV0KizTFfJksNo81kBjrzdAEf7vL1mtShd8mR8djfQFm1DFHiGBTvcDXTMmKmXvYmvI8GcXSVdMnH0HSxfuZBaBJxvlcg3wKfMHz5K5QLiBQuEh9D9Bnbwyh+/P2G/Fyqe684U7qjQNrrl+slZPDKwMtFk8BVheDepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x6IlZKnkIiZktJMmD6BhqtWGbKkn0FyfD6fAurgT7g=;
 b=Xf+aT/hOPu7/C6qqYZqqVBezx3YrmL6PcbvdJvvDNCRjrWa6ob/3T27kDzI7swDKkexlWt+26bkFoHwbhseYfkHVAi4/++NM5WWq/XLZQs2Ek2nYqX5POUP5945MntU3cQ2N/ID6Rnddj20+iUYtbc3nqf/9SlvU8oxhvHjcLZRR55+bm7frgnebmjqj9H6yIZ4RlqKsry5ZWw9qJZ6tL1pmYre7Z9NuKA+fv1tYgxYzL62k2NL25yQcMSm90iBKZQSl5wGIto21TEmG/70LhAg+KiGAd0B/QL1b065kmwd1nObUk6cgNN2/haiF2yMVcyFf1XQxvPg/bZtn4v0++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x6IlZKnkIiZktJMmD6BhqtWGbKkn0FyfD6fAurgT7g=;
 b=jLMe4jInOXx1BK5zbRuRYcR1TfXUIJP5Dnhnn254TIblugjzMH7h/iSTk8L29t/vbc1PKkiioU9L29SMrtu41mE6WVUeeYrkwQuPWiFJW5xqeyOZ8KGEhJqCJyc59CpMSxdJO8WukuuiMiFtw/f3C+y9prKvJCVFU23VVN1QWYg=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB4317.namprd12.prod.outlook.com (10.255.224.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Wed, 15 Jan 2020 07:45:47 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 07:45:47 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Adrian Carpenter <adrian@fizzyade.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: dwc2: handle gadget mode disconnect correctly
Thread-Topic: [PATCH] USB: dwc2: handle gadget mode disconnect correctly
Thread-Index: AQHVyj49UUrIkwz9Rkm0JDdqL0Tr7afrWxsA
Date:   Wed, 15 Jan 2020 07:45:47 +0000
Message-ID: <dc159095-20ea-7013-4130-923046d85a6d@synopsys.com>
References: <CABBSF+K5J0zo9JaACQ5xY-Cis8bARqLdRuk4YVFLrM8GG0BhQQ@mail.gmail.com>
In-Reply-To: <CABBSF+K5J0zo9JaACQ5xY-Cis8bARqLdRuk4YVFLrM8GG0BhQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8502b441-d83a-4ac9-780c-08d7998eef5e
x-ms-traffictypediagnostic: MN2PR12MB4317:
x-microsoft-antispam-prvs: <MN2PR12MB431793E910AC647FFD817618A7370@MN2PR12MB4317.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(366004)(396003)(136003)(346002)(199004)(189003)(71200400001)(86362001)(316002)(2906002)(81166006)(81156014)(8676002)(66946007)(31696002)(8936002)(64756008)(110136005)(66556008)(2616005)(36756003)(66446008)(66476007)(186003)(6506007)(91956017)(76116006)(53546011)(26005)(31686004)(478600001)(5660300002)(6486002)(6512007);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB4317;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f0gixnB2ggu6KudjbyDfbnsr3Op6vCTfSDmYdJIU2/2eIgyHayAfxGEOJkFn1J2MSO3oZr33K2q4IPiTf/H5qa2YAmy8nFEAsbruVJ8nRCX+FVzt1sgrvPb0pgy8M8uReBl/5sffYxslBnb4Cj0XpBSLBRzwRETa3w3ZlgTJO07S3+JpKfuv2KLRt7Rpg6APF+HmGs048CcrEDd5V+x6w3OhChxLg3CewI/Hfm8VqbLaBW/ELEtVhWP/eL9cMPixKaSxcgnBy5aPhhG7JF2WUghq4mQmx0n8pX1FHjWrVpV0YUdTRN3AP48AGONi/R3X+opDPuPl940pupaqm2a56857CpR4M9ATY/UTEsoIQGI5yESeEYq+0E+9oE5Y3qnfbAITyL0af7VKHC20ArKEU5h71Cgmq1LOai2/heRXE1bAj+TxHsZk1oy6YFiKuGo1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <198E7C926F00EA4A8631609ED7A75A66@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8502b441-d83a-4ac9-780c-08d7998eef5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 07:45:47.4913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vDrAuFDSiipmHfNS5V2sgV4mkHSwXWQpPo+nO7rPCvXJIi/NK20HQ6ZGDQl4IAZy/lIpZKhHf0zHz+c6XgpQ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgQWRyaWFuLA0KDQoNCk9uIDEvMTMvMjAyMCAxMDoyMCBQTSwgQWRyaWFuIENhcnBlbnRlciB3
cm90ZToNCj4gZHdjMiB1c2IgZHJpdmVyIGRvZXMgbm90IGhhbmRsZSBkaXNjb25uZWN0IGluIGdh
ZGdldCBtb2RlIGNvcnJlY3RseSwNCj4gdGhpcyByZXN1bHRzIGluIHRoZSBnYWRnZXQgc3RpbGwg
dGhpbmtpbmcgaXQgaXMgY29ubmVjdGVkIHRvIGEgaG9zdC4NCj4gDQo+IENoYW5naW5nIHRoZSBz
dXNwZW5kIGludGVycnVwdCBoYW5kbGluZyBpbiBnYWRnZXQgbW9kZSB0byByZWZsZWN0IHRoZQ0K
PiBjb3JyZWN0IGRpc2Nvbm5lY3RlZCBzdGF0ZSBmaXhlcyB0aGlzLg0KPiANCj4gQ2M6IGxpbnV4
LXVzYkB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+DQo+IENjOiBN
aW5hcyBIYXJ1dHl1bnlhbiA8aG1pbmFzQHN5bm9wc3lzLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
QWRyaWFuIENhcnBlbnRlciA8YWRyaWFuQGZpenp5YWRlLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVy
cy91c2IvZHdjMi9jb3JlX2ludHIuYyB8IDkgKysrKy0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLXVwck4gLVggdXNi
LXZhbmlsbGEvRG9jdW1lbnRhdGlvbi9kb250ZGlmZg0KPiB1c2ItdmFuaWxsYS9kcml2ZXJzL3Vz
Yi9kd2MyL2NvcmVfaW50ci5jDQo+IHVzYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jDQo+
IC0tLSB1c2ItdmFuaWxsYS9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jICAgIDIwMjAtMDEt
MTMNCj4gMTM6NTY6MDMuOTg4OTUwMTMyICswMDAwDQo+ICsrKyB1c2IvZHJpdmVycy91c2IvZHdj
Mi9jb3JlX2ludHIuYyAgICAyMDIwLTAxLTEzIDE3OjI5OjAzLjQ5NjM3NzA3NSArMDAwMA0KPiBA
QCAtNTM2LDEzICs1MzYsMTIgQEAgc3RhdGljIHZvaWQgZHdjMl9oYW5kbGVfdXNiX3N1c3BlbmRf
aW50cg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiAgIHNraXBfcG93ZXJfc2F2aW5n
Og0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgLyoNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICogQ2hhbmdlIHRvIEwyIChzdXNwZW5kKSBzdGF0ZSBiZWZvcmUgcmVsZWFzaW5nDQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAqIHNwaW5sb2NrDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAqIFN1c3BlbmQgc2VlbXMgdG8gYmUgY2FsbGVkIGluIHRoZW4gZXZlbnQNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICogb2YgZ2FkZ2V0IG1vZGUgZGlzY29ubmVjdA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICovDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGhzb3RnLT5s
eF9zdGF0ZSA9IERXQzJfTDI7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGhzb3RnLT5seF9z
dGF0ZSA9IERXQzJfTDM7DQo+IA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAvKiBDYWxsIGdh
ZGdldCBzdXNwZW5kIGNhbGxiYWNrICovDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGNhbGxf
Z2FkZ2V0KGhzb3RnLCBzdXNwZW5kKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdXNiX2dh
ZGdldF9zZXRfc3RhdGUoJmhzb3RnLT5nYWRnZXQsDQo+IFVTQl9TVEFURV9OT1RBVFRBQ0hFRCk7
DQo+ICAgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAg
ICAgICAgIGlmIChoc290Zy0+b3Bfc3RhdGUgPT0gT1RHX1NUQVRFX0FfUEVSSVBIRVJBTCkgew0K
PiANClNvLCBwZXIgeW91ciBwYXRjaCBpZiBob3N0IHdpbGwgc3VzcGVuZCBkZXZpY2UgdGhlbiBp
dCB3aWxsIHRyZWF0ZWQgYXMgDQpkaXNjb25uZWN0IGFuZCBvbiByZXN1bWUgc2hvdWxkIGJlIHJl
LWVudW1lcmF0ZWQgYWdhaW4/DQpBY3R1YWxseSwgc3VzcGVuZC9kaXNjb25uZWN0IGZsb3cgdmVy
eSBkZXBlbmRlbnQgb24gSFNPVEcgY29yZSBhbmQgDQpwbGF0Zm9ybSBhcmNoaXRlY3R1cmUsIFBI
WSdzLg0KDQpCZWxvdyBjaGlycCBmcm9tIHByb2dyYW1taW5nIGd1aWRlIGZvciBIU09URyBjb3Jl
IG9uIGRldmljZSBkaXNjb25uZWN0IGZsb3cuDQoNCjcuMyBEZXZpY2UgRGlzY29ubmVjdGlvbg0K
VGhlIGRldmljZSBzZXNzaW9uIGVuZHMgd2hlbiB0aGUgVVNCIGNhYmxlIGlzIGRpc2Nvbm5lY3Rl
ZCBvciBpZiB0aGUgDQpWQlVTIGlzIHN3aXRjaGVkIG9mZiBieSB0aGUgSG9zdC4gVGhlIGRldmlj
ZSBkaXNjb25uZWN0IGZsb3cgdmFyaWVzIA0KZGVwZW5kaW5nIG9uIHRoZSB2YWx1ZSBvZiB0aGUg
T1RHX01PREUgY29uZmlndXJhdGlvbiBwYXJhbWV0ZXIuDQoNCldoZW4gT1RHX01PREUgPSAwLDEs
IG9yIDMNCldoZW4gT1RHX01PREUgaXMgc2V0IHRvIDAsMSwgb3IgMywgdGhlIGRldmljZSBkaXNj
b25uZWN0IGZsb3cgaXMgYXMgZm9sbG93czoNCjEuIFdoZW4gdGhlIFVTQiBjYWJsZSBpcyB1bnBs
dWdnZWQgb3Igd2hlbiB0aGUgVkJVUyBpcyBzd2l0Y2hlZCBvZmYgYnkgDQp0aGUgSG9zdCwgdGhl
IERldmljZSBjb250cm9sbGVyIHRyaWdnZXIgR0lOVFNUUy5PVEdJbnQgW2JpdCAyXSBpbnRlcnJ1
cHQgDQpiaXQuDQoyLiBXaGVuIHRoZSBkZXZpY2UgYXBwbGljYXRpb24gZGV0ZWN0cyBHSU5UU1RT
Lk9UR0ludCBpbnRlcnJ1cHQsIGl0IA0KY2hlY2tzIHRoYXQgdGhlIEdPVEdJTlQuU2VzRW5kRGV0
IChTZXNzaW9uIEVuZCBEZXRlY3RlZCkgYml0IGlzIHNldCB0byAx4oCZYjEuDQoNCldoZW4gT1RH
X01PREUgPTIsIG9yIDQNCldoZW4gT1RHX01PREUgaXMgc2V0IHRvIDIsIG9yIDQsIHRoZSBkZXZp
Y2UgZGlzY29ubmVjdCBmbG93IGlzIGFzIGZvbGxvd3M6DQoxLiBXaGVuIHRoZSBVU0IgY2FibGUg
aXMgdW5wbHVnZ2VkIG9yIHdoZW4gdGhlIFZCVVMgaXMgc3dpdGNoZWQgb2ZmIGJ5IA0KdGhlIEhv
c3QsIHRoZSBEZXZpY2UgY29udHJvbGxlciB0cmlnZ2VycyBHSU5UU1RTLlVTQlJzdCBbYml0IDEy
XSANCmludGVycnVwdCBiaXQuDQoyLiBXaGVuIHRoZSBkZXZpY2UgYXBwbGljYXRpb24gZGV0ZWN0
cyBHSU5UU1RTLlVTQlJzdCwgdGhlIGFwcGxpY2F0aW9uIA0Kc2V0cyBhIHRpbWUtb3V0IGNoZWNr
IGZvciBTRVQgQUREUkVTUyBDb250cm9sIFhmZXIgZnJvbSBIb3N0Lg0KMy4gSWYgYXBwbGljYXRp
b24gZG9lcyBub3QgcmVjZWl2ZSBTRVQgQUREUkVTUyBDb250cm9sIFhmZXIgZnJvbSBIb3N0IA0K
YmVmb3JlIHRoZSB0aW1lLW91dCBwZXJpb2QsIGl0IGlzIHRyZWF0ZWQgYXMgYSBkZXZpY2UgZGlz
Y29ubmVjdGlvbi4NCg0KVGhhbmtzLA0KTWluYXMNCg==
