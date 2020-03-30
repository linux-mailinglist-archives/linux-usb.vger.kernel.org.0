Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41D09197133
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 02:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbgC3ATe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 20:19:34 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54242 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726403AbgC3ATe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 20:19:34 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6A06A43B14;
        Mon, 30 Mar 2020 00:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585527573; bh=PBd0O6afEFBze6CButQGIrtZpeoQYCslMuvAli1oNbE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YCu4FxrXb17WNW5w/AOWkpWPu6/S1aEXSinqNxhJvIfLAAIUmB/z4bf62StkzanQP
         w8HhaXhR8TsgA4v8WxXLZEGRQYrjkEfHOy+YKXwapat/TVoNkVhqBDCcTPI12uCCha
         Qo724C/8iW5aR3SvsEt38ydBZ8z0oAFyMTAdXhJnoiok0F9MUUxdcbJ5V8I+zY8igp
         OBzCmR6HAglbQP1p444LAaGa1ZinKzoeC6yP/6/JhBCGVxwm8SDCmUOaAiFFKBdE9p
         zsOTrIjpO+LZht1sSt5GV/X527ezZ8rEzq3tUgmHKQDR+USZzpwWRm+Jfvanp+BnM8
         cis73qz1dNQkA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 318DDA007F;
        Mon, 30 Mar 2020 00:19:33 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 29 Mar 2020 17:19:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 29 Mar 2020 17:19:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXJtOtIofDxx1AV97z1GeNKPuHHe5W/l9X1ttieVz2ihybptI+LwH9LeeP6CAhQ3mpNrCcLpVWplNINn2L0YaOMOyfMbC0IYxzk/g2yyaUzHY1DsorWyOegTewYEJzmJec8/d/sqj9AiapT2v4Qzc2m16iWbYVPzp6+RUI5r+L57k/sXaatUYq8prNVt5XlJcssmO2zlHdEtvtCdAiMkpJo6RYDeaVr+Lq9XgcngXLN1EnOXozru54AurrAHmvW/dM8g8kAgo0Da+TNTW/VfvvSSmWnzWCBPS0Sq991X8JDiM7O8z+FR9fzhJ7BRUbihC0h8XgBQfWmrYCzLUxS6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBd0O6afEFBze6CButQGIrtZpeoQYCslMuvAli1oNbE=;
 b=UTzk8RdOTIQYG3R48HQOeVyIBlLLTZ9HQNwh6REfyeRxszNgmlCJikaDiFZOKfBF19iQZcrROVvD/OoRUkmdyxn1/4Siz++DWliO6bU+0ybLmBxyOUhxwJqTpHldYHonQyQYRen06AlAEYM3oR21qrWpdzBOyK1Zai+MPUV/GKi8H5n07rhgMjqbxyEeiWXtXImfYXClI6y3ZxHi6bN4Vs5NscS3N1desyM94qR24h5DLnzwH3Umjh4DCLQhp21GViK5JkiKh8sNvJoZDJSpb/DEcpkIoHrJWyZvRi0blwDnReJsFvyU+YMj5DqaLdv5miSjrMByM0aPOUqwSRrhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBd0O6afEFBze6CButQGIrtZpeoQYCslMuvAli1oNbE=;
 b=XS+PzoJ/lKWj3vi5cCMZxO66e4jBNwgjbN8mYwPCW7S5Uc4IG87BmfIEshoVbJwn7b9BVUhcAmrLtnAK1oQR08jdavwRA1sG89bW1yUupi5wpKJ6ZeDJ3eqr1tIsb20Tj451vdfrU2ued1R9Bvife9COsPVjGVUCr3O8iaZZRJc=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3335.namprd12.prod.outlook.com (2603:10b6:a03:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Mon, 30 Mar
 2020 00:19:31 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 00:19:31 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 2/2] usb: dwc3: gadget: Properly set maxpacket
 limit
Thread-Topic: [RESEND PATCH v2 2/2] usb: dwc3: gadget: Properly set maxpacket
 limit
Thread-Index: AQHWBiji9+lkpyJqAUSBA+SPoyybbg==
Date:   Mon, 30 Mar 2020 00:19:31 +0000
Message-ID: <92f81414-0d0c-d28b-843c-742db1034fbb@synopsys.com>
References: <cover.1576030839.git.thinhn@synopsys.com>
 <7817e1cfdd341a957c4be94ddf3843ae83516f5a.1576030839.git.thinhn@synopsys.com>
In-Reply-To: <7817e1cfdd341a957c4be94ddf3843ae83516f5a.1576030839.git.thinhn@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce79a192-10a0-4014-6b23-08d7d44004ac
x-ms-traffictypediagnostic: BYAPR12MB3335:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB33358D001AD0326ADBBA5706AACB0@BYAPR12MB3335.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2710.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(136003)(396003)(366004)(346002)(376002)(39850400004)(2616005)(64756008)(66446008)(66946007)(66556008)(66476007)(5660300002)(76116006)(31686004)(8936002)(81156014)(81166006)(8676002)(36756003)(2906002)(478600001)(54906003)(186003)(31696002)(26005)(316002)(6506007)(6916009)(71200400001)(4326008)(6512007)(6486002)(86362001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: btSITOurp8pDWJq8PYaJ99woMPybGMVp5H8jfeuuVHVd0JVMyiHyAcybeJo918appbDReRIPcBooqtFQ1yVFgG00OAlyxHLmeiFaNmxtTuopeD5F2+qR4/Z/9wUUxRcj2Q7fZlqv5tCHCFw/f4u4FI2oXNup/TwC+nvrmyvTX+S4XYXow2AhSS/bjoj5rAqJOzaRiAKux0+xcZp5vpdcwejxmk1rdratWpu9QOBug6By9Fo/ilk9o9GvSFnLEhcqU38SYG9j26AlOkPYMAesDtmIEMHWj36xOTHRApu9e8Bbz7Togo1llACrHWU5RuSAsco+DPCqDiyYIdJXeZmR5VCDitSgR03IzXI/HTAM4lxim/MC1pUWWs+ysrtcoPdhJMvXXaqMYeyVT/RmnYVagtjLaWuuJbOTFL+N4O9sLF5nlt0jKzrZT4t/QHGpj70H
x-ms-exchange-antispam-messagedata: FSzyVrwJvpjZcM2ZbSDmGvYcAXcp7MpSegqpOKoh2AADLel+1KKhid/KlxIzaGSHV8hq4B1s/tAX037y/d9jEF/ce6IOt0HemVwghjutvynaZ2M7ldECXA6qLWScdqV9YPHlvjV51c3BR3oe2SyVRg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BE729C007A98C48B49CA6BCCBE8A82F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ce79a192-10a0-4014-6b23-08d7d44004ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 00:19:31.6479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rLU+d/SVuKulX3HYMKdO8ADkFcojtbHOsozFGrEUoe10WBn6BoyKBaxzFnw47CDBFoBQlwzHLqEJ1LDwXttdYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3335
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNClRoaW5oIE5ndXllbiB3cm90ZToNCj4gQ3VycmVudGx5IHRoZSBjYWxjdWxhdGlvbiBv
ZiBtYXggcGFja2V0IHNpemUgbGltaXQgZm9yIElOIGVuZHBvaW50cyBpcw0KPiB0b28gcmVzdHJp
Y3RpdmUuIFRoaXMgcHJldmVudHMgYSBtYXRjaGluZyBvZiBhIGNhcGFibGUgaGFyZHdhcmUgZW5k
cG9pbnQNCj4gZHVyaW5nIGNvbmZpZ3VyYXRpb24uIEJlbG93IGlzIHRoZSBtaW5pbXVtIHJlY29t
bWVuZGVkIEhXIGNvbmZpZ3VyYXRpb24NCj4gdG8gc3VwcG9ydCBhIHBhcnRpY3VsYXIgZW5kcG9p
bnQgc2V0dXAgZnJvbSB0aGUgZGF0YWJvb2s6DQo+DQo+IEZvciBPVVQgZW5kcG9pbnRzLCB0aGUg
ZGF0YWJvb2sgcmVjb21tZW5kZWQgdGhlIG1pbmltdW0gUnhGSUZPIHNpemUgdG8NCj4gYmUgYXQg
bGVhc3QgM3ggTWF4UGFja2V0U2l6ZSArIDN4IHNldHVwIHBhY2tldHMgc2l6ZSAoOCBieXRlcyBl
YWNoKSArDQo+IGNsb2NrIGNyb3NzaW5nIG1hcmdpbiAoMTYgYnl0ZXMpLg0KPg0KPiBGb3IgSU4g
ZW5kcG9pbnRzLCB0aGUgZGF0YWJvb2sgcmVjb21tZW5kZWQgdGhlIG1pbmltdW0gVHhGSUZPIHNp
emUgdG8gYmUNCj4gYXQgbGVhc3QgM3ggTWF4UGFja2V0U2l6ZSBmb3IgZW5kcG9pbnRzIHRoYXQg
c3VwcG9ydCBidXJzdC4gSWYgdGhlDQo+IGVuZHBvaW50IGRvZXNuJ3Qgc3VwcG9ydCBidXJzdCBv
ciB3aGVuIHRoZSBkZXZpY2UgaXMgb3BlcmF0aW5nIGluIFVTQg0KPiAyLjAgbW9kZSwgYSBtaW5p
bXVtIFR4RklGTyBzaXplIG9mIDJ4IE1heFBhY2tldFNpemUgaXMgcmVjb21tZW5kZWQuDQo+DQo+
IEJhc2Ugb24gdGhlc2UgcmVjb21tZW5kYXRpb25zLCB3ZSBjYW4gY2FsY3VsYXRlIHRoZSBNYXhQ
YWNrZXRTaXplIGxpbWl0DQo+IG9mIGVhY2ggZW5kcG9pbnQuIFRoaXMgcGF0Y2ggcmV2aXNlcyB0
aGUgSU4gZW5kcG9pbnQgTWF4UGFja2V0U2l6ZSBsaW1pdA0KPiBhbmQgYWxzbyBzZXRzIHRoZSBN
YXhQYWNrZXRTaXplIGxpbWl0IGZvciBPVVQgZW5kcG9pbnRzLg0KPg0KPiBSZWZlcmVuY2U6IERh
dGFib29rIDMuMzBhIHNlY3Rpb24gMy4yLjIgYW5kIDMuMi4zDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4g
djIgLQ0KPiAgICBOb25lDQo+DQo+ICAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICB8ICA0ICsr
KysNCj4gICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgNTIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQ1IGlu
c2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCA2YTZiYWFk
Y2I2OTcuLjBmMDE5ZGI1ZTEyNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTMwOSw2ICszMDksMTAg
QEANCj4gICAjZGVmaW5lIERXQzNfR1RYRklGT1NJWl9UWEZERVAobikJKChuKSAmIDB4ZmZmZikN
Cj4gICAjZGVmaW5lIERXQzNfR1RYRklGT1NJWl9UWEZTVEFERFIobikJKChuKSAmIDB4ZmZmZjAw
MDApDQo+ICAgDQo+ICsvKiBHbG9iYWwgUlggRmlmbyBTaXplIFJlZ2lzdGVyICovDQo+ICsjZGVm
aW5lIERXQzMxX0dSWEZJRk9TSVpfUlhGREVQKG4pCSgobikgJiAweDdmZmYpCS8qIERXQ191c2Iz
MSBvbmx5ICovDQo+ICsjZGVmaW5lIERXQzNfR1JYRklGT1NJWl9SWEZERVAobikJKChuKSAmIDB4
ZmZmZikNCj4gKw0KPiAgIC8qIEdsb2JhbCBFdmVudCBTaXplIFJlZ2lzdGVycyAqLw0KPiAgICNk
ZWZpbmUgRFdDM19HRVZOVFNJWl9JTlRNQVNLCQlCSVQoMzEpDQo+ICAgI2RlZmluZSBEV0MzX0dF
Vk5UU0laX1NJWkUobikJCSgobikgJiAweGZmZmYpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBpbmRleCA1ZGEy
NjYxNzMxNDYuLjNiM2U2YTY1NWM2YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IEBAIC0yMjA3LDcg
KzIyMDcsNiBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2luaXRfaW5fZW5kcG9pbnQoc3RydWN0
IGR3YzNfZXAgKmRlcCkNCj4gICB7DQo+ICAgCXN0cnVjdCBkd2MzICpkd2MgPSBkZXAtPmR3YzsN
Cj4gICAJaW50IG1kd2lkdGg7DQo+IC0JaW50IGtieXRlczsNCj4gICAJaW50IHNpemU7DQo+ICAg
DQo+ICAgCW1kd2lkdGggPSBEV0MzX01EV0lEVEgoZHdjLT5od3BhcmFtcy5od3BhcmFtczApOw0K
PiBAQCAtMjIyMywxNyArMjIyMiwxNyBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2luaXRfaW5f
ZW5kcG9pbnQoc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4gICAJLyogRklGTyBEZXB0aCBpcyBpbiBN
RFdESVRIIGJ5dGVzLiBNdWx0aXBseSAqLw0KPiAgIAlzaXplICo9IG1kd2lkdGg7DQo+ICAgDQo+
IC0Ja2J5dGVzID0gc2l6ZSAvIDEwMjQ7DQo+IC0JaWYgKGtieXRlcyA9PSAwKQ0KPiAtCQlrYnl0
ZXMgPSAxOw0KPiAtDQo+ICAgCS8qDQo+IC0JICogRklGTyBzaXplcyBhY2NvdW50IGFuIGV4dHJh
IE1EV0lEVEggKiAoa2J5dGVzICsgMSkgYnl0ZXMgZm9yDQo+IC0JICogaW50ZXJuYWwgb3Zlcmhl
YWQuIFdlIGRvbid0IHJlYWxseSBrbm93IGhvdyB0aGVzZSBhcmUgdXNlZCwNCj4gLQkgKiBidXQg
ZG9jdW1lbnRhdGlvbiBzYXkgaXQgZXhpc3RzLg0KPiArCSAqIFRvIG1lZXQgcGVyZm9ybWFuY2Ug
cmVxdWlyZW1lbnQsIGEgbWluaW11bSBUeEZJRk8gc2l6ZSBvZiAzeA0KPiArCSAqIE1heFBhY2tl
dFNpemUgaXMgcmVjb21tZW5kZWQgZm9yIGVuZHBvaW50cyB0aGF0IHN1cHBvcnQgYnVyc3QgYW5k
IGENCj4gKwkgKiBtaW5pbXVtIFR4RklGTyBzaXplIG9mIDJ4IE1heFBhY2tldFNpemUgZm9yIGVu
ZHBvaW50cyB0aGF0IGRvbid0DQo+ICsJICogc3VwcG9ydCBidXJzdC4gVXNlIHRob3NlIG51bWJl
cnMgYW5kIHdlIGNhbiBjYWxjdWxhdGUgdGhlIG1heCBwYWNrZXQNCj4gKwkgKiBsaW1pdCBhcyBi
ZWxvdy4NCj4gICAJICovDQo+IC0Jc2l6ZSAtPSBtZHdpZHRoICogKGtieXRlcyArIDEpOw0KPiAt
CXNpemUgLz0ga2J5dGVzOw0KPiArCWlmIChkd2MtPm1heGltdW1fc3BlZWQgPj0gVVNCX1NQRUVE
X1NVUEVSKQ0KPiArCQlzaXplIC89IDM7DQo+ICsJZWxzZQ0KPiArCQlzaXplIC89IDI7DQo+ICAg
DQo+ICAgCXVzYl9lcF9zZXRfbWF4cGFja2V0X2xpbWl0KCZkZXAtPmVuZHBvaW50LCBzaXplKTsN
Cj4gICANCj4gQEAgLTIyNTEsOCArMjI1MCwzOSBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2lu
aXRfaW5fZW5kcG9pbnQoc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4gICBzdGF0aWMgaW50IGR3YzNf
Z2FkZ2V0X2luaXRfb3V0X2VuZHBvaW50KHN0cnVjdCBkd2MzX2VwICpkZXApDQo+ICAgew0KPiAg
IAlzdHJ1Y3QgZHdjMyAqZHdjID0gZGVwLT5kd2M7DQo+ICsJaW50IG1kd2lkdGg7DQo+ICsJaW50
IHNpemU7DQo+ICsNCj4gKwltZHdpZHRoID0gRFdDM19NRFdJRFRIKGR3Yy0+aHdwYXJhbXMuaHdw
YXJhbXMwKTsNCj4gKw0KPiArCS8qIE1EV0lEVEggaXMgcmVwcmVzZW50ZWQgaW4gYml0cywgY29u
dmVydCB0byBieXRlcyAqLw0KPiArCW1kd2lkdGggLz0gODsNCj4gICANCj4gLQl1c2JfZXBfc2V0
X21heHBhY2tldF9saW1pdCgmZGVwLT5lbmRwb2ludCwgMTAyNCk7DQo+ICsJLyogQWxsIE9VVCBl
bmRwb2ludHMgc2hhcmUgYSBzaW5nbGUgUnhGSUZPIHNwYWNlICovDQo+ICsJc2l6ZSA9IGR3YzNf
cmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dSWEZJRk9TSVooMCkpOw0KPiArCWlmIChkd2MzX2lzX3Vz
YjMxKGR3YykpDQo+ICsJCXNpemUgPSBEV0MzMV9HUlhGSUZPU0laX1JYRkRFUChzaXplKTsNCj4g
KwllbHNlDQo+ICsJCXNpemUgPSBEV0MzX0dSWEZJRk9TSVpfUlhGREVQKHNpemUpOw0KPiArDQo+
ICsJLyogRklGTyBkZXB0aCBpcyBpbiBNRFdESVRIIGJ5dGVzICovDQo+ICsJc2l6ZSAqPSBtZHdp
ZHRoOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBUbyBtZWV0IHBlcmZvcm1hbmNlIHJlcXVpcmVtZW50
LCBhIG1pbmltdW0gcmVjb21tZW5kZWQgUnhGSUZPIHNpemUNCj4gKwkgKiBpcyBkZWZpbmVkIGFz
IGZvbGxvdzoNCj4gKwkgKiBSeEZJRk8gc2l6ZSA+PSAoMyB4IE1heFBhY2tldFNpemUpICsNCj4g
KwkgKiAoMyB4IDggYnl0ZXMgc2V0dXAgcGFja2V0cyBzaXplKSArICgxNiBieXRlcyBjbG9jayBj
cm9zc2luZyBtYXJnaW4pDQo+ICsJICoNCj4gKwkgKiBUaGVuIGNhbGN1bGF0ZSB0aGUgbWF4IHBh
Y2tldCBsaW1pdCBhcyBiZWxvdy4NCj4gKwkgKi8NCj4gKwlzaXplIC09ICgzICogOCkgKyAxNjsN
Cj4gKwlpZiAoc2l6ZSA8IDApDQo+ICsJCXNpemUgPSAwOw0KPiArCWVsc2UNCj4gKwkJc2l6ZSAv
PSAzOw0KPiArDQo+ICsJdXNiX2VwX3NldF9tYXhwYWNrZXRfbGltaXQoJmRlcC0+ZW5kcG9pbnQs
IHNpemUpOw0KPiAgIAlkZXAtPmVuZHBvaW50Lm1heF9zdHJlYW1zID0gMTU7DQo+ICAgCWRlcC0+
ZW5kcG9pbnQub3BzID0gJmR3YzNfZ2FkZ2V0X2VwX29wczsNCj4gICAJbGlzdF9hZGRfdGFpbCgm
ZGVwLT5lbmRwb2ludC5lcF9saXN0LA0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlc2UgcGF0
Y2hlcyBhcmUgbm90IGNsZWFyIG9yIHRoYXQgdGhleSBhcmUgbG9zdCANCnNvbWV3aGVyZS4gSSds
bCB0cnkgbXkgYmVzdCB0byBjbGFyaWZ5IGlmIGFueXRoaW5nJ3Mgbm90IGNsZWFyLg0KDQpUaGFu
a3MsDQpUaGluaA0KDQo=
