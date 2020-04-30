Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3513C1BEF73
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 06:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgD3Ezh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 00:55:37 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:48284 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726180AbgD3Ezg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 00:55:36 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 32E464069B;
        Thu, 30 Apr 2020 04:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588222536; bh=u+KoLfplVO8TkdJdOdhkYMJsAC/eQQlBpPNOVNeARxs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=GBw9SLbRRne5l2kBubWyhtS9Bq6ur5dhguNVTx7Bb06/C0NVtjGKlO8J7BCkxmyR/
         Lfi/tjCBHnXI7CTBNIHd+MM7qsW2JT+3DoIhLHD5XTt6LpoIsutj2Nyrw0bz5Mhy6M
         9drUGSvbvZ5A7kNMqV9W3dX7vUK3pGs5evje9b4ogZ85tAOfqy7Q/SldTXbL/t830J
         A/kDB7j+RM8a2PhVVYEJf87gAgmNyj3K+YnKV6B7mrYjZqz0NTUzfQ6S/zyss6Zpqy
         JX8VSN0k+sYHbhz7+BPGVwGm5UmoJzO9iDq5I4XVjS1cYd1QiTFiodZgicWvwBIGRx
         BUSRH0J1tzgIw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8B339A008E;
        Thu, 30 Apr 2020 04:55:35 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 29 Apr 2020 21:54:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 29 Apr 2020 21:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao7SzvopmiIfh4vuVNDa/3fUaaWu+tAfG6lSbagQufUfbVdi13uw491ZsFcCXPevbyTNyYHuihDLeus2YSqT3ViBxjRRiii14bU5g4+aylFIF5FeISyHEeP7l4qUOWTq0jZnZhucozXYiNgsLhnkdgGo7HJeqBSyURoJyLIRpkqiyWYsmu5jYDswCSzGZwftd0OH73dLiER1UkqrEtcSqvVzX3W5SIrxi9YAKUiFXIToGOXufNEZbLQhTzWD7VUybxfV7t93LIfHD93VU1nUsSkq/Xw8rH/9nHm1XI9zmG6U0FVQAJLmCnVophCQbhEWHUsfcyprVhjBBRWxI2qbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+KoLfplVO8TkdJdOdhkYMJsAC/eQQlBpPNOVNeARxs=;
 b=C4KKlyC7BxkPOX9S7J0eRYoT9Bpw/6PyWrprq0bgKvY7fIKxJwkbQQrsBizhTEnYGGWK0P3ZSqhOIWLQ7RZ6ulxz0nECUD6YdfSYgMquBz3tOnTceq2lXr4Jcjft5CLFRzGV4VrFcFxt6kEQGDeAXPQ0ZxjF439cg75OKxvbEDki8sIrOHUj75k4KeW8qI4ghhllLXE9hJ+NwdA7DKUWoyE423RlzkCRX4+eFDm3HGZAMHx93L8DZcMlk23xu25NQJBboh3VxZKJsuIvW90MDgVK+p/N+yNbdyTVX88IasBM9si/gVj/1g4q7FVeQaKMN99sx6A5+mGa31XSna3nKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+KoLfplVO8TkdJdOdhkYMJsAC/eQQlBpPNOVNeARxs=;
 b=UHeRuboIRAI6firNB+FacvcX6ofJwLcZoDB30EnC3BHHLMRYOgtQlMlBLopcvCkrhezR535HtjIIXcWofysJkGOwhQGfVsahb8M1d/pcyfYP+PwuoDQJUVZXUaUncV2wg4HW9zSfRadYzBL9fyg6cShO9lbE70Nqay1BhWGiMZw=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB2597.namprd12.prod.outlook.com (2603:10b6:a03:6e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 04:54:27 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248%7]) with mapi id 15.20.2937.028; Thu, 30 Apr 2020
 04:54:27 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Peter Chen <peter.chen@nxp.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Topic: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Index: AQHWHOMiP7xQ0M6cVEqSUTmaHa412aiPbxIAgAFsnwCAADGbgIAAD8YA
Date:   Thu, 30 Apr 2020 04:54:27 +0000
Message-ID: <1f366918-1544-7013-6340-2a186791b803@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com>
 <456f864b86a72ab9490ce095d5ba3f59b39d6a09.1588025916.git.thinhn@synopsys.com>
 <20200429031549.GB20222@b29397-desktop>
 <6c13582a-476e-a217-32ca-482dd78793b6@synopsys.com>
 <AM7PR04MB71572516EE7BEEF30FA209448BAA0@AM7PR04MB7157.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB71572516EE7BEEF30FA209448BAA0@AM7PR04MB7157.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5b4dbce-2893-46bd-31c6-08d7ecc28fa0
x-ms-traffictypediagnostic: BYAPR12MB2597:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2597D5F98330BD0ED205BA9CAAAA0@BYAPR12MB2597.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0389EDA07F
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(39860400002)(346002)(366004)(396003)(4326008)(2616005)(31686004)(107886003)(53546011)(66556008)(6506007)(66476007)(6512007)(66946007)(26005)(186003)(66446008)(76116006)(64756008)(110136005)(54906003)(2906002)(478600001)(6486002)(5660300002)(71200400001)(316002)(8936002)(8676002)(36756003)(31696002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WJxDsZNFyhIi69IfNWgntrg8JQsDk27v+pMkPO4Feg0/whGoMQdqFj+NO/yI72KwEvK9qyIcSqwnUatjJQKbpyXk4PEpWf8/WHeGauFd+l0XOxXk5+0QDbMhVtSWb/Ol32s3MkcMADEoc+sIyYjiMgbVrTrFeRzgTFsoQTC9iZ/pi4+fw+waMfN95RJAiWYrVUALS13LoLdsvPdTr1gNHe+W/uvBSm4Kq5wATt/pp+XEIlLFSCcdfBYNxZMi3R/2YmLp8oDFwZSdAgC9xTqqnNDzWSCMZArdDbHea9xff1uXWmDSmTg4gudzChgOaV3+ifR/moNIOgrfK3V+hlIWtvD5L4FqiJANkK/PZc8MRUWrSXlfBaucPb2HUPqAW4GvBJmtRzMRikU82lNxXN4DMpUi5dfGhHF7z1Z8MM+y+1CmvSZutkg1/i9vF8QFuGrk
x-ms-exchange-antispam-messagedata: d6HKHZNhnDQ3VD7CVVxsJhYOMkb1zbS7xADdlBF6+TF3GPXrfHcrF8+anIzGggDrIP9dARqMBoKIh4GzknyoU6A0F6ZrxLMvW7icRPIrwcebgtnvnRZq1dJ9Jwb5ylZS1eEbcAdCvwmgSE1aKFH5kQ8vsZF8L6L925tOwv3JJhpIJTa9xWAEt7I3RLiNXCjffm3rGBy4MCaxBtE/NAcsNbNev1wSAtxLRMDEy16huzeuUdS0DG4cTSTiPCmw57qeSyyMrpYdxGgNsTCgJwo9PAm6xnA+AdfhNEY3ZU6LEdzMnvSnCU4WnuSFfCP6cr/IfOcudidg6iU2+oXcwEjqPz7TthUvt+cx/W1qj1+cn7MlwyNOsuJODz30OxSYRypt7vHGk9SIaa/6dQKgR8zgTsZgZejpY5PIqnHXPIerzERCEnMhqlrep512ijVes+LvA2ss2cLSR/RbudhcvTXkHKJ/De+n8KGwuKkYODA5qPEDbzpYNKwyC+mOpcozgOjNUraoAleAXZKgSFQElthOTppOtGEhRkXvwxXIDuZ0KM+h9lPA/w9ph6I0p+kZm1jYV/CtwgRSwPyDTUMLV4WCMLnMQRwhpZFFSTTU4l94Q+YvzW/CcTxMiT3ZxeMQDef38fjtmtZ3+Wwi8+nAKjlKahhNRWjn1weC7XdfQsFpZDn0bJONGc3TfgXTCWCmUwSwQpAT3l2js/bN8jjtvXQz+iyGqfbQzdCto8i8NZUqFPq13lgPh2Ic/PKD2I974vyltWP2GmD1U83T/POxKYbcgqTIrYjOr0LBppdW1PJ/Ueg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CEE3F70D23F3846932B018C92874DBF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b4dbce-2893-46bd-31c6-08d7ecc28fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 04:54:27.2536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hpk4eKeZBFs4AhouuRIZvXHloq5jQEgc9ULB/dBgnAaylZ01Z1CQj8PQKI+Raf6hUbVnmu9vnrJG8p8lHOpWpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2597
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UGV0ZXIgQ2hlbiB3cm90ZToNCj4gICANCj4+PiBPbiAyMC0wNC0yNyAxNToyNzo0MSwgVGhpbmgg
Tmd1eWVuIHdyb3RlOg0KPj4+PiBBIHRyYW5zZmVyIGlzIGNvbXBvc2VkIG9mIG9uZSBvciBtb3Jl
IHVzYl9yZXF1ZXN0cy4gQ3VycmVudGx5LCBvbmx5DQo+Pj4+IHRoZSBmdW5jdGlvbiBkcml2ZXIg
a25vd3MgdGhpcyBiYXNlZCBvbiBpdHMgaW1wbGVtZW50YXRpb24gYW5kIGl0cw0KPj4+PiBjbGFz
cyBwcm90b2NvbC4gSG93ZXZlciwgc29tZSB1c2IgY29udHJvbGxlcnMgbmVlZCB0byBrbm93IHRo
aXMgdG8NCj4+Pj4gdXBkYXRlIGl0cyByZXNvdXJjZXMuIEZvciBleGFtcGxlLCB0aGUgRFdDMyBj
b250cm9sbGVyIG5lZWRzIHRoaXMNCj4+Pj4gaW5mbyB0byB1cGRhdGUgaXRzIGludGVybmFsIHJl
c291cmNlcyBhbmQgaW5pdGlhdGUgZGlmZmVyZW50IHN0cmVhbXMuDQo+Pj4+DQo+Pj4+IEludHJv
ZHVjZSBhIG5ldyBmaWVsZCBpc19sYXN0IHRvIHVzYl9yZXF1ZXN0IHRvIGluZm9ybSB0aGUgY29u
dHJvbGxlcg0KPj4+PiBkcml2ZXIgd2hldGhlciB0aGUgcmVxdWVzdCBpcyB0aGUgbGFzdCBvZiBp
dHMgdHJhbnNmZXIuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhp
bmhuQHN5bm9wc3lzLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGluY2x1ZGUvbGludXgvdXNiL2dh
ZGdldC5oIHwgMiArKw0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+
Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaCBiL2luY2x1
ZGUvbGludXgvdXNiL2dhZGdldC5oDQo+Pj4+IGluZGV4IGU5NTljMDlhOTdjOS4uNzQyYzUyZjdl
NDcwIDEwMDY0NA0KPj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaA0KPj4+PiAr
KysgYi9pbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaA0KPj4+PiBAQCAtNTAsNiArNTAsNyBAQCBz
dHJ1Y3QgdXNiX2VwOw0KPj4+PiAgICAgKiBAc2hvcnRfbm90X29rOiBXaGVuIHJlYWRpbmcgZGF0
YSwgbWFrZXMgc2hvcnQgcGFja2V0cyBiZQ0KPj4+PiAgICAgKiAgICAgdHJlYXRlZCBhcyBlcnJv
cnMgKHF1ZXVlIHN0b3BzIGFkdmFuY2luZyB0aWxsIGNsZWFudXApLg0KPj4+PiAgICAgKiBAZG1h
X21hcHBlZDogSW5kaWNhdGVzIGlmIHJlcXVlc3QgaGFzIGJlZW4gbWFwcGVkIHRvIERNQQ0KPj4+
PiAoaW50ZXJuYWwpDQo+Pj4+ICsgKiBAaXNfbGFzdDogSW5kaWNhdGVzIGlmIHRoaXMgcmVxdWVz
dCBpcyB0aGUgbGFzdCBvZiBhIHRyYW5zZmVyLg0KPj4+IFdvdWxkIHlvdSBwbGVhc2UgZGVzY3Jp
YmUgdGhlIHVzZSBjYXNlIGZvciBpdCwgYW5kIHdoYXQncyAndHJhbnNmZXInDQo+Pj4gYW5kICdy
ZXF1ZXN0JyBpbiB5b3VyIHVzZSBjYXNlPw0KPj4+DQo+PiBUaGUgdHJhbnNmZXIgc2l6ZSBpcyBk
ZWZpbmVkIGJ5IGEgY2xhc3MgcHJvdG9jb2wuIFRoZSBmdW5jdGlvbiBkcml2ZXIgd2lsbCBkZXRl
cm1pbmUNCj4+IGhvdyBtYW55IHVzYl9yZXF1ZXN0cyBhcmUgbmVlZGVkIHRvIGZ1bGZpbGwgdGhh
dCB0cmFuc2Zlci4NCj4+DQo+IFRoYW5rcyBmb3IgeW91ciBpbmZvcm1hdGlvbi4NCj4NCj4gSWYg
J3RyYW5zZmVyIHNpemUnIGhlcmUgaXMgc29mdHdhcmUgY29uY2VwdCwgd2h5IGNvbnRyb2xsZXIg
bmVlZHMgdG8ga25vdz8gVGhlIGdlbmVyYWwNCj4gY29udHJvbGxlciBpbnRlcm5hbCBsb2dpYyBk
b2Vzbid0IGNhcmUgY2xhc3MgcHJvdG9jb2wsIGl0IG9ubHkgY2FyZXMgVFJCIGNoYWluIHNvZnR3
YXJlIHByZXBhcmVzLg0KDQpXaGlsZSBzb21lIGNvbnRyb2xsZXJzIGRvbid0IGhhdmUgdGhlIGNv
bmNlcHQgb2YgdGhpcywgRFdDX3VzYjN4IGRvZXMuIA0KSXQgaGFzIGEgbm90aW9uIG9mIHN0YXJ0
aW5nIGFuZCBlbmRpbmcgYSB0cmFuc2Zlci4gV2hpbGUgYSB0cmFuc2ZlciBpcyANCnN0YXJ0ZWQs
IHRoZSBlbmRwb2ludCB1c2VzIGEgcmVzb3VyY2UuIEl0IHJlbGVhc2VzIHRoYXQgcmVzb3VyY2Ug
d2hlbiANCnRoZSB0cmFuc2ZlciBjb21wbGV0ZXMuIFNvIGZhciwgZHdjMyBpbXBsZW1lbnRlZCBp
biBzdWNoIGEgd2F5IHRoYXQgYnVsayANCnRyYW5zZmVycyBhcmUgYWx3YXlzIGluLXByb2dyZXNz
IGFuZCBkb24ndCBjb21wbGV0ZS4gVGhhdCdzIGZpbmUgc28gZmFyLCANCmJ1dCBpdCdzIG5vdCB0
aGUgY2FzZSB3aXRoIHN0cmVhbXMuDQoNCj4NCj4+IEZvciBleGFtcGxlLCBpbiBNU0MsIGEgUkVB
RC9XUklURSBjb21tYW5kIGNhbiByZXF1ZXN0IGZvciBhIHRyYW5zZmVyIHNpemUgdXANCj4+IHRv
ICg1MTIgKiAyXjMxLTEpIGJ5dGVzLiBJdCdkIGJlIHRvbyBsYXJnZSBmb3IgYSBzaW5nbGUgdXNi
X3JlcXVlc3QsIHdoaWNoIGlzIHdoeSB0aGUNCj4+IG1hc3Nfc3RvcmFnZSBmdW5jdGlvbiBkcml2
ZXIgbGltaXRzIGVhY2ggcmVxdWVzdCB0byAxNktCIG1heCBieSBkZWZhdWx0LiBBIE1TQw0KPj4g
Y29tbWFuZCBpdHNlbGYgaXMgYSB0cmFuc2Zlciwgc2FtZSB3aXRoIGl0cyBzdGF0dXMuDQo+Pg0K
Pj4gVGhpcyBpcyBhIHNpbWlsYXIgY2FzZSBmb3IgVUFTUC4gSG93ZXZlciwgdGhlIGZfdGNtIGFu
ZCB0aGUgdGFyZ2V0IGRyaXZlcnMgY3VycmVudA0KPj4gaW1wbGVtZW50YXRpb24gb25seSB1c2Ug
YSBzaW5nbGUgcmVxdWVzdCBwZXIgdHJhbnNmZXIuDQo+PiAoVGhpcyBuZWVkcyB0byBiZSBmaXhl
ZCwgYWxvbmcgd2l0aCBzb21lIG90aGVyIGlzc3VlcyBpbiBmX3RjbSkuDQo+Pg0KPj4gVGhlIHVz
ZSBjYXNlIGhlcmUgaXMgdGhhdCBEV0MzeCBjb250cm9sbGVyIG5lZWRzIHRvIHVwZGF0ZSBpdHMg
cmVzb3VyY2VzDQo+PiB3aGVuZXZlciBhIHRyYW5zZmVyIGlzIGNvbXBsZXRlZC4gVGhpcyBpcyBh
IHJlcXVpcmVtZW50IGZvciBzdHJlYW1zIHdoZW4gaXQgbmVlZHMNCj4+IHRvIGZyZWUgdXAgc29t
ZSByZXNvdXJjZXMgZm9yIGRpZmZlcmVudCBzdHJlYW0gdHJhbnNmZXJzLiBUaGUgZnVuY3Rpb24g
ZHJpdmVyIG11c3QNCj4+IHBhc3MgdGhpcyBpbmZvcm1hdGlvbiB0byB0aGUgY29udHJvbGxlciBk
cml2ZXIgZm9yIHN0cmVhbXMgdG8gd29yayBwcm9wZXJseS4NCj4+DQo+IERvZXMgdGhlIGNvbnRy
b2xsZXIgY2FzZSBhYm91dCBzdHJlYW0gaW5mb3JtYXRpb24gb3IgdGhlIHRyYW5zZmVyIGluZm9y
bWF0aW9uPw0KDQpGb3Igc3RyZWFtcywgZWFjaCBzdHJhbnNmZXIgaGFzIGEgc3RyZWFtIElELCBh
bmQgZWFjaCB0cmFuc2ZlciB1c2VzIGEgDQpyZXNvdXJjZS4NCg0KPg0KPj4gUG90ZW50aWFsbHks
IGFub3RoZXIgdXNlIGNhc2UgZm9yIHRoaXMgaXMgdG8gdXBkYXRlIHRoZSBkb2N1bWVudGF0aW9u
IG9uDQo+PiB1c2JfZGVxdWV1ZV9yZXF1ZXN0KCkuIEJ5IHByb3ZpZGluZyB0aGUgY29uY2VwdCBv
ZiBhIHRyYW5zZmVyLCB3ZSBjYW4gc2F5IHRoYXQNCj4+IGRlcXVldWluZyBhbiBpbi1mbGlnaHQg
cmVxdWVzdCB3aWxsIGNhbmNlbCB0aGUgdHJhbnNmZXIsIGFuZCBhbnkgaW5jb21wbGV0ZSByZXF1
ZXN0DQo+PiB3aXRoaW4gdGhlIHRyYW5zZmVyIG11c3QgYmUgZ2l2ZW4gYmFjayB0byB0aGUgZnVu
Y3Rpb24gZHJpdmVyLiBUaGlzIHdvdWxkIG1ha2UNCj4+IHNlbnNlIGZvciBjb250cm9sbGVycyB0
aGF0IHVzZSBUUkIgcmluZyBidWZmZXIgYW5kIGRlcXVldWUvZW5xdWV1ZSBUUkIgcG9pbnRlcnMu
DQo+PiBCdXQgdGhpcyBpZGVhIHN0aWxsIG5lZWRzIG1vcmUgdGhvdWdodHMuDQo+Pg0KPiAgIA0K
PiBJIHRoaW5rIGNsYXNzIGRyaXZlciBuZWVkcyB0byBjb25zaWRlciB0aGF0LCB0aGUgY29udHJv
bGxlciBkcml2ZXIgb25seSBuZWVkcyB0byBoYW5kbGUNCj4gcmVxdWVzdCBhbmQgcmVsYXRlZCBU
UkJzLg0KDQpJdCBtYXliZSB0cnVlIGZvciBzb21lIGNvbnRyb2xsZXJzLCBidXQgRFdDX3VzYjN4
IG5lZWRzIHRoaXMgaW5mb3JtYXRpb24uDQoNCkJSLA0KVGhpbmgNCg==
