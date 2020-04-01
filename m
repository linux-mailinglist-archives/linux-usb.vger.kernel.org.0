Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBF719B5E8
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 20:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgDASsY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 14:48:24 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47084 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726640AbgDASsX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 14:48:23 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DA4CB43B7A;
        Wed,  1 Apr 2020 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585766903; bh=EmV4jsizLAThbU2Ru1PSNOdyh279bz0b1d6i2o4BXRM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=AF7T/ST9bvFNxF9oY2Ctw/5/oFHnCAwa3EMNx+ZDv3tMAO1Fq98itzEOOuKUD8TW2
         CD6Rg+9/0/ZcrR3RwbRVlw3zComEUC44uSK92nxtAaBVEwGocfjKoRa0/QMStx+pJR
         dwhvV8Juf0ynlVRK91GbsCRTT9vwu3T7ldPHi4ejUG3/eNTrjkThOjWE8bkHQK1Uk+
         b/8gx4XgVun+TKL0ynSID6gCrWkjmyGG1734hkfO4Pj3m4s300R5NB2Z5DqQZ+7mcI
         ALsBkpwHs6yQs5vJi031unZuKRi4MBDTz5z16c1IyIOuTELbDr8IEzn/j2RF09ExWj
         ONpAcbKdIFc6A==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 11DC6A0079;
        Wed,  1 Apr 2020 18:48:21 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 1 Apr 2020 11:48:22 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 1 Apr 2020 11:48:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGVnfcIHA62ui9upKVgBPnu3nWw4vPXIwN13IGPInD+ZjfyQEukb5eBPL58vvlNrs3jiREWrQuqyfkDm8r+RlsRwM/4cs0boWoYHDU0q3NJmgXEbDc6C9gVzIDN4GQ0x9YH67ra2t/I1FZp6nCS763aJJG9LQT0bb74L+BVYFV/XPatqtiGy1PtIKK3R8NpuSUt8cCX3fu7PdbpsQmzPcOajmI8lob7T73ZoXR2I1WPdof2aIS3/KY4eI3HMthCj30JuPQQ6vMRB+NPdHYqLpJqZRlnBpJ2c3hmlVVYsodEQwpHfrx3EVGD/CrF6RibcDsk0mM0GLRPkgxNM3LywbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmV4jsizLAThbU2Ru1PSNOdyh279bz0b1d6i2o4BXRM=;
 b=IpxdmmV589CnVdYxZgjLy8LpK0tKmNtH1dUIwfjbpjfRrdstEK2woz6VY+Sm+EI+sOwM81KD2O3myYIU1v/BoswR0fvS4CJ5N/vm/QQCXeCwQUXZlYBSprILQrEJXJJDtgi4l/2OAnwb0R9R3O1TtBRsTCrsSfT+C2mE83NPPKwhNH5c3RW8ZkGENh/T930LNPkZX0w9HFofURhJMycWv1h+LjzGpJmXV6vsSGhkQWoNSyauYeijcizWIXRNG1rb8SM+bEilIU6QfAqWBq8nOeyiXl5+YG3qsp7TYHiZlM25rInysGPXNGeB+FuvV/AKZtLsRCwL2FXJAIPWJfLzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmV4jsizLAThbU2Ru1PSNOdyh279bz0b1d6i2o4BXRM=;
 b=kwggH/gQfyS5tLssirUeu6CeDYp0QGJyZLvdHSIgwo6YvQS3I7ObIl4yvVm8yoqQj6UIQ86OXsoFgdmLGCQszyu6DetEaldKkgBAEvzyTmOU4IaVj4Bd/lPJARdQJL7u2d9mb/w+QPIxMG52BI3d5wofb65cDMl16fDwvUK8j6w=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3432.namprd12.prod.outlook.com (2603:10b6:a03:ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Wed, 1 Apr
 2020 18:48:19 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 18:48:19 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
Thread-Topic: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
Thread-Index: AQHWB/gew0PpOswF+EKIHzX05MERgahkkHuAgAAL0QA=
Date:   Wed, 1 Apr 2020 18:48:19 +0000
Message-ID: <8e9babd3-5219-dc65-cc05-1f328037c027@synopsys.com>
References: <20200401073249.340400-1-balbi@kernel.org>
 <5d466907-cba0-59d1-6553-438bcbc779d8@synopsys.com>
In-Reply-To: <5d466907-cba0-59d1-6553-438bcbc779d8@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b94710c3-8226-4ecc-6493-08d7d66d3f16
x-ms-traffictypediagnostic: BYAPR12MB3432:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3432E2A9C5A9A4520489714AAAC90@BYAPR12MB3432.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2710.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(366004)(76116006)(66446008)(31686004)(66946007)(64756008)(66556008)(6512007)(2906002)(8676002)(5660300002)(8936002)(66476007)(4744005)(6486002)(71200400001)(86362001)(186003)(4326008)(110136005)(498600001)(36756003)(2616005)(81156014)(81166006)(6506007)(26005)(31696002);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D3x0ZpRmZvymTBvn1uORrn8bcB6+6Cdy90qQYPaDs6oPGW2OVKzVszq+E+sPPxZG/70+uToeGQj0MtL60APCmuupEwyJ/U6Qptwc9p5bRHCsCVScLk2p3qdlhWgiuHT993oOuw378/Eq4hpdPqktok7BVeROJxTnHPE8e+N5OTlMgAJd8lvMa/ZpTwl8o/YWwYVdkqYkm9IxOYgEzLhNd5BZ8xbDA2Om8vOwzqMwNLzY1qlVTESHmfh/esRDHtLogLqqfvMEeF0Klx/GuseOine71K/a2LNXIsVLy01LhHPaU8VuT6qlPueD0i6a6ncwZo7A4yHCdgIcMUXVvbcF98PI2ludnOIjFJ2R3f0wRuA3Q9fZItoKqFF87Hf1uP4UFjNUxeCGWGqDNz9yL6iXsrgBfjF5NSLAQnk8uRft6+xE11pIvic9lcRT/JuZihdV
x-ms-exchange-antispam-messagedata: IYNYNvETJCIVzaLUREK45bTFgR5UFDyOsicXCDWGpy2eJSe6k+fxrhpoWp22WCwCSfO062/2ei44T6pl4mvCruwvEZojizk44JAbxZiL2O7YVWEGQcIAxZ9D8xMOaXYBT/vQi9kyF3O7v1ctpqW03w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FBE1F0BC3C7C64780CABC4F7C0642BF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b94710c3-8226-4ecc-6493-08d7d66d3f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 18:48:19.2856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qujw3Hr9TmY6P10vHbT0OKvFMg3ApXdp5NRfKtE98Xi6FJwLhPXTt00novmNU/afNjCaR1lJ2EJ5RFbqZSG2DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3432
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBIaSwNCj4NCj4gRmVsaXBlIEJhbGJpIHdyb3RlOg0KPj4g
SGkgZ3V5cywNCj4+DQo+PiBpbiBvcmRlciB0byBtYWtlIG91ciBVbml2ZXJzYWwgU2VyaWFsIENv
bW11bml0eSBtb3JlIHdlbGNvbWluZywgd2UgaGF2ZQ0KPj4gZGVjaWRlZCB0byByZW1vdmUgdW5u
ZWNlc3NhcnkgYWNyb255bXMgZnJvbSB0aGUgY29kZS4gVGhpcyB3aWxsIGJlIHZlcnkNCj4+IHVz
ZWZ1bCBmb3IgbmV3Y29tZXJzIGFzIHRoZXkgd29uJ3QgaGF2ZSB0byBndWVzcyB3aGF0IFVTQiBv
ciBYSENJIG1lYW5zDQo+PiBhbmQsIGluc3RlYWQsIGhhdmUgaXQgKmFsd2F5cyogc3BlbGxlZCBv
dXQuDQo+IEhvdyBkaWQgdGhpcyBkZWNpc2lvbiBjb21lIGFib3V0PyBJZiB0aGUgZ29hbCBpcyB0
byBhdHRyYWN0IG5ld2NvbWVycywgSQ0KPiBkb3VidCBtb3JlIHBlb3BsZSByZWNvZ25pemUgInVu
aXZlcnNhbCBzZXJpYWwgYnVzIiB2cyAidXNiIi4NCj4NCg0KeW91IGd1eXMgZ290IG1lIGdvb2Qu
Li4NCg0KVGhpbmgNCg==
