Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58202236FF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 10:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgGQI3O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 04:29:14 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37092 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726071AbgGQI3N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 04:29:13 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6C6AAC081C;
        Fri, 17 Jul 2020 08:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594974552; bh=0QqfzkxV70knFdqLwxonJzvAPtDEDrfTysWayUt2sAc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YQ0wBvXKCKTcz/9pbhu55Icm3W5Y6RGO3HsV7nccAd9q1WB5/u0tZP18InqBHULLF
         jh+YHXyO1sTaT8LQopXJPJOUG3sBgcWQ/ZkKWUvxjihDvBUGo5fp43rXrJO51vJIT/
         t5xVsdlCMlFsmSpK2A7bTCMFQRFEV1O6hUYLwcIAXkuwJeFRuyNDlI4zGvaD1Yqpvs
         p/yw2v9h66tr+c+aDQoXXlu1n6wahHJ49McRpEy2bIS9JvmOCdo9PTtMgwleUfoXCV
         dekMcexfS4o6pp23zsSPcm+23A65T7WMrJET+DMMXwTKeWKVebo/HRNr2qNXUAYqjM
         LYdu15IeECnzg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id EB264A0071;
        Fri, 17 Jul 2020 08:29:11 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 816E280236;
        Fri, 17 Jul 2020 08:29:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="q160OaMl";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOxOV1AIJPgFS+340m6XttE97oCrXnmpot30VGJObUmxGKvuli9dZ63yDWb72XJyMi1IVpHA2QuTbEojG9GlyuvxEyBAbx8qpI4bAcmDFo1U4aUy8UWyZAi23FV/zUR/uQHX75XBmFLxJvf7AS4A7Hj2KHW5yz50+Kj5cPOOxlvbMYj+PONlMIZ5jY0kUsKsBocXe2nkXwm8AAXq5r1Rhc3GnwIxdDApTR0LzODOFhPeGg5tUVtJ89WQRM5gCU4N725eYEMJFwf1X/BjoWlQr7hj4J8o5jX0NJiCAuLNWQuMNn4+P2h3RW1b/4GPOHN8vUatdokYgbeowjkU3hpsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QqfzkxV70knFdqLwxonJzvAPtDEDrfTysWayUt2sAc=;
 b=aKY1NsYL1Sqc/b0gCnnrfzWu2/zP9B+v2AUqcZ7o4f3CDQ7d/a/mILAaPUkiAo/+8L6oBFQ3LNq5hGM16LK4JzmODtDp56R32WBkdcpt/5uWYdGfUVz9cb6SmNSANrPHN0A/F1PgiBrMtdl5b3WBqs3qoojVgT04cctUMfrgXtQGr6Oy2JqhLz/VayvNQc6Dm4wJX0QUfRA/D9qUzsEzf6pGnpKR8eu3GFyfk46UtE5tYOpAADEV7Dk3N8PQxZNamnZLwvbPpsJmxzD900tI/uJv2njI4dnXaX0NIRwSwjC7UO33HHPHbBk6YfMRwEmA5XQWhCEdslZY8+hu29/RRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QqfzkxV70knFdqLwxonJzvAPtDEDrfTysWayUt2sAc=;
 b=q160OaMln/Up6DY9WXnKa1hqW0wJJYyd2+BLLTYWmEID6wkujXwaJMNX2PTLbkhEHh7c4s8gpBuYO1olUaRB4C2222HYFQt+6NHIxSZBYZoKC/jagx71Rd/hkxpVqZQp5a83ZVZE6w0YeYAQsFK0gI4Ni6jpivmG21dmUfA9fu8=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3061.namprd12.prod.outlook.com (2603:10b6:a03:a8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 08:29:08 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 08:29:08 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 01/11] usb: ch9: Add sublink speed struct
Thread-Topic: [PATCH 01/11] usb: ch9: Add sublink speed struct
Thread-Index: AQHWW7xD0Vg483QXNUGm0Me/HENawqkLUQ2AgAAI+QCAAAetAIAAA74AgAAIAoCAAAPAgA==
Date:   Fri, 17 Jul 2020 08:29:07 +0000
Message-ID: <5fd5d65a-b934-b11f-5fdc-4a7121c97bac@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <90961eec3e1ed3c27e41e7169353cc295c551604.1594935978.git.thinhn@synopsys.com>
 <20200717063403.GC3238569@kroah.com>
 <91597893-51ce-734b-285d-29de2641d540@synopsys.com>
 <20200717073338.GB694429@kroah.com>
 <26854ca2-06b5-1876-eb64-2484dcf6cdfe@synopsys.com>
 <20200717081541.GA1026451@kroah.com>
In-Reply-To: <20200717081541.GA1026451@kroah.com>
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
x-ms-office365-filtering-correlation-id: 21bbc0b5-b18d-4a11-c1a6-08d82a2b7966
x-ms-traffictypediagnostic: BYAPR12MB3061:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB306164B2184AD1773537E9C2AA7C0@BYAPR12MB3061.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z0pLlCc2AwdhybbD8N1QqGA5jg2hCxfMGWU74eJtCMnWZi8wn4aI5u3YsoShnbHh9aLL3fi/TGmXLEwq0YH3amrI6mqyx5RoQDe90sTrAeMleM0assaHXEitpgGLBP9ANyC2SQy+FfPyw/frKGetbMd+LxooSgQ9VKhhh+d94il170XFYeiTSnEVzq3dCbZ5WmlixntoW7iULbeO26HsaCPRDc+pujdtoEMWLWnzwJxtuoRcTcBYOkCPHi2//1R2FOkJthiA+eW5UXg5lggcKzMGd6mmc1tp9sGp6tsNJ1Ml2eHJwzHkmqLOAF+9p4I8XQ6pT5HIhekNeva9YOoo65vOo4duTGE215SecXkIGtnDG6Z7ZiJsQwXW0ejz1CCC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39860400002)(346002)(376002)(396003)(186003)(5660300002)(316002)(36756003)(107886003)(71200400001)(6486002)(6506007)(2616005)(86362001)(76116006)(66446008)(64756008)(66556008)(6512007)(66476007)(66946007)(8676002)(8936002)(26005)(31686004)(478600001)(4326008)(2906002)(31696002)(83380400001)(110136005)(54906003)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: cgIBp0p9oDydmTaJNp5K46Hvhjgve9HuQNpXnQJWFXpCZ3tPUXuPEZCU9JGZwls69qRGif8zXRQrfVKXYLNYt9vkFTD3ZFg4PCo65RWQNLLlRNaP7+zUZvwLkXW5f8zjdeHenl0pdvca1AHtALofnEd2EOPuAQhGyTS0BQUDwPjqEOcEMEPfivWZ5Uys2wgpmrsueisgn3SUGvPa4sbils32gg7UQRMuyjqdPOzD9RKqDOzesDNmUAl9xNLWGcZQpzjgqElDX8cJTDJo8Pxy8Qlowwly80KbS0ed1OWKufd4zASNyR1OSeH5bkPQ6qDw/FZlXxqNKqmLJMCgrj3SQA4XLR6rjvqnZ1eM8UYOwZoziWJarBoR0JSfyAi7r7Pj/lK7iAFc/Gemk8q0eoW2Vc+F2BiQ5aPv89o0KpB5B1X5WOU4o+TzWWs6W/VLEzG/8D5yCFbqcnmmvOGuEdpPZ0242U3VSEzUxttlVoNdHNM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <327E60373E0438438B85134FD2CF61BE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bbc0b5-b18d-4a11-c1a6-08d82a2b7966
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 08:29:08.0273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9qfWbvbyKBy745ayWJWvuDGz0U6dl0eibH0hXXVKPHRDW4debZpB9enp1fGosD9G20h9nld17cE3bdZjwzcbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3061
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAwNzo0
NzowM0FNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBHcmVnIEtyb2FoLUhhcnRtYW4g
d3JvdGU6DQo+Pj4gT24gRnJpLCBKdWwgMTcsIDIwMjAgYXQgMDc6MDY6MTBBTSArMDAwMCwgVGhp
bmggTmd1eWVuIHdyb3RlOg0KPj4+PiBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+Pj4+PiBP
biBUaHUsIEp1bCAxNiwgMjAyMCBhdCAwMjo1ODozNlBNIC0wNzAwLCBUaGluaCBOZ3V5ZW4gd3Jv
dGU6DQo+Pj4+Pj4gVVNCIDMuMiBzcGVjaWZpY2F0aW9uIHN1cHBvcnRzIGR1YWwtbGFuZSBmb3Ig
c3VwZXItc3BlZWQtcGx1cy4gVVNCDQo+Pj4+Pj4gZGV2aWNlcyBtYXkgb3BlcmF0ZSBhdCBkaWZm
ZXJlbnQgc3VibGluayBzcGVlZHMuIFRvIGF2b2lkIHVzaW5nIG1hZ2ljDQo+Pj4+Pj4gbnVtYmVy
cyBhbmQgY2FwdHVyZSB0aGUgc3VibGluayBzcGVlZCBiZXR0ZXIsIGludHJvZHVjZSB0aGUNCj4+
Pj4+PiB1c2Jfc3VibGlua19zcGVlZCBzdHJ1Y3R1cmUgYW5kIHZhcmlvdXMgc3VibGluayBzcGVl
ZCBhdHRyaWJ1dGUgZW51bS4NCj4+Pj4+Pg0KPj4+Pj4+IFNlZSBTU1AgQk9TIGRlc2NyaXB0b3Ig
aW4gVVNCIDMuMiBzcGVjaWZpY2F0aW9uIHNlY3Rpb24gOS42LjIuNQ0KPj4+Pj4+DQo+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPj4+Pj4+
IC0tLQ0KPj4+Pj4+ICAgICBpbmNsdWRlL3VhcGkvbGludXgvdXNiL2NoOS5oIHwgNDIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+Pj4gICAgIDEgZmlsZSBj
aGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspDQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2xpbnV4L3VzYi9jaDkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC91c2IvY2g5LmgN
Cj4+Pj4+PiBpbmRleCAyYjYyM2YzNmFmNmIuLmQ0ZmQ0MDNhMzY2NCAxMDA2NDQNCj4+Pj4+PiAt
LS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdXNiL2NoOS5oDQo+Pj4+Pj4gKysrIGIvaW5jbHVkZS91
YXBpL2xpbnV4L3VzYi9jaDkuaA0KPj4+Pj4+IEBAIC0xMTQ1LDYgKzExNDUsNDggQEAgZW51bSB1
c2JfZGV2aWNlX3NwZWVkIHsNCj4+Pj4+PiAgICAgCVVTQl9TUEVFRF9TVVBFUl9QTFVTLAkJCS8q
IHVzYiAzLjEgKi8NCj4+Pj4+PiAgICAgfTsNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gKy8qIFVTQiAz
LjIgc3VibGluayBzcGVlZCBhdHRyaWJ1dGVzICovDQo+Pj4+Pj4gKw0KPj4+Pj4+ICtlbnVtIHVz
Yl9sYW5lX3NwZWVkX2V4cG9uZW50IHsNCj4+Pj4+PiArCVVTQl9MU0VfQlBTID0gMCwNCj4+Pj4+
PiArCVVTQl9MU0VfS0JQUyA9IDEsDQo+Pj4+Pj4gKwlVU0JfTFNFX01CUFMgPSAyLA0KPj4+Pj4+
ICsJVVNCX0xTRV9HQlBTID0gMywNCj4+Pj4+PiArfTsNCj4+Pj4+PiArDQo+Pj4+Pj4gK2VudW0g
dXNiX3N1YmxpbmtfdHlwZSB7DQo+Pj4+Pj4gKwlVU0JfU1RfU1lNTUVUUklDX1JYID0gMCwNCj4+
Pj4+PiArCVVTQl9TVF9BU1lNTUVUUklDX1JYID0gMSwNCj4+Pj4+PiArCVVTQl9TVF9TWU1NRVRS
SUNfVFggPSAyLA0KPj4+Pj4+ICsJVVNCX1NUX0FTWU1NRVRSSUNfVFggPSAzLA0KPj4+Pj4+ICt9
Ow0KPj4+Pj4+ICsNCj4+Pj4+PiArZW51bSB1c2JfbGlua19wcm90b2NvbCB7DQo+Pj4+Pj4gKwlV
U0JfTFBfU1MgPSAwLA0KPj4+Pj4+ICsJVVNCX0xQX1NTUCA9IDEsDQo+Pj4+Pj4gK307DQo+Pj4+
Pj4gKw0KPj4+Pj4+ICsvKioNCj4+Pj4+PiArICogc3RydWN0IHVzYl9zdWJsaW5rX3NwZWVkIC0g
c3VibGluayBzcGVlZCBhdHRyaWJ1dGUNCj4+Pj4+PiArICogQGlkOiBzdWJsaW5rIHNwZWVkIGF0
dHJpYnV0ZSBJRCAoU1NJRCkNCj4+Pj4+PiArICogQG1hbnRpc3NhOiBsYW5lIHNwZWVkIG1hbnRp
c3NhDQo+Pj4+Pj4gKyAqIEBleHBvbmVudDogbGFuZSBzcGVlZCBleHBvbmVudA0KPj4+Pj4+ICsg
KiBAc3VibGluayB0eXBlOiBzdWJsaW5rIHR5cGUNCj4+Pj4+PiArICogQHByb3RvY29sOiBzdWJs
aW5rIHByb3RvY29sDQo+Pj4+Pj4gKyAqDQo+Pj4+Pj4gKyAqIFN1cGVyLXNwZWVkLXBsdXMgc3Vw
cG9ydHMgbXVsdGlwbGUgbGFuZXMuIFVzZSB0aGUgc3VibGluayBzcGVlZCBhdHRyaWJ1dGVzIHRv
DQo+Pj4+Pj4gKyAqIGRlc2NyaWJlIHRoZSBzdWJsaW5rIHNwZWVkLg0KPj4+Pj4+ICsgKg0KPj4+
Pj4+ICsgKiBTZWUgVVNCIDMuMiBzcGVjIHNlY3Rpb24gOS42LjIuNiBmb3Igc3VwZXItc3BlZWQt
cGx1cyBjYXBhYmlsaXR5IGZvciBtb3JlDQo+Pj4+Pj4gKyAqIGluZm9ybWF0aW9uLg0KPj4+Pj4+
ICsgKi8NCj4+Pj4+PiArc3RydWN0IHVzYl9zdWJsaW5rX3NwZWVkIHsNCj4+Pj4+PiArCXU4CQkJ
CWlkOw0KPj4+Pj4+ICsJdTE2CQkJCW1hbnRpc3NhOw0KPj4+Pj4gWW91IGhhdmUgdG8gdXNlIHRo
ZSBwcm9wZXIgZGF0YSB0eXBlcyBmb3IgY3Jvc3NpbmcgdGhlIHVzZXIva2VybmVsDQo+Pj4+PiBi
b3VuZHJ5IGhlcmUuICBUaGF0IHdvdWxkIGJlIF9fdTggYW5kIF9fdTE2LCByaWdodD8NCj4+Pj4+
DQo+Pj4+Pj4gKwllbnVtIHVzYl9sYW5lX3NwZWVkX2V4cG9uZW50CWV4cG9uZW50Ow0KPj4+Pj4+
ICsJZW51bSB1c2Jfc3VibGlua190eXBlCQl0eXBlOw0KPj4+Pj4+ICsJZW51bSB1c2JfbGlua19w
cm90b2NvbAkJcHJvdG9jb2w7DQo+Pj4+PiBBcmUgeW91IF9zdXJlXyB0aGF0IGFuIGVudW0gaXMg
dGhlIGNvcnJlY3Qgc2l6ZSBmb3IgdGhlc2UgZmllbGRzPyAgSG93DQo+Pj4+PiBjYW4geW91IGd1
YXJhbnRlZSB0aGlzPyAgV2UgZG8gbm90IHVzZSBlbnVtcyBpbiB0aGlzIHdheSBmb3IgYW55IG90
aGVyDQo+Pj4+PiBmaWVsZCBpbiB0aGlzIGZpbGUgZm9yIGEgcmVhc29uLi4uDQo+Pj4+Pg0KPj4+
Pj4gQW5kIGRpZCB5b3UgbG9vayBhdCB0aGUgbGF5b3V0IG9mIHRoaXMgc3RydWN0dXJlIHRvIHZl
cmlmeSBpdCBhY3R1YWxseQ0KPj4+Pj4gbWF0Y2hlcyB3aGF0IGlzIG9uIHRoZSB3aXJlIHdpdGgg
VVNCPyAgSSB0aGluayB5b3UgbmVlZCB0byBhZGQgYSBwYWNrZWQNCj4+Pj4+IGF0dHJpYnV0ZSB0
byBndWFyYW50ZWUgaXQuDQo+Pj4+IFRoaXMgc3RydWN0IGlzIG5vdCBpbnRlbmRlZCB0byBiZSBw
YWNrZWQgdG8gYmUgc2VudCBvdmVyIHRoZSBidXMuIEl0J3MgYQ0KPj4+PiBzaW1wbGUgc3RydWN0
IGZvciBob3N0IGFuZCBnYWRnZXQgZHJpdmVyIHVzZSBvbmx5LiBJIGludGVuZGVkIHRvIHVzZQ0K
Pj4+PiBlbnVtIHRvIG1ha2UgaXQgbW9yZSBjbGVhciBub3QgdG8gYmUgdXNlZCB0aGF0IHdheS4g
RnJvbSB5b3VyIHF1ZXN0aW9uLA0KPj4+PiBpdCdzIG9idmlvdXNseSBub3QgY2xlYXIuDQo+Pj4g
VGhlbiB3aHkgYXJlIHlvdSBwdXR0aW5nIGl0IGluIHRoaXMgZmlsZT8gIFRoaXMgZmlsZSBpcyBv
bmx5IGZvciB0aGluZ3MNCj4+PiB0aGF0IGFyZSBkZXNjcmliZWQgaW4gdGhlIFVTQiBzcGVjIHRo
YXQgbmVlZCB0byBjcm9zcyB0aGUgdXNlci9rZXJuZWwNCj4+PiBib3VuZHJ5Lg0KPj4gT2ssIGl0
IHNlZW1lZCB0byBmaXQgaGVyZS4gSSdsbCBwbGFjZSBpdCB1bmRlciAvaW5jbHVkZS9saW51eC91
c2IuaCB0aGVuPw0KPiBpbmNsdWRlL2xpbnV4L3VzYi9jaDkuaCBwZXJoYXBzPw0KDQpTdXJlLiBJ
J2xsIHBsYWNlIGl0IHRoZXJlLg0KDQo+Pj4+IE90aGVyd2lzZSwgaXQgbWF5IGxvb2sgc29tZXRo
aW5nIGxpa2UgdGhpczoNCj4+Pj4gc3RydWN0IHVzYl9zdWJsaW5rX3NwZWVkIHsNCj4+Pj4gICAg
wqDCoMKgwqDCoMKgwqAgX191OMKgwqDCoCBzc2lkOjQ7DQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKg
IF9fdTjCoMKgwqAgbHNlOjI7DQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgIF9fdTjCoMKgwqAgc3Q6
MjsNCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqAgX191OMKgwqDCoCByc3ZkOjY7DQo+Pj4+ICAgIMKg
wqDCoMKgwqDCoMKgIF9fdTjCoMKgwqAgbHA6MjsNCj4+PiBBcmUgeW91IHN1cmUgdGhvc2UgYml0
IGZpZWxkcyB3aWxsIHdvcmsgb24gYmlnLWVuZGlhbiBzeXN0ZW1zPw0KPj4gTm8uIEJlY2F1c2Ug
b2YgdGhlIHdheSB0aGUgYml0ZmllbGRzIGFyZSBwbGFjZWQsIGl0J3MgYSBwYXRoIHRvDQo+PiB1
bm5lY2Vzc2FyeSBoZWFkYWNoZS9idWdzIHdpdGggYm91bmRhcnkgYW5kIGVuZGlhbm5lc3MgY2hl
Y2tzLiBUaGF0J3MNCj4+IHdoeSBJIGRlY2lkZWQgdG8gZ28gd2l0aCB0aGUgb3RoZXIgc29sdXRp
b24uDQo+IFRoYXQncyBnb29kLCBidXQgYWdhaW4sIHRoaXMgaXMgYSB1YXBpIGZpbGUsIG5vdCBh
ICJub3JtYWwiIGluY2x1ZGUgZmlsZQ0KPiBpbiB0aGUga2VybmVsLCB5b3UgaGF2ZSB0byBiZSBj
YXJlZnVsIGFib3V0IHRoaXMuDQo+DQoNCldpbGwgZG8uIFRoYW5rcyBmb3IgdGhlIHF1aWNrIHJl
c3BvbnNlcy4NCg0KQlIsDQpUaGluaA0K
