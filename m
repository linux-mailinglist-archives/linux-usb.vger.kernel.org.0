Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66C4310246
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 02:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhBEBcK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 20:32:10 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34572 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232740AbhBEBcI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Feb 2021 20:32:08 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F205CC0080;
        Fri,  5 Feb 2021 01:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612488667; bh=Z9ZYsT1CXcIwYRel88QJS25y/9BMj0j69NyxL6vpSPs=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=T+ceYCVZUnzaoQuRPBy5tUwSed2PJF0jxqE36YrZOiEnzNpGCTa3LFGYbcMyA7hKP
         NdSv6OrogH0fWVjB5BDIU+xJ0NEkgU8pjk6jbMvtkdQ+irKaNkr4NaNHhi8Hzw2KSy
         VXVifIJkIsHRRLmIsJzr4tHWksww0aLvjqlCTcYyHh4i+BsOQyUM2tqi98hklygQg/
         UJRDRf80dr2AgWyKRtzSbn8M15AYAExWW3XoEXK5p6EKEv8ZEPLtDqX8LMrhRBM68y
         R/erWOSwhrm8MA6xiXhN0dw7QhlIzAiV9LoHkT91GBHQCgmwE1VIIIhUXrSg7ANf7w
         Iu3GuI1d5oFxw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5BEA2A0067;
        Fri,  5 Feb 2021 01:31:06 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D13F14004D;
        Fri,  5 Feb 2021 01:31:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="d+LNKlbK";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nvac9XPPTN1cM69rwCPXffbWiwXeRuTi9s7gkE4mUnXK2Qoi9BJTo47qoNaK/BNHoWSIFNmV7GKiVijHy80By9KIDWsC1ZHQLiuH+3c7lb5xLG5yA0vtXZCyKPNW1+A+7IIKOEcDXKgTUx7j/1yVudARjAoif5XCDVPk6cEdpPDHPvKd7Uy3Lk1I5Ax/LIFLPO2Y9/h4ZEtjCEYAMhYTsOciVCDYShkCgEMTou4pW4PaQZMioq/pjDVRR7ry7D1McRU1TNqADhv8GQcsfrbSWZH5AfkRkir3OsBNERQOAUB9RVC9JRRrx57F7yehM6ZsG+lHSFQweNiK1l1W0PQtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9ZYsT1CXcIwYRel88QJS25y/9BMj0j69NyxL6vpSPs=;
 b=A8OId7br3pyoAadSQqJ5vzUqdBbGac27nbfsKaUarxLnI4IKSYpmSQ9YwmVCEIawPFU3RRh2GfQa1uZOKEv8+F1jeNp47kFPR4efiP1RPLId2TclNHMshTlUXQM/7pVZysboFP4lH1/jYBEOlxoYh4oDo6AO1rKNaUh+4ug8Pweo4pvkAZcxb0Bo4Mh0skU0XCrsDw/tb/F54/w2Ou9Du+clQsbShSdiMx1rw7TVTuOynpVH6G4DPsvnLmjdWLVGUjTn2TSV7R6S+OrO0JlHuQosm36OWeqe2eOSYGXFFdAToJXvlt2wJYIVnKGcxswtDvJARL0NcAavKZ/mtTi/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9ZYsT1CXcIwYRel88QJS25y/9BMj0j69NyxL6vpSPs=;
 b=d+LNKlbKA7JDn4JyGtw9gHd2FZxRD4LcRDi96e7FRpT43BC/DncLfPEhs+VL3MUVfImvU6M711qxfi399rTEmAQwUSscYt+v0YMj6DFAc3r6ufmLS1Dkgu4PCz9h+R1j3wrA/FIIihJkZ0nktCDQxnhAFEAha+KTyDY34Tiuw08=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 01:31:03 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Fri, 5 Feb 2021
 01:31:03 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     David Laight <David.Laight@ACULAB.COM>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
Thread-Topic: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
Thread-Index: AQHW+RV+hDKTpHds3UON+skS200saKpEkq2AgAEPbgCAAijX8IABAAMA
Date:   Fri, 5 Feb 2021 01:31:03 +0000
Message-ID: <b99c1412-ee58-9215-9e17-70b06d08fe7e@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
 <4627ca7e922019cd9a37073db90e4e9cd585c97e.1612237179.git.Thinh.Nguyen@synopsys.com>
 <90627b9d-9a39-b5ee-4ae3-054764a57faa@gmail.com>
 <5efc3bb3-1320-f382-c6f6-b8cefd91b8ce@synopsys.com>
 <064f005f25794769b5c551609fcdc3f2@AcuMS.aculab.com>
In-Reply-To: <064f005f25794769b5c551609fcdc3f2@AcuMS.aculab.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: ACULAB.COM; dkim=none (message not signed)
 header.d=none;ACULAB.COM; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a1d15e4-5013-4ea4-74f6-08d8c975b3a8
x-ms-traffictypediagnostic: BY5PR12MB4100:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB41008CAAABD6F064A31CE584AAB29@BY5PR12MB4100.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IK4cAeQeVNj0NcAR137f5MLAonQdQRnz9FBMAPXams3WcvDNHPWX6Gc5wzgBRSj9vPYWUW0d7fFPV6FSbwET93PVeP1CdaW8AHMNsbNHuxp/FsrWeu4pyWJ2IQZb1ZN8dwVKu1VdNGWp3wqsK75vo1QCQXLrzQmUlOWsGXxwSkzKL+xD0igBB3A6y7dsEcm0BNoQxNxLw4A8Mze1MR5Xx7ZZRDabWEpmVshlUbcBNLTcXGOn1nszcW0l9rrvtPYbeBvaP3pL75I7c/TooDYUv+6QRrG3x3+7vLPf64LLNgWKRsHhz4IKCuTuS4CGuDVr3vr5l/bGOWGL6T9c513phZ/UId8Mfrbw3nqYG5RSUL5Cu0vRvBHHZOvnD+CJkXy2uurS2318XZAT2brw6uNvoMGkmjZ6wxV/v7p8C7qdP9Xe0b4SrbtceI7vD/p8qggAB5+MAvXNlKSWieA1tyywbHRELX7DAhBxpZJWvwuT7RShUIAoOx7GMe2HcvYzdRutrwnUO+wPKD/IYaw+3WWw9+7coxh5Ek/XghuWlI0gx+bRZ3TevksGspNno9RBrjbyP1NqO9M430II+HDIwnpMIiB4Syh5PhR1tVAcnUqcACY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(366004)(346002)(376002)(31686004)(5660300002)(478600001)(8676002)(66446008)(86362001)(186003)(26005)(66946007)(76116006)(316002)(6512007)(71200400001)(6506007)(2906002)(36756003)(110136005)(31696002)(2616005)(6486002)(66476007)(8936002)(66556008)(64756008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WjFOcmU2WnZqa3o1V2x3RnRSc0tEeU44SWY3TzExU1NPWTFMaXR6SStrVHBs?=
 =?utf-8?B?UXZ6Rk5jRXhheHJEUnhRR0ZtbVV2bWRmUy9NT3R3SE5HcDJPdSt5Z2NRMElH?=
 =?utf-8?B?RTNZN1J3bVlsVnR0cVpYRis4MzR4WjhrYXNneGZ4Rnp6Ry9jby9IamNPenBI?=
 =?utf-8?B?RmFyMzRaWndEWkF4T0ppUElEanBMbzJRTzNqNmdPREdLd3dZSlpXYkpiU1Nh?=
 =?utf-8?B?MTMrcTJLWXVJeDk1Z3EvaVc0amZZWlRBaytIT3FMQ0pJcTR2TDU2REdtNTdF?=
 =?utf-8?B?YllOS3BwSjdKbVhlQ1FoTTRiR0F1NjRPQWxOYjJOZEJ1VTdYWnI1SFp0OU5m?=
 =?utf-8?B?N3pTRTIrZ1pVZjRnSFlmeWlpMjVXaDBXR2NXdW40QXRPWTdSSG9kVzB2Rnht?=
 =?utf-8?B?OExJSmFDL0xOZ1hVZFN2M2p5ZnlvSVcxNGYyck81ampjV1RVMFNmN1pmVi95?=
 =?utf-8?B?SlR2WFM2c25wdzliVXhHQVdpY3YyT2VGdEtsdFZyQ2wvTmtSaVpVZDdUREpk?=
 =?utf-8?B?bkNGN1ltT3dNUWIxWVZBbjJJR0FCOWpXdGxub2Y5RHJVV3h5UHZ0SjZ1NW11?=
 =?utf-8?B?bXd3d2tWUXZ5ZXlVajUzc0I0amZuRHVBOVRZc0pxeEo4V2gwK3NoSjB0RDls?=
 =?utf-8?B?MWQzNW9rbDFwWWhvL1VicG9QQm82NFk0YkxRRFZoNm0yK1hiMmhhMGJjOC8w?=
 =?utf-8?B?RlE2K2x5OWtsalhGMUZ3blNSMEpGakx2N0pSblBRVGNuZW1QeEJKMGN2dlVT?=
 =?utf-8?B?RU82czFCNlZ3OGg4QlIwT0tkeG9QNmQvelRINDlpakJmc1ZMSTIxY1hiZThV?=
 =?utf-8?B?dWNPcXFFUm9vRUkzamZndzlldTFJdDloUnY2K0oyS3BNZm11a2ZVeXpqNlIz?=
 =?utf-8?B?WFZLZ0tSdXplUUc0aEtHOTM3QU0vc211aGdpRFUva0pVUlA0U0dkeG03YUhX?=
 =?utf-8?B?dGtoUEpNVWV1cU5mM0IyTmRzUlJnMFRkWTRoaXRwL2RDVW1KelRPWElpYzBs?=
 =?utf-8?B?NWgwaDNZWHcvbnF1cVo0RnBRTWpYcm1vNnhlcjVVMXoyUjRUN2NqUkxDVWVC?=
 =?utf-8?B?aW9KZ2NkWVBJYzhFL21xZ2Z0a1hKRHRsMnBBMGt4MGt0djlqOW40a3lEc2pD?=
 =?utf-8?B?SDFDaUFNc3hOazZvSi9XcExDM3o4YWdtKzZiOFNOcW84NnBYdWpQQmNrMDFQ?=
 =?utf-8?B?OWRacHFlQnNYQ1ZrYjdEeWt5SFBJNkxFZzFiN2xDUDhWaXRvcXlkcEo1cjZX?=
 =?utf-8?B?UTl2MmZGOW55dFAwamdHbHRla0NndGNycnZxZWtDd1NtS1F1L1ZJLzJnR0xo?=
 =?utf-8?B?Tzh4U2RTZUdxK1RCRXdCdFBEaTFMck9MZm1XTmN5TWtmUDNXcGkzb0hrRCti?=
 =?utf-8?B?bUtMN0VCOUxuSDJMclJiZDNNY05mcmlOektHWkVWeDdMN2tiWHUzWmV0M0wz?=
 =?utf-8?B?MXJJTFJ0YWRTcmFvQVdubXpHRlZkeGdKeFFQQ3hNK1F6QloxelgwWTcwWWNO?=
 =?utf-8?B?ZWJaWTExYkREYm9hMm1wbGMzdmRvejZFa0lyZ3hlT2VYb2RhVERYeHhxUGRB?=
 =?utf-8?B?bXJGK1pvRW5CR0M3MzJFV0M2c3kvVG84amlBWjhNaVZXN3Y5MVFCaDVRbGti?=
 =?utf-8?B?d2xaVGRBSUNXVXZOT0FRRVdHdTBoRU5DKy90bWhVNmUycWdKUGlPWGxFdUx1?=
 =?utf-8?B?MzNUL2FMYlAxMU9hRnY3ZWtTZmJEWEhsb3NrSjQrSzJuZGFMYTNrMy81M00r?=
 =?utf-8?Q?DOzl84j2BoZjeYfxAzRAFhbKnQLei0vXhVRLeFT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31CE2AB145B1AA469943FBB33E552B2B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1d15e4-5013-4ea4-74f6-08d8c975b3a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 01:31:03.4414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQSfkApvUjShRAogzsHnClNr6yjsyCWZ9V71U+cb8Vo0Zbhj2fiOKQWB9sUe1QFJExwPXaQ10Y1PFXHrz/YqTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RGF2aWQgTGFpZ2h0IHdyb3RlOg0KPiBGcm9tOiBUaGluaCBOZ3V5ZW4NCj4+IFNlbnQ6IDAzIEZl
YnJ1YXJ5IDIwMjEgMDE6MTYNCj4+DQo+PiBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6DQo+Pj4gSGVs
bG8hDQo+Pj4NCj4+PiBPbiAwMi4wMi4yMDIxIDY6NDIsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+
Pg0KPj4+PiBTb21lIGhvc3RzIGluY29ycmVjdGx5IHVzZSBzdWItbWlub3IgdmVyc2lvbiBmb3Ig
bWlub3IgdmVyc2lvbiAoaS5lLg0KPj4+PiAweDAyIGluc3RlYWQgb2YgMHgyMCBmb3IgYmNkVVNC
IDB4MzIwIGFuZCAweDAxIGZvciBiY2RVU0IgMHgzMTApLg0KPj4+PiBDdXJyZW50bHkgdGhlIHhI
Q0kgZHJpdmVyIHdvcmtzIGFyb3VuZCB0aGlzIGJ5IGp1c3QgY2hlY2tpbmcgZm9yIG1pbm9yDQo+
Pj4+IHJldmlzaW9uID4gMHgwMSBmb3IgVVNCIDMuMSBldmVyeXdoZXJlLiBXaXRoIHRoZSBhZGRp
dGlvbiBvZiBVU0IgMy4yLA0KPj4+PiBjaGVja2luZyB0aGlzIGdldHMgYSBiaXQgY3VtYmVyc29t
ZS4gU2luY2UgdGhlcmUgaXMgbm8gVVNCIHJlbGVhc2Ugd2l0aA0KPj4+PiBiY2RVU0IgMHgzMDEg
dG8gMHgzMDksIHdlIGNhbiBhc3N1bWUgdGhhdCBzdWItbWlub3IgdmVyc2lvbiAwMSB0byAwOSBp
cw0KPj4+PiBpbmNvcnJlY3QuIExldCdzIHRyeSB0byBmaXggdGhpcyBhbmQgdXNlIHRoZSBtaW5v
ciByZXZpc2lvbiB0aGF0IG1hdGNoZXMNCj4+Pj4gd2l0aCB0aGUgVVNCL3hIQ0kgc3BlYyB0byBo
ZWxwIHdpdGggdGhlIHZlcnNpb24gY2hlY2tpbmcgd2l0aGluIHRoZQ0KPj4+PiBkcml2ZXIuDQo+
Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9w
c3lzLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IMKgIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYyB8
IDkgKysrKysrKysrDQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4+
Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYyBiL2RyaXZl
cnMvdXNiL2hvc3QveGhjaS1tZW0uYw0KPj4+PiBpbmRleCBmMmM0ZWU3YzQ3ODYuLjM0MTA1YjQ3
N2M2MiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jDQo+Pj4+
ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYw0KPj4+PiBAQCAtMjEyOSw2ICsyMTI5
LDE1IEBAIHN0YXRpYyB2b2lkIHhoY2lfYWRkX2luX3BvcnQoc3RydWN0IHhoY2lfaGNkDQo+Pj4+
ICp4aGNpLCB1bnNpZ25lZCBpbnQgbnVtX3BvcnRzLA0KPj4+PiDCoCDCoMKgwqDCoMKgIGlmICht
YWpvcl9yZXZpc2lvbiA9PSAweDAzKSB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByaHViID0g
JnhoY2ktPnVzYjNfcmh1YjsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qDQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgICogU29tZSBob3N0cyBpbmNvcnJlY3RseSB1c2Ugc3ViLW1pbm9yIHZlcnNpb24g
Zm9yIG1pbm9yDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogdmVyc2lvbiAoaS5lLiAweDAyIGlu
c3RlYWQgb2YgMHgyMCBmb3IgYmNkVVNCIDB4MzIwIGFuZCAweDAxDQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgICogZm9yIGJjZFVTQiAweDMxMCkuIFNpbmNlIHRoZXJlIGlzIG5vIFVTQiByZWxlYXNl
IHdpdGggc3ViDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogbWlub3IgdmVyc2lvbiAweDMwMSB0
byAweDMwOSwgd2UgY2FuIGFzc3VtZSB0aGF0IHRoZXkgYXJlDQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogaW5jb3JyZWN0IGFuZCBmaXggaXQgaGVyZS4NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAg
Ki8NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghKG1pbm9yX3JldmlzaW9uICYgMHhmMCkgJiYg
KG1pbm9yX3JldmlzaW9uICYgMHgwZikpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1p
bm9yX3JldmlzaW9uID0gbWlub3JfcmV2aXNpb24gPDwgNDsNCj4+PiDCoMKgIFdoeSBub3Q6DQo+
Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1pbm9yX3JldmlzaW9uIDw8PSA0Ow0KPj4+
DQo+Pj4gWy4uLl0NCj4+Pg0KPj4+IE1CUiwgU2VyZ2VpDQo+PiBTdXJlLCB3ZSBjYW4gZG8gdGhh
dC4NCj4gSXNuJ3QgaXQganVzdDoNCj4gCQlpZiAobWlub3JfcmV2aXNpb24gPCAweDEwKQ0KPiAJ
CQltaW5vcl9yZXZpc2lvbiA8PD0gNDsNCj4NCj4gCURhdmlkDQo+DQo+DQoNCkFoLi4uLiBOb3Qg
c3VyZSB3aGF0IEkgd2FzIHRoaW5raW5nIHdoZW4gSSBtYWRlIHRoYXQgcm91bmRhYm91dCBjaGVj
ay4NClRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0Lg0KDQpUaGluaA0K
