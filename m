Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386E51C5DD5
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 18:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgEEQtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 12:49:09 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:44144 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729119AbgEEQtI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 12:49:08 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BBB88406DF;
        Tue,  5 May 2020 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588697347; bh=u1YqJIRthJ/wYvvYLjjN3ZIYYH/yyrUb/ZbMrp3oh2Q=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=CtR/HTL1N7nRVvY/XkwXt3v91r6hF6W7PQRBFjgPxlTCqyWEm90e5hNRQMMwZNnci
         BqdM5oktvVeGVM1DAqKOZQYuX0OltKfAcdD7Evsrr+nPc5IOMdfvGjS8MU2j2gdasj
         CI2JIPJdUwWNa8qMO8J5jZCLGu2q4QRyzuYPt3k82LVxpX1pbZtFJc+GrrbVM/meUZ
         K00irSGgCHpR5N3Ur56KHwa+gDksSiSk5y3pQqQNdpmo+NHtL6KzKCZhpq1VWtFKGJ
         fwpDHznAYfBDE1ouutfI8yXXlVtNL7S4Q/F0XEMjZA6zEA9upE+i7/EzgqLFGzMABI
         UMaiHi2ttftYA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 120FCA02BE;
        Tue,  5 May 2020 16:49:05 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 May 2020 09:47:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 5 May 2020 09:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PS/miNVmLJpBpDz2mXDcwsxITBjOtk1il0JuC0jFPOcfi+86/QIvmdSVFXE5tydJgETynesAM6bJlgWbe9g1wa7xo0JZQh/cFBR13IHjNs7cKlafutixUrEMpc9tVFOZqzW1bdX9uabKYPm9BcQAiP2+Y5GyUZ8A+Z9GCUMaJpSCy/XxQVzrzv+cWPskZZE56dICMLetBKJ2Lop+k8Vj5uETUlV4Z0PBUajw1Hf5NrSc2cJG/yUT+8myPO2F6rMRSCNqYAKv4hP0YxaUO4Wzu1FFokuYsaLa1yPAZPIqgUTYZo0WC5h9HL0tkzETpSQGfbTr0zRw7f/alq/qw9lQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1YqJIRthJ/wYvvYLjjN3ZIYYH/yyrUb/ZbMrp3oh2Q=;
 b=k/axUjUvNzS/aOckhyNkrqOUfQoUjEfKo8wXBjDNxy26KeLGmBdwa748RG0ZwmsWnRmhnFEbejzRLL6m/b2j9DsllXMv5WqyEy+MTjY3P43Rv6PQ3N3WlZdR8cVKwkSoq5vnlMz/tV7l05ixTCv/36M8+p3RbdBlzl3NlNsx9MXKSkMNnbNqHO6CZtsCyUlaKMqNy+JxxkwiIf7z68sOjlOSVE+9KPQOWxEorzghL00/x1Ks/hxd67FZu9lOZlbFpXq0txB8M3VSRfcEX94TQVONXhXLVpYrGdjRkrIHzqUubu1A34hCRp4G39JY5DzyTkM1dS+low8/b1zGvVbb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1YqJIRthJ/wYvvYLjjN3ZIYYH/yyrUb/ZbMrp3oh2Q=;
 b=s/2KbvUeqCFrZvbs91HfWfqZz0nRDXq+GywgAJOg/SYTr/tvxtau/rycwxbTXrNPQf6uXFLOo6S370hKVX6Q6/o4h7pMFWXnc60YrV6oZ2UesoRFAIqGoDo7Lz5alzaDDs2F+I6ZS2jb7b2si2rAfMeTDeYPTa1/FurkwO8BH8U=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3398.namprd12.prod.outlook.com (2603:10b6:a03:aa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Tue, 5 May
 2020 16:42:38 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248%7]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 16:42:38 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Andrey Konovalov <andreyknvl@google.com>,
        Felipe Balbi <balbi@kernel.org>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        "Dmitry Vyukov" <dvyukov@google.com>
Subject: Re: Testing endpoint halt support for raw-gadget
Thread-Topic: Testing endpoint halt support for raw-gadget
Thread-Index: AQHWDo66/6ijSNlDGECrg+3ziouRZ6hxgSoAgAD2yoCAAAs+AIAc+SWAgADFYQCAB95CgIAAAjcAgAANXwCAAAD/AIABAKuAgABevICAAEtKgA==
Date:   Tue, 5 May 2020 16:42:38 +0000
Message-ID: <bc816969-b708-4e5f-1f97-5263801936ce@synopsys.com>
References: <Pine.LNX.4.44L0.2005041114130.11213-100000@netrider.rowland.org>
 <87a72mc2le.fsf@kernel.org>
 <CAAeHK+yk-qDR=8VvhEyxggT-3KuT26smHX_HTeUNRxg+1ObeQA@mail.gmail.com>
In-Reply-To: <CAAeHK+yk-qDR=8VvhEyxggT-3KuT26smHX_HTeUNRxg+1ObeQA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35893813-dff4-4c21-70e3-08d7f1135253
x-ms-traffictypediagnostic: BYAPR12MB3398:
x-microsoft-antispam-prvs: <BYAPR12MB339863F178A9D37EEF3E7645AAA70@BYAPR12MB3398.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MgBvU6K7QJi7m/Ghn6GzBk9BRt0tG0IOIpHLv/O2siVb22E+RH7miTrEDyRqJ7lybLNj77vIAmJQVHsLGtTRPLgG9l1nxJL2ySUJCQk3yc+b1zlZr2SdYJj5ZiE3j9V1rRr2S+Xi2rysJPzX3yJzTbDmSDMAcXzL0awe5BR6x6rBzRWGXcPJ17R3mnwRVEJzVY6Jr8ULi/dBPcjc3zgQeaGjq8XiZRZuzCoALsisby3Zg3YRx/zJzSuawuz0RfcB9YUapiAZfwpBBO62cj751u9RmRqKlSMHZvNJqoYj4NTg2arpPG6K9eFgxkbnlgnrGX9/HHHEu+JDY7ACtPhqZwKQFWk/MIr4kQfgPdPDn5DL2QwXQTk3TgfNXVNZQK2tuhGsA8gF9YRGNcNYT7s5venel+zw9HdWFiPGMMNpb3PtzxltWsSQIGP4p6lsrxWUKL5AMW2xZ6wsJstjUW2HZDAlQC41drD4ebKOcOqPhssH1mMtCyY67cWdFtpqHeLMCMFd1Id0YEgWVthh44umw7FZJo+8o7wOiyvmL4XO6xOtwguiEOIurBkHoQiyXroa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(33430700001)(66476007)(6506007)(64756008)(54906003)(53546011)(110136005)(66446008)(8676002)(6486002)(86362001)(8936002)(76116006)(31686004)(66946007)(6512007)(36756003)(71200400001)(26005)(66556008)(31696002)(2616005)(186003)(33440700001)(316002)(2906002)(4326008)(5660300002)(478600001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: NLi/flLfUmG4zSkrV45ox3lYjNTFVBFAwXaomNZoOcNV7KwKmEKTMhomoME4hSlg5xEpgsQgmHCjvxFWTgvmd1RBMvn57LBiK9GB5IZt6BOQdzDoUZzskRJWC0iRoDOg2WpGUqC+mxIUunFfFXOiNbtQJzMidkrcTa0m3W2JXTCB+4IW6MCEudf/1W0W9pmySEpZ+0WhFRq4BKxx+WZoex1bJ7pNi4t9/A6EvowM5uZUQ+KfCFmAIxDykFB7g2Gc8fNsW9Kfr9yeUB99pLTg1zhY4yofh1RYuiAcKwQfG1NId+4g4Y6QHV3rA0OO9W13gDHjcphS3Pfzx9hA8sYCDeGSKKrKOa7pWWmEWK6p7n2KTF1dlMjWOb2vE8wuFMSGqxqhu0ZcOORsvqNoCJGRtZiPHfa0w4UIo2y53pq8sYUkaluPaf4SdXr5D8Z6a+CXcT0E7D879RAQ6ReBdW1GIiyBmHa+b/zJ2yyjvr0OFdYi26bIRlXn9GVv+K/ruW/8h8lLIij8omc2ZFT46Io5H8nvaxls3KXZz8nP6Q7XkDKRty9yPMzm3820D5K72hDJQ9Cxh5A/faUXvpHziHK+iwTN/t8kz7cw1HoP2uKtoYKR2/gUwS+HIMGzzi7N58bwNUEGWiN7VyTFr108yOOxeGtFeLOjpwnItMXOQ9wa11eYFweWvTqn/1BS8Rvu1AmLdbDho2AEa5hRt0U5KDhNIIqYIiZETmFZ4IjLkjk/u/NEDCJxLGmXzcH7uA/32hV9C/N27NuIQXzyxR6h+hAOXGQ8cBG21SGwdkoDzy1hjuM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D5F09569B145541A9B4DCCA951C1ED3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 35893813-dff4-4c21-70e3-08d7f1135253
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 16:42:38.2708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qeKnDriuZELeCzUKSpqhf0iqXDTFM1MpZxG3h7LeJ09gDjfVfV9XGSKVyz8rZHigOP+hh7OW+WrkXvMLJK+5BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3398
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QW5kcmV5IEtvbm92YWxvdiB3cm90ZToNCj4gT24gVHVlLCBNYXkgNSwgMjAyMCBhdCA4OjM0IEFN
IEZlbGlwZSBCYWxiaSA8YmFsYmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+Pg0K
Pj4gQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdT4gd3JpdGVzOg0KPj4+IE9u
IE1vbiwgNCBNYXkgMjAyMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToNCj4+Pg0KPj4+PiBPbiBN
b24sIE1heSA0LCAyMDIwIGF0IDQ6MjQgUE0gQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5oYXJ2
YXJkLmVkdT4gd3JvdGU6DQo+Pj4+PiBPbiBNb24sIDQgTWF5IDIwMjAsIEFuZHJleSBLb25vdmFs
b3Ygd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4+IE9uZSBtb3JlIHF1ZXN0aW9uIChzb3JyeSBmb3Igc28g
bWFueSA6KS4NCj4+Pj4+Pg0KPj4+Pj4+IExvb2tpbmcgYXQgb3RoZXIgZmllbGRzIG9mIHVzYl9y
ZXF1ZXN0IHN0cnVjdCBJIHNlZSBmcmFtZV9udW1iZXIuDQo+Pj4+Pj4gQUZBSVUgaXQncyBmaWxs
ZWQgaW4gYnkgdGhlIFVEQyBkcml2ZXIgZm9yIElTTyB0cmFuc2ZlcnMuIERvZXMgaXQgbWFrZQ0K
Pj4+Pj4+IHNlbnNlIHRvIGV4cG9zZSBpdCB0byB1c2Vyc3BhY2U/IEkgZG9uJ3Qgc2VlIGFueSBj
b21wb3NpdGUvbGVnYWN5DQo+Pj4+Pj4gZ2FkZ2V0cyB1c2UgdGhhdCBmaWVsZCBhdCBhbGwuDQo+
Pj4+PiBEbyBhbnkgb2YgdGhvc2UgZ2FkZ2V0IGRyaXZlcnMgdXNlIGlzb2Nocm9ub3VzIGVuZHBv
aW50cz8NCj4+Pj4gWWVzLCB0aGVyZSBhcmUgYXVkaW8vdXZjIGZ1bmN0aW9uL2xlZ2FjeSBkcml2
ZXJzIHRoYXQgdXNlIHRob3NlLg0KPj4+Pg0KPj4+Pj4gSW4gZmFjdCwgaXQgYWxzbyBsb29rcyBs
aWtlIG5vbmUgb2YgdGhlIGRyaXZlcnMgaW4gZ2FkZ2V0L3VkYy8gdG91Y2gNCj4+Pj4+IHRoZSBm
cmFtZV9udW1iZXIgZmllbGQuICBNYXliZSB3ZSBzaG91bGQganVzdCBnZXQgcmlkIG9mIGl0LCBz
aW5jZSBpdA0KPj4+Pj4gaXNuJ3QgYmVpbmcgdXNlZC4NCj4+Pj4gSXQgaXMgdXNlZCBieSBkd2My
LzMgZ2FkZ2V0IGRyaXZlcnMgKHdoaWNoIGFyZSBub3QgaW4gZ2FkZ2V0L3VkYy8pLg0KPj4+IFdl
bGwsIGlmIEZlbGlwZSB0aGlua3Mgd2Ugb3VnaHQgdG8ga2VlcCB0aGUgZmllbGQgdGhlbiB5b3Ug
bWlnaHQgYXMNCj4+PiB3ZWxsIGV4cG9ydCBpdCB0byB1c2Vyc3BhY2UuICBEcml2ZXJzIGFyZSBm
cmVlIHRvIGlnbm9yZSBpdC4gIDotKQ0KPj4gZHdjMyBoYXMgaXRzIG93biBwcml2YXRlIGZyYW1l
X251bWJlciBhcyBwYXJ0IG9mIGl0cyBvd24gZW5kcG9pbnQNCj4+IHN0cnVjdHVyZS4gV2Ugc2lt
cGx5IGNvcHkgdGhhdCB0byB0aGUgcmVxdWVzdC4gVGhhdCdzIGlzIGN1cnJlbnRseQ0KPj4gdGVs
bGluZyB0aGUgZ2FkZ2V0IGRyaXZlciB3aGljaCBmcmFtZSB0aGUgcmVxdWVzdCBjb21wbGV0ZWQu
IEl0IGNvdWxkIGJlDQo+PiB1c2VkIGJ5IHRoZSBmdW5jdGlvbiB0byBkZWNpZGUgd2hlbiB0byBx
dWV1ZSBtb3JlIHJlcXVlc3RzLiBJdCBjYW4gYWxzbw0KPj4gYmUgdXNlZCB0byBwcmVkaWN0IGlm
IHdlJ3JlIGluIHN5bmMgd2l0aCB0aGUgZnJhbWVzIG9yIHdpbGwgd2UgZGl2ZXJnZQ0KPj4gYW5k
IG1pc3MgZnJhbWVzIGluIHRoZSBmdXR1cmUuDQo+Pg0KPj4gSWYgbm9ib2R5IGhhcyBpbXBsZW1l
bnRlZCBhbnkgb2YgdGhhdCBzbyBmYXIsIEkgZG9uJ3QgbWluZCByZW1vdmluZw0KPj4gaXQuIFdl
IG5lZWQgc3Ryb25nIGV2aWRlbmNlIHRoYXQgdGhpcyB3aWxsIG5ldmVyIGJlIHVzZWQsIHRob3Vn
aCA6LSkNCj4gT0ssIEkgc2VlLCBJZiB0aGlzIGZpZWxkIGlzIGEgcG90ZW50aWFsIGNhbmRpZGF0
ZSBmb3IgcmVtb3ZhbCwgSSB3b24ndA0KPiBleHBvc2UgaXQgdGhyb3VnaCByYXctZ2FkZ2V0IGp1
c3QgeWV0LCBidXQgSSdsbCB0cnkgdG8gbWFrZSB0aGUNCj4gaW50ZXJmYWNlIGV4dGVuc2libGUg
c28gdGhhdCBpdCBjYW4gYmUgZWFzaWx5IGFkZGVkIHdoZW4gbmVlZGVkLg0KDQpQbGVhc2UgZG9u
J3QgcmVtb3ZlIHRoaXMuIFdlIGFsc28gdXNlIGl0IGZvciBvbmUgb2Ygb3VyIEhXIHZhbGlkYXRp
b24gdG9vbHMuDQoNCkJSLA0KVGhpbmgNCg==
