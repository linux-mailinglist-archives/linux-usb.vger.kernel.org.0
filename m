Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD5D3C3B25
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jul 2021 10:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhGKISZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Jul 2021 04:18:25 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47862 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229758AbhGKISY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Jul 2021 04:18:24 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 96925401BB;
        Sun, 11 Jul 2021 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1625991338; bh=yB9IhqEUveyL19ByWu8XbQL14tKLhkLTyTrDmnlBnco=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Oq0NwiyEkU+UQFrrEOAKOyckfyPrqOomBKCDeOUxWY/PoE2ljzR0JP4N8Gzoay3CI
         fVKHGwLwiSkWmqEEh2lmhWpb5mJ4z54svDs2XRVEIpzR+RSTvh/zPr8tqmJcHXIyyW
         eatz3hQxPDKDnm8Z1Ag6F4qbZ4jMUQCY2QzG8OvUo7ofN7HdHnYyp3P6u3tQiQEi2R
         Av4DaWQ7ggmmBub760cu720isa9t0LqEWZfNaXUPD17lHLSKrC92RcoglSZFdJ4GsE
         +fUuLTta1irJrk6RuTyOLph7M4C/Custz41K/Trqf4kzqoM5yPS8E3GWfeqsHsG5dk
         zVowBU+dVLNGg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2776CA0071;
        Sun, 11 Jul 2021 08:15:35 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C6D7F400A4;
        Sun, 11 Jul 2021 08:15:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iifwfz1c";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVK91po+bYWSfMf+GvdW4lTMbB/GQqUGn6UurD4Rc2y4hqZ7G6ilVvXQ0rIVaDdUYlsFmYB5OoInfpLtPuk+QT9y0kZ8lLyG2c5VFXE1Qp+AeijKR3TqNGEzj9nDKFKxqVW6nel2pf9wTSfFGyQtRJS+uOQLpbivLz3JfGwx4DGHqiR4PYJHjNrUg1cqD5oM4PJiNXPZsFKGsP4UWGWqSq1wOBdk0zkwr4m0KXJgf7VL+MdRAW4ElfSmQXTTxmozIXROGpyyZ0X6Ouh+ELcm688fq8K+Jl8RYN8BOSpoa/cAVDRFGMrY9qj+BB48r/oyn7RZNVROxgJzln1UcFShog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yB9IhqEUveyL19ByWu8XbQL14tKLhkLTyTrDmnlBnco=;
 b=E0l++gmwdFY2AlYfFGMEQvjCfTTXOk9BG3KIhDMsmalh0ojmc3TzIHrmr5aDnnjPdNKP5XWZ3pNZ3Shup0MZCiNWrucwLJoirUNpTT6hrM3mlZ0F00NaD5d8xEMjiYKlaE53Wd3RRRB85K70g2UJl9BgjyiNNCVek7Pyo2d/n7HmCrasXgwHVnVUcCD1l4T02t4GqkkUQQMHLSW62Y6Jn2xLJiz1aHP3LuA+1t+Y4Lp97Om4O0bq5Ef81AMHmpAizFldiVK7cTcKQ4HpkZFdiGnT4JQfL5JSkU4mxHDpWe/Jc/pK7J4Q5bhCtpvhhdNs7rtt5HvcW72699SWMNQ6rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yB9IhqEUveyL19ByWu8XbQL14tKLhkLTyTrDmnlBnco=;
 b=iifwfz1cunWEandSlVQSwe7XqQJfG0Y8R05JBQ8Owhj2yFBr1EbDVG846SlSuJG1YlBdYYQNOE0m9hHPkJRIYQYFgksFZPqxUOoJXCR3m9bt6NOelzJiZpyaDfIS92RkyXaod0XkfX/nG4kQa1FkghFBQWGLBqL3hPm38G72RJY=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5232.namprd12.prod.outlook.com (2603:10b6:5:39c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Sun, 11 Jul
 2021 08:15:31 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4308.026; Sun, 11 Jul 2021
 08:15:31 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Thread-Topic: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Thread-Index: AQHXdizqoaSvbv4TcUGwLN6CtBbUjQ==
Date:   Sun, 11 Jul 2021 08:15:31 +0000
Message-ID: <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
 <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu>
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
 <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
In-Reply-To: <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: googlemail.com; dkim=none (message not signed)
 header.d=none;googlemail.com; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 860758df-9c42-424f-195b-08d944440ccc
x-ms-traffictypediagnostic: DM4PR12MB5232:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB52326F6B5BBE0FDC691C1390A7169@DM4PR12MB5232.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Egv6ye+C157VGC/037+6Gt8UXIIIqJVtpzY+O0b/XGPwOErhgtMmi4a0R8YnXTOlh8QB8X6NRvr8tuPwz11M4Ke4RKQ/zBWu0hk1pay6ZY2z8YkorY5QjAXU66TcEJRX2tc2LP7+umUHlHBZLK8xJLiP9O2nzYKp1HyloZ4Nl94AV7vbDMHwnbHl21vCakHqJ8/w32+Kc7Q6Q6nKtFD3MN1dSYwco20hSBKVZRf8ygVIxOW2EdVmPxxn//4muzkMxfXAQeqwgfdMM7CT9rHCikCMwL90uf11Uru+2fQMdtYa5C6zaVwU/+xJsrxEbVoS+ae9QHHjf0I20on8P1yUR4cfGxxCIsLtKB4ArQ/ITI42C3vr9Ds4QaWQnnd7vBC0fzJaKdgGsSPlm6lu4JAf5CmsgLOtI9kPutPJhvGxMklDmbo7nWRZj9kNWlLt0vITbuk07OB+FZ4aoXyvXghzkCuF/deLHqDml601k1QoirRCVmzb6tFwLB2Sto8oUF102CaSyy/c8S4AV2gFTUbE1ghRXjQoZReyjKTf8uKfY6QyOs+1xpY0M88MdTLmjlLjcJ5oDiOBPpyY1yhUmFdYG06lgb27ZXjO9Uc21ci22qeGDKczFy9mVp//3jvetk3ooisEV6OM/UesnJvjj4SH1bfnOSphu4XGgM3uUWNXjzfBHRg8y72sSWFbQvO65HK5ShddtUxjbZ30BPDWQ6P4Bgc86iPhWK+85C8KsxKmuFA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(366004)(396003)(39850400004)(66946007)(6506007)(107886003)(91956017)(6486002)(31686004)(31696002)(36756003)(5660300002)(86362001)(66446008)(6916009)(76116006)(38100700002)(66556008)(64756008)(122000001)(66476007)(45080400002)(2616005)(8936002)(6512007)(83380400001)(478600001)(4326008)(8676002)(316002)(26005)(71200400001)(54906003)(186003)(53546011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SENGcWFWdUZxSUZOMlpQOGZSaEhtNFBvSU9ScTRoQngyUms2VG4xbVV5WlRU?=
 =?utf-8?B?blh0WnpGY0dua1g5UHovOVdyellNbmNIS1FSdndnUnlWUFFidGo5Ty9GM3F6?=
 =?utf-8?B?WHBhUEhTVDdSdFViQSthWlpCWFNjUGRTa2I3TGViVzU5VzNTeTlWd1Q1Q2tR?=
 =?utf-8?B?RzN3QzA5YzVCMXlvN2o5cWVTRm1jM1pDcGxuUVlpU3pmYUZsZ2lBeUZEL1RJ?=
 =?utf-8?B?QzRVK3lWWkpHK3RlUXpERmZlcjhBUFJIRkxJRTUyRTQ3TjNXekI5UmMzWG9I?=
 =?utf-8?B?anJYY3JtV01SSDJIbGRlU3VLQlVhRGJ3K0pOenBIMTVlY3dxaGFYTHJsdzBJ?=
 =?utf-8?B?RTdLSkxsT21GSU4rb2RmNEx4R3dPc3R0QS94Y3BzTFpBb0xwTGx5MldHQVJZ?=
 =?utf-8?B?R2w4SlBVbWpjamlEWTQzQnhYSFR0bnZMTFlGWFF0YUVuNnBlZVlIeEFJSU1o?=
 =?utf-8?B?QmRXL1pnUkRPY1IyN3QrY3pxYWowZ0JDdlVwVGpZeWUxVHFZTXBxZTFpQWZO?=
 =?utf-8?B?am5UNG9FZkFNY0Rhanlwdy84SUtjcFFrVmErR0VaVzFkUElzL0sxUUNZeHlp?=
 =?utf-8?B?UVk1Vmp4bHcvdWNoUVVnMlRqQUgyZy9WSWVheE9HU3RUSW5UdW1id2R5OXJn?=
 =?utf-8?B?MElTa21HRm9kU2gvVVN0ajBpeDlvU2NLa0loaC91R2hkTUNXZDh3UXQ2N05J?=
 =?utf-8?B?Mk04Z2VxSzF4RlBSUUdGZTlyYkNCSXo2NUorREJpc1k0QzhaNWhrcEswVjY5?=
 =?utf-8?B?ZWc0VHBPUjJxSnk1MDlVekF1SGtTVFlYQWxvVWdCQVgvVGRvcWppRzNIK0d3?=
 =?utf-8?B?R0lVUE1TekpDR3lqNEMrc2psSE9QQVNtbENTSjBrUHkwcjE0MFBUMkx1bnJO?=
 =?utf-8?B?YmEzKzhmQnh0U1JISGhFRzJZZFBOa0pYT0wzUlZqaTdNUDZLTFgrVHppWnhq?=
 =?utf-8?B?NDIxS2s2S1lyWDZYd3dlMjE5V24xeWR0N1JUa1Fpc0xDV1M5UFVETWZvQUhO?=
 =?utf-8?B?TzZHam5yelRPNlVCRklGSmNQc3N2N0F1RzljVGtKY2E5TW43WDluT1FvUkJQ?=
 =?utf-8?B?YnR1K0NWbXNBZ245RjBoSjh0dmQwY0VVTkMyWUYzcDZ3Q09Sa2cvNWRsOWVS?=
 =?utf-8?B?d1dqN0J0ZkRQelc2MUFHVmRBOHZlUGQ4Rmk1V3BHN3pXdEt3UndLVDdHdDZM?=
 =?utf-8?B?NVA2L3ByZGdzN1Y5U2NmOXlOeXpuR0NJV1BJTnhQdmRoQm1mRm5KdHJsdFgx?=
 =?utf-8?B?TzdGcno2NHAxNkYrbi9UQ2p3cjhYNXpPME1LS0N4bGkyaGJUU1I5cm5DRmtP?=
 =?utf-8?B?c2daOVI5OHd3aVZOMFJZT09IdGtQWFNBSmVWUXZXaHduczBxTnFZMDdPREZt?=
 =?utf-8?B?aVRWN1VxVndUeS9jbFBkbE1xMjFUaXFKRFBtWXFNODRrT3ZlS2wvTDhCRFlV?=
 =?utf-8?B?dnVQQS80ZkxqR25RaWpFL2hWa2dKMzVRVnNBdjB0TDFubkU2QXM4NjlhNSt5?=
 =?utf-8?B?VFlXZ0RzMW1mRVlHcWhlVU9sVDJQb3RhZnA2RmN1RVFzWjhueXZ4Z3ErSEQy?=
 =?utf-8?B?ZlMvTU9DVzRYK0x2MVFmdlpON001UXppb3lnd1JGbkhuNU5vY0dQdU1IamV2?=
 =?utf-8?B?L21ERUwxYUw1R3k2eGF0NDZNbWNXaTRiNTRSR0FPSWRmcWxhWlhWcEZ6bllC?=
 =?utf-8?B?MDRtSE5WSHBJclBWNmRKMG95U3RWNC80Mk9qN3hkNHF5ZHZJZHFYTVJVZDV5?=
 =?utf-8?Q?OHCq29ksajRKPKec9g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE21AFE76492874D8BAE3EA05E6621BF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860758df-9c42-424f-195b-08d944440ccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2021 08:15:31.1319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/oFtoXigARK0oyXZrHOviYuzigwf4l4E8T51CEU0NrT2oZXTz4lVd5dXEgVMNfLDus9TiIoNIP9JgZBjtAr3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5232
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWFydGluLA0KDQpPbiA3LzEwLzIwMjEgOTowNyBQTSwgTWFydGluIEJsdW1lbnN0aW5nbCB3
cm90ZToNCj4gSGkgTWluYXMsDQo+IA0KPiBPbiBUaHUsIEp1bCAxLCAyMDIxIGF0IDE6MDkgQU0g
TWFydGluIEJsdW1lbnN0aW5nbA0KPiA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4gd3JvdGU6DQo+Pg0KPj4gSGkgTWluYXMsDQo+Pg0KPiBJdCdzIGJlZW4gYSB3ZWVrIHNpbmNl
IEkgc2VudCBteSBsYXN0IG1haWwNCj4gSW4gY2FzZSB5b3UgYXJlIHRha2luZyBzb21lIGRheXMg
b2ZmOiBlbmpveSB0aGF0IHRpbWUhDQo+IFBsZWFzZSBsZXQgdXMga25vdyBpZiB5b3UgaGF2ZSBh
bnkgcXVlc3Rpb25zIGFib3V0IHRoaXMgYXMgd2UncmUNCj4gbG9va2luZyBmb3J3YXJkIHRvIHNv
bWUgaGludHMgb24gaG93IHRvIGRlYnVnIChhbmQgb2YgY291cnNlIGZpeCEpDQo+IHRoaXMuDQo+
IA0KRmlyc3Qgb2YgYWxsIHNvcnJ5IGZvciBsYXRlIGZlZWRiYWNrLiBJIG1pc3NlZCB0aGlzIGVt
YWlsIHRocmVhZCBiZWNhdXNlIA0KaW4gdGhlIHN1YmplY3QgdGhlcmUgYXJlIG5vICJkd2MyIiBh
bmQgbXkgT3V0bG9vayBub3QgbW92ZSBpdCB0byAiZHdjMiIgDQpmb2xkZXIgb2YgbXkgbWFpbGJv
eCBiYXNlZCBvbiBydWxlcy4gVG9kYXksIGJlY2F1c2Ugb2YgcmVhciBjb3VudCBvZiANCmVtYWls
cyBpbiBsaW51eC11c2IgSSB3YXMgYWJsZSB0byBjYXRjaCBpdC4NCkkgaGF2ZSBhZGRlZCAiZHdj
MiIgd29yZCBpbiBzdWJqZWN0IHRvIGF2b2lkIHRoaXMgc2l0dWF0aW9uIGxhdGVyLg0KDQpDb3Vw
bGUgb2YgcXVlc3Rpb25zIHRvIHVuZGVyc3RhbmQgdGhlIGNhc2UuDQoNCjEuIElzIGl0IHdvcmsg
bm9ybWFsbHkgZWFybGllcj8gSWYgaXQgd2FzIHdvcmtzIGZpbmUgZWFybGllciB0aGVuIHdoaWNo
IA0KS2VybmVsIHZlcnNpb24gYW5kIGFmdGVyIHdoaWNoIHZlcnNpb24gYnJva2U/DQoNCjIuIERv
IHlvdSBzYXcgaW4gZG1lc2c6DQpkd2MyX2NvcmVfcmVzZXQ6IEhBTkchIFNvZnQgUmVzZXQgdGlt
ZW91dCBHUlNUQ1RMX0NTRlRSU1QNCklmIHllcywgdGhlbiBQSFkgbm90IGluaXRpYWxpemVkIGNv
cnJlY3RseS4gQ29yZSBjYW4ndCByZXNldCBpZiBzb21lIA0KY2xvY2tzIGZyb20gUEhZIGFyZSBu
b3QgYXZhaWxhYmxlLg0KDQozLiBEdXJpbmcgb3VyIHJlY2VudCB0ZXN0aW5ncyB3ZSBtZXQgdGhl
IGlzc3VlIHdpdGggUEhZIGRyaXZlci4gQXJ0dXIgDQpmb3VuZCBhIGJ1ZyBpbiBwaHlfZ2VuZXJp
YyBkcml2ZXIgYW5kIHN1Ym1pdHRlZCBwYXRjaCBvbiBKdWx5IDEwOg0KW1BBVENIIHYyXSB1c2I6
IHBoeTogRml4IHBhZ2UgZmF1bHQgZnJvbSB1c2JfcGh5X3VldmVudA0KSW4geW91ciBjYXNlLCBh
cyBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCB1c2VkIA0KZHJpdmVycy9waHkvYW1sb2dpYy9waHkt
bWVzb244Yi11c2IyLmMuIENvdWxkIHlvdSBwbGVhc2UgY2hlY2sgaWYgc2FtZSANCmlzc3VlIGV4
aXN0IHRoZXJlLg0KDQo0LiBDYW4geW91IHByb3ZpZGUgZnVsbCBkZWJ1ZyBsb2cgZm9yIGZhaWxl
ZCBjYXNlPw0KDQo1LiBJIHdvdWxkIHByZWZlcnJlZCB0byBzZWUgb3V0cHV0IG9mICdsc3VzYiAt
dCcgZm9yIHBhc3MgYW5kIGZhaWwgY2FzZXMuDQoNCg0KVGhhbmtzLA0KTWluYXMNCg0KDQoNCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gTWFydGluDQo+IA0KDQo=
