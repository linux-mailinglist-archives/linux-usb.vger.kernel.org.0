Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190303AAD7F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 09:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhFQH1K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 03:27:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50850 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229714AbhFQH1I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 03:27:08 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B204DC00E8;
        Thu, 17 Jun 2021 07:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1623914701; bh=N7Cn7XUk2UC2fNxdt+9y5FSDqe+NEZTM1a/xS3SXJkU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=b6ehyQ85aRZrAdQN5DiLopw41/PYZeySWkDQ9PDl2bpm469hGp4QRvdCLEmFPKVAq
         4idijNk3sLe1JjS+j9xd7SNe6dDgYToC+KlF6MWkkkldkA8Zaus3J7owI2nDLrhf9h
         +LazTbGuz0O5Z+u0KZnacIFgriUbWomYfcya+yku8XJX+oIzZCbE/VRG/5XlYRk1ul
         wCdBpoJJ+mWWH3GE/VMWcTbtJgTNJJESo5VnzHBytPy7TmjfwJD966US30pLNAlp/z
         LhvuTWVr0BKvjF5EYoqh5GrZcFyWBitMuJHFhNvIu2I+Pyt8H4q82Qw+1cDoTLMNgi
         8RJh9JBeW3uJA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 60E22A005C;
        Thu, 17 Jun 2021 07:25:01 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E0123800C4;
        Thu, 17 Jun 2021 07:25:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="IExwD8PE";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dG3JvsVqcOLWgmuKKI78gAh//xWbUt/PsHUbGWhG4wmX6uuXjkPbwUGYcq4VYC6uXuRpaaVjAdeTHZyKm+2F2xWlcE67NfCtE7p4YyOBen+4/CtZ2lqfR++Pi39h0ADeGk6ib4tpaWQ+l0nFmbTYhWdFIpbyOJ+v+G2TEP+iBhdKMf/loKud37Wav8urP3PAI7ONWlA+fUsjFRa31ppT6eiC9gnw56AEkc2wfu5jmcxgBNJq+jBqP1NVWzhN6wi9LPiRqxzlh/f4hTiCyVoGNLHoe6mxmM7qMg0fgmcX4cOBFlvlslOa77ZwkMuPODTrcvTxZsVwiiAqF5dWBrUyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7Cn7XUk2UC2fNxdt+9y5FSDqe+NEZTM1a/xS3SXJkU=;
 b=QIkBCCdaHiU+/gBD7TUQjE5JdQ67PYOw1mAzQw9QJUJVk6Dn216hs7meKbb5mOI7/txG/thF6WgFQFM0CWBxy29IvxNCKtCgAQd2j3s9uPRCsVVy/XvjYIagpBnvDnpBvciUtb1pWLw6FoNaRacG2Sy01l6q2kUWT7SOkXfVP8mEAeJY28CtrmnG0nRD6yTNaa84oY50QccCZIZgTUnhb3o43+fZ1HeN+Mv2aj6x3f3R/msX9AcCBdTuuNhajhmKIFaRIffH6NumzfI9aPBUje3vq9kGhWezDld/Wg6hQuDDmMgdmjKRjZ6ICR7xNf5OmnTg6SDJQMVQZptjgs5FWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7Cn7XUk2UC2fNxdt+9y5FSDqe+NEZTM1a/xS3SXJkU=;
 b=IExwD8PEm+dK3yT5nw9+oW25MiWWwhxkqtM+r5D9LY3InAeqS1f88EbP7owcAVITEJfxPPOowIhbEGF33b5UHM+UCeu0D0MAqPZZvitBZrUbHxbl7vYYBdBFh1b/cQk62cXKqGO32xI3/8c9tgBM5CMMib1VsUfL/7R3TYWfMsc=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5119.namprd12.prod.outlook.com (2603:10b6:5:392::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 07:24:59 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::b119:cac8:fb05:e0e4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::b119:cac8:fb05:e0e4%8]) with mapi id 15.20.4219.025; Thu, 17 Jun 2021
 07:24:58 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Chen <peter.chen@kernel.org>
Subject: Re: [PATCH] usb: dwc3: Fix debugfs creation flow
Thread-Topic: [PATCH] usb: dwc3: Fix debugfs creation flow
Thread-Index: AQHXYz17L6V8B4/QQE2zZ/GAn5jucqsXvlaAgAAO7oA=
Date:   Thu, 17 Jun 2021 07:24:58 +0000
Message-ID: <e4e27142-0305-3fcd-65a1-60e3ecde89e7@synopsys.com>
References: <7f5167c67cd95102b2acab967d19af7962415a66.1623906350.git.Minas.Harutyunyan@synopsys.com>
 <20210617063130.GA11567@jackp-linux.qualcomm.com>
In-Reply-To: <20210617063130.GA11567@jackp-linux.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [37.252.93.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c8bb03a-97b1-4732-db6e-08d93161037d
x-ms-traffictypediagnostic: DM4PR12MB5119:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5119FDD62E2B5CBA1C0483E1A70E9@DM4PR12MB5119.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mCH3bdCUTc86jFzFTrhWnaDCjzT8ceEgoP/8oIW0QXQxaCL/WdfTLgxFKV+/kkpMvnLb92gMI/w5ayt0y1sMdvpAdLGS8EuMXCD2yZ1LySIHvr1aS/Cx1PPwVxXeYEBuX3umuaYNYJqnaPj80qJGQC/YxuWugXXMaBVl0G7NOC8Yhenxiy7YbT11prVrsYtC18PKjO5I4L+xe4e6FSK4sNUWgRO+jYvNw3IlGHUFxGXGvRBIhZ0pboZTtmtcEDlZYwtubkhzv2EnbCJQQEid/KBh6c6eYg8ohUnrf7VxYA9YA6bGOTCLUlVD/RansYFYxN+3ztGqv9aRG3FwtgOMPBnWl0rrTUrhc3GJMen78ZxY3706UvxeHkntlvlfSsBfzkUxUhVLZbrehR2lxVyVQCcMgbX4F/ewMZOurgh2bVK6lxCq8K+C8A9i9xGHZa0WW2/PMKVGK3yvygP62sJ2W/m4n9G/leflxubKFoH9sewZXReVSX6JzvmmzkMnLtWRW/pfLjRW24DTqZgci5fJ+A8n6mX68ZIAIkZEkHu7JEEOqiZEuGM8VeZmUDBzedUx65uaGWul8lKa238vjpKNqS/is2FTjArjX63bi/Q+wX8NP3HvqG6rSc8JzBuete+LIS7RvBSmKl/O7WM+2qoYOcWlEifcqOBpK9Z1pSLnTHierSTC0fIpdAJRxv2mwZIc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(39860400002)(366004)(396003)(83380400001)(6486002)(36756003)(316002)(122000001)(31696002)(4326008)(38100700002)(71200400001)(110136005)(2616005)(6506007)(53546011)(86362001)(186003)(8676002)(6512007)(91956017)(66446008)(66946007)(76116006)(31686004)(64756008)(66556008)(66476007)(8936002)(5660300002)(478600001)(2906002)(54906003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1oxT3hBRXdKRllnTVZvc2RFUTVrTDNLTkpPL1VodENUVi9SNSsrVW9VV2xR?=
 =?utf-8?B?eTJKNmluUFJ1dEJReFhpR3YrVlVHTEVYSVhoMTQ3M3RoYkpkTmhLNGlCUlRy?=
 =?utf-8?B?a1RkekZZNCs1SWp5U3pvaUNxc0MrTndRblpTMTFSclNGb0h2SXZaZDl3Zi9P?=
 =?utf-8?B?RG5JK2M5b2RtZ3QzcHp1VXoxOUhrdTJHTzROaUw2R3BaZ1JjMmJPMmJjUUdl?=
 =?utf-8?B?dVQyVmNzTSt4Q3ZaaG45SDRVNnFkaDZaNUVrR1Faa1NMampYWGpJQThNQWpX?=
 =?utf-8?B?NlB0QmozQUZaWkllMG5JakRURERTR0FyYTV5bXQzUitDM1Nrb2xiNU5XajdD?=
 =?utf-8?B?Nyt3T0pjdXY3NVlIRDQ4LzBXdVVRbzJybnNOK01iTVB1elE0Y0ZzTDJxWkxo?=
 =?utf-8?B?UVkrZlFhQUgxZG5YRDhySVpLUy9jcVo3cDB2OHA4UllOMDU4cEFpa3JrekN5?=
 =?utf-8?B?ZFRaV1RiWk1SWUNyczlNa3pkaHplUlVTV3k0QmtrM3VXa1VJcVZmSDBmUjdJ?=
 =?utf-8?B?SXVOcXZQQVR4OWlTajZVcWlFUXlORGxMNWw0ZlZwSFNYQk9pUHlyQXBFSHBW?=
 =?utf-8?B?UHRhSFZXVGcwbmVjQWt3TkhmN2VtcnFFRGx2ZEJlcmd0K3A1cEk1eWhKNk9U?=
 =?utf-8?B?NzZaU3EwRVdRTkFVcGZJV3FQa2VWMTQwY1RiWDIxVDNHR2tIdmNYVWxERno0?=
 =?utf-8?B?WkhpbzUyUTFtdjZXQ0thd1lab1RFUDhoY0hURHNiVWVzeTM1UjVBRFhBSy95?=
 =?utf-8?B?L2hJVmJYeVJkTDBQZWpBU0Z5OVVDVmVzTnRhSEpkQkRpbE1xcFNFcGZLY1JL?=
 =?utf-8?B?K1NabFdBbUZyN3NzTkJ2NzJ3VEVqcVdDSXpJM1l6YlNNRXhoZk9kUnNQK0hs?=
 =?utf-8?B?NVhoMnFDWHVSSWZWRFJxYjFTaU5hTVV5NHZkOUtkZzJLYzdYa1A2Wms5V3ZT?=
 =?utf-8?B?OENqb2RWd3ZlZmIvMnRtZTBjT3hCRkgwSm1kWVRTRzFveFc5QXQ3dkIwNmM5?=
 =?utf-8?B?TDJsb0krVzJkRTN2K1BKaHpra3paSDFXN2RpNzNDVlUzR3o4R0dnNW5BOGFN?=
 =?utf-8?B?cFZYNkFMck5aMjhtay9YNWY1KzJuVUxmTzZpcDZqWHRDMGR4bHdpTW54Wm9E?=
 =?utf-8?B?SnlZWEpwK0Y2bnMwVzVFMG1UZlVlbUdxRDBqN28raVRDU2hzRkIydFFhaTNM?=
 =?utf-8?B?ZnBremdpaUY1K3FDdE9Bb1l0U2xyUm9qUXBlMGVubGNmdnNCV3crLzF0VDdi?=
 =?utf-8?B?cENDZ3NmQlRCT25sQUJ3U3ZGaDNLQktmaVRSZVdWUy9GcVVRR0ZubENRWjBT?=
 =?utf-8?B?TlhVRnNEemsvNmhGUnFaNzI3MHhTVU1mUzhFVDdQOGx1OXBZVlY1OUw5MjVv?=
 =?utf-8?B?YUNBbGYwdTlaZW93NGRHTzgyb2Mzd2NIM0llVkY3NGlQOG9SUHN4TktmMUZQ?=
 =?utf-8?B?T0lZT296ZWRSVVRiNFpjR29OSG1PRGpuS3NkTzFneTdSQkRQc3cyUmR2b2lu?=
 =?utf-8?B?bGlpQkpFOU9STi9MbHp4eStjTmpIRER3RTE1a3BaUzJkM0w4NU96anF6dFFM?=
 =?utf-8?B?RmpreTJhcHRwTFRoWUZ2aENkTm8xZ3BiMkIyNVJSaUQ5VDdVOGZFaU0rL0tT?=
 =?utf-8?B?Q1YwMmwxbVU4L0tRazhMNHk3MStVYk91OHUyN2FlS015MHhTclY4Rmh4STBI?=
 =?utf-8?B?Z25aVmVPL3N1NUFydER4UkJUODFnSHExWTVxZXk4RE45andNbkdabTRkTnFp?=
 =?utf-8?Q?4uHoRA46V3M4i9uPOw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56499454D1707D48A0726DDF44818AF2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8bb03a-97b1-4732-db6e-08d93161037d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 07:24:58.8559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d+U7YeXZvDg9v5A6PgSWwEEu3YEpYHuHjAFyfF/ycbBKuW4cQz53EfUbKUb+9mnmpkT9eeDBFcyvLyDcQvWt+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5119
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSmFjaywNCg0KT24gNi8xNy8yMDIxIDEwOjMxIEFNLCBKYWNrIFBoYW0gd3JvdGU6DQo+IEhp
IE1pbmFzLA0KPiANCj4gT24gV2VkLCBKdW4gMTYsIDIwMjEgYXQgMTA6NTY6MDJQTSAtMDcwMCwg
TWluYXMgSGFydXR5dW55YW4gd3JvdGU6DQo+PiBDcmVhdGlvbiBFUCdzIGRlYnVnZnMgY2FsbGVk
IGVhcmxpZXIgdGhhbiBkZWJ1Z2ZzIGZvbGRlciBmb3IgZHdjMw0KPj4gZGV2aWNlIGNyZWF0ZWQu
IEFzIHJlc3VsdCBFUCdzIGRlYnVnZnMgYXJlIGNyZWF0ZWQgaW4gJy9zeXMva2VybmVsL2RlYnVn
Jw0KPj4gaW5zdGVhZCBvZiAnL3N5cy9rZXJuZWwvZGVidWcvdXNiL2R3YzMuMS5hdXRvJy4NCj4g
DQo+IEludGVyZXN0aW5nLCBJIGRpZG4ndCBlbmNvdW50ZXIgdGhpcyBpbiBteSB0ZXN0aW5nLiBP
aCBidXQgaW4gb3VyIGNhc2UNCj4gd2UgaGF2ZSBkcl9tb2RlIGFzIFVTQl9EUl9NT0RFX09URywg
c28gd2hlbiBkd2MzX2NvcmVfaW5pdF9tb2RlKCkgY2FsbHMNCj4gZHdjM19kcmRfaW5pdCgpIHRo
ZSBnYWRnZXRfaW5pdCgpIGlzIGRvbmUgZnJvbSBhIHdvcmtlciwgYW5kIG1lYW53aGlsZQ0KPiBk
d2MzX2RlYnVnZnNfaW5pdCgpIHdvdWxkIGhhdmUgYWxyZWFkeSBoYWQgYSBjaGFuY2UgdG8gY3Jl
YXRlIHRoZSByb290DQo+IGZvbGRlciBiZWZvcmUgdGhhdC4NCj4gDQo+IEknbSBhc3N1bWluZyB5
b3UncmUgc2VlaW5nIHRoaXMgd2l0aCBkcl9tb2RlID09IFVTQl9EUl9NT0RFX1BFUklQSEVSQUw/
DQo+IFRoZW4gaW4gdGhhdCBjYXNlIGR3YzNfY29yZV9pbml0X21vZGUoKSBzeW5jaHJvbm91c2x5
IGNhbGxzDQo+IGR3YzNfZ2FkZ2V0X2luaXQoKSBiZWZvcmUgdGhlIGRlYnVnZnNfaW5pdC4NCg0K
SW4gbXkgY2FzZSBkcl9tb2RlIGZvcmNlZCB0byBnYWRnZXQuDQoNCj4gDQo+PiBNb3ZlZCBkd2Mz
X2RlYnVnZnNfaW5pdCgpIGZ1bmN0aW9uIGNhbGwgYmVmb3JlIGNhbGxpbmcNCj4+IGR3YzNfY29y
ZV9pbml0X21vZGUoKSB0byBhbGxvdyBjcmVhdGUgZHdjMyBkZWJ1Z2ZzIHBhcmVudCBiZWZvcmUN
Cj4+IGNyZWF0aW5nIEVQJ3MgZGVidWdmcydzLg0KPj4NCj4+IEZpeGVzOiA4NTYyZDViZmMwZmMg
KCJVU0I6IGR3YzM6IHJlbW92ZSBkZWJ1Z2ZzIHJvb3QgZGVudHJ5IHN0b3JhZ2UiKQ0KPiANCj4g
SXNuJ3QgaXQgZml4aW5nIDhkMzk2YmIwYTViNiAoInVzYjogZHdjMzogZGVidWdmczogQWRkIGFu
ZCByZW1vdmUNCj4gZW5kcG9pbnQgZGlycyBkeW5hbWljYWxseSIpPyAgTW9yZSBmYWxsb3V0IGZy
b20gbXkgY2hhbmdlIEkgZ3Vlc3MgOi0vLg0KPiANCg0KSXNzdWUgaGFwcGVuIGJlY2F1c2Ugb2Yg
aW5zdGVhZCBvZiAnZHdjLT5yb290JyB1c2VzIGRlYnVnZnNfbG9va3VwKCkgDQpmdW5jdGlvbiBv
biBkZWJ1Z2ZzJ3MgY3JlYXRpb24uIFRoaXMgaXMgd2h5IEkgdGhpbmsgbXkgIkZpeGVzOiIgdGFn
IGlzIA0KY29ycmVjdC4NCg0KVGhhbmtzLA0KTWluYXMNCg0KDQo+IEFueXdheSBpdCBsb29rcyBn
b29kIHRvIG1lLCB0aGFua3MhDQo+IA0KPiBSZXZpZXdlZC1ieTogSmFjayBQaGFtIDxqYWNrcEBj
b2RlYXVyb3JhLm9yZz4NCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBNaW5hcyBIYXJ1dHl1bnlhbiA8
aG1pbmFzQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUu
YyB8IDMgKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPj4gaW5kZXggZTBhOGU3OTZjMTU4Li5iYTc0YWQ3ZjY5OTUg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMNCj4+IEBAIC0xNjIwLDE3ICsxNjIwLDE4IEBAIHN0YXRpYyBpbnQg
ZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICAJfQ0KPj4gICAN
Cj4+ICAgCWR3YzNfY2hlY2tfcGFyYW1zKGR3Yyk7DQo+PiArCWR3YzNfZGVidWdmc19pbml0KGR3
Yyk7DQo+PiAgIA0KPj4gICAJcmV0ID0gZHdjM19jb3JlX2luaXRfbW9kZShkd2MpOw0KPj4gICAJ
aWYgKHJldCkNCj4+ICAgCQlnb3RvIGVycjU7DQo+PiAgIA0KPj4gLQlkd2MzX2RlYnVnZnNfaW5p
dChkd2MpOw0KPj4gICAJcG1fcnVudGltZV9wdXQoZGV2KTsNCj4+ICAgDQo+PiAgIAlyZXR1cm4g
MDsNCj4+ICAgDQo+PiAgIGVycjU6DQo+PiArCWR3YzNfZGVidWdmc19leGl0KGR3Yyk7DQo+PiAg
IAlkd2MzX2V2ZW50X2J1ZmZlcnNfY2xlYW51cChkd2MpOw0KPj4gICANCj4+ICAgCXVzYl9waHlf
c2h1dGRvd24oZHdjLT51c2IyX3BoeSk7DQo+Pg0KPj4gYmFzZS1jb21taXQ6IDFkYTgxMTZlYjBj
NWRmYzA1Y2ZiODk4OTYyMzliYWRiMThjNGRhZjMNCj4+IC0tIA0KPj4gMi4xMS4wDQo+Pg0KDQo=
