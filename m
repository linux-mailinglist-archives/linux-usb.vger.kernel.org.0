Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EC43D4E91
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 18:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhGYPYq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 11:24:46 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:37742 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230029AbhGYPYp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Jul 2021 11:24:45 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0ECD040687;
        Sun, 25 Jul 2021 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1627229116; bh=c9nMwujFIv/OEbhX0/IT4DyuXyv79pwXXs+7po/A744=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=WVqyYtW/H19tOIhUG/qEEuxRSam6OuLuVuwyh61SOSCyZuRXMsjuKc5hsCCrqzCZ7
         HWNcWNbOu1MTD4xRcHSuOfm2shL7PXF0MOduI2ZvmTI4uoivBgwGBgA8loOacXRlNs
         3U1HCODZ5YV1zbUz4huYgOXRgXsr9ZcadgnVfuXCdhKFTjD6M+JXmN5rkVHKqJtazP
         QUC6fPTTD7wWp4S0gfYTK0WAVoalIx+ErKTInV/IVJY/F+1/QKevMMX4anYCt7XO22
         PqkbtYkaO2VqZsYs92mF2PGu5ZUpd+zPjF5c+Xs3vdRHvNjJDbLzjMbB9rrFJtwoeE
         RoO4aoykCeOmg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 38B8DA008A;
        Sun, 25 Jul 2021 16:05:14 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7C10280026;
        Sun, 25 Jul 2021 16:05:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="EPjePCL5";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcyxQg1D+fj94vqwf9GyPlfTXRu6QwUJfWSneXk7K5/5UhC2I0PWwx9CfP84Qs8eIKFUCOxo4sfPqc0dFa3gO4zZpGTUudniKU/2I3nbBJByZJ/hmWGLQsLSWeYhPfPURuwkcY643EpjMuzFZ63LSPNIi7S9j+LkZQxtYWo+WoLJslaZ8rvYANOd1LPwxvVyJNsdxOsmIJ21uUF4/I2YXZhMCwKxue+9aEpG0M9uiDJSjx6TvrWF8OyY4lDq26GrCVFvi62aJAK2B7VwdnIUU0r03KBpEv/efUht+us0xSSuy0NV3gZKsWkYbwWQ9m9fim2fjp8HmotCTwjoC5iGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9nMwujFIv/OEbhX0/IT4DyuXyv79pwXXs+7po/A744=;
 b=aVGkjBUT1cbTcN/QatYRK93zCImsjTo77tr7xdgQKP2ZaQhS3KZ/JbfhRyC2pigwQh2u0qQ91Cn8zQqzqx6Wrg5DBh59d+3ZGBg+m73iDL3LejIHiuvWBsc4zPnYPFPheRZ0gT6CouV+qWmYFupkMcTam9hCEk5fzQ/5MfK7KntLyitLoszCVLTykbBFEndT9kTc4757iWcxh+0fFNnedRIw1f0Eq+2Z5GsR17dJXBFeIb6hwNOIaOqP2KGL02awKMF0hsLperAEsAHgCIoisqbt5HO3WvMIsPopDNi/37DRr9rWFZ5ILILDy7uabUsAGG0zY+G6UnWjk29r1vRUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9nMwujFIv/OEbhX0/IT4DyuXyv79pwXXs+7po/A744=;
 b=EPjePCL5Tcym9xYfeHpMZQxe/C2Jd/DXGCTiNGA1kH+xdJiOeUc4T+br9XiFmz+r26m5NXMbDQnFXb1xMyhtQhApdQ8ooknxRuqZN4DgVYdyALDua0QyzmKiuTAM/i0l59T3qRm7fN8+INRl00AUel4cRJc6rkWwqUkX0QoCE10=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Sun, 25 Jul
 2021 16:05:11 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4352.031; Sun, 25 Jul 2021
 16:05:11 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] USB fixes for 5.14-rc3
Thread-Topic: [GIT PULL] USB fixes for 5.14-rc3
Thread-Index: AQHXf9KPagB9MEZbYkWVzShpGEQ9AatT3goA
Date:   Sun, 25 Jul 2021 16:05:11 +0000
Message-ID: <970d93d8-38ec-0ff8-6178-825a0698b2ea@synopsys.com>
References: <YPrX98Lqa1xH8uH7@kroah.com>
In-Reply-To: <YPrX98Lqa1xH8uH7@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3daa1576-1466-4756-5b86-08d94f85fb44
x-ms-traffictypediagnostic: DM4PR12MB5296:
x-microsoft-antispam-prvs: <DM4PR12MB52961CBCAD465D03184B2348A7E79@DM4PR12MB5296.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q+afLFYH77KMoOCQ1EpkYC+utdUt3Zy6om7mHB3+93vR9YQcZqgYFRWWkTVyGILh2VHIAQTpsXBr3FaN8ib647Jkvk8X3fBfyve84uHbX2UiuaOSFC98gNCzhLVERPR6xpqzTCNiMtFFdl8yF/OTCYyTiq8VRW5i2VyYwJfUWSidwTJNb1NTdLBHll3eO8NncCRHDTp++wn7p9Jrfw06ELmQfdvhrwp2KJJAaMuJpYmDTFhNPApUX7KeuVqoCUj7xgfeWOzwIXXKyuyvazbWwk7WPWdQXiuNB/E5DurSHphxkXkPjnYnHvje9hes+k2yaukIs5m7aJNkXOOH7EBs4YnggHpG0To3vPo/uxzm1kGWQppiaRKwEMKRuDl7I3pRowmPhnMemC9MWs3O7Z+ur8lm0Jw8PkVa+QMP9tBA19UxE3JmjEddDr3hl0T/stq1MPW9ZbDYtQqQxffnkQksskwldEfXyy9kRoXegCG3goo0agu/9IoasKpNnbVMI2KTepNPdgQNiVZ8zzg6lE+EcmGYDFbswQYtzviLNEhTolvNtyZVtsy4h2GC1E2PC62Mz2+xMydE8mx511l/v5RtB4GME0GlFIQTy2So2OGxiXB8HFmCj9U+PgEWmWz12m6BQXcbtOTWjlz5oGsQmuZyLBl90l3KpdrULWsdfXvfEUyx1NguyDPLi/x4/lyw/70bj/HPl7Ns1zEYRicJha/E600eua6ufT4jQbW8+yJMBfC4TQuN7V/nD+mr9Zlbgky3T12GJmQh6pFLTgz/07Dz77F4SHR25TXMZnrm4g7o7CPUbq0c25yweot2Op4YY2Lz1ibajq/c7OWxM+3udDYN4+pp3ub+Ouq4zQyfsYcEaKE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39850400004)(396003)(346002)(136003)(376002)(71200400001)(186003)(6916009)(66446008)(66476007)(66556008)(316002)(2616005)(64756008)(66946007)(4326008)(76116006)(91956017)(38100700002)(36756003)(83380400001)(5660300002)(122000001)(31686004)(6512007)(86362001)(2906002)(8936002)(6506007)(966005)(478600001)(8676002)(31696002)(6486002)(26005)(53546011)(43740500002)(45980500001)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTQ2R0FvUWkzUGNKa1kwRkJaR205d25uR0RQKzJqVmJKQWJYeXNvSjhLaFA1?=
 =?utf-8?B?di82amdqeVp1WEFzMVp0d2k2aWRhdUZhT2g0TFV3S0N2SHJTa1RjYlMzc3pt?=
 =?utf-8?B?UGh6ZjZKMy9hUUlnNjZVNjlsTzNEM1ptdTdNMFo1ZXozVG1VNWxTWE1xSVJo?=
 =?utf-8?B?Mmt5dWtFcjJFWE1MVUd6eFFlY2Z3WGNmK3p2UUcxTW1tVlZSaWNjeWVxK01t?=
 =?utf-8?B?enhTQTJMZ2pLdWdTd2lWSVRmb3pjVzBieVlQVWNBMnFsOU9uZE9aeC94aTFq?=
 =?utf-8?B?OHNTKy84WktzZ2ExVTVGdndzblMrTWZJNE1nZnpoaStmcVlGWGlFQXJKRWFK?=
 =?utf-8?B?V0xDUmZEYzE5WW1TK1B1Z2k5WWhwTFpaak56OENyRFZYNGlPdEZjaWd2Y3hr?=
 =?utf-8?B?QlI1aWVXc0w0NmFZc1JlZml1dmxCVHBtdDQwSkRENFdYNHdmb0szdHdGbkpJ?=
 =?utf-8?B?amRsbW02bUs5NnJHR3N3MkpLcVJEd2p4QldhcWdiVVFGRmFuemt0c1JISlc3?=
 =?utf-8?B?UjY1Wkg0WFR6OFNPRnZmR2M1RDBzTlhoLytOcDlIb1BIWTRiczdjcHVVbm9I?=
 =?utf-8?B?Ukh1NnlMTENzSjdrZUxPbS9Qb0dYblVtYXZjeFR4d0VmZ295ZXNTbGVnQVp0?=
 =?utf-8?B?MkRIRnpPbnFzQmREbWhFZWNqbEhYaTRvK0pZMmg3c2VpSmhRYkxHYndUNlM3?=
 =?utf-8?B?UlFzbEpEaHA0Q0NLL1NZT0tJelVSK0plZFBmekhFMnVVL0pReWFseS9kalNq?=
 =?utf-8?B?M0MvZmloZnFDY1pjNEg2K2xJSmNmeUR0NDB6bVJTUmZHcnUzVlBxRGlsU0ts?=
 =?utf-8?B?WXc5SzhaTVdZNElqMTlYVW51V2xxZk9lYXZ4b084dG4ram9uM2hsYVlEU3dv?=
 =?utf-8?B?TWo4ODN1dUpCSEF4dDljOUxURVdDQnNnL2daN2dmRE43Wktxb09VV2hEK29l?=
 =?utf-8?B?bEtWWmU5Nzh5ZTN0U25IZmUyUFNhSjVpQjdOWnd0Y3JKMmRMcnNmSzZFeHpn?=
 =?utf-8?B?Y1hrYS9MMWNBUXVuYk1vV0hQaGVNN0RaK1JPZjZ2aTZpQW1qV2dqbGd0Vko4?=
 =?utf-8?B?bUxnL0Z0MHQrdGNOYitxYkx6U0dsQ1JoQXlrMXhMeVEvSmNreTFlWm03R1dp?=
 =?utf-8?B?cklBNlVFc1U3UGM5TkUraUUxM0NMbEhuQXc4VWNDVE9pTWlaejQvcFk4Y0dz?=
 =?utf-8?B?WXFxSlc4OUZaS242Z2I5aU5GSWdjeW9VMi9wVHlsRW5yekVuUkZSNGxxSGVC?=
 =?utf-8?B?d254RVBqSHJiTEx2U285cTNZblE2OURGZE13NWdGN2hNQlhOTUQ4dFB0ZXlp?=
 =?utf-8?B?bTg3WGJVaWxLNEltWWM2MzN5OSt6VXFzT29GZTJONkE1cndlS295RWdxVVhT?=
 =?utf-8?B?OVBDb0tvd3J3Kzl6TWN0R09tS1BCMU9vOHhyTjVQQkNvd253QXJQWkY2dndz?=
 =?utf-8?B?WkNxTS90TkNSaTNOMWxWZEwzOGZ0RngvOEI1WXBNdExMbVJVRjlwbU9SK2Ex?=
 =?utf-8?B?NEVaMlp1UmVXK252Z1Bsa2JhYzRaZnNWK1NNYUhteGYySFR5N0gzVzJPSmtl?=
 =?utf-8?B?cTZWK2FWTnA5d04vUEJSL2xlZ0tQWkJjTG9KUVJCTW4zbXRacXdMY0RUdkYz?=
 =?utf-8?B?cDlPbDFJMGhienN2dlNlZERUN1VVNzJ0V1NreXpJWUJFU0VnQzIwU24vTjhB?=
 =?utf-8?B?MEYxUzN1T2JWTkExSEdobjZ4MU5xUWl6RytHRTZtUkFXazB2cGo3QVBCY2ZU?=
 =?utf-8?Q?/eXYOqnSp0nMv8D31s=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5D5B39CFF0B42469E07F43657D820D7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3daa1576-1466-4756-5b86-08d94f85fb44
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2021 16:05:11.3665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdOO3zcgNXf9WXZ9hmI13eKY6ppr+0Kx3PYmQlZnwyP6rw/werv5N7F835OX85F+YxRp/Bdn3+ythqMRPAheHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5296
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgIEdyZWcsDQpPbiA3LzIzLzIwMjEgNjo1MyBQTSwgR3JlZyBLSCB3cm90ZToNCj4gVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBlNzNmMGYwZWU3NTQxMTcxZDg5ZjJlMjQ5MTEz
MGM3NzcxYmE1OGQzOg0KPiANCj4gICAgTGludXggNS4xNC1yYzEgKDIwMjEtMDctMTEgMTU6MDc6
NDAgLTA3MDApDQo+IA0KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoN
Cj4gDQo+ICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9n
cmVna2gvdXNiLmdpdCB0YWdzL3VzYi01LjE0LXJjMw0KPiANCj4gZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDFkMWI5N2Q1ZTc2MzZkNzI4OTBhNWJkZDBiNDBlOTgwZTU0YjJkMzQ6DQo+
IA0KPiAgICBNZXJnZSB0YWcgJ3VzYi1zZXJpYWwtNS4xNC1yYzMnIG9mIGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9qb2hhbi91c2Itc2VyaWFsX187ISFBNEYyUjlHX3BnIU1KOHFZUVpFU2ZBNlNBRGZrYktU
T3ZMcFBVSVdqOXJDMGxTRURqcXJMUEVKamZpdVdQQ1dnelUwWWlfVmI3d0M3SjNQSndkWCQgIGlu
dG8gdXNiLWxpbnVzICgyMDIxLTA3LTIyIDIwOjUxOjE0ICswMjAwKQ0KPiANCj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiBVU0IgZml4ZXMgZm9yIDUuMTQtcmMzDQo+IA0KPiBIZXJlIGFyZSBzb21lIFVTQiBmaXhlcyBm
b3IgNS4xNC1yYzMgdG8gcmVzb2x2ZSBhIGJ1bmNoIG9mIHRpbnkgcHJvYmxlbXMNCj4gcmVwb3J0
ZWQuICBJbmNsdWRlZCBpbiBoZXJlIGFyZToNCj4gCS0gZHRzaSByZXZlcnQgdG8gcmVzb2x2ZSBh
IHByb2JsZW0gd2hpY2ggYnJva2UgYW5kcm9pZCBzeXN0ZW1zDQo+IAkgIHRoYXQgcmVsaWVkIG9u
IHRoZSBkdHMgbmFtZSB0byBmaW5kIHRoZSBVU0IgY29udHJvbGxlciBkZXZpY2UuDQo+IAkgIFBl
b3BsZSBhcmUgc3RpbGwgd29ya2luZyBvdXQgdGhlICJyZWFsIiBzb2x1dGlvbiBmb3IgdGhpcywg
YnV0DQo+IAkgIGZvciBub3cgdGhlIHJldmVydCBpcyBuZWVkZWQuDQo+IAktIGNvcmUgVVNCIGZp
eCBmb3IgcGlwZSBjYWxjdWxhdGlvbiBmb3VuZCBieSBzeXpib3QNCj4gCS0gdHlwZWMgZml4ZXMN
Cj4gCS0gZ2FkZ2V0IGRyaXZlciBmaXhlcw0KPiAJLSBuZXcgdXNiLXNlcmlhbCBkZXZpY2UgaWRz
DQo+IAktIG5ldyBVU0IgcXVpcmtzDQo+IAktIHhoY2kgZml4ZXMNCj4gCS0gdXNiIGh1YiBmaXhl
cyBmb3IgcG93ZXIgbWFuYWdlbWVudCBpc3N1ZXMgcmVwb3J0ZWQNCj4gCS0gb3RoZXIgdGlueSBm
aXhlcw0KPiANCj4gQWxsIGhhdmUgYmVlbiBpbiBsaW51eC1uZXh0IHdpdGggbm8gcmVwb3J0ZWQg
cHJvYmxlbXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiANCg0KDQo+IA0KPiBNYXJlayBTenlwcm93c2tpICgx
KToNCj4gICAgICAgIHVzYjogZHdjMjogU2tpcCBjbG9jayBnYXRpbmcgb24gU2Ftc3VuZyBTb0Nz
DQo+IA0KDQpJIGRpZG4ndCBBQ0sgdGhpcyBwYXRjaC4gTWUgYW5kIE1hcmVrIFN6eXByb3dza2kg
YWdyZWVkIHRvIGRpc2N1c3MgDQpkZXRhaWxzIG9mIHRoaXMgcGF0Y2ggYWZ0ZXIgaGUgd2lsbCBi
YWNrIGZyb20gdmFjYXRpb24gYWZ0ZXIgQXVndXN0IDIuDQoNClRoYW5rcywNCk1pbmFzDQoNCg0K
