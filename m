Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D32021C98B
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jul 2020 15:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728785AbgGLNpw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jul 2020 09:45:52 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:48044 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728754AbgGLNpv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Jul 2020 09:45:51 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D832C40A60;
        Sun, 12 Jul 2020 13:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594561550; bh=fkLABs6z5lRjv1OC7U80RrDxO136qAEEgsbKJ3Dk7vU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=GW5hMTFLpr6XKsLd2s3FH1SOqEMmVNiB6DNXbN0DpnNXkbkMJ8E6YmClZ1Huk9VOl
         num9sUokHtrWHPTfImq51n+KkdA3VXWeOIuxEEROpvuo/iD9uPrypqI3Kmo1pk9WiI
         OCleG1tF0T8WuTtJIw+G9laaUbB8NBDeb7tSJM9QXaabDb3s17hhx5pZ3ojScbzQn5
         Vgm9QENbA7b+VFKc5P/zZREMoBKUPc1IJT4i6fd2XM7DRsYLhqu8LT1AwqkPggWJns
         KSOPzoRf+rXTkte6CreLiGgG27j1lmz9g4QH6DP+JysDi/iGW7oesadijDnfr691Kl
         J/GYHZXd3IDhg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 527B3A005A;
        Sun, 12 Jul 2020 13:45:50 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 981E14016B;
        Sun, 12 Jul 2020 13:45:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NsOHdyAi";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/KrjidSUkjMWDYReeIlbuBcC+GhvVlRX8xT/lyTwafLCdEdXx4i8SQ3gSoBMjl02DK/qhL3tJnaOxEIMBXhH8Qb6H45G1jkhyVhYC6mdKoj5C7iyeD0vInejT49Xd+kJMIaYECBOrmN2qeKoZm9xUO8PCp+uLs7XhGelUDyflHpe930amQCKDxMydVO0flUXQZ1QjHiD8DHSCVtwCx//Oi9GrLv3rDC+PVH/y3CsN5whq31ZLyS8mqIy6NhauLPExPmp7uJfTnRPx6JQ34HRKC7YRhCk4htRQ0ZwvWCCz2cApOkc25uQYHavuARlpYKlqLEECFSxLJPo8QjSgZ0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkLABs6z5lRjv1OC7U80RrDxO136qAEEgsbKJ3Dk7vU=;
 b=WSW6Hutom1K497PfvpV8c53a0W+CpdYiGuEubFaKC7l/YrX93W971Gz71bm8X/5VsfPVXMd/9fiE4HLAccxgrIVi3RRDRLvETR1rUl+seiXuFz0zlg8oAjnfv1+zR3b3Fo3vZ9W5yy7Swm9kvcxHyw+QilJYZa2H2i8J4pd+HcflMmDljjbnhx7J0OCYKktfNTWnWiles0jY8HSthhb/e/YZ298D47PWnCM8pycfHTOux8/H0yKVv+Sqx0n7eZawTFkAkV3kw7BsD5bFfSqP5SQtyNlf7E/jKeWCA9jA9gyi9mvheA64GGhIzFz+FFwQeaefFG0CahV/GsMW6FitlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkLABs6z5lRjv1OC7U80RrDxO136qAEEgsbKJ3Dk7vU=;
 b=NsOHdyAiLySK1pCZSe4sv9cJsrc8OMPIGp1Ae5tTdLcIZMYwDGJomd0E5RClOX8rUDCu+lIBzhLrbiCCRo3yNXp3VZ/f/6axyXXY95Jz3w9D2AjqeZHT+/QvgguwtMvBGPqmkgiXDw7ud+AB4lDhNESL/tr66CUlv6m+aUClSv0=
Received: from BN8PR12MB3458.namprd12.prod.outlook.com (2603:10b6:408:44::32)
 by BN6PR12MB1201.namprd12.prod.outlook.com (2603:10b6:404:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Sun, 12 Jul
 2020 13:45:47 +0000
Received: from BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6]) by BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6%2]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 13:45:47 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Topic: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Index: AQHWNBPIzVDQozhV20CqjRBnx+8J26j6PmiAgAAa/YCACePvgA==
Date:   Sun, 12 Jul 2020 13:45:47 +0000
Message-ID: <819f3081-45a3-d225-fcb7-516908bd84ec@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com>
 <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com>
 <877dvhqh2e.fsf@kernel.org>
In-Reply-To: <877dvhqh2e.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.193.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98f2802a-2e1b-4d66-0bd0-08d82669e1b3
x-ms-traffictypediagnostic: BN6PR12MB1201:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1201C9CE24A6920FBFC53845A4630@BN6PR12MB1201.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RhP8woVOjo9xl4NaIzs4m4zRwiX81A+N/dn6VJUmDeKcwS0RJSYRT3dclGqfh4p5ZhE1mQEEx96alUSZ6T1AsGuHX1y3MtODlOmHJKpWghZesVWdZkAwlImg3X2LfDLZQHrgSfwhB2RJZ+0Cy2XOBrcxCQlsoH4fJypxx+tefntCzotN0xPFdD3ghWuHQbj15/+adRx7HKqa+SrL8gWqog9FOEIrGWx/VFRmBDAMjC4/4Twpu/stqOtHn1XTFw9ml7USZR7WmzrFnDIP7vh3g7Xu1ioJbbVjRodJyZwzmHy2HK0RG3OrTyahCE+T5+D5xUiQ5FJsMdoKNTROD93HrA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3458.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(346002)(376002)(39850400004)(396003)(91956017)(76116006)(83380400001)(4326008)(66946007)(2616005)(71200400001)(6486002)(110136005)(8676002)(107886003)(8936002)(31686004)(54906003)(186003)(2906002)(53546011)(26005)(5660300002)(86362001)(316002)(31696002)(66556008)(66476007)(66446008)(64756008)(55236004)(6512007)(478600001)(36756003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 1ZliorXqpg9Sr+CWClKpZNHMh0gDcJ4biuCKDOWtCxlP3TOYmttkkTUsUrl2D3caDcWXOEA0ffqFXQIn/5pFgz1cl/3ZMhj9Za8drKdTLcGyvBvxS7TmhwwK3w4zfFIDzJ4NEMCc0lBWBEATg9k3yaf8ddN2TynbLIBPFDjPaPgMwRFrS19hwq5qeZZqc8cVV96AMqgFKJrJTycAslr4iW9BX/H8Uvllxw7UWQyjXFYZJoH3DJYgIFEgf88C/oLS/I655fCIt4bzHaqJPnO3Vd6H9ePgxo5LDSDSD4tC1rf4cs9YptJzWdBrykipyzfT4qF3AN90zykh2KHE4/6GjOU4+w/aA7kIBmJKP1Dy0wnkKt9lJEamxst1vBt0zeOYciw2+oqbT5CEKhkSoagOwohopG/rCKLLlWdiR5o9xVWej/98kbRW8p1Gc2KVbfsq5Cbs8miinGau9rUJUTbBPGYdBfATd5D68OIVZ5YqRKHg7afV7dnB7uoUvzEriWmU
Content-Type: text/plain; charset="utf-8"
Content-ID: <147A690DE83ECF45B15E77B12C556E76@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3458.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f2802a-2e1b-4d66-0bd0-08d82669e1b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2020 13:45:47.0745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vz20U9yijNjabIm/icUmHB6fJ31XnDusBcqCdvNLcnWcFnGIkmPmoefDdixkbKwKK7Rdw7IHOFQfDsO+0Bfqww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1201
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8gUm9iLA0KT24gNy82LzIwMjAgMTI6MTMgUE0sIEZlbGlwZSBCYWxiaSB3cm90ZToNCj4g
DQo+IEhpLA0KPiANCj4gVGVqYXMgSm9nbGVrYXIgPFRlamFzLkpvZ2xla2FyQHN5bm9wc3lzLmNv
bT4gd3JpdGVzOg0KPj4+IEBAIC05NSw2ICs5NSwxMCBAQCBpbnQgZHdjM19ob3N0X2luaXQoc3Ry
dWN0IGR3YzMgKmR3YykNCj4+PiAgCWlmIChkd2MtPnVzYjJfbHBtX2Rpc2FibGUpDQo+Pj4gIAkJ
cHJvcHNbcHJvcF9pZHgrK10gPSBQUk9QRVJUWV9FTlRSWV9CT09MKCJ1c2IyLWxwbS1kaXNhYmxl
Iik7DQo+Pj4gIA0KPj4+ICsJaWYgKGR3Yy0+c2dsX3RyYl9jYWNoZV9zaXplX3F1aXJrKQ0KPj4+
ICsJCXByb3BzW3Byb3BfaWR4KytdID0NCj4+PiArCQkJUFJPUEVSVFlfRU5UUllfQk9PTCgic2ds
LXRyYi1jYWNoZS1zaXplLXF1aXJrIik7DQo+Pj4gKw0KPj4+ICAJLyoqDQo+Pj4gIAkgKiBXT1JL
QVJPVU5EOiBkd2MzIHJldmlzaW9ucyA8PTMuMDBhIGhhdmUgYSBsaW1pdGF0aW9uDQo+Pj4gIAkg
KiB3aGVyZSBQb3J0IERpc2FibGUgY29tbWFuZCBkb2Vzbid0IHdvcmsuDQo+Pj4NCj4+IERvZXMg
dGhpcyBpbXBsZW1lbnRhdGlvbiBsb29rcyBnb29kIHRvIHlvdT8gUm9iIGhhcyBzb21lIGNvbmNl
cm5lZCBvdmVyIHRoZSBEVCBlbnRyaWVzLA0KPj4geW91IHN1Z2dlc3RlZCB1c2luZyBjb21wYXRp
YmxlIHN0cmluZyB3aXRoIHRoaXMgcXVpcmsgYWRkaXRpb24uDQo+PiBDYW4geW91IHBsZWFzZSBi
cmllZiBhYm91dCBob3cgeW91IHdvdWxkIGxpa2UgdG8gaGF2ZSB0aGlzIHF1aXJrIGltcGxlbWVu
dGVkPw0KPj4gSSBjYW4gc2VuZCB0aGUgdXBkYXRlZCBwYXRjaC4gTXkgcGF0Y2ggc2VyaWVzIGlz
IHBlbmRpbmcgZm9yIG1lcmdlIGp1c3QgYmVjYXVzZSBvZiB0aGUNCj4+IERUIGFuZCBxdWlyayBp
c3N1ZS4gQ2FuIHlvdSBwbGVhc2UgaGVscD8NCj4gDQo+IFllYWgsIHlvdSBuZWVkIHRvIGdldCBp
bnRvIGFuIGFncmVlbWVudCB3aXRoIFJvYiA6LSkgSSBkb24ndCBtaW5kIGhhdmluZw0KPiBleHRy
YSBEVCBmbGFncyBmb3IgdGhpbmdzIHdoaWNoIGNhbid0IGJlIGRldGVjdGVkIGluIHJ1bnRpbWUs
IFJvYg0KPiBkaXNhZ3JlZXMuDQo+IA0KVGhlIGNvbXBhdGlibGUgc3RyaW5nIGlzIG5vdCBzdWl0
YWJsZSBvcHRpb24gYXMgaXQgZG9lcyBub3Qgd29yayB3aXRoIHBsYXRmb3JtIGRyaXZlcnMNCndp
dGggUENJIGJhc2VkIHN5c3RlbS4gQWxzbyBTeW5vcHN5cyBjb250cm9sbGVycyBJUCB2ZXJzaW9u
IHJlZ2lzdGVyIGlzIG5vdCB2aXNpYmxlIHRvIHhoY2kNCmRyaXZlciBhbmQgaGVuY2Ugd2UgZG9u
J3QgaGF2ZSBzZXBhcmF0ZSBjb21wYXRpYmxlIHN0cmluZyBmb3IgZWFjaCBTeW5vcHN5cyB2ZXJz
aW9uIG9uIHRoZQ0KeGhjaSBkcml2ZXIgc2lkZS4gDQpEdWUgdG8gd2hpY2ggSSBkZXBlbmQgb24g
RFQgZmxhZyBhZGRpdGlvbiBmb3IgdGhlIHF1aXJrLiBDYW4gd2UgYWRkIHRoZXNlIERUIGZsYWdz
IGFuZCBxdWlyaz8NCiANCiANClRoYW5rcyAmIFJlZ2FyZHMsDQogVGVqYXMgSm9nbGVrYXINCg==
