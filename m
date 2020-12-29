Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAE32E6EC4
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 08:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgL2Hae (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 02:30:34 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:58244 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726161AbgL2Had (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Dec 2020 02:30:33 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 07E1940E60;
        Tue, 29 Dec 2020 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1609226972; bh=VULagmBG+Za0sQEybEFGJ57A1Winy6GRs6+seTpD00E=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=DE8y6AOOlfPWqAk8EUSX2BijAm5ZP+uCe3AQnQQsv8IHiRz6HyoDRlqtckWvrh/5Z
         fQ/UvYah5J5XpaGCEeALa2O6E6fxKmqNe5VtgJx9EBjR0wj8iWvV1E6Z+U2GrnuwLD
         I/fwMZE11NuzT/Wtuge+QiM0L8/jqRuaRyHo2hjnQXG3pU/gwIRBmqa5n+GxYRsNDs
         BRR4eWMdWjA1i8woB/34+DfSUfHVC1EoNbwxzJMI2VbXuNxPmKOKeFnY1oGM9Ek9J8
         V5NEcXL7wM+Ngvf24uBcilGD3sszbWTZWZ7igh4RiPSvLV/pPNVSeNyxVU65Q/mnJX
         tWz6Tga1djrfw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 81B68A0069;
        Tue, 29 Dec 2020 07:29:31 +0000 (UTC)
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2056.outbound.protection.outlook.com [104.47.37.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A4CAD8000C;
        Tue, 29 Dec 2020 07:29:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=arturp@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tgYASSku";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKKdSsjDOEJO4k4/RkUX//FmQzMfMx9XeUwD4hjhJiNCu48cMHwR/PQVqa7rr/igRbhk1KEHTNnBYTFu2D48A4Ck9tkNkIWyr6PffBjyD8UxpPXmF2FlVpJn5LfnFMNPVPsSE4xgwugmn+tNhxOYFfeWbgkdiTW83yyyhcx3m1+5MhWMhnDaB0L/wuitpHrqf1iDIUNQTC5yh0gCgJXYVL+rc0umkL6Fni7Pl9bRE/3CQfnC8q1YUGAEObhuwxB9/YfztbGQu2yN3rl+v9jKTT7Oyi3RuN1/MihZScUmEpXwUKnyPof9FWnHWUW1+VIme3jRDipjaGL3aCte69vVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VULagmBG+Za0sQEybEFGJ57A1Winy6GRs6+seTpD00E=;
 b=LMLmI6sWMABEQnJ9MV4FufsgJ3THWF7ldj5vVy2xoJRXU8MsluYCw5thF65mqzIIXUIHt/Lf7TVC4KIn8pQZMDtmHgJ3U0ZmTaBOzs9cv+fnDgMxF4Z1m1ar7IM6F+l1t5jhHnHooDY77V3Msa4THkP0r+tA7vmSQMfAj4soJHtyae1K9DLJN5KAC8F49/wks2CJwNRVD+zcVbyWMgZRQ6vGCpWLF3kUuYV6iW7a+z5m7rPkS90/k7TZEqJuyIsLqx816nDobcVWMc0LRISuHBw3NHSOo9LebjoXZY8wbfzdNlWTUbuq/59q87W8hcDuJ5pYfPraEmZRXT9C38fBJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VULagmBG+Za0sQEybEFGJ57A1Winy6GRs6+seTpD00E=;
 b=tgYASSkuHUUxZDx2azytMpi3KqCYBdSUZNpkd6PWEUDWx9jxrvjzsll9o/lb35jmiuzrjN4N7fpDUyBnzeVEJ6RYUVQ0Qp1BBaT187New0yUuKjjAsMh3DQfLjX3MZvoeJ77XQSrh11DNPBzzrVLivwupDSRN3AzAHflp3u3vCI=
Received: from MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 by MWHPR12MB1856.namprd12.prod.outlook.com (2603:10b6:300:108::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.31; Tue, 29 Dec
 2020 07:29:28 +0000
Received: from MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::19f6:62ef:1691:1cdb]) by MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::19f6:62ef:1691:1cdb%4]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 07:29:28 +0000
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Vincent Pelletier <plr.vincent@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: Re: dwc2 gadget rejecting new AIO transfer when bus is suspended
Thread-Topic: dwc2 gadget rejecting new AIO transfer when bus is suspended
Thread-Index: AQHW2fN/WrhhRCNlcU+PgXrG5a9vnqoHpSmAgADoBYCAAQ3qAIAAleUAgAODxwA=
Date:   Tue, 29 Dec 2020 07:29:27 +0000
Message-ID: <a87cca5e-786c-ca45-a98c-1429680621a6@synopsys.com>
References: <20201224125012.4df1d26c@gmail.com>
 <ff11cf43-f185-b123-6cb5-f218ef148d89@synopsys.com>
 <20201226004627.657ba339@gmail.com>
 <20201226165230.GB606763@rowland.harvard.edu>
 <20201227014900.2ff91bab@gmail.com>
In-Reply-To: <20201227014900.2ff91bab@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [176.32.192.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3f94b40-7606-4e2d-a0c7-08d8abcb79ac
x-ms-traffictypediagnostic: MWHPR12MB1856:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB185670D64CB820B1D1FB4D27A7D80@MWHPR12MB1856.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tCeJIgs9zGKYWPnJfwnkGmDKvhffDV9onPiRZAI+ljO+sGah408ggnfJ1wqxCynPp50U/pjMn2URpd5i3iFJVw03H1l7iGXyYIPdDwybjfCCTZ32HoO8mT2AWpGmZjo17j7vwRuUNDUWJ6XQEkqIpaWkq8J07af+R8h2x1GeZZVdh21L6hrId5aDL89xj+97MiajTx1vKYYLyKwIcBE93rnA3bh/y9AHKd7H/7qYAKn4RNF0Yys2HQUJ3ErplqphvFzrCmmXAexxHr3cqP5pkxRCs28OZvl94TkCpaBDfdWBLnf5AqEQZMDVxzojrjojDLCARs8HmsouiRYnDI1pYf77sxsaYy7NlbfeGktcgIuhCy4BHwD0g/gqUlNPirqm1QetumC/I23h+EWXCtil77au4lOAbPg/p+YZVOUgsyJJZsPIhcullw1lx/RQN2g4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4428.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(39860400002)(366004)(396003)(31686004)(66446008)(36756003)(55236004)(31696002)(4326008)(186003)(76116006)(66476007)(64756008)(5660300002)(15650500001)(26005)(8936002)(2906002)(66946007)(91956017)(66556008)(54906003)(316002)(478600001)(2616005)(71200400001)(6506007)(110136005)(8676002)(6486002)(107886003)(6512007)(53546011)(83380400001)(86362001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MDhXMU9NSnkveFhqenEzTytlMFNhenlQejl1K1RPZ25pQXpsMU1XMkw2bURQ?=
 =?utf-8?B?VmtKKzBENE9GdXVJTVNrMFJwa0RkaHY2a3JZMWNnaEQ1SDBhWklFUjNrcnBr?=
 =?utf-8?B?THJKQ3VPek9COVpLQTFhL0hlZjRoY1VmVE5wbkNaZUJJUHNKK0ZIMGFqSWw0?=
 =?utf-8?B?NmxwZklRMU9rem1MdllnWlZPbHJlZ0xsbDlweFBLVFhCSUxKdFRTcDd6U3RC?=
 =?utf-8?B?Q0Qxd3VXU01IWnRDOHJHWUNEakJtV3FYK0ZuKytUNVVDMWZ3U1FUUmlhZVdt?=
 =?utf-8?B?eVRUR2h5VzVGNmhwdnlXTVhIZG1ZZTlmUjRBMWVrNVRMUCttSUgxbmxWbFlJ?=
 =?utf-8?B?MGlnN01iaFV6YnB1R0dlVzlaNDdMd3BXQjZRU0xsZG1lWjV3aTNuNUxETFNz?=
 =?utf-8?B?Qm5IMW1lUjBWT1hnR3owcTNXVDMzVkFtYjB4T1ZDUDZFWlAxc1dwbUZteGp4?=
 =?utf-8?B?QlVSRGVsT2cvWGtkaFZLQzRMRm50TTBkKzd1UmJBeEs0SXV6Q21BUFZJYVRt?=
 =?utf-8?B?QUhiWmlCbkNrbHNxYzVWTFZzWHRLWk9lUXA0SndzTmRQMldLdWhxOXBjUEFD?=
 =?utf-8?B?ekFHSHFYdWhyMGR5cmQvVmgyOVd1WWhOK1dld1VCeTRNempyOU1WT3kxQXFR?=
 =?utf-8?B?bHhyNjhSRUpmM1dTYmtaOUd2dERlb1dRK3Ewa3BURUdKdmhackxMU2dGOExa?=
 =?utf-8?B?NVcySVJ5L0pRbEVuQ1J2dUViNUhBd1E0Yk9HRENBeUxYTXY2RGpmYjFNZnM2?=
 =?utf-8?B?ZXlEUi9uSGtiWDE5S0Z5ZVd0TzcvVXNJYzVDVC8rUGpVRFdwcHN3S0xCTXlX?=
 =?utf-8?B?eGZYNi8wRzUvcDl5THVQcDRoaVUwR04vNXg4cVBMZVFKaWlkYUhlRnZaVzcw?=
 =?utf-8?B?cW1JbE1YRWhtaFEybW1FellUNTJWV1pQRllMbXhrdVRyOHh5VTIyTVJYVTQ2?=
 =?utf-8?B?UjFuMEt2b3ZWUWh0Skt3cGpXcnIyRGs3ZC94Y2lielZZUU4rZ3dVa1o0bldM?=
 =?utf-8?B?SlJCNDNuZHArRXhwZ1NDaHhiNEpVc3Bhb1ZRYitKTkRnSkN3VmJZUTMrRXZG?=
 =?utf-8?B?a3YyaDkxSUJETFlJUHEvRnI5MFdoNEhDTUg1bWVCWUpGclRhU3FwL2RDbjFT?=
 =?utf-8?B?MkhvUk0zOVA3Rzl0K3RtV0lrWmFUOTZGUXlxWFNXeGtzWHg0emUva0FPOUpm?=
 =?utf-8?B?dnFBeXdGOFErZ0FUMUo5TVhxZktYbG9wNUNjUDdvYkZRQ29kN2U5YmVSWUoy?=
 =?utf-8?B?OWVJdGtQenlXdlBiekV5cHdGdW1aK2FKQW4xTUh5QWMvVjVHN0s3eDkvN0dS?=
 =?utf-8?Q?42MGHEkgZ3Ch4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8F949B70A612140A3704768570C372B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4428.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f94b40-7606-4e2d-a0c7-08d8abcb79ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2020 07:29:27.9957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KnPSIgW7lU+iEWYo5M6C6s7k4qC8rRmRzXevcowkNmBH/yau92FU2FO9lRteJmp7k/sTBG6eTj7+CR4GQ03PIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1856
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgVmluY2VudCwNCg0KT24gMTIvMjcvMjAyMCAwNTo0OSwgVmluY2VudCBQZWxsZXRpZXIgd3Jv
dGU6DQo+IEhlbGxvIEFsYW4sDQo+IA0KPiBPbiBTYXQsIDI2IERlYyAyMDIwIDExOjUyOjMwIC0w
NTAwLCBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1PiB3cm90ZToNCj4+IFRo
ZSBrZXJuZWwgc2hvdWxkbid0IGhhdmUgdG8gc2l0IG9uIGFueXRoaW5nLiAgVGhlIHJlcXVlc3Rz
IHNob3VsZCBiZQ0KPj4gYWNjZXB0ZWQgaW1tZWRpYXRlbHkuDQo+IA0KPiBJIG11c3QgaGF2ZSB1
c2VkIHRoaXMgc2VudGVuY2UgaW5jb3JyZWN0bHk6IEkgbWVhbnQgd2hhdCB5b3UgZGVzY3JpYmVk
LA0KPiB0aGUga2VybmVsIGFjY2VwdGluZyB0aGUgdHJhbnNmZXIgYW5kIHRoZSBtb2R1bGUgc3Vi
bWl0dGluZyBpdCB0bw0KPiBoYXJkd2FyZSB3aGVuZXZlciBhYmxlLg0KPiANCj4gQWxzbywgc3Ry
aWN0bHkgc3BlYWtpbmcgKGFuZCB0byBhdm9pZCBjb25mdXNpb24gaWYgSSBmYWlsZWQgZnVydGhl
ciBhdA0KPiBFbmdsaXNoIGV4cHJlc3Npb24gaW4gbXkgcHJldmlvdXMgZW1haWxzKSBhaW9fc3Vi
bWl0IGl0c2VsZiBkb2VzDQo+IHN1Y2NlZWQsIHNvIGluIGEgc2Vuc2UgdGhlIGtlcm5lbCBhbHJl
YWR5IGFjY2VwdHMgdGhlIHRyYW5zZmVyLiBUaGUNCj4gaXNzdWUgaXMgdGhhdCB0aGUgdHJhbnNm
ZXIgY29tcGxldGlvbiBoYXBwZW5zIGltbWVkaWF0ZWx5IGFmdGVyLCB3aXRoDQo+IHRoaXMgRUFH
QUlOIHN0YXR1cy4NCg0KUmVmYWN0b3JpbmcgdGhlIGRyaXZlciB0byBhbHdheXMgYWNjZXB0IGFu
eSBFUCByZXF1ZXN0IGluZGVwZW5kZW50IG9mIA0KdGhlIHN0YXRlIChzdXNwZW5kKSwgcmVxdWly
ZXMgbG90IG9mIGludmVzdGlnYXRpb24uIFdlIHdpbGwgZGVjaWRlIGFuZCANCmltcGxlbWVudCBs
YXRlci4NCg0KRm9yIHlvdXIgY2FzZSB3ZSBzdWdnZXN0IHRoZSBmb2xsb3dpbmcgd29ya2Fyb3Vu
ZCBpbiANCiJkd2MyX2hzb3RnX2VwX3F1ZXVlKCkiIGZ1bmN0aW9uIHRvIGFkZGl0aW9uYWxseSBj
aGVjayAiaHNvdGctPnBvd2VyX2Rvd24iOg0KDQovKiBQcmV2ZW50IG5ldyByZXF1ZXN0IHN1Ym1p
c3Npb24gd2hlbiBjb250cm9sbGVyIGlzIHN1c3BlbmRlZCAqLw0KaWYgKGhzLT5seF9zdGF0ZSAh
PSBEV0MyX0wwICYmIGhzb3RnLT5wb3dlcl9kb3duKSB7DQoJZGV2X2RiZyhocy0+ZGV2LCAiJXM6
IHN1Ym1pdCByZXF1ZXN0IG9ubHkgaW4gYWN0aXZlIHN0YXRlXG4iLA0KCQlfX2Z1bmNfXyk7DQoJ
cmV0dXJuIC1FQUdBSU47DQp9DQoNClBsZWFzZSB0ZXN0IGFuZCBsZXQgdXMga25vdyB0aGUgcmVz
dWx0cy4NCg0KPiANCj4gUmVnYXJkcywNCj4gDQo=
