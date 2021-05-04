Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC303725FA
	for <lists+linux-usb@lfdr.de>; Tue,  4 May 2021 08:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhEDGyh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 May 2021 02:54:37 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53932 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229724AbhEDGyh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 May 2021 02:54:37 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 388A5C011A;
        Tue,  4 May 2021 06:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1620111222; bh=wZ2TKBzHKpbJs6JxwMMJEpSca0f5xvJqyitm4i1b3CM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=mBiGWBtGk1QZsv1dffFWu4ijbCVr+uifn3rmtOEdS5kRtO87dx438HRPJMT0j6U+5
         yree652LIPP3woy7PgrCz/3tm+SenGqCB09PszYroPwrcvsWn4y9g7AQzjByYWkqr4
         cgIImlznl507acF5QscJC7U8rXIfIjce7kLEsKaGJIPUkP5vVT3UQ3UhLTPW3p9+wi
         FD1kHZWhZA97Arl8uKdw51GQZ6YpUeCHppRtvI531X/6VVQWfVuvOr0GoXffAiabSv
         tz/BJ9BAG7f5km2dzl3wkd7XjAvBVdePew3nAS6zOJDJBRjvCUDEJS0Zo5CGrvVVv5
         Oz7l81fbOcl5w==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D7C58A0079;
        Tue,  4 May 2021 06:53:40 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8773A80268;
        Tue,  4 May 2021 06:53:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="k0Xo1PFZ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLT+TrXjLDa7SgmnpDj4PNqNBWeXo6rKNV/r4cFHZjX1htg4MIk9XxSvQeLvpe0syhrV7FhPAPytA/dEElr4vETWcuYzbAmJGNlwplNZTEiUBSsIgi9vE6IDBPERjfM6nKJ29Y212UZCcmGPMaCB+/17PGwypXLdL+FusYIci/uROdvAS9ZdE4iZRbRn2Yo5vxgrxoD0eJ25j1ZibVjzUNzTo9dZeZ1z0msX5ZMYEFRTMknwvqdx2LJ0sy8hG4SxU52O/btzfcAd40hvGmHkkQ+LyCuvLFXSOzLQtA0eIEct14Mf+iSB0MQi+ubMQDMKxq8Dfvjval9GeSq9n+AtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZ2TKBzHKpbJs6JxwMMJEpSca0f5xvJqyitm4i1b3CM=;
 b=XLxIxk0kb8mGMVBpdJxk60Oa9ktIp+WuiCYbm98yIML4y4bk5Jkw/op3+ssFZFFbJ5R8VKOeKfw6lOlyFA39E438OSKf9gq0A9n9RbmqVHJ20/32imUFOCb09Yr+zF6mnaHe2KPkngdPpOvKhs+C1WtRdKVaO8dkS4A1YEajRC8kjFhANcE9r55RzfIDYK8VMM/igsZsBn21j5df50roYVUGlhNU6v+8Bx5z+gZVT85+fHf5sfKKVCwSHqWVtKCUfsIUO7UEqxhbC7jrgw+6GdFrxKueydrM2HsbP9dKCVFWl5hUilJDcyeBLrYQl7y6q0xB53yXBiBn9YSgz90bnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZ2TKBzHKpbJs6JxwMMJEpSca0f5xvJqyitm4i1b3CM=;
 b=k0Xo1PFZiojvpYaL212QCgevZolqZ2g9PVvIiBsjLAs9efMMZxOpGYlSOEp0gMeMZP7QCxXrV3w7C0Wc6gIQ47/je5VyIwFr1+h3BQRt+46zXFG4MveHHaI9dgYDmt2ZADGK8xT2xVY4WXg5jyacCs3Uy0bRDAHHjJkhtn8T51I=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM8PR12MB5495.namprd12.prod.outlook.com (2603:10b6:8:33::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Tue, 4 May
 2021 06:53:37 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::bd1a:d4df:7c02:e458]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::bd1a:d4df:7c02:e458%6]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 06:53:37 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Matthijs Kooijman <matthijs@stdin.nl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc2: Remove obsolete MODULE_ constants from
 platform.c
Thread-Topic: [PATCH] usb: dwc2: Remove obsolete MODULE_ constants from
 platform.c
Thread-Index: AQHXQEcOglbljIObwUOpgpXUjTiRpqrS49oA
Date:   Tue, 4 May 2021 06:53:37 +0000
Message-ID: <88f45a31-2605-cb0e-5553-945957e6cbca@synopsys.com>
References: <20210503180538.64423-1-matthijs@stdin.nl>
In-Reply-To: <20210503180538.64423-1-matthijs@stdin.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
authentication-results: stdin.nl; dkim=none (message not signed)
 header.d=none;stdin.nl; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [37.252.80.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 362921c4-cd6a-42f9-5df9-08d90ec957a9
x-ms-traffictypediagnostic: DM8PR12MB5495:
x-microsoft-antispam-prvs: <DM8PR12MB54957659F0DB6E21FD69E1F5A75A9@DM8PR12MB5495.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ryKjEAtEf0Md6oYQxUTH6HTOxFL4zs4TwFzv+5HAJLTihN/iYGzCqrz1SksKWTo30CZnm5nk2anPwXddxv3BhltPXYPxo7Vr9A+SQ/U5TDaXAVac71WrZ/i6B4Id0kR5QVQDOEE/79Cc4BstuHUTMbiXwAxGeFUcqbOWdqcNWOLL6cvQWPz4Uf4r/4XwAwiZBxaMkLlw8NSUkYjGxYJyioVBLB2QI458y3OAf9sVzsBLPTAtFnB+d+64ezpn1rGmyjy4bdbK2yn71gAEoOPYA3JdX5lxAWKYhqvNrPyqdVVwWYy5JFaIPy6xDb16nzvMv71YhG0mYGTtwU35Inmm/YoQfihcKqElZmmoamFY7KuhZ3uFbWnEjkD6/1ddiSPTDizoMV1unnkPU4aec5FxR3etfe6D8nY23vmB+TrC/uMukxVidJQ9DE29V7KVXSLulZGu9xDzrZEST+7oQon1FD6Bve9CmxXdEZrl2+RaIWJ3hWs8MAfd9+RvAWuNI/bpOdaM46E6L1P7lAujIsJ2NcT2A3m0ruiNAMP7Ty8dGsEnIxpnJeMBo66pQ+9qZ8cNidCDxPMjwgdIgGrMw/DASbEV7cCqGjhuB1xPDytxqnn7w6uLXwhojlA36co6esRWTiBTxxNN4Bg++avbhO+ju7cerZnuFT4g+eWBUZcXpu75oSij9saRqjF4kLcTZPoG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(39860400002)(366004)(136003)(66946007)(91956017)(76116006)(38100700002)(53546011)(110136005)(26005)(66476007)(66556008)(86362001)(66446008)(122000001)(71200400001)(6506007)(83380400001)(8676002)(6486002)(36756003)(4326008)(31696002)(316002)(64756008)(478600001)(8936002)(6512007)(186003)(2906002)(2616005)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WHV6NkU3UjFPYzM4WEtvR2pqTTgyVkxjNEpEWVZ0UlVUVmxwYXZKMnRIdTR1?=
 =?utf-8?B?dXJpKzUvR1UxNDlJOXBJUVpLMXZpaDZXbFVTQWJpTE5LdE53bzhjTFc1VkRZ?=
 =?utf-8?B?Zlk3N29ua01MejNubkFseHJGbGswVTUwOHJXOHFNa3E0MHg4OWV4MUZyb1RO?=
 =?utf-8?B?WU5pQmRMWkRoeVBja21wTUJTYnpGYWZ3Wi9BbEdFbzJFa29wclNUOXVmZzVD?=
 =?utf-8?B?cGkxT1VvVllIM09NUHp4WTh1MzYvK3BVckwxNVg5ekJYYmw5MmpPOWluVTZJ?=
 =?utf-8?B?NGdSZnJnenI2Y1RrcDgyV3ZHTEYwR3pXRkJ4SUdDOEJhQlZyeVNuejdPTW8y?=
 =?utf-8?B?ZWtibzh5emVwM0R6VVdJbWlOQ0o3d0dCcmFlS2hLMFFDZ2NCczV6RjlLSVBI?=
 =?utf-8?B?d0tQcGJNenB1TUVPOCtIeFRnSkdkb0Nmd3NneEhhQkIyUmc1U2RKRWhvUllS?=
 =?utf-8?B?MW9raGFxOE5meHFqajJwT0lSMFQwc0F4UVRlVmFzc2hHS3VraHRDeE8yZlE3?=
 =?utf-8?B?TU15dzE2V2I3RzROdVEwSEUzOWg2bkxTM0tIdVRJTmFTakFqOEdDTGlvSklO?=
 =?utf-8?B?eXZZS3RBUlBtZjVJUm1YSE5OMUs3QmdjUW1LdnZUU3JLWHhoZ2RiVHk1Z0dq?=
 =?utf-8?B?cUVRWVpRZ1BSajBYaUtnd3Q4NmJ2Mkc0RzlYSU5HYmpiWUkzMjF4RklkMUJx?=
 =?utf-8?B?WFRnTFZpdmZqV2cycFl2YVJGMSs1ZDdkRENlRzBlby9IbkxNcW9RTWRpQk1R?=
 =?utf-8?B?d2dqY29LMi9reDVxaGNNVWRtL3NWYTY1UURvYmNiOVdNQ1E5NklsSVppWjN6?=
 =?utf-8?B?RWliM0s5TFduU1BZYWJiNU1SQjZwUVlXZW4veHdCdWI4ZDV5cUZBK2dCdEZY?=
 =?utf-8?B?Zkppay9Ia00wejFVVEdaZXg0b3VEMzRqS3lyd1Zlbm8rWnFyWm5pdmV0UllP?=
 =?utf-8?B?alV6djQ5UVJ6cFVCdzBNTzQ1V2pNRzU0VDBPdWNIU0pGbWMrOUxVMjFOVDVK?=
 =?utf-8?B?NEY4a0MwVEhqOGdSdUpQSjVMNHhkVVBRWXBNZ1RxOUNPa3lqdnJhRW1rNk5H?=
 =?utf-8?B?L09ncCtDSU9yMTNlUlBkaGluRTdGTjJBSTZkRy9tcGlsSU1JKy9CS0hLY0Vv?=
 =?utf-8?B?T3MzUVhOMnVZWjVrSm1ZeWtETkk5KzZydS80L3djKzhUeW5NeE11RDZNWmVP?=
 =?utf-8?B?MjluaElOV1d2TjZjZWp6WnJJdHdHMGI0Vk1HV3RHWWJxSXZGWEVNUVlITWZ3?=
 =?utf-8?B?T2pZeUppaUg3QlZONUFOMzZGd3psVDZVQjJvaDQza0F5eW5mWjh3SWNCU1Ju?=
 =?utf-8?B?dXcxbjhLLzFKOVRTUDZUQmliT205eEZaY2RyTDBJaW1KNEFNNW5ScXhtK05U?=
 =?utf-8?B?aktZRllmZ25aZ3kvRHNia0ttWFFEQnlxVGYyeXZkTjJDcm9qR3owYThiK0ly?=
 =?utf-8?B?VjFCUWZXcFNkbmRlWkZQWDBEVGJOU0RXU21FR1NtWUQzVzJGcFRRcXRBMXps?=
 =?utf-8?B?L0huR0N4Q0hCNjdTOGp4cXd1eGFZb0krS011aGlOZ2laeE9jdHVBWGFzOU56?=
 =?utf-8?B?Qnd4T1NyRmYzcThGZEFGSjRESmZqOVVmTDRERkNMS1JHOU42ZzVZa251OVlV?=
 =?utf-8?B?TWQvU2ZmcXU5T0JsbUR0Uktvb0Q5SFJqVXRWZnA0NkJ1V0pUb3JGUi93UnJW?=
 =?utf-8?B?bmxPTzRwNC9YbHN3dy9YbkxsbEVpQ1Ridmo1L0phZHNRWkRxWEdQbHI0cmdh?=
 =?utf-8?Q?iCw3OZ2DNFJlNnl+VY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A71DFC44B1C30E44AAD5DB44241244A9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362921c4-cd6a-42f9-5df9-08d90ec957a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2021 06:53:37.0841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6W8AvEfzHylQ4EOMakncdzQYFnlWo0x+tiVt8PvPxbX+faIIJGAx7Dtbqi+ECgyCP5h6+eo7D7BoXGlKs5unBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5495
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gNS8zLzIwMjEgMTA6MDUgUE0sIE1hdHRoaWpzIEtvb2lqbWFuIHdyb3RlOg0KPiBPcmlnaW5h
bGx5LCB0aGUgY29yZSBhbmQgcGxhdGZvcm0gZHJpdmVycyB3ZXJlIHNlcGFyYXRlIG1vZHVsZXMs
IHNvIGVhY2gNCj4gaGFkIGl0cyBvd24gbW9kdWxlIGluZm8uIFNpbmNlIGNvbW1pdCAyZDExNjVh
NGI5NWUgKHVzYjogZHdjMjogcmVtb3ZlDQo+IGR3YzJfcGxhdGZvcm0ua28pIHBsYXRmb3JtLmMg
aXMgaW5jbHVkZWQgaW4gdGhlIGNvcmUgbW9kdWxlLCB3aGljaCBub3cNCj4gY29udGFpbnMgZHVw
bGljYXRlIG1vZHVsZSBpbmZvIChmcm9tIGNvcmUuYyBhbmQgcGxhdGZvcm0uYykuDQo+IA0KPiBE
dWUgdG8gdGhlIGxpbmtpbmcgb3JkZXIgYW5kIG1vZGluZm8gaW1wbGVtZW50YXRpb24sIHJ1bm5p
bmcgYG1vZGluZm9gDQo+IG9uIHRoZSByZXN1bHRpbmcgZHdjMi5rbyBzaG93cyBqdXN0IHRoZSBp
bmZvIGZyb20gcGxhdGZvcm0uYywgcmF0aGVyDQo+IHRoYW4gdGhhdCBmcm9tIGNvcmUuYywgc3Vn
Z2VzdGluZyB0aGF0IEkgYW0gdGhlIGF1dGhvciBvZiB0aGUgZW50aXJlDQo+IGR3YzIgbW9kdWxl
LiBTaW5jZSBwbGF0Zm9ybS5jIGlzIGp1c3QgYSBtaW5vciBwYXJ0IG9mIHRoZSBlbnRpcmUgbW9k
dWxlLA0KPiB0aGlzIHJlbW92ZXMgaXRzIG1vZHVsZSBpbmZvIGluIGZhdm9yIG9mIHRoZSBpbmZv
IGZyb20gY29yZS5jLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpanMgS29vaWptYW4gPG1h
dHRoaWpzQHN0ZGluLm5sPg0KDQpBY2tlZC1ieTogTWluYXMgSGFydXR5dW55YW4gPE1pbmFzLkhh
cnV0eXVueWFuQHN5bm9wc3lzLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL3VzYi9kd2MyL3Bs
YXRmb3JtLmMgfCA0IC0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MyL3BsYXRmb3JtLmMNCj4gaW5kZXggNWYxOGFjYWM3NDA2Li5lMWUxZTMyZTAwMDggMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MyL3BsYXRmb3JtLmMNCj4gQEAgLTc0Miw3ICs3NDIsMyBAQCBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBkd2MyX3BsYXRmb3JtX2RyaXZlciA9IHsNCj4gICB9Ow0KPiAgIA0K
PiAgIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZHdjMl9wbGF0Zm9ybV9kcml2ZXIpOw0KPiAtDQo+
IC1NT0RVTEVfREVTQ1JJUFRJT04oIkRFU0lHTldBUkUgSFMgT1RHIFBsYXRmb3JtIEdsdWUiKTsN
Cj4gLU1PRFVMRV9BVVRIT1IoIk1hdHRoaWpzIEtvb2lqbWFuIDxtYXR0aGlqc0BzdGRpbi5ubD4i
KTsNCj4gLU1PRFVMRV9MSUNFTlNFKCJEdWFsIEJTRC9HUEwiKTsNCj4gDQoNCg==
