Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E2B15425A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 11:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgBFKto (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 05:49:44 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43330 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727874AbgBFKtn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Feb 2020 05:49:43 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7399B407FF;
        Thu,  6 Feb 2020 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1580986182; bh=8ifnRY8i0ZxMIH20BZX9T9s0DF6iD5DNQcIeiWKBIkQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=b9Zq3TJkE93G3rbMKw288ha9CImGW69IGQPjjxH//VYQfsD/aGjpy3yaiMylvaiiS
         9eKmnJdMLc7u/uW9junZgeidrEyc/o/u7J8cLOgJGly0hQ1NBEJxMkQaUHlHmfvbjM
         CTExWkzoGfV2Sr1mKf+7mxbmIajpaNcZHR62zpctNLT5OCIG87p7Qhy2mforA6MWlK
         pzVbjvfSUMS3ZlAGtPZyTpsvZbI03V8iYbuIWqdMjhNNl3jEvogQzek9zMYzqdlArN
         GcdGrkJAsTXJxZa2oleVI/uTP4DLyHEEJ+PTNSnXop0BU1aRhjfuKwZJEUcTCWEEIo
         GAbl1SebAdX+A==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 26271A008A;
        Thu,  6 Feb 2020 10:49:33 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 6 Feb 2020 02:49:28 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 6 Feb 2020 02:49:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9NWOEHJB5ZVdhepv1BNW6zYszHFwMxVGelTPS6R+WEdLWNBgF7ral29+UY/aZ58J8QL9kfLNQzNCyUe0kZBzPikeFFClKZKT991W0LOsPZnZYtr2xYW77xideDlaYcxF/2kJKrD3BrgpXBE0vOPDbIAWWSmgKIA8fpZYfCPciQ3y0Po6WBcXO6LZpOAqfOWrnQ1qLv1fuXAimN3X7SQxw9M7mfz9goAX9GfDBMhP8w/W5cIaZ8LlPKRbfw+kVfnWWKhx0sfZ8UUOeBNngOZHOLfY6ksRhlA3Lohq8el5JlQD+IrQX1eRrJmL18Uc+at7U8XSKKmV2yZ/1mB+dXtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ifnRY8i0ZxMIH20BZX9T9s0DF6iD5DNQcIeiWKBIkQ=;
 b=Klmzhi8JEswNkxJj3CK7AHrYMfdkDT3jC4KfWjzCK3dCDZPMAjJAJxk6RDDlB9phNKeesdU9S2KMR/burUCF/ux5HnxBnXJC4JuHUJVxYZri77ZqQ4tqFjB3qxkcLkELinr7DFicD4O/cw4+YnlFvGyz0J+VeosCVqOqAiLO3xEbA+ujUlkgr6feAHjZco3dEDB+iicA4EBC2oamQJiXFsZ1WZyWmYQ4pN7f341HZqYt8UX08E48fhXuB8rhzDeMBwLlU4236w5Jq4M7mUiW6gmtpmiE0wlcbhAgY8qwMKpee/pKb3IwblNCHQhheITqyEwjcLZTYZmjyv00A5glGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ifnRY8i0ZxMIH20BZX9T9s0DF6iD5DNQcIeiWKBIkQ=;
 b=BePD5Wl6Ix3vxGj/3IU4CaDzaMFCxvuPwUaHEN78CjG4rwLEzxoIyWx80pbaxe8Pt1nBDF7kRKr2qcRjMcH12EY0a5yRjgPYg0fIZWSh5uFEsuLlFiKQ2F9TsnFbiL9M46NBU4R7tkpKEDPbQPKJDF4gjXbLSAIoSaCbhWyiQ1c=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3902.namprd12.prod.outlook.com (10.255.238.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Thu, 6 Feb 2020 10:49:26 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2707.020; Thu, 6 Feb 2020
 10:49:26 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "christoph.muellner@theobroma-systems.com" 
        <christoph.muellner@theobroma-systems.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Keeping <john@metanate.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>
Subject: Re: dwc2: gadget mode and timeout with GRSTCTL_CSFTRST
Thread-Topic: dwc2: gadget mode and timeout with GRSTCTL_CSFTRST
Thread-Index: AQHV3DHmbyoEXObIA0+25jOL9DUOU6gN/c2A
Date:   Thu, 6 Feb 2020 10:49:26 +0000
Message-ID: <aeb7c81c-7ddf-823d-8c8f-91abe281bae6@synopsys.com>
References: <3600884.FGW0xRIbGs@phil>
In-Reply-To: <3600884.FGW0xRIbGs@phil>
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
x-ms-office365-filtering-correlation-id: ccc570e0-5d7e-44b5-b22a-08d7aaf23c15
x-ms-traffictypediagnostic: MN2PR12MB3902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3902C1B961F2C8BD3854B89EA71D0@MN2PR12MB3902.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0305463112
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(366004)(396003)(136003)(376002)(199004)(189003)(186003)(31696002)(6486002)(4326008)(6512007)(66476007)(66556008)(64756008)(66446008)(478600001)(66946007)(76116006)(91956017)(71200400001)(5660300002)(36756003)(31686004)(81166006)(8936002)(2616005)(53546011)(2906002)(8676002)(86362001)(81156014)(6506007)(316002)(110136005)(26005)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3902;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GaSwaA8mw4Vod+shcglL8zpX3uF7F74TDufEOpBT4iHE7xsnru6ml1L+foafr02Idw0ohpqSGYek6YBvsEfCWiLPVz+MbCfH54v6P3C2fk1joAMVhoJrowE9R8alqYnhzGRZGpETJ0GecJidyFpfrXR+dgViP609pD/PRTJcek7q+mcC92YGPgHVDeUPpLNZ93WZ1Iutbi8GMxH06tkLQwsbgONBXh60q1K7wqcfSyMQNEPnTAsUrCjIIECsIzILpRSOfBg+IwBSJL0wtcG0Qvyc39fznvpZiSDnTVQnQWIvZu6EIQKLR0lk716lH5sdvW0Khmqamfy7+NWS/e8vGeF9WVosXONgwh6KneDRFxUiDRFmEb0U2gFG1Vf4jTFaGOa7ajkVB/pkHZHWMx9Urhlx8PwFLyGS/xCqA1RM16x2SKZuT1qvwDPWtTL3EtXo
x-ms-exchange-antispam-messagedata: QfHLubzT2+1Slqq7kl5ybOq4DAfjuT1KD1y0pJiMVSzoU+Jt0nGU8LdPwH5zXKJvs6j5JuNpXx9+CdHRNfZou7tppu8qmcST6AqsA8heo4NbmMrc6ZTs8zaNj5eFWxoTugn6JOFVS2aWAvIXVvdavw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADDE3620032E424887235C9B434B22C7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc570e0-5d7e-44b5-b22a-08d7aaf23c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2020 10:49:26.1434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /bUwmdvglVPTTltddfNebXiQvb9WksfoM2hq0SJiPRKcUdS1DAQpiLAXfWDpDFN/7olopSo6sDeWT11hqmXZmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3902
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSGVpa28sDQoNCg0KT24gMi81LzIwMjAgNjozNyBQTSwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6
DQo+IEhpLA0KPiANCj4gcmlnaHQgbm93IHdlJ3JlIGV4cGVyaWVuY2luZyBzdHJhbmdlIGJlaGF2
aW91ciB3aXRoIGEgZHdjMiBvbiBSb2NrY2hpcCdzDQo+IFBYMzAgc29jLg0KPiANCj4gV2l0aCBh
IGNhYmxlIGNvbm5lY3RlZCB0byB0aGUgcG9ydCwgdGhlIGNvbmZpZ2ZzLXNuaXBwZXQgYmVsb3cg
c2VlbXMgdG8NCj4gd29yayBhbmQgYXQgbGVhc3QgY3JlYXRlcyBhIGFjbSBkZXZpY2Ugb24gdGhl
IGhvc3QuIFRob3VnaCBJJ20gdG9sZCB0aGF0IGENCj4gCSBwaWNvY29tIC1iIDExNTIwMCAvZGV2
L3R0eUFDTQ0KPiBzb21ldGltZXMgd29ya3Mgb2sgYnV0IGFsc28gc29tZXRpbWVzIHJldHVybnMg
LUVCVVNZIG9yIGhhbmdzLg0KPiBbQnV0IEkgZ3Vlc3MgdGhhdCBpcyBhIHNlcGFyYXRlIHByb2Js
ZW1dDQo+IA0KPiBCdXQgaWYgdGhlcmUgaXMgbm8gY2FibGUgY29ubmVjdGVkIHdoZW4gdHJ5aW5n
IHRvIGRvIHRoZSBjb25maWdmcyBzdGVwcw0KPiB3ZSBlbmQgdXAgd2l0aA0KPiAJZHdjMl9jb3Jl
X3Jlc2V0OiBIQU5HISBTb2Z0IFJlc2V0IHRpbWVvdXQgR1JTVENUTCBHUlNUQ1RMX0NTRlRSU1QN
Cj4gYW5kIG5vIGdhZGdldCBnZXRzIGNvbmZpZ3VyZWQuDQo+IA0KV2hpY2ggdGltZW91dCB2YWx1
ZSBzZXQgdG8gd2FpdCBHUlNUQ1RMIGNsZWFyZWQ/IERvZXMgdGhpcyBjb21taXQgDQphcHBsaWVk
OiA2Njg5ZjBmNGJiMTRlICJ1c2I6IGR3YzI6IHVzZSBhIGxvbmdlciBjb3JlIHJlc3QgdGltZW91
dCBpbiANCmR3YzJfY29yZV9yZXNldCgpIj8NCklmIHllcywgY2FuIHlvdSBzZW5kIGRlYnVnIGxv
ZyBmb3IgYWJvdmUgY2FzZS4NCg0KVGhhbmtzLA0KTWluYXMNCg0KPiANCj4gU28gSSBndWVzcyB0
byBnZXQgYSBmZWVsaW5nIGZvciB0aGUgaXNzdWUsIGlzIHRoaXMgc29tZXRoaW5nIHRvIGJlDQo+
IGV4cGVjdGVkLCBvciBhdCBsZWFzdCBhIGtub3duIGlzc3VlLCB3aXRoIG1heWJlIGEgZml4IGZs
eWluZyBhcm91bmQNCj4gc29tZXdoZXJlPw0KPiANCj4gT3IgaXMgdGhpcyB3b3JraW5nIG9uIG90
aGVyIGR3YzIgcGxhdGZvcm1zIGNvcnJlY3RseSBhbmQgaXMgY2F1c2VkDQo+IGJ5IHNvbWUgb3Ro
ZXIgcGFydCB0YWxraW5nIHRvIHRoZSBkd2MyIGRvaW5nIHN0cmFuZ2UgdGhpbmdzPw0KPiANCj4g
DQo+IFRoYW5rcw0KPiBIZWlrbw0KPiANCj4gLS0tLS0tLS0gODwgLS0tLSBjb25maWdmcyBzbmlw
cGV0IC0tLS0tLSA+OCAtLS0tLS0tLQ0KPiBjZCAvY29uZmlnZnMvdXNiX2dhZGdldA0KPiBta2Rp
ciBnMQ0KPiBjZCBnMQ0KPiBlY2hvICIweDFkNmQiID4gaWRWZW5kb3INCj4gZWNobyAiMHgwMTA0
IiA+IGlkUHJvZHVjdA0KPiBta2RpciBzdHJpbmdzLzB4NDA5DQo+IGVjaG8gIjAxMjM0NTY3ODki
ID4gc3RyaW5ncy8weDQwOS9zZXJpYWxudW1iZXINCj4gZWNobyAiVGhlb2Jyb21hIFN5c3RlbXMi
ID4gc3RyaW5ncy8weDQwOS9tYW51ZmFjdHVyZXINCj4gZWNobyAiQ29icmEgRGVidWcgU2VyaWFs
IiA+IHN0cmluZ3MvMHg0MDkvcHJvZHVjdA0KPiANCj4gIyBjcmVhdGUgY29uZmlnDQo+IG1rZGly
IGNvbmZpZ3MvYy4xDQo+IG1rZGlyIGNvbmZpZ3MvYy4xL3N0cmluZ3MvMHg0MDkNCj4gZWNobyAi
Y29uZjEiID4gY29uZmlncy9jLjEvc3RyaW5ncy8weDQwOS9jb25maWd1cmF0aW9uDQo+IA0KPiAj
IGNyZWF0ZSBmdW5jdGlvbg0KPiBta2RpciBmdW5jdGlvbnMvYWNtLnVzYjANCj4gbG4gLXMgZnVu
Y3Rpb25zL2FjbS51c2IwIGNvbmZpZ3MvYy4xDQo+IA0KPiAjIGFjdGl2YXRlIG5ldyBjb25maWcN
Cj4gZWNobyAiIiA+IFVEQw0KPiBlY2hvICJmZjMwMDAwMC51c2IiID4gVURDDQo+IA0KPiANCj4g
DQo=
