Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C89B223626
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 09:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgGQHrI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 03:47:08 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:35658 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726141AbgGQHrH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 03:47:07 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B303DC0818;
        Fri, 17 Jul 2020 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594972027; bh=uxSbVU04Q58X+NBPq8+OCZe+25ORYMHILSD5I3vXM1s=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=AUbYS3jEYiX/wkHbT/Ncb6uVm0iGgG2idh0EdTY1gpAD99oyYpG4kx5KYxCVja7M0
         tSIpsxrCr7yflJVAIxUzD5pY/Jqaxb69wg9qMyHt49WZnVH9Q304glWtLsXUSE7Yk2
         FtYBJ19mpPDVfYz4ZeYh18fBY11W7s+CpM/ULzpVwKqvsaYdvI7zftmzj0MHMa5DkV
         zhNWvJw7QeV7MsdbE9ItWJxfxHhqTJ5GMf27R9gzhdiNG3n7juzRYi6A+IN2iILgBK
         DLsKEnApWWLq41iH6r0rFCAhhnwccADIWcAQAri0k+eSf3Hb7smqTDJa4kmL2/ke3Y
         jRqCeyxBXnQ0A==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1C956A005C;
        Fri, 17 Jul 2020 07:47:05 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 691F64001A;
        Fri, 17 Jul 2020 07:47:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="U9k6A92I";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhS3Lzi98rUKvkbuNG+Ar+P8VTavLALpvJ1qPjFGnaXWSxNwZq2MOifeqdp71RGVagjxA/cXpZlUKG6tSQny+6N/cDQB/rO/6IJJBJomfUm0snMUL/TLVo2LazIyRPj4MsrhWJnc9d17T05JGDllkBk6/NXMkyNOewO4wzP/Gdc/0uPi9aUvt5s50kfiUYMVU0UYnBrZqrxNIJtiZMNfFFDnlkbn4HkuaphrFzBDuMFWhYMzElPkQjPJPjvSvfqeJaq8mUF0u4Me7B6G8r75sfzmJaxy3pehlFjM3sbNj6eQW3nnoHnUqtVRCtTfnM+mdTUKSAB3JSTKMgKZGHcqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxSbVU04Q58X+NBPq8+OCZe+25ORYMHILSD5I3vXM1s=;
 b=cRBxSNV8qjANkjqAtGC9lxAqN5K6nG6xop5mnDBWGMrsNQi+AAqPiL9qwnKXZi7yOWsUddSkyubNX9dYQmbygkg0M8QOfzHy0C/5l+24kpLmvIRROixT73NreV0dWetocFhPyTj9PmrF/TeZoTs6JPBttE6x0KwGwZdjIZ4vNIrw0pkBXr4DuNuWkkWgY58+il0MmgbaMCghs3aVK0+6va60oKqaZqomVZArMLwj7u522agAa0w0wNb1InWDV7QhKh8GD0nXcv1zS0nylPmQtFC5QlkmBu4qfWPXDGROE7YzEZwVBKEw0hzT4Ojm8rb7CTCrKrf7DSD2G55wUAHnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxSbVU04Q58X+NBPq8+OCZe+25ORYMHILSD5I3vXM1s=;
 b=U9k6A92IckpoxjlfvmpD0vaCComx6HpYxwi1E3HIgI7rnYswgu81yAtYksDYZ8ZIWQzS0bYTnvOYsrVIGpXmuh1leMLO0ODwFoYZH+M37H+AFNfKfQGdh6WvMzzg1quWgRwyC3RG+HWywBy3KWErWdlRK1NlvLowDXHxIu7afl8=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 07:47:03 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 07:47:03 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 01/11] usb: ch9: Add sublink speed struct
Thread-Topic: [PATCH 01/11] usb: ch9: Add sublink speed struct
Thread-Index: AQHWW7xD0Vg483QXNUGm0Me/HENawqkLUQ2AgAAI+QCAAAetAIAAA74A
Date:   Fri, 17 Jul 2020 07:47:03 +0000
Message-ID: <26854ca2-06b5-1876-eb64-2484dcf6cdfe@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <90961eec3e1ed3c27e41e7169353cc295c551604.1594935978.git.thinhn@synopsys.com>
 <20200717063403.GC3238569@kroah.com>
 <91597893-51ce-734b-285d-29de2641d540@synopsys.com>
 <20200717073338.GB694429@kroah.com>
In-Reply-To: <20200717073338.GB694429@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d95c486b-ab2d-404b-8ee2-08d82a2598b8
x-ms-traffictypediagnostic: BY5PR12MB4291:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4291123754E4F7946E1289E1AA7C0@BY5PR12MB4291.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: np+S+isAVsH6JvuWO8G4rjl8S09Jr7PiWThc8RD4riKI/YJUVYZgRXOF+PQTFDSbFFKr1/Z7tUFC7ecmIxNLGMYUJwVxggkNs497rHdLxQci3/KqwzqE6dALULoNslm+n70aRC5FgECmIDmoVPeWWEpyFaNRhzY3nghfUimtqzqxS5EgjUKmWkS/PEfxZ24hcGUlxx+bfqq+jHAMWNifhKMkZ2rsdjlqyjp7zdjXkDFh9Wv6ELgJFCdTFlCuK6A7mJW00THPi197IJFkSyg85OC14oloETLSvUIoFzHB21nced+gtGVhKSCWjjxBoWbBs1597Sti6R5AZcM7151kh1a1CF8RRK16wr6NuV/K6oP9C9l6A7UZq6nY+StT62fp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(376002)(366004)(346002)(39860400002)(478600001)(76116006)(4326008)(107886003)(66946007)(26005)(6506007)(71200400001)(110136005)(54906003)(186003)(31696002)(86362001)(2616005)(5660300002)(316002)(66476007)(66556008)(8936002)(66446008)(8676002)(36756003)(64756008)(2906002)(6486002)(6512007)(83380400001)(31686004)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: R0nLRg4km3mYx3ptI+gdyK9qoaeGAr5QxZWlfIU2D7OGfxE5jKQ8uvoMiihn3Sgw24uFtBKV89xfyjbsOHYtmgePwwh3pgys/bVjzWvg5oeG/YYIql075qs8pEN2FapYPnEPf3L5XyVMbuBlupEA4LqWg2wJ7Q/EZA8vphr/0SQycRzWBdUjZ+P1tnVT5mbzA2f+nEWDZWAMBkUkwoFB+JAb2llPjqa7s0lQGBfLWHRvjAYi0ocTEnGI3yXb5w2w0l+SLF1G5DTlC6N3nnLAxmi53X2Ei8kgdgA8WrdRtvR0nvq41sBUPZKlRwSl+LOWCYcxFnZOLWImSheXUHgByCP+vt79aOE4NtVgXlgmOMFozvW7OM+AtDxSojnKEhxEh6aSzKKVBepTHcfDX4Bfj5hfVDdvPBRrrFx1KjNGHEqt+1uI5LwtA40SWo16CB8SYeQmo+GwImT0rv+dGUSJ/H7zV0u7KwISYrKsSHkwx0I=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA602F9E7F441A4B9A96DF6F490549DF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95c486b-ab2d-404b-8ee2-08d82a2598b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 07:47:03.6494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIvIQNAFPOPRppwN7J+R5vJr7YDq7bYPPVr2TP4CV3b96xb2nZCHJKmxgZVwjmB94RlmUZw54BiRdP8ZrpT6kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAwNzow
NjoxMEFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBHcmVnIEtyb2FoLUhhcnRtYW4g
d3JvdGU6DQo+Pj4gT24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMDI6NTg6MzZQTSAtMDcwMCwgVGhp
bmggTmd1eWVuIHdyb3RlOg0KPj4+PiBVU0IgMy4yIHNwZWNpZmljYXRpb24gc3VwcG9ydHMgZHVh
bC1sYW5lIGZvciBzdXBlci1zcGVlZC1wbHVzLiBVU0INCj4+Pj4gZGV2aWNlcyBtYXkgb3BlcmF0
ZSBhdCBkaWZmZXJlbnQgc3VibGluayBzcGVlZHMuIFRvIGF2b2lkIHVzaW5nIG1hZ2ljDQo+Pj4+
IG51bWJlcnMgYW5kIGNhcHR1cmUgdGhlIHN1Ymxpbmsgc3BlZWQgYmV0dGVyLCBpbnRyb2R1Y2Ug
dGhlDQo+Pj4+IHVzYl9zdWJsaW5rX3NwZWVkIHN0cnVjdHVyZSBhbmQgdmFyaW91cyBzdWJsaW5r
IHNwZWVkIGF0dHJpYnV0ZSBlbnVtLg0KPj4+Pg0KPj4+PiBTZWUgU1NQIEJPUyBkZXNjcmlwdG9y
IGluIFVTQiAzLjIgc3BlY2lmaWNhdGlvbiBzZWN0aW9uIDkuNi4yLjUNCj4+Pj4NCj4+Pj4gU2ln
bmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gICAgaW5jbHVkZS91YXBpL2xpbnV4L3VzYi9jaDkuaCB8IDQyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNDIg
aW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4
L3VzYi9jaDkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC91c2IvY2g5LmgNCj4+Pj4gaW5kZXggMmI2
MjNmMzZhZjZiLi5kNGZkNDAzYTM2NjQgMTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9s
aW51eC91c2IvY2g5LmgNCj4+Pj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3VzYi9jaDkuaA0K
Pj4+PiBAQCAtMTE0NSw2ICsxMTQ1LDQ4IEBAIGVudW0gdXNiX2RldmljZV9zcGVlZCB7DQo+Pj4+
ICAgIAlVU0JfU1BFRURfU1VQRVJfUExVUywJCQkvKiB1c2IgMy4xICovDQo+Pj4+ICAgIH07DQo+
Pj4+ICAgIA0KPj4+PiArLyogVVNCIDMuMiBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZXMgKi8NCj4+
Pj4gKw0KPj4+PiArZW51bSB1c2JfbGFuZV9zcGVlZF9leHBvbmVudCB7DQo+Pj4+ICsJVVNCX0xT
RV9CUFMgPSAwLA0KPj4+PiArCVVTQl9MU0VfS0JQUyA9IDEsDQo+Pj4+ICsJVVNCX0xTRV9NQlBT
ID0gMiwNCj4+Pj4gKwlVU0JfTFNFX0dCUFMgPSAzLA0KPj4+PiArfTsNCj4+Pj4gKw0KPj4+PiAr
ZW51bSB1c2Jfc3VibGlua190eXBlIHsNCj4+Pj4gKwlVU0JfU1RfU1lNTUVUUklDX1JYID0gMCwN
Cj4+Pj4gKwlVU0JfU1RfQVNZTU1FVFJJQ19SWCA9IDEsDQo+Pj4+ICsJVVNCX1NUX1NZTU1FVFJJ
Q19UWCA9IDIsDQo+Pj4+ICsJVVNCX1NUX0FTWU1NRVRSSUNfVFggPSAzLA0KPj4+PiArfTsNCj4+
Pj4gKw0KPj4+PiArZW51bSB1c2JfbGlua19wcm90b2NvbCB7DQo+Pj4+ICsJVVNCX0xQX1NTID0g
MCwNCj4+Pj4gKwlVU0JfTFBfU1NQID0gMSwNCj4+Pj4gK307DQo+Pj4+ICsNCj4+Pj4gKy8qKg0K
Pj4+PiArICogc3RydWN0IHVzYl9zdWJsaW5rX3NwZWVkIC0gc3VibGluayBzcGVlZCBhdHRyaWJ1
dGUNCj4+Pj4gKyAqIEBpZDogc3VibGluayBzcGVlZCBhdHRyaWJ1dGUgSUQgKFNTSUQpDQo+Pj4+
ICsgKiBAbWFudGlzc2E6IGxhbmUgc3BlZWQgbWFudGlzc2ENCj4+Pj4gKyAqIEBleHBvbmVudDog
bGFuZSBzcGVlZCBleHBvbmVudA0KPj4+PiArICogQHN1YmxpbmsgdHlwZTogc3VibGluayB0eXBl
DQo+Pj4+ICsgKiBAcHJvdG9jb2w6IHN1YmxpbmsgcHJvdG9jb2wNCj4+Pj4gKyAqDQo+Pj4+ICsg
KiBTdXBlci1zcGVlZC1wbHVzIHN1cHBvcnRzIG11bHRpcGxlIGxhbmVzLiBVc2UgdGhlIHN1Ymxp
bmsgc3BlZWQgYXR0cmlidXRlcyB0bw0KPj4+PiArICogZGVzY3JpYmUgdGhlIHN1Ymxpbmsgc3Bl
ZWQuDQo+Pj4+ICsgKg0KPj4+PiArICogU2VlIFVTQiAzLjIgc3BlYyBzZWN0aW9uIDkuNi4yLjYg
Zm9yIHN1cGVyLXNwZWVkLXBsdXMgY2FwYWJpbGl0eSBmb3IgbW9yZQ0KPj4+PiArICogaW5mb3Jt
YXRpb24uDQo+Pj4+ICsgKi8NCj4+Pj4gK3N0cnVjdCB1c2Jfc3VibGlua19zcGVlZCB7DQo+Pj4+
ICsJdTgJCQkJaWQ7DQo+Pj4+ICsJdTE2CQkJCW1hbnRpc3NhOw0KPj4+IFlvdSBoYXZlIHRvIHVz
ZSB0aGUgcHJvcGVyIGRhdGEgdHlwZXMgZm9yIGNyb3NzaW5nIHRoZSB1c2VyL2tlcm5lbA0KPj4+
IGJvdW5kcnkgaGVyZS4gIFRoYXQgd291bGQgYmUgX191OCBhbmQgX191MTYsIHJpZ2h0Pw0KPj4+
DQo+Pj4+ICsJZW51bSB1c2JfbGFuZV9zcGVlZF9leHBvbmVudAlleHBvbmVudDsNCj4+Pj4gKwll
bnVtIHVzYl9zdWJsaW5rX3R5cGUJCXR5cGU7DQo+Pj4+ICsJZW51bSB1c2JfbGlua19wcm90b2Nv
bAkJcHJvdG9jb2w7DQo+Pj4gQXJlIHlvdSBfc3VyZV8gdGhhdCBhbiBlbnVtIGlzIHRoZSBjb3Jy
ZWN0IHNpemUgZm9yIHRoZXNlIGZpZWxkcz8gIEhvdw0KPj4+IGNhbiB5b3UgZ3VhcmFudGVlIHRo
aXM/ICBXZSBkbyBub3QgdXNlIGVudW1zIGluIHRoaXMgd2F5IGZvciBhbnkgb3RoZXINCj4+PiBm
aWVsZCBpbiB0aGlzIGZpbGUgZm9yIGEgcmVhc29uLi4uDQo+Pj4NCj4+PiBBbmQgZGlkIHlvdSBs
b29rIGF0IHRoZSBsYXlvdXQgb2YgdGhpcyBzdHJ1Y3R1cmUgdG8gdmVyaWZ5IGl0IGFjdHVhbGx5
DQo+Pj4gbWF0Y2hlcyB3aGF0IGlzIG9uIHRoZSB3aXJlIHdpdGggVVNCPyAgSSB0aGluayB5b3Ug
bmVlZCB0byBhZGQgYSBwYWNrZWQNCj4+PiBhdHRyaWJ1dGUgdG8gZ3VhcmFudGVlIGl0Lg0KPj4g
VGhpcyBzdHJ1Y3QgaXMgbm90IGludGVuZGVkIHRvIGJlIHBhY2tlZCB0byBiZSBzZW50IG92ZXIg
dGhlIGJ1cy4gSXQncyBhDQo+PiBzaW1wbGUgc3RydWN0IGZvciBob3N0IGFuZCBnYWRnZXQgZHJp
dmVyIHVzZSBvbmx5LiBJIGludGVuZGVkIHRvIHVzZQ0KPj4gZW51bSB0byBtYWtlIGl0IG1vcmUg
Y2xlYXIgbm90IHRvIGJlIHVzZWQgdGhhdCB3YXkuIEZyb20geW91ciBxdWVzdGlvbiwNCj4+IGl0
J3Mgb2J2aW91c2x5IG5vdCBjbGVhci4NCj4gVGhlbiB3aHkgYXJlIHlvdSBwdXR0aW5nIGl0IGlu
IHRoaXMgZmlsZT8gIFRoaXMgZmlsZSBpcyBvbmx5IGZvciB0aGluZ3MNCj4gdGhhdCBhcmUgZGVz
Y3JpYmVkIGluIHRoZSBVU0Igc3BlYyB0aGF0IG5lZWQgdG8gY3Jvc3MgdGhlIHVzZXIva2VybmVs
DQo+IGJvdW5kcnkuDQoNCk9rLCBpdCBzZWVtZWQgdG8gZml0IGhlcmUuIEknbGwgcGxhY2UgaXQg
dW5kZXIgL2luY2x1ZGUvbGludXgvdXNiLmggdGhlbj8NCg0KPg0KPj4gT3RoZXJ3aXNlLCBpdCBt
YXkgbG9vayBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPj4gc3RydWN0IHVzYl9zdWJsaW5rX3NwZWVk
IHsNCj4+ICAgwqDCoMKgwqDCoMKgwqAgX191OMKgwqDCoCBzc2lkOjQ7DQo+PiAgIMKgwqDCoMKg
wqDCoMKgIF9fdTjCoMKgwqAgbHNlOjI7DQo+PiAgIMKgwqDCoMKgwqDCoMKgIF9fdTjCoMKgwqAg
c3Q6MjsNCj4+ICAgwqDCoMKgwqDCoMKgwqAgX191OMKgwqDCoCByc3ZkOjY7DQo+PiAgIMKgwqDC
oMKgwqDCoMKgIF9fdTjCoMKgwqAgbHA6MjsNCj4gQXJlIHlvdSBzdXJlIHRob3NlIGJpdCBmaWVs
ZHMgd2lsbCB3b3JrIG9uIGJpZy1lbmRpYW4gc3lzdGVtcz8NCg0KTm8uIEJlY2F1c2Ugb2YgdGhl
IHdheSB0aGUgYml0ZmllbGRzIGFyZSBwbGFjZWQsIGl0J3MgYSBwYXRoIHRvIA0KdW5uZWNlc3Nh
cnkgaGVhZGFjaGUvYnVncyB3aXRoIGJvdW5kYXJ5IGFuZCBlbmRpYW5uZXNzIGNoZWNrcy4gVGhh
dCdzIA0Kd2h5IEkgZGVjaWRlZCB0byBnbyB3aXRoIHRoZSBvdGhlciBzb2x1dGlvbi4NCg0KVGhh
bmtzLA0KVGhpbmgNCg==
