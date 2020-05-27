Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72CD1E433A
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 15:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387972AbgE0NQV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 09:16:21 -0400
Received: from mail-bn8nam11on2049.outbound.protection.outlook.com ([40.107.236.49]:6091
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387942AbgE0NQU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 09:16:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iL14vsWaBR2hZZSQF+m/07dF1aB1mJZ7oiCiP1aJfZAZUuBfDiSp9O5SMO2OboEBH0r/+CidDw9BBXRHRgCNdph4Jps0m2kQhpToGJp1sQ5yLF5YYh6XsUqMcGcFAeHYK5bFY5YpAaLuh9P78i0bqHYc75ilcbXg3QCdFVOz8Fq28UXMtwcVzrLjjV96QY/2mQCzbY1l3j06HbaTpNAuoYZ+7DnbCpB+ZhoyFwhluYwRLYk3Y+xh9GOH9fUqTGJJ1yJLK0BBnJMq+v8bVx9FW/kAjTqsB5BsrUGJzkeGGMiz7WS/RJ+yjxGpJtOuxhi9acpOKdDV0skradwxHxnYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J04CYUfJqx4q17A2iVJ9g7f8taCO9fEl6j1jb4ptyAU=;
 b=NmP6vvyvLM6ghsWvdOSL40jHOrPYE7tH+0s6Di0tpWuNL/IVRDgupPjurBKiFjcJi9TCZIyNykeGnUWDYzgCvvjf7P2zqu0CfnleaPyJ/TdkQtWocFAxPfUhwgH10QNgJ62E9AgfM6TuYjTrPFndgov7OwVH9hBnKJCBpepFwjnEMn38TUwkq9LNp3kYsVQ9Ong3cJ57ExtlJf54Bh3gp4bQaNHUDfjX/lIPL7eCqLaceB2Ruosn3kyILWa2FA6EWD3l6WrhCtyDfvzSCAh4CnhwImzTOAJ2gRQhfKi2AiLthojuAe73K0wvSgKyd5Tz7QBNYJRHudKCYqlwJ1e17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J04CYUfJqx4q17A2iVJ9g7f8taCO9fEl6j1jb4ptyAU=;
 b=NurK25iCuR7IRH0+oMx6slQAXMqPIqf2BCiBRLwAp0zaVZXZjhlJT64QA50r7SwI7lYR9eWzKQVvUg42cc6IAl2f2w1k9j1f94cRgpuU/96r0rFhrFbJNbhvHGo4Wuejn9oLzYurMB/qFOkQUJFOzzv/E7PAWM0CeQAHvLJJk5U=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3569.namprd10.prod.outlook.com (2603:10b6:408:bd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Wed, 27 May
 2020 13:16:17 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 13:16:17 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYCAABTvAIAAbWUAgAAJUgCAAQCagIAAEYeAgAAQ3QCAACtYAA==
Date:   Wed, 27 May 2020 13:16:17 +0000
Message-ID: <c2c3eed27aa13f981690779aca00c420ce0beb06.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
         <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
         <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
         <1590568683.2838.42.camel@suse.com>
         <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
         <1590576068.2838.56.camel@suse.com>
In-Reply-To: <1590576068.2838.56.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77516556-00ab-4425-d6a5-08d8024023e4
x-ms-traffictypediagnostic: BN8PR10MB3569:
x-microsoft-antispam-prvs: <BN8PR10MB356910664D62EB859A6B8D3BF4B10@BN8PR10MB3569.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dp5KO1QmR3lyBTDy4gKm3/ffTHHzX8Zf0tBKEDS12og+Vgpo22ZjwoO4jXJC5ZVSLERhns56EzH7fHnMlaqpgLfzjdcBpuHNl/aLOrtcWc1p4K35UylRq57sdinaP1xFMzqaZrqUaijN+5GKUo6Yp5/xR/Dt9kaKzbvYn3hu2YIEApDindUduko8JsTlefZ+OhVcN7KYZdfo/bu/ByimVQpAYD0QB/PYqfpwWzAGZF4Lav/aLRAa929g8BhmwHQME0Mi+N6J8tmHMPzbirDPfA42nT154LuAHioMrqlG0nANESKUnj1hG7++T7IEIo9q7ryWKDMsmqP05lUvyRXnnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(316002)(26005)(186003)(6506007)(91956017)(2906002)(66946007)(66556008)(478600001)(83380400001)(71200400001)(64756008)(66446008)(76116006)(2616005)(66476007)(5660300002)(110136005)(6486002)(6512007)(36756003)(8936002)(8676002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 15nidqa23el7TW2KAC6VN+rAbOm6C3meQVtwOZUikJdy/wguhXAe8aEFpd8TVL0fFbP2KSaPWltRUeHI4Iot1ZLUCssCPjsqwBsQJ1qTayE9zuPMIc6G6G7a9a5sCvFqyAykRuakdkU/MTXonjn1RKqzInXeS7KGhxNLXbKVRbywCtJ3ayQ2DqSPJNFgyj7L661vLohqghSo78QzSNcq/6PrR3V7zhitBXhU9VRVITq7k0THbXRuVIZuGVUZWBCeaeSdO5GKwU+Y38BqWWyt1GLCR1/dMVy7WJZRd/jNFKku4vdfj+rEbjgPp39qYjBOkBwYY+nzdXd2M5nYQllnqTH5WQyROefoBqTZoXNa9fi18ctG3tOtEuhJ5IIr4InhelAh3fypCA9uxNx63Kwz3y+9dGPcps4Tpgq6UTBaNC2JL/+3Ma7UfQktmeDo2sWp+0wr+Z9Cnf8quJWiSFaCi2DObRXfn8m8snRqLs+lJPK2X5MTlVA1ELigY8UhotJZ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B72C6863365E394E992A011C5DC3A434@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77516556-00ab-4425-d6a5-08d8024023e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 13:16:17.5278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lf/TVuJY3MlMW/dZQfxncicSEjDuYh9oeBzQnRTb8SGhf/riL50ADp0AJlQzf3T/kU+VL5Rc1wcvKxpc2pa7pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3569
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIwLTA1LTI3IGF0IDEyOjQxICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0K
PiBBbSBNaXR0d29jaCwgZGVuIDI3LjA1LjIwMjAsIDA5OjQwICswMDAwIHNjaHJpZWIgSm9ha2lt
IFRqZXJubHVuZDoNCj4gPiBPbiBXZWQsIDIwMjAtMDUtMjcgYXQgMTA6MzggKzAyMDAsIE9saXZl
ciBOZXVrdW0gd3JvdGU6DQo+ID4gPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJv
bSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZS4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBBbSBEaWVuc3RhZywgZGVu
IDI2LjA1LjIwMjAsIDE3OjE5ICswMDAwIHNjaHJpZWIgSm9ha2ltIFRqZXJubHVuZDoNCj4gPiA+
ID4gVGhpcyAidS1ib290IFNQTCIgaXMgdGhlIGZpcnN0IHRoaW5nIHUtYm9vdCB3cml0ZXMgYW5k
IHNvbWVob3cgdGhpcyBpcyByZW1lbWJlcmVkLCBJIGFzc3VtZSwgYnkgY2RjX2FjbQ0KPiA+ID4g
PiBhbmQgZ2V0cyBlY2hvZWQgYmFjayB3aGVuIEkgb3BlbiB0dHlBQ00wDQo+ID4gPiANCj4gPiA+
IEhpLA0KPiA+ID4gDQo+ID4gPiB0aGF0IG1ha2VzIHNlbnNlLCBidXQgaXQgaXMgbm90IHNvbWV0
aGluZyB0aGF0IHdlIGNvdWxkIHJlYWxseQ0KPiA+ID4gY2hhbmdlIGluIENEQy1BQ00sIEkgYW0g
YWZyYWlkLg0KPiA+IA0KPiA+IFdoeSBub3Q/IENEQy1BQ00gc2hvdWxkIGVjaG8gYmFjayBhbnl0
aGluZyBpdCBoYXMgcmVjZWl2ZWQgYmVmb3JlIG9wZW4gb2YgdHR5QUNNDQo+IA0KPiBXZWxsLCB0
aGVyZSBpcyBhbiBpbmhlcmVudCByYWNlIGNvbmRpdGlvbiB3aXRoIGxvYWRpbmcgdGhlIG1vZHVs
ZSBJIGFtDQo+IGFmcmFpZC4gQnkgZGVmYXVsdCBjZGMtYWNtIHNob3VsZCBhY3R1YWxseSBlY2hv
LiBZb3UgY2FuIHNldCB0aGUNCj4gRElTQUJMRV9FQ0hPIGVjaG8gcXVpcmsgZm9yIHlvdXIgZGV2
aWNlIGlmIHlvdSB3YW50IHRvIGdldCByaWQgb2YgaXQuDQo+IA0KPiBJcyBDREMtQUNNIHZpb2xh
dGluZyBzb21lIHN0YW5kYXJkIHdpdGggcmVzcGVjdCB0byBlY2hvaW5nPyBDaGFuZ2luZw0KPiBk
ZWZhdWx0cyByZWFsbHkgaHVydHMgdXNlcnMsIG5vIG1hdHRlciB3aGF0IHlvdSBkby4NCj4gDQoN
Cg0KCS8qDQoJICogU3VwcHJlc3MgaW5pdGlhbCBlY2hvaW5nIGZvciBzb21lIGRldmljZXMgd2hp
Y2ggbWlnaHQgc2VuZCBkYXRhDQoJICogaW1tZWRpYXRlbHkgYWZ0ZXIgYWNtIGRyaXZlciBoYXMg
YmVlbiBpbnN0YWxsZWQuDQoJICovDQoJaWYgKGFjbS0+cXVpcmtzICYgRElTQUJMRV9FQ0hPKQ0K
CQl0dHktPnRlcm1pb3MuY19sZmxhZyAmPSB+RUNITzsNCg0KVGhhdCBzZWVtcyB0byBiZSB3aGF0
IEkgbmVlZGVkLCBzaG91bGQgYmUgZGVmYXVsdCBJIHRoaW5rIC4uLg0KTmVlZCB0byB0ZXN0IHNv
bSBtb3JlIGJ1dCBsb29rcyBtdWNoIGJldHRlci4NCkkgZ3Vlc3MgYWxsIGNkY19hY20ncyBhcmUg
Y291bGQgc3VmZmVyIGZyb20gdGhpcz8gV2lsbCBkZXBlbmQgdGhlIHRhcmdldCBpbiB0aGUgb3Ro
ZXINCmVuZC4NCg0KIEpvY2tlIA0K
