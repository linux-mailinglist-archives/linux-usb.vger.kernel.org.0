Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50B93E85F6
	for <lists+linux-usb@lfdr.de>; Wed, 11 Aug 2021 00:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbhHJWK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 18:10:27 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:56188 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231252AbhHJWK0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 18:10:26 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 68F2E4121B;
        Tue, 10 Aug 2021 22:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1628633403; bh=7IxV8fzgWHpLX4r3RN8IowA9xBtvXWfCAWXcxnn0luU=;
        h=From:To:Subject:Date:From;
        b=N4S3aK501K5J9iiZQl03fyhC1Ctf/A9xuUC9Z1xblhkRRN9cv9V820c47DRHSzWT3
         7Iy6CAWOb5L+LsHNz/rGZguiVFC/by+petqwc5xSLTzFWN9nhHCAia1li6IitcVsD5
         K5DtB8BKXnBI4zDjUqZNcQ7fDgQ/ZVoJ0TkLNWwIGH765B30D0RHYAJ6UbfK2U+/O+
         mVKXcjj6m1YoDREQbpx/ZZNNJCOcS4D799j0Ww6CUFhZjjcgDHah52EwPNmS9bR1LT
         iaue5yOsAHzZ4P2y5C1bzMmbCVz3YXLWbAN8XFIdA0iTuwMCxgpiJ0muqR9PDCKj7z
         +XLV2EVI7awCQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1E10FA00E8;
        Tue, 10 Aug 2021 22:10:02 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 468DA800BB;
        Tue, 10 Aug 2021 22:10:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gUU0PkQe";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgXvHd/79dbxeDhnW5V9VWdbr3eNQ/SJVyUVitibeATL0Q5bkm934rbtfvglwp2HuLkdLL5/tNp54VfgzhLUn2X2j9A7PLjn50jiO1WvBooBt3HVQxG5al3XRQkzGomtSHI3LxbSjiVqC0K+CEx1kDmfugzTHESLRrziEvNctbb+A+GfMPydL3zHK01AL3KbnbKeJ91Cv78A+vkY0KB/nf+bHA+/hMtwKyuSsYQ844wMaiuSycod6t0fTmN84OMbAIblvRud+sRoEQ5df5ilX/LvyAidwS/QgiGoOpP4Jq3mQCgg7OSNSny3NL5tCrADhBKBamfHeJwA4uCmbLnErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IxV8fzgWHpLX4r3RN8IowA9xBtvXWfCAWXcxnn0luU=;
 b=V+AteVkEqbRUlkX+3cecGGZRvalWzrp/NkxUbuzlyc/tjgOHUice1PwIVxYCGQIaT47JKrrXkBemeEBgE3SPbjAThLhqcS2Wgf+BMciq5mvI6IkK3Wxgm2FIctdQe7lzFk5rWeGew55/f8F4fLKezF88s/DAxNK8P2vhhz1u/1YQZw0FuWEvAoxOgTgF9I4UA0/zrIMbNu4gBbKHcMMIlk3pqU6HtWuKrkX8kG8m83r4r7PSmXZHQobZiWIU/fTwdE820iewDfFErB7/EywefZPBj1tqbKByj8awJCKVnl1jYPK6Y25zLVm6i4WHasuvS7tcDRUor+iwidOabkks0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IxV8fzgWHpLX4r3RN8IowA9xBtvXWfCAWXcxnn0luU=;
 b=gUU0PkQeHs7W5pDr6ZIWjbOtCaKixXqS3O26Db6vTtjIK1/aJGuwoVvjcylj/igjHis72sqcMfyOZigfBX+jmO/X6SaIRDy/L35RyTzokepExZcW+2Pl429pKNvJYUSX2eSmwPzx5SLTy3qV4weXbpTrB++fMeKMrsQoXIbIxWI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3302.namprd12.prod.outlook.com (2603:10b6:a03:12f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Tue, 10 Aug
 2021 22:10:00 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9%7]) with mapi id 15.20.4415.014; Tue, 10 Aug 2021
 22:10:00 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
Subject: dwc3 spin_lock_irq flags
Thread-Topic: dwc3 spin_lock_irq flags
Thread-Index: AQHXjjR1NephQujOSESUPURlgcQtrA==
Date:   Tue, 10 Aug 2021 22:10:00 +0000
Message-ID: <a034f2ef-c2a3-962e-d72b-0db6a34e67a2@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e4b687f-0932-413d-fbb4-08d95c4b98a9
x-ms-traffictypediagnostic: BYAPR12MB3302:
x-microsoft-antispam-prvs: <BYAPR12MB330256480A764708CA319C7DAAF79@BYAPR12MB3302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M6A+lGQqs/mJxJhcq5gN8G0lXwpS+h6tbNpDymUJSwzIgvO2gOBLDRj3J4PPDPQAodIlXmK8/Is1P/wrlMxv4SjNhwGbSpRCM3s0PbJXCbLeixE/CbeGloK71MEkGP4fvG+OsywfKcu6I6oHrLPduxG/IVly9EMpVTYThz2nquhwTDk9gL6IabOy2FZ1jNy8LzC5rQ3f2iG/3e9JsvXmN9PgfixXilrMRT5YQgdN4mI9tKCVqueHVlYDh7mtEUVnZdpCRzkYtTfig9oLcGtC3m5bp9LZLryNPqGEQdh+onfHvkU1kFAXNeOPPQdiIeRYItsAMCY6UoUbXDIgKXM4ZkcB8+gGNuDmDt3dqsz/lh25MAsqmiUJG23L0QcArsUcm264DWRW/gMd7NmuabW257SyZCVMW9k903f1vWxDeTitV1ucqIYCWrnHAQHOkDa4LkB3oPM6gos37AU68iGTYgeTJBZvYTC/073qqADUjmL8LXX6KzRhwWhHJQwlh9PpTwtoVsFAyMTXgkO4bI+rihF95naexet6e22Y8l7TCg/tZmj18QW8za9NB2Cs06gv9WGjxzphIMn2Ukps7AXkj1Xm402JKjbZNkuDsj7a4UGc9CEE+rlpXi/64Nv+OCWgcsxmJi9GHukn5iRjxPFTegBZ1qwKBTTazu9Mo/EJJbD0uFk1JJ7jZAaUp22VSHw5U87hLnXXv0qOJr1rDuk4zLI+i0BpOzJEYhMGjSnX0eaY0wUTC99Ba9EiTQZ5ztCm7fpFSLTWPR5O3/tmvHzdPA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(39860400002)(396003)(346002)(376002)(4744005)(6506007)(122000001)(8936002)(86362001)(38100700002)(186003)(31696002)(6512007)(66476007)(66556008)(64756008)(66446008)(2906002)(76116006)(38070700005)(2616005)(66946007)(36756003)(71200400001)(110136005)(7116003)(316002)(478600001)(26005)(8676002)(83380400001)(5660300002)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjVQeHRnMkxMY2NETkwwS2NDN1RhWXBBdDBzN3lGcGZNNnNSM0ZSOGRvc2dM?=
 =?utf-8?B?L20rUnI5dnRLaFhKdkFTOUIvVTFEeDJOd1lqQW8xdUIxTlc4NFVwL1NnLzVs?=
 =?utf-8?B?MzIzMUREZjhyYWptdm1nbDZabVNocmsxOHZvazJRRW5HSGZPczM3U2dPakE4?=
 =?utf-8?B?UytuMVdlWmlWekNraWkyYVJRNWxDMlNVT2EwdUd4ajNjbXhaMk5Jd3pOTXJk?=
 =?utf-8?B?ekM2dTlsaXdnT0xxNzkxTXo0Qy9HQmZBaXhZZjFUdkl0K3VjaXptbEhDajZZ?=
 =?utf-8?B?VG11a3lyY3BUV2lMQVpnTW0wTld2YkIyUy9haWdDSkhnd3ZrZHdDZGVUWHA5?=
 =?utf-8?B?WEpheWY4WmpsSVB0S3d4UHl0Z0ZtQkZOanZ1cDBlOFVOeTlwOTBwSUViRnRr?=
 =?utf-8?B?MllGNGZYRW9YUVp2M0dndzJLVnVlSXg4QWd4aHJJM1B1SlBHaDlqTEpTZ2p4?=
 =?utf-8?B?cUJIYmRBRWszLzIyTHl2QTV1ZmZ2cjFYWU11VitRMTg1YjAvT2Y3bGR6Rm1y?=
 =?utf-8?B?RW1LZ3ZWYVEyZkQyUFY0V3d2cFZCZ3JyMlBiZFpydVR2MlpyMTkyc1VSbFdU?=
 =?utf-8?B?Zk93N1VUY3I1TU1lVHc0b2pkdkhvMFFsZ2oxSjJUbW9XQzg5OVFBWUNCM1hT?=
 =?utf-8?B?ME51RmVVNklzMFQzY0NoaGduOFg0cjNUUkdkOHVTcVlKb1ZlUGhlNTNHVllj?=
 =?utf-8?B?Y2JMMXdLdjkxMUsvS2tmZmNLa0tFS1hCTlhDQm5WWThnK2x2SDFoVTJTNWdJ?=
 =?utf-8?B?R3pyV2V2NCt1eUtQeXNtaWFmNFFBZ0pWQzRQVGNTTGx0NWl4U1FSeUNWeVAw?=
 =?utf-8?B?MDdXT0tTUTE3UHNuQnFXdFY1MGJhbnQwaHJCYVBYcEt5UmVZck01SzFHZkJO?=
 =?utf-8?B?N0ZDbjJXeWZxOGY3K0FhMGFTSUFFc0J6bVlwUmxPNUtoUHV6blNHUFdoNEtr?=
 =?utf-8?B?WWVMV203RmtKUTZzeHg3OWEzZlJCaGEyVENlUTNaU3loUUlzQ2FUbFVaWTEy?=
 =?utf-8?B?UUp2bjRUOXBTaWluaEJtaDFNSHJoWjVTVmNZMWxGT3pQcWFPaENzcFI2Vjh6?=
 =?utf-8?B?WjZ5NVpvS004R2FIZW1JTVBLTldWZnZ5em80TUNVQTMwZktad0FRcldDbmg3?=
 =?utf-8?B?UjZjbGtrVDdDQ2F2MzdOaHlIamsvM0VaUHpOcVM0NGJzYVkvMzdkempSOGpp?=
 =?utf-8?B?UHRXdzNpODdINHh1U2tRc1JBSEs0ZjZCYlBxQXdGd1dHVEhHRnBHU0x1K2ZB?=
 =?utf-8?B?QmtxMUo0cmtSNUozRXB4czRENDgydVJnK25lZ3VDcTh0UGZGNlRnL2hKeW5R?=
 =?utf-8?B?SFUzbzd3c1c3S3gyQlRTcEM0TVhyNEh3QXZ0SkR6R2FaQUN6czhaODZNaHcw?=
 =?utf-8?B?K1MvQVdqR3Jrd280dW5XYXNtR0ZWK2tDdXFRQit5Tm02S3MwMnYrcDBnOGNx?=
 =?utf-8?B?UUJEUXN5LzZQd3hPUGZ3VVNlWEZwZEI0UWtBQ3FEOXJ0c1cwaVNXSVhiTmV1?=
 =?utf-8?B?bDJDQ1Zqb2s2Y2NpRDFaRW1vKzVtR0IwNUVyWHdVMUpqYWRzZnZsN3Q3dFNi?=
 =?utf-8?B?dGNPTXRwa3hJTHVqa0E2MUplb1J1ZHRRdVFzbkdWWVlkWWZ6L2VtdjVmMWR1?=
 =?utf-8?B?SitKV04vTHVOd2x6dUdmenlVM3VhS2lyQmFmaWExdHpLWkJVTXg3UDBRT2g4?=
 =?utf-8?B?Z2tBQm1hK0VxSWZyQ0ttZWx4MUFuYzNNUzU2SWdpWlRkUEdpTWJZWmFVdU9O?=
 =?utf-8?Q?y1P+9k/3ZKeD2HeNw0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FC1F57741C90342A54E2E58E3979841@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4b687f-0932-413d-fbb4-08d95c4b98a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2021 22:10:00.2035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGDNzlQ521zCL4tKw6/WhvdVta91N5Xky90R7Fl/UEpYz6XyMA+9S0OX4QfDZRRw4J62uQBa+s/iMXYOnod4tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3302
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNClR5cGljYWxseSB3aGVuIHdlIHVzZSBzcGluX2xvY2tfaXJxc2F2ZSBhbmQgc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSwNCndlIHNhdmUgdGhlIGlycSBzdGF0ZSBpbiB0aGUgImZsYWdzIiB2
YXJpYWJsZSBhbmQgcGFzcyBpdCBkb3duIHRvIGFueQ0KZnVuY3Rpb24gdGhhdCBtYXkgbmVlZCB0
byBkbyBzcGluX3VubG9ja19pcnFyZXN0b3JlIGFuZCB1cGRhdGUgdGhlIGZsYWdzDQphZ2Fpbi4N
Cg0KSSBkb24ndCBzZWUgdGhhdCB3ZSdyZSBkb2luZyBpdCBmb3IgZHdjMyB3aGVuIHdlIGdpdmUg
YmFjayB0aGUgcmVxdWVzdHM6DQoNCnZvaWQgZHdjM19nYWRnZXRfZ2l2ZWJhY2soc3RydWN0IGR3
YzNfZXAgKmRlcCwgc3RydWN0IGR3YzNfcmVxdWVzdCAqcmVxLA0KCQlpbnQgc3RhdHVzKQ0Kew0K
CXN0cnVjdCBkd2MzCQkJKmR3YyA9IGRlcC0+ZHdjOw0KDQoJZHdjM19nYWRnZXRfZGVsX2FuZF91
bm1hcF9yZXF1ZXN0KGRlcCwgcmVxLCBzdGF0dXMpOw0KCXJlcS0+c3RhdHVzID0gRFdDM19SRVFV
RVNUX1NUQVRVU19DT01QTEVURUQ7DQoNCglzcGluX3VubG9jaygmZHdjLT5sb2NrKTsNCgl1c2Jf
Z2FkZ2V0X2dpdmViYWNrX3JlcXVlc3QoJmRlcC0+ZW5kcG9pbnQsICZyZXEtPnJlcXVlc3QpOw0K
CXNwaW5fbG9jaygmZHdjLT5sb2NrKTsNCn0NCg0KVGhlbiB3ZSB3b3VsZCB1c2UgdGhlIHN0YWxl
ICJmbGFncyIgdG8gZG8gc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgpIGF0IGEgbGF0ZXINCnRpbWUu
IE1heWJlIHNvbWVvbmUgY2FuIGhlbHAgc2hlZCBzb21lIGxpZ2h0IG9uIHdoYXQgaXNzdWUgdGhp
cyB3b3VsZCBjYXVzZQ0KKGlmIGFueSkuIEZyb20gb3VyIGhhcmR3YXJlIHRlc3RpbmcsIHRoZXJl
J3Mgbm8gb2J2aW91cyBmYWlsdXJlIG9yIHBlcmZvcm1hbmNlDQppbXBhY3QgdGhhdCB3ZSBzZWUu
DQoNClRoYW5rcywNClRoaW5oDQo=
