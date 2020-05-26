Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EBB1E1DBB
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 10:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731605AbgEZI7y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 04:59:54 -0400
Received: from mail-eopbgr770075.outbound.protection.outlook.com ([40.107.77.75]:22637
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731428AbgEZI7x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 04:59:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/uAqyM2DfHOVOMSgcxxtqXTZEnOC21xTBQeVaOBJn9u/65eG0FRjcW4e6zHB+3DASXbLhL6kdgtjElr7olMbc+/kc6yzNo4xXRJe8HNoCXHFpC6Lq6jAtOD6I5p49VVY1pk4PsgTF5az4aJihQWUtU4A7TsW9vfotMbcLpiW8aoIBYL/6gBkzz8uxCdvGBVrKr8SgUqDwNkSlsFl4roAwlRLT0uv18pSljas5Q42tSrYd21fkfzlzqJb5p35znEdPRQYE4YSPAbXhtl3hxblHpYF/uiBU4TiEMsrtpjeTxsB91Cj0NaBi6iGAXC73ARn39P0M4OR/psVtCPCbOQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFO8R4kiOhEfz3V2AZYA+UBbtCyre95wFSn/4hx+5TE=;
 b=g3/8EIf1Kjq9AtnZF3XrUS9GdAm0n3BZsAfyR5alGqCvJa0tX9kVD3ppTEyQPfuwyxleJ3U6pMNFRIjHh14wVIhx+lBc2UsjH9Hxx/WTkyx1/jEsiti0ZjGzywXWuMfiw1JzWhB4K7rmoB+JUpA8UjbjfJ2Oo9qZ+WOVHVBg1cxOw198dtWb3XsmQKo4pWc7nk5L6eeZXHcpRibsY3IzPduaXZI1vjifCFvvJ+s9wlPzA1jZ6ULgydVzDptV5tqHhBeI/W3N1TD58I/yOR2veA8Cze+Ywem8ylnIApEhREVymIfk+eMHwSvK2pz/GX/FWnDT7fP0KkwBR/krlSfFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFO8R4kiOhEfz3V2AZYA+UBbtCyre95wFSn/4hx+5TE=;
 b=aBkriqasaBjlIZcLmGI5o8CDLGk39cK1k+DnW7K5kzDrh6VOeT0GWeOwINicdquYCKZukuJ8jXai4CmgXz5ic6k1gtxhZwi/qKOGexweJ49WfDDmkKvnv2qpFHH6N+loqJ7Hz/sF9yoRiTFgIbkIIDKX9x92L7vTOdDIziUmRzI=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3138.namprd10.prod.outlook.com (2603:10b6:408:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Tue, 26 May
 2020 08:59:50 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 08:59:50 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYA=
Date:   Tue, 26 May 2020 08:59:50 +0000
Message-ID: <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
In-Reply-To: <1590482853.2838.26.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0645520-2b3e-4da7-08f4-08d80153260d
x-ms-traffictypediagnostic: BN8PR10MB3138:
x-microsoft-antispam-prvs: <BN8PR10MB3138ADC4DE6094B770C7A52CF4B00@BN8PR10MB3138.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vAH7sHHT1zei2QdxMrNYJu0+yO4k5wmfMvEz6FDt2qUqFNY0GE+GFq2QS39UcXsaIA2Z+IVywzE4B6SBo1Xjvsm2nGCMlvuk6xRniK3pH67sJX7cNOafaDgUolESgyGuq7bxXhS1TUDaP7Fyn364GicgBHs02wpeBL6TGGFVCQKrwW6UZeljehRZiNwGYWfO+lqL0nrOoyzIYCWguNs9HSJ1JV1pDX+Y061TQmA22pzET8LG96/q80wVUQbZdPbP6KuSwLLSqcRpjvNZ1ktg1xGxhrR1E4Gi7ep2rpOQbZUzp0gWS8hpjR26S3F/x7+J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(186003)(6512007)(26005)(2906002)(86362001)(64756008)(36756003)(478600001)(66476007)(66556008)(66446008)(8936002)(91956017)(6506007)(66946007)(76116006)(316002)(8676002)(110136005)(5660300002)(71200400001)(2616005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: bzsmXDVj7XhDJFhgxEwxGWXpcww1K2QBGk3n03ydnAxGPh/X2rn6+A92/uvjb0YfBN9IilyrqcW/vEN+UO1plKD98bZji0koZJ7lso3xhSI9ruKbNUKCu0i82YZXaMH0kmTreOf4T7geQkOyajOs0ZM0ZwbQ6cz8xb0ou0foRmtiZSkVsQeyxyO2+wdRG51d9xDyEvySoFq7K2CYFwlOSpMr3xANIJotCE3shRm0xzZVCOSYk7b9sXv6EIQdhIjg1pvwo3zqQ9/c+rFBSQ5LOgP8AN43/ymkwk5PEV14+lHhhTFfLg0LUqUNbAfE31clOw0CXtWouD+eWcVaK93sO/aVcSwXOhILP4VKIPksFE/NoFM7fDzRKTsTuEG49wyrVb+wkpj2Xf4PxLqF1vWf/jY73kOsUZysJ/kfFj/7waXPQumDcYYbJYqn8wV2cCRntdWoz1T643BxycZeFoj9rGueCVdzSUwgaoA75YKXHfvtu6ahzxV4jgx0fBUaXKh2
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D84FE6D6CC165B4FA6813D04E35AE9FA@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0645520-2b3e-4da7-08f4-08d80153260d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 08:59:50.4457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m+3WCO5VSobnimWkE535/U21bZJO+pUKLQdHDAS3sXiEu2+36neSMuFUhX+UF8KUlgRf1aDksbkoM5wkS536iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3138
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIwLTA1LTI2IGF0IDEwOjQ3ICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0K
PiANCj4gQW0gTW9udGFnLCBkZW4gMjUuMDUuMjAyMCwgMTY6NDkgKzAwMDAgc2NocmllYiBKb2Fr
aW0gVGplcm5sdW5kOg0KPiANCj4gPiBUbyBiZSBjbGVhciwgSSBjYW4gcHVsbCB0aGUgY2FibGUg
YW5kIHB1dCBpdCBiYWNrIGFuZCB0aGVyZSBhcmUgbm8gZ2FyYmFnZSBjaGFycy4NCj4gPiBUaGVy
ZSBpcyBhbHNvIHRoaXMgZXJyb3I6DQo+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjUgMjAyMF0gY2Rj
X2FjbSAxLTYuMzoxLjE6IGFjbV9jdHJsX2lycSAtIHVzYl9zdWJtaXRfdXJiIGZhaWxlZDogLTE5
DQo+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjUgMjAyMF0gdXNiIDEtNi1wb3J0MjogYXR0ZW1wdCBw
b3dlciBjeWNsZQ0KPiA+IFtXZWQgTWF5IDIwIDE0OjAzOjI2IDIwMjBdIHVzYiAxLTYuMzogVVNC
IGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgODYNCj4gPiBbV2VkIE1heSAyMCAxNDowMzoyNiAy
MDIwXSBjZGNfYWNtIDEtNi4zOjEuMTogZmFpbGVkIHRvIHNldCBkdHIvcnRzDQo+ID4gDQo+ID4g
U2hvdWxkIG5vdCB0aGlzIGF1dG8gcmVlbmFibGUgZW11bGF0ZSByZWF0dGFjaGluZyB0aGUgVVNC
IGNhYmxlPw0KPiANCj4gSGksDQo+IA0KPiB5ZXMgaXQgc2hvdWxkLiBZb3UgZmluZCB0aGUgZ2Fy
YWdlIGNoYXJhY3RlcnMgYWZ0ZXIgdGhlIEVNSSBldmVudC4gSG93DQo+IHN1cmUgYXJlIHlvdSB0
aGF0IHRoZXkgYXJyaXZlIGFmdGVyIHRoZSBldmVudCBhbmQgbm90IGR1cmluZyB0aGUgZXZlbnQ/
DQo+IA0KDQpEb24ndCBrbm93biBob3cgdG8gZGV0ZXJtaW5lIHRoYXQ/IA0KSSBjYW4gc2F5IHRo
YXQgDQogICBhY21fY3RybF9pcnEgLSB1c2Jfc3VibWl0X3VyYiBmYWlsZWQ6IC0xOQ0KYW5kDQog
ICBjZGNfYWNtIDEtNi4zOjEuMTogZmFpbGVkIHRvIHNldCBkdHIvcnRzDQphcmUgdW5pcXVlIHRv
IHRoaXMgRU1JIGV2ZW50IHRob3VnaC4gSXQgZG9lcyBub3QgZmVlbCBsaWtlIHRoaXMNCnJlZW5h
YmxpbmcgZm9sbG93IHRoZSBzYW1lIHByb2NlZHVyZSBhcyBhIGNhYmxlIHB1bGw/DQpBcyBJIGNh
biBvbmx5IHNlZSB0aGUgYWJvdmUgdHdvIGVycm9ycyBJIHRoaW5rIHdlIHNob3VsZCBnZXQgcmlk
IG9mDQp0aGVzZSBmaXJzdC4NCg0KIEpvY2tlDQo=
