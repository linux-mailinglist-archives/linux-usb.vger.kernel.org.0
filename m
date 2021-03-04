Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808DD32DDE4
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 00:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbhCDXcp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 18:32:45 -0500
Received: from outbound-ip24b.ess.barracuda.com ([209.222.82.221]:49488 "EHLO
        outbound-ip24b.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232030AbhCDXcp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 18:32:45 -0500
X-Greylist: delayed 2017 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Mar 2021 18:32:44 EST
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2051.outbound.protection.outlook.com [104.47.36.51]) by mx-outbound18-57.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 04 Mar 2021 23:32:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImLs6iYAo9Hc19RTG3F44l9Zpb5oODLL3FeuDYpbp1k6vETfOt/3Oe0SqQu/eimq3GSSKpNk5aHMalouek0FwdHxtdpQ4BrHzwL/MU7ix9CbhWfIBnpvrgmTZ/F8a6u4iDP1E69fHJU6bY+fRegTZ9YKprWrAPDgYNOO+tVYFtF5gAfCnzlYykzvjbIqsE3PkaVhD8Bms6sHfTW2B7bIBLLDNXjejj3DS2roGHBDNEtsMhRlTaAAx9ZUcstLsHRvOBExFtCRhABk4Ii1NY6ma91tY8YC6RCGS+CE/fApaaiyXF8XG3jWY1EQihcG7a1aHNn7W+vqqNhs8upk7ILivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/EL4OUSRSy1XcOgYEQgbV/rSeGR7VxA+zYEtFncAp8=;
 b=HrJSm0cWzueP59hV6Eal8KGs7Lx+mLtvHDAnidvFY7gS4RzkiW2z6la9eWv7uF4Ev3EW0FIHP10sBagL2u1h7XQwpVZZeQPjoZqEpVZm/S5zYZfax4wG+LSUxeIaehDT8rSh9L0tFbUJWRza7cDKciqbiZZeWmpAhe5tkO3+xwf20Wife4rheIExFE7JQ2bcsuExccw5uANcE37ouo4tyEaSq5TGFGe6qko+O9CJ9YHScof8eq2wst7bAHvyTDvREMw7ki5MrDZk18uyjTYhe0uzJtGUHDX3PHGEGARmZGgkLXImqU5ktYbzxqQJRaa/a9GXkPIAJtBb9cBimyVIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/EL4OUSRSy1XcOgYEQgbV/rSeGR7VxA+zYEtFncAp8=;
 b=JqWgmus17qxfGvjTOrPNCmOe2G8apP0m+uJrel5lGk4gYsQdqunXcSpD0KSUjBESTiLjtHcqONCNl0vN1wL6jraQVHctF4/i4NKcHQNAnh7xTHIVy0Q5rnoUDk0VacsgwbPT2cbEvri7LjWy8NL4Adl3sn77BLaWK+/UjJg/6XE=
Received: from BN8PR10MB3698.namprd10.prod.outlook.com (2603:10b6:408:ae::22)
 by BN6PR10MB1908.namprd10.prod.outlook.com (2603:10b6:404:106::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.24; Thu, 4 Mar
 2021 22:59:02 +0000
Received: from BN8PR10MB3698.namprd10.prod.outlook.com
 ([fe80::15a3:caf6:16a9:35a5]) by BN8PR10MB3698.namprd10.prod.outlook.com
 ([fe80::15a3:caf6:16a9:35a5%7]) with mapi id 15.20.3890.031; Thu, 4 Mar 2021
 22:59:02 +0000
From:   "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>
To:     "oneukum@suse.com" <oneukum@suse.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: cdc-acm cooldown + Cisco 2960-X = kernel warning + dead USB
Thread-Topic: cdc-acm cooldown + Cisco 2960-X = kernel warning + dead USB
Thread-Index: AQHXEUVE10rvB6LegkO+mDb2t9kGFA==
Date:   Thu, 4 Mar 2021 22:59:02 +0000
Message-ID: <BN8PR10MB36989D7DC6402FDB1256ADAAE8979@BN8PR10MB3698.namprd10.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=digi.com;
x-originating-ip: [158.140.192.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 135500fe-1fb0-48c5-7ed7-08d8df611ab7
x-ms-traffictypediagnostic: BN6PR10MB1908:
x-microsoft-antispam-prvs: <BN6PR10MB1908746C69BFA469AFDB7C20E8979@BN6PR10MB1908.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ztpJyXEF2kZIaupZ5mDoeKatGg9ETk9QMHteb3lkq1CbPBTAePw4+Px6jEuctMljgIRkDsRSZtA5rmfaPcxDdP7PSRjRtzl/JlTmF6gSxFrfys7/JrXgzTiz4RFSv21m4dTrKiLp6Qlty6F6wLot6t+z8xF9O9xv7gu2de3tHfkDsJeMsx2kQIZG9QMcNN08o+EvFZbBW0uj8CxYpPAcNBEgCU5I4X6mzzbwlAa1p+V5Ox5/TkGCJPKi3hId1+535cz6UqOo1QlpwPYF9uWCIhXOPsewRjoEbQhy/XM0sqrAe3BOaPU8U3F3cttnO1J0evi+oiOTA6OCjzHniQ7uGJmOTbIn78NWAJI8Oo4jb8BxjFIDdC1Fhye83bJnUV3B9jA1YSJFxwWZk/SeAQGhleB8Zk88Hg5dZgAGZf21lSMDn36HcUf7zFC7ZdzjGXR7MgmF6RcKwQVU0zj/jRM6jtYw9ScSsd8eBLOawJMIQMKKvMX4LNAO7dFrA6CEQt459D7Iu3YfqPWOdR/RON9FKg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3698.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(45080400002)(5660300002)(26005)(33656002)(8676002)(86362001)(83380400001)(7696005)(52536014)(8936002)(71200400001)(2906002)(9686003)(55016002)(6506007)(316002)(478600001)(6916009)(64756008)(66946007)(76116006)(66556008)(66476007)(91956017)(66446008)(186003)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SnZJeloyUmZjZkxvcEg1Z2FqZEQ2YnJpRXFQMHlFVDNiNWhaNDFrZko3SVE2?=
 =?utf-8?B?ak9RWHhPdHlGQkJ3bUpVZ2JTK3U0RVpjQVVCTE9hRi9XRGZvOG1ydStwRnZv?=
 =?utf-8?B?KytydU9HU0xXeUhKR0JPbUEyZWMvdFVLN0NmNC9sWFhrNlkxV3pTNXV5U21v?=
 =?utf-8?B?TFlvcW9OWjI1RjlOUllCbzRDZEttOVIxbXRRdzJLS2pyNnIxY01VQWhKT1k1?=
 =?utf-8?B?cjhwTjFyN3BpOExJVzB4KytYWUFpbm5wKy9xL0lOU3VrMW04ZW94b1N2a01k?=
 =?utf-8?B?NXlacnprUmhwSnlnZFRtRWMrTUVBOC8vREM2TDNDeW90ejhNL2VqbzdaMVZQ?=
 =?utf-8?B?aU9pelBJYVpUVmdmd1ZLbWJyeWxpVnhSRk1iZ3ZVWk5MNmhEL2ZBS3d0Zisz?=
 =?utf-8?B?VExGeStGdmZnOGdRb3NLUUhySVpReGZiL25BeWxYc1BCZGJ1ekJFT1NJYUNp?=
 =?utf-8?B?SElOWEJFTWdiQmxQYkNlRFdJdmF6TUt5dVBnM0FiUzNreGtMcnBpZlpXNGQz?=
 =?utf-8?B?VFNibHlVcTNHUUNXUjh6KyttWGMyRkpMQm11MWgrbTloUmtDUU5nYjBxUDhl?=
 =?utf-8?B?SkRrRmRHMGRwSWkxcTlQcExyYWI2aklwcDEwUkQzazFhOHpQWVdwQXFxd2pJ?=
 =?utf-8?B?d0s3aWpISGdPTEVUcGtDeHVueUtZNTZrVmVFS1lqekEwdGk2dHNtVUFYREdZ?=
 =?utf-8?B?T3ZjdG15ZGxUT0gwaTNmcGFpTVhyWEdTUDhVaUMyOHBSSUdTMnRtTmZ1UjNy?=
 =?utf-8?B?WGF5aG4vdlZSUFlrb3h1OElzckV3WndLdkNlT0tZUDIyYys4Yk43Y2o0TUxL?=
 =?utf-8?B?bmNvM21DTnBNZng3OVRiZHZwSkFQaTBtTlc5WHVKczhNVFE5eUNvL2c5UFFD?=
 =?utf-8?B?bVg2WmpnbUNiTENJQU5nZjMwQUlFaVo3QUtnOHNtVXpmREh3MEhXK3E2WHBt?=
 =?utf-8?B?TE5aTTNnLzVQaDFvZ2c2REFtWEpEY0VodmVjLys1WWtGQWVDRmdGcm1id08x?=
 =?utf-8?B?YThCUFd4K3N1WDNLSnRuKzNNMkZ6NlpEYWFNVzRkejlTemFmcU1OajFjdTIr?=
 =?utf-8?B?ektSWGVPWnhVUmVXbVhBTndxQ2Y3eW8rUzl5VXBJQnpPTStqS1FMeElxZ1BQ?=
 =?utf-8?B?MlhUbTR6bzNwS244QnoweXhCUktzTHJxRkFtV21EOTMxSVNMUktlMEZyQkE5?=
 =?utf-8?B?OHVUQUJSSlJudnJLRnZVZFJDV05xMlJzQ1ExQ1RjYVpnQnZXNlVIdXB2NmY0?=
 =?utf-8?B?OFg4cXRLL1QvM2NHeVJLSDQ5SWdQWnVVdFhwUHlIQXpGRTd6SUR3QWRIdGpJ?=
 =?utf-8?B?Unpia0Z1OGlOVWVpTHl6bGNFSlEvK3BxWnc1ODlRUENlU2dvZWZTWlZTejFa?=
 =?utf-8?B?QkxUejJQZnFERnBQMytiQWNuVGwrdW5uL1RtN0xKZjloUmV4Skp1R21vbGlR?=
 =?utf-8?B?RE13V1RydUZ0VWorMThPVWx2QTUzRGxTZDFyM0xuODZ1aTgxWkxXSHF1eXR6?=
 =?utf-8?B?MFZBKzViQlE1elFwaEk2WWlXb1dUUk5PVnkxeW5SdHlDc1Bxajh3L1J4dVZN?=
 =?utf-8?B?YXVDYXRDU0ZsOXRWYytyRTNYNGhuUFlQbVB4RjVSYnhyK1V3K1RMdW1GS0U5?=
 =?utf-8?B?dHhZbHZVbFpGd2paU1lPc2dKWTB2MjFhNktHZy9QWUpCS2ozL0QrUzB4SWtV?=
 =?utf-8?B?S3ZqaUg3dHo1R1NEMzd6OWxqOEhzUWRZUUp6ZzNaWUdGb2FCcXphdldKT3RC?=
 =?utf-8?Q?Ebt9sCCBBaXGH1boEE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3698.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135500fe-1fb0-48c5-7ed7-08d8df611ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 22:59:02.3941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VoVfMVLgaabwileGU7LkgFZ5qBZ4TkarpDDxU/fis+UUZbrKJgOZJVue3T704l8JYhUjj9yJJ8t/pLmWJVoo6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1908
X-BESS-ID: 1614900763-104665-18646-8743-1
X-BESS-VER: 2019.1_20210304.2207
X-BESS-Apparent-Source-IP: 104.47.36.51
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.230615 [from 
        cloudscan17-178.us-east-2b.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgZm9sa3MsCgpPcGVuZ2VhciBtYWtlcyBhIGRldmljZSAoT00yMjAwKSB0aGF0IHlvdSdyZSBz
dXBwb3NlZCB0byBwbHVnIGludG8gY29uc29sZXMgaW4gb3JkZXIgdG8gYWNjZXNzIHRoZW0gcmVt
b3RlbHkgYnV0IHRoZSBDaXNjbyAyOTYwLVggaXMgY2F1c2luZyB1cyBncmllZi4gV2UgY2FuIHRy
aXZpYWxseSBicmVhayBvdXIgZGV2aWNlIGluIGp1c3QgMyBzdGVwcy4KCjEuIENvbm5lY3QgdGhl
IENpc2NvIDI5NjAtWCBjb25zb2xlLgoyLiAoUmUpYm9vdCBvdXIgZGV2aWNlLgozLiBPcGVuIHRo
ZSBDaXNjbydzIGNvbnNvbGUgZGV2aWNlICgvZGV2L3R0eUFDTTApIGFuZCB3cml0ZSB0byBpdC4K
CldoZW4gd2Ugd2VyZSB1c2luZyBMaW51eCA1LjIuMzIgdGhpcyB3YXNuJ3QgZmF0YWwuIEl0IHdh
cyBwb3NzaWJsZSB0byBkaXNjb25uZWN0IGFuZCByZWNvbm5lY3QgdGhlIENpc2NvIGFuZCBpdCB3
b3VsZCB3b3JrIGFzIGV4cGVjdGVkLiBUaGUgc2FtZSB3YXMgb2JzZXJ2ZWQgb24gb3VyIG9sZGVy
IGRldmljZXMgdGhhdCBydW4gTGludXggMy4xMCBvbiBBUk0gYW5kIG9uIGEgbGFwdG9wIHJ1bm5p
bmcgbWFjT1MgMTAuMTMuIEJ1dCB3ZSB1cGdyYWRlZCB0byBMaW51eCA1LjQuNjEgYW5kIGl0IGdv
dCBtdWNoIHdvcnNlLiBJIGRpZCBzb21lIGRpZ2dpbmcgYW5kIGl0IHNlZW1zIHRoYXQgdGhlIGNk
Yy1hY20gY29vbGRvd24gY29tbWl0IChmNGQxY2YyZWY4M2NhZWFiMjEyZTg0MmZkMjM4Y2I4MzUz
ZjU5ZmEyKSBpcyB0aGUgY2F1c2UuCgpCZWZvcmUgSSBjb250aW51ZSwgSSBuZWVkIHRvIGFja25v
d2xlZGdlIHRoYXQgdGhlIENpc2NvIDI5NjAtWCBpcyByZWFsbHkgYnJva2VuLiBVbmxpa2UgZXZl
cnkgb3RoZXIgQ2lzY28gY29uc29sZSBJIGNvdWxkIGZpbmQgdG8gdGVzdCB3aXRoLCBpdCBzaG93
cyB1cCBhcyBVU0IgMiByYXRoZXIgdGhhbiBVU0IgMSwgY2F1c2VzIHdhcm5pbmdzIHRvIGJlIHBy
aW50ZWQgYW5kIHNlbmRzIGNvcnJ1cHQgaWRlbnRpdHkgc3RyaW5ncy4KCiAgICB1c2IgMi0xLjE6
IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDYgdXNpbmcgZWhjaS1wY2kKICAgIHVz
YiAyLTEuMTogY29uZmlnIDEgaW50ZXJmYWNlIDAgYWx0c2V0dGluZyAwIGVuZHBvaW50IDB4ODIg
aGFzIGFuIGludmFsaWQgYkludGVydmFsIDI1NSwgY2hhbmdpbmcgdG8gMTEKICAgIHVzYiAyLTEu
MTogY29uZmlnIDEgaW50ZXJmYWNlIDEgYWx0c2V0dGluZyAwIGJ1bGsgZW5kcG9pbnQgMHgxIGhh
cyBpbnZhbGlkIG1heHBhY2tldCA2NAogICAgdXNiIDItMS4xOiBjb25maWcgMSBpbnRlcmZhY2Ug
MSBhbHRzZXR0aW5nIDAgYnVsayBlbmRwb2ludCAweDgxIGhhcyBpbnZhbGlkIG1heHBhY2tldCA2
NAogICAgdXNiIDItMS4xOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MDVhNiwgaWRQ
cm9kdWN0PTAwMDksIGJjZERldmljZT0gMC4wMAogICAgdXNiIDItMS4xOiBOZXcgVVNCIGRldmlj
ZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9MwogICAgdXNiIDItMS4x
OiBQcm9kdWN0OiBD77+9fkLvv71+QH5A4KSyXkQKICAgIHVzYiAyLTEuMTogTWFudWZhY3R1cmVy
OiBD77+9fkLvv71+QH5A4KSyXkQKICAgIHVzYiAyLTEuMTogU2VyaWFsTnVtYmVyOiBD77+9fkLv
v71+QH5A4KSyXkTvv71+QO+/vX5CCiAgICBjZGNfYWNtIDItMS4xOjEuMDogdHR5QUNNMDogVVNC
IEFDTSBkZXZpY2UKCkRlc3BpdGUgdGhpcyB0aG91Z2gsIGl0IGRvZXMgc2VlbSB0byB3b3JrLCBl
eGNlcHQgd2hlbiBpdCBpcyBjb25uZWN0ZWQgZHVyaW5nIGJvb3QuIEluIHRoYXQgY2FzZSwgd2Ug
Z2V0IHRoaXMga2VybmVsIHdhcm5pbmc6CgogICAgLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0t
LS0tLS0tLS0tCiAgICBXQVJOSU5HOiBDUFU6IDMgUElEOiAwIGF0IGtlcm5lbC93b3JrcXVldWUu
YzoxNDc3IF9fcXVldWVfd29yaysweDI1YS8weDMwMAogICAgTW9kdWxlcyBsaW5rZWQgaW46IHh0
X0NUIHh0X3RjcHVkcCBuZl9uYXRfdGZ0cCBuZnRfb2JqcmVmIG5mX2Nvbm50cmFja190ZnRwIG5m
dF9yZWplY3RfaW5ldCBuZl9yZWplY3RfaXB2NCBuZl9yZWplY3RfaXB2NiBuZnRfcmVqZWN0IG5m
X3RhYmxlc19zZXQgbmZ0X2NoYWluX25hdCBpcDZ0YWJsZV9uYXQgaXA+CiAgICBDUFU6IDMgUElE
OiAwIENvbW06IHN3YXBwZXIvMyBUYWludGVkOiBHICAgICAgICAgICBPICAgICAgNS40LjYxLW9n
ICMxCiAgICBIYXJkd2FyZSBuYW1lOiBPcGVuZ2VhciBoZWRnZWhvZy9oZWRnZWhvZywgQklPUyA2
OThmNDMxMmE1LWplbmtpbnMgMDgvMjgvMjAyMAogICAgUklQOiAwMDEwOl9fcXVldWVfd29yaysw
eDI1YS8weDMwMAogICAgQ29kZTogOTQgYjUgNzMgYTkgMDAgMDEgMWYgMDAgNzUgMGYgNjUgNDgg
OGIgM2MgMjUgMDAgNWQgMDEgMDAgZjYgNDcgMjQgMjAgNzUgMjQgMGYgMGIgNDggODMgYzQgMDgg
NWIgNWQgNDEgNWMgNDEgNWQgNDEgNWUgNDEgNWYgYzMgPDBmPiAwYiBlOSA3OSBmZSBmZiBmZiA0
OCA4ZCA1MyA2MCA4MyBjOSAwMiA+CiAgICBSU1A6IDAwMTg6ZmZmZmI1OTY0MDExNGU4OCBFRkxB
R1M6IDAwMDEwMDAyCiAgICBSQVg6IGZmZmZhMDQ5ZTcyMDM3OTAgUkJYOiBmZmZmYTA0OWVhYmEy
ZjAwIFJDWDogZmZmZmEwNDljNzlmNjFiOAogICAgUkRYOiBmZmZmYTA0OWU3MjAzNzk4IFJTSTog
MDAwMDAwMDA3ZmZmZmZmZiBSREk6IGZmZmZhMDQ5ZWFiOWVmODAKICAgIFJCUDogZmZmZmEwNDll
YTAxMDAwMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiBmZmZmYjU5NjQwMTE0ZGI4CiAgICBS
MTA6IDAwMDAwMDAwMDAwMDAwNDAgUjExOiAwMDAwMDAwMDAwMDAwMDAwIFIxMjogMDAwMDAwMDAw
MDAwMDAwMwogICAgUjEzOiAwMDAwMDAwMDAwMDAwMDA3IFIxNDogMDAwMDAwMDAwMDAwMDAwNCBS
MTU6IGZmZmZhMDQ5ZTcyMDM3OTAKICAgIEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpm
ZmZmYTA0OWVhYjgwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKICAgIENTOiAgMDAx
MCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKICAgIENSMjogMDAwMDdm
Zjc3M2MxYTAyNCBDUjM6IDAwMDAwMDAxMWU1NDgwMDAgQ1I0OiAwMDAwMDAwMDAwMDQwNmUwCiAg
ICBDYWxsIFRyYWNlOgogICAgIDxJUlE+CiAgICAgcXVldWVfd29ya19vbisweDE3LzB4MjAKICAg
ICBfX3VzYl9oY2RfZ2l2ZWJhY2tfdXJiKzB4NGUvMHhiMAogICAgIHVzYl9naXZlYmFja191cmJf
YmgrMHg4ZS8weGUwCiAgICAgdGFza2xldF9hY3Rpb25fY29tbW9uLmlzcmEuMCsweDQ4LzB4YTAK
ICAgICBfX2RvX3NvZnRpcnErMHhkMS8weDIxMwogICAgIGlycV9leGl0KzB4YzgvMHhkMAogICAg
IGRvX0lSUSsweDQ4LzB4ZDAKICAgICBjb21tb25faW50ZXJydXB0KzB4Zi8weGYKICAgICA8L0lS
UT4KICAgIFJJUDogMDAxMDpjcHVpZGxlX2VudGVyX3N0YXRlKzB4MTIwLzB4MmEwCiAgICBDb2Rl
OiBlOCA3NSA4YSBhYSBmZiAzMSBmZiA0OSA4OSBjNiBlOCBiYiA5YSBhYSBmZiA0NSA4NCBmZiA3
NCAxMiA5YyA1OCBmNiBjNCAwMiAwZiA4NSA2YSAwMSAwMCAwMCAzMSBmZiBlOCA1NCBjMyBhZSBm
ZiBmYiA0NSA4NSBlZCA8MGY+IDg4IGMyIDAwIDAwIDAwIDQ5IDYzIGY1IDRjIDg5IGYxIDQ4IDhk
ID4KICAgIFJTUDogMDAxODpmZmZmYjU5NjQwMDg3ZTgwIEVGTEFHUzogMDAwMDAyMDIgT1JJR19S
QVg6IGZmZmZmZmZmZmZmZmZmZGQKICAgIFJBWDogZmZmZmEwNDllYWI5ZjYwMCBSQlg6IGZmZmZm
ZmZmOGQ2NTA0ODAgUkNYOiAwMDAwMDAwMDAwMDAwMDFmCiAgICBSRFg6IDAwMDAwMDAwMDAwMDAw
MDAgUlNJOiAwMDAwMDAwMDgwM2Q3ZDU5IFJESTogMDAwMDAwMDAwMDAwMDAwMAogICAgUkJQOiAw
MDAwMDIxMDg2NWI5ZGIwIFIwODogMDAwMDAyMTA4NjVmNjg5YSBSMDk6IDAwMDAwMDAwN2ZmZmZm
ZmYKICAgIFIxMDogZmZmZmEwNDllYWI5ZTcwMCBSMTE6IGZmZmZhMDQ5ZWFiOWU2ZTAgUjEyOiBm
ZmZmYTA0OWU3OGM5MDAwCiAgICBSMTM6IDAwMDAwMDAwMDAwMDAwMDIgUjE0OiAwMDAwMDIxMDg2
NWY2ODlhIFIxNTogMDAwMDAwMDAwMDAwMDAwMAogICAgIGNwdWlkbGVfZW50ZXIrMHgyNC8weDQw
CiAgICAgZG9faWRsZSsweDFiZi8weDIzMAogICAgIGNwdV9zdGFydHVwX2VudHJ5KzB4MTQvMHgy
MAogICAgIHN0YXJ0X3NlY29uZGFyeSsweDE0YS8weDE4MAogICAgIHNlY29uZGFyeV9zdGFydHVw
XzY0KzB4YTQvMHhiMAogICAgLS0tWyBlbmQgdHJhY2UgMTJhODAzNDM4ZTQwODJjOSBdLS0KCkl0
IGNvbWVzIGZyb20gX19xdWV1ZV93b3JrOiBXQVJOX09OKCFsaXN0X2VtcHR5KCZ3b3JrLT5lbnRy
eSkpCgpPbmNlIHRoaXMgaGFwcGVucywgd2UgY2FuIG5vIGxvbmdlciBkaXNjb25uZWN0IGFuZCBy
ZWNvbm5lY3QgdGhlIENpc2NvLiBPbmx5IGEgcmVib290IHNlZW1zIHRvIGdldCB0aGluZ3Mgd29y
a2luZyBhZ2Fpbi4gSWYgd2UgZGlzY29ubmVjdCBhbmQgcmVjb25uZWN0IHRoZSBDaXNjbyB3aXRo
b3V0IHdyaXRpbmcgdG8gaXQsIHdlIGF2b2lkIHRoZSBpc3N1ZS4KCgpXaGlsZSByZXZlcnRpbmcg
dGhlIGNkYy1hY20gY29vbGRvd24gcGF0Y2ggZ2V0cyB1cyBiYWNrIHRvIHRoZSBub3QtZ3JlYXQt
YnV0LW5vdC1mYXRhbCBiZWhhdmlvdXIsIEkgZG9uJ3QgZmVlbCB0aGF0IHRoaXMgaXMgYSB1c2Vm
dWwgbG9uZy10ZXJtIHNpdHVhdGlvbi4gSSBndWVzcyB0aGF0IHNvbWVvbmUgKHByb2JhYmx5IG1l
IC0gSSBkb3VidCBtYW55IHBlb3BsZSBoYXZlIGFjY2VzcyB0byBvbmUgb2YgdGhlc2UgdGhpbmdz
KSBuZWVkcyB0byBzZWUgaWYgd2UgY2FuIG1ha2UgdGhlIENpc2NvIDI5NjAtWCBiZWhhdmUgYmV0
dGVyLCBtYXliZSBieSBlbmFibGluZyBzb21lIG9mIHRoZSAncXVpcmtzJyBpbiB0aGUgY2RjLWFk
bSBkcml2ZXIuCgpCdXQgSSBhbHNvIHdvbmRlciB3aHkgdGhpcyBjb29sZG93biBpcyB0cmlnZ2Vy
aW5nIHRoZSBlcnJvciwgYW5kIGlmIHRoZXJlJ3MgbWF5YmUgc29tZXRoaW5nIGluIGhlcmUgdGhh
dCBpcyBiYWQsIGJ1dCBvbmx5IGV4cG9zZWQgYnkgYSBicm9rZW4gZGV2aWNlIGxpa2UgQ2lzY28/
CgpBbnkgZ3VpZGFuY2Ugd291bGQgYmUgYXBwcmVjaWF0ZWQuCgpMaW5jb2xuCg==
