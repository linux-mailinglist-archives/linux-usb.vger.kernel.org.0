Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21AA1358F4C
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 23:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhDHViK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 17:38:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:39486 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232404AbhDHViJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 17:38:09 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BB1B3C009A;
        Thu,  8 Apr 2021 21:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617917877; bh=Gk5N8//1QhDJJMdySEMBw1ui+bvwlVg1Z0fQemXfJCg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lJsgHNXtcS4B91czZbG6AhRzHKCX0cX37uxxH2fb3knzAck4pB18ZTLGqBpeybGCW
         FbU6eBd9oLLArJmMmog13I4YUZpUzLos5O0VO+/cngVkSBrsvickgX8igR163MEWSI
         V1AxwZejKh6K/ueSEBJnAWkewi/l6kZ0Mgzc9kNazyb3YzROasB5HLMdI1oANpfesS
         r/3xTdRUh2tQg9NvryZWZDMedPzV6qDxwA63i9uLhqvXqGZYrPZKQTdSz+fAAMHRpO
         LZCg21ZbfV6V+fG7FCxJ+7t3fp0eajjbVYn0VQ1iKfLth3daSf435Xpc854EEbdWZt
         iFR85z7ow+9YA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id DEBF0A005E;
        Thu,  8 Apr 2021 21:37:56 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id AD72A80129;
        Thu,  8 Apr 2021 21:37:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Lyy4U4Z1";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RO5U8ZeUbdOOI4u2Dp1Vd5W9plcwUde5sxE90LEO1eAukxJ8bBaRQrtkw1dMV/P2RFRuagcKUjsBWE9Nc8Uh8Aa/AR5flbt7QH+QAbXXf9zCkeQ01u7Ao1O9xFdb/y/MOPozQEYrsPfPADy4yzPZOzXmiINuETX0XUOkgvwX6IE3rQdchE9jW9zHIiE81J1B8f0yVB93FjZbtXa7MWZ5AfjZSuueOrlE+t0t9PQNKFJA0fglHmnLc1KoYd4BLdYfQi9YoSioL3u5RVoJol90XTFxPNfsq231a1lvue2b6r5YHbbTQh0TSNQJb7J9phQv3rptPN51Io3NuxseSDyhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk5N8//1QhDJJMdySEMBw1ui+bvwlVg1Z0fQemXfJCg=;
 b=OxwEyYYhl/6WVFKQdCWHOpoqqQVCG3eTf7tqiJta1zFkswBPat3nEDYDG0GWR/0c2ewLUxHN2NzCoet+8FNfbNkeI/dJ2CqrUSEe5gMYmAXlbAkM54sYGDSRoNUiMAdSJmJ9pYrBayp96Z7OJCUYk2ED7pJSK2zHETE83yk+C2t6R7NTV0aG4QcjmW+HnpsbJEpCPzvEWJkhPOtfi1a9p/Wg8dlnBYrHdnLY0nkIPjd11VX/WiyTgKwEYJKWxYWfsKTJOO96QuPVDbv18A+4ebOY8a3d03SNGXYbZsiy14PR8n1ORjsP/TXlh8PdD1rY0WKsUv6QTkWvyaOy2xywtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk5N8//1QhDJJMdySEMBw1ui+bvwlVg1Z0fQemXfJCg=;
 b=Lyy4U4Z1pGQypzOwdBYI3a6JtKKCwvGOJT6LXVTI1cZCUmWqklaSxZQNA05ZUzZLorEZYMexOqMBU02cIxs9ut7O0/T2/7y5qNejdbuKLMpnOhY2uRfG8rJZHgbosLDMr/xImSqdjveLO6cuWDAi6vHvFhM5MKGbrU4l7xxw39U=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3206.namprd12.prod.outlook.com (2603:10b6:a03:130::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 21:37:53 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4020.018; Thu, 8 Apr 2021
 21:37:53 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: USB network gadget / DWC3 issue
Thread-Topic: USB network gadget / DWC3 issue
Thread-Index: AQHXJWGMSb8EBf7kO0mkR3W2S+2f0qqctZMAgABFgICAABlrAIAEiRiAgAAR4oCAAChFgIAAOFIAgACdRYCAAKT+gIADH/IAgAHHyACAAAP0gIAA3M4AgAIC7oCAAA9XgIAABwUA
Date:   Thu, 8 Apr 2021 21:37:53 +0000
Message-ID: <2b3e1173-cb0d-56e4-9fa3-4fc0f133380d@synopsys.com>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
 <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
 <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
 <797f97b8-6558-35c4-2dc5-9deacdf0ba4d@synopsys.com>
 <ff57b956-a777-3dd6-80ca-4e9afd33ab96@gmail.com>
 <6b3a28eb-7809-d319-d58d-520c1c7fa5d2@synopsys.com>
 <4a0869c9-6b71-5acd-e670-e4c06b44d62d@gmail.com>
 <5d8459ae-4a4c-7371-6b0a-ed817e898168@gmail.com>
 <7963d464-44c1-f580-398c-775c694664cb@gmail.com>
 <f24b6e66-1fdc-06f0-97b4-f2a9be3eef6b@synopsys.com>
 <e50114a1-f7d3-ad62-fe6d-6b8bb2b1203f@synopsys.com>
 <CAHp75Vf+3aeq8kb2oOO-qjC5jOE7ZWUgs2=MOa4mseOG08c+vA@mail.gmail.com>
 <bdc5093b-0673-ff3b-fef9-4577aa3549a9@gmail.com>
 <32951a5f-062b-abc9-43a4-0245175423c9@synopsys.com>
In-Reply-To: <32951a5f-062b-abc9-43a4-0245175423c9@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8806464-79ab-4407-3728-08d8fad69121
x-ms-traffictypediagnostic: BYAPR12MB3206:
x-microsoft-antispam-prvs: <BYAPR12MB32068D088DC2552CC31311B0AA749@BYAPR12MB3206.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vZ8C53+ulC6eVqvTV+HHXSmSxcfBroTrUlLtxPc/9wXSUzvfGL+0lMa+M0w6VpDBmaTMjDiSedlEWuR8ny91BglXBDsMkuYeoBTizaf1g0gDe8rbMvcACqXr2GeWgoheoSJu/XnULuWU8VDX72/bZcROUQ0HfztFrKwysdClpwJTm5jnmNF5FlvkE/e7woySHBcbhicejeZLvbwAo+n1clCkFpLpITNQvGCkcJzo6InjpyaAObilvNAFR0Ox2d0/r3FzSdq4xOltP9VoUEd4xbu4aJVGJOMNnndhkL0GmA89DAeXPxkHTaxS82Fi5O7XudJdfdSydXhB6w86CMqKtJcwsF1Fdk6MW7Kh9AFYXSh1mAPot8cHYJGQQGMI90pCTM/+6zzsZ9j04qsU0THfNUGnYvoOYAB/uyrvnIH/tC9vlxG/8Xc9fS7E6kAajuaQEsiCRoqxVRM0EPRxzbbjaErEtkUQc/w1Gw8WWl5Wnimkr5Q3CApe8ekxF0l27Bon3n4orkhfvz2qVUf2wmcd1YJ7oCpFXrtTg/c181S2ZSMFtpZbbEtaOoB98N+zVN+vc/PgU2gQ0KD4Rr4x7GASgupmOWtDqYezVRrVYeULCrnP77B46hFTomAzf58GzL1u2COPmB8aANGhV7FVoMobqhxBo4G6jvX011PNmTOPEe1kpUy3utiDQhD+wrm2E4ZOktx6wREy5K/XS+OyARSwXQJ+KdFXBFwZg/W9ATgmf7Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(366004)(136003)(346002)(396003)(53546011)(2906002)(6506007)(316002)(31686004)(2616005)(6486002)(186003)(8676002)(6512007)(478600001)(26005)(8936002)(5660300002)(76116006)(66446008)(4326008)(31696002)(66946007)(66476007)(66556008)(83380400001)(64756008)(86362001)(38100700001)(110136005)(71200400001)(36756003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?a0w1RHZnMlZuNG8wNFVONXEzaC9SZXQrZ2t5V3FTMkR0L3JxZTQyNFBveG5B?=
 =?utf-8?B?N1VWZHlnMVppTzZ2Ulk5enlKSmE3UllRUXhjNEQ3ZzhGdSs5QUFmTm84VTdS?=
 =?utf-8?B?cTBzSTlYdjBFWmhsNnRMYmd4b09EVERRT01QMndpT3FndFpEY0hBWEJ4cEcr?=
 =?utf-8?B?VWJXRzUzSEtHTjZpZExuQ2RqV2g5bXVYajlpWTEvNVp0eG1hdFVtbTlkeElk?=
 =?utf-8?B?YUVGV1kzY2xRT3YvVy9XbHRGRG1wdGFodDBtQklsa3dtR0VTZ25xbXk3S0pm?=
 =?utf-8?B?TVpVUHBzTEIxZ1RzRU5HV3pqdlFyTFVVUTk2MDVpL3JYVHl2REViQmZoSWlW?=
 =?utf-8?B?akhibVRnSDV6c2ZSbTNkVGY4MWxNRlQ1TGQveEJ1ODk0Tm1UV2dvZ2ZPQlZw?=
 =?utf-8?B?SlRISy9lUE1Vdk9BZnlHTUx0ZCtrL1JVeGpnRGVXbndPb0VMUkV0RDljVFlG?=
 =?utf-8?B?SnJXWlFVY1RVTGJjeEJha21ta0lsVVlZRDJPU2xhZ05kNS9NQ1dMbFZBTlo0?=
 =?utf-8?B?NW1OOVh0Kzg4bVI2U05SVE5Zb1VERjBjRGZwUFEyS1BaT2F3N09ubWJLbEhI?=
 =?utf-8?B?YzFLOW4yVnVBemcybWdCRklsYkR3OFNaU1pacmlHSzRDZ1ZtRTRIRnkrNXFZ?=
 =?utf-8?B?Zkt0TklzaWlhRS9Ecld1dGhCSDRoUGhQY1JrSHltbUxVTDNtUW9aVXlWTTV4?=
 =?utf-8?B?cDRJdUh2OFZ5akw3THJ5dEdQeU11V0MveUNZajhOMUpLa2pXVk1Jamh4eW5l?=
 =?utf-8?B?K3B3UW1zUlE1QjF1VEtBbERPd3Q2NUlFMnBNb0dIY01MTENlUVJRRGhqcENV?=
 =?utf-8?B?Zm9OSWwwekVKU2I0Z2s4WUwrRzZiSldFNm1uT05DaHVuUVp5VWl1RVBXN1RJ?=
 =?utf-8?B?S1IwaEV3ei9Gb1YyQ0sydjUvL0ZJRkFTUEk2czZWVllNUmJoVjM2cnpGUnVT?=
 =?utf-8?B?cFNIRDdnZHVFSTBGVTNucnFlanN5Y0dBNTJMVnRlYkxjRURlc0pLV21YZUs2?=
 =?utf-8?B?WWRraUk4ODQ0dUNORzdMOE1iTGZydHVjTWFLMW5pWnd4ZHlIdFhQVGxXdjhn?=
 =?utf-8?B?Qm9OUy9CZ1hTN0dWQmhvYVZvYlBzV01Kd29NOFBLVzUzWHBhTm5ZMlhld25H?=
 =?utf-8?B?bTJGT2NBWlQ5Q3QxZFQ4cSt3ZDV2RFRncFA3UHNmUU1OeDdoc29WbXJZSVQ4?=
 =?utf-8?B?NmhjTWZqY01GNFp5SHVub3JpdllwYXNLUlV6bUtsTVA1NzdSL1pWWFFhcEN6?=
 =?utf-8?B?d0NuRkUvMTBKc0xtN25xTHpiK05jbWNaT3NLVUdlUkFEekxOSEoyYm12U2Ry?=
 =?utf-8?B?aWhIa01LVll5QXY0eHJSbE05Sm5CSzhqSnRkaXFkdW5nTWEyMXYrd3hsaE1r?=
 =?utf-8?B?NmltZTlCOWh6aGV6Yk5IazRrbTFQR3BnUzRsWE5Zc1c2QUpwTkk5WWhHelVj?=
 =?utf-8?B?YzBzbXlUdGRjbWdlUFloVG9SWFI4bmp3a3VhbmcrVXZEbUZlTnRmQ29KQjNH?=
 =?utf-8?B?aWdMeTh4SnhWZzBiWHZvUEFpODdxOUFta2ZFRTlzUU5Gc3R1UWtBejNMWUda?=
 =?utf-8?B?SFpwMko4QUJWVlNZY3RHUjNQVjdYM3dWbXdoK3dSRUVhR3dnczVUTFNZUit0?=
 =?utf-8?B?cTBHeVRUdnVCekxxMG1tMWQzdUVMMi9xbVZKeHF0cjA1WG9GcVZHbmtNOGsw?=
 =?utf-8?B?QmYzTmcvbXpwTGIrQ1Q4eUtWdzZkMXZLeWY5d2N3WFhHcjU0VVNVQkFuRXNp?=
 =?utf-8?Q?B2f4pJ4PFpPhS8mAXbQzOXSF53eraBEliq5mrhj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3109BBAC0854B468D9E41AC8B6DEEDD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8806464-79ab-4407-3728-08d8fad69121
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 21:37:53.5534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oVceEwSoQrz9hjJAl9P/PRHW5TQdP2mLSoGw9pvKteClqX51py6wmDewUNUSnjhAW6TQRODOBSlgR5sZ3vABMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3206
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBGZXJyeSBUb3RoIHdyb3RlOg0KPj4gT3AgMDctMDQtMjAy
MSBvbSAxNTozNCBzY2hyZWVmIEFuZHkgU2hldmNoZW5rbzoNCj4+PiBPbiBXZWQsIEFwciA3LCAy
MDIxIGF0IDM6MjQgQU0gVGhpbmggTmd1eWVuDQo+Pj4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5j
b20+IHdyb3RlOg0KPj4+PiBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4gLi4uDQo+Pj4NCj4+Pj4+
IEkgdG9vayBhIGxvb2sgYXQgdGhlICJiYWQiIGFuZCAibm9ybWFsIiB0cmFjZXBvaW50cy4gVGhl
cmUgYXJlIGEgZmV3DQo+Pj4+PiAxLXNlY29uZCBkZWxheXMgd2hlcmUgdGhlIGhvc3QgdHJpZWQg
dG8gYnJpbmcgdGhlIGRldmljZSBiYWNrIGFuZA0KPj4+Pj4gcmVzdW1lIGZyb20gbG93IHBvd2Vy
Og0KPj4+Pj4NCj4+Pj4+IMKgwqDCoMKgwqAga3NvZnRpcnFkLzAtMTDCoMKgwqDCoMKgIFswMDBd
IGQucy7CoMKgIDIzMS41MDE4MDg6DQo+Pj4+PiBkd2MzX2dhZGdldF9lcF9jbWQ6IGVwM2luOiBj
bWQgJ1VwZGF0ZSBUcmFuc2ZlcicgWzYwMDA3XSBwYXJhbXMNCj4+Pj4+IDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwIC0tPiBzdGF0dXM6IFN1Y2Nlc3NmdWwNCj4+Pj4+IMKgwqDCoMKgwqAga3Nv
ZnRpcnFkLzAtMTDCoMKgwqDCoMKgIFswMDBdIGQucy7CoMKgIDIzMS41MDE4MDk6IGR3YzNfcmVh
ZGw6IGFkZHINCj4+Pj4+IDAwMDAwMDAwZDY4ZWNkMzYgdmFsdWUgMDAwMGE2MTANCj4+Pj4+IMKg
wqDCoMKgwqAga3NvZnRpcnFkLzAtMTDCoMKgwqDCoMKgIFswMDBdIGQucy7CoMKgIDIzMS41MDE4
MTA6IGR3YzNfd3JpdGVsOiBhZGRyDQo+Pj4+PiAwMDAwMDAwMGQ2OGVjZDM2IHZhbHVlIDAwMDBh
NzEwDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8aWRsZT4tMMKgwqDCoMKgwqDCoCBbMDAw
XSBkLmguwqDCoCAyMzIuNDk5NDE4OiBkd2MzX3JlYWRsOiBhZGRyDQo+Pj4+PiAwMDAwMDAwMGEx
NWUwZTM1IHZhbHVlIDAwMDAwMDM0DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8aWRsZT4t
MMKgwqDCoMKgwqDCoCBbMDAwXSBkLmguwqDCoCAyMzIuNDk5NDIzOiBkd2MzX3JlYWRsOiBhZGRy
DQo+Pj4+PiAwMDAwMDAwMGJiNjdiNTg1IHZhbHVlIDAwMDAxMDAwDQo+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA8aWRsZT4tMMKgwqDCoMKgwqDCoCBbMDAwXSBkLmguwqDCoCAyMzIuNDk5NDI1
OiBkd2MzX3dyaXRlbDogYWRkcg0KPj4+Pj4gMDAwMDAwMDBiYjY3YjU4NSB2YWx1ZSA4MDAwMTAw
MA0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGlkbGU+LTDCoMKgwqDCoMKgwqAgWzAwMF0g
ZC5oLsKgwqAgMjMyLjQ5OTQyNzogZHdjM193cml0ZWw6IGFkZHINCj4+Pj4+IDAwMDAwMDAwYTE1
ZTBlMzUgdmFsdWUgMDAwMDAwMzQNCj4+Pj4+IMKgwqDCoMKgwqAgaXJxLzE1LWR3YzMtNDc2wqDC
oMKgwqAgWzAwMF0gZC4uLsKgwqAgMjMyLjQ5OTQ4MDogZHdjM19ldmVudDogZXZlbnQNCj4+Pj4+
ICgwMDAwMDQwMSk6IFdha2VVcCBbVTBdDQo+Pj4+PiDCoMKgwqDCoMKgIGlycS8xNS1kd2MzLTQ3
NsKgwqDCoMKgIFswMDBdIGQuLi7CoMKgIDIzMi40OTk0OTI6IGR3YzNfZXZlbnQ6IGV2ZW50DQo+
Pj4+PiAoMDAwMDA0MDEpOiBXYWtlVXAgW1UwXQ0KPj4+Pj4gwqDCoMKgwqDCoCBpcnEvMTUtZHdj
My00NzbCoMKgwqDCoCBbMDAwXSBkLi4uwqDCoCAyMzIuNDk5NDk2OiBkd2MzX2V2ZW50OiBldmVu
dA0KPj4+Pj4gKDAwMDA2MDg4KTogZXAyb3V0OiBUcmFuc2ZlciBJbiBQcm9ncmVzcyBbMF0gKFNJ
bSkNCj4+Pj4+IMKgwqDCoMKgwqAgaXJxLzE1LWR3YzMtNDc2wqDCoMKgwqAgWzAwMF0gZC4uLsKg
wqAgMjMyLjQ5OTUwMToNCj4+Pj4+IGR3YzNfY29tcGxldGVfdHJiOiBlcDJvdXQ6IHRyYiAwMDAw
MDAwMGM3Y2U1MjRlIChFMTc5OkQxNzApIGJ1Zg0KPj4+Pj4gMDAwMDAwMDAwODI3MzU0MCBzaXpl
IDE0NjMgY3RybCAwMDAwMDgxOCAoaGxjUzpzQzpub3JtYWwpDQo+Pj4+PiDCoMKgwqDCoMKgIGly
cS8xNS1kd2MzLTQ3NsKgwqDCoMKgIFswMDBdIGQuLi7CoMKgIDIzMi40OTk1MTg6DQo+Pj4+PiBk
d2MzX2dhZGdldF9naXZlYmFjazogZXAyb3V0OiByZXEgMDAwMDAwMDAxMmUyOTZjZiBsZW5ndGgg
NzMvMTUzNg0KPj4+Pj4genNJID09PiAwDQo+Pj4+PiDCoMKgwqDCoMKgIGlycS8xNS1kd2MzLTQ3
NsKgwqDCoMKgIFswMDBdIGQuLi7CoMKgIDIzMi40OTk1NjI6IGR3YzNfZXBfcXVldWU6DQo+Pj4+
PiBlcDJvdXQ6IHJlcSAwMDAwMDAwMDEyZTI5NmNmIGxlbmd0aCAwLzE1MzYgenNJID09PiAtMTE1
DQo+Pj4+PiDCoMKgwqDCoMKgIGlycS8xNS1kd2MzLTQ3NsKgwqDCoMKgIFswMDBdIGQuLi7CoMKg
IDIzMi40OTk2MDE6IGR3YzNfcHJlcGFyZV90cmI6DQo+Pj4+PiBlcDJvdXQ6IHRyYiAwMDAwMDAw
MDhjMDgzNzc3IChFMTgwOkQxNzApIGJ1ZiAwMDAwMDAwMDAyYTdlOWMwIHNpemUNCj4+Pj4+IDE1
MzYgY3RybCAwMDAwMDgxOSAoSGxjUzpzQzpub3JtYWwpDQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IFlv
dXIgZGV2aWNlIGlzIG9wZXJhdGluZyBpbiBoaWdoc3BlZWQgcmlnaHQ/IFRyeSB0byB0dXJuIG9m
ZiBMUE0gZnJvbQ0KPj4+Pj4gaG9zdCBhbmQgc2VlIGlmIHRoYXQgaGVscHMgd2l0aCB0aGUgc3Bl
ZWQgdGhyb3R0bGluZyBpc3N1ZS4gKElmIHlvdSdyZQ0KPj4+Pj4gdXNpbmcgeEhDSSBob3N0LCB0
aGVuIHNldCBYSENJX0hXX0xQTV9ESVNBQkxFKS4gSXQgbWF5IGFsc28gaGVscCB3aXRoDQo+Pj4+
PiB0aGUgY29ubmVjdGlvbiBpc3N1ZSB5b3Ugc2F3Lg0KPj4+Pj4NCj4+Pj4+IEl0IHNlZW1zIHRv
IGJlIGFuIGlzc3VlIGZyb20gaG9zdCwgYnV0IEkgY2FuJ3QgdGVsbCBmb3Igc3VyZSB1bmxlc3Mg
d2UNCj4+Pj4+IGhhdmUgc29tZSBVU0IgdHJhZmZpYyBhbmFseXplciB0aGF0IHNob3dzIHdoYXQn
cyBnb2luZyBvbi4gSGF2ZSB5b3UNCj4+Pj4+IHRyaWVkIGRpZmZlcmVudCBob3N0cz8NCj4+Pj4+
DQo+Pj4+IFlvdSBjYW4gYWxzbyBkaXNhYmxlIExQTSBmcm9tIHRoZSBnYWRnZXQgc2lkZSBieSBz
ZXR0aW5nDQo+Pj4+IGR3Yy0+ZGlzX2VuYmxzbHBtX3F1aXJrLg0KPj4+IEZlcnJ5LCBpdCBjYW4g
YmUgZG9uZSBieSBhZGRpbmcgYSBjb3JyZXNwb25kaW5nIHByb3BlcnR5IHRvIHRoZQ0KPj4+IGR3
YzMtcGNpLmMgZm9yIEludGVsIE1lcnJpZmllbGQgcGxhdGZvcm0uIEknbGwgY2hlY2sgYWxzbyBm
b3IgbXkgY2FzZQ0KPj4+IGFuZCBwZXJoYXBzIEkgY2FuIGNvbGxlY3Qgc29tZSB0cmFjZXMgaW4g
bXkgY2FzZSBsYXRlciBvbiB3aGVuIEkgaGF2ZQ0KPj4+IG1vcmUgdGltZSBmb3IgdGhhdC4NCj4+
Pg0KPj4gT2sgdGhhbmtzIGFsbC4gSGVyZSBpcyB3aGF0IEkgdHJpZWQ6DQo+Pg0KPj4gQW5vdGhl
ciBjb21wdXRlciAoQWNlciA3MjBQIGJyYWlud2FzaGVkIGNocm9tZWJvb2spLCBJIHRyaWVkIGJv
dGggZnVsbA0KPj4gc3BlZWQgYW5kIGhpZ2ggc3BlZWQuIFN0aWxsIHRocm90dGxpbmcgYnV0IGxl
c3MgYmFkLg0KPj4NCj4+IFRoZW4gb24gZGVza3RvcCwgd2l0aCBFZGlzb24ga2VybmVsIDUuMTIt
cmM1IGFzIGFib3ZlICsgdGhpcyBwYXRjaDoNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9kd2MzLXBjaS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jDQo+Pg0KPj4g
aW5kZXggNGM1YzY5NzIxMjRhLi5hOTI2OGMwODU4NDAgMTAwNjQ0DQo+Pg0KPj4gLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXBjaS5jDQo+Pg0KPj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXBjaS5jDQo+Pg0KPj4gQEAgLTEyMiw2ICsxMjIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHByb3BlcnR5X2VudHJ5DQo+PiBkd2MzX3BjaV9tcmZsZF9wcm9wZXJ0aWVzW10gPSB7DQo+Pg0K
Pj4gUFJPUEVSVFlfRU5UUllfU1RSSU5HKCJsaW51eCxleHRjb24tbmFtZSIsICJtcmZsZF9iY292
ZV9wd3JzcmMiKSwNCj4+DQo+PiBQUk9QRVJUWV9FTlRSWV9CT09MKCJzbnBzLGRpc191M19zdXNw
aHlfcXVpcmsiKSwNCj4+DQo+PiBQUk9QRVJUWV9FTlRSWV9CT09MKCJzbnBzLGRpc191Ml9zdXNw
aHlfcXVpcmsiKSwNCj4+DQo+PiArIFBST1BFUlRZX0VOVFJZX0JPT0woInNucHMsZGlzX2VuYmxz
bHBtX3F1aXJrIiksDQo+Pg0KPj4gUFJPUEVSVFlfRU5UUllfQk9PTCgibGludXgsc3lzZGV2X2lz
X3BhcmVudCIpLA0KPj4NCj4+IHt9DQo+Pg0KPj4gfTsNCj4+DQo+PiBUaGlzIGZpeGVzIHRoZSB0
aHJvdHRsaW5nIGJ1dCByZXZlYWxzIEkgaGFkIGFjdHVhbGx5IGF0IGxlYXN0IDIgYnVnczoNCj4+
DQo+PiAxKSB0aHJvdHRsaW5nIGR1ZSB0byBMUE0sIHRoaXMgc2VlbXMgc29sdmVkIG5vdywgdGhh
bmtzIHRvIG11Y2ghDQo+IA0KPiBOb3cgdGhhdCB3ZSBjYW4gY29uZmlybSB0aGUgc3BlZWQgdGhy
b3R0bGluZyBpcyByZWxhdGVkIHRvIExQTS4gV2UgY2FuDQo+IHRyeSB0byBleHBlcmltZW50IGZ1
cnRoZXIuIChJTU8sIExQTSBpcyBhbiBpbXBvcnRhbnQgZmVhdHVyZSBhbmQNCj4gdG90YWxseSBk
aXNhYmxpbmcgTFBNIHNlZW1zIGxpa2UgdXNpbmcgYSBzbGVkZ2VoYW1tZXIgdG8gY3JhY2sgYSBu
dXQpDQo+IA0KPiBJIHN1c3BlY3QgdGhhdCB5b3VyIHBoeS9IVyBoYXMgYSBoaWdoZXIgbG93IHBv
d2VyIGV4aXQgbGF0ZW5jeS4gSSBkb24ndA0KPiB0aGluayB5b3UgcHJvdmlkZWQgYW55IEhJUkQg
dGhyZXNob2xkIHByb3BlcnR5IGluIHlvdXIgc2V0dXAgcmlnaHQ/IFNvDQo+IGJ5IGRlZmF1bHQs
IGR3YzMgc2V0cyB0aGUgYmFzZSBsaW5lIEJFU0wgdmFsdWUgdG8gMSAob3IgMTUwdXMpLiBVbmxl
c3MNCj4geW91IGtub3cgd2hhdCB5b3VyIHBoeS9IVyBpcyBjYXBhYmxlIG9mLCB0cnkgdG8gdGVz
dCBhbmQgaW5jcmVhc2UgdGhlDQo+IHJlY29tbWVuZGVkIEJFU0wgdmFsdWUuIFRoZSByYW5nZSBj
YW4gYmUgZnJvbSAwIHRvIDE1IHdoZXJlIDAgaXMgMTUwdXMNCj4gYW5kIDE1IGlzIDEwbXMuIE1h
eWJlIHRyeSA2IChpLmUuIDFtcykuDQo+IA0KDQpDb3JyZWN0aW9uLi4uIDAgaXMgMTI1dXMsIDEg
aXMgMTUwdXMuDQo=
