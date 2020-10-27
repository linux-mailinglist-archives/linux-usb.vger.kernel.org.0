Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA0E29C73A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 19:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1827863AbgJ0S2q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 14:28:46 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40718 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1827861AbgJ0S2p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 14:28:45 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0ED9B4016D;
        Tue, 27 Oct 2020 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603823324; bh=CVl2S1sYKivdz35az9OGDcSf36f3fshY+zjLJCNdemA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=NlfM5HZdcM087J2t747t+L5r85N+0PacnybqMDyGz786RyPLfFfUc1201Icq7OFxB
         aJ3TKvrrXDoe2WAcyPUnmWpPZjkW4daFu2fEm+EEK2IkPRXyoj65lwoltljZ7BVnWK
         7GPewvayYXkUvXPMe0T2F7Xn3gR5/eF7QB3JJCULityWcz6fn9J+ibyOyccMWM/78t
         oNHMu1RNsVSNwK/hmTx/LwPR0hn/PeO828B2K1qWxgI5WfhwlDqaM3pdvKaQgQne18
         IiESmrLVM33nlCsrvo1nMYcWp0/f9UoIlSbcPxnvpBEhtWyOLd3y2HDnQt814Q+Cep
         Ugz9GeTEvTBBA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6F94AA005E;
        Tue, 27 Oct 2020 18:28:43 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D665B40046;
        Tue, 27 Oct 2020 18:28:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gws4QMCI";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqxI5fYlZoyBUmYZDQOG4WWLdK2tzj9D6nElMFAnufZPpPKw3MNxO4VC1b/qGp3Bier/XpItYHjqIcbYL1sRhlxKh7brEq5H74gng2wd0dPDchFFVi02EGILU31hv2MGe1yAlN5LDDVplE8g48+eLsSHyBVTn6HOw10MUBDUAMlHroKivJOjUNff4IH0x4YfAwte0KXZLK3I/1ZuyTsJSR5IPFAoYutObob+avTkk+/ZIrmharMwpP4gz3ORdeByRXOu3zZcBHCoLXFwSV8BSRSjXGH7Z5jC9pJPvsKTm5i/HoeoyeAFBBtDxczG8d/6siQMLqFFNgW80dEk4oUPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVl2S1sYKivdz35az9OGDcSf36f3fshY+zjLJCNdemA=;
 b=dzzlIlwerYO1bU3sV+gczu3uLHenIMBZfovp9nxyJogaF9FAKwpsIOp/9oQHwXW9uV/BN1tnpCaQYjvhkvG+NxzXjOvfKMnTZbRcQS3Srz3svzVkUZ/UgFYdIIDPJijsoTxjanfy2fJekufNj1lL7KwETPl4yacidCGs1ctN3cDYLZgdfLv+mFBWA6dVSLGwCVgodSTeyaxy1aZboCbRiEVBIctrjcn9dV1560u1adHU4pzKfydh6YmPLZSWZethYerx5cHjVDhn3rczrFb+lKuzNH3gl3XpGtkAnetbJ+YN4VYZstZ4dpvEyc14xhTwfOKtZRMV1l/pC75VbiJPtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVl2S1sYKivdz35az9OGDcSf36f3fshY+zjLJCNdemA=;
 b=gws4QMCIhKDMYgSpw0Ls8noormoalxa/dL2t6/zTCdA9GVol6gvGPKHs6ibEle7IGx+Wu4UZqI1gNqYvRX5jNI6T9wXtorSf8vOUIhdjsL34b82EnsKHygWM1cUcaHx7GSKCy7lJmz8w4O5104FQzUduv31KW/fAT4VLBYBhVXk=
Received: from MN2PR12MB3549.namprd12.prod.outlook.com (2603:10b6:208:107::17)
 by MN2PR12MB3294.namprd12.prod.outlook.com (2603:10b6:208:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 18:28:40 +0000
Received: from MN2PR12MB3549.namprd12.prod.outlook.com
 ([fe80::e1cf:a11d:fbda:9d3]) by MN2PR12MB3549.namprd12.prod.outlook.com
 ([fe80::e1cf:a11d:fbda:9d3%5]) with mapi id 15.20.3499.018; Tue, 27 Oct 2020
 18:28:39 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWo7zmdDYgLgZVXkaCKqwDDPH0oqmr1n8A
Date:   Tue, 27 Oct 2020 18:28:39 +0000
Message-ID: <aa3865cf-1cbd-5d3d-8808-f89d6e0c044e@synopsys.com>
References: <cover.1602853270.git.joglekar@synopsys.com>
In-Reply-To: <cover.1602853270.git.joglekar@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.208.106]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e0b0e67-7f04-429d-64e0-08d87aa62069
x-ms-traffictypediagnostic: MN2PR12MB3294:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3294F6E8F0D8CA94706A0014A4160@MN2PR12MB3294.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yB2ldn7/pbe0gw/0RBbDPVhuX/uW43I2jmGOp3jg5Q4/GG/CmRg4/Diy1w16R0f1I3dRpJZQXlUOmH+KNQztN8QjL97FGL+aI03UyI2Neva4wvqGt/v9L85phA7h3eSt+1aOjm2dDkweSIKrLDOsYETxCMvBP7reMjr9eR6jm7C8K1p9jtgPgKrEXQMJescoEItPwvxKEMdf8l+4ncace2w8s3/eh43KCK6j0D5g/v8vhLqMSn0HXSXd9SAECcJnTtc7F/yKM6Y1sUg8UdYWYL6T7TTuS3wbwc07Dv2wTPum6jArHhXW0ayntqzr24/b
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3549.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(8676002)(5660300002)(91956017)(66556008)(316002)(64756008)(31686004)(66476007)(54906003)(66946007)(76116006)(83380400001)(71200400001)(86362001)(110136005)(2616005)(36756003)(31696002)(55236004)(4326008)(66446008)(6512007)(6486002)(186003)(53546011)(6506007)(2906002)(8936002)(478600001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: QXwmZJUKBEnjvqqBIihqhWIunGrp15mHbq0qeTRcuLuxnSZosuPUejvSBKXfGlyNydiZDznKsX0OCN2RNNdED9rKI++JWEMv9a02RttHeygYoY29PihgX7ilsYWAoXD4zyEocyGnmMsqGW04MA1iqUUmBBNMeVbOYs7oB0N68AEcdz+Q774In7VTgmOuD4hPMUDw+pn5IoOBFJKYIyFBQnOPjd/nfk3ydZxg3beWfVrkdP9a4KY/DIhK9gj52Z6y3yPs2pBGCWLQVYv9SLsrE6xfrolijrYYdT3usBzNzoEWwdFgarSWz70b+4bvq89+eKa9rl+b+rpevGRIy4XwDL7P30R9tjLpJW9fS9oX+1hrYfhuLZayZAvktmfuyH6zljgy6RcWNrxrp2KOui07xsPQHIOUCmx5w+DhMx90vnP5vUBtvh+Xhbu+h/XI4WZpi645lLj7xvfx5b9E0aTdUk2pBkWr6e90VyGpd1JcdHugAXe9uwn9u1EBFZjLiWZCnxej+cDe2Z16vknvlMtXbiOldA+H3qOLXScvMT6DfWvX2VsCmPjTheyO/kzMqoJ03GSHI49o/3ltV7I3DTiDKjiY4S8vzI3QSzBgkjczhU4V2aKJWARst7wxfKAO50x9v4hVf3w6IXkFMlrbTJ0aNQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5413CC6728B264099BE8B68DD95E351@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0b0e67-7f04-429d-64e0-08d87aa62069
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 18:28:39.9103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8cDdTKvbp1nCaFJb+fxSW31vGXD3m1lC8sqbZymWrNs973Poo97dgPtb7XeDTPqPnaPkQ/uqhkSuedSzXfIHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3294
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWF0aGlhcywNCk9uIDEwLzE2LzIwMjAgNjozNCBQTSwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6
DQo+IFRoZSBTeW5vcHN5cyB4SEMgaGFzIGFuIGludGVybmFsIFRSQiBjYWNoZSBvZiBzaXplIFRS
Ql9DQUNIRV9TSVpFIGZvcg0KPiBlYWNoIGVuZHBvaW50LiBUaGUgZGVmYXVsdCB2YWx1ZSBmb3Ig
VFJCX0NBQ0hFX1NJWkUgaXMgMTYgZm9yIFNTIGFuZCA4DQo+IGZvciBIUy4gVGhlIGNvbnRyb2xs
ZXIgbG9hZHMgYW5kIHVwZGF0ZXMgdGhlIFRSQiBjYWNoZSBmcm9tIHRoZQ0KPiB0cmFuc2ZlciBy
aW5nIGluIHN5c3RlbSBtZW1vcnkgd2hlbmV2ZXIgdGhlIGRyaXZlciBpc3N1ZXMgYSBzdGFydA0K
PiB0cmFuc2ZlciBvciB1cGRhdGUgdHJhbnNmZXIgY29tbWFuZC4NCj4gDQo+IEZvciBjaGFpbmVk
IFRSQnMsIHRoZSBTeW5vcHN5cyB4SEMgcmVxdWlyZXMgdGhhdCB0aGUgdG90YWwgYW1vdW50IG9m
DQo+IGJ5dGVzIGZvciBhbGwgVFJCcyBsb2FkZWQgaW4gdGhlIFRSQiBjYWNoZSBiZSBncmVhdGVy
IHRoYW4gb3IgZXF1YWwgdG8NCj4gMSBNUFMuIE9yIHRoZSBjaGFpbiBlbmRzIHdpdGhpbiB0aGUg
VFJCIGNhY2hlICh3aXRoIGEgbGFzdCBUUkIpLg0KPiANCj4gSWYgdGhpcyByZXF1aXJlbWVudCBp
cyBub3QgbWV0LCB0aGUgY29udHJvbGxlciB3aWxsIG5vdCBiZSBhYmxlIHRvDQo+IHNlbmQgb3Ig
cmVjZWl2ZSBhIHBhY2tldCBhbmQgaXQgd2lsbCBoYW5nIGNhdXNpbmcgYSBkcml2ZXIgdGltZW91
dCBhbmQNCj4gZXJyb3IuDQo+IA0KPiBUaGlzIHBhdGNoIHNldCBhZGRzIGxvZ2ljIHRvIHRoZSBY
SENJIGRyaXZlciB0byBkZXRlY3QgYW5kIHByZXZlbnQgdGhpcw0KPiBmcm9tIGhhcHBlbmluZyBh
bG9uZyB3aXRoIHRoZSBxdWlyayB0byBlbmFibGUgdGhpcyBsb2dpYyBmb3IgU3lub3BzeXMNCj4g
SEFQUyBwbGF0Zm9ybS4NCj4gDQo+IEJhc2VkIG9uIE1hdGhpYXMncyBmZWVkYmFjayBvbiBwcmV2
aW91cyBpbXBsZW1lbnRhdGlvbiB3aGVyZSBjb25zb2xpZGF0aW9uDQo+IHdhcyBkb25lIGluIFRS
QiBjYWNoZSwgd2l0aCB0aGlzIHBhdGNoIHNlcmllcyB0aGUgaW1wbGVtZW50YXRpb24gaXMgZG9u
ZQ0KPiBkdXJpbmcgbWFwcGluZyBvZiB0aGUgVVJCIGJ5IGNvbnNvbGlkYXRpbmcgdGhlIFNHIGxp
c3QgaW50byBhIHRlbXBvcmFyeQ0KPiBidWZmZXIgaWYgdGhlIFNHIGxpc3QgYnVmZmVyIHNpemVz
IHdpdGhpbiBUUkJfQ0FDSEVfU0laRSBpcyBsZXNzIHRoYW4gTVBTLg0KPiANCj4gQ2hhbmdlcyBz
aW5jZSB2NDoNCj4gIC0gVXBkYXRlZCBbUGF0Y2ggMy8zXSBwbGF0Zm9ybSBkYXRhIHN0cnVjdHVy
ZSBpbml0aWFsaXphdGlvbg0KPiAgLSBUcml2aWFsIGNoYW5nZXMgaW4gY29tbWl0IHdvcmRpbmdz
DQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYzOg0KPiAgLSBSZW1vdmVkIHRoZSBkdC1iaW5kaW5nIHBh
dGNoDQo+ICAtIEFkZGVkIG5ldyBwYXRjaCB0byBwYXNzIHRoZSBxdWlyayBhcyBwbGF0Zm9ybSBk
YXRhDQo+ICAtIE1vZGlmaWVkIHRoZSBwYXRjaCB0byBzZXQgdGhlIHF1aXJrDQo+IA0KPiBDaGFu
Z2VzIHNpbmNlIHYyOg0KPiAgLSBNb2RpZmllZCB0aGUgeGhjaV91bm1hcF90ZW1wX2J1ZmZlciBm
dW5jdGlvbiB0byB1bm1hcCBkbWEgYW5kIGMNCj4gICAgdGhlIGRtYSBmbGFnDQo+ICAtIFJlbW92
ZWQgUkZDIHRhZw0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gIC0gQ29tbWVudHMgZnJvbSBH
cmVnIGFyZSBhZGRyZXNzZWQgb24gW1BBVENIIDQvNF0gYW5kIFtQQVRDSCAxLzRdDQo+ICAtIFJl
bmFtZWQgdGhlIHByb3BlcnR5IGFuZCBxdWlyayBhcyBpbiBvdGhlciBwYXRjaGVzIGJhc2VkIG9u
IFtQQVRDSCAxLzRdDQo+IA0KPiANCj4gDQo+IFRlamFzIEpvZ2xla2FyICgzKToNCj4gICB1c2I6
IHhoY2k6IFNldCBxdWlyayBmb3IgWEhDSV9TR19UUkJfQ0FDSEVfU0laRV9RVUlSSw0KPiAgIHVz
YjogeGhjaTogVXNlIHRlbXBvcmFyeSBidWZmZXIgdG8gY29uc29saWRhdGUgU0cNCj4gICB1c2I6
IGR3YzM6IFBhc3MgcXVpcmsgYXMgcGxhdGZvcm0gZGF0YQ0KPiANCj4gIGRyaXZlcnMvdXNiL2R3
YzMvaG9zdC5jICAgICAgfCAgMTAgKysrDQo+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5j
IHwgICAzICsNCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMgfCAgIDIgKy0NCj4gIGRy
aXZlcnMvdXNiL2hvc3QveGhjaS5jICAgICAgfCAxMzcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0NCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS5oICAgICAgfCAgIDUgKysNCj4g
IDUgZmlsZXMgY2hhbmdlZCwgMTU1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
DQpJIGhhdmUgcmVtb3ZlZCB0aGUgZGVwZW5kZW5jeSBvbiBzZXR0aW5nIHF1aXJrIHRocm91Z2gg
ZGV2aWNlIHRyZWUgYmluZGluZw0KYW5kIGFkZGVkIHRoZSBxdWlyayB1c2luZyBwbGF0Zm9ybSBk
YXRhLiBDYW4geW91IHBsZWFzZSByZXZpZXcgYW5kIGlmIA0KZXZlcnl0aGluZyBsb29rcyBPSywg
Y2FuIHlvdSBwbGVhc2UgYWRkIHRoaXMgcGF0Y2ggc2VyaWVzIHRvIHlvdXIgdHJlZT8NCg0KVGhh
bmtzICYgUmVnYXJkcywNCiBUZWphcyBKb2dsZWthcg0K
