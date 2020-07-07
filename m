Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD2321750C
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 19:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgGGRVs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 13:21:48 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45106 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727777AbgGGRVr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 13:21:47 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5155F4014E;
        Tue,  7 Jul 2020 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594142507; bh=YmVE99sJmhT5pVGylvh+nZ3ikH19cspbFAmQ20SabGc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Yvg2m51aTmks8ZFq7auj9pGBQwOKFZGREN2eKtGTjE6bqH2f/Z7TE/dmglzzBQ2ya
         yDL3yYacHAlJA7vVFml92hiQ9Fh1xQ4UkzGo4BfdBCiTgjCksc7aAn4N3FLFAlkDkx
         KrlRyXVvlq6Ko9X9wq6FaPBGFuOLpHyyZDIVM05z1j1B46GqCakoeb7sFg+qMn5Tbf
         FTKM95Cq1A3LSZWJbqTFaVguHGxAopedPFtnAIgrPbSJ9X35nvHyHFEQbeZxmEgJ7s
         neWMWdleh813gYfURuhm9QwOEZihu4cIqAVf2a7AyiEEvST4RzDWlSCr+yTjqOkBi2
         iDLtvAAmyXR7w==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E906DA0252;
        Tue,  7 Jul 2020 17:21:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 48CC2400CB;
        Tue,  7 Jul 2020 17:21:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XjcNPW5b";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6fYqBN9wdBPfak27vsQ58CKTWY6wsoCM6KkgSMPJY+ITI1w6NcuCb81DZEFm9DJDXLc6n38RKWTlLpep0IVtWqE3usv8e+OC/+Nt3JhnIO+HQSknK/4N0+r+s9/c6GhyL0+xR1s+P9zkmjTcJ8ZoFtWviECo87YPNUPc2GqbvmMW9F3+CcG3MQNvZcyh+D1tHXTlNsBMIsHwviy9dvAFiYcKAjONqcRVxfwZxefo3U9FIFVyk4z+O3LulW43Loaj8tWWdo5WV1xKbJogIZo5ouUkPXniXWe+CGkKE2CkEMc9EWA87OxOK7ibZ+oc+tiyCLRqNMkkxWm+/nSNPEp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmVE99sJmhT5pVGylvh+nZ3ikH19cspbFAmQ20SabGc=;
 b=RRiZlWzMTOOvEd9xAAo6YV4iyEBPPPpOsIXtTNgifEaDtYt+4FW4/mCmFweHLXZL4rh5HE7tDoH3aKZnuMv/aW2SKehshqUVo5Cdil8e8Kh4sX4g7q0JadEF/CGm6V6NXdpB6AnxsrPMrwdvOhHwnaIP6UUrHnyg38KzmcbXjqtMhYIyaDOQ6nMz6vthDrtqXEu7NDC5qk7jw999cw9ssiiOlYKjJcxXIe26NqzBfPADz4GmCXQ7nj9PgE0Hc76NtG1PwCw6CA9+11PqOAfjJCo/AImYjM0/RhBiaJCgSF7LqLMLzu4HFY3+gZaGhTh/2gDqD7Kqwh8oZSl2QFT+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmVE99sJmhT5pVGylvh+nZ3ikH19cspbFAmQ20SabGc=;
 b=XjcNPW5bSsO9NIEnyljGF5sZQFZOnRQQg2e1mSP2+E5vQ/EF2qdHUVubCJbl+2M5QicmQ+L1FIOXFA8XB6Gfj97DRIxdhWxo4lGQV/MgakUY/3ZEf9KnLQKTt4w7RNcuqkyg6ZDxO8Z+vqPymK8lGmdMxk2B0Nt+Hz910Zc/OCc=
Received: from BN8PR12MB3458.namprd12.prod.outlook.com (2603:10b6:408:44::32)
 by BN6PR12MB1828.namprd12.prod.outlook.com (2603:10b6:404:108::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 17:21:41 +0000
Received: from BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6]) by BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6%2]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 17:21:40 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Topic: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Index: AQHWNBPIzVDQozhV20CqjRBnx+8J26j6PmiAgAAa/YCAAkSZgA==
Date:   Tue, 7 Jul 2020 17:21:40 +0000
Message-ID: <8f3d7899-9e67-a133-aadc-f78059a59073@synopsys.com>
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
x-originating-ip: [49.207.193.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20eedc5a-a846-417c-5776-08d8229a3692
x-ms-traffictypediagnostic: BN6PR12MB1828:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1828029DD03DDC62599EA399A4660@BN6PR12MB1828.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rVzIiTmnlPsWvds0ybXAHjMqoLhiA+/NIx93AjP+VM4VKjlq/wBwlUoqBefRvreDbbKm9cSGHAHywqucUy5XYPRMXELUWSKPB8FuzernVRdR6SbWEc0HcADSiVfOQ3SGQJ7LCR4qFoEhwApwATtzGzPCtbJVrxn/sjPSA/nVECSpuwci/Wyy9zjeYNJLDS0SGyyiX1F24CxtNyXAhUWo++6xIEBzy1pErCHqYMrpizidE6l8bnLhXcmKdbFk4o3VsKRy0TfiEtJRINNKIm85EWnTVDpIw0zCrXVKuhDT8l3zrNL3CFsxbbYW8VXZCiUu5UrB0EEOpCq5alBW8REhzA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3458.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(39860400002)(136003)(366004)(478600001)(31696002)(6512007)(86362001)(110136005)(2906002)(6506007)(54906003)(4326008)(83380400001)(31686004)(6486002)(186003)(55236004)(66556008)(8676002)(64756008)(36756003)(66476007)(91956017)(76116006)(316002)(2616005)(66446008)(71200400001)(66946007)(5660300002)(8936002)(53546011)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: E7nLneVpIyz8sLVOJ9kpvOuyq3gfhPbzCiH21ruBOCDoplGLzDhNJ0hN4xRrNKmiQDftyP8rr15W1f/w5iwsrWddYqwoiXBbMlor4HgcF3eEEV5mlQ2nT5h1+nEBIqMvB435PQpiYVO+CIbMTbiN88KHEYQf8chfYgwUGo+pJTvrHXrKaCG1qjsC52MuFWn+hKn0KZeW/lYwLo/tzabC3qkjgB3W4QvVCnu+BtkUtIfuPRgl0JWCFbYZ6DGk4zknsm/azL5/rrdSBLWMH/H2cK+PqxBZ0gVs8ny3Q34lKamiTNmac8kKuuTZJahYbPFTKUVGZplHSGjS1evJpRWW8QAN4g8xV4zCCAdbzn2wF3lUZBYhHsl963CoPgLFLe56CJyDa9W0zF51bgCy2sF3wAxWdtFRHhB+HhL2VUCt+DSLGhE6VfWqJZWgIdiTfRgZ4dn8QD7r3lwIhwVrDK6gDUte9pMKUvwuAx1J27Dfv6omJJZB9qleIkHcohVBVPUh
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DD812023FAA1F49A3893ECA6C2C5971@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3458.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20eedc5a-a846-417c-5776-08d8229a3692
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 17:21:40.7684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r2+3hERWN3MZRW1wy9zIGyIgufGFdOmW8bvk0pl2UMFHCM7OuOHEs06gGr4SqKhfHJd69YPNhrn3yqytG2ASjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1828
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
IGFuZCBxdWlyaz8NCg0KDQpUaGFua3MgJiBSZWdhcmRzLA0KIFRlamFzIEpvZ2xla2FyDQoNCg0K
