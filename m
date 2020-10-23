Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAADF296D0D
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 12:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462484AbgJWKvz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 06:51:55 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47334 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S372768AbgJWKvz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Oct 2020 06:51:55 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C85E142820;
        Fri, 23 Oct 2020 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603450314; bh=mp15ko+HZsE6uOluU9pi/eFJYaPI6oCoJjM6RpNHgMY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=hU8bJwM+iMaz+zNJRWKqfnVLUldF5Ez4OQfTFocRaQwk7aFtratVglEHaMu6dmHDp
         8hmQ3t4eKavLbGB/ztKuTixgZl6g2p6cEzdEYkq636NtZjhbnEGBeXNFrZH08ARhUQ
         hsjL15cyjhgL/j1f87qXt5N4CgqJ4dB8N+jBGso2le5RF3EKNdZTO9Fq+xURaYvZ16
         JpiNieCBp2IZ//Sz8lZbaUy6MVglPIwuxUCk3JMB33zXRJQLxL0j1n5WagdJJXtWze
         xUSjD9FUShiNmOaULRNFVtSXqJpOCduZ4Dx6vlojBeGEWIrRbZ7Vv+b+v4y4zVhb6F
         ssphTj9SB8wOg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id AB362A0067;
        Fri, 23 Oct 2020 10:51:54 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A44AA8022F;
        Fri, 23 Oct 2020 10:51:53 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Ld3QGgPi";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7PpUDOuCXgPPekbYovDNaExhUqvm4jANR6PaTVHj1PAg7AHlzGjsdK6R0ogJqzWtBMa4/u4KOteW/xCPrXgmliZumPsg+ePgcxDYFW7xHu3Mu3gHYFlXHj1117bo0S+oeWtB81pyAzmCXVL/zY0iJjCTxSlkMzlmDAw/H77eVVPw5j1hrqHk52bzHfNbzaWg7Cgg4OMOjz1nZUkFC4mhPgnPdm1Eu5XtpupDeH1UmO6TLNjx5ajuQn8LpCZsczWN/ENBzX1zTA6APx5AjsjU57peDmL6PQfjg1RwXEYq2FzdFld6SVszmdur797vFGkupPLiKZ++e8QbodyfWkeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mp15ko+HZsE6uOluU9pi/eFJYaPI6oCoJjM6RpNHgMY=;
 b=MBLmdkm4evEQ1g3zodOnvhrXtzINghHoxCo3HxCpiasuW5DZXu7mLJlUzfo3sG/0YsBbw/tFfZ7eypclhM9I+LFPtKwKcDoIqN8i+i/gQ1vWYyxOCc/7D7FsMes0LsNMBOl0SY8nxrF0U6bVOXV3r1I3MNkDYzllZlLLxzoiqwQ+jbM0HnySm8/H9yBw/JlfesOnN9uP05jtO+MCMvncpBHXQa71t1qdPRTE48ZgWLvbJI96r4raTBWp30hSNTcX98WHOn8G8WEsr3xE9kZyUwY27lUFnHROzFsVhBWeAAaMEhphpu/47TVKlpCNkW0+Z7LCFTpjMtvNt6lwDjSAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mp15ko+HZsE6uOluU9pi/eFJYaPI6oCoJjM6RpNHgMY=;
 b=Ld3QGgPiDljncSRlYQwixaLPUmj6XCxFK1omoleFgqEW6ihT6/8FK5dzEB9sNGW5YK0yxbmP3xuNxZMlmq/u4ohN8qv4U93KhGTQNo8NYKfOZ3lJipFee5yvC51TbmcCctrIC4j67ZybZ2J7mLQrOSpe1wgeV9l7Qb1E3qitIBE=
Received: from BY5PR12MB3777.namprd12.prod.outlook.com (2603:10b6:a03:1a9::14)
 by BYAPR12MB3462.namprd12.prod.outlook.com (2603:10b6:a03:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 23 Oct
 2020 10:51:52 +0000
Received: from BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::dce3:484b:db4f:c21b]) by BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::dce3:484b:db4f:c21b%3]) with mapi id 15.20.3499.018; Fri, 23 Oct 2020
 10:51:52 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 00/15] usb: dwc2: Fix and improve power saving modes.
Thread-Topic: [PATCH v2 00/15] usb: dwc2: Fix and improve power saving modes.
Thread-Index: AQHWn9WBgqOp/Ezd70Kyf9aFxo+N8qmlFVuA
Date:   Fri, 23 Oct 2020 10:51:51 +0000
Message-ID: <2edb35af-bf0b-bfab-69c7-9b7f0cac6a69@synopsys.com>
References: <20201011135035.7C61DA005E@mailhost.synopsys.com>
In-Reply-To: <20201011135035.7C61DA005E@mailhost.synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [37.252.81.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76771773-7821-4914-d487-08d87741a654
x-ms-traffictypediagnostic: BYAPR12MB3462:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3462EC66D96C64EB490BC695A71A0@BYAPR12MB3462.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hOiYFamquVF3HjO5nI8add4eGusFwW9DKOcbwO5jehMnt2QSOagnfP1ALNV1QyHJ9CvTf3SuL7wpl8DAHtktWS9bT+GyngmY5L5KvdEajxaubz19c2ha2nSOMnrUyvqWWXrjmdrkkfxzt0FE86uvxglLGNiaxNVFSEP0G7wpxQ34KhJXYJBhCUnKbaqXShkLj08BUAvEz22J0qxG9vSU5bXRfHdbUrfCVOvJ6lu2jz6wMB2aosxNUDXb6JZ732BvNR1bx6gFFV+zuWHdcPENEDtgl/HktBO9hyDIB5fvY7bGxnMj8UtXDLVj4ST0y8Val9c3Rdu6BGf2Xq9JNbIbe44/zPUxzqzk+D1PDT8RRypeV9ibi3fZB1EqBviiOHD+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3777.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(54906003)(478600001)(110136005)(36756003)(316002)(83380400001)(6512007)(4326008)(71200400001)(2906002)(91956017)(66476007)(53546011)(76116006)(86362001)(31686004)(2616005)(26005)(31696002)(6506007)(66946007)(64756008)(6486002)(5660300002)(66446008)(186003)(8676002)(66556008)(8936002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: PeJ0/x5LZ70GvEaq6+LfxJzI+mxF5KsQjsmYK9tboBvsu4K98ZU8VipGl2o1dmftLIgmpBofcrc1GHhAhchQumJX75ZOlP4FgbfsnkTzaig5TZD5DTJ5WPw4ByAqC0JTLOyOT+U7ShRXLDG5vFM5XHSmJ/6A1MljUm5x2S1gNmkbLmNgvbVODzE+VQ/hwYebppVCAY4ndg92kQQL8wOTlrJb3XmE3wy9+R5LmJTfGnay8TBsaE4gebiM1OVbTwsKUMhKhxTlJZUsxj0TJO6LTexeb1QXBgbDT8Czu8FnyJ+Rl3qLBodbfz8hD+CmVHSeBHRKL28nqv2mOjuX7AxNv8KSpleLvSYQTeFFqyD+VZipZ9nh6vWGvLc8MXS/5O1yHodFYD17DXfNSHqQPHBD8d/AGXv668Z3KKYaiMck+e7ud7vx1ooZp4pb8RUiv9mUyBJLK5I5sNtyF2qmrI2M7jrb6yJBI7Yc4t6WeEn2y4jKn8/vG+XjcUDj3K/m7oM4LGGzR8DNpcnU3PeHCRxWHWCnBjIk+4eWejjHC4+Y8IDuyW5aWiS1oISrobbmftl48v0tIw/vzY/tPkq75ybeToYHA6UfqE12VFlvCen2sHM3TAHBVsHVgQV8DZIMyTEzRitHPp+3rkMonx1+45+kcg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <20143832C7AD26479840C002959EF231@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3777.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76771773-7821-4914-d487-08d87741a654
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 10:51:51.9172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPkgf6zltcoHgxwvhy0iCYPOQL8wwP5GxfV1lA8A5GtfO6eryfvgI/PW+Uw3fK6IZ8Z9Ngi3U/b1rqWY+Rcn6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3462
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTAvMTEvMjAyMCA1OjUwIFBNLCBBcnR1ciBQZXRyb3N5YW4gd3JvdGU6DQo+IFRoaXMgcGF0
Y2ggc2V0IGZpeGVzL2ltcHJvdmVzIHBhcnRpYWwgcG93ZXIgZG93biwgaGliZXJuYXRpb24gcG93
ZXINCj4gc2F2aW5nIG1vZGVzIGFuZCBhZGRzIHN1cHBvcnQgZm9yIGhvc3QvZGV2aWNlIGNsb2Nr
IGdhdGluZy4NCj4gDQo+IENoYW5nZXMgZnJvbSBWMToNCj4gICAtIEFkZGVkIG5ldyBwYXRjaGVz
Lg0KPiAgICAxLiB1c2I6IGR3YzI6IEFkZCBzdXBwb3J0IGZvciBkd2MyIGhvc3QvZGV2aWNlIGNs
b2NrIGdhdGluZy4NCj4gICAgMi4gdXNiOiBkd2MyOiBBZGQgZXhpdCBwb3dlciBzYXZpbmcgbW9k
ZSBiZWZvcmUgcmVtb3ZpbmcgZHJpdmVyLg0KPiAgICAzLiB1c2I6IGR3YzI6IEZpeCBIUFJUMC5Q
cnRTdXNwIGJpdCBzZXR0aW5nIGZvciBIaUtleSA5NjAgYm9hcmQuDQo+IA0KPiAgIC0gVXBkYXRl
ZCBwYXRjaGVzDQo+ICAgIDEuIHVzYjogZHdjMjogRml4L3VwZGF0ZSBlbnRlci9leGl0IHBhcnRp
YWwgcG93ZXIgZG93bi4NCj4gCS0gVXBkYXRlZCB0aGUgcGF0Y2ggbmFtZSBmcm9tICJ1c2I6IGR3
YzI6IEZpeA0KPiAJZHdjMl9yZXN0b3JlX2RldmljZV9yZWdpc3RlcnMoKSBmdW5jdGlvbi4iIHRv
ICJ1c2I6IGR3YzI6DQo+IAlGaXgvdXBkYXRlIGVudGVyL2V4aXQgcGFydGlhbCBwb3dlciBkb3du
LiINCj4gCS0gVXBkYXRlZCBlbnRlcmluZyBhbmQgZXhpdGluZyBwYXJ0aWFsIHBvd2VyIGRvd24g
ZnVuY3Rpb24NCj4gCWZsb3cuIEJlZm9yZSB0aGVyZSB3YXMgYSBsb3Qgb2YgY29uZnVzaW9ucyB3
aXRoIGNvcmUNCj4gCWVudGVyaW5nIHRvIHBhcnRpYWwgcG93ZXIgZG93biBpbiBkZXZpY2Ugb3Ig
aG9zdCBtb2RlLg0KPiAJLSBBZGRlZCAicmVtX3dha2V1cCIgZm9yIGhvc3QgZXhpdGluZyBmcm9t
IFBhcnRpYWwgUG93ZXINCj4gCURvd24gbW9kZSBmcm9tIGhvc3QgcmVtb3RlIHdha2V1cCBmbG93
LiBBY2NvcmRpbmcgdG8NCj4gCXByb2dyYW1taW5nIGd1aWRlIGluIGhvc3QgbW9kZSwgcG9ydCBw
b3dlciBtdXN0IGJlDQo+IAl0dXJuZWQgb24gd2hlbiB3YWtldXAgaXMgZGV0ZWN0ZWQuDQo+IAkt
IEFkZGVkICJpbl9wcGQiIGZsYWcgdG8gaW5kaWNhdGUgdGhlIGNvcmUgc3RhdGUgYWZ0ZXINCj4g
CWVudGVyaW5nIGludG8gUGFydGlhbCBQb3dlciBEb3duIG1vZGUuDQo+ICAgIDIuIHVzYjogZHdj
MjogRml4IHdha2V1cCBkZXRlY3RlZCBhbmQgc2Vzc2lvbiByZXF1ZXN0IGludGVycnVwdCBoYW5k
bGVycy4NCj4gCS0gQWNjb3JkaW5nIHRvIHByb2dyYW1taW5nIGd1aWRlIGFkZGVkIHBhcnRpYWwg
cG93ZXINCj4gCWRvd24gZXhpdCBmbG93IGluIHdha2V1cCBkZXRlY3RlZCBpbnRlcnJ1cHQgaGFu
ZGxlci4NCj4gCS0gQWRkZWQgY2xvY2sgZ2F0aW5nIGV4aXQgZmxvdyBmcm9tIHdha2V1cCBkZXRl
Y3RlZA0KPiAJYW5kIHNlc3Npb24gcmVxdWVzdCBpbnRlcnJ1cHQgaGFuZGxlcnMuDQo+ICAgIDMu
IHVzYjogZHdjMjogRml4IHN1c3BlbmQgc3RhdGUgaW4gaG9zdCBtb2RlIGZvciBwYXJ0aWFsIHBv
d2VyIGRvd24uDQo+IAktIEFkZGVkICJkd2MyX3BvcnRfc3VzcGVuZCIgYW5kICJkd2MyX3BvcnRf
cmVzdW1lIiBmdW5jdGlvbnMgdG8NCj4gCSJjb3JlLmgiIGhlYWRlciBmaWxlDQo+IAktIFVwZGF0
ZWQgIlVTQl9QT1JUX0ZFQVRfUkVTRVQiIGZsb3cgd2hlbiBjb3JlIHJlY2VpdmVzIHBvcnQNCj4g
CXJlc2V0IGluIFBhcnRpYWwgUG93ZXIgRG93biBvciBIaWJlcm5hdGlvbiBzdGF0ZS4NCj4gCS0g
QWRkZWQgcmV0dXJuICItRU5PREVWIiBpZiBjb3JlIGlzIGluIHN1c3BlbmQgc3RhdGUNCj4gCWlu
ICJfZHdjMl9oY2RfdXJiX2VucXVldWUiIGZ1bmN0aW9uIHRvIGF2b2lkIHBvcnQNCj4gCXJlc2V0
IGlzc3VlLCB3aGVuIGFuIGV4dGVybmFsIGh1YiBpcyBjb25uZWN0ZWQuDQo+ICAgIDQuIHVzYjog
ZHdjMjogQWRkIHBhcnQuIHBvd2VyIGRvd24gZXhpdCBmcm9tIGR3YzJfY29ubl9pZF9zdGF0dXNf
Y2hhbmdlKCkuDQo+IAktIEluc3RlYWQgb2YgY2xlYXJpbmcgcmVnaXN0ZXJzIGlubGluZSBmb3Ig
ZXhpdGluZyBwYXJ0aWFsIHBvd2VyIGRvd24NCj4gCW1vZGUsIG5vdyBjYWxsaW5nIHRoZSAiZHdj
Ml9leGl0X3BhcnRpYWxfcG93ZXJfZG93biIgZnVuY3Rpb24gd2l0aG91dA0KPiAJcmVzdG9yaW5n
IHRoZSBiYWNrdXAgcmVnaXN0ZXJzLg0KPiAgICA1LiB1c2I6IGR3YzI6IFVwZGF0ZSBkd2MyX2hh
bmRsZV91c2Jfc3VzcGVuZF9pbnRyIGZ1bmN0aW9uLg0KPiAJLSBBZGRlZCBjaGFuZ2VzIHN1Z2dl
c3RlZCBieSBEb3VnbGFzIEFuZGVyc29uIGZyb20gY29tbWl0DQo+IAkidXNiOiBkd2MyOiBHZXQg
cmlkIG9mIHVzZWxlc3MgZXJyb3IgY2hlY2tzIGZvcg0KPiAJaGliZXJuYXRpb24vcGFydGlhbCBw
b3dlciBkb3duIg0KPiAgICA2LiB1c2I6IGR3YzI6IEZpeCBoaWJlcm5hdGlvbiBiZXR3ZWVuIGhv
c3QgYW5kIGRldmljZSBtb2Rlcy4NCj4gCS0gQWRkZWQgc2V0dGluZyBvZiAiaHNvdGctPmJ1c19z
dXNwZW5kZWQiIGZsYWcgdG8gMCBiZWNhdXNlIGJlZm9yZSBpZg0KPiAJY29yZSBleGl0ZWQgZnJv
bSAiR1BXUkROX1NUU19DSEdJTlQiIGludGVycnVwdCBpbiBob3N0IG1vZGUgdGhlIGZsYWcNCj4g
CXJlbWFpbmVkIHRydWUgbm90IGxldHRpbmcgZW50ZXIgdG8gaGliZXJuYXRpb24gbmV4dCB0aW1l
Lg0KPiAgICA3LiB1c2I6IGR3YzI6IENsZWFyIGZpZm9fbWFwIHdoZW4gcmVzZXR0aW5nIGNvcmUu
DQo+IAktIEFkZGVkICJzdGF0aWMgaW5saW5lIHZvaWQgZHdjMl9jbGVhcl9maWZvX21hcCgpIiBo
ZWxwZXINCj4gCWZ1bmN0aW9uIHRvIGNsZWFyIGZpZm9fbWFwIHdpdGggcGVyaXBoZXJhbCBvciBk
dWFsIHJvbGUgbW9kZS4NCj4gCS0gQWRkZWQgYSBkdW1teSB2ZXJzaW9uIG9mICJkd2MyX2NsZWFy
X2ZpZm9fbWFwKCkiIGhlbHBlcg0KPiAJZm9yIGhvc3Qtb25seSBtb2RlLg0KPiAgICA4LiB1c2I6
IGR3YzI6IEFkZCBwb3dlciBzYXZpbmcgbW9kZSBzdXBwb3J0IGZyb20gc3lzdGVtIGlzc3VlZCBz
dXNwZW5kL3Jlc3VtZS4NCj4gCS0gVXBkYXRlZCB0aGUgcGF0Y2ggbmFtZSBmcm9tICJ1c2I6IGR3
YzI6IEFkZCBlbnRlci9leGl0IGhpYmVybmF0aW9uDQo+IAlmcm9tIHN5c3RlbSBzY2hlZHVsZWQg
c3VzcGVuZCIgdG8gInVzYjogZHdjMjogQWRkIHBvd2VyIHNhdmluZyBtb2RlDQo+IAlzdXBwb3J0
IGZyb20gc3lzdGVtIGlzc3VlZCBzdXNwZW5kL3Jlc3VtZS4iDQo+IAktIEZpeGVkIGlzc3VlIHJl
bGF0ZWQgdG8gInNwaW5sb2NrIGFscmVhZHkgdW5sb2NrZWQiIHJlcG9ydGVkIGJ5IERvdWcNCj4g
CUFuZGVyc29uLg0KPiANCj4gICAtIEFiYW5kb25lZCBwYXRjaGVzLg0KPiAgICAxLiB1c2I6IGR3
YzI6IEFkZCBwb3J0IGNvbm4uIHN0cy4gY2hlY2tpbmcgaW4gX2R3YzJfaGNkX3Jlc3VtZSgpIGZ1
bmN0aW9uLg0KPiAJLSBUaGUgY2hhbmdlcyBvZiB0aGlzIHBhdGNoIGFyZSBtb3ZlZCB0byB0aGUg
InVzYjogZHdjMjogQWRkIHBvd2VyDQo+IAlzYXZpbmcgbW9kZSBzdXBwb3J0IGZyb20gc3lzdGVt
IGlzc3VlZCBzdXNwZW5kL3Jlc3VtZSIgcGF0Y2guDQo+ICAgIDIuIHVzYjogZHdjMjogQWRkIGZs
YWcgYW5kIGRlYnVnIG1lc3NhZ2VzIGZvciBQYXJ0aWFsIFBvd2VyIERvd24gbW9kZS4NCj4gCS0g
VGhlIGNoYW5nZXMgb2YgdGhpcyBwYXRjaCBhcmUgbW92ZWQgdG8gdGhlICJ1c2I6IGR3YzI6IEZp
eC91cGRhdGUNCj4gCWVudGVyL2V4aXQgcGFydGlhbCBwb3dlciBkb3duLiIgcGF0Y2guDQo+IA0K
PiANCj4gQXJ0dXIgUGV0cm9zeWFuICgxNSk6DQo+ICAgIHVzYjogZHdjMjogRml4L3VwZGF0ZSBl
bnRlci9leGl0IHBhcnRpYWwgcG93ZXIgZG93bi4NCj4gICAgdXNiOiBkd2MyOiBBZGQgc3VwcG9y
dCBmb3IgZHdjMiBob3N0L2RldmljZSBjbG9jayBnYXRpbmcuDQo+ICAgIHVzYjogZHdjMjogRml4
IHdha2V1cCBkZXRlY3RlZCBhbmQgc2Vzc2lvbiByZXF1ZXN0IGludGVycnVwdCBoYW5kbGVycy4N
Cj4gICAgdXNiOiBkd2MyOiBGaXggc3VzcGVuZCBzdGF0ZSBpbiBob3N0IG1vZGUgZm9yIHBhcnRp
YWwgcG93ZXIgZG93bi4NCj4gICAgdXNiOiBkd2MyOiBBZGQgcGFydC4gcG93ZXIgZG93biBleGl0
IGZyb20NCj4gICAgICBkd2MyX2Nvbm5faWRfc3RhdHVzX2NoYW5nZSgpLg0KPiAgICB1c2I6IGR3
YzI6IFJlc2V0IERFVkFERFIgYWZ0ZXIgZXhpdGluZyBnYWRnZXQgaGliZXJuYXRpb24uDQo+ICAg
IHVzYjogZHdjMjogQWRkIGRlZmF1bHQgcGFyYW0gdG8gY29udHJvbCBwb3dlciBvcHRpbWl6YXRp
b24uDQo+ICAgIHVzYjogZHdjMjogVXBkYXRlIGR3YzJfaGFuZGxlX3VzYl9zdXNwZW5kX2ludHIg
ZnVuY3Rpb24uDQo+ICAgIHVzYjogZHdjMjogRml4IGhpYmVybmF0aW9uIGJldHdlZW4gaG9zdCBh
bmQgZGV2aWNlIG1vZGVzLg0KPiAgICB1c2I6IGR3YzI6IEZpeCBIUFJUMC5QcnRTdXNwIGJpdCBz
ZXR0aW5nIGZvciBIaUtleSA5NjAgYm9hcmQuDQo+ICAgIHVzYjogZHdjMjogQWxsb3cgZXhpdGlu
ZyBoaWJlcm5hdGlvbiBmcm9tIGdwd3JkbiByc3QgZGV0ZWN0DQo+ICAgIHVzYjogZHdjMjogQ2xl
YXIgZmlmb19tYXAgd2hlbiByZXNldHRpbmcgY29yZS4NCj4gICAgdXNiOiBkd2MyOiBDbGVhciBH
SU5UU1RTX1JFU1RPUkVET05FIGJpdCBhZnRlciByZXN0b3JlIGlzIGdlbmVyYXRlZC4NCj4gICAg
dXNiOiBkd2MyOiBBZGQgcG93ZXIgc2F2aW5nIG1vZGUgc3VwcG9ydCBmcm9tIHN5c3RlbSBpc3N1
ZWQNCj4gICAgICBzdXNwZW5kL3Jlc3VtZQ0KPiAgICB1c2I6IGR3YzI6IEFkZCBleGl0IHBvd2Vy
IHNhdmluZyBtb2RlIGJlZm9yZSByZW1vdmluZyBkcml2ZXINCj4gDQo+ICAgZHJpdmVycy91c2Iv
ZHdjMi9jb3JlLmMgICAgICB8IDEyNSArKy0tLS0tLQ0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvY29y
ZS5oICAgICAgfCAgNDYgKystDQo+ICAgZHJpdmVycy91c2IvZHdjMi9jb3JlX2ludHIuYyB8IDI4
NCArKysrKysrKysrLS0tLS0tLQ0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvZGVidWdmcy5jICAgfCAg
IDIgKw0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgICAgfCAyMjMgKysrKysrKysrKysr
LQ0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvaGNkLmMgICAgICAgfCA1ODkgKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0NCj4gICBkcml2ZXJzL3VzYi9kd2MyL2h3LmggICAgICAgIHwg
ICAxICsNCj4gICBkcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jICAgIHwgIDE3ICstDQo+ICAgZHJp
dmVycy91c2IvZHdjMi9wbGF0Zm9ybS5jICB8ICA0NCArKy0NCj4gICA5IGZpbGVzIGNoYW5nZWQs
IDk2MCBpbnNlcnRpb25zKCspLCAzNzEgZGVsZXRpb25zKC0pDQo+IA0KQWNrZWQtYnk6IE1pbmFz
IEhhcnV0eXVueWFuIDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5vcHN5cy5jb20+DQoNCg==
